from datetime import datetime

import pytz
from flask_login import UserMixin
from sqlalchemy import text, func, ForeignKey, Integer, Column
from sqlalchemy.orm import relationship

from app import db


class Bet(db.Model):
    __tablename__ = 'bets'

    bet_id = db.Column(db.String(50), primary_key=True)
    sport = db.Column(db.String(50))
    status = db.Column(db.String(50))
    result = db.Column(db.String(50))
    capper = db.Column(db.String(50))
    stake_amount = db.Column(db.Float)  # DOUBLE PRECISION in PostgreSQL
    potential_win_amount = db.Column(db.Float)  # DOUBLE PRECISION in PostgreSQL
    line = db.Column(db.Integer)
    multi_bet = db.Column(db.Boolean)
    match = db.Column(db.String(255))
    pick = db.Column(db.String(255))
    date_accepted = db.Column(db.DateTime)
    event_date = db.Column(db.DateTime)
    book = db.Column(db.String(50))
    account_id = Column(Integer, ForeignKey('accounts.id'), nullable=False)
    account = relationship('Account', backref='bets')

    @staticmethod
    def get_distinct_cappers_for_day(start_of_day_utc, end_of_day_utc):
        # Get distinct cappers and bets for the day
        cappers_query = text('''
                SELECT DISTINCT capper
                FROM bets
                WHERE event_date >= :start AND event_date < :end AND capper IS NOT NULL
            ''')
        cappers = db.session.execute(cappers_query, {'start': start_of_day_utc, 'end': end_of_day_utc}).mappings().fetchall()

        return cappers

    @staticmethod
    def get_bets_for_cappers_on_day(start_of_day_utc, end_of_day_utc):
        query = text('''
            SELECT * 
            FROM bets
            WHERE event_date >= :start AND event_date < :end 
            AND capper IN (SELECT DISTINCT capper FROM bets WHERE event_date >= :start AND event_date < :end)
        ''')
        bets = db.session.execute(query, {'start': start_of_day_utc, 'end': end_of_day_utc}).mappings().fetchall()
        return bets

    @staticmethod
    def get_next_bet365_id():
        query = text("""
            SELECT MAX(CAST(SUBSTRING(bet_id FROM LENGTH('bet365_') + 1) AS INTEGER)) AS max_id
            FROM bets
            WHERE bet_id LIKE 'bet365_%';
        """)
        result = db.session.execute(query).fetchone()

        max_id = result[0] if result[0] is not None else 0  # Handle case where no IDs exist
        next_id = max_id + 1

        return f"bet365_{next_id}"

    @staticmethod
    def get_next_bet99_id():
        query = text("""
            SELECT MAX(CAST(SUBSTRING(bet_id FROM LENGTH('bet99_') + 1) AS INTEGER)) AS max_id
            FROM bets
            WHERE bet_id LIKE 'bet99_%';
        """)
        result = db.session.execute(query).fetchone()

        max_id = result[0] if result[0] is not None else 0  # Handle case where no IDs exist
        next_id = max_id + 1

        return f"bet99_{next_id}"


class Account(UserMixin, db.Model):
    __tablename__ = 'accounts'

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(255), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)
    timezone = db.Column(db.String(50))
    confirmed = db.Column(db.Boolean, default=False)
    power_user = db.Column(db.Boolean, default=False)
    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(db.DateTime, server_default=db.func.now())

    def __init__(self, email: str, password_hash: str):
        self.email = email
        self.password_hash = password_hash

    @property
    def is_active(self):
        """Return True if the user has confirmed their account."""
        return self.confirmed

    def get_id(self):
        return f"{str(self.id)}"


class Capper:
    def __init__(self, capper_id: str):
        bets = Bet.query.filter(func.lower(Bet.capper) == capper_id.lower()).all()
        self.bets = sorted(bets, key=lambda bet: bet.event_date)
        self.settled_bets = self._get_settled_bets()
        self.winning_bets = self._get_winning_bets()
        self.losing_bets = self._get_losing_bets()
        self.refunded_bets = self._get_refunded_bets()
        self.pending_bets = self._get_pending_bets()

    def get_bet_counts(self):
        bet_count_error = False
        if len(self.settled_bets) != len(self.winning_bets) + len(self.losing_bets) + len(self.refunded_bets):
            bet_count_error = True
        if len(self.bets) != len(self.settled_bets) + len(self.pending_bets):
            bet_count_error = True
        return len(self.bets), len(self.settled_bets), len(self.winning_bets), len(self.losing_bets), len(self.refunded_bets), len(self.pending_bets), bet_count_error

    def _get_settled_bets(self):
        settled_bets = [bet for bet in self.bets if bet.status == 'Settled']
        return settled_bets

    def _get_winning_bets(self):
        winning_bets = [bet for bet in self.bets if bet.status == 'Settled' and bet.result == "Win"]
        return winning_bets

    def _get_losing_bets(self):
        # Filter settled bets without an additional SQL query
        losing_bets = [bet for bet in self.bets if bet.status == 'Settled' and bet.result == "Loss"]
        return losing_bets

    def _get_refunded_bets(self):
        refunded_bets = [bet for bet in self.bets if bet.status == 'Settled' and bet.result == "Refunded"]
        return refunded_bets

    def _get_pending_bets(self):
        pending_bets = [bet for bet in self.bets if bet.status == 'Pending']
        return pending_bets

    def get_bets(self):
        return self.bets

    def get_profits(self):
        profits = 0.00
        for bet in self.bets:
            if bet.status == 'Settled':
                if bet.result == 'Win':
                    profits += bet.potential_win_amount
                elif bet.result == 'Loss':
                    profits -= bet.stake_amount
        return profits

    def get_roi(self):
        profits = self.get_profits()
        total_stake = 0.00
        for bet in self.bets:
            if bet.status == 'Settled' and bet.result != 'Refunded':
                if bet.result == 'Win':
                    total_stake += bet.stake_amount
                elif bet.result == 'Loss':
                    total_stake += bet.stake_amount
        if total_stake == 0:
            return 0.00
        roi = (profits / total_stake) * 100

        return roi

    def get_bets_by_filter(self, filtering_start_date: datetime = None, filtering_end_date: datetime = None, filtering_status: str = None) -> list:
        filtered_bets = []
        local_tz = pytz.timezone('America/Montreal')
        utc = pytz.utc

        for bet in self.bets:
            if filtering_start_date:
                # Make sure both dates are in same format and same time zone
                datetime_event_date = datetime.strptime(bet.event_date, '%Y-%m-%d %H:%M:%S')
                datetime_event_date = datetime_event_date.replace(tzinfo=utc).astimezone(local_tz)
                if filtering_start_date > datetime_event_date:
                    # Bet isn't "valid"
                    continue
            if filtering_end_date:
                # Make sure both dates are in same format and same time zone
                datetime_event_date = datetime.strptime(bet.event_date, '%Y-%m-%d %H:%M:%S')
                datetime_event_date = datetime_event_date.replace(tzinfo=utc).astimezone(local_tz)
                if filtering_end_date < datetime_event_date:
                    # Bet isn't "valid"
                    continue

            if filtering_status:
                if bet.status != filtering_status:
                    # Bet isn't "valid"
                    continue

            # If we make it here in our loop, bet is "valid" and should be appended to our filtered bet list
            filtered_bets.append(bet)

        return filtered_bets