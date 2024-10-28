from flask import Blueprint, render_template
from app.sportsline_queries import SportslineQueries
# Required for flask migrate to kick in
from app.sportsline_model import Sportsline

sportsline_bp = Blueprint('sportsline', __name__)


@sportsline_bp.route('/sportsline', methods=['GET'])
def sportsline_cappers():
    cappers = SportslineQueries.get_all_sportsline_cappers()

    return render_template('sportsline/index.html', cappers=cappers)


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
