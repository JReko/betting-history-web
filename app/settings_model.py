from app import db


class Settings(db.Model):
    __tablename__ = 'settings'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    value = db.Column(db.String(255), nullable=False)

    def __repr__(self):
        return f"<Settings {self.name}: {self.value}>"
