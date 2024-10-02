from flask import Blueprint, render_template, request, redirect, url_for, flash, session, abort
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import login_user, logout_user, login_required, current_user
from app import db
from app.account_model import Account
auth_bp = Blueprint('auth', __name__)


# Registration Route
@auth_bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')

        new_account = Account(email=email, password_hash=hashed_password)
        db.session.add(new_account)
        db.session.commit()

        flash('Account created successfully. Please login.')
        return redirect(url_for('auth.login'))

    return render_template('/auth/register.html')


# Login Route
@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        account = Account.query.filter_by(email=email).first()

        if account and not account.confirmed:
            abort(401, "Your account has not been confirmed by the administrator.")

        if account and check_password_hash(account.password_hash, password):
            login_user(account)
            session.permanent = True
            flash('Login successful!', 'success')
            return redirect(url_for('default.index'))

        flash('Invalid credentials. Please try again.', 'warning')
        return redirect(url_for('auth.login'))

    return render_template('/auth/login.html')


# Logout Route
@auth_bp.route('/logout')
def logout():
    logout_user()
    flash('You have been logged out.', 'success')
    return redirect(url_for('auth.login'))



