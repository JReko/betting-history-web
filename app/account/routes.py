from flask import Blueprint, request, flash, redirect, url_for, render_template
from flask_login import current_user
from werkzeug.security import check_password_hash, generate_password_hash

from app import login_manager

account_bp = Blueprint('account', __name__)


@account_bp.route('/edit', methods=['GET', 'POST'])
@login_manager.needs_refresh_handler
def edit():
    from app import db
    if request.method == 'POST':
        # Update email
        current_user.email = request.form['email']

        # Handle password update
        old_password = request.form['old_password']
        new_password = request.form['password']
        new_password_confirm = request.form['password_confirm']

        # Check if old password is provided and correct
        if old_password and check_password_hash(current_user.password_hash, old_password):
            # Check if new password and confirmation match
            if new_password and new_password_confirm and new_password == new_password_confirm:
                # Update password
                current_user.password_hash = generate_password_hash(new_password, method='pbkdf2:sha256')
                flash('Password updated successfully.')
            else:
                flash('New passwords do not match. Please try again.')
        elif old_password:
            flash('Old password is incorrect. Please try again.')

        db.session.commit()
        flash('Account updated successfully.', 'success')
        return redirect(url_for('default.index'))

    return render_template('account/edit.html')


@account_bp.route('/settings', methods=['GET', 'POST'])
def settings():
    from app import db

    if request.method == 'POST':
        # Get the selected timezone from the form
        timezone = request.form['timezone']

        # Update the current user's timezone
        current_user.timezone = timezone

        # Save the changes to the database
        db.session.commit()

        flash('Timezone updated successfully.', 'success')
        return redirect(url_for('account.settings'))

    # Render the settings page with the current user's timezone
    return render_template('account/settings.html', current_timezone=current_user.timezone)
