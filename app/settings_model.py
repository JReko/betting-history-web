from app import db


# [
# {"id":1,"name":"sport_league","value":"hockey - NHL"},
# {"id":2,"name":"sport_league","value":"basketball - NBA"},
# {"id":3,"name":"sport_league","value":"basketball - NCAA"},
# {"id":4,"name":"sport_league","value":"basketball - Euroleague"},
# {"id":5,"name":"sport_league","value":"basketball - Eurocup"},
# {"id":6,"name":"sport_league","value":"basketball - CBA"},
# {"id":7,"name":"sport_league","value":"football - NFL"},
# {"id":8,"name":"sport_league","value":"football - NCAA"},
# {"id":9,"name":"sport_league","value":"baseball - MLB"},
# {"id":10,"name":"sport_league","value":"baseball - KBO"},
# {"id":11,"name":"sport_league","value":"tennis - ATP"},
# {"id":12,"name":"sport_league","value":"tennis - WTA"},
# {"id":13,"name":"sport_league","value":"mma - UFC"},
# {"id":14,"name":"sport_league","value":"basketball - KBL"},
# {"id":15,"name":"sport_league","value":"mma - PFL"},
# {"id":16,"name":"sportsline_latest_update","value":"2024-10-31 11:44AM"},
# {"id":17,"name":"sport_league","value":"soccer"}
# ]



class Settings(db.Model):
    __tablename__ = 'settings'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    value = db.Column(db.String(255), nullable=False)

    def __repr__(self):
        return f"<Settings {self.name}: {self.value}>"
