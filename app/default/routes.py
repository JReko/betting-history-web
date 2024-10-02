from flask import render_template, Blueprint
from flask_login import current_user

default_bp = Blueprint('default', __name__)


# Homepage route
@default_bp.route('/')
def index():
    return render_template("index.html", email=current_user.email)
