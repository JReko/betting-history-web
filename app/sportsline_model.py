from datetime import datetime
from sqlalchemy import Index
from app import db


class Sportsline(db.Model):
    __tablename__ = 'sportsline'

    sportsline_id = db.Column(db.String(255), primary_key=True)
    capper = db.Column(db.String(255), nullable=False)
    date = db.Column(db.DateTime, nullable=False)
    league = db.Column(db.String(100), nullable=False)
    market = db.Column(db.String(100), nullable=False)
    event = db.Column(db.String(255), nullable=False)
    pick = db.Column(db.String(255), nullable=False)
    units = db.Column(db.Float, nullable=False)
    result = db.Column(db.String(50), nullable=False)
    line = db.Column(db.Integer)
    returns = db.Column(db.Float, nullable=True)

    __table_args__ = (Index('idx_capper', 'capper', 'league'),)

    def __init__(self, sportsline_id: str, capper: str, date: datetime, league: str, market: str, event: str, pick: str,
                 units: float, result: str, line: int, returns: float):
        self.sportsline_id = sportsline_id
        self.capper = capper
        self.date = date
        self.league = league
        self.market = market
        self.event = event
        self.pick = pick
        self.units = units
        self.result = result
        self.line = line
        self.returns = returns

    def __repr__(self):
        return f"<Sportsline {self.sportsline_id}>"
