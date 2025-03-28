from sqlalchemy import text
from app import db
from datetime import datetime


class SportslineQueries:
    @staticmethod
    def get_all_sportsline_cappers():

        query = text("""
            SELECT
                capper,
                COUNT(*) as bet_count,
                ROUND(SUM(CASE 
                        WHEN result = 'WIN' THEN returns::NUMERIC  -- Cast to NUMERIC for rounding
                        WHEN result = 'LOSS' THEN -units::NUMERIC  -- Cast to NUMERIC for rounding
                        ELSE 0  -- Ignore units for pushes
                    END), 2) AS returns,  -- Round returns to 2 decimal places
                SUM(CASE WHEN result = 'WIN' THEN 1 ELSE 0 END) AS win_count,
                SUM(CASE WHEN result = 'LOSS' THEN 1 ELSE 0 END) AS loss_count,
                SUM(CASE WHEN result = 'PUSH' THEN 1 ELSE 0 END) AS push_count
            FROM 
                sportsline
            GROUP BY
                capper
            ORDER BY
                capper ASC
        """)

        sportsline_cappers = db.session.execute(query).mappings().fetchall()

        return sportsline_cappers

    @staticmethod
    def get_capper_lifetime_returns(capper: str):
        query = text("""
            SELECT 
                ROUND(SUM(CASE 
                        WHEN result = 'WIN' THEN returns::NUMERIC
                        WHEN result = 'LOSS' THEN -units::NUMERIC
                        ELSE 0
                    END), 2) AS returns,
                SUM(units) AS total_wagered,  -- Total units wagered
                ROUND(
                    CASE 
                        WHEN SUM(units) > 0 THEN (SUM(CASE 
                            WHEN result = 'WIN' THEN returns::NUMERIC
                            WHEN result = 'LOSS' THEN -units::NUMERIC
                            ELSE 0
                        END) / SUM(units::NUMERIC)) * 100  -- Calculate ROI percentage
                        ELSE 0
                    END, 2
                ) AS roi,  -- Round ROI to 2 decimal places
                SUM(CASE WHEN result = 'WIN' THEN 1 ELSE 0 END) AS win_count,
                SUM(CASE WHEN result = 'LOSS' THEN 1 ELSE 0 END) AS loss_count,
                SUM(CASE WHEN result = 'PUSH' THEN 1 ELSE 0 END) AS push_count
            FROM 
                sportsline
            WHERE
                capper = :capper
        """)

        returns = db.session.execute(query, {
            'capper': capper
        }).mappings().fetchone()

        return returns

    @staticmethod
    def get_capper_yearly_returns(capper: str):
        query = text("""
                SELECT 
                    EXTRACT(YEAR FROM date) AS year,
                    capper,
                    SUM(CASE 
                            WHEN result = 'WIN' THEN returns
                            WHEN result = 'LOSS' THEN -units
                            ELSE 0  -- Ignore units for pushes
                        END) AS returns,
                    SUM(CASE WHEN result = 'WIN' THEN 1 ELSE 0 END) AS win_count,
                    SUM(CASE WHEN result = 'LOSS' THEN 1 ELSE 0 END) AS loss_count,
                    SUM(CASE WHEN result = 'PUSH' THEN 1 ELSE 0 END) AS push_count
                FROM 
                    sportsline
                WHERE 
                    capper = :capper
                GROUP BY 
                    capper, year
                ORDER BY 
                    capper, year DESC;
            """)

        yearly_returns_by_sport = db.session.execute(query, {
            'capper': capper
        }).mappings().fetchall()

        return yearly_returns_by_sport

    @staticmethod
    def get_capper_returns_by_sport(capper: str):
        query = text("""
                SELECT 
                    capper,
                    league,
                    SUM(CASE 
                            WHEN result = 'WIN' THEN returns
                            WHEN result = 'LOSS' THEN -units
                            ELSE 0  -- Ignore units for pushes
                        END) AS returns,
                    SUM(CASE WHEN result = 'WIN' THEN 1 ELSE 0 END) AS win_count,
                    SUM(CASE WHEN result = 'LOSS' THEN 1 ELSE 0 END) AS loss_count,
                    SUM(CASE WHEN result = 'PUSH' THEN 1 ELSE 0 END) AS push_count
                FROM 
                    sportsline
                WHERE 
                    capper = :capper
                GROUP BY 
                    capper, league
                ORDER BY 
                    capper, league;
            """)

        yearly_returns = db.session.execute(query, {
            'capper': capper
        }).mappings().fetchall()

        return yearly_returns

    @staticmethod
    def get_capper_yearly_returns_by_sport(capper: str):
        query = text("""
            SELECT 
                EXTRACT(YEAR FROM date) AS year,
                capper,
                league,
                SUM(CASE 
                        WHEN result = 'WIN' THEN returns
                        WHEN result = 'LOSS' THEN -units
                        ELSE 0  -- Ignore units for pushes
                    END) AS returns,
                SUM(CASE WHEN result = 'WIN' THEN 1 ELSE 0 END) AS win_count,
                SUM(CASE WHEN result = 'LOSS' THEN 1 ELSE 0 END) AS loss_count,
                SUM(CASE WHEN result = 'PUSH' THEN 1 ELSE 0 END) AS push_count
            FROM 
                sportsline
            WHERE 
                capper = :capper
            GROUP BY 
                capper, year, league
            ORDER BY 
                capper, year DESC, league;
        """)

        yearly_returns_by_sport = db.session.execute(query, {
            'capper': capper
        }).mappings().fetchall()

        return yearly_returns_by_sport

    @staticmethod
    def get_capper_returns_by_market(capper: str):
        query = text("""
                SELECT 
                    EXTRACT(YEAR FROM date) AS year,
                    capper,
                    league,
                    market,
                    SUM(CASE 
                            WHEN result = 'WIN' THEN returns
                            WHEN result = 'LOSS' THEN -units
                            ELSE 0  -- Ignore units for pushes
                        END) AS returns,
                    SUM(CASE WHEN result = 'WIN' THEN 1 ELSE 0 END) AS win_count,
                    SUM(CASE WHEN result = 'LOSS' THEN 1 ELSE 0 END) AS loss_count,
                    SUM(CASE WHEN result = 'PUSH' THEN 1 ELSE 0 END) AS push_count
                FROM 
                    sportsline
                WHERE 
                    capper = :capper
                GROUP BY 
                    capper, year, league, market
                ORDER BY 
                    capper, year DESC, league, market;
            """)

        returns_by_market = db.session.execute(query, {
            'capper': capper
        }).mappings().fetchall()

        return returns_by_market

    @staticmethod
    def get_current_league_winning_cappers(league: str, start_date: datetime):
        query = text("""
            WITH roi_calculation AS (
                SELECT 
                    league, 
                    capper,
                        COUNT(sportsline_id) as bet_count,
                    ROUND(SUM(CASE 
                            WHEN result = 'WIN' THEN returns::NUMERIC
                            WHEN result = 'LOSS' THEN -units::NUMERIC
                            ELSE 0
                        END), 2) AS returns,
                    SUM(units) AS total_wagered,  -- Total units wagered
                    ROUND(
                        CASE 
                            WHEN SUM(units) > 0 THEN (SUM(CASE 
                                WHEN result = 'WIN' THEN returns::NUMERIC
                                WHEN result = 'LOSS' THEN -units::NUMERIC
                                ELSE 0
                            END) / SUM(units::NUMERIC)) * 100  -- Calculate ROI percentage
                            ELSE 0
                        END, 2
                    ) AS roi,  -- Round ROI to 2 decimal places
                    SUM(CASE WHEN result = 'WIN' THEN 1 ELSE 0 END) AS win_count,
                    SUM(CASE WHEN result = 'LOSS' THEN 1 ELSE 0 END) AS loss_count,
                    SUM(CASE WHEN result = 'PUSH' THEN 1 ELSE 0 END) AS push_count
                FROM 
                    sportsline
                WHERE 
                    date > :start_date
                    and league = :league    
                GROUP BY 
                    league, capper
            )
            SELECT *
            FROM roi_calculation
            WHERE bet_count > 1 
              AND roi > 0
            ORDER BY returns DESC, roi DESC;
        """)

        cappers = db.session.execute(query, {
            'league': league,
            'start_date': start_date
        }).mappings().fetchall()

        return cappers
