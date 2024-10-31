from datetime import datetime

from flask import Blueprint, render_template, request

from app import db
from app.settings_model import Settings
from app.sportsline_queries import SportslineQueries
# Required for flask migrate to kick in
from app.sportsline_model import Sportsline

sportsline_bp = Blueprint('sportsline', __name__)


@sportsline_bp.route('/sportsline', methods=['GET', 'POST'])
def sportsline_cappers():
    cappers_to_tail = None
    league = None

    if request.method == "POST":
        league = request.form.get('league')
        cappers_to_tail = SportslineQueries.get_current_league_winning_cappers(league)

    date_filter = datetime(2024, 1, 1, 0, 0, 0)
    # Query to get distinct leagues with a date filter
    distinct_leagues = (
        db.session.query(Sportsline.league)
        .filter(Sportsline.date >= date_filter)  # Filtering for dates on or after 2024-01-01 00:00:00
        .distinct()
        .all()
    )
    # Extracting league names from the result
    leagues = [league[0] for league in distinct_leagues]

    cappers = SportslineQueries.get_all_sportsline_cappers()

    sportsline_last_updated = db.session.query(Settings.value).filter(
        Settings.name == 'sportsline_last_updated'
    ).scalar()

    return render_template(
        'sportsline/index.html',
        cappers=cappers,
        sportsline_last_updated=sportsline_last_updated,
        leagues=leagues,
        cappers_to_tail=cappers_to_tail,
        previously_selected_league=league
    )


@sportsline_bp.route('/sportsline/capper/<capper>', methods=['GET'])
def sportsline_capper(capper: str):
    capper_lifetime_returns = SportslineQueries.get_capper_lifetime_returns(capper)
    capper_yearly_returns = SportslineQueries.get_capper_yearly_returns(capper)
    capper_returns_by_sport = SportslineQueries.get_capper_returns_by_sport(capper)
    capper_yearly_returns_by_sport = SportslineQueries.get_capper_yearly_returns_by_sport(capper)
    capper_returns_by_market = SportslineQueries.get_capper_returns_by_market(capper)

    return render_template(
        'sportsline/capper.html',
        capper=capper,
        capper_lifetime_returns=capper_lifetime_returns,
        capper_yearly_returns=capper_yearly_returns,
        capper_returns_by_sport=capper_returns_by_sport,
        capper_yearly_returns_by_sport=capper_yearly_returns_by_sport,
        capper_returns_by_market=capper_returns_by_market,
    )
