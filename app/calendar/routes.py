import calendar
from datetime import datetime
import pytz
from flask import Blueprint, render_template, redirect, url_for
from flask_login import current_user

from app.bet_model import Bet
from app.utility_time_zone import UtilityTimeZone

calendar_bp = Blueprint('calendar', __name__)


# Registration Route
@calendar_bp.route("/calendar/<int:year>/<int:month>")
def calendar_view(year, month):
    # Ensure that month is within valid range
    if month < 1 or month > 12:
        return "Invalid month", 400

    local_tz = pytz.timezone(current_user.get_timezone())
    utc = pytz.utc

    if month == 12:
        next_month_int = 1
        next_year_int = year + 1
    else:
        next_month_int = month + 1
        next_year_int = year
    if month == 1:
        previous_month_int = 12
        previous_year_int = year - 1
    else:
        previous_month_int = month - 1
        previous_year_int = year

    start_of_the_month_utc = UtilityTimeZone.get_day_start_datetime_utc(f"{year}-{month}-1")

    last_day_of_month = start_of_the_month_utc.replace(day=calendar.monthrange(year, month)[1])
    end_of_the_month_utc = UtilityTimeZone.get_day_end_datetime_utc(f"{last_day_of_month.year}-{last_day_of_month.month}-{last_day_of_month.day}")

    # Query for settled bets within the UTC range
    monthly_bets = Bet.query.filter(
        Bet.event_date >= start_of_the_month_utc,
        Bet.event_date <= end_of_the_month_utc,
        Bet.result is not None,
        Bet.account_id == current_user.get_id(),
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
    return render_template(
        'calendar.html',
        daily_profits=daily_profits,
        total_profits=total_profits,
        month_int=month,
        month_str=calendar.month_name[month],
        year=year,
        calendar=calendar,
        next_month_int=next_month_int,
        next_year_int=next_year_int,
        previous_month_int=previous_month_int,
        previous_year_int=previous_year_int,
    )


@calendar_bp.route("/calendar")
def calendar_today():
    local_tz = pytz.timezone(current_user.get_timezone())
    today = datetime.now(local_tz)

    # Redirect to the /calendar/<int:year>/<int:month> route
    return redirect(url_for('calendar.calendar_view', year=today.year, month=today.month))