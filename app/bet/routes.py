from flask import render_template, request, redirect, url_for, abort, Blueprint, flash
from flask_login import current_user

from app import db
from app.bet_model import Bet
from datetime import datetime, timedelta

from app.pinnacle_bet_page_scraper import PinnacleBetPageScraper
from app.service import Service
from app.utility_time_zone import UtilityTimeZone

bet_bp = Blueprint('bet', __name__)


@bet_bp.route("/bet/create", methods=["GET", "POST"])
def bet_create():
    if request.method == "POST":
        bet_id = "ID_PROBLEM"
        book = request.form.get("book")
        if book == "Bet365":
            bet_id = Bet.get_next_bet365_id()
        elif book == "Bet99":
            bet_id = Bet.get_next_bet99_id()
        capper = request.form.get("capper")
        amount = float(request.form.get("amount"))
        potential_win_amount = float(request.form.get("potential_win_amount"))
        event_date_string = request.form.get("event_date")
        event_date = datetime.strptime(event_date_string, '%Y-%m-%dT%H:%M')
        event_date_utc_string = UtilityTimeZone.convert_to_utc(event_date.strftime('%Y-%m-%d %H:%M:%S'))
        sport = request.form.get("sport")
        event_match = request.form.get("event_match")
        pick = request.form.get("pick")
        status = request.form.get("status")
        result = request.form.get("result") if request.form.get("result") != "None" else None

        line = request.form.get("line")

        # Create new bet object
        bet = Bet(
            bet_id=bet_id,
            book=book,
            capper=capper,
            stake_amount=amount,
            potential_win_amount=potential_win_amount,
            sport=sport,
            event_date=event_date_utc_string,
            match=event_match,
            pick=pick,
            status=status,
            result=result,
            line=line,
            account_id=current_user.get_id(),
        )

        # Save to the database
        db.session.add(bet)
        db.session.commit()

        return redirect(url_for('bet.todays_bets'))  # Redirect to the bets page

    return render_template("/bet/create.html")


@bet_bp.route("/bet/edit/<user_inputted_bet_id>", methods=["GET", "POST"])
def bet_edit(user_inputted_bet_id):
    if request.method == "POST":
        # Get form data
        bet_id = request.form.get("bet_id")
        book = request.form.get("book")
        capper = request.form.get("capper")
        amount = float(request.form.get("amount"))
        potential_win_amount = float(request.form.get("potential_win_amount"))
        event_date = request.form.get("event_date")
        sport = request.form.get("sport")
        event_match = request.form.get("event_match")
        pick = request.form.get("pick")
        status = request.form.get("status")
        result = request.form.get("result") if request.form.get("result") != "None" else None
        line = request.form.get("line")

        bet = Bet.query.get(bet_id)
        bet.book = book
        bet.status = status
        bet.result = result
        bet.stake_amount = amount
        bet.potential_win_amount = potential_win_amount
        bet.line = line
        bet.match = event_match
        bet.sport = sport
        bet.pick = pick
        event_date = datetime.strptime(event_date, '%Y-%m-%dT%H:%M')
        event_date_string = event_date.strftime("%Y-%m-%d %H:%M:%S")
        bet.event_date = event_date_string
        bet.capper = capper

        db.session.commit()

        return redirect(url_for('bet.todays_bets'))  # Redirect to the bets page

    elif request.method == "GET":

        bet = Bet.query.get(user_inputted_bet_id)
        bet.event_date = UtilityTimeZone.convert_utc_datetime_to_user_time_zone(bet.event_date)

        # If no bet is found, return a 404 error
        if not bet:
            abort(404)

        return render_template("/bet/edit.html", bet=bet)


@bet_bp.route("/bets/today")
def todays_bets():
    # Get today's date
    today = datetime.now(UtilityTimeZone.get_user_timezone())
    today_str = today.strftime("%Y-%m-%d")

    return redirect(url_for('bet.bets_by_date', date=today_str))


@bet_bp.route("/bets/<date>")
def bets_by_date(date: str):
    # Validate the format and prepare links
    try:
        user_provided_date = datetime.strptime(date, "%Y-%m-%d")
        previous_day = (user_provided_date - timedelta(days=1)).strftime("%Y-%m-%d")
        next_day = (user_provided_date + timedelta(days=1)).strftime("%Y-%m-%d")
    except ValueError:
        return "Invalid date format. Please use YYYY-MM-DD.", 400

    cappers_stats = Service.get_cappers_stats_for_a_date(date)

    # Fetch and process the bets for the given date
    sorted_bets, num_pending, total_stake_pending, current_profit = Service.fetch_bets_for_date(user_provided_date)

    # Pass data to the template
    return render_template(
        'bets/read.html',
        date=date,
        previous_day=previous_day,
        next_day=next_day,
        bets=sorted_bets,
        num_pending=num_pending,
        total_stake_pending=total_stake_pending,
        current_profit=current_profit,
        cappers_stats=cappers_stats
    )