from datetime import datetime

import pytz
from flask import request, abort, render_template

from app import app, db
from app.capper import Capper
from app.models import Bet
from app.utility_time_zone import UtilityTimeZone


@app.route("/capper/<user_inputted_capper_id>", methods=["GET"])
def capper_read(user_inputted_capper_id: str):
    if request.method == "GET":
        capper = Capper(user_inputted_capper_id)
        bets = capper.get_bets()

        # time_zone = UtilityTimeZone.get_user_timezone()
        # utc = pytz.utc
        #
        # start_date_str = "2024-09-15 00:00:00"
        # start_date = datetime.strptime(start_date_str, '%Y-%m-%d %H:%M:%S')
        # start_date_utc = start_date.replace(tzinfo=utc).astimezone(time_zone)
        #
        # end_date_str = "2024-09-15 23:59:59"
        # end_date = datetime.strptime(end_date_str, '%Y-%m-%d %H:%M:%S')
        # end_date_utc = end_date.replace(tzinfo=utc).astimezone(time_zone)
        #
        # bets = capper.get_bets_by_filter(filtering_start_date=start_date_utc, filtering_end_date=end_date_utc, filtering_status="Settled")

        # Calculate cumulative sum
        cumulative_sum = []
        current_sum = 0.0

        for bet in bets:
            if bet.status == 'Settled':
                if bet.result == 'Win':
                    current_sum += bet.potential_win_amount
                elif bet.result == 'Loss':
                    current_sum -= bet.stake_amount
            cumulative_sum.append(current_sum)

        # Combine bets and cumulative_sum into a list of tuples
        bets_with_cumulative_sum = list(zip(bets, cumulative_sum))

        return render_template("capper/read.html", capper=user_inputted_capper_id, bets_with_cumulative_sum=bets_with_cumulative_sum)
    else:
        abort(404)


@app.route("/cappers", methods=["GET"])
def cappers_read():
    unique_cappers = db.session.query(Bet.capper).distinct().all()
    unique_cappers_list = [capper[0] for capper in unique_cappers]
    cappers_output = {}
    for capper_id in unique_cappers_list:
        if capper_id:
            capper = Capper(capper_id)
            bets_count, settled_bets_count, winning_bets_count, losing_bets_count, refunded_bets_count, pending_bets_count, bet_count_error = capper.get_bet_counts()
            cappers_output[capper_id] = {
                "bets_count": bets_count,
                "settled_bets_count": settled_bets_count,
                "winning_bets_count": winning_bets_count,
                "losing_bets_count": losing_bets_count,
                "refunded_bets_count": refunded_bets_count,
                "pending_bets_count": pending_bets_count,
                "bet_count_error": bet_count_error,
                "profits": capper.get_profits(),
                "roi": capper.get_roi(),
            }

    # Sort cappers_output: prioritize cappers with 10+ settled bets first, then sort by ROI
    sorted_cappers = sorted(
        cappers_output.items(),
        key=lambda x: (x[1]['settled_bets_count'] < 10, -x[1]['roi'])
    )
    sorted_cappers_output = dict(sorted_cappers)

    return render_template("cappers/read.html", cappers=sorted_cappers_output)
