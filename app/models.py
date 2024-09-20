from sqlalchemy import text

from app import db


class Bet(db.Model):
    __tablename__ = 'bets'

    bet_id = db.Column(db.String, primary_key=True)
    book = db.Column(db.String, nullable=True)  # Add the new field
    sport = db.Column(db.String)
    status = db.Column(db.String)
    result = db.Column(db.String)
    capper = db.Column(db.String, nullable=True)  # Allow NULL for capper
    stake_amount = db.Column(db.Float)
    potential_win_amount = db.Column(db.Float)
    line = db.Column(db.Integer)
    multi_bet = db.Column(db.Boolean)
    match = db.Column(db.String)
    pick = db.Column(db.String)
    date_accepted = db.Column(db.String)
    event_date = db.Column(db.String)

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
            SELECT MAX(CAST(SUBSTRING(`bet_id`, LENGTH('bet365_') + 1) AS UNSIGNED)) AS max_id
            FROM `bets`
            WHERE `bet_id` LIKE 'bet365_%';
        """)
        result = db.session.execute(query).fetchone()

        max_id = result[0] if result[0] is not None else 0  # Handle case where no IDs exist
        next_id = max_id + 1

        return f"bet365_{next_id}"

    @staticmethod
    def get_next_bet99_id():
        query = text("""
                SELECT MAX(CAST(SUBSTRING(`bet_id`, LENGTH('bet99_') + 1) AS UNSIGNED)) AS max_id
                FROM `bets`
                WHERE `bet_id` LIKE 'bet99_%';
            """)
        result = db.session.execute(query).fetchone()

        max_id = result[0] if result[0] is not None else 0  # Handle case where no IDs exist
        next_id = max_id + 1

        return f"bet99_{next_id}"


class MultiBetWinCondition(db.Model):
    __tablename__ = 'multi_bet_win_conditions'

    id = db.Column(db.Integer, primary_key=True)
    bet_id = db.Column(db.String, db.ForeignKey('bets.bet_id'))
    match = db.Column(db.String)
    pick = db.Column(db.String)
    legs = db.Column(db.Integer)
    odds = db.Column(db.String)
    bet = db.relationship('Bet', backref=db.backref('conditions', lazy=True))
