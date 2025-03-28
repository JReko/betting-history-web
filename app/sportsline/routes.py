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
    # Hardcoded leagues with the start dates of their latest seasons.
    # (Update these dates as needed.)
    hardcoded_leagues = {
        'NHL': datetime(2024, 10, 1, 0, 0, 0),
        'MLB': datetime(2025, 3, 15, 0, 0, 0),
        'NBA': datetime(2024, 10, 1, 0, 0, 0),
        'NFL': datetime(2024, 9, 1, 0, 0, 0),
        'NCAAB': datetime(2024, 11, 1, 0, 0, 0),
        'NCAAF': datetime(2024, 8, 15, 0, 0, 0)
    }

    cappers = SportslineQueries.get_all_sportsline_cappers()

    sportsline_last_updated = db.session.query(Settings.value).filter(
        Settings.name == 'sportsline_last_updated'
    ).scalar()

    # Iterate over each league to get the query results using its start date.
    cappers_to_tail = {}
    for league, start_date in hardcoded_leagues.items():
        cappers_to_tail[league] = SportslineQueries.get_current_league_winning_cappers(league, start_date)

    return render_template(
        'sportsline/index.html',
        cappers=cappers,
        sportsline_last_updated=sportsline_last_updated,
        leagues=hardcoded_leagues,
        cappers_to_tail=cappers_to_tail,
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
