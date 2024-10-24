from datetime import datetime

from flask_login import current_user
from sqlalchemy import text
from app import db
from app.bet_model import Bet
from app.utility_time_zone import UtilityTimeZone


class BetQueries:
    @staticmethod
    def get_bets_for_date(date_datetime: datetime) -> list:
        query = text("""
            SELECT
                bet_id,
                book,
                sport,
                match,
                pick,
                stake_amount,
                line,
                event_date AT TIME ZONE 'UTC' AT TIME ZONE :user_timezone as event_date,
                capper,
                potential_win_amount,
                status,
                result
            FROM
                bets
            WHERE
                account_id = :account_id
                AND event_date >= :start
                AND event_date < :end
        """)

        bets = db.session.execute(query, {
            'account_id': current_user.get_id(),
            'user_timezone': current_user.get_timezone(),
            'start': UtilityTimeZone.get_day_start_datetime_utc(date_datetime.strftime("%Y-%m-%d")),
            'end': UtilityTimeZone.get_day_end_datetime_utc(date_datetime.strftime("%Y-%m-%d")),
        }).mappings().fetchall()

        return bets

    @staticmethod
    def get_bets_for_day_by_sport(date_datetime: datetime) -> list:
        query = text("""
            SELECT
               sport,
               COUNT(*) AS total_bets_count,
               SUM(CASE WHEN result IS NOT NULL THEN 1 ELSE 0 END) AS settled_bets_count,
               SUM(CASE WHEN result IS NULL THEN 1 ELSE 0 END) AS pending_bets_count,
               SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) AS winning_bets_count,
               SUM(CASE WHEN result = 'Loss' THEN 1 ELSE 0 END) AS losing_bets_count,
               SUM(CASE WHEN result = 'Refunded' THEN 1 ELSE 0 END) AS refunded_bets_count,
               SUM(CASE 
                       WHEN result = 'Win' THEN potential_win_amount
                       WHEN result = 'Loss' THEN -stake_amount
                       ELSE 0 
                   END) AS profits,
               SUM(CASE 
                       WHEN result IS NOT NULL AND result != 'Refunded' THEN stake_amount
                       ELSE 0 
                   END) AS total_stake
            FROM 
                bets
            WHERE 
                account_id = :account_id
                AND event_date >= :start
                AND event_date < :end
            GROUP BY 
                sport
            ORDER BY 
                profits DESC
        """)

        # Execute the query and pass the start/end of day in the user's timezone along with the timezone
        by_sport_results = db.session.execute(query, {
            'start': UtilityTimeZone.get_day_start_datetime_utc(date_datetime.strftime("%Y-%m-%d")),
            'end': UtilityTimeZone.get_day_end_datetime_utc(date_datetime.strftime("%Y-%m-%d")),
            'account_id': current_user.get_id(),
            'user_timezone': current_user.get_timezone(),
        }).mappings().fetchall()

        return by_sport_results

    @staticmethod
    def get_bets_for_day_by_capper(date_datetime: datetime) -> list:
        query = text("""
               SELECT
                   capper,
                   COUNT(*) AS total_bets_count,
                   SUM(CASE WHEN result IS NOT NULL THEN 1 ELSE 0 END) AS settled_bets_count,
                   SUM(CASE WHEN result IS NULL THEN 1 ELSE 0 END) AS pending_bets_count,
                   SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) AS winning_bets_count,
                   SUM(CASE WHEN result = 'Loss' THEN 1 ELSE 0 END) AS losing_bets_count,
                   SUM(CASE WHEN result = 'Refunded' THEN 1 ELSE 0 END) AS refunded_bets_count,
                   SUM(CASE 
                           WHEN result = 'Win' THEN potential_win_amount
                           WHEN result = 'Loss' THEN -stake_amount
                           ELSE 0 
                       END) AS profits,
                   SUM(CASE 
                           WHEN result IS NOT NULL AND result != 'Refunded' THEN stake_amount
                           ELSE 0 
                       END) AS total_stake
               FROM 
                   bets
               WHERE 
                   account_id = :account_id
                   AND event_date >= :start
                   AND event_date < :end
               GROUP BY 
                   capper
               ORDER BY 
                   profits DESC
           """)

        # Execute the query and pass the start/end of day in the user's timezone along with the timezone
        by_capper_results = db.session.execute(query, {
            'start': UtilityTimeZone.get_day_start_datetime_utc(date_datetime.strftime("%Y-%m-%d")),
            'end': UtilityTimeZone.get_day_end_datetime_utc(date_datetime.strftime("%Y-%m-%d")),
            'account_id': current_user.get_id(),
            'user_timezone': current_user.get_timezone(),
        }).mappings().fetchall()

        return by_capper_results

    @staticmethod
    def get_settled_bets_by_month():
        query = text("""
                SELECT
                    DATE_TRUNC('month', event_date AT TIME ZONE 'UTC' AT TIME ZONE :timezone) AS month,
                    SUM(CASE WHEN result IS NOT NULL THEN 1 ELSE 0 END) AS settled_bets_count,
                    SUM(CASE WHEN result IS NULL THEN 1 ELSE 0 END) AS pending_bets_count,
                    SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) AS winning_bets_count,
                    SUM(CASE WHEN result = 'Loss' THEN 1 ELSE 0 END) AS losing_bets_count,
                    SUM(CASE WHEN result = 'Refunded' THEN 1 ELSE 0 END) AS refunded_bets_count,
                    SUM(CASE 
                           WHEN result = 'Win' THEN potential_win_amount
                           WHEN result = 'Loss' THEN -stake_amount
                           ELSE 0 
                       END) AS profits,
                    SUM(CASE 
                           WHEN result IS NOT NULL AND result != 'Refunded' THEN stake_amount
                           ELSE 0 
                       END) AS total_stake
                FROM bets
                WHERE 
                    account_id = :account_id
                    AND status = 'Settled'
                GROUP BY DATE_TRUNC('month', event_date AT TIME ZONE 'UTC' AT TIME ZONE :timezone)
                ORDER BY month ASC
            """)

        results = db.session.execute(query, {
            'account_id': current_user.get_id(),
            'timezone': current_user.get_timezone(),
        }).mappings().fetchall()

        return results

    @staticmethod
    def get_bet_by_id(bet_id, user_timezone: str) -> Bet:
        query = text("""
                    SELECT
                        *,
                        event_date AT TIME ZONE 'UTC' AT TIME ZONE :user_timezone AS event_date_localized
                    FROM bets
                    WHERE
                        bet_id = :id
                        AND account_id = :account_id
                """)

        bet = db.session.execute(query, {
            'account_id': current_user.get_id(),
            'id': bet_id,
            'user_timezone': user_timezone,
        }).fetchone()

        return bet
