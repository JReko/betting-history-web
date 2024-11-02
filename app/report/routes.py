from datetime import datetime
from flask import Blueprint, request, render_template
from flask_login import current_user
from app.bet_queries import BetQueries
from app.utility_time_zone import UtilityTimeZone

report_bp = Blueprint('report', __name__)


@report_bp.route('/report', methods=['GET', 'POST'])
def report():

    bets = None
    betting_stats = None
    report_returns = None

    if request.method == "POST":
        start_date = request.form.get('start_date')
        end_date = request.form.get('end_date')
        capper = request.form.get('capper')
        include_individual_bets = 'include_individual_bets' in request.form

        # If any filter is set to "Do not filter" (empty), treat it as None
        start_date = start_date if start_date else None
        end_date = end_date if end_date else None

        # Convert date to UTC as early as possible in our stack
        if start_date:
            start_date_datetime = datetime.strptime(start_date, UtilityTimeZone.get_form_input_date_format())
            start_date_datetime_localized = UtilityTimeZone.localize_datetime(start_date_datetime, current_user.get_timezone())
            start_date_datetime_utc = UtilityTimeZone.convert_datetime_to_utc(start_date_datetime_localized)
        else:
            start_date_datetime_utc = None

        if end_date:
            end_date_datetime = datetime.strptime(end_date, UtilityTimeZone.get_form_input_date_format())
            end_date_datetime_localized = UtilityTimeZone.localize_datetime(end_date_datetime, current_user.get_timezone())
            end_date_datetime_utc = UtilityTimeZone.convert_datetime_to_utc(end_date_datetime_localized)
        else:
            end_date_datetime_utc = None

        capper = capper if capper else None

        betting_stats = BetQueries.get_betting_stats_for_report(start_date_datetime_utc, end_date_datetime_utc, capper)
        report_returns = sum(row['returns'] for row in betting_stats)

        if include_individual_bets:
            bets = BetQueries.get_bets_for_report(start_date_datetime_utc, end_date_datetime_utc, capper)

            # Calculate cumulative sum
            cumulative_sum = []
            current_sum = 0.0

            for bet in bets:
                if bet['result'] in ['Win', 'Loss', 'Refunded']:
                    if bet['result'] == 'Win':
                        current_sum += bet['potential_win_amount']
                    elif bet['result'] == 'Loss':
                        current_sum -= bet['stake_amount']
                    cumulative_sum.append(current_sum)

            # Combine bets and cumulative_sum into a list of tuples
            bets = list(zip(bets, cumulative_sum))

    return render_template(
        '/report/index.html',
        bets=bets,
        betting_stats=betting_stats,
        report_returns=report_returns,
        form_data=request.form
    )
