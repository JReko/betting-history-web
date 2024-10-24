from datetime import datetime
import pytz
from flask_login import current_user
from app.bet_model import Bet
from app.bet_queries import BetQueries
from app.utility_time_zone import UtilityTimeZone


class Service:

    @staticmethod
    def get_bets_for_day_by_capper(date_datetime: datetime) -> {}:
        by_capper_results_for_date = BetQueries.get_bets_for_day_by_capper(date_datetime)

        # Process the results and prepare output
        cappers_output = {}
        for row in by_capper_results_for_date:
            capper_id = row.capper
            roi = (row.profits / row.total_stake) * 100 if row.total_stake != 0 else 0.00
            bet_count_error = row.settled_bets_count != (row.winning_bets_count + row.losing_bets_count + row.refunded_bets_count)

            cappers_output[capper_id] = {
                "bets_count": row.total_bets_count,
                "settled_bets_count": row.settled_bets_count,
                "winning_bets_count": row.winning_bets_count,
                "losing_bets_count": row.losing_bets_count,
                "refunded_bets_count": row.refunded_bets_count,
                "pending_bets_count": row.pending_bets_count,
                "bet_count_error": bet_count_error,
                "profits": row.profits,
                "roi": roi
            }

        # Sort cappers_output: sort by profits DESC
        sorted_cappers = sorted(
            cappers_output.items(),
            key=lambda x: (-x[1]['profits'])
        )
        sorted_cappers_output = dict(sorted_cappers)

        return sorted_cappers_output

    @staticmethod
    def fetch_bets_for_date(date_datetime: datetime):
        bets = BetQueries.get_bets_for_date(date_datetime)

        current_profit = 0
        for bet in bets:
            if bet.status == "Settled" and bet.result == "Win":
                current_profit += bet.potential_win_amount
            elif bet.status == "Settled" and bet.result == "Loss":
                current_profit -= bet.stake_amount

        # Separate settled and pending/accepted bets
        settled_bets = [bet for bet in bets if bet.result is not None]
        pending_bets = [bet for bet in bets if bet.result is None]

        # Sort both groups by event date, match/event, pick so that bets on the same event are grouped together
        settled_bets.sort(key=lambda settled_bet: (settled_bet.event_date, settled_bet.match, settled_bet.pick))
        pending_bets.sort(key=lambda pending_bet: (pending_bet.event_date, pending_bet.match, pending_bet.pick))

        # Combine settled bets at the top, pending bets at the bottom
        sorted_bets = settled_bets + pending_bets

        pending_bets_count = len(pending_bets)
        pending_bets_total_stake = sum(bet.stake_amount for bet in pending_bets)

        return sorted_bets, pending_bets_count, pending_bets_total_stake, current_profit

    @staticmethod
    def calculate_potential_win_amount(stake: float, odds: int) -> float:
        if odds > 0:
            # Positive American odds
            return stake * (odds / 100)
        elif odds < 0:
            # Negative American odds
            return stake * (100 / abs(odds))
        else:
            # Odds of 0 is not valid
            raise ValueError("Odds cannot be zero")
