from flask import render_template, request, flash, Blueprint
from app import db
from app.models import Bet
from app.pinnacle_bet_page_scraper import PinnacleBetPageScraper
import calendar
import os
from flask_login import login_required, current_user

from app.service import Service
from app.utility_time_zone import UtilityTimeZone

default_bp = Blueprint('default', __name__)


# Homepage route
@default_bp.route('/')
def index():
    return render_template("index.html", email=current_user.email)


@default_bp.route("/import_pinnacle_bets", methods=["GET", "POST"])
def import_pinnacle_bets():
    if request.method == "GET":
        return render_template("import_pinnacle_bets.html")
    elif request.method == 'POST':
        # Check if the file is in the request
        if 'betFile' not in request.files:
            flash('No file selected', 'error')
            return redirect(request.url)

        file = request.files['betFile']

        # Check if a file was selected and has a valid filename
        if file.filename == '':
            flash('No file selected', 'error')
            return redirect(request.url)

        # Save the file to a temporary location
        filepath = os.path.join('/tmp', file.filename)
        file.save(filepath)

        # Call your import function to process the file
        scraper = PinnacleBetPageScraper(filepath)
        for x in range(scraper.get_bet_count()):
            scraper.import_bet()

        flash('Bets imported successfully!', 'success')
        return redirect(url_for('todays_bets'))


@default_bp.route("/calendar/<int:year>/<int:month>")
def calendar_view(year, month):
    # Ensure that month is within valid range
    if month < 1 or month > 12:
        return "Invalid month", 400

    local_tz = pytz.timezone('America/Montreal')
    utc = pytz.utc

    # Calculate the first and last day of the specified month
    first_day_of_month = datetime(year=year, month=month, day=1, tzinfo=local_tz)
    start_of_the_month = first_day_of_month.replace(hour=0, minute=0, second=0, microsecond=0)
    start_of_the_month_utc = start_of_the_month.astimezone(utc)

    last_day_of_month = first_day_of_month.replace(day=calendar.monthrange(year, month)[1])
    end_of_the_month = last_day_of_month.replace(hour=23, minute=59, second=59, microsecond=999999)
    end_of_the_month_utc = end_of_the_month.astimezone(utc)

    # Query for settled bets within the UTC range
    monthly_bets = Bet.query.filter(
        Bet.event_date >= start_of_the_month_utc.strftime('%Y-%m-%d %H:%M:%S'),
        Bet.event_date <= end_of_the_month_utc.strftime('%Y-%m-%d %H:%M:%S'),
        Bet.status == 'Settled'
    ).all()

    # Calculate daily profits
    daily_profits = {}
    total_profits = 0.00
    for bet in monthly_bets:
        # Convert bet event_date from UTC to local timezone
        bet_event_date = bet.event_date
        local_event_date = bet_event_date.replace(tzinfo=utc).astimezone(local_tz)
        day = local_event_date.day

        if day not in daily_profits:
            daily_profits[day] = 0

        if bet.result == 'Win':
            daily_profits[day] += bet.potential_win_amount
            total_profits += bet.potential_win_amount
        elif bet.result == 'Loss':
            daily_profits[day] -= bet.stake_amount
            total_profits -= bet.stake_amount

    # Pass the calendar module, daily profits, and selected month info to the template
    return render_template('calendar.html', daily_profits=daily_profits, total_profits=total_profits, month_int=month, month_str=calendar.month_name[month], year=year, calendar=calendar, datetime=datetime)


from flask import redirect, url_for
from datetime import datetime
import pytz


@default_bp.route("/calendar")
def calendar_today():
    # Get the current year and month in the local timezone
    local_tz = pytz.timezone('America/Montreal')
    today = datetime.now(local_tz)

    # Redirect to the /calendar/<int:year>/<int:month> route
    return redirect(url_for('default.calendar_view', year=today.year, month=today.month))
