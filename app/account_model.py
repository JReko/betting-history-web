from flask_login import UserMixin
from app import db


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

    # TODO Get from DB, if not set use UTC
    @staticmethod
    def get_timezone():
        return "America/Montreal"
