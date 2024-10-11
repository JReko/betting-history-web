from flask_login import current_user
from sqlalchemy import text, ForeignKey, Integer, Column, Index
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

    # Define indexes
    __table_args__ = (
        Index('idx_event_date_capper_account', 'event_date', 'capper', 'account_id'),
    )

    @staticmethod
    def get_distinct_cappers_for_day(start_of_day_utc, end_of_day_utc):
        # Get distinct cappers and bets for the day
        account_id = current_user.get_id()
        cappers_query = text('''
                SELECT DISTINCT capper
                FROM bets
                WHERE 
                    event_date >= :start 
                    AND event_date < :end 
                    AND capper IS NOT NULL
                    AND account_id = :account_id
            ''')
        cappers = db.session.execute(cappers_query, {
            'start': start_of_day_utc,
            'end': end_of_day_utc,
            'account_id': account_id
        }).mappings().fetchall()

        return cappers

    @staticmethod
    def get_bets_for_day(start_of_day_utc, end_of_day_utc):
        account_id = current_user.get_id()
        query = text('''
            SELECT * 
            FROM bets
            WHERE 
                event_date >= :start 
                AND event_date < :end 
                AND capper IS NOT NULL
                AND account_id = :account_id
        ''')
        bets = db.session.execute(query, {
            'start': start_of_day_utc,
            'end': end_of_day_utc,
            'account_id': account_id
        }).mappings().fetchall()
        return bets

    @staticmethod
    def get_overall_bets():
        account_id = current_user.get_id()
        query = text('''
                SELECT * 
                FROM bets
                WHERE 
                    status = 'Settled'
                    AND capper IS NOT NULL
                    AND account_id = :account_id
            ''')
        bets = db.session.execute(query, {
            'account_id': account_id
        }).mappings().fetchall()
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
