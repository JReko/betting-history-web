from flask import Blueprint, render_template, request, redirect, url_for, abort
from flask_login import current_user

from app import db
from app.bet_model import Bet
from app.capper_model import Capper

capper_bp = Blueprint('capper', __name__)


# Registration Route
@capper_bp.route('/cappers/assign', methods=['GET', 'POST'])
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

        return redirect(url_for('bet.todays_bets'))

    # Fetch bets without cappers
    bets_without_capper = Bet.query.filter(Bet.capper.is_(None)).all()
    return render_template('cappers/assign.html', bets=bets_without_capper)


@capper_bp.route("/capper/<user_inputted_capper_id>", methods=["GET"])
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


@capper_bp.route("/cappers", methods=["GET"])
def cappers_read():
    account_id = current_user.get_id()
    unique_cappers = db.session.query(Bet.capper).filter(Bet.account_id == account_id).distinct().all()
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
