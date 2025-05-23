from flask_login import current_user
from sqlalchemy import text
from app import db


class CapperQueries:

    @staticmethod
    def get_all_capper_bets(capper: str) -> dict:
        query = text("""
            SELECT
                bet_id,
                capper,
                status,
                result,
                stake_amount,
                line,
                potential_win_amount,
                match,
                pick,
                book,
                sport,
                event_date AT TIME ZONE 'UTC' AT TIME ZONE :user_timezone as event_date
            FROM 
                bets
            WHERE
                account_id = :account_id
                AND capper = :capper_id
            ORDER BY 
                event_date ASC
        """)

        bets = db.session.execute(query, {
            "account_id": current_user.get_id(),
            "capper_id": capper,
            "user_timezone": current_user.get_timezone(),
        }).fetchall()

        return bets

    @staticmethod
    def get_all_capper_bets_by_sport(capper: str) -> dict:
        account_id = current_user.get_id()

        query = text("""
            SELECT
                sport,
                COUNT(*) AS total_bets_count,
                SUM(CASE WHEN result IS NOT NULL THEN 1 ELSE 0 END) AS settled_bets_count,
                SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) AS winning_bets_count,
                SUM(CASE WHEN result = 'Loss' THEN 1 ELSE 0 END) AS losing_bets_count,
                SUM(CASE WHEN result = 'Refunded' THEN 1 ELSE 0 END) AS refunded_bets_count,
                SUM(CASE 
                        WHEN result = 'Win' THEN potential_win_amount
                        WHEN result = 'Loss' THEN -stake_amount
                        ELSE 0 
                    END) AS profits,
                SUM(CASE 
                        WHEN result != 'Refunded' THEN stake_amount
                        ELSE 0 
                    END) AS total_stake
            FROM 
                bets
            WHERE 
                account_id = :account_id
                AND capper = :capper_id
            GROUP BY 
                sport
            ORDER BY 
                profits DESC
        """)

        # Execute the query and pass the start/end of day in the user's timezone along with the timezone
        by_sport_results = db.session.execute(query, {
            'account_id': account_id,
            "capper_id": capper,
        }).mappings().fetchall()

        return by_sport_results

    @staticmethod
    def get_all_capper_bets_for_day_by_sport(start_of_day, end_of_day, user_timezone='America/Montreal'):
        account_id = current_user.get_id()  # Fetch the current user's account ID

        query = text("""
            SELECT
                sport,
                COUNT(*) AS total_bets_count,
                SUM(CASE WHEN result IS NOT NULL THEN 1 ELSE 0 END) AS settled_bets_count,
                SUM(CASE WHEN result = 'Win' THEN 1 ELSE 0 END) AS winning_bets_count,
                SUM(CASE WHEN result = 'Loss' THEN 1 ELSE 0 END) AS losing_bets_count,
                SUM(CASE WHEN result = 'Refunded' THEN 1 ELSE 0 END) AS refunded_bets_count,
                SUM(CASE 
                        WHEN result = 'Win' THEN potential_win_amount
                        WHEN result = 'Loss' THEN -stake_amount
                        ELSE 0 
                    END) AS profits,
                SUM(CASE 
                        WHEN result != 'Refunded' THEN stake_amount
                        ELSE 0 
                    END) AS total_stake
            FROM 
                bets
            WHERE 
                account_id = :account_id  -- Filter by account ID
                AND event_date >= CONVERT_TZ(:start, :user_timezone, '+00:00')  -- Convert start_of_day to UTC
                AND event_date < CONVERT_TZ(:end, :user_timezone, '+00:00')    -- Convert end_of_day to UTC
            GROUP BY 
                sport
            ORDER BY 
                profits DESC
        """)

        # Execute the query and pass the start/end of day in the user's timezone along with the timezone
        by_sport_results = db.session.execute(query, {
            'start': start_of_day,
            'end': end_of_day,
            'account_id': account_id,
            'user_timezone': user_timezone
        }).mappings().fetchall()

        return by_sport_results

    @staticmethod
    def get_all_cappers_bets_by_capper():
        query = text("""
            SELECT
                capper,
                COUNT(bet_id) AS bets_count,
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
                        WHEN result != 'Refunded' THEN stake_amount
                        ELSE 0 
                    END) AS total_stake
            FROM 
                bets
            WHERE 
                capper IS NOT NULL
                AND account_id = :account_id
            GROUP BY
                capper
            """)

        # Execute the raw SQL query
        return db.session.execute(query, {"account_id": current_user.get_id()}).fetchall()

    @staticmethod
    def get_monthly_cappers_summary(start_utc, end_utc):
        """
        For the given UTC window, return per-capper aggregate stats.
        """
        query = text("""
            SELECT
                capper,
                COUNT(*)                                         AS bets_count,
                SUM(CASE WHEN result IS NOT NULL THEN 1 ELSE 0 END)  AS settled_bets,
                SUM(CASE WHEN result = 'Win'  THEN 1 ELSE 0 END)      AS wins,
                SUM(CASE WHEN result = 'Loss' THEN 1 ELSE 0 END)      AS losses,
                SUM(CASE WHEN result = 'Refunded' THEN 1 ELSE 0 END)  AS refunded,
                SUM(CASE 
                        WHEN result = 'Win'  THEN potential_win_amount
                        WHEN result = 'Loss' THEN -stake_amount
                        ELSE 0
                    END)                                           AS profit,
                SUM(CASE WHEN result != 'Refunded' THEN stake_amount ELSE 0 END)
                                                                  AS total_stake
            FROM bets
            WHERE
                account_id = :account_id
                AND event_date >= :start_utc
                AND event_date <= :end_utc
                AND capper IS NOT NULL
            GROUP BY capper
            ORDER BY profit DESC
        """)
        return db.session.execute(query, {
            "account_id": current_user.get_id(),
            "start_utc": start_utc,
            "end_utc": end_utc,
        }).mappings().fetchall()

