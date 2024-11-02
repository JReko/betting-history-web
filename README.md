## Overview

This application is designed to help you track your bets and analyze your betting activity. It allows you to monitor individual bets, calculate profits and losses, and track the performance of cappers or tipsters who provide betting recommendations. With comprehensive features for filtering, sorting, and visualizing your betting data, this app makes it easy to stay informed and make data-driven decisions about your bets.

## Key Features

### 1. **Bet Tracking**
- **Record bets**: Log each bet with specific details such as odds, book, match, pick, stake, potential win amount, event date, and result.
- **Odds format**: Easily enter the American odds for your bets (e.g., +110, -225).
- **Track bet status**: Monitor whether bets are won, lost, pending, or in progress.
- **Filter by sports and dates**: Review your betting performance across different sports and time periods (daily, monthly, yearly).

### 2. **Profit and Loss Tracking**
- **Daily, Monthly, and Yearly Reports**: View your total profits and losses over different time frames. 
- **Detailed calculations**: For settled bets, the app automatically calculates profits by summing potential win amounts for wins and subtracting the stake amounts for losses.
- **Profit Calendar View**: A calendar grid shows profits or losses for each day, giving you a clear view of your betting performance over time.

### 3. **Capper/Tipster Tracking**
- **Capper statistics**: Monitor the performance of individual cappers who recommend bets, with detailed stats on the number of bets placed, wins, losses, and pending outcomes.
- **Capper profit and ROI**: Analyze the overall profitability of each capper, including metrics like total profit and return on investment (ROI).
- **Capper reports**: Generate daily or overall reports on capper performance, making it easy to track who is delivering results.

### 4. **Multi-Bet Tracking**
- Support for tracking **multi-bets** (parlays), with win conditions and potential outcomes based on multiple selections.
  
### 5. **Data Import and Export**
- Import bet data from popular bookmakers such as Pinnacle, Bet365, and Bet99.
- Easily export your bet data for backup or further analysis.

### 6. **Accounts and Profiles**
- **User profiles**: Create and manage user accounts with customizable time zones.
- **Session management**: Secure login and session handling for each user.
- **Power users**: Special access for power users to manage accounts and edit data.

### 7. **Heroku**

#### Setup

- `heroku create betting-history-web`
- `heroku addons:create heroku-postgresql:essential-0`
- `DATABASE_URL` is automatically populated in the heroku environment
- `heroku config:get DATABASE_URL` if you want to actually see it from your own eyes

#### Migrate
- `heroku run flask db upgrade`

#### Backup
- `heroku pg:backups`
- `heroku pg:backups:capture --app betting-history-web`

#### Automated Backup
- `heroku pg:backups:schedule DATABASE_URL --at '04:00 America/Montreal' --app betting-history-web`
- `heroku pg:backups --app betting-history-web`

#### Local to heroku
- `docker exec -it bet_tracking_postgres pg_dump --no-acl --no-owner -U local_user -d betting_history_web > dump_now.sql`
- `heroku pg:psql DATABASE_URL --app betting-history-web < dump_now.sql`
- For whatever reason I cannot get their over http link import to work, it never downloads the sql file at all and I've confirmed many times that it's publicly available

### Heroku to local (binary dump format)
- `heroku pg:backups:capture --app betting-history-web` to capture current state
- `heroku pg:backups:download --app betting-history-web` to download latest backup to local
- `docker cp ./latest.dump bet_tracking_postgres:/tmp/latest.dump` to copy our dump into the container
- `docker exec -it bet_tracking_postgres pg_restore --verbose --clean --no-acl --no-owner -h localhost -U local_user -d betting_history_web /tmp/latest.dump` to restore

#### Logs
- `heroku logs --tail`

### 8. ** Conventional commits **
- From: https://www.conventionalcommits.org/en/v1.0.0/
- Setup local (project): git hook to enforce them
  - Using: https://github.com/tapsellorg/conventional-commits-git-hook
