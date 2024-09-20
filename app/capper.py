from datetime import datetime

import pytz

from app.models import Bet
from sqlalchemy import func

from app.utility_time_zone import UtilityTimeZone


class Capper:
    def __init__(self, capper_id: str):
        bets = Bet.query.filter(func.lower(Bet.capper) == capper_id.lower()).all()
        self.bets = sorted(bets, key=lambda bet: bet.event_date)
        self.settled_bets = self._get_settled_bets()
        self.winning_bets = self._get_winning_bets()
        self.losing_bets = self._get_losing_bets()
        self.refunded_bets = self._get_refunded_bets()
        self.pending_bets = self._get_pending_bets()

    def get_bet_counts(self):
        bet_count_error = False
        if len(self.settled_bets) != len(self.winning_bets) + len(self.losing_bets) + len(self.refunded_bets):
            bet_count_error = True
        if len(self.bets) != len(self.settled_bets) + len(self.pending_bets):
            bet_count_error = True
        return len(self.bets), len(self.settled_bets), len(self.winning_bets), len(self.losing_bets), len(self.refunded_bets), len(self.pending_bets), bet_count_error

    def _get_settled_bets(self):
        settled_bets = [bet for bet in self.bets if bet.status == 'Settled']
        return settled_bets

    def _get_winning_bets(self):
        winning_bets = [bet for bet in self.bets if bet.status == 'Settled' and bet.result == "Win"]
        return winning_bets

    def _get_losing_bets(self):
        # Filter settled bets without an additional SQL query
        losing_bets = [bet for bet in self.bets if bet.status == 'Settled' and bet.result == "Loss"]
        return losing_bets

    def _get_refunded_bets(self):
        refunded_bets = [bet for bet in self.bets if bet.status == 'Settled' and bet.result == "Refunded"]
        return refunded_bets

    def _get_pending_bets(self):
        pending_bets = [bet for bet in self.bets if bet.status == 'Pending']
        return pending_bets

    def get_bets(self):
        return self.bets

    def get_profits(self):
        profits = 0.00
        for bet in self.bets:
            if bet.status == 'Settled':
                if bet.result == 'Win':
                    profits += bet.potential_win_amount
                elif bet.result == 'Loss':
                    profits -= bet.stake_amount
        return profits

    def get_roi(self):
        profits = self.get_profits()
        total_stake = 0.00
        for bet in self.bets:
            if bet.status == 'Settled' and bet.result != 'Refunded':
                if bet.result == 'Win':
                    total_stake += bet.stake_amount
                elif bet.result == 'Loss':
                    total_stake += bet.stake_amount
        if total_stake == 0:
            return 0.00
        roi = (profits / total_stake) * 100

        return roi

    def get_bets_by_filter(self, filtering_start_date: datetime = None, filtering_end_date: datetime = None, filtering_status: str = None) -> list:
        filtered_bets = []
        local_tz = pytz.timezone('America/Montreal')
        utc = pytz.utc

        for bet in self.bets:
            if filtering_start_date:
                # Make sure both dates are in same format and same time zone
                datetime_event_date = datetime.strptime(bet.event_date, '%Y-%m-%d %H:%M:%S')
                datetime_event_date = datetime_event_date.replace(tzinfo=utc).astimezone(local_tz)
                if filtering_start_date > datetime_event_date:
                    # Bet isn't "valid"
                    continue
            if filtering_end_date:
                # Make sure both dates are in same format and same time zone
                datetime_event_date = datetime.strptime(bet.event_date, '%Y-%m-%d %H:%M:%S')
                datetime_event_date = datetime_event_date.replace(tzinfo=utc).astimezone(local_tz)
                if filtering_end_date < datetime_event_date:
                    # Bet isn't "valid"
                    continue

            if filtering_status:
                if bet.status != filtering_status:
                    # Bet isn't "valid"
                    continue

            # If we make it here in our loop, bet is "valid" and should be appended to our filtered bet list
            filtered_bets.append(bet)

        return filtered_bets
