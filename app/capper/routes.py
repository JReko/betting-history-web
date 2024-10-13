from flask import Blueprint, render_template, request, redirect, url_for, abort
from flask_login import current_user
from sqlalchemy import func, text

from app import db
from app.bet_model import Bet
from app.capper_model import Capper
from app.capper_queries import CapperQueries

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
    bets = CapperQueries.get_all_capper_bets(user_inputted_capper_id)

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

    by_sport_results = CapperQueries.get_all_capper_bets_by_sport(user_inputted_capper_id)

    return render_template("capper/read.html", capper=user_inputted_capper_id, bets_with_cumulative_sum=bets_with_cumulative_sum, sport_results=by_sport_results)


@capper_bp.route("/cappers", methods=["GET"])
def cappers_read():
    account_id = current_user.get_id()

    # Raw SQL query to get all necessary capper stats in one query
    query = text("""
    SELECT
        capper,
        COUNT(bet_id) AS bets_count,
        SUM(CASE WHEN status = 'Settled' THEN 1 ELSE 0 END) AS settled_bets_count,
        SUM(CASE WHEN status = 'Settled' AND result = 'Win' THEN 1 ELSE 0 END) AS winning_bets_count,
        SUM(CASE WHEN status = 'Settled' AND result = 'Loss' THEN 1 ELSE 0 END) AS losing_bets_count,
        SUM(CASE WHEN status = 'Settled' AND result = 'Refunded' THEN 1 ELSE 0 END) AS refunded_bets_count,
        SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) AS pending_bets_count,
        SUM(CASE 
                WHEN status = 'Settled' AND result = 'Win' THEN potential_win_amount
                WHEN status = 'Settled' AND result = 'Loss' THEN -stake_amount
                ELSE 0 
            END) AS profits,
        SUM(CASE 
                WHEN status = 'Settled' AND result != 'Refunded' THEN stake_amount
                ELSE 0 
            END) AS total_stake
    FROM 
        bets
    WHERE 
        capper IS NOT NULL
        AND account_id = :account_id
    GROUP BY
        capper
    """)

    # Execute the raw SQL query
    result = db.session.execute(query, {"account_id": account_id}).fetchall()

    # Process the results and prepare output
    cappers_output = {}
    for row in result:
        capper_id = row.capper
        roi = (row.profits / row.total_stake) * 100 if row.total_stake != 0 else 0.00
        bet_count_error = row.settled_bets_count != (row.winning_bets_count + row.losing_bets_count + row.refunded_bets_count)

        cappers_output[capper_id] = {
            "bets_count": row.bets_count,
            "settled_bets_count": row.settled_bets_count,
            "winning_bets_count": row.winning_bets_count,
            "losing_bets_count": row.losing_bets_count,
            "refunded_bets_count": row.refunded_bets_count,
            "pending_bets_count": row.pending_bets_count,
            "bet_count_error": bet_count_error,
            "profits": row.profits,
            "roi": roi
        }

    # Sort cappers_output: prioritize cappers with 10+ settled bets first, then sort by ROI
    sorted_cappers = sorted(
        cappers_output.items(),
        key=lambda x: (x[1]['settled_bets_count'] < 10, -x[1]['profits'])
    )
    sorted_cappers_output = dict(sorted_cappers)

    return render_template("cappers/read.html", cappers=sorted_cappers_output)

