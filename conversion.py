import json
import sqlite3
import os
from datetime import datetime
import pytz

# Path to your JSON files
JSON_FILES_PATH = '/Users/franciscaisse/workspace/repos/betting-history-web'
# SQLite database file
DATABASE_FILE = 'bets.db'
# Define your timezone
USER_TIMEZONE = pytz.timezone('America/Montreal')


# Connect to SQLite database
def connect_db():
    conn = sqlite3.connect(DATABASE_FILE)
    return conn


# Create tables if they don't exist
def create_tables(conn):
    with conn:
        conn.execute('''
            CREATE TABLE IF NOT EXISTS bets (
                bet_id TEXT PRIMARY KEY,
                sport TEXT,
                status TEXT,
                result TEXT,
                capper TEXT,
                stake_amount REAL,
                potential_win_amount REAL,
                line INTEGER,
                multi_bet BOOLEAN,
                match TEXT,
                pick TEXT,
                date_accepted TEXT,
                event_date TEXT
            )
        ''')
        conn.execute('''
            CREATE TABLE IF NOT EXISTS multi_bet_win_conditions (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                bet_id TEXT,
                match TEXT,
                pick TEXT,
                legs INTEGER,
                odds TEXT,
                FOREIGN KEY (bet_id) REFERENCES bets (bet_id)
            )
        ''')


# Convert local timezone to UTC
def convert_to_utc(local_date_str):
    # Parse the local date string (assuming format: 'YYYY-MM-DD HH:MM:SS')
    local_date = datetime.strptime(local_date_str, '%Y-%m-%d %H:%M:%S')

    # Localize the date to the user's timezone and convert to UTC
    local_date = USER_TIMEZONE.localize(local_date)
    utc_date = local_date.astimezone(pytz.utc)

    # Return the date as a string in the same format but now in UTC
    return utc_date.strftime('%Y-%m-%d %H:%M:%S')


# Insert a single bet into the database
def insert_bet(conn, bet):
    # Convert dates to UTC
    date_accepted_utc = convert_to_utc(bet.get('date_accepted')) if bet.get('date_accepted') else None
    event_date_utc = convert_to_utc(bet.get('event_date')) if bet.get('event_date') else None

    with conn:
        conn.execute('''
            INSERT OR REPLACE INTO bets (
                bet_id, sport, status, result, capper, stake_amount,
                potential_win_amount, line, multi_bet, match, pick,
                date_accepted, event_date
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', (
            bet.get('bet_id'),
            bet.get('sport'),
            bet.get('status'),
            bet.get('result'),
            bet.get('capper'),
            bet.get('stake_amount'),
            bet.get('potential_win_amount'),
            bet.get('line'),
            bet.get('multi_bet'),
            bet.get('match'),
            bet.get('pick'),
            date_accepted_utc,
            event_date_utc
        ))

        # Insert multi_bet_win_conditions if present
        for condition in bet.get('multi_bet_win_conditions', []):
            conn.execute('''
                INSERT INTO multi_bet_win_conditions (
                    bet_id, match, pick, legs, odds
                ) VALUES (?, ?, ?, ?, ?)
            ''', (
                bet.get('bet_id'),
                condition.get('match'),
                condition.get('pick'),
                condition.get('legs'),
                condition.get('odds')
            ))


# Process JSON files
def process_json_files(conn):
    for filename in os.listdir(JSON_FILES_PATH):
        if filename.endswith('.json'):
            file_path = os.path.join(JSON_FILES_PATH, filename)
            with open(file_path, 'r') as file:
                bets = json.load(file)
                if isinstance(bets, list):
                    for bet in bets:
                        insert_bet(conn, bet)
                else:
                    insert_bet(conn, bets)


def main():
    conn = connect_db()
    create_tables(conn)
    process_json_files(conn)
    conn.close()


if __name__ == '__main__':
    main()
