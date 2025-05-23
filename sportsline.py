import os
import json
import time
from datetime import datetime
import psycopg2
import requests
from psycopg2.extras import execute_values


def scrape_page(offset: int, chunk: int, capper_id: int = 51219409) -> bool:
    url = 'https://www.sportsline.com/ui-gateway/v1/graphql'
    print(f"Requesting: {chunk} records after {offset}")

    # Create an empty list to hold the batch of values
    batch_values = []

    # Connection string
    # DEV
    # conn = psycopg2.connect("postgresql://local_user:strong_password@localhost:5432/betting_history_web")
    conn = psycopg2.connect("postgresql://umv6rl45h3vo4:pa3d9f780aad83a4be83090945bdd0b0d7d6a993814b2219388187daadb82b821@c8m0261h0c7idk.cluster-czrs8kj4isg7.us-east-1.rds.amazonaws.com:5432/d5t05b9j49d371")

    # Create a cursor to execute SQL queries
    cursor = conn.cursor()

    # SQL insert query
    query = """
        INSERT INTO sportsline (
            sportsline_id, capper, date, league, market, event, pick, units, result, line, returns
        ) VALUES %s
        ON CONFLICT (sportsline_id) DO UPDATE SET
            capper = EXCLUDED.capper,
            date = EXCLUDED.date,
            league = EXCLUDED.league,
            market = EXCLUDED.market,
            event = EXCLUDED.event,
            pick = EXCLUDED.pick,
            units = EXCLUDED.units,
            result = EXCLUDED.result,
            line = EXCLUDED.line,
            returns = EXCLUDED.returns
    """

    # Headers from the curl request
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:131.0) Gecko/20100101 Firefox/131.0',
        'Accept': '*/*',
        'Accept-Language': 'en-CA,en-US;q=0.7,en;q=0.3',
        'Accept-Encoding': 'gzip, deflate, br, zstd',
        'Referer': 'https://www.sportsline.com/experts/51219409/jimmie-kaylor/',
        'content-type': 'application/json',
        'Origin': 'https://www.sportsline.com',
        'Connection': 'keep-alive',
        'Cookie': 'fly_ab_uid=dd5c23a7-800f-40b6-baa4-a7bc28de4ee9; utag_main=v_id:0191e87a50bf001fbdcd8ee1e3c505054029000f00bd6...',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-origin',
        'Priority': 'u=0',
        'Pragma': 'no-cache',
        'Cache-Control': 'no-cache',
        'TE': 'trailers'
    }

    # GraphQL query and variables
    payload = {
        "operationName": "GetPicksPageExpertPicks",
        "variables": {
            "first": chunk,
            "sortBy": "scheduledDateTime",
            "sortOrder": "desc",
            "filter": {
                "marketType": [],
                "status": ['WIN', 'LOSS', 'PUSH'],
                "expertIds": [capper_id]
            },
            "input": {
                "league": []
            },
            "after": offset
        },
        "query": """
            query GetPicksPageExpertPicks($first: Int!, $after: Int, $filter: ExpertPicksInputFilter!, $sortBy: String, $sortOrder: String, $input: ExpertPicksInput!) {
                expertPicksV2(first: $first, after: $after, filter: $filter, sortBy: $sortBy, sortOrder: $sortOrder, input: $input) {
                    __typename
                    totalCount
                    pageInfo {
                        startCursor
                        endCursor
                        hasNextPage
                        __typename
                    }
                    edges {
                        cursor
                        node {
                            ...ExpertPickGame
                            league {
                                leagueAbbr
                                logo
                                __typename
                            }
                            selection {
                                __typename
                                ...ExpertPickPlayersPropsSelection
                                ...ExpertPickTeamPropsSelection
                                ...ExpertPickGamePropsSelection
                                ...ExpertPickStandardSelection
                            }
                            __typename
                        }
                        __typename
                    }
                }
            }

            fragment ExpertPickGame on ExpertPickV2 {
                ...ExpertPick
                abbr
                awayTeam {
                    ...ExpertPickTeam
                    __typename
                }
                homeTeam {
                    ...ExpertPickTeam
                    __typename
                }
                scheduledDateTime
                homeTeamScoreTotal
                awayTeamScoreTotal
                authorInfo {
                    cbsExpertId
                    firstName
                    lastName
                    nickName
                    authorHeadshotUrl
                    __typename
                }
                expertStreaks {
                    id
                    hot
                    profit
                    label
                    __typename
                }
                __typename
            }

            fragment ExpertPick on ExpertPickV2 {
                id
                created
                isFeatured
                selectionLabel
                unit
                resultStatus
                marketType
                marketTypeLabel
                sportsbookName
                writeup
                __typename
            }

            fragment ExpertPickTeam on Team {
                id
                logoUrl
                nickName
                location
                mediumName
                __typename
            }

            fragment ExpertPickPlayersPropsSelection on ExpertPickPlayersPropsSelection {
                label
                subLabel
                marketName
                marketNameLabel
                cbsMarketId
                unit
                player {
                    firstName
                    lastName
                    headshot
                    __typename
                }
                __typename
            }

            fragment ExpertPickTeamPropsSelection on ExpertPickTeamPropsSelection {
                label
                subLabel
                marketName
                marketNameLabel
                cbsMarketId
                unit
                teamProp {
                    logoUrl
                    __typename
                }
                __typename
            }

            fragment ExpertPickGamePropsSelection on ExpertPickGamePropsSelection {
                label
                subLabel
                marketName
                marketNameLabel
                cbsMarketId
                unit
                team {
                    logoUrl
                    __typename
                }
                __typename
            }

            fragment ExpertPickStandardSelection on ExpertPickStandardSelection {
                label
                subLabel
                value
                odds
                team {
                    logoUrl
                    __typename
                }
                __typename
            }
        """
    }

    # Define the file path where the response will be saved
    response_file = f'/tmp/{capper_id}_{offset}_{chunk}.json'  # Change the filename as needed

    # Check if the file exists
    if os.path.exists(response_file):
        # Read the response from the file
        with open(response_file, 'r') as file:
            response_data = json.load(file)
            print('READ FROM CACHE!')
    else:

        # Send the POST request
        time.sleep(15)
        response = requests.post(url, headers=headers, json=payload)
        if response.status_code != 200:
            print(f"Query failed with status code {response.status_code}")
            exit(1)
        # Write the response to the file
        with open(response_file, 'w') as file:
            json.dump(response.json(), file)  # Save the JSON response
        response_data = response.json()

    for bet in response_data['data']['expertPicksV2']['edges']:
        node = bet['node']
        print(f"Processing: {node['id']}")

        market = node['marketType']
        market_selection = node['selection']['marketName'] if 'marketName' in node['selection'] else ''

        # print(f"Capper: {node['authorInfo']['firstName']} {node['authorInfo']['lastName']} {node['authorInfo']['cbsExpertId']}")
        # print(f"Created: {node['created']}")
        # print(f"league: {node['league']['leagueAbbr']}")
        # print(f"Event: {node['awayTeam']['mediumName']} @ {node['homeTeam']['mediumName']}")
        # print(f"Units: {node['unit']}")
        # print(f"Market: {market}")
        # print(f"Market Selection: {market_selection}")
        # print(f"Pick: {node['selectionLabel']}")
        # print(f"Result: {node['resultStatus']}")

        # MARKET
        market_to_insert = ''

        if market == 'PROP' and (market_selection == 'TOTAL_AWAY_POINTS' or market_selection == 'TOTAL_HOME_POINTS'):
            market_to_insert = 'OVER_UNDER'
        elif market == 'OVER_UNDER':
            market_to_insert = 'OVER_UNDER'
        elif market == 'PROP' and market_selection == 'FIRST_HALF_TOTAL_POINTS':
            market_to_insert = 'OVER_UNDER_PARTIAL'
        elif market == 'PROP' and market_selection == 'FIRST_QUARTER_TOTAL_POINTS':
            market_to_insert = 'OVER_UNDER_PARTIAL'
        elif market == 'PROP' and market_selection == 'FIRST_5_INNINGS_TOTAL_RUNS':
            market_to_insert = 'OVER_UNDER_PARTIAL'

        elif market == 'POINT_SPREAD':
            market_to_insert = 'SPREAD'
        elif market == 'PROP' and market_selection == 'FIRST_QUARTER_SPREAD':
            market_to_insert = 'SPREAD_PARTIAL'
        elif market == 'PROP' and market_selection == 'FIRST_HALF_SPREAD':
            market_to_insert = 'SPREAD_PARTIAL'
        elif market == 'PROP' and market_selection == 'FIRST_5_INNINGS_HANDICAP':
            market_to_insert = 'SPREAD_PARTIAL'
        elif market == 'PROP' and market_selection == 'SECOND_QUARTER_SPREAD':
            market_to_insert = 'SPREAD_PARTIAL'

        elif market == 'PROP' and market_selection == 'TOTAL_RECEIVING_YARDS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_MADE_FIELD_GOALS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_RUSHING_YARDS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_CARRIES':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_PASSING_YARDS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_RECEPTIONS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'ANYTIME_TOUCHDOWN_SCORER':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_PASSING_TOUCHDOWNS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_SACKS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_PASSING_INTERCEPTIONS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_REBOUNDS_ASSISTS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_POINTS_ASSISTS_REBOUNDS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_ASSISTS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_POINTS_ASSISTS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_POINTS_REBOUNDS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_REBOUNDS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_3POINTS_FIELD_GOAL':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_POINTS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_RUSHING_RECEIVING_YARDS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_PASSING_COMPLETIONS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_PITCHER_OUTS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_PITCHER_STRIKEOUTS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_BASES':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_BLOCKS_STEALS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_PASSING_ATTEMPTS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_BLOCKS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'LONGEST_RECEPTION':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'PLAYER_TO_SCORE_2_OR_MORE_TOUCHDOWNS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TRIPLE_DOUBLE':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'DOUBLE_DOUBLE':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TO_HIT_A_HOME_RUN':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_RUNS_BATTED_IN':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TO_THROW_AN_INTERCEPTION':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'LONGEST_PASSING_COMPLETION':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_HOME_RUNS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_HITS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_EARNED_RUNS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_TURNOVERS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_RUNS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_TACKLES_PLUS_ASSISTS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_STEALS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_MADE_EXTRA_POINTS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_STOLEN_BASES':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'LONGEST_RUSH':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_PASSING_PLUS_RUSHING_YARDS':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_SHOTS_ON_GOAL':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'ANYTIME_GOAL_SCORER':
            market_to_insert = 'PROP'
        elif market == 'PROP' and market_selection == 'TOTAL_HITS_ALLOWED':
            market_to_insert = 'PROP'

        elif market == 'MONEY_LINE':
            market_to_insert = 'MONEY_LINE'
        elif market == 'PROP' and market_selection == 'FIRST_5_INNINGS_WINNING':
            market_to_insert = 'MONEY_LINE_PARTIAL'
        elif market == 'PROP' and market_selection == 'FIRST_HALF_MONEY_LINE':
            market_to_insert = 'MONEY_LINE_PARTIAL'
        elif market == 'PROP' and market_selection == 'FIRST_QUARTER_MONEY_LINE':
            market_to_insert = 'MONEY_LINE_PARTIAL'

        else:
            print(bet)
            print(market)
            print(market_selection)
            exit(1)

        parts = node['selectionLabel'].split()
        line = int(str.replace(parts[-1], ',', ''))

        returns = 0
        units = node['unit']
        if line > 0:
            # Positive American odds
            returns = units * (line / 100)
        elif line < 0:
            # Negative American odds
            returns = units * (100 / abs(line))

        try:
            # First attempt to parse with milliseconds
            date = datetime.strptime(node['created'], "%Y-%m-%dT%H:%M:%S.%fZ")
        except ValueError:
            # Fallback to parsing without milliseconds
            date = datetime.strptime(node['created'], '%Y-%m-%dT%H:%M:%SZ')

        # Values to insert
        values = (
            node['id'],
            f"{node['authorInfo']['firstName']} {node['authorInfo']['lastName']}",
            date,
            node['league']['leagueAbbr'],
            market_to_insert,
            f"{node['awayTeam']['mediumName']} @ {node['homeTeam']['mediumName']}",
            node['selectionLabel'],
            node['unit'],
            node['resultStatus'],
            line,
            returns
        )

        # Add the values to the batch list
        batch_values.append(values)

    # Execute the batch insert with `execute_values`
    execute_values(cursor, query, batch_values)
    conn.commit()

    # Get the current time and format it as 'YYYY-MM-DD hh:mmAM/PM'
    current_time = datetime.now().strftime("%Y-%m-%d %I:%M%p")
    # Update the Settings table with the formatted time
    update_query = """
        UPDATE 
            Settings
        SET
            value = %s
        WHERE
            name = 'sportsline_last_updated'
    """
    cursor.execute(update_query, (current_time,))
    conn.commit()

    # Close the cursor and connection
    cursor.close()
    conn.close()

    return response_data.get('data', {}).get('expertPicksV2', {}).get('pageInfo', {}).get('hasNextPage', False)


for expert_id in [
    15770,  # Zack Cimini
    51219409,  # Jimmie Kaylor
    15150,  # Adam Silverstein
    51243297,  # Alex Selesnick
    51297150,  # Bruce Marshall
    7950,  # Micah Roberts
    50774572,  # Matt Severance
    15731,  # Mike Tierney
    51283976,  # Bob Konarski
    51291867,  # Erik Kuselias
    15810,  # Mike McClure
    51302558,  # Daniel Vithlani
    51295899,  # Angelo Magliocca
    13273,  # Tom Fornelli
    13773,  # Larry Hartstein
    51288803,  # Sia Nejad
    3828,  # Dave Richard
    15733,  # Josh Nagel
    16030,  # Emory Hunt
    33404218,  # Mike Barner
    14890,  # R.J. White
    14830,  # Jason La Canfora
    51190044,  # Jeff Hochman
    51282681,  # Eric Cohen
    50681998,  # Gene Menez
    15751,  # Todd Fuhrman
    13910,  # Matt Snyder
    13230,  # Chip Patterson
    51264910,  # Jon Eimer
    51306423,  # Thomas Casale
    2156857,  # Brad Botkin
    51295857,  # Mackenzie Books
    51310505,  # Megan Shoup
    51314525,  # Doug Prop Bet Guy
    51117259,  # Tim Doyle
]:
    chunk = 100
    offset = 0
    while True:
        has_next_page = scrape_page(offset, chunk, expert_id)
        offset = offset + chunk
        # This condition is here for subsequent scrapes
        # The OG scrape is meant to have scraped off all records on 2024-10-27
        # Not fetching the first page of 100 records periodically should be more than enough to update each cappers with most recent bets
        if chunk == 100 and offset == 100:
            print("We fetched the most recent 100 records. Move on.")
            break
        if not has_next_page:
            print("That's all she wrote!")
            break





