import re
from bs4 import BeautifulSoup
from datetime import datetime
from app import db
from app.bet_model import Bet
from app.utility_time_zone import UtilityTimeZone
from flask_login import current_user


class PinnacleBetPageScraper:

    def __init__(self, webpage: str):
        self.webpage = webpage
        with open(webpage, 'r', encoding='utf-8') as file:
            html_content = file.read()

        soup = BeautifulSoup(html_content, 'html.parser')

        html_bets = soup.find_all('div', class_='card-c719350a6bf213a150d8 row-ac7df9e621c3e0c7844e')

        self.html_bets = html_bets

    def get_bet_count(self):
        return len(self.html_bets)

    def import_bet(self):
        bet = self.html_bets.pop()

        # Bet number
        inner_div_bet_number = bet.find('div', class_='container-b2088ffeb0b0be27602c inlineBlock-b86bd0c94db92e9a487a inline-fc9adfd7f40b68777249')
        bet_number_string = inner_div_bet_number.get_text(strip=True)
        bet_number_int = bet_number_string.replace('#', '')

        # Status & result
        inner_div_status = bet.find('div', class_='betStatus-a120999df239ea8debbf')
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
        i = bet.find('i', class_='sportIcon-f1f1ca0e1862406d601d')
        sport = 'n/a'
        if i:
            sport = i['class'][0].replace('icon-', '')

        # *** Stake & potential win amounts
        divs = bet.find_all('div', class_="flex-d3c12ab93880fc84f91a")
        spans = divs[1].find_all('span')
        stake_amount = float(spans[1].get_text(strip=True))
        potential_win_amount = float(spans[3].get_text(strip=True))

        # *** line
        inner_div_value = bet.find('div', class_="container-b2088ffeb0b0be27602c inlineBlock-b86bd0c94db92e9a487a value-d122dd629b9130210a8d")
        line = inner_div_value.get_text().replace('@', '').replace('+', '').strip()

        # *** match
        inner_div_value = bet.find('div', class_="matchName-f62aab4c515282e6d47b")

        multi_bet_win_conditions = []
        if multi_bet:
            full_parlay_odds = bet.find('div', class_="participantOdds-aac8d8d5ef636ff14620").get_text()
            divs = bet.find_all('div', class_="contentRow-b2127c7d34f9f71ef4e0 multiGroup-e4a2bbdf87c83b29d373")
            legs = len(divs)
            for div in divs:
                match = div.find('div', class_="matchName-f62aab4c515282e6d47b").get_text(strip=True)
                pick = div.find('div', class_="selection-f74c036e4b0c085e1f7a").get_text(strip=True)
                multi_bet_win_conditions.append({
                    "match": match,
                    "pick": pick,
                    "legs": legs,
                    "odds": full_parlay_odds,
                })
            match = 'Parlay'
        else:
            match = (inner_div_value.get_text()
                     .replace('(Sets)', '')
                     .replace('(Games)', '')
                     .replace('(Hits Allowed)', '')
                     .replace('(must start)', '')
                     .replace('Live', '')
                     .strip())

        # Event date
        div = bet.find('div', class_="container-fe56b5332b47109891ef")
        if not div:
            print(bet_number_int)
            exit(1)
        spans = div.find_all('span')
        event_date_string = spans[2].get_text()
        event_date = datetime.strptime(event_date_string, "%a, %b %d, %Y, %H:%M")
        event_date_string = event_date.strftime("%Y-%m-%d %H:%M:%S")

        # *** Pick
        inner_div_value = bet.find('div', class_="selection-f74c036e4b0c085e1f7a")
        pick = ""
        if multi_bet:
            for leg in multi_bet_win_conditions:
                pick = pick + leg['pick'] + " + "
            # Remove parentheses and the text inside them, but preserve the plus signs and spaces
            pick = re.sub(r'\s*\(.*?\)', '', pick)
            # Pick at this step should have a trailing " + "
            pick = pick.rstrip(' + ')
        else:
            pick = inner_div_value.get_text().replace('(Sets) (Sets)', '(Sets)').replace('(Games) (Games)', '(Games)').strip()

        # *** Accepted and Settled dates
        inner_div_value = bet.find('div', class_="container-ff6d881f7592bf85eb4d inline-f3de3c46c55dfbeac4d8")
        keyword = inner_div_value.get_text()

        # Bet isn't graded set so dates aren't displayed the expected way
        if "Accepted" in keyword:
            inner_div_value = bet.find('div', class_="container-b2088ffeb0b0be27602c inlineBlock-b86bd0c94db92e9a487a timeDisplays-d7748861ee464fc61a39")
            date_accepted_string = inner_div_value.get_text()
            date_settled_string = None
        # Bet is graded set so let's do our thing
        else:
            date_divs = bet.find_all('div', class_="container-b2088ffeb0b0be27602c inlineBlock-b86bd0c94db92e9a487a timeDisplays-d7748861ee464fc61a39")
            date_settled_string = date_divs[0].get_text(strip=True)
            date_accepted_string = date_divs[1].get_text(strip=True)

        date_accepted = datetime.strptime(date_accepted_string, "%b %d, %Y, %I:%M %p")
        date_accepted_string = date_accepted.strftime("%Y-%m-%d %H:%M:%S")
        if date_settled_string:
            date_settled = datetime.strptime(date_settled_string, "%b %d, %Y, %I:%M %p")
            date_settled_string = date_settled.strftime("%Y-%m-%d %H:%M:%S")
        else:
            date_settled_string = None

        if multi_bet:
            if status == "Settled":
                event_date_string = date_settled_string
            else:
                event_date = datetime.now()
                event_date_string = event_date.strftime("%Y-%m-%d %H:%M:%S")

        event_date_string = UtilityTimeZone.convert_to_utc(event_date_string)
        date_accepted_string = UtilityTimeZone.convert_to_utc(date_accepted_string)

        self._store_or_update_bet({
            "bet_id": bet_number_int,
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
            "date_accepted": date_accepted_string,
            "event_date": event_date_string,
            "multi_bet_win_conditions": multi_bet_win_conditions,
            "capper": None,
        })

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
                date_accepted=bet_data.get('date_accepted'),
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
            bet.date_accepted = bet_data.get('date_accepted', bet.date_accepted)
            bet.event_date = bet_data.get('event_date', bet.event_date)

        db.session.commit()
        return bet

    @staticmethod
    def _get_bet_by_id(bet_id: int):
        # Query the Bet table by bet_id
        bet = Bet.query.filter_by(bet_id=bet_id).first()
        return bet
