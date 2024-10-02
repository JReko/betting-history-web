from flask import Flask, Config, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager, current_user
from datetime import timedelta
from flask_wtf.csrf import CSRFProtect

import os

db = SQLAlchemy()
migrate = Migrate()
login_manager = LoginManager()
csrf = CSRFProtect()


def create_app():
    app = Flask(
        __name__,
        template_folder=os.path.join(os.path.dirname(os.path.abspath(__file__)), '../templates'),
        static_folder=os.path.join(os.path.dirname(os.path.abspath(__file__)), '../static'),
    )
    app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DATABASE_URL',
                                                           'postgresql://local_user:strong_password@localhost:5432/betting_history_web')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SECRET_KEY'] = 'dev'

    # Initialize the db with the app
    db.init_app(app)
    migrate.init_app(app, db)
    # Initialize CSRF protection
    csrf.init_app(app)

    # Set the session lifetime to 3 hours
    app.config['PERMANENT_SESSION_LIFETIME'] = timedelta(hours=72)

    login_manager.init_app(app)
    login_manager.login_view = 'auth.login'

    @login_manager.user_loader
    def load_user(user_id):
        from app.account_model import Account
        return Account.query.get(int(user_id))

    # Import and register blueprints after initializing the app
    from app.default.routes import default_bp
    app.register_blueprint(default_bp)

    from app.auth.routes import auth_bp
    app.register_blueprint(auth_bp, url_prefix='/auth')

    from app.account.routes import account_bp
    app.register_blueprint(account_bp, url_prefix='/account')

    from app.bet.routes import bet_bp
    app.register_blueprint(bet_bp)

    from app.capper.routes import capper_bp
    app.register_blueprint(capper_bp)

    from app.calendar.routes import calendar_bp
    app.register_blueprint(calendar_bp)

    from app.imports.routes import import_bp
    app.register_blueprint(import_bp)

    @app.context_processor
    def inject_user():
        # Check if the user is authenticated before trying to access the email
        if current_user.is_authenticated:
            return {'email': current_user.email}
        return {}

    # This function enforces that all routes, except those explicitly listed, require the user to be logged in.
    # It runs before every request, checking the user's authentication status and ensuring they are logged in.
    #
    # We specifically exempt certain routes from this check, such as the login and signup pages,
    # because users need to access these pages without being logged in. The 'static' endpoint is also
    # whitelisted so that public resources like CSS, JavaScript, and images can be served without restriction.
    #
    # By using `request.endpoint`, we can dynamically check the name of the current route.
    # For example, in the case of blueprints, `request.endpoint` includes both the blueprint
    # and the route name (e.g., 'auth.login'), which allows us to accurately identify and exempt
    # routes from different sections of the app.
    #
    # If the user is not authenticated, and they attempt to access any other route,
    # we redirect them to the login page. This ensures that the app is secure by default,
    # protecting routes from unauthorized access without having to add login checks to each route individually.
    @app.before_request
    def require_login():
        if request.endpoint in ['auth.login', 'auth.register']:
            return
        if not current_user.is_authenticated:
            return redirect(url_for('auth.login'))

    return app

