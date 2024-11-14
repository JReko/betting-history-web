import re
from bs4 import BeautifulSoup
from datetime import datetime

from flask import abort

from app import db
from app.bet_model import Bet
from app.settings_model import Settings
from app.utility_time_zone import UtilityTimeZone
from flask_login import current_user


class PinnacleBetPageScraper:

    def __init__(self, webpage: str):
        self.webpage = webpage
        with open(webpage, 'r', encoding='utf-8') as file:
            html_content = file.read()

        soup = BeautifulSoup(html_content, 'html.parser')

        html_bets = soup.find_all('div', {'class': '', 'data-test-id': 'BetResultsTable-BetCard-Details-Wrapper'})

        self.html_bets = html_bets

        # Query to get sport league values directly as a flat list
        self.sport_leagues = db.session.query(Settings.value).filter_by(name='sport_league').all()
        self.sport_leagues = [result[0] for result in self.sport_leagues]

    def get_bet_count(self):
        return len(self.html_bets)

    def import_bet(self) -> {}:
        bet = self.html_bets.pop()

        # Bet number
        inner_div_bet_number = bet.find('div', class_='dataPoint-KuKWdXUdiS betId-PSO7kpwKIQ')
        # Format should be: Bet no.#2020077384
        unprocessed_bet_number_string = inner_div_bet_number.get_text(strip=True)
        processed_bet_number_string = unprocessed_bet_number_string.replace('Bet no.#', '')
        if processed_bet_number_string == '2027441288':
            return {'success': True}

        # Status & result
        inner_div_status = bet.find('div', class_='dataPoint-KuKWdXUdiS betStatusWrapper-ixgXdz7obf')
        spans_result = inner_div_status.find_all('span')
        status = spans_result[0].get_text(strip=True)
        status = "Pending" if status == "Accepted" else status
        result = None

        # Refunded is simply "Refunded"
        if status == "Refunded":
            status = "Settled"
            result = "Refunded"
        # Other cases are like
        # "Settled - Win"
        # "Settled - Loss"
        elif status == "Settled":
            result = spans_result[2].get_text(strip=True)

        # Multi bet and/or parlay
        span_multiple = bet.find_all('span')
        multi_bet = False
        multi_bet_string = span_multiple[2].get_text(strip=True)
        if multi_bet_string == "Multiples" or multi_bet_string == "Teaser":
            multi_bet = True

        # 1st - sport
        i_element = bet.find('i', class_=re.compile(r'^sportIcon-'))
        sport = 'n/a'
        if i_element:
            sport = i_element['class'][0].replace('icon-', '')

        # Event information
        div = bet.find('div', class_=re.compile(r'^marketLeague-'))
        event_information_text = None
        if div:
            event_information_text = div.get_text()
            # Hockey
            if sport == "hockey" and "NHL" in event_information_text.upper():
                sport = f"{sport} - NHL"
            # Tennis
            elif sport == "tennis" and "ATP" in event_information_text.upper():
                sport = f"{sport} - ATP"
            elif sport == "tennis" and "WTA" in event_information_text.upper():
                sport = f"{sport} - WTA"
            # Baseball
            elif sport == "baseball" and "MLB" in event_information_text.upper():
                sport = f"{sport} - MLB"
            elif sport == "baseball" and "KOREA" in event_information_text.upper():
                sport = f"{sport} - KBO"
            # Football
            elif sport == "football" and "NFL" in event_information_text.upper():
                sport = f"{sport} - NFL"
            elif sport == "football" and "NCAA" in event_information_text.upper():
                sport = f"{sport} - NCAA"
            # Basketball
            elif sport == "basketball" and "NBA" in event_information_text.upper():
                sport = f"{sport} - NBA"
            elif sport == "basketball" and "NCAA" in event_information_text.upper():
                sport = f"{sport} - NCAA"
            elif sport == "basketball" and "EUROLEAGUE" in event_information_text.upper():
                sport = f"{sport} - Euroleague"
            elif sport == "basketball" and "EUROCUP" in event_information_text.upper():
                sport = f"{sport} - Eurocup"
            elif sport == "basketball" and "CBA" in event_information_text.upper():
                sport = f"{sport} - CBA"
            elif sport == "basketball" and "KOREAN" in event_information_text.upper():
                sport = f"{sport} - KBL"
            # MMA
            elif sport == "mma" and "UFC" in event_information_text.upper():
                sport = f"{sport} - UFC"
            elif sport == "mma" and "PFL" in event_information_text.upper():
                sport = f"{sport} - PFL"

        if sport not in self.sport_leagues:
            if event_information_text is None:
                return {'success': False, 'error': f"{processed_bet_number_string} isn't fully de-collapsed"}
            return {'success': False, 'error': f"Error: Unrecognized sport/league {sport} ===  {event_information_text} === {processed_bet_number_string}"}

        # *** Stake & potential win amounts
        div = bet.find('div', class_="rightAlignment-aAUDqtTzac")
        spans = div.find_all('span')
        if result == "Refunded":
            # 00 = {Tag} < span > Betno. < / span >
            # 01 = {Tag} < span > Refunded < / span >
            # 02 = {Tag} < span > Accepted: < / span >
            # 03 = {Tag} < span > Nov 3, 2024, 11: 18PM < / span >
            # 04 = {Tag} < span > Stake: < / span >
            # 05 = {Tag} < span > 5.00 < / span >
            # 06 = {Tag} < span > Win: < / span >
            # 07 = {Tag} < span > 4.81 < / span >
            # 8 = {Tag} < span > Payout: < / span >
            # 9 = {Tag} < span > 9.81 < / span >
            stake_amount = float(spans[5].get_text(strip=True))
            potential_win_amount = float(spans[7].get_text(strip=True))
        elif status == "Pending":
            # 0 = {Tag} <span>Bet no.</span>
            # 1 = {Tag} <span>Pending</span>
            # 2 = {Tag} <span>Stake:</span>
            # 3 = {Tag} <span>30.00</span>
            # 4 = {Tag} <span>Win:</span>
            # 5 = {Tag} <span>37.01</span>
            # 6 = {Tag} <span>Payout:</span>
            # 7 = {Tag} <span>67.01</span>
            stake_amount = float(spans[3].get_text(strip=True))
            potential_win_amount = float(spans[5].get_text(strip=True))
        elif status == "Settled":
            # 00 = {Tag} <span>Bet no.</span>
            # 01 = {Tag} <span>Settled</span>
            # 02 = {Tag} <span class="separator-GARCq8ihwt"> – </span>
            # 03 = {Tag} <span>Win</span>
            # 04 = {Tag} <span>Accepted:</span>
            # 05 = {Tag} <span>Oct 23, 2024, 6:28 PM</span>
            # 06 = {Tag} <span>Stake:</span>
            # 07 = {Tag} <span>15.00</span>
            # 08 = {Tag} <span>Win:</span>
            # 09 = {Tag} <span>15.53</span>
            # 10 = {Tag} <span>Payout:</span>
            # 11 = {Tag} <span>30.53</span>
            stake_amount = float(spans[7].get_text(strip=True))
            potential_win_amount = float(spans[9].get_text(strip=True))

        # *** line
        div = bet.find('div', class_=re.compile(r'^odds-'))
        line = div.get_text().replace('@', '').replace('+', '').strip()

        # *** match
        inner_div_value = bet.find('div', class_=re.compile(r'^matchName-'))

        multi_bet_win_conditions = []
        if multi_bet:
            full_parlay_odds = line
            matches = bet.find_all('div', class_=re.compile(r'^matchName-'))
            picks = bet.find_all('div', class_=re.compile(r'^selection-'))
            legs = len(matches)
            for i in range(legs):
                match = matches[i].get_text(strip=True)
                pick = picks[i].get_text(strip=True)
                multi_bet_win_conditions.append({
                    "match": match,
                    "pick": pick,
                    "legs": legs,
                    "odds": full_parlay_odds,
                })
            match = f'{legs} legs parlay'
        else:
            inner_div_value = bet.find('div', class_=re.compile(r'^matchName-'))
            match = (inner_div_value.get_text()
                     .replace('(Sets)', '')
                     .replace('(Games)', '')
                     .replace('(Hits Allowed)', '')
                     .replace('(must start)', '')
                     .strip())
            # Fix: LiveKaren Khachanov (Sets) vs Ugo Humbert (Sets)
            if inner_div_value.get_text().startswith('Live'):
                match = match[4:] + ' (live)'

        # Event date
        event_date_datetime = None
        if multi_bet:
            divs = bet.find_all('div', class_="container-_la1MytHEJ")
            for div in divs:
                spans = div.find_all('span')
                event_date_string = spans[2].get_text()
                event_date_datetime_tmp = datetime.strptime(event_date_string, "%a, %b %d, %Y, %H:%M")
                if event_date_datetime is None:
                    event_date_datetime = event_date_datetime_tmp
                elif event_date_datetime_tmp < event_date_datetime:
                    event_date_datetime = event_date_datetime_tmp
        else:
            div = bet.find('div', class_="container-_la1MytHEJ")
            if not div:
                return {'success': False, 'error': f"{processed_bet_number_string} isn't fully de-collapsed"}
            spans = div.find_all('span')
            event_date_string = spans[2].get_text()
            event_date_datetime = datetime.strptime(event_date_string, "%a, %b %d, %Y, %H:%M")

        # *** Pick
        pick = ""
        if multi_bet:
            for leg in multi_bet_win_conditions:
                pick = pick + leg['pick'] + " + "
            # Remove parentheses and the text inside them, but preserve the plus signs and spaces
            pick = re.sub(r'\s*\(.*?\)', '', pick)
            # Pick at this step should have a trailing " + "
            pick = pick.rstrip(' + ')
        else:
            pick_div = bet.find('div', class_=re.compile(r'^selection-'))
            pick = pick_div.get_text().replace('(Sets) (Sets)', '(Sets)').replace('(Games) (Games)', '(Games)').strip()

        # 1st Half bets
        if event_information_text and "1ST H" in event_information_text.upper():
            pick = f"{pick} - 1H"

        event_date_datetime_localized = UtilityTimeZone.localize_datetime(event_date_datetime, current_user.get_timezone())
        event_date_datetime_utc = UtilityTimeZone.convert_datetime_to_utc(event_date_datetime_localized)

        self._store_or_update_bet({
            "bet_id": processed_bet_number_string,
            "book": "pinnacle",
            "sport": sport,
            "status": status,
            "result": result,
            "stake_amount": float(stake_amount),
            "potential_win_amount": float(potential_win_amount),
            "line": int(line),
            "multi_bet": multi_bet,
            "match": match,
            "pick": pick,
            "event_date": event_date_datetime_utc,
            "multi_bet_win_conditions": multi_bet_win_conditions,
            "capper": None,
        })

        return {'success': True}

    @staticmethod
    def _store_or_update_bet(bet_data):
        # Attempt to find the bet by its ID
        bet = Bet.query.get(bet_data.get('bet_id'))

        if bet is None:
            # Create a new bet if it doesn't exist
            bet = Bet(
                bet_id=bet_data.get('bet_id'),
                book=bet_data.get('book'),
                sport=bet_data.get('sport'),
                status=bet_data.get('status'),
                result=bet_data.get('result'),
                # capper=bet_data.get('capper', None),
                capper=None,
                stake_amount=bet_data.get('stake_amount'),
                potential_win_amount=bet_data.get('potential_win_amount'),
                line=bet_data.get('line'),
                multi_bet=bet_data.get('multi_bet'),
                match=bet_data.get('match'),
                pick=bet_data.get('pick'),
                event_date=bet_data.get('event_date'),
                account_id=current_user.get_id(),
            )
            db.session.add(bet)
        else:
            # Only update fields that are provided in bet_data
            bet.book = bet_data.get('book', bet.book)
            bet.sport = bet_data.get('sport', bet.sport)
            bet.status = bet_data.get('status', bet.status)
            bet.result = bet_data.get('result', bet.result)
            bet.stake_amount = bet_data.get('stake_amount', bet.stake_amount)
            bet.potential_win_amount = bet_data.get('potential_win_amount', bet.potential_win_amount)
            bet.line = bet_data.get('line', bet.line)
            bet.multi_bet = bet_data.get('multi_bet', bet.multi_bet)
            bet.match = bet_data.get('match', bet.match)
            bet.pick = bet_data.get('pick', bet.pick)
            bet.event_date = bet_data.get('event_date', bet.event_date)

        db.session.commit()
        return bet

    @staticmethod
    def _get_bet_by_id(bet_id: int):
        # Query the Bet table by bet_id
        bet = Bet.query.filter_by(bet_id=bet_id).first()
        return bet
