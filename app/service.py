from app.models import Bet
from app.utility_time_zone import UtilityTimeZone


class Service:

    @staticmethod
    def get_cappers_stats_for_a_date(date: str) -> {}:
        utc_start = UtilityTimeZone.get_day_start_datetime_utc(date)
        utc_end = UtilityTimeZone.get_day_end_datetime_utc(date)

        stats = {}

        capper_rows = Bet.get_distinct_cappers_for_day(utc_start, utc_end)
        bets = Bet.get_bets_for_cappers_on_day(utc_start, utc_end)

        for row in capper_rows:
            stats[row['capper']] = {
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

        for bet in bets:
            if bet.capper is None:
                continue
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

        return stats
