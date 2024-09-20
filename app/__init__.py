from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
import os

app = Flask(__name__, template_folder=os.path.join(os.path.dirname(os.path.abspath(__file__)), '../templates'))

# Configure SQLite database
# Get the root directory of the project
basedir = os.path.abspath(os.path.dirname(__file__))
# Set the database URI to point to the root directory
# app.config['SQLALCHEMY_DATABASE_URI'] = f'sqlite:///{os.path.join(basedir, "../bets.db")}'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://local_user:strong_password@localhost:5432/betting_history_web'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = 'dev'

# Initialize the database
db = SQLAlchemy(app)
migrate = Migrate(app, db)

# Import routes at the end to avoid circular import issues
from app.routes import default
from app.routes import bet
from app.routes import capper
from app.routes import import_bets

