from datetime import datetime
import pytz
from flask_login import current_user
from app.bet_model import Bet
from app.utility_time_zone import UtilityTimeZone


class Service:

    @staticmethod
    def get_cappers_stats_for_a_date(date: str) -> {}:
        utc_start = UtilityTimeZone.get_day_start_datetime_utc(date)
        utc_end = UtilityTimeZone.get_day_end_datetime_utc(date)

        stats = {}
        sorted_capper_stats = {}
        bets = Bet.get_bets_for_day(utc_start, utc_end)
        for bet in bets:
            if bet.capper:
                if bet.capper not in stats:
                    stats[bet.capper] = {
                        "bets": 0,
                        "winning_bets": 0,
                        "losing_bets": 0,
                        "refunded_bets": 0,
                        "pending_bets": 0,
                        "settled_bets": 0,
                        "profits": 0,
                        "total_stake": 0,
                        "roi": 0.00,
                    }

                stats[bet.capper]['bets'] += 1
                if bet.status == "Settled":
                    stats[bet.capper]['settled_bets'] += 1
                    if bet.result == "Win":
                        stats[bet.capper]['winning_bets'] += 1
                        stats[bet.capper]['total_stake'] += bet.stake_amount
                        stats[bet.capper]['profits'] += bet.potential_win_amount
                    elif bet.result == "Loss":
                        stats[bet.capper]['losing_bets'] += 1
                        stats[bet.capper]['total_stake'] += bet.stake_amount
                        stats[bet.capper]['profits'] -= bet.stake_amount
                    elif bet.result == "Refunded":
                        stats[bet.capper]['refunded_bets'] += 1
                else:
                    stats[bet.capper]['pending_bets'] += 1

            for capper, capper_stats in stats.items():
                if capper_stats['total_stake'] > 0:
                    capper_stats['roi'] = (capper_stats['profits'] / capper_stats['total_stake']) * 100

            # Sort the stats dictionary by 'profits' in descending order
            sorted_capper_stats = dict(sorted(stats.items(), key=lambda x: x[1]['profits'], reverse=True))

        return sorted_capper_stats

    @staticmethod
    def fetch_bets_for_date(date: datetime):
        user_timezone = UtilityTimeZone.get_user_timezone()
        # Localize the naive datetime (without time) to the user's timezone
        start_local = user_timezone.localize(
            datetime(year=date.year, month=date.month, day=date.day, hour=0, minute=0, second=0))
        end_local = user_timezone.localize(
            datetime(year=date.year, month=date.month, day=date.day, hour=23, minute=59, second=59))

        # Convert the localized time to UTC
        start_utc = start_local.astimezone(pytz.utc)
        end_utc = end_local.astimezone(pytz.utc)

        # Fetch bets by filtering event_date in UTC
        result_bets = Bet.query.filter(Bet.event_date >= start_utc, Bet.event_date < end_utc, Bet.account_id == current_user.get_id()).all()

        # Convert event_date to user's timezone and calculate profit
        current_profit = 0
        for bet in result_bets:
            bet.event_date = UtilityTimeZone.convert_utc_datetime_to_user_time_zone(bet.event_date)
            if bet.status == "Settled" and bet.result == "Win":
                current_profit += bet.potential_win_amount
            elif bet.status == "Settled" and bet.result == "Loss":
                current_profit -= bet.stake_amount

        # Separate settled and pending/accepted bets
        settled_bets = [bet for bet in result_bets if bet.status == 'Settled']
        pending_bets = [bet for bet in result_bets if bet.status in ['Pending', 'Accepted']]

        # Sort both groups by event date
        settled_bets.sort(key=lambda settled_bet: settled_bet.event_date)
        pending_bets.sort(key=lambda pending_bet: pending_bet.event_date)

        # Combine settled bets at the top, pending/accepted bets at the bottom
        sorted_bets = settled_bets + pending_bets

        # Calculate statistics
        num_pending = len(pending_bets)
        total_stake_pending = sum(bet.stake_amount for bet in pending_bets)

        return sorted_bets, num_pending, total_stake_pending, current_profit
