from flask import render_template, request, redirect, url_for, flash
from app import app, db
from app.models import Bet, MultiBetWinCondition
from datetime import datetime, timedelta
from app.pinnacle_bet_page_scraper import PinnacleBetPageScraper
from sqlalchemy import asc
import calendar
import os
import pytz

from app.service import Service
from app.utility_time_zone import UtilityTimeZone


# Example function to get the user's timezone (hardcoded for now)
def get_user_timezone():
    # You can replace this with logic to get timezone from session/cookie
    return pytz.timezone('America/Montreal')


# Function to convert a UTC date to the user's timezone
def localize_to_user_timezone(utc_date_str: str, user_timezone):
    # Parse the UTC date string (assuming format: 'YYYY-MM-DD HH:MM:SS')
    utc_date = datetime.strptime(utc_date_str, '%Y-%m-%d %H:%M:%S')
    # Set UTC timezone for the parsed date
    utc_date = pytz.utc.localize(utc_date)
    # Convert to user's timezone
    local_date = utc_date.astimezone(user_timezone)
    return local_date.strftime('%Y-%m-%d %H:%M')  # You can customize the format


# Homepage route
@app.route("/")
def index():
    return render_template("index.html")


@app.route("/import_pinnacle_bets", methods=["GET", "POST"])
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


@app.route("/bets/today")
def todays_bets():
    # Get today's date
    today = datetime.now(get_user_timezone()).date()

    today_str = today.strftime("%Y-%m-%d")
    cappers_stats = Service.get_cappers_stats_for_a_date(today_str)

    # Fetch and process the bets for today
    sorted_bets, num_pending, total_stake_pending, current_profit = fetch_bets_for_date(today)

    # Pass data to the template
    return render_template('bets.html', bets=sorted_bets, num_pending=num_pending, total_stake_pending=total_stake_pending, current_profit=current_profit, cappers_stats=cappers_stats)


@app.route("/bets/<date>")
def bets_by_date(date):
    # Parse the provided date
    try:
        user_provided_date = datetime.strptime(date, "%Y-%m-%d").date()
    except ValueError:
        return "Invalid date format. Please use YYYY-MM-DD.", 400

    cappers_stats = Service.get_cappers_stats_for_a_date(date)

    # Fetch and process the bets for the given date
    sorted_bets, num_pending, total_stake_pending, current_profit = fetch_bets_for_date(user_provided_date)

    # Pass data to the template
    return render_template('bets.html', bets=sorted_bets, num_pending=num_pending, total_stake_pending=total_stake_pending, current_profit=current_profit, cappers_stats=cappers_stats)


@app.route('/assign-cappers', methods=['GET', 'POST'])
def assign_cappers():
    if request.method == 'POST':
        # Process the form submission to assign cappers
        bet_ids = request.form.getlist('bet_id')
        capper_names = request.form.getlist('capper')

        for i, bet_id in enumerate(bet_ids):
            # Find the bet by ID and update its capper
            bet = Bet.query.get(bet_id)
            if bet:
                bet.capper = capper_names[i]
                db.session.commit()

        return redirect(url_for('index'))

    # Fetch bets without cappers
    bets_without_capper = Bet.query.filter(Bet.capper == None).all()
    return render_template('assign_cappers.html', bets=bets_without_capper)


def fetch_bets_for_date(date):
    user_timezone = get_user_timezone()
    # Localize the naive datetime (without time) to the user's timezone
    start_local = user_timezone.localize(datetime(year=date.year, month=date.month, day=date.day, hour=0, minute=0, second=0))
    end_local = user_timezone.localize(datetime(year=date.year, month=date.month, day=date.day, hour=23, minute=59, second=59))

    # Convert the localized time to UTC
    start_utc = start_local.astimezone(pytz.utc)
    end_utc = end_local.astimezone(pytz.utc)

    # Fetch bets by filtering event_date in UTC
    result_bets = Bet.query.filter(Bet.event_date >= start_utc, Bet.event_date < end_utc).all()

    # Convert event_date to user's timezone and calculate profit
    current_profit = 0
    for bet in result_bets:
        bet.event_date = UtilityTimeZone.convert_utc_datetime_to_user_time_zone(bet.event_date, user_timezone)
        if bet.status == "Settled" and bet.result == "Win":
            current_profit += bet.potential_win_amount
        elif bet.status == "Settled" and bet.result == "Loss":
            current_profit -= bet.stake_amount

    # Separate settled and pending/accepted bets
    settled_bets = [bet for bet in result_bets if bet.status == 'Settled']
    pending_bets = [bet for bet in result_bets if bet.status in ['Pending', 'Accepted']]

    # Sort both groups by event date
    settled_bets.sort(key=lambda bet: bet.event_date)
    pending_bets.sort(key=lambda bet: bet.event_date)

    # Combine settled bets at the top, pending/accepted bets at the bottom
    sorted_bets = settled_bets + pending_bets

    # Calculate statistics
    num_pending = len(pending_bets)
    total_stake_pending = sum(bet.stake_amount for bet in pending_bets)

    return sorted_bets, num_pending, total_stake_pending, current_profit


@app.route("/calendar/<int:year>/<int:month>")
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
        bet_event_date = datetime.strptime(bet.event_date, "%Y-%m-%d %H:%M:%S")  # Adjust format if needed
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


@app.route("/calendar")
def calendar_today():
    # Get the current year and month in the local timezone
    local_tz = pytz.timezone('America/Montreal')
    today = datetime.now(local_tz)

    # Redirect to the /calendar/<int:year>/<int:month> route
    return redirect(url_for('calendar_view', year=today.year, month=today.month))
