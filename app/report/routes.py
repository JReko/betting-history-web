from datetime import datetime
from flask import Blueprint, request, render_template
from flask_login import current_user
from app.bet_queries import BetQueries
from app.utility_time_zone import UtilityTimeZone

report_bp = Blueprint('report', __name__)


@report_bp.route('/report', methods=['GET', 'POST'])
def report():

    bets = None
    report_returns = None
    start_date = None
    end_date = None
    capper = None

    if request.method == "POST":
        start_date = request.form.get('start_date')
        end_date = request.form.get('end_date')
        capper = request.form.get('capper')

        # If any filter is set to "Do not filter" (empty), treat it as None
        start_date = start_date if start_date else None

        # Convert date to UTC as early as possible in our stack
        if start_date:
            start_date_datetime = datetime.strptime(start_date, UtilityTimeZone.get_form_input_date_format())
            start_date_datetime_localized = UtilityTimeZone.localize_datetime(start_date_datetime, current_user.get_timezone())
            start_date_datetime_utc = UtilityTimeZone.convert_datetime_to_utc(start_date_datetime_localized)
        else:
            start_date_datetime_utc = None
            start_date = None

        if end_date:
            end_date_datetime = datetime.strptime(end_date, UtilityTimeZone.get_form_input_date_format())
            end_date_datetime_localized = UtilityTimeZone.localize_datetime(end_date_datetime, current_user.get_timezone())
            end_date_datetime_utc = UtilityTimeZone.convert_datetime_to_utc(end_date_datetime_localized)
        else:
            end_date_datetime_utc = None
            end_date = None

        capper = capper if capper else None

        bets = BetQueries.get_bets_for_report(start_date_datetime_utc, end_date_datetime_utc, capper)
        report_returns = sum(bet['returns'] for bet in bets)

    return render_template(
        '/report/index.html',
        bets=bets,
        report_returns=report_returns,
        start_date=start_date,
        end_date=end_date,
        capper=capper,
    )
