import pytz
from flask import render_template, request, redirect, url_for, abort, Blueprint, flash
from flask_login import current_user

from app import db
from app.bet_model import Bet
from datetime import datetime, timedelta

from app.bet_queries import BetQueries
from app.service import Service
from app.utility_time_zone import UtilityTimeZone

bet_bp = Blueprint('bet', __name__)


@bet_bp.route("/bet/create", methods=["GET", "POST"])
def bet_create():
    if request.method == "POST":
        bet_id = "ID_PROBLEM"
        book = request.form.get("book").strip()
        if book == "Bet365":
            bet_id = Bet.get_next_bet365_id()
        elif book == "Bet99":
            bet_id = Bet.get_next_bet99_id()
        capper = request.form.get("capper").strip()
        amount = float(request.form.get("amount").strip())
        # Convert date to UTC as early as possible in our stack
        event_date_string = request.form.get("event_date").strip()
        event_date_datetime = datetime.strptime(event_date_string, UtilityTimeZone.get_form_input_date_format())
        event_date_datetime_localized = UtilityTimeZone.localize_datetime(event_date_datetime, current_user.get_timezone())
        event_date_datetime_utc = UtilityTimeZone.convert_datetime_to_utc(event_date_datetime_localized)

        sport = request.form.get("sport").strip()
        event_match = request.form.get("event_match").strip()
        pick = request.form.get("pick").strip()
        result = request.form.get("result") if request.form.get("result") != "None" else None
        line = request.form.get("line").strip()
        potential_win_amount = Service.calculate_potential_win_amount(float(amount), int(line))

        # Create new bet object
        bet = Bet(
            bet_id=bet_id,
            book=book,
            capper=capper,
            stake_amount=amount,
            potential_win_amount=potential_win_amount,
            sport=sport,
            event_date=event_date_datetime_utc,
            match=event_match,
            pick=pick,
            result=result,
            line=line,
            account_id=current_user.get_id(),
        )

        # Save to the database
        db.session.add(bet)
        db.session.commit()

        return redirect(url_for('bet.todays_bets'))  # Redirect to the bets page

    return render_template("/bet/create.html", current_datetime = datetime.now(tz=pytz.timezone(current_user.get_timezone())).strftime(UtilityTimeZone.get_form_input_date_format()))


@bet_bp.route("/bet/edit/<user_inputted_bet_id>", methods=["GET", "POST"])
def bet_edit(user_inputted_bet_id):
    if request.method == "POST":
        bet_id = request.form.get("bet_id")
        book = request.form.get("book").strip()
        capper = request.form.get("capper").strip()
        amount = float(request.form.get("amount").strip())
        # Convert date to UTC as early as possible in our stack
        event_date_string = request.form.get("event_date").strip()
        event_date_datetime = datetime.strptime(event_date_string, UtilityTimeZone.get_form_input_date_format())
        event_date_datetime_localized = UtilityTimeZone.localize_datetime(event_date_datetime, current_user.get_timezone())
        event_date_datetime_utc = UtilityTimeZone.convert_datetime_to_utc(event_date_datetime_localized)
        sport = request.form.get("sport").strip()
        event_match = request.form.get("event_match").strip()
        pick = request.form.get("pick").strip()
        result = request.form.get("result") if request.form.get("result") != "None" else None
        line = request.form.get("line").strip()
        potential_win_amount = Service.calculate_potential_win_amount(float(amount), int(line))

        bet = Bet.query.get(bet_id)
        bet.book = book
        bet.result = result
        bet.stake_amount = amount
        bet.potential_win_amount = potential_win_amount
        bet.line = line
        bet.match = event_match
        bet.sport = sport
        bet.pick = pick
        bet.event_date = event_date_datetime_utc
        bet.capper = capper

        db.session.commit()

        return redirect(url_for('bet.bets_by_date', date_parameter=event_date_datetime_localized.strftime("%Y-%m-%d")))  # Redirect to the bets page

    elif request.method == "GET":
        bet: Bet = BetQueries.get_bet_by_id(user_inputted_bet_id, current_user.get_timezone())
        if not bet:
            abort(404)

        return render_template("/bet/edit.html", bet=bet)


@bet_bp.route("/bet/copy/<user_inputted_bet_id>", methods=["GET", "POST"])
def bet_copy(user_inputted_bet_id):
    if request.method == "POST":
        bet_id = "ID_PROBLEM"
        book = request.form.get("book").strip()
        if book == "Bet365":
            bet_id = Bet.get_next_bet365_id()
        elif book == "Bet99":
            bet_id = Bet.get_next_bet99_id()
        elif book == "Pinnacle":
            bet_id = Bet.get_next_pinnacle_id()

        capper = request.form.get("capper").strip()
        amount = float(request.form.get("amount").strip())
        # Convert date to UTC as early as possible in our stack
        event_date_string = request.form.get("event_date").strip()
        event_date_datetime = datetime.strptime(event_date_string, UtilityTimeZone.get_form_input_date_format())
        event_date_datetime_localized = UtilityTimeZone.localize_datetime(event_date_datetime,
                                                                          current_user.get_timezone())
        event_date_datetime_utc = UtilityTimeZone.convert_datetime_to_utc(event_date_datetime_localized)

        sport = request.form.get("sport").strip()
        event_match = request.form.get("event_match").strip()
        pick = request.form.get("pick").strip()
        result = request.form.get("result") if request.form.get("result") != "None" else None
        line = request.form.get("line").strip()
        potential_win_amount = Service.calculate_potential_win_amount(float(amount), int(line))

        # Create new bet object
        bet = Bet(
            bet_id=bet_id,
            book=book,
            capper=capper,
            stake_amount=amount,
            potential_win_amount=potential_win_amount,
            sport=sport,
            event_date=event_date_datetime_utc,
            match=event_match,
            pick=pick,
            result=result,
            line=line,
            account_id=current_user.get_id(),
        )

        # Save to the database
        db.session.add(bet)
        db.session.commit()

        return redirect(url_for('bet.bets_by_date', date_parameter=event_date_datetime_localized.strftime("%Y-%m-%d")))  # Redirect to the bets page

    elif request.method == "GET":
        bet: Bet = BetQueries.get_bet_by_id(user_inputted_bet_id, current_user.get_timezone())
        if not bet:
            abort(404)

        return render_template("/bet/copy.html", bet=bet)


@bet_bp.route("/bets/today")
def todays_bets():
    # Get today's date
    tz = pytz.timezone(current_user.get_timezone())
    today = datetime.now(tz)
    today_str = today.strftime("%Y-%m-%d")

    return redirect(url_for('bet.bets_by_date', date_parameter=today_str))


@bet_bp.route("/bets/<date_parameter>")
def bets_by_date(date_parameter: str):
    try:
        date_datetime = datetime.strptime(date_parameter, "%Y-%m-%d")
    except ValueError:
        return "Invalid date format. Please use YYYY-MM-DD.", 400

    # 1ST get bets for the date
    sorted_bets_for_date, count_pending_bets, total_stake_pending_bets, current_profit = Service.fetch_bets_for_date(date_datetime)
    # 2ND get a per capper report for the date
    cappers_results_for_date = Service.get_bets_for_day_by_capper(date_datetime)
    # 3RD get a per sport report for the date
    by_sport_results_for_date = BetQueries.get_bets_for_day_by_sport(date_datetime)

    return render_template(
        'bets/read.html',
        date=date_parameter,
        previous_day=(date_datetime - timedelta(days=1)).strftime("%Y-%m-%d"),
        next_day=(date_datetime + timedelta(days=1)).strftime("%Y-%m-%d"),
        bets=sorted_bets_for_date,
        num_pending=count_pending_bets,
        total_stake_pending=total_stake_pending_bets,
        current_profit=current_profit,
        cappers_stats=cappers_results_for_date,
        by_sport_results=by_sport_results_for_date,
    )


@bet_bp.route("/bets/overall")
def bets_overall():

    bets = BetQueries.get_settled_bets_by_month()
    # Initialize variables for overall and yearly profits
    total_profits = 0
    yearly_profits = {}
    # Loop over the results to calculate total and yearly profits
    for row in bets:
        # Accumulate total profits
        total_profits += row['profits']
        # Extract the year from the 'month' field (it's a truncated timestamp)
        year = row['month'].year
        # Add profits to the respective year in the yearly_profits dictionary
        if year not in yearly_profits:
            yearly_profits[year] = 0
        yearly_profits[year] += row['profits']

    # Pass results, total profits, and yearly profits to the template
    return render_template(
        'bets/overall.html',
        stats=bets,
        total_profits=total_profits,
        yearly_profits=yearly_profits
    )
