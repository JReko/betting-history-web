--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.accounts (id, email, password_hash, timezone, confirmed, power_user, created_at, updated_at) FROM stdin;
2	franky@fake.com	pbkdf2:sha256:600000$XmVwWe2wzZqmuvTM$8e325f6f212046d0236dc92eb97a1f819b4742261566097794ef45d43ef9c7d1	\N	t	f	2024-10-02 15:33:15.392054	2024-10-02 15:33:15.392054
1	francis.caisse@gmail.com	pbkdf2:sha256:600000$GqXGyR39jlqYiur6$908c1bcb89c15a8638b8d3057f6a7e27944d8a2d9010e7536efd16f60c7fb4f2	America/Montreal	t	f	2024-09-20 20:50:12.324498	2024-09-20 20:50:12.324498
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.alembic_version (version_num) FROM stdin;
642e3262e2e9
\.


--
-- Data for Name: bets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bets (bet_id, sport, status, result, capper, stake_amount, potential_win_amount, line, multi_bet, match, pick, date_accepted, event_date, book, account_id) FROM stdin;
2010733592	tennis	Settled	Win	TennisWinnersOnly	20	12.99	-154	f	Sofia Kenin vs Ana Bogdan	Sofia Kenin (Sets)	2024-09-25 01:40:00	2024-09-25 03:08:00	pinnacle	1
2010741903	tennis	Settled	Win	TTW	20	15.27	-131	f	Roberto Carballes Baena vs Pavel Kotov	Pavel Kotov (Sets)	2024-09-25 02:53:00	2024-09-25 03:15:00	pinnacle	1
2010864292	tennis	Settled	Refunded	OutofLineBets	20	16.26	-123	f	Ernesto Escobedo vs Learner Tien	Learner Tien (Sets) -1.5	2024-09-25 14:53:00	2024-09-25 18:00:00	pinnacle	1
2013293993	tennis	Settled	Loss	Tennis Titan 2	20	17.54	-114	f	Pavel Kotov vs Yosuke Watanuki	Pavel Kotov (Sets)	2024-10-02 22:31:00	2024-10-03 08:45:00	pinnacle	1
bet365_64	hockey	Settled	Loss	AdamsDigest	15	19.5	130	\N	Devils @ Sabres	Markstrom & Luukkonen 25+ saves	\N	2024-10-04 16:45:00	Bet365	1
2013295690	tennis	Settled	Loss	OutofLineBets	20	15.38	-130	f	Zhizhen Zhang vs Zizou Bergs	Zhizhen Zhang (Sets)	2024-10-02 22:48:00	2024-10-03 11:00:00	pinnacle	1
2013313355	tennis	Settled	Win	TennisWinnersOnly	20	17.54	-114	f	Yulia Starodubtseva  vs Coco Gauff	Yulia Starodubtseva (Games) +5.5	2024-10-03 01:14:00	2024-10-03 10:07:00	pinnacle	1
2013313293	tennis	Settled	Win	TennisWinnersOnly	20	14.71	-136	f	Aleksandar Kovacevic vs Terence Atmane	Terence Atmane (Sets)	2024-10-03 01:13:00	2024-10-03 11:45:00	pinnacle	1
2013296102	tennis	Settled	Win	Betting4Profit	20	14.71	-136	f	Aleksandar Kovacevic vs Terence Atmane	Terence Atmane (Sets)	2024-10-02 22:53:00	2024-10-03 11:45:00	pinnacle	1
2013313263	tennis	Settled	Win	TennisWinnersOnly	20	22.8	114	f	Stan Wawrinka vs Giovanni Mpetshi Perricard	Stan Wawrinka (Sets)	2024-10-03 01:13:00	2024-10-03 13:00:00	pinnacle	1
2013755978	tennis	Settled	Win	Value Hunter	20	15.15	-132	f	Federico Coria vs Gustavo Heide	Federico Coria (Sets)	2024-10-04 15:45:00	2024-10-04 16:15:00	pinnacle	1
2013143115	tennis	Settled	Loss	A11 Bets	5	11.5	230	f	Kei Nishikori  vs Mariano Navone	Mariano Navone (Sets)	2024-10-02 13:31:00	2024-10-02 12:45:00	pinnacle	1
2013763381	tennis	Settled	Loss	OutofLineBets	20	17.54	-114	f	Jack Pinnington Jones  vs Colton Smith	Colton Smith (Games) +1.5	2024-10-04 16:05:00	2024-10-04 18:05:00	pinnacle	1
2013143188	tennis	Settled	Loss	A11 Bets	10	10.5	105	f	Kei Nishikori  vs Mariano Navone	Mariano Navone (Sets)	2024-10-02 13:31:00	2024-10-02 12:45:00	pinnacle	1
2013150507	baseball	Settled	Loss	Matt Severance	20	16.81	-119	f	Detroit Tigers vs Houston Astros	Houston Astros -1.0	2024-10-02 14:04:00	2024-10-02 18:32:00	pinnacle	1
2013235190	baseball	Settled	Loss	Dany McLain	20	20.8	104	f	Kansas City Royals vs Baltimore Orioles	Over 7.5	2024-10-02 18:40:00	2024-10-02 20:38:00	pinnacle	1
2013235654	baseball	Settled	Loss	Dany McLain	5	5.2	104	f	New York Mets vs Milwaukee Brewers	New York Mets	2024-10-02 18:41:00	2024-10-02 23:38:00	pinnacle	1
bet365_63	hockey	Settled	Loss	SD	10	90	900	\N	Devils @ Sabres	Jack Hughes 4+ shots, Dougie Hamilton 4+ shots, J.J. Peterka 3+ shots	\N	2024-10-04 16:43:00	Bet365	1
bet365_69	hockey - NHL	Pending	\N	Action Network	10	51	510	\N	Hawks @ Utah HC	Ilya Mikheyek AGS	\N	2024-10-09 00:29:00	Bet365	1
bet365_71	hockey - NHL	Pending	\N	Nick Martin	2	24	1200	\N	Bruins @ Panthers	Adam Boqvist AGS	\N	2024-10-08 23:04:00	Bet365	1
2013150575	baseball	Settled	Loss	Matt Snyder	20	20.6	103	f	New York Mets vs Milwaukee Brewers	New York Mets	2024-10-02 14:05:00	2024-10-02 23:38:00	pinnacle	1
2013150634	baseball	Settled	Win	Matt Severance	20	17.54	-114	f	Atlanta Braves vs San Diego Padres	San Diego Padres	2024-10-02 14:05:00	2024-10-03 00:38:00	pinnacle	1
2013293718	tennis	Settled	Loss	OutofLineBets	20	17.09	-117	f	Jaume Munar  vs Hugo Gaston	Hugo Gaston (Games) +3.5	2024-10-02 22:28:00	2024-10-03 05:00:00	pinnacle	1
bet99_27	hockey - NHL	Pending	\N	Action Network	10	44	440	\N	Blues @ Kraken	Shane Wright AGS	\N	2024-10-08 21:25:00	Bet99	1
bet365_70	tennis - ATP	Pending	\N	IllicitPicks	20	17.39	-115	\N	Aidan Mayo vs Dmitry Popko	Aidan Mayo ML	\N	2024-10-08 17:49:00	Bet365	1
2013313336	tennis	Settled	Win	TennisWinnersOnly	20	14.6	-137	f	Shuai Zhang vs Paula Badosa	Paula Badosa (Sets) -1.5	2024-10-03 01:14:00	2024-10-03 07:08:00	pinnacle	1
2013313243	tennis	Settled	Loss	TennisWinnersOnly	40	28.17	-142	f	Tallon Griekspoor vs Facundo Diaz Acosta	Tallon Griekspoor (Sets) -1.5	2024-10-03 01:13:00	2024-10-03 06:45:00	pinnacle	1
2015213495	hockey - NHL	Pending	\N	Action Network	20	30.6	153	f	Chicago Blackhawks vs Utah Hockey Club	Utah Hockey Club -1.5	2024-10-08 13:28:00	2024-10-09 02:07:00	pinnacle	1
2013313326	tennis	Settled	Win	TennisWinnersOnly	20	19.61	-102	f	Pavel Kotov vs Yosuke Watanuki	Yosuke Watanuki (Sets)	2024-10-03 01:14:00	2024-10-03 08:45:00	pinnacle	1
2015218526	tennis - ATP	Pending	\N	OutofLineBets	30	25.64	-117	f	Gabi Adrian Boitan  vs Ryan Seggerman	Ryan Seggerman (Games) -1.5	2024-10-08 13:55:00	2024-10-08 17:00:00	pinnacle	1
2015228969	baseball - KBO	Pending	\N	A11 Bets	20	19.42	-103	f	LG Twins vs KT Wiz	KT Wiz	2024-10-08 14:48:00	2024-10-09 05:00:00	pinnacle	1
bet365_68	hockey - NHL	Pending	\N	Action Network	20	22	110	\N	Blues @ Kraken	Matty Beniers Over 0.5 points	\N	2024-10-08 17:26:00	Bet365	1
2015255813	baseball - MLB	Pending	\N	A11 Bets	10	6.62	-151	f	Los Angeles Dodgers vs San Diego Padres	San Diego Padres	2024-10-08 16:57:00	2024-10-09 01:08:00	pinnacle	1
2013861866	football - NCAA	Settled	Win	Sharp Sheet	10	9.01	-111	f	Michigan State vs Oregon	Michigan State +23.5	2024-10-04 19:18:00	2024-10-05 01:00:00	pinnacle	1
2013861610	football - NCAA	Settled	Win	Sharp Sheet	20	18.18	-110	f	Syracuse vs UNLV	Syracuse +6.0	2024-10-04 19:18:00	2024-10-05 01:00:00	pinnacle	1
2013461096	tennis	Settled	Loss	IllicitPicks	20	20.6	103	f	Botic Van De Zandschulp vs Tomas Martin Etcheverry	Botic Van De Zandschulp (Sets)	2024-10-03 16:38:00	2024-10-04 09:15:00	pinnacle	1
2013860201	tennis	Settled	Win	Tennis Titan	25	20.33	-123	f	Juan Pablo Varillas  vs Francisco Comesana	Over 21.5 (Games)	2024-10-04 19:15:00	2024-10-04 20:10:00	pinnacle	1
2013861522	basketball	Settled	Win	Sharp Sheet	30	29.13	-103	f	Minnesota Lynx vs Connecticut Sun	Minnesota Lynx +2.5	2024-10-04 19:18:00	2024-10-04 23:30:00	pinnacle	1
2011147626	football	Settled	Win	A11 Bets	60	41.7	-144	t	Parlay	San Francisco 49ers + Dallas Cowboys	2024-09-26 14:08:00	2024-09-29 23:17:00	pinnacle	1
2013909005	tennis - ATP	Settled	Win	Betting4Profit	20	18.35	-109	f	Yosuke Watanuki  vs Brandon Nakashima	Yosuke Watanuki (Games) +3.5	2024-10-04 22:25:00	2024-10-05 05:15:00	pinnacle	1
2013191234	soccer	Settled	Win	A11 Bets	10	6.68	-150	t	Parlay	Atalanta + Valencia Basket	2024-10-02 16:48:00	2024-10-02 20:25:00	pinnacle	1
2013191314	soccer	Settled	Loss	A11 Bets	20	13.25	-151	f	Lille vs Real Madrid	Real Madrid	2024-10-02 16:48:00	2024-10-02 19:00:00	pinnacle	1
2013190569	baseball	Settled	Loss	A11 Bets	10	12.9	129	f	Detroit Tigers vs Houston Astros	Houston Astros -1.5	2024-10-02 16:47:00	2024-10-02 18:32:00	pinnacle	1
2013190535	baseball	Settled	Loss	A11 Bets	50	29.07	-172	f	Detroit Tigers vs Houston Astros	Houston Astros	2024-10-02 16:47:00	2024-10-02 18:32:00	pinnacle	1
2013190439	baseball	Settled	Win	OutofLineBets	30	26.79	-112	f	Detroit Tigers vs Houston Astros	Under 7.5	2024-10-02 16:46:00	2024-10-02 18:32:00	pinnacle	1
2013322381	baseball	Settled	Loss	A11 Bets	15	14.56	-103	f	KT Wiz vs Doosan Bears	KT Wiz -1.5	2024-10-03 02:34:00	2024-10-03 05:00:00	pinnacle	1
2015255632	baseball - MLB	Pending	\N	Micah Roberts	20	19.23	-104	f	Philadelphia Phillies vs New York Mets	Over 7	2024-10-08 16:56:00	2024-10-08 21:08:00	pinnacle	1
2015255789	baseball - MLB	Pending	\N	Micah Roberts	10	6.62	-151	f	Los Angeles Dodgers vs San Diego Padres	San Diego Padres	2024-10-08 16:57:00	2024-10-09 01:08:00	pinnacle	1
2015255801	baseball - MLB	Pending	\N	Matt Severance	10	6.62	-151	f	Los Angeles Dodgers vs San Diego Padres	San Diego Padres	2024-10-08 16:57:00	2024-10-09 01:08:00	pinnacle	1
2013322213	tennis	Settled	Loss	Tennis With T	20	22.28	111	t	Parlay	Zhizhen Zhang + Coco Gauff	2024-10-03 02:32:00	2024-10-03 11:57:00	pinnacle	1
2013322165	tennis	Settled	Loss	Tennis With T	5	127.03	2540	t	Parlay	Matteo Berrettini + Jakub Mensik + Zhizhen Zhang + Yosuke Watanuki + Billy Harris + Coco Gauff	2024-10-03 02:32:00	2024-10-03 11:57:00	pinnacle	1
2013459121	tennis	Settled	Loss	OutofLineBets	30	26.09	-115	f	Roman Andres Burruchaga vs Juan Pablo Varillas	Roman Andres Burruchaga (Sets)	2024-10-03 16:32:00	2024-10-03 19:20:00	pinnacle	1
2013417177	tennis	Settled	Win	OutofLineBets	30	26.09	-115	f	Abedallah Shelbayh  vs Eliot Spizzirri	Eliot Spizzirri (Games) +2.0	2024-10-03 13:36:00	2024-10-03 18:15:00	pinnacle	1
2013459443	baseball	Settled	Loss	Matt Snyder	20	15.75	-127	f	New York Mets vs Milwaukee Brewers	Milwaukee Brewers	2024-10-03 16:33:00	2024-10-03 23:10:00	pinnacle	1
2013460112	football	Settled	Win	Emory Hunt	20	17.54	-114	f	Sam Houston State vs UTEP	Sam Houston State -10.0	2024-10-03 16:35:00	2024-10-04 01:00:00	pinnacle	1
2013461755	tennis	Settled	Win	IllicitPicks	10	8.26	-121	f	Arthur Rinderknech vs Alejandro Tabilo	Alejandro Tabilo (Sets)	2024-10-03 16:38:00	2024-10-04 04:45:00	pinnacle	1
2013460619	football	Settled	Win	ChaseTheLock	20	18.18	-110	f	Kirk Cousins (Passing Yards)	Over 230.5 Passing Yards	2024-10-03 16:36:00	2024-10-04 00:15:00	pinnacle	1
2013461423	tennis	Settled	Win	IllicitPicks	20	15.63	-128	f	Alex Michelsen  vs Bu Yunchaokete	Alex Michelsen (Games) -1.5	2024-10-03 16:38:00	2024-10-04 06:20:00	pinnacle	1
2011046001	tennis	Settled	Win	A11 Bets	15	12.71	-118	f	Tomas Martin Etcheverry vs Christopher O'connell	Christopher O'connell (Sets)	2024-09-26 03:07:00	2024-09-26 07:00:00	pinnacle	1
ge_Etm0Getxc	hockey - NHL	Pending	\N	Me	47	26.11111111111111	-180	f	NHL Futures 2024/25 - BUF Sabres	No	2024-08-25 04:44:21	2025-04-16 23:00:00	bet365	1
PPSeKDlKgEVI	hockey - NHL	Pending	\N	Me	46.96	25.383783783783784	-185	f	NHL Futures 2024/25 - PHI Flyers	No	2024-08-25 04:44:25	2025-04-16 23:00:00	bet365	1
ZUY9hqwfR5ao	hockey - NHL	Pending	\N	Me	47	33.57142857142857	-140	f	NHL Futures 2024/25 - OTT Senators	No	2024-08-25 04:44:24	2025-04-16 23:00:00	bet365	1
bet99_3	football - NCAA	Pending	\N	MAL	100	120	120	\N	NCAAF Future	Kansas State Wildcats Over 9.5 Wins	\N	2024-12-20 16:55:00	Pinnacle	1
2013909086	tennis - ATP	Settled	Win	OutofLineBets	20	18.87	-106	f	Carlos Alcaraz  vs Juncheng Shang	Carlos Alcaraz (Games) -5.0	2024-10-04 22:25:00	2024-10-05 04:30:00	pinnacle	1
2013926125	tennis - ATP	Settled	Win	TennisWinnersOnly	20	17.09	-117	f	Andrey Rublev  vs Jakub Mensik	Jakub Mensik (Games) +3.5	2024-10-05 00:45:00	2024-10-05 05:30:00	pinnacle	1
2013926237	tennis - WTA	Settled	Loss	TennisWinnersOnly	40	36.04	-111	f	Coco Gauff vs Paula Badosa	Paula Badosa (Sets)	2024-10-05 00:45:00	2024-10-05 07:08:00	pinnacle	1
2013926287	tennis - WTA	Settled	Win	TennisWinnersOnly	20	13.51	-148	f	Karolina Muchova vs Qinwen Zheng	Karolina Muchova (Sets)	2024-10-05 00:46:00	2024-10-05 10:10:00	pinnacle	1
2013926209	tennis - ATP	Settled	Win	TennisWinnersOnly	20	15.63	-128	f	Alex Michelsen  vs Novak Djokovic	Alex Michelsen (Games) +4.5	2024-10-05 00:45:00	2024-10-05 10:30:00	pinnacle	1
2013926098	tennis - ATP	Settled	Loss	TennisWinnersOnly	40	31.75	-126	f	Zizou Bergs  vs Grigor Dimitrov	Zizou Bergs (Games) +3.5	2024-10-05 00:44:00	2024-10-06 07:45:00	pinnacle	1
2013926173	tennis - ATP	Settled	Win	TennisWinnersOnly	20	18.35	-109	f	Lorenzo Musetti  vs David Goffin	David Goffin (Games) +3.5	2024-10-05 00:45:00	2024-10-07 07:00:00	pinnacle	1
2013204683	soccer	Settled	Loss	A11 Bets	10	9.48	-106	t	Parlay	Liverpool + Bayern Munich	2024-10-02 17:23:00	2024-10-02 20:57:00	pinnacle	1
2013535437	baseball	Settled	Win	Sharp Sheet	20	16.95	-118	f	New York Mets vs Milwaukee Brewers	Under 7.5	2024-10-03 19:41:00	2024-10-03 23:10:00	pinnacle	1
2013553054	football	Settled	Win	Dany McLain	20	18.02	-111	f	Texas State vs Troy	Texas State -13.5	2024-10-03 20:41:00	2024-10-03 23:00:00	pinnacle	1
2013564038	football	Settled	Win	TTW	15	10.95	-137	f	Tampa Bay Buccaneers vs Atlanta Falcons	Atlanta Falcons	2024-10-03 22:18:00	2024-10-04 00:15:00	pinnacle	1
2013557454	football	Settled	Loss	OutofLineBets	20	17.7	-113	f	Tampa Bay Buccaneers vs Atlanta Falcons	Under 44	2024-10-03 21:06:00	2024-10-04 00:15:00	pinnacle	1
2013535291	football	Settled	Loss	Sharp Sheet	30	30.3	101	f	Tampa Bay Buccaneers vs Atlanta Falcons	Under 43.5	2024-10-03 19:40:00	2024-10-04 00:15:00	pinnacle	1
2013564068	football	Settled	Loss	TTW	10	8	-125	f	Bijan Robinson (Anytime TD)	Yes	2024-10-03 22:18:00	2024-10-04 00:15:00	pinnacle	1
2013557394	tennis	Settled	Win	OutofLineBets	30	26.79	-112	f	Alex Michelsen  vs Bu Yunchaokete	Alex Michelsen (Games) -2.0	2024-10-03 21:06:00	2024-10-04 06:20:00	pinnacle	1
2013573334	tennis	Settled	Win	TTW	20	13.33	-150	f	Mirra Andreeva vs Qinwen Zheng	Qinwen Zheng (Sets)	2024-10-03 23:38:00	2024-10-04 10:28:00	pinnacle	1
2013938736	tennis - ATP	Settled	Loss	TTW	20	27.2	136	f	Alexei Popyrin vs Miomir Kecmanovic	Miomir Kecmanovic (Sets)	2024-10-05 02:11:00	2024-10-05 06:50:00	pinnacle	1
2013938975	tennis - WTA	Settled	Loss	TTW	20	18.02	-111	f	Coco Gauff vs Paula Badosa	Paula Badosa (Sets)	2024-10-05 02:12:00	2024-10-05 07:08:00	pinnacle	1
2013954998	football - NCAA	Settled	Win	Emory Hunt	10	9.9	-101	f	SMU vs Louisville	SMU +6.5	2024-10-05 03:36:00	2024-10-05 16:00:00	pinnacle	1
2013955198	football - NCAA	Settled	Win	Micah Roberts	10	9.09	-110	f	Pittsburgh vs North Carolina	Pittsburgh -2.5	2024-10-05 03:38:00	2024-10-05 16:00:00	pinnacle	1
2013584563	tennis	Settled	Win	TennisWinnersOnly	40	30.77	-130	f	Aryna Sabalenka  vs Karolina Muchova	Karolina Muchova (Games) +3.5	2024-10-04 01:06:00	2024-10-04 07:18:00	pinnacle	1
2013614194	tennis	Settled	Loss	Tennis With T	25	20.16	-125	t	Parlay	Arthur Fils + Gael Monfils	2024-10-04 05:42:00	2024-10-04 10:44:00	pinnacle	1
2013614620	tennis	Settled	Win	OutofLineBets	20	17.39	-115	f	Yibing WU  vs Nicolas Jarry	Yibing WU (Games) +1.5	2024-10-04 05:45:00	2024-10-04 11:10:00	pinnacle	1
2013955190	football - NCAA	Settled	Win	Mike Tierney	10	9.09	-110	f	Pittsburgh vs North Carolina	Pittsburgh -2.5	2024-10-05 03:38:00	2024-10-05 16:00:00	pinnacle	1
2013939047	tennis - WTA	Settled	Win	TTW	15	11.9	-126	f	Anna Blinkova vs Ajla Tomljanovic	Ajla Tomljanovic (Sets)	2024-10-05 02:12:00	2024-10-05 10:07:00	pinnacle	1
2013954660	tennis - ATP	Settled	Win	OutofLineBets	30	26.32	-114	f	Alex Michelsen  vs Novak Djokovic	Over 21.5 (Games)	2024-10-05 03:35:00	2024-10-05 10:30:00	pinnacle	1
bet365_62	football - NFL	Settled	Win	Super Boost	48.45	48.45	100	\N	Buccaneers @ Falcons	Chris Godwin 50+ rec. yards & 5+ receptions	\N	2024-10-03 23:46:00	Bet365	1
2013955891	football - NCAA	Settled	Win	Jimmie Kaylor	20	17.86	-112	f	Navy vs Air Force	Over 37	2024-10-05 03:41:00	2024-10-05 16:00:00	pinnacle	1
2013956349	football - NCAA	Settled	Loss	Micah Roberts	20	17.39	-115	f	Iowa vs Ohio State	Over 45.5	2024-10-05 03:44:00	2024-10-05 19:30:00	pinnacle	1
2013956331	football - NCAA	Settled	Win	Mike McClure	20	18.35	-109	f	Iowa vs Ohio State	Ohio State -18.0	2024-10-05 03:43:00	2024-10-05 19:30:00	pinnacle	1
2013956453	football - NCAA	Settled	Win	Emory Hunt	20	19.42	-103	f	Indiana vs Northwestern	Indiana -13.5	2024-10-05 03:44:00	2024-10-05 19:30:00	pinnacle	1
2011186145	baseball	Settled	Win	A11 Bets	10	8.7	-115	f	Milwaukee Brewers vs Pittsburgh Pirates	Milwaukee Brewers	2024-09-26 16:34:00	2024-09-26 16:35:00	pinnacle	1
2011195836	baseball	Settled	Loss	A11 Bets	10	13.7	137	f	Tampa Bay Rays vs Detroit Tigers	Tampa Bay Rays	2024-09-26 17:04:00	2024-09-26 17:10:00	pinnacle	1
2011195746	baseball	Settled	Win	A11 Bets	10	7.25	-138	f	Kansas City Royals vs Washington Nationals	Kansas City Royals -1.0	2024-09-26 17:04:00	2024-09-26 17:05:00	pinnacle	1
2013938943	tennis - ATP	Settled	Win	TTW	20	14.93	-134	f	Zizou Bergs vs Grigor Dimitrov	Zizou Bergs (Sets) +1.5	2024-10-05 02:12:00	2024-10-06 07:45:00	pinnacle	1
2011186231	baseball	Settled	Loss	Action Network	10	10.3	103	f	San Diego Padres vs Los Angeles Dodgers	San Diego Padres	2024-09-26 16:34:00	2024-09-27 02:10:00	pinnacle	1
2013938789	tennis - ATP	Settled	Win	TTW	20	17.09	-117	f	Matteo Berrettini vs Holger Rune	Holger Rune (Sets)	2024-10-05 02:11:00	2024-10-07 10:45:00	pinnacle	1
2013955850	football - NCAA	Settled	Win	Jimmie Kaylor	20	16.81	-119	f	Navy vs Air Force	Navy -9.5	2024-10-05 03:41:00	2024-10-05 16:00:00	pinnacle	1
2013955471	football - NCAA	Settled	Loss	Tom Fornelli	20	23.4	117	f	Missouri vs Texas A&M	Missouri	2024-10-05 03:39:00	2024-10-05 16:00:00	pinnacle	1
2013955437	football - NCAA	Settled	Loss	Jimmie Kaylor	20	16	-125	f	Missouri vs Texas A&M	Under 48.5	2024-10-05 03:39:00	2024-10-05 16:00:00	pinnacle	1
2013955012	football - NCAA	Settled	Win	Josh Nagel	5	10.45	209	f	SMU vs Louisville	SMU	2024-10-05 03:36:00	2024-10-05 16:00:00	pinnacle	1
2013955003	football - NCAA	Settled	Win	Josh Nagel	10	9.9	-101	f	SMU vs Louisville	SMU +6.5	2024-10-05 03:36:00	2024-10-05 16:00:00	pinnacle	1
2013614515	tennis	Settled	Win	TTW	15	16.8	112	f	Yibing WU vs Nicolas Jarry	Yibing WU (Sets)	2024-10-04 05:44:00	2024-10-04 11:10:00	pinnacle	1
2013584263	tennis	Settled	Loss	TennisWinnersOnly	20	17.39	-115	f	Matteo Arnaldi  vs Zachary Svajda	Zachary Svajda (Games) +3.5	2024-10-04 01:05:00	2024-10-04 06:30:00	pinnacle	1
2013576321	tennis	Settled	Win	Betting4Profit	20	23	115	f	Yibing WU vs Nicolas Jarry	Yibing WU (Sets)	2024-10-04 00:05:00	2024-10-04 11:10:00	pinnacle	1
2013584165	tennis	Settled	Loss	TennisWinnersOnly	20	19.8	-101	f	Botic Van De Zandschulp vs Tomas Martin Etcheverry	Botic Van De Zandschulp (Sets)	2024-10-04 01:05:00	2024-10-04 09:15:00	pinnacle	1
2011293739	tennis	Settled	Win	TennisWinnersOnly	40	33.61	-119	f	Yulia Starodubtseva  vs Katerina Siniakova	Yulia Starodubtseva (Games) +2.5	2024-09-27 00:14:00	2024-09-27 03:09:00	pinnacle	1
2011293860	tennis	Settled	Win	Betting4Profit	20	17.24	-116	f	Juncheng Shang  vs Bu Yunchaokete	Bu Yunchaokete (Games) +3.5	2024-09-27 00:14:00	2024-09-27 03:30:00	pinnacle	1
2011293614	tennis	Settled	Win	TennisWinnersOnly	20	13.42	-149	f	Gael Monfils vs Daniil Medvedev	Daniil Medvedev (Sets) -1.5	2024-09-27 00:13:00	2024-09-27 05:00:00	pinnacle	1
2011260887	football	Settled	Win	Sia Nejad	20	18.18	-110	f	Rico Dowdle (Rushing Yards)	Over 40.5 Rushing Yards	2024-09-26 20:11:00	2024-09-27 00:15:00	pinnacle	1
2011260343	football	Settled	Win	Daniel Vithlani	30	24.79	-121	f	CeeDee Lamb (Anytime TD)	Yes	2024-09-26 20:09:00	2024-09-27 00:15:00	pinnacle	1
2011293795	tennis	Settled	Loss	TennisWinnersOnly	20	16.81	-119	f	Katie Boulter  vs Taylor Townsend	Over 21.5 (Games)	2024-09-27 00:14:00	2024-09-27 05:56:00	pinnacle	1
2011293577	tennis	Settled	Loss	TennisWinnersOnly	20	21.2	106	f	Brandon Nakashima vs Ugo Humbert	Brandon Nakashima (Sets)	2024-09-27 00:12:00	2024-09-27 11:30:00	pinnacle	1
bet365_50	football	Settled	Loss	Me	10	120	1200	\N	Cowboys @ Giants	Cowboys Over 30.5 points + Prescott 300+ passing yards + Prescott 3+ passing TDs	\N	2024-09-27 00:15:00	Bet365	1
2013957091	football - NCAA	Settled	Loss	Tom Fornelli	20	18.69	-107	f	South Alabama vs Arkansas State	South Alabama -3.0	2024-10-05 03:48:00	2024-10-05 23:00:00	pinnacle	1
2011260056	football	Settled	Win	Mike McClure	10	10.7	107	f	Dallas Cowboys vs New York Giants	Dallas Cowboys -0.5	2024-09-26 20:08:00	2024-09-27 00:15:00	pinnacle	1
bet365_51	tennis	Settled	Loss	OutofLineBets	30	24	-125	\N	Cerundolo vs Mensik	Mensik	\N	2024-09-26 15:30:00	Bet365	1
bet365_49	football	Settled	Win	Super Boost	25	25	100	\N	Cowboys @ Giants	Lamb & Nabers Over 50 yards	\N	2024-09-27 00:15:00	Bet365	1
2013956998	football - NCAA	Settled	Loss	Josh Nagel	20	18.18	-110	f	Clemson vs Florida State	Florida State +15.0	2024-10-05 03:47:00	2024-10-05 23:00:00	pinnacle	1
2013957439	football - NCAA	Settled	Loss	Tom Fornelli	5	16.45	329	f	Miami Florida vs California	California	2024-10-05 03:49:00	2024-10-06 02:40:00	pinnacle	1
2011283384	baseball	Settled	Win	A11 Bets	10	9.01	-111	f	Baltimore Orioles vs New York Yankees	New York Yankees -1.0	2024-09-26 22:38:00	2024-09-26 23:05:00	pinnacle	1
2011283629	football	Settled	Win	Emory Hunt	10	10.2	102	f	Army vs Temple	Army -12.0	2024-09-26 22:41:00	2024-09-26 23:30:00	pinnacle	1
2011283624	football	Settled	Win	Jimmie Kaylor	10	10.2	102	f	Army vs Temple	Army -12.0	2024-09-26 22:41:00	2024-09-26 23:30:00	pinnacle	1
2011260168	football	Settled	Loss	Mike McClure	20	19.8	-101	f	Dallas Cowboys vs New York Giants	Dallas Cowboys -5.5	2024-09-26 20:08:00	2024-09-27 00:15:00	pinnacle	1
2011293552	tennis	Settled	Win	TennisWinnersOnly	40	27.03	-148	f	Jack Draper vs Hubert Hurkacz	Jack Draper (Sets)	2024-09-27 00:12:00	2024-09-27 02:10:00	pinnacle	1
2011283440	baseball	Settled	Loss	A11 Bets	10	12.61	126	t	Parlay	New York Yankees + Minnesota Twins	2024-09-26 22:39:00	2024-09-27 04:15:00	pinnacle	1
2011283401	baseball	Settled	Loss	A11 Bets	10	8.33	-120	f	Miami Marlins vs Minnesota Twins	Minnesota Twins -1.5	2024-09-26 22:38:00	2024-09-26 23:40:00	pinnacle	1
2011219954	tennis	Settled	Refunded	Tennis Zeus	20	16.67	-120	f	Emma Navarro  vs Shuai Zhang	Under 18 (Games)	2024-09-26 18:08:00	2024-09-27 03:09:00	pinnacle	1
2011277305	baseball	Settled	Loss	OutofLineBets	20	19.8	-101	f	San Diego Padres vs Los Angeles Dodgers	San Diego Padres	2024-09-26 21:43:00	2024-09-27 02:10:00	pinnacle	1
bet365_53	football - NFL	Settled	Loss	DTO	5	55	1100	\N	Cowboys @ Giants - 4 leg parlay	Singletary 3, Tolbert 4, Nabers 5 & Lamb 6 receptions	\N	2024-09-27 01:48:00	Bet365	1
bet365_52	tennis	Settled	Loss	TennisWinnersOnly	20	16	-125	\N	Cerundolo vs Mensik	Mensik	\N	2024-09-26 15:17:00	Bet365	1
2011311452	tennis	Settled	Loss	Tennis With T	5	57.85	1157	t	Parlay	Jakub Mensik + Lorenzo Musetti + Karen Khachanov + Matteo Berrettini + Under 21	2024-09-27 02:29:00	2024-09-27 04:46:00	pinnacle	1
2011324227	tennis	Settled	Win	A11 Bets	20	15.4	-130	t	Parlay	Lorenzo Musetti + Carlos Alcaraz	2024-09-27 04:22:00	2024-09-27 08:32:00	pinnacle	1
2011322143	tennis	Settled	Win	A11 Bets	10	7.84	-128	t	Parlay	Carlos Alcaraz + Daniil Medvedev -1.5	2024-09-27 04:03:00	2024-09-27 08:32:00	pinnacle	1
2011324299	tennis	Settled	Win	TTW	20	21.89	109	t	Parlay	Diana Shnaider + Naomi Osaka	2024-09-27 04:23:00	2024-09-27 11:00:00	pinnacle	1
2011324074	tennis	Settled	Loss	A11 Bets	15	12.6	-120	t	Parlay	Brandon Nakashima +1.5 + Carlos Alcaraz -1.5	2024-09-27 04:21:00	2024-09-27 12:12:00	pinnacle	1
2011324153	tennis	Settled	Win	A11 Bets	15	10.8	-139	t	Parlay	Zhizhen Zhang +1.5 + Carlos Alcaraz -1.5	2024-09-27 04:22:00	2024-09-27 13:19:00	pinnacle	1
2011323968	tennis	Settled	Loss	A11 Bets	10	7.25	-138	f	Alejandro Davidovich Fokina vs Zhizhen Zhang	Zhizhen Zhang (Sets)	2024-09-27 04:20:00	2024-09-27 11:30:00	pinnacle	1
2014257734	hockey - NHL	Settled	Win	Me	10	8.26	-121	f	Buffalo Sabres vs New Jersey Devils	New Jersey Devils	2024-10-05 15:51:00	2024-10-05 14:07:00	pinnacle	1
2014200084	baseball - MLB	Settled	Loss	Micah Roberts	20	25.8	129	f	Detroit Tigers vs Cleveland Guardians	Detroit Tigers	2024-10-05 14:26:00	2024-10-05 17:08:00	pinnacle	1
2014273107	tennis - ATP	Settled	Win	OutofLineBets	20	17.7	-113	f	Nishesh Basavareddy  vs Jack Pinnington Jones	Nishesh Basavareddy (Games) -3.0	2024-10-05 16:17:00	2024-10-05 21:30:00	pinnacle	1
2014257625	mma	Settled	Win	Carribbean Capper	20	19.12	-105	t	Parlay	Tecia Pennington + Wisconsin	2024-10-05 15:51:00	2024-10-05 23:26:00	pinnacle	1
2014336652	football - NCAA	Settled	Win	Sharp Sheet	30	27.03	-111	f	Michigan vs Washington	Washington	2024-10-05 18:03:00	2024-10-05 23:30:00	pinnacle	1
2014200533	baseball - MLB	Settled	Loss	Matt Severance	20	16.13	-124	f	San Diego Padres vs Los Angeles Dodgers	San Diego Padres +1.0	2024-10-05 14:26:00	2024-10-06 00:38:00	pinnacle	1
2014337375	football - NCAA	Settled	Win	Sharp Sheet	10	8.62	-116	f	Miami Florida vs California	California +10.5	2024-10-05 18:04:00	2024-10-06 02:40:00	pinnacle	1
2011450293	tennis	Settled	Loss	Tennis Titan	26	20	-130	f	Hamad Medjedovic  vs Marc-Andrea Huesler	Over 22.5 (Games)	2024-09-27 13:57:00	2024-09-27 16:35:00	pinnacle	1
2011642753	tennis	Settled	Loss	TennisWinnersOnly	20	17.24	-116	f	Flavio Cobolli  vs Pavel Kotov	Pavel Kotov (Games) +3.0	2024-09-28 00:32:00	2024-09-28 03:30:00	pinnacle	1
2011624487	baseball	Settled	Win	A11 Bets	10	11.4	114	f	San Diego Padres vs Arizona Diamondbacks	San Diego Padres	2024-09-27 22:18:00	2024-09-28 01:40:00	pinnacle	1
2011642824	tennis	Settled	Loss	TennisWinnersOnly	20	17.72	-113	t	Parlay	Tommy Paul + Jannik Sinner -1.5	2024-09-28 00:33:00	2024-09-28 04:48:00	pinnacle	1
2011642911	tennis	Settled	Win	TennisWinnersOnly	20	18.87	-106	f	Jasmine Paolini  vs Clara Tauson	Clara Tauson (Games) +5.0	2024-09-28 00:33:00	2024-09-28 03:08:00	pinnacle	1
2011586156	tennis	Settled	Loss	OutofLineBets	20	16.13	-124	f	Christopher O'connell  vs Alex Michelsen	Christopher O'connell (Games) +3.0	2024-09-27 19:34:00	2024-09-28 05:15:00	pinnacle	1
2011628893	tennis	Settled	Win	Betting4Profit	20	18.18	-110	f	Jordan Thompson  vs Kei Nishikori	Kei Nishikori (Games) +2.5	2024-09-27 22:52:00	2024-09-28 07:00:00	pinnacle	1
2011664211	tennis	Settled	Loss	A11 Bets	10	9.31	-108	t	Parlay	Daniil Medvedev -1.5 + Jannik Sinner -1.5	2024-09-28 02:41:00	2024-09-28 10:18:00	pinnacle	1
2014439496	football - NFL	Settled	Win	Alex Selesnick	20	18.35	-109	f	Ja'Marr Chase (Receiving Yards)	Over 72.5 Receiving Yards	2024-10-05 23:10:00	2024-10-06 17:00:00	pinnacle	1
2011624768	baseball	Settled	Loss	A11 Bets	5	74.34	1486	t	Parlay	Kansas City Royals + San Diego Padres + Chicago White Sox	2024-09-27 22:20:00	2024-09-28 01:02:00	pinnacle	1
2014429593	mma	Settled	Win	TTW	10	18.1	181	f	Court McGee vs Tim Means	Court McGee	2024-10-05 22:19:00	2024-10-05 22:44:00	pinnacle	1
2011642718	tennis	Settled	Loss	TennisWinnersOnly	40	35.4	-113	f	Yoshihito Nishioka  vs Holger Rune	Yoshihito Nishioka (Games) +2.5	2024-09-28 00:32:00	2024-09-28 09:20:00	pinnacle	1
2011642870	tennis	Settled	Win	TennisWinnersOnly	20	22.4	112	f	Dayana Yastremska vs Nadia Podoroska	Nadia Podoroska (Sets)	2024-09-28 00:33:00	2024-09-28 09:20:00	pinnacle	1
2011624691	baseball	Settled	Loss	A11 Bets	10	8.4	-119	f	Chicago White Sox vs Detroit Tigers	Chicago White Sox +1.5	2024-09-27 22:19:00	2024-09-27 22:40:00	pinnacle	1
2011624656	baseball	Settled	Loss	A11 Bets	5	9.15	183	f	Chicago White Sox vs Detroit Tigers	Chicago White Sox	2024-09-27 22:19:00	2024-09-27 22:40:00	pinnacle	1
2011624611	baseball	Settled	Loss	A11 Bets	15	11.36	-132	f	Kansas City Royals vs Atlanta Braves	Kansas City Royals +1.5	2024-09-27 22:19:00	2024-09-27 23:20:00	pinnacle	1
2011624596	baseball	Settled	Loss	A11 Bets	10	16.2	162	f	Kansas City Royals vs Atlanta Braves	Kansas City Royals	2024-09-27 22:19:00	2024-09-27 23:20:00	pinnacle	1
2011590122	baseball	Settled	Win	Zach Cimini	20	22	110	f	Tampa Bay Rays vs Boston Red Sox	Tampa Bay Rays	2024-09-27 19:42:00	2024-09-27 23:10:00	pinnacle	1
2014429620	mma	Settled	Loss	TTW	10	12	120	f	Mario Bautista vs Jose Aldo	Jose Aldo	2024-10-05 22:19:00	2024-10-06 03:10:00	pinnacle	1
2011616474	baseball	Settled	Win	OutofLineBets	15	21	140	f	Baltimore Orioles vs Minnesota Twins	Baltimore Orioles	2024-09-27 21:16:00	2024-09-28 00:10:00	pinnacle	1
2011624456	baseball	Settled	Win	A11 Bets	10	10.2	102	f	New York Mets vs Milwaukee Brewers	Milwaukee Brewers	2024-09-27 22:18:00	2024-09-28 00:10:00	pinnacle	1
2011443877	football	Settled	Loss	Jimmie Kaylor	20	23.6	118	f	Virginia Tech vs Miami Florida	Miami Florida -18.5	2024-09-27 13:33:00	2024-09-27 23:30:00	pinnacle	1
2011444277	football	Settled	Win	Emory Hunt	20	21.4	107	f	Washington vs Rutgers	Rutgers -2.5	2024-09-27 13:35:00	2024-09-28 00:00:00	pinnacle	1
2014429552	mma	Settled	Win	TTW	15	14.26	-106	t	Parlay	Alex Pereira + Tecia Pennington	2024-10-05 22:19:00	2024-10-06 05:12:00	pinnacle	1
2014400457	tennis - WTA	Settled	Loss	TTW	40	26.32	-152	f	Karolina Muchova vs Coco Gauff	Karolina Muchova (Sets)	2024-10-05 20:13:00	2024-10-06 11:08:00	pinnacle	1
2014437136	football - NFL	Settled	Win	Daniel Vethlani	20	18.69	-107	f	New York Jets vs Minnesota Vikings	Under 40.5	2024-10-05 22:57:00	2024-10-06 13:30:00	pinnacle	1
2014439134	football - NFL	Settled	Win	Mike McClure	15	13.16	-114	f	Carolina Panthers vs Chicago Bears	Chicago Bears -3.5	2024-10-05 23:08:00	2024-10-06 17:00:00	pinnacle	1
2014439116	football - NFL	Settled	Win	Jimmie Kaylor	15	13.16	-114	f	Carolina Panthers vs Chicago Bears	Chicago Bears -3.5	2024-10-05 23:08:00	2024-10-06 17:00:00	pinnacle	1
2014439810	football - NFL	Settled	Win	Emory Hunt	20	19.61	-102	f	Baltimore Ravens vs Cincinnati Bengals	Baltimore Ravens -2.5	2024-10-05 23:12:00	2024-10-06 17:00:00	pinnacle	1
2014436830	football - NFL	Settled	Loss	Jason La Canfora	10	8.93	-112	f	Breece Hall (Receiving Yards)	Over 26.5 Receiving Yards	2024-10-05 22:56:00	2024-10-06 13:30:00	pinnacle	1
2014438928	football - NFL	Settled	Loss	Dave Richard	20	22.6	113	f	Diontae Johnson (Receptions)	Over 5.5 Receptions	2024-10-05 23:07:00	2024-10-06 17:00:00	pinnacle	1
2011442025	tennis	Settled	Loss	Tennis Zeus	20	16.26	-123	f	Clara Burel  vs Coco Gauff	Under 19 (Games)	2024-09-27 13:25:00	2024-09-27 13:28:00	pinnacle	1
2011495238	tennis	Settled	Loss	A11 Bets	10	7.81	-128	f	Hamad Medjedovic vs Marc-Andrea Huesler	Hamad Medjedovic (Sets)	2024-09-27 16:14:00	2024-09-27 16:35:00	pinnacle	1
2011478347	tennis	Settled	Loss	OutofLineBets	20	15.87	-126	f	Hamad Medjedovic vs Marc-Andrea Huesler	Hamad Medjedovic (Sets)	2024-09-27 15:25:00	2024-09-27 16:35:00	pinnacle	1
2014439424	football - NFL	Settled	Win	Dave Richard	20	15.87	-126	f	Zack Moss (Rushing Yards)	Under 40.5 Rushing Yards	2024-10-05 23:10:00	2024-10-06 17:00:00	pinnacle	1
2014439381	football - NFL	Settled	Loss	Alex Selesnick	20	17.54	-114	f	Chase Brown (Rushing Yards)	Under 32.5 Rushing Yards	2024-10-05 23:10:00	2024-10-06 17:00:00	pinnacle	1
2011948217	football	Settled	Win	ValueLockSports	20	16.53	-121	f	Colorado vs Central Florida	Colorado +14.0	2024-09-28 15:42:00	2024-09-28 20:20:00	pinnacle	1
2011921489	football	Settled	Win	Josh Nagel	7	22.75	325	f	Old Dominion vs Bowling Green	Old Dominion	2024-09-28 14:59:00	2024-09-28 21:00:00	pinnacle	1
2012149753	tennis	Settled	Loss	TennisWinnersOnly	40	36.36	-110	f	Tomas Machac vs Alex Michelsen	Alex Michelsen (Sets)	2024-09-29 00:52:00	2024-09-29 05:00:00	pinnacle	1
2011922508	football	Settled	Win	Matt Severance	10	8.2	-122	f	Louisiana Tech vs Florida International	Florida International +3.0	2024-09-28 15:01:00	2024-09-28 22:00:00	pinnacle	1
2011929820	football	Settled	Win	Emory Hunt	20	17.39	-115	f	Dayton vs Marist	Dayton -7.5	2024-09-28 15:13:00	2024-09-28 16:00:00	pinnacle	1
2012149965	tennis	Settled	Win	TennisWinnersOnly	20	18.02	-111	f	Elina Avanesyan vs Yulia Starodubtseva	Yulia Starodubtseva (Sets)	2024-09-29 00:53:00	2024-09-29 05:10:00	pinnacle	1
2012149826	tennis	Settled	Refunded	TennisWinnersOnly	20	16.95	-118	f	Karen Khachanov  vs Francisco Cerundolo	Francisco Cerundolo (Games) +2.0	2024-09-29 00:52:00	2024-09-29 05:10:00	pinnacle	1
2012003107	football	Settled	Win	A11 Bets	10	9.17	-109	f	Ohio State vs Michigan State	Ohio State -23.5	2024-09-28 17:11:00	2024-09-28 23:30:00	pinnacle	1
2011925629	football	Settled	Win	Mike Tierney	20	18.18	-110	f	Illinois vs Penn State	Illinois +18.0	2024-09-28 15:06:00	2024-09-28 23:30:00	pinnacle	1
2011906720	football	Settled	Win	Bruce Marshall	20	17.7	-113	f	Northern Illinois vs NC State	Northern Illinois +7.5	2024-09-28 14:35:00	2024-09-28 16:00:00	pinnacle	1
2011925568	football	Settled	Win	Bruce Marshall	20	18.18	-110	f	Illinois vs Penn State	Illinois +18.0	2024-09-28 15:06:00	2024-09-28 23:30:00	pinnacle	1
2012150194	tennis	Settled	Loss	Betting4Profit	20	17.7	-113	f	Kei Nishikori  vs Holger Rune	Kei Nishikori (Games) +2.5	2024-09-29 00:54:00	2024-09-29 09:30:00	pinnacle	1
2012001709	football	Settled	Loss	A11 Bets	50	43.1	-116	f	Georgia vs Alabama	Georgia	2024-09-28 17:09:00	2024-09-28 23:44:00	pinnacle	1
2014448147	football - NFL	Settled	Win	Alex Selesnick	20	18.35	-109	f	Josh Jacobs (Rushing Yards)	Over 63.5 Rushing Yards	2024-10-06 00:01:00	2024-10-06 20:25:00	pinnacle	1
2014439948	football - NFL	Settled	Loss	Jason La Canfora	20	18.18	-110	f	Justice Hill (Receptions)	Over 2.5 Receptions	2024-10-05 23:13:00	2024-10-06 17:00:00	pinnacle	1
2014441011	football - NCAA	Settled	Win	TTW	10	8.4	-119	f	Michigan vs Washington	Washington	2024-10-05 23:18:00	2024-10-05 23:30:00	pinnacle	1
2014440775	football - NFL	Settled	Refunded	Mike Tierney	20	17.86	-112	f	Indianapolis Colts vs Jacksonville Jaguars	Jacksonville Jaguars -3.0	2024-10-05 23:17:00	2024-10-06 17:00:00	pinnacle	1
2014440264	football - NFL	Settled	Win	Josh Nagel	13	11.4	-114	f	Buffalo Bills vs Houston Texans	Houston Texans	2024-10-05 23:14:00	2024-10-06 17:00:00	pinnacle	1
2011672261	baseball	Settled	Win	A11 Bets	30	22.73	-132	f	SSG Landers vs Hanwha Eagles	SSG Landers -1.5	2024-09-28 03:33:00	2024-09-28 08:00:00	pinnacle	1
2011674414	tennis	Settled	Loss	OutofLineBets	30	25.21	-119	f	Emilio Nava  vs Henrique Rocha	Henrique Rocha (Games) -1.5	2024-09-28 03:48:00	2024-09-28 12:10:00	pinnacle	1
2011912848	football	Settled	Loss	Jimmie Kaylor	20	17.54	-114	f	Minnesota vs Michigan	Michigan -10.0	2024-09-28 14:44:00	2024-09-28 16:00:00	pinnacle	1
2011909641	football	Settled	Loss	Chip Patterson	10	11.5	115	f	Oklahoma State vs Kansas State	Under 56	2024-09-28 14:39:00	2024-09-28 16:00:00	pinnacle	1
2011901802	tennis	Settled	Win	OutofLineBets	30	23.81	-126	f	Jeffrey John Wolf vs Nishesh Basavareddy	Nishesh Basavareddy (Sets)	2024-09-28 14:28:00	2024-09-28 16:00:00	pinnacle	1
2011908882	football	Settled	Win	Eric Cohen	20	17.39	-115	f	Oklahoma State vs Kansas State	Kansas State -5.0	2024-09-28 14:38:00	2024-09-28 16:00:00	pinnacle	1
2011903063	football	Settled	Loss	OutofLineBets	20	18.87	-106	f	BYU vs Baylor	Baylor -3.0	2024-09-28 14:30:00	2024-09-28 16:00:00	pinnacle	1
2014440257	football - NFL	Settled	Win	Emory Hunt	13	11.4	-114	f	Buffalo Bills vs Houston Texans	Houston Texans	2024-10-05 23:14:00	2024-10-06 17:00:00	pinnacle	1
2014440080	football - NFL	Settled	Loss	Jimmie Kaylor	20	19.05	-105	f	Buffalo Bills vs Houston Texans	Over 47	2024-10-05 23:13:00	2024-10-06 17:00:00	pinnacle	1
2011930418	football	Settled	Loss	Emory Hunt	20	17.39	-115	f	Dartmouth vs Merrimack	Dartmouth -12.0	2024-09-28 15:14:00	2024-09-28 17:00:00	pinnacle	1
2011924189	football	Settled	Loss	Matt Severance	20	19.42	-103	f	UL Monroe vs Troy	Troy -6.5	2024-09-28 15:04:00	2024-09-28 23:00:00	pinnacle	1
2014447513	football - NFL	Settled	Win	Mike Tierney	20	17.54	-114	f	Las Vegas Raiders vs Denver Broncos	Denver Broncos -2.5	2024-10-05 23:59:00	2024-10-06 20:05:00	pinnacle	1
2012149884	tennis	Settled	Win	TennisWinnersOnly	20	18.87	-106	f	Bu Yunchaokete  vs Lorenzo Musetti	Bu Yunchaokete (Games) +3.0	2024-09-29 00:53:00	2024-09-29 03:30:00	pinnacle	1
2012003790	football	Settled	Loss	A11 Bets	5	10.25	205	f	Washington State vs Boise State	Washington State	2024-09-28 17:12:00	2024-09-29 02:00:00	pinnacle	1
2012003631	football	Settled	Win	A11 Bets	5	14.5	290	f	Arizona vs Utah	Arizona	2024-09-28 17:12:00	2024-09-29 02:15:00	pinnacle	1
2011917388	football	Settled	Loss	Micah Roberts	20	18.02	-111	f	TCU vs Kansas	Kansas -1.5	2024-09-28 14:52:00	2024-09-28 19:30:00	pinnacle	1
2011915362	football	Settled	Loss	Chip Patterson	10	8.85	-113	f	Louisville vs Notre Dame	Under 45.5	2024-09-28 14:48:00	2024-09-28 19:30:00	pinnacle	1
2011915117	football	Settled	Loss	Tom Fornelly	10	20.6	206	f	Louisville vs Notre Dame	Louisville	2024-09-28 14:48:00	2024-09-28 19:30:00	pinnacle	1
2011920392	football	Settled	Win	Eric Cohen	20	20	-100	f	Oklahoma vs Auburn	Oklahoma	2024-09-28 14:57:00	2024-09-28 19:30:00	pinnacle	1
2012002623	football	Settled	Loss	A11 Bets	35	34.31	-102	f	North Carolina vs Duke	North Carolina	2024-09-28 17:10:00	2024-09-28 20:00:00	pinnacle	1
2014448302	football - NFL	Settled	Loss	Emory Hunt	15	12.3	-122	f	New York Giants vs Seattle Seahawks	Seattle Seahawks -6.5	2024-10-06 00:02:00	2024-10-06 20:25:00	pinnacle	1
2014447861	football - NFL	Settled	Win	Mike McClure	20	18.52	-108	f	Green Bay Packers vs Los Angeles Rams	Green Bay Packers -3.0	2024-10-06 00:00:00	2024-10-06 20:25:00	pinnacle	1
2014440584	football - NFL	Settled	Win	Alex Selesnick	20	18.02	-111	f	James Cook (Rushing Yards)	Over 59.5 Rushing Yards	2024-10-05 23:16:00	2024-10-06 17:00:00	pinnacle	1
2014440842	football - NFL	Settled	Win	Alex Selesnick	20	18.35	-109	f	Trevor Lawrence (Passing Yards)	Over 234.5 Passing Yards	2024-10-05 23:17:00	2024-10-06 17:00:00	pinnacle	1
bet365_54	baseball	Settled	Win	A11 Bets	25	27.5	110	\N	NC @ Hanwaa	Over 8.5	\N	2024-09-29 08:36:00	Bet365	1
2014448739	football - NFL	Settled	Loss	Emory Hunt	20	17.86	-112	f	Dallas Cowboys vs Pittsburgh Steelers	Pittsburgh Steelers -2.5	2024-10-06 00:05:00	2024-10-07 01:45:00	pinnacle	1
2014448438	football - NFL	Settled	Loss	Eric Cohen	10	14	140	f	DK Metcalf (Anytime TD)	Yes	2024-10-06 00:03:00	2024-10-06 20:25:00	pinnacle	1
2014448465	football - NFL	Settled	Loss	Eric Cohen	10	9.26	-108	f	DK Metcalf (Receiving Yards)	Over 64.5 Receiving Yards	2024-10-06 00:03:00	2024-10-06 20:25:00	pinnacle	1
2014448878	football - NFL	Settled	Loss	Alex Selesnick	20	18.69	-107	f	Rico Dowdle (Rushing Yards)	Under 40.5 Rushing Yards	2024-10-06 00:06:00	2024-10-07 00:20:00	pinnacle	1
2012475193	tennis	Settled	Loss	OutofLineBets	20	16.53	-121	f	Nishesh Basavareddy  vs Edas Butvilas	Over 26.5 (Games)	2024-09-29 17:14:00	2024-09-29 16:00:00	pinnacle	1
2012425832	football	Settled	Loss	Sia Nejad	20	19.61	-102	f	Los Angeles Rams vs Chicago Bears	Los Angeles Rams +3.0	2024-09-29 15:47:00	2024-09-29 17:00:00	pinnacle	1
2012430494	football	Settled	Loss	Sharp Sheet	10	9.52	-105	f	Pittsburgh Steelers vs Indianapolis Colts	Under 40.5	2024-09-29 15:56:00	2024-09-29 17:00:00	pinnacle	1
2012430918	football	Settled	Win	Jimmie Kaylor	10	9.62	-104	f	Denver Broncos vs New York Jets	Under 39.5	2024-09-29 15:57:00	2024-09-29 17:00:00	pinnacle	1
2012423064	football	Settled	Win	Jimmie Kaylor	20	19.05	-105	f	Cincinnati Bengals vs Carolina Panthers	Cincinnati Bengals -4.5	2024-09-29 15:43:00	2024-09-29 17:00:00	pinnacle	1
2012461639	football	Settled	Loss	A11 Bets	30	21.9	-137	f	Minnesota Vikings vs Green Bay Packers	Green Bay Packers	2024-09-29 16:48:00	2024-09-29 17:00:00	pinnacle	1
bet365_55	football	Settled	Loss	Super Boost	20	35	175	\N	Chiefs @ Chargers	Mahomes 200+ yards & 2+ pass TDs	\N	2024-09-29 20:37:00	Bet365	1
2012434508	football	Settled	Loss	Sharp Sheet	20	20.2	101	f	Washington Commanders vs Arizona Cardinals	Arizona Cardinals -3.5	2024-09-29 16:03:00	2024-09-29 20:05:00	pinnacle	1
2012537336	football	Settled	Loss	A11 Bets	20	14.08	-142	f	Cleveland Browns vs Las Vegas Raiders	Cleveland Browns	2024-09-29 19:35:00	2024-09-29 20:25:00	pinnacle	1
2012436754	football	Settled	Loss	Josh Nagel	20	17.7	-113	f	Cleveland Browns vs Las Vegas Raiders	Cleveland Browns -2.5	2024-09-29 16:07:00	2024-09-29 20:25:00	pinnacle	1
2014449057	football - NFL	Settled	Loss	Jason La Canfora	10	13.5	135	f	Justin Fields (Anytime TD)	Yes +0.5 Touchdowns	2024-10-06 00:07:00	2024-10-07 00:20:00	pinnacle	1
2012426760	football	Settled	Loss	Matt Severance	10	11.4	114	f	Aaron Jones (Anytime TD)	Yes	2024-09-29 15:49:00	2024-09-29 17:00:00	pinnacle	1
2012439855	football	Settled	Win	Alex Selesnick	20	18.35	-109	f	Dalton Kincaid (Receiving Yards)	Over 39.5 Receiving Yards	2024-09-29 16:12:00	2024-09-30 00:20:00	pinnacle	1
2012424314	football	Settled	Loss	Larry Hartstein	10	9.43	-106	f	Caleb Williams (Longest Completion)	Over 35.5 LongestPassCompYds	2024-09-29 15:45:00	2024-09-29 17:00:00	pinnacle	1
2012433406	football	Settled	Loss	Daniel Vithlani	20	16.81	-119	f	Marvin Harrison Jr. (Receiving Yards)	Over 70.5 Receiving Yards	2024-09-29 16:02:00	2024-09-29 20:05:00	pinnacle	1
2014448531	football - NFL	Settled	Loss	Matt Severance	10	8.26	-121	f	New York Giants vs Seattle Seahawks	New York Giants - Under 18.5	2024-10-06 00:04:00	2024-10-06 20:25:00	pinnacle	1
2014448305	football - NFL	Settled	Loss	Jimmie Kaylor	15	12.3	-122	f	New York Giants vs Seattle Seahawks	Seattle Seahawks -6.5	2024-10-06 00:02:00	2024-10-06 20:25:00	pinnacle	1
2014448379	football - NFL	Settled	Loss	Dave Richard	30	24.59	-122	f	Geno Smith (Pass Attempts)	Under 34.5 Pass Attempts	2024-10-06 00:03:00	2024-10-06 20:25:00	pinnacle	1
2014452521	baseball - MLB	Settled	Loss	TTW	10	12.3	123	f	San Diego Padres vs Los Angeles Dodgers	San Diego Padres	2024-10-06 00:23:00	2024-10-06 00:38:00	pinnacle	1
2012432639	football	Settled	Win	Josh Nagel	20	20	-100	f	Philadelphia Eagles vs Tampa Bay Buccaneers	Tampa Bay Buccaneers +1.0	2024-09-29 16:00:00	2024-09-29 17:00:00	pinnacle	1
2012421244	football	Settled	Loss	Daniel Vithlani	20	18.52	-108	f	New Orleans Saints vs Atlanta Falcons	Atlanta Falcons -2.5	2024-09-29 15:40:00	2024-09-29 17:00:00	pinnacle	1
2012429744	football	Settled	Loss	R.J. White	20	18.18	-110	f	Jacksonville Jaguars vs Houston Texans	Houston Texans -5.5	2024-09-29 15:55:00	2024-09-29 17:00:00	pinnacle	1
2012430890	football	Settled	Win	Josh Nagel	10	9.62	-104	f	Denver Broncos vs New York Jets	Under 39.5	2024-09-29 15:57:00	2024-09-29 17:00:00	pinnacle	1
2012430856	football	Settled	Win	Daniel Vithlani	10	9.62	-104	f	Denver Broncos vs New York Jets	Under 39.5	2024-09-29 15:57:00	2024-09-29 17:00:00	pinnacle	1
2012423392	football	Settled	Win	Daniel Vithlani	20	18.69	-107	f	Cincinnati Bengals vs Carolina Panthers	Over 47	2024-09-29 15:43:00	2024-09-29 17:00:00	pinnacle	1
2012434269	football	Settled	Win	R.J. White	20	20.2	101	f	Washington Commanders vs Arizona Cardinals	Over 49	2024-09-29 16:03:00	2024-09-29 20:05:00	pinnacle	1
2012536558	football	Settled	Loss	A11 Bets	20	16.67	-120	t	Parlay	Over 34 + Kansas City Chiefs -2.5	2024-09-29 19:32:00	2024-09-29 23:15:00	pinnacle	1
2012537597	football	Settled	Loss	A11 Bets	5	26.26	525	t	Parlay	Over 38.5 + Kansas City Chiefs + Cleveland Browns + Baltimore Ravens	2024-09-29 19:36:00	2024-09-29 23:15:00	pinnacle	1
2012461772	football	Settled	Win	A11 Bets	40	28.8	-139	t	Parlay	San Francisco 49ers + Cincinnati Bengals	2024-09-29 16:49:00	2024-09-29 23:17:00	pinnacle	1
2012439644	football	Settled	Win	Josh Nagel	20	17.54	-114	f	Buffalo Bills vs Baltimore Ravens	Baltimore Ravens -2.5	2024-09-29 16:12:00	2024-09-30 00:20:00	pinnacle	1
2014457760	tennis - ATP	Settled	Win	TennisWinnersOnly	20	17.39	-115	f	Stefanos Tsitsipas vs Alexandre Muller	Stefanos Tsitsipas (Sets) -1.5	2024-10-06 00:49:00	2024-10-08 04:30:00	pinnacle	1
2014457850	tennis - WTA	Settled	Loss	TennisWinnersOnly	20	18.08	-111	t	Parlay	Yulia Starodubtseva + Olivia Gadecki	2024-10-06 00:49:00	2024-10-06 04:57:00	pinnacle	1
2014457954	tennis - WTA	Settled	Loss	TennisWinnersOnly	20	12.05	-166	f	Kamilla Rakhimova vs Bernarda Pera	Kamilla Rakhimova (Sets)	2024-10-06 00:49:00	2024-10-06 03:09:00	pinnacle	1
bet365_65	mma	Settled	Loss	Boost	5	20	350	\N	UFC 307 parlay	Aldo, Pena/Pennington O4.5 rounds, Pereira by KO/TKO	\N	2024-10-06 03:30:00	Bet365	1
2012426488	football	Settled	Win	Dave Richard	30	25.64	-117	f	Aaron Jones (Rushing Yards)	Over 57.5 Rushing Yards	2024-09-29 15:49:00	2024-09-29 17:00:00	pinnacle	1
2012424760	football	Settled	Loss	Alex Selesnick	20	18.18	-110	f	Kyren Williams (Rushing Yards)	Under 79.5 Rushing Yards	2024-09-29 15:45:00	2024-09-29 17:00:00	pinnacle	1
2012435917	football	Settled	Loss	Sia Nejad	10	8.93	-112	f	DeMario Douglas (Receiving Yards)	Over 31.5 Receiving Yards	2024-09-29 16:06:00	2024-09-29 20:05:00	pinnacle	1
bet99_25	mma	Settled	Win	me	10	14	140	\N	UFC 307 Pena vs Pennington	Pena ML	\N	2024-10-06 03:32:00	Bet99	1
2014488699	baseball - KBO	Settled	Win	A11 Bets	5	7.9	158	f	KT Wiz vs LG Twins	LG Twins -1.5	2024-10-06 03:43:00	2024-10-06 05:00:00	pinnacle	1
2014488654	baseball - KBO	Settled	Win	A11 Bets	10	11.3	113	f	KT Wiz vs LG Twins	LG Twins - Over 4.5	2024-10-06 03:43:00	2024-10-06 05:00:00	pinnacle	1
2014488616	baseball - KBO	Settled	Win	A11 Bets	30	22.39	-134	f	KT Wiz vs LG Twins	LG Twins	2024-10-06 03:43:00	2024-10-06 05:00:00	pinnacle	1
2014451831	tennis - WTA	Settled	Win	TTW	15	21.15	141	f	Ajla Tomljanovic vs Clara Tauson	Ajla Tomljanovic (Sets)	2024-10-06 00:20:00	2024-10-06 08:49:00	pinnacle	1
2014481239	tennis - ATP	Settled	Win	OutofLineBets	20	18.18	-110	f	Carlos Alcaraz  vs Yibing WU	Yibing WU (Games) +6.0	2024-10-06 03:02:00	2024-10-06 11:35:00	pinnacle	1
2014440248	football - NFL	Settled	Win	Mike Tierney	13	11.4	-114	f	Buffalo Bills vs Houston Texans	Houston Texans	2024-10-05 23:14:00	2024-10-06 17:00:00	pinnacle	1
2014451760	tennis - ATP	Settled	Win	TTW	20	22.8	114	f	Jordan Thompson vs Tallon Griekspoor	Tallon Griekspoor (Sets)	2024-10-06 00:20:00	2024-10-07 05:05:00	pinnacle	1
2014457788	tennis - ATP	Settled	Win	TennisWinnersOnly	20	14.59	-138	t	Parlay	Daniil Medvedev + Tomas Machac	2024-10-06 00:49:00	2024-10-08 06:08:00	pinnacle	1
2014761617	tennis - ATP	Settled	Win	Tennis With T	20	19.61	-102	f	Federico Coria vs Francisco Comesana	Francisco Comesana (Sets)	2024-10-06 15:32:00	2024-10-06 16:20:00	pinnacle	1
2014761950	tennis - ATP	Settled	Loss	OutofLineBets	30	23.62	-127	f	Nishesh Basavareddy  vs Eliot Spizzirri	Eliot Spizzirri (Games) +4.0	2024-10-06 15:32:00	2024-10-06 20:30:00	pinnacle	1
2014852284	football - NFL	Settled	Win	OutofLineBets	20	20.2	101	f	Las Vegas Raiders vs Denver Broncos	Denver Broncos -3.0	2024-10-06 18:01:00	2024-10-06 20:05:00	pinnacle	1
2014852354	tennis - ATP	Settled	Win	OutofLineBets	30	24.59	-122	f	Christian Langmo vs Trey Hilderbrand	Trey Hilderbrand (Sets)	2024-10-06 18:01:00	2024-10-07 20:00:00	pinnacle	1
2012582738	football	Settled	Win	Sharp Sheet	50	36.23	-138	f	Buffalo Bills vs Baltimore Ravens	Baltimore Ravens	2024-09-29 23:29:00	2024-09-30 00:20:00	pinnacle	1
2012569944	football	Settled	Win	A11 Bets	40	28.78	-139	f	Buffalo Bills vs Baltimore Ravens	Baltimore Ravens	2024-09-29 22:02:00	2024-09-30 00:20:00	pinnacle	1
2012584969	tennis	Settled	Win	TennisWinnersOnly	20	19.76	-102	t	Parlay	Daniil Medvedev + Ugo Humbert	2024-09-29 23:45:00	2024-09-30 10:59:00	pinnacle	1
2012585040	tennis	Settled	Loss	TennisWinnersOnly	40	33.33	-120	f	Daria Kasatkina vs Amanda Anisimova	Daria Kasatkina (Sets)	2024-09-29 23:45:00	2024-09-30 09:57:00	pinnacle	1
2012597027	baseball	Settled	Win	A11 Bets	15	20.1	134	f	G1 New York Mets vs G1 Atlanta Braves	G1 New York Mets	2024-09-30 01:18:00	2024-09-30 17:10:00	pinnacle	1
2012583026	football	Settled	Win	Josh Nagel	10	8.55	-117	f	Seattle Seahawks vs Detroit Lions	Detroit Lions -3.5	2024-09-29 23:31:00	2024-10-01 00:15:00	pinnacle	1
2012583016	football	Settled	Win	Mike Tierney	10	8.55	-117	f	Seattle Seahawks vs Detroit Lions	Detroit Lions -3.5	2024-09-29 23:31:00	2024-10-01 00:15:00	pinnacle	1
bet99_23	football	Settled	Win	Boost	5	20	400	\N	Bengals @ Panthers	Chase Brown 50+ rushing yarrds	\N	2024-09-29 23:22:00	Bet99	1
bet99_24	football	Settled	Win	Boost	5	18.75	375	\N	Bengals @ Panthers	Chuba Hubbard 75+ yards & 1+ TD	\N	2024-09-29 23:23:00	Bet99	1
2014935307	baseball - MLB	Settled	Win	Sharp Sheet	10	13.6	136	f	San Diego Padres vs Los Angeles Dodgers	San Diego Padres	2024-10-06 23:53:00	2024-10-07 00:03:00	pinnacle	1
2012583187	football	Settled	Win	Jason La Canfora	10	8.62	-116	f	David Montgomery (Anytime TD)	Yes +0.5 Touchdowns	2024-09-29 23:32:00	2024-10-01 00:15:00	pinnacle	1
2014935305	baseball - MLB	Settled	Win	TTW	10	13.6	136	f	San Diego Padres vs Los Angeles Dodgers	San Diego Padres	2024-10-06 23:53:00	2024-10-07 00:03:00	pinnacle	1
2014922507	baseball - MLB	Settled	Win	Micah Roberts	20	26.2	131	f	San Diego Padres vs Los Angeles Dodgers	San Diego Padres	2024-10-06 22:10:00	2024-10-07 00:03:00	pinnacle	1
2014934089	football - NFL	Settled	Win	Thomas Casale	20	19.05	-105	f	Jalen Tolbert (Receiving Yards)	Over 34.5 Receiving Yards	2024-10-06 23:42:00	2024-10-07 00:20:00	pinnacle	1
2014934950	football - NFL	Settled	Loss	A11 Bets	30	25	-120	t	Parlay	Over 36 + New Orleans Saints +12.0	2024-10-06 23:49:00	2024-10-08 03:17:00	pinnacle	1
2014935056	football - NFL	Settled	Win	Jason La Canfora	7	6.67	-105	f	New Orleans Saints vs Kansas City Chiefs	Under 43	2024-10-06 23:50:00	2024-10-08 00:15:00	pinnacle	1
2014935054	football - NFL	Settled	Win	R.J. White	7	6.67	-105	f	New Orleans Saints vs Kansas City Chiefs	Under 43	2024-10-06 23:50:00	2024-10-08 00:15:00	pinnacle	1
2014935052	football - NFL	Settled	Win	Daniel Vithlani	7	6.67	-105	f	New Orleans Saints vs Kansas City Chiefs	Under 43	2024-10-06 23:50:00	2024-10-08 00:15:00	pinnacle	1
2014934868	football - NFL	Settled	Loss	Daniel Vithlani	10	8.93	-112	f	New Orleans Saints vs Kansas City Chiefs	New Orleans Saints +5.5	2024-10-06 23:48:00	2024-10-08 00:15:00	pinnacle	1
2012585009	tennis	Settled	Win	TennisWinnersOnly	20	13.51	-148	f	Madison Keys vs Beatriz Haddad Maia	Madison Keys (Sets)	2024-09-29 23:45:00	2024-09-30 03:08:00	pinnacle	1
2012587138	tennis	Settled	Loss	OutofLineBets	20	14.93	-134	f	Mikhail Kukushkin vs Li Tu	Mikhail Kukushkin (Sets)	2024-09-30 00:00:00	2024-09-30 04:10:00	pinnacle	1
2012598772	tennis	Settled	Win	OutofLineBets	20	16.67	-120	f	Rigele Te  vs Terence Atmane	Rigele Te (Games) +4.0	2024-09-30 01:30:00	2024-09-30 06:15:00	pinnacle	1
2012583023	football	Settled	Win	R.J. White	10	8.55	-117	f	Seattle Seahawks vs Detroit Lions	Detroit Lions -3.5	2024-09-29 23:31:00	2024-10-01 00:15:00	pinnacle	1
2012583011	football	Settled	Win	Micah Roberts	10	8.55	-117	f	Seattle Seahawks vs Detroit Lions	Detroit Lions -3.5	2024-09-29 23:31:00	2024-10-01 00:15:00	pinnacle	1
2014934856	football - NFL	Settled	Loss	Mike Tierney	10	8.93	-112	f	New Orleans Saints vs Kansas City Chiefs	New Orleans Saints +5.5	2024-10-06 23:48:00	2024-10-08 00:15:00	pinnacle	1
2014934851	football - NFL	Settled	Loss	R.J. White	10	8.93	-112	f	New Orleans Saints vs Kansas City Chiefs	New Orleans Saints +5.5	2024-10-06 23:48:00	2024-10-08 00:15:00	pinnacle	1
bet365_66	football - NFL	Settled	Loss	Super Boost	13	20.8	160	\N	Cowboys @ Steelers	50+ rec. yards for Pickens & Lamb	\N	2024-10-06 20:25:00	Bet365	1
bet365_56	football	Settled	Loss	Super Boost	25	25	100	\N	Bills @ Ravens	Josh Allen & Lamar Jackson 25+ rushing yards	\N	2024-09-30 02:55:00	Bet365	1
2012788474	tennis	Settled	Loss	Tennis Zeus	20	17.09	-117	f	Jannik Sinner  vs Bu Yunchaokete	Under 20 (Games)	2024-09-30 22:00:00	2024-10-01 11:30:00	pinnacle	1
2012795111	tennis	Settled	Win	Betting4Profit	20	16.67	-120	f	Arthur Fils  vs Ugo Humbert	Over 22.5 (Games)	2024-09-30 23:10:00	2024-10-01 10:15:00	pinnacle	1
2014949649	tennis - WTA	Settled	Win	TTW	15	12.5	-120	f	Dayana Yastremska vs Erika Andreeva	Erika Andreeva (Sets)	2024-10-07 02:20:00	2024-10-07 09:14:00	pinnacle	1
2014941974	tennis - WTA	Settled	Win	TennisWinnersOnly	20	16.67	-120	f	Dayana Yastremska vs Erika Andreeva	Erika Andreeva (Sets)	2024-10-07 00:50:00	2024-10-07 09:14:00	pinnacle	1
2014942095	tennis - ATP	Settled	Loss	OutofLineBets	20	16.95	-118	f	Dennis Novak  vs Miguel Damas	Miguel Damas (Games) +4.0	2024-10-07 00:51:00	2024-10-07 09:00:00	pinnacle	1
2014941994	tennis - WTA	Settled	Win	TennisWinnersOnly	20	16.95	-118	f	Diane Parry vs Hailey Baptiste	Hailey Baptiste (Sets)	2024-10-07 00:50:00	2024-10-07 11:16:00	pinnacle	1
2014942012	tennis - WTA	Settled	Loss	TennisWinnersOnly	20	18.52	-108	f	Anna Bondar  vs Anna Kalinskaya	Anna Bondar (Games) +5.0	2024-10-07 00:50:00	2024-10-07 13:00:00	pinnacle	1
2014949627	tennis - ATP	Settled	Loss	TTW	20	17.5	-115	t	Parlay	Stefanos Tsitsipas + Ugo Humbert	2024-10-07 02:20:00	2024-10-08 07:04:00	pinnacle	1
2012689519	tennis	Settled	Loss	IllicitPicks	20	18.87	-106	f	Andrey Rublev  vs Bu Yunchaokete	Andrey Rublev (Sets)	2024-09-30 13:41:00	2024-09-30 13:20:00	pinnacle	1
2012794239	football	Settled	Win	Jimmie Kaylor	20	17.54	-114	f	Tennessee Titans vs Miami Dolphins	Under 7	2024-09-30 23:03:00	2024-09-30 23:30:00	pinnacle	1
2012727229	tennis	Settled	Refunded	OutofLineBets	20	19.8	-101	f	Remy Bertola  vs Kaylan Bigun	Kaylan Bigun (Games) +3.0	2024-09-30 17:01:00	2024-09-30 23:25:00	pinnacle	1
2012792632	football	Settled	Loss	TennisWinnersOnly	20	18.18	-110	f	Seattle Seahawks vs Detroit Lions	Under 47	2024-09-30 22:42:00	2024-10-01 00:15:00	pinnacle	1
2014947963	baseball - MLB	Settled	Loss	Edge	6.29	40	636	f	San Diego Padres vs Los Angeles Dodgers	Los Angeles Dodgers	2024-10-07 01:58:00	2024-10-07 00:03:00	pinnacle	1
2014949638	tennis - WTA	Settled	Win	TTW	10	14.1	141	f	Leylah Fernandez vs Diana Shnaider	Leylah Fernandez (Sets)	2024-10-07 02:20:00	2024-10-07 05:37:00	pinnacle	1
2015017726	baseball - MLB	Settled	Win	Matt Severance	10	8.13	-123	f	Detroit Tigers vs Cleveland Guardians	Detroit Tigers	2024-10-07 13:54:00	2024-10-07 20:09:00	pinnacle	1
bet365_67	tennis	Settled	Loss	TennisWinnersOnly	20	48	240	\N	Cobolli vs Wawrinka	Wawrinka ML live	\N	2024-10-07 11:04:00	Bet365	1
2015111131	tennis - WTA	Settled	Refunded	TTW	15	14.71	-102	f	Paula Badosa  vs Ajla Tomljanovic	Ajla Tomljanovic (Games) +5.5	2024-10-07 22:58:00	2024-10-08 10:30:00	pinnacle	1
2015111104	tennis - WTA	Settled	Win	TTW	20	15.5	-129	f	Marie Bouzkova vs Veronika Kudermetova	Veronika Kudermetova (Sets)	2024-10-07 22:57:00	2024-10-08 08:32:00	pinnacle	1
2012713948	tennis	Settled	Win	Tennis Titan	30	23.62	-127	f	Enzo Couacaud vs Juan Ignacio Londero	Enzo Couacaud (Sets)	2024-09-30 15:56:00	2024-09-30 16:20:00	pinnacle	1
2012727075	tennis	Settled	Win	OutofLineBets	30	23.44	-128	f	Juan Bautista Torres vs Juan Pablo Ficovich	Juan Bautista Torres (Sets)	2024-09-30 17:01:00	2024-09-30 22:00:00	pinnacle	1
2012794199	football	Settled	Win	Jimmie Kaylor	20	18.69	-107	f	Tennessee Titans vs Miami Dolphins	Under 18.5	2024-09-30 23:03:00	2024-09-30 23:30:00	pinnacle	1
2012792615	football	Settled	Win	TennisWinnersOnly	20	16.53	-121	f	Tennessee Titans vs Miami Dolphins	Tennessee Titans +3.0	2024-09-30 22:42:00	2024-09-30 23:30:00	pinnacle	1
2012694033	football	Settled	Win	A11 Bets	30	21.28	-141	f	Seattle Seahawks vs Detroit Lions	Detroit Lions -3.0	2024-09-30 14:12:00	2024-10-01 00:15:00	pinnacle	1
bet99_26	tennis	Settled	Win	TennisWinnersOnly	20	15.38	-130	\N	Bouzkova vs Kudermetova	Kudermetova ML	\N	2024-10-08 09:44:00	Bet99	1
bet365_58	football	Settled	Loss	Super Boost	20	30	150	\N	Seahawks @ Lions	Metcalf & St. Brown 50+ rec. yards	\N	2024-10-01 00:48:00	Bet365	1
bet365_57	football	Settled	Loss	SD	10	56.25	375	\N	Seahawks @ Lions	Lions ML - Gibbs 1+ TD - Metcalf & St. Browns 50+ rec yards	\N	2024-09-30 23:47:00	Bet365	1
2015133073	tennis - ATP	Settled	Win	TennisWinnersOnly	20	23.4	117	f	Frances Tiafoe vs Roman Safiullin	Roman Safiullin (Sets)	2024-10-08 01:43:00	2024-10-08 08:45:00	pinnacle	1
2015111043	tennis - ATP	Settled	Win	TTW	20	25.2	126	f	Frances Tiafoe vs Roman Safiullin	Roman Safiullin (Sets)	2024-10-07 22:57:00	2024-10-08 08:45:00	pinnacle	1
2015133004	tennis - ATP	Settled	Loss	OutofLineBets	20	17.86	-112	f	Albert Ramos-Vinolas vs Elmer Moller	Albert Ramos-Vinolas (Sets)	2024-10-08 01:42:00	2024-10-08 11:30:00	pinnacle	1
2015111022	tennis - ATP	Settled	Loss	TTW	20	14.6	-137	f	David Goffin vs Marcos Giron	Marcos Giron (Sets)	2024-10-07 22:57:00	2024-10-08 11:30:00	pinnacle	1
2015016767	tennis - ATP	Settled	Loss	OutofLineBets	20	15.5	-129	f	Arthur Gea vs Bernabe Zapata Miralles	Bernabe Zapata Miralles (Sets)	2024-10-07 13:49:00	2024-10-07 16:15:00	pinnacle	1
2015017703	baseball - MLB	Settled	Refunded	DirtyBubbleBets	10	6.99	-143	f	Detroit Tigers vs Cleveland Guardians	Detroit Tigers  0	2024-10-07 13:54:00	2024-10-07 20:09:00	pinnacle	1
2015017719	baseball - MLB	Settled	Win	DirtyBubbleBets	10	8.13	-123	f	Detroit Tigers vs Cleveland Guardians	Detroit Tigers	2024-10-07 13:54:00	2024-10-07 20:09:00	pinnacle	1
2015099404	baseball - MLB	Settled	Win	OutofLineBets	20	17.7	-113	f	Kansas City Royals vs New York Yankees	Under 7.5	2024-10-07 21:09:00	2024-10-07 23:39:00	pinnacle	1
2015082059	football - NFL	Settled	Win	OutofLineBets	30	26.79	-112	f	New Orleans Saints vs Kansas City Chiefs	Under 43.5	2024-10-07 18:58:00	2024-10-08 00:15:00	pinnacle	1
2015111081	tennis - WTA	Settled	Loss	TTW	20	17.21	-117	t	Parlay	Liudmila Samsonova + Amanda Anisimova	2024-10-07 22:57:00	2024-10-08 05:02:00	pinnacle	1
2015133276	tennis - WTA	Settled	Loss	TennisWinnersOnly	20	17.7	-113	f	Sofia Kenin  vs Ekaterina Alexandrova	Sofia Kenin (Games) +2.5	2024-10-08 01:44:00	2024-10-08 03:08:00	pinnacle	1
2015082008	tennis - ATP	Settled	Win	OutofLineBets	30	27.27	-110	f	Tomas Machac  vs Aleksandar Vukic	Tomas Machac (Games) -3.0	2024-10-07 18:58:00	2024-10-08 04:30:00	pinnacle	1
2015120291	football - NFL	Settled	Loss	ValueLockSports	20	17.86	-112	f	Alvin Kamara (Anytime TD)	Yes	2024-10-08 00:08:00	2024-10-08 00:15:00	pinnacle	1
2015120822	football - NFL	Settled	Loss	Jimmie Kaylor	20	16.53	-121	f	Chris Olave (Receiving Yards)	Over 58.5 Receiving Yards	2024-10-08 00:12:00	2024-10-08 00:15:00	pinnacle	1
2015017737	baseball - MLB	Settled	Win	A11 Bets	10	8.13	-123	f	Detroit Tigers vs Cleveland Guardians	Detroit Tigers	2024-10-07 13:54:00	2024-10-07 20:09:00	pinnacle	1
2015111009	tennis - ATP	Settled	Win	TTW	40	28.37	-141	f	Alexei Popyrin vs Grigor Dimitrov	Grigor Dimitrov (Sets)	2024-10-07 22:57:00	2024-10-08 07:35:00	pinnacle	1
2012801701	tennis	Settled	Win	TennisWinnersOnly	20	19.61	-102	f	Paula Badosa  vs Jessica Pegula	Paula Badosa (Games) +2.5	2024-10-01 00:15:00	2024-10-01 03:08:00	pinnacle	1
2012801624	tennis	Settled	Win	TennisWinnersOnly	20	17.86	-112	f	Daniil Medvedev vs Carlos Alcaraz	Carlos Alcaraz (Sets) -1.5	2024-10-01 00:14:00	2024-10-01 08:15:00	pinnacle	1
2012817250	baseball	Settled	Loss	A11 Bets	15	15.9	106	f	SSG Landers vs KT Wiz	SSG Landers	2024-10-01 03:29:00	2024-10-01 08:00:00	pinnacle	1
2012818195	tennis	Settled	Loss	OutofLineBets	20	16.39	-122	f	Richard Gasquet  vs Nikoloz Basilashvili	Nikoloz Basilashvili (Games) +3.5	2024-10-01 03:48:00	2024-10-01 14:30:00	pinnacle	1
2015143584	baseball - KBO	Settled	Win	A11 Bets	10	9.17	-109	f	LG Twins vs KT Wiz	LG Twins +0.5	2024-10-08 03:25:00	2024-10-08 09:30:00	pinnacle	1
2015143538	baseball - KBO	Settled	Win	A11 Bets	30	36.9	123	f	LG Twins vs KT Wiz	LG Twins	2024-10-08 03:24:00	2024-10-08 09:30:00	pinnacle	1
bet365_60	baseball	Settled	Win	A11 Bets	15	10	-150	\N	Lotto @ NC	Lotto	\N	2024-10-01 20:31:00	Bet365	1
bet365_59	baseball	Settled	Loss	A11 Bets	10	10.5	105	\N	SSG @ KT	1st inning tie	\N	2024-10-01 08:31:00	Bet365	1
2015143398	tennis - ATP	Settled	Loss	Betting4Profit	20	17.24	-116	f	Jiri Lehecka  vs Holger Rune	Jiri Lehecka (Games) +2.5	2024-10-08 03:22:00	2024-10-08 09:15:00	pinnacle	1
2012809557	tennis	Settled	Win	OutofLineBets	20	17.54	-114	f	Adam Walton vs Terence Atmane	Terence Atmane (Sets)	2024-10-01 01:28:00	2024-10-01 04:15:00	pinnacle	1
2012801722	tennis	Settled	Win	TennisWinnersOnly	20	16.39	-122	f	Yulia Starodubtseva  vs Anna Kalinskaya	Yulia Starodubtseva (Games) +3.5	2024-10-01 00:15:00	2024-10-01 08:08:00	pinnacle	1
2012801669	tennis	Settled	Win	TennisWinnersOnly	20	19.23	-104	f	Arthur Fils  vs Ugo Humbert	Over 23 (Games)	2024-10-01 00:14:00	2024-10-01 10:15:00	pinnacle	1
2012912899	baseball	Settled	Loss	OutofLineBets	20	17.09	-117	f	New York Mets vs Milwaukee Brewers	Under 7.5	2024-10-01 15:18:00	2024-10-01 21:32:00	pinnacle	1
2012913374	football	Settled	Win	A11 Bets	30	24.59	-122	f	Tampa Bay Buccaneers vs Atlanta Falcons	Atlanta Falcons	2024-10-01 15:21:00	2024-10-04 00:15:00	pinnacle	1
iNgkzL9zWwnJ	n/a	Settled	Loss	Me	5	45.25	905	t	Parlay	Parlay	2024-08-24 23:41:47	2024-08-24 23:41:47	bet365	1
2012945990	tennis	Settled	Win	OutofLineBets	15	15.45	103	f	Eliot Spizzirri  vs Ozan Baris Colak	Ozan Baris Colak (Games) +4.0	2024-10-01 17:23:00	2024-10-01 18:00:00	pinnacle	1
2012926472	baseball	Settled	Loss	A11 Bets	20	14.6	-137	f	Detroit Tigers vs Houston Astros	Houston Astros	2024-10-01 16:20:00	2024-10-01 18:32:00	pinnacle	1
2013025719	baseball	Settled	Loss	A11 Bets	30	21.13	-142	f	New York Mets vs Milwaukee Brewers	Milwaukee Brewers	2024-10-01 21:17:00	2024-10-01 21:32:00	pinnacle	1
2013036902	baseball	Settled	Win	A11 Bets	40	22.6	-177	f	Atlanta Braves vs San Diego Padres	San Diego Padres	2024-10-01 23:13:00	2024-10-02 00:38:00	pinnacle	1
2012971897	tennis	Settled	Win	OutofLineBets	30	24.59	-122	f	Yibing WU  vs Sumit Nagal	Yibing WU (Games) -1.5	2024-10-01 18:39:00	2024-10-02 05:00:00	pinnacle	1
2013050777	tennis	Settled	Loss	TennisWinnersOnly	40	32.52	-123	f	Luca Nardi  vs Alexandre Muller	Luca Nardi (Games) +3.0	2024-10-02 01:30:00	2024-10-02 04:45:00	pinnacle	1
2013050844	tennis	Settled	Loss	TennisWinnersOnly	20	13.89	-144	f	Pablo Carreno-Busta vs Botic Van De Zandschulp	Pablo Carreno-Busta (Sets)	2024-10-02 01:31:00	2024-10-02 04:45:00	pinnacle	1
2013050979	tennis	Settled	Win	TennisWinnersOnly	20	15.87	-126	f	Magda Linette vs Mirra Andreeva	Mirra Andreeva (Sets) -1.5	2024-10-02 01:32:00	2024-10-02 08:04:00	pinnacle	1
2013050826	tennis	Settled	Win	TennisWinnersOnly	20	21.8	109	f	Fabio Fognini vs Luciano Darderi	Fabio Fognini (Sets)	2024-10-02 01:31:00	2024-10-02 07:15:00	pinnacle	1
2013050809	tennis	Settled	Win	TennisWinnersOnly	40	30.77	-130	f	Jannik Sinner vs Carlos Alcaraz	Carlos Alcaraz (Sets)	2024-10-02 01:31:00	2024-10-02 09:15:00	pinnacle	1
2013050737	tennis	Settled	Loss	Tennis Zeus	20	16.81	-119	f	Emilio Nava  vs Pedro Araujo	Under 19 (Games)	2024-10-02 01:30:00	2024-10-02 12:10:00	pinnacle	1
2013050935	tennis	Settled	Win	TennisWinnersOnly	30	20.58	-146	t	Parlay	Aryna Sabalenka + Qinwen Zheng	2024-10-02 01:31:00	2024-10-02 15:56:00	pinnacle	1
2004779877	tennis	Settled	Loss	A11 Bets	15	17.25	114	t	Parlay	Over 3.5  (-213)	2024-09-04 15:31:00	2024-09-04 20:13:00	pinnacle	1
2013054036	tennis	Settled	Win	OutofLineBets	30	23.08	-130	f	Jannik Sinner vs Carlos Alcaraz	Carlos Alcaraz (Sets)	2024-10-02 02:06:00	2024-10-02 09:15:00	pinnacle	1
2008554756	baseball	Settled	Win	Picks Office	20	15.87	-126	f	Oakland Athletics vs Chicago Cubs	Under 8.5	2024-09-17 22:40:00	2024-09-17 23:40:00	pinnacle	1
2008738447	soccer	Settled	Loss	A11 Bets	15	13.35	-113	t	Parlay	Manchester City (-218)	2024-09-18 16:02:00	2024-09-18 20:55:00	pinnacle	1
bet365_28	soccer	Settled	Loss	A11 Bets	10	7.07	-146	\N	3 legs parlay	Tie or Arsenal, Tie or Barcelona, Tie or Atletico	\N	2024-09-19 17:49:00	Bet365	1
bet365_29	football	Settled	Win	ChaseTheLock	20	20	100	\N	Patriots @ Jets	Breece Hall over 15.5 Carries	\N	2024-09-19 23:51:00	Pinnacle	1
2007224574	football	Settled	Win	Emory Hunt	20	19.42	-103	f	UNLV vs Kansas	UNLV +9.0	2024-09-13 21:02:00	2024-09-13 23:00:00	pinnacle	1
2007224773	baseball	Settled	Loss	Matt Severance	20	14.29	-140	f	Chicago Cubs vs Colorado Rockies	Chicago Cubs	2024-09-13 21:03:00	2024-09-14 00:40:00	pinnacle	1
2007225691	baseball	Settled	Win	Wager Analyst	20	15.38	-130	f	Oakland Athletics vs Chicago White Sox	Oakland Athletics	2024-09-13 21:08:00	2024-09-13 23:40:00	pinnacle	1
2008551959	tennis	Settled	Loss	Sopranos Picks	20	22.9	114	t	Parlay	Katie Volynets (Sets) (-398)	2024-09-17 22:16:00	2024-09-19 15:25:00	pinnacle	1
2007225692	baseball	Settled	Loss	Wager Analyst	20	18.69	-107	f	Los Angeles Dodgers vs Atlanta Braves	Los Angeles Dodgers	2024-09-13 21:08:00	2024-09-13 23:20:00	pinnacle	1
bet365_46	football	Settled	Loss	Super Boost	20	30	150	\N	2 legs - Ravens @ Dallas	Flowers & Lamb Over 50 rec. yards	\N	2024-09-22 19:43:00	Bet365	1
2007225693	baseball	Settled	Loss	Wager Analyst	40	28.57	-140	f	Chicago Cubs vs Colorado Rockies	Chicago Cubs	2024-09-13 21:08:00	2024-09-14 00:40:00	pinnacle	1
2007232491	football	Settled	Win	A11 Bets	20	16.26	-123	f	Arizona vs Kansas State	Kansas State -6.5	2024-09-13 21:55:00	2024-09-14 00:00:00	pinnacle	1
2007253802	baseball	Settled	Loss	Wager Analyst	20	16.95	-118	f	Milwaukee Brewers vs Arizona Diamondbacks	Arizona Diamondbacks	2024-09-14 00:05:00	2024-09-14 01:40:00	pinnacle	1
2007273700	tennis	Settled	Loss	OutofLineBets	20	15.5	-129	f	Sho Shimabukuro  vs Luca Nardi	Luca Nardi (Games) -1.5	2024-09-14 01:39:00	2024-09-14 06:00:00	pinnacle	1
2009829005	football	Settled	Loss	A11 Bets	30	31.5	105	f	Baylor vs Colorado	Baylor	2024-09-21 22:42:00	2024-09-22 00:00:00	pinnacle	1
bet365_8	baseball	Settled	Loss	A11 Bets	1	86.4	8600	t	Parlay	Parlay	2024-09-10 14:27:00	2024-09-11 00:27:00	bet365	1
1999243775	baseball	Settled	Loss	Analytics Capper	30	25.42	-118	f	Minnesota Twins vs Texas Rangers	Texas Rangers	2024-08-16 22:17:00	2024-08-17 00:05:00	pinnacle	1
1998939091	baseball	Settled	Loss	Zack Cimini	20	22.2	111	f	Minnesota Twins vs Texas Rangers	Texas Rangers	2024-08-15 21:01:00	2024-08-16 00:05:00	pinnacle	1
bet365_43	football	Settled	Win	Dave Richard	20	17.39	-115	\N	Chargers @ Steelers	Najee Harris Over 14.5 carries	\N	2024-09-22 17:00:00	Bet365	1
bet365_42	football	Settled	Loss	Thomas Casale	20	17.39	-115	\N	Bears @ Colts	D'Andre Switch Over 13.5 Carries	\N	2024-09-22 17:00:00	Bet365	1
2010041265	football	Settled	Win	Emory Hunt	20	19.61	-102	f	Los Angeles Chargers vs Pittsburgh Steelers	Pittsburgh Steelers -2.5	2024-09-22 13:47:00	2024-09-22 17:00:00	pinnacle	1
2010054576	football	Settled	Win	Alex Selesnick	20	18.35	-109	f	Dalton Kincaid (Receiving Yards)	Over 38.5 Receiving Yards	2024-09-22 14:15:00	2024-09-23 23:30:00	pinnacle	1
bet365_44	football	Settled	Win	Jason La Canfora	20	17.39	-115	\N	Jaguars @ BIlls	James Cook Over 83.5 combined yards	\N	2024-09-24 00:18:00	Bet365	1
2010035406	football	Settled	Loss	Jimmie Kaylor	20	19.23	-104	f	Denver Broncos vs Tampa Bay Buccaneers	Tampa Bay Buccaneers -6.0	2024-09-22 13:36:00	2024-09-22 17:00:00	pinnacle	1
bet99_21	football	Settled	Win	A11 Bets	30	19.74	-152	\N	NCAAF - 2 legs parlay	Missouri ML + Texas Tech ML	\N	2024-09-22 02:34:00	Bet99	1
2010127753	football	Settled	Win	Sharp Sheet	20	16.26	-123	f	Philadelphia Eagles vs New Orleans Saints	Philadelphia Eagles +3.0	2024-09-22 16:27:00	2024-09-22 17:00:00	pinnacle	1
2010040570	football	Settled	Win	Erik Kuselias	10	9.43	-106	f	Houston Texans vs Minnesota Vikings	Under 46.5	2024-09-22 13:45:00	2024-09-22 17:00:00	pinnacle	1
2010035342	football	Settled	Loss	Jimmie Kaylor	20	19.61	-102	f	New York Giants vs Cleveland Browns	Cleveland Browns -6.5	2024-09-22 13:36:00	2024-09-22 17:00:00	pinnacle	1
2010043820	football	Settled	Loss	Larry Hartstein	20	18.35	-109	f	Calvin Ridley (Receiving Yards)	Over 47.5 Receiving Yards	2024-09-22 13:52:00	2024-09-22 17:00:00	pinnacle	1
2010044226	football	Settled	Win	Emory Hunt	20	17.7	-113	f	Green Bay Packers vs Tennessee Titans	Green Bay Packers +3.0	2024-09-22 13:53:00	2024-09-22 17:00:00	pinnacle	1
2010036631	football	Settled	Win	Emory Hunt	20	18.18	-110	f	Chicago Bears vs Indianapolis Colts	Indianapolis Colts -1.0	2024-09-22 13:38:00	2024-09-22 17:00:00	pinnacle	1
2010048799	football	Settled	Loss	Me	20	20	100	t	Parlay	Under 48	2024-09-22 14:05:00	2024-09-22 23:15:00	pinnacle	1
2010045527	football	Settled	Loss	Jason La Canfora	20	23	115	f	Carolina Panthers vs Las Vegas Raiders	Las Vegas Raiders -6.5	2024-09-22 13:57:00	2024-09-22 20:05:00	pinnacle	1
2010050853	football	Settled	Loss	Mike Tierney	20	19.61	-102	f	San Francisco 49ers vs Los Angeles Rams	Under 44.5	2024-09-22 14:09:00	2024-09-22 20:25:00	pinnacle	1
2010483587	tennis	Settled	Loss	Tennis With T	10	41.37	413	t	Parlay	Christopher O'connell (Sets) (-203)	2024-09-24 01:43:00	2024-09-24 05:46:00	pinnacle	1
2010995235	baseball	Settled	Loss	Sharp Sheet	10	8.77	-114	f	Texas Rangers vs Oakland Athletics	Oakland Athletics	2024-09-25 20:58:00	2024-09-26 01:40:00	pinnacle	1
2011045953	tennis	Settled	Loss	A11 Bets	5	29.4	588	f	Reilly Opelka vs Ben Shelton	Reilly Opelka (Sets) -1.5	2024-09-26 03:06:00	2024-09-26 06:15:00	pinnacle	1
1995114850	baseball	Settled	Win	Matt Snyder	20	21.4	107	f	Miami Marlins vs Atlanta Braves	Atlanta Braves -1.5	2024-08-01 15:33:00	2024-08-01 23:20:00	pinnacle	1
2002884594	baseball	Settled	Loss	Wager Analyst	40	32.79	-122	f	San Diego Padres vs St. Louis Cardinals	San Diego Padres	2024-08-28 22:12:00	2024-08-28 23:45:00	pinnacle	1
1996539719	baseball	Settled	Loss	Analytics Capper	20	20.6	103	f	Houston Astros vs Texas Rangers	Texas Rangers	2024-08-06 21:09:00	2024-08-07 00:05:00	pinnacle	1
1998707115	baseball	Settled	Win	Matt Severance	20	18.69	-107	f	Davis Martin (Pitching Outs)	Over 14.5 Pitching Out	2024-08-14 20:02:00	2024-08-15 00:10:00	pinnacle	1
2005906112	football	Settled	Loss	Picks Office	20	18.18	-110	f	Los Angeles Rams vs Detroit Lions	Over 52	2024-09-08 13:01:00	2024-09-09 00:20:00	pinnacle	1
2000366109	tennis	Settled	Loss	TennisWinnersOnly	20	14.99	-134	t	Parlay	Leylah Annie Fernandez  (-318)	2024-08-20 14:27:00	2024-08-20 21:32:00	pinnacle	1
2001172956	baseball	Settled	Refunded	Matt Severance	10	7.04	-142	f	Los Angeles Angels vs Toronto Blue Jays	Toronto Blue Jays -1.0	2024-08-23 14:04:00	2024-08-23 23:07:00	pinnacle	1
2004416273	tennis	Settled	Loss	A11 Bets	5	9.27	185	t	Parlay	Over 3.5  (-122)	2024-09-02 21:19:00	2024-09-03 01:12:00	pinnacle	1
1995647920	tennis	Settled	Loss	The New Kid	20	15.27	-131	f	Qinwen Zheng  vs Donna Vekic	Over 20.5	2024-08-03 13:38:00	2024-08-03 14:50:00	pinnacle	1
1999986589	tennis	Settled	Win	Illicit Picks	20	13.07	-153	f	Dan Evans  vs Aleksandar Vukic	Aleksandar Vukic	2024-08-18 18:56:00	2024-08-18 19:00:00	pinnacle	1
1999875769	tennis	Settled	Win	TennisWinnersOnly	20	17.86	-112	f	Jessica Pegula  vs Paula Badosa	Over 22	2024-08-18 14:35:00	2024-08-18 17:29:00	pinnacle	1
2000365637	tennis	Settled	Loss	TennisWinnersOnly	40	27.03	-148	f	Alexandre Muller vs Pavel Kotov	Alexandre Muller	2024-08-20 14:25:00	2024-08-20 19:30:00	pinnacle	1
1994071322	tennis	Settled	Loss	The New Kid	20	15.38	-130	f	Mayar Sherif vs Caroline Wozniacki	Mayar Sherif	2024-07-28 14:56:00	2024-07-28 17:05:00	pinnacle	1
sIf6Y8IKX9QS	baseball	Settled	Win	ChefsBestBets	20	24.6	123	t	Parlay	Parlay	2024-08-25 23:41:57	2024-08-25 23:41:57	bet365	1
1996792413	baseball	Settled	Loss	Analytics Capper	60	47.24	-127	f	Detroit Tigers vs Seattle Mariners	Seattle Mariners	2024-08-07 21:42:00	2024-08-08 01:40:00	pinnacle	1
2000628481	baseball	Settled	Loss	Matt Snyder	20	16.95	-118	f	Jack Flaherty (Total Strikeouts)	Over 7.5 Strikeouts	2024-08-21 13:52:00	2024-08-22 02:10:00	pinnacle	1
2002462741	baseball	Settled	Loss	Angelo Magliocca	10	10.6	106	f	Andrew Heaney (Total Strikeouts)	Over 5.5 Strikeouts	2024-08-27 12:50:00	2024-08-28 00:10:00	pinnacle	1
1995144433	tennis	Settled	Win	Tennis Titan	30	25	-120	f	Giovanni Perricard vs Jordan Thompson	Jordan Thompson	2024-08-01 17:23:00	2024-08-01 18:50:00	pinnacle	1
1999101964	tennis	Settled	Loss	TennisWinnersOnly	40	49.6	124	f	Hubert Hurkacz vs Flavio Cobolli	Flavio Cobolli	2024-08-16 14:08:00	2024-08-16 21:10:00	pinnacle	1
2006232746	football	Settled	Loss	A11 Bets	15	13.39	-112	f	New York Jets vs San Francisco 49ers	New York Jets +4.5	2024-09-09 21:40:00	2024-09-10 00:15:00	pinnacle	1
2006396187	tennis	Settled	Win	Tennis Titan	20	18.52	-108	f	Kimberly Birrell vs Ena Shibahara	Ena Shibahara	2024-09-10 11:26:00	2024-09-10 15:12:00	pinnacle	1
2002457675	tennis	Settled	Loss	MatchPointBets	20	14.93	-134	f	Alejandro Tabilo vs David Goffin	Alejandro Tabilo	2024-08-27 12:26:00	2024-08-27 15:10:00	pinnacle	1
2002751824	tennis	Settled	Win	TennisWinnersOnly	20	16.53	-121	f	Moyuka Uchijima vs Jule Niemeier	Jule Niemeier	2024-08-28 14:05:00	2024-08-28 15:10:00	pinnacle	1
2004054947	baseball	Settled	Loss	The Betting Expert	20	17.39	-115	f	Milwaukee Brewers vs Cincinnati Reds	Milwaukee Brewers	2024-09-01 13:57:00	2024-09-01 16:10:00	pinnacle	1
2004991696	tennis	Settled	Win	Illicit Picks	30	22.06	-136	f	Norbert Gombos vs Alibek Kachmazov	Norbert Gombos	2024-09-05 13:12:00	2024-09-06 04:50:00	pinnacle	1
2002988786	tennis	Settled	Win	TennisWinnersOnly	20	20.6	103	f	Mariano Navone vs Dan Evans	Dan Evans	2024-08-29 11:52:00	2024-08-29 21:12:00	pinnacle	1
2002761895	tennis	Settled	Refunded	TTW	20	17.54	-114	f	Sebastian Baez  vs Tallon Griekspoor	Over 38.5	2024-08-28 14:47:00	2024-08-28 17:00:00	pinnacle	1
1999092644	baseball	Settled	Win	Matt Severance	20	11.17	-179	f	Toronto Blue Jays vs Chicago Cubs	Chicago Cubs +1.5	2024-08-16 13:24:00	2024-08-16 18:20:00	pinnacle	1
1999092214	baseball	Settled	Loss	Matt Severance	20	14.39	-139	f	Chicago White Sox vs Houston Astros	Houston Astros -1.0	2024-08-16 13:22:00	2024-08-17 00:10:00	pinnacle	1
2006426088	tennis	Settled	Win	Sopranos Picks	40	37.74	-106	f	Tatjana Maria  vs Ashlyn Krueger	Ashlyn Krueger   -3.5	2024-09-10 13:03:00	2024-09-10 15:30:00	pinnacle	1
2002395445	tennis	Settled	Refunded	Betting4Profit	20	19.42	-103	f	Zhizhen Zhang  vs Jack Draper	Zhizhen Zhang   +5.0	2024-08-27 02:48:00	2024-08-27 17:35:00	pinnacle	1
2000425080	baseball	Settled	Loss	Micah Roberts	20	18.02	-111	f	Boston Red Sox vs Houston Astros	Houston Astros	2024-08-20 18:00:00	2024-08-21 00:10:00	pinnacle	1
1994286044	tennis	Settled	Win	The New Kid	20	15.38	-130	f	Maria Camila Osorio Serrano vs Dayana Yastremska	Maria Camila Osorio Serrano	2024-07-29 11:14:00	2024-07-29 12:30:00	pinnacle	1
1998717528	baseball	Settled	Win	Analytics Capper	20	21.4	107	f	Los Angeles Dodgers vs Milwaukee Brewers	Milwaukee Brewers	2024-08-14 21:08:00	2024-08-15 00:10:00	pinnacle	1
1998717482	baseball	Settled	Win	Analytics Capper	20	24.2	121	f	Texas Rangers vs Boston Red Sox	Texas Rangers	2024-08-14 21:08:00	2024-08-14 22:10:00	pinnacle	1
1997704396	baseball	Settled	Win	Analytics Capper	20	17.54	-114	f	Philadelphia Phillies vs Arizona Diamondbacks	Arizona Diamondbacks	2024-08-10 21:37:00	2024-08-11 00:10:00	pinnacle	1
1999888948	baseball	Settled	Loss	Analytics Capper	30	27.03	-111	f	Washington Nationals vs Philadelphia Phillies	Philadelphia Phillies -1.0	2024-08-18 15:10:00	2024-08-18 17:35:00	pinnacle	1
2000202452	tennis	Settled	Refunded	OutofLineBets	20	16.53	-121	f	Mackenzie Mcdonald vs Corentin Moutet	Corentin Moutet	2024-08-19 18:34:00	2024-08-20 00:30:00	pinnacle	1
2004055157	tennis	Settled	Loss	TennisWinnersOnly	40	35.71	-112	f	Andrey Rublev vs Grigor Dimitrov	Andrey Rublev	2024-09-01 13:58:00	2024-09-01 16:15:00	pinnacle	1
2004803372	tennis	Settled	Loss	Value Hunter	20	18.12	-111	t	Parlay	Iga Swiatek  (-328)	2024-09-04 17:02:00	2024-09-04 20:13:00	pinnacle	1
1996759487	baseball	Settled	Win	The New Kid	30	20.98	-143	f	G1 Los Angeles Angels vs G1 New York Yankees	G1 New York Yankees -1.5	2024-08-07 18:52:00	2024-08-07 20:05:00	pinnacle	1
2002765907	tennis	Settled	Refunded	OutofLineBets	40	35.4	-113	f	Sebastian Baez  vs Tallon Griekspoor	Tallon Griekspoor   -3.0	2024-08-28 15:04:00	2024-08-28 17:00:00	pinnacle	1
1997704400	baseball	Settled	Loss	Analytics Capper	20	18.02	-111	f	Cleveland Guardians vs Minnesota Twins	Minnesota Twins	2024-08-10 21:37:00	2024-08-10 23:10:00	pinnacle	1
2002164032	tennis	Settled	Loss	OutofLineBets	60	49.18	-122	f	Yi Zhou  vs Tung-Lin WU	Yi Zhou   +3.5	2024-08-26 02:44:00	2024-08-26 06:00:00	pinnacle	1
1998824061	tennis	Settled	Win	TennisWinnersOnly	40	32	-125	f	Brandon Nakashima vs Arthur Fils	Brandon Nakashima	2024-08-15 13:26:00	2024-08-15 19:00:00	pinnacle	1
1992748178	tennis	Settled	Loss	The New Kid	37.5	28.41	-132	f	Aslan Karatsev vs Billy Harris	Billy Harris	2024-07-23 14:26:00	2024-07-23 15:00:00	pinnacle	1
2000687996	tennis	Settled	Loss	Illicit Picks	40	31.37	-128	t	Parlay	Alex Michelsen  +1.5 (-471)	2024-08-21 17:22:00	2024-08-22 00:00:00	pinnacle	1
2000923318	baseball	Settled	Win	Zack Cimini	20	19.42	-103	f	Cleveland Guardians vs New York Yankees	Under 8	2024-08-22 15:09:00	2024-08-22 17:05:00	pinnacle	1
1996539723	baseball	Settled	Loss	Analytics Capper	20	19.42	-103	f	Minnesota Twins vs Chicago Cubs	Minnesota Twins	2024-08-06 21:09:00	2024-08-07 00:05:00	pinnacle	1
bet365_5	football	Settled	Win	Matt Severance	10	7.14	-140	f	PIT Steelers vs ATL Falcons	Kirk Cousins Under 2.5 Rushing Attempts	2024-09-08 17:36:20	2024-09-08 19:36:20	bet365	1
2002168338	tennis	Settled	Loss	TennisWinnersOnly	20	20.2	101	f	Pedro Martinez vs Maks Kasnikowski	Maks Kasnikowski	2024-08-26 04:11:00	2024-08-26 17:38:00	pinnacle	1
1995739088	mma	Settled	Win	The New Kid	10	31.54	315	t	Parlay	Umar Nurmagomedov (-382)	2024-08-03 17:32:00	2024-08-03 21:41:00	pinnacle	1
1997037799	baseball	Settled	Win	Analytics Capper	40	23.26	-172	f	Cincinnati Reds vs Miami Marlins	Cincinnati Reds	2024-08-08 21:38:00	2024-08-08 22:10:00	pinnacle	1
2001038221	baseball	Settled	Win	Matt Severance	10	8.33	-120	f	Colorado Rockies vs New York Yankees	New York Yankees -1.5	2024-08-22 22:05:00	2024-08-23 23:05:00	pinnacle	1
1994285279	tennis	Settled	Loss	TTW	20	20.4	102	f	Jessica Pegula vs Elina Svitolina	Jessica Pegula	2024-07-29 11:10:00	2024-07-29 19:30:00	pinnacle	1
1998860295	tennis	Settled	Win	Illicit Picks	20	16.67	-120	f	Max Purcell vs Pablo Carreno-Busta	Pablo Carreno-Busta	2024-08-15 16:19:00	2024-08-15 17:00:00	pinnacle	1
2000161611	tennis	Settled	Win	TennisWinnersOnly	20	18.35	-109	f	Cristina Bucsa vs Martina Trevisan	Cristina Bucsa	2024-08-19 16:26:00	2024-08-19 17:59:00	pinnacle	1
2004991585	tennis	Settled	Loss	Illicit Picks	20	14.29	-140	f	Ignacio Buse vs Daniel Elahi Galan	Daniel Elahi Galan	2024-09-05 13:12:00	2024-09-06 14:30:00	pinnacle	1
2005970491	football	Settled	Loss	A11 Bets	20	14.99	-134	t	Parlay	Buffalo Bills (-263)	2024-09-08 16:40:00	2024-09-08 19:53:00	pinnacle	1
1999118339	tennis	Settled	Loss	Tennis Titan	30	25.21	-119	f	Ben Shelton  vs Fabian Marozsan	Over 23	2024-08-16 15:17:00	2024-08-16 19:45:00	pinnacle	1
2005703627	football	Settled	Loss	Wager Analyst	20	15.15	-132	f	California vs Auburn	Auburn -10.0	2024-09-07 19:25:00	2024-09-07 19:30:00	pinnacle	1
2002989050	tennis	Settled	Loss	TennisWinnersOnly	20	13.48	-149	t	Parlay	Caroline Dolehide  (-357)	2024-08-29 11:53:00	2024-08-29 16:50:00	pinnacle	1
2002297848	tennis	Settled	Win	TTW	20	19.05	-105	f	Reilly Opelka  vs Lorenzo Musetti	Reilly Opelka   +3.5	2024-08-26 18:07:00	2024-08-26 19:17:00	pinnacle	1
2000698771	baseball	Settled	Loss	Zack Cimini	20	19.23	-104	f	Logan Webb (Total Strikeouts)	Under 5.5 Strikeouts	2024-08-21 18:00:00	2024-08-21 19:45:00	pinnacle	1
1992955752	tennis	Settled	Loss	The New Kid	30	21.58	-139	f	Hugo Gaston vs Roberto Carballes Baena	Roberto Carballes Baena	2024-07-24 12:41:00	2024-07-24 17:30:00	pinnacle	1
2004570703	baseball	Settled	Win	The Betting Expert	20	17.24	-116	f	Pittsburgh Pirates vs Chicago Cubs	Pittsburgh Pirates	2024-09-03 17:25:00	2024-09-03 23:40:00	pinnacle	1
2001173280	baseball	Settled	Refunded	Matt Severance	10	10.7	107	f	San Francisco Giants vs Seattle Mariners	Seattle Mariners -1.0	2024-08-23 14:06:00	2024-08-24 02:10:00	pinnacle	1
2005973710	football	Settled	Loss	Wager Analyst	20	15.38	-130	t	Parlay	Tennessee Titans +11.0	2024-09-08 16:48:00	2024-09-08 20:09:00	pinnacle	1
2005007301	tennis	Settled	Loss	Tennis Titan	15	20.4	136	f	Jessica Pegula vs Karolina Muchova	Karolina Muchova	2024-09-05 14:07:00	2024-09-06 01:13:00	pinnacle	1
1999875620	tennis	Settled	Win	TennisWinnersOnly	20	32.4	162	f	Iga Swiatek vs Aryna Sabalenka	Aryna Sabalenka	2024-08-18 14:35:00	2024-08-18 15:17:00	pinnacle	1
2005643140	football	Settled	Win	Picks Office	20	18.35	-109	f	Virginia vs Wake Forest	Virginia	2024-09-07 16:51:00	2024-09-07 23:00:00	pinnacle	1
2004390429	football	Settled	Win	The Betting Expert	20	19.23	-104	f	Boston College vs Florida State	Under 51	2024-09-02 18:40:00	2024-09-02 23:30:00	pinnacle	1
2004220478	football	Settled	Win	OutofLineBets	20	15.75	-127	f	LSU vs USC	USC +5.0	2024-09-01 20:29:00	2024-09-01 23:30:00	pinnacle	1
2000244253	baseball	Settled	Win	Matt Severance	5	2.78	-180	f	Tanner Houck (Pitching Outs)	Under 18.5 Pitching Out	2024-08-19 21:17:00	2024-08-20 00:10:00	pinnacle	1
2002252925	tennis	Settled	Win	Illicit Picks	20	14.39	-139	f	Christopher Eubanks vs Arthur Rinderknech	Arthur Rinderknech	2024-08-26 15:36:00	2024-08-26 21:05:00	pinnacle	1
2003649105	football	Settled	Win	The Betting Expert	20	18.69	-107	f	Clemson vs Georgia	Georgia -11.0	2024-08-31 13:48:00	2024-08-31 16:08:00	pinnacle	1
1993121435	tennis	Settled	Win	The New Kid	20	15.5	-129	f	Francesco Maestrelli  vs Alvaro Guillen Meza	Over 21.5	2024-07-25 05:57:00	2024-07-25 09:05:00	pinnacle	1
2005970632	football	Settled	Loss	A11 Bets	10	16.2	161	t	Parlay	Buffalo Bills (-263)	2024-09-08 16:40:00	2024-09-08 19:53:00	pinnacle	1
2003426504	football	Settled	Win	Wager Analyst	20	13.42	-149	f	TCU vs Stanford	Stanford +10.5	2024-08-30 21:21:00	2024-08-31 02:40:00	pinnacle	1
2005892447	football	Settled	Refunded	Matt Severance	10	7.75	-129	f	Jacksonville Jaguars vs Miami Dolphins	Miami Dolphins -3.0	2024-09-08 12:11:00	2024-09-08 17:00:00	pinnacle	1
2000915027	tennis	Settled	Win	TennisWinnersOnly	20	20	-100	f	Alex Michelsen  vs Christopher Eubanks	Christopher Eubanks   +3.0	2024-08-22 14:31:00	2024-08-22 22:45:00	pinnacle	1
2002603610	baseball	Settled	Loss	Micah Roberts	20	18.69	-107	f	New York Mets vs Arizona Diamondbacks	Arizona Diamondbacks	2024-08-27 20:23:00	2024-08-28 01:40:00	pinnacle	1
1997262929	tennis	Settled	Win	TTW	20	14.93	-134	f	Elise Mertens vs Liudmila Samsonova	Liudmila Samsonova	2024-08-09 18:40:00	2024-08-09 21:12:00	pinnacle	1
1995005928	tennis	Settled	Win	The New Kid	20	16.95	-118	f	Iga Swiatek  vs Qinwen Zheng	Over 18.5	2024-08-01 03:23:00	2024-08-01 10:25:00	pinnacle	1
1993254188	baseball	Settled	Loss	The New Kid	20	16.95	-118	f	Chicago White Sox vs Texas Rangers	Texas Rangers -1.5	2024-07-25 18:28:00	2024-07-25 18:35:00	pinnacle	1
1996741347	tennis	Settled	Loss	The New Kid	15	10.64	-141	f	Ons Jabeur  vs Naomi Osaka	Over 20.5	2024-08-07 17:45:00	2024-08-07 19:48:00	pinnacle	1
1996912443	tennis	Settled	Win	The New Kid	20	15.63	-128	f	Elina Svitolina  vs Marta Kostyuk	Over 21	2024-08-08 13:45:00	2024-08-08 15:07:00	pinnacle	1
1998624223	baseball	Settled	Loss	Sports Line CP	20	18.69	-107	f	Kansas City Royals vs Minnesota Twins	Minnesota Twins	2024-08-14 13:51:00	2024-08-14 17:10:00	pinnacle	1
1998826247	baseball	Settled	Win	Matt Snyder	20	31.4	157	f	Boston Red Sox vs Baltimore Orioles	Baltimore Orioles -1.5	2024-08-15 13:36:00	2024-08-15 22:35:00	pinnacle	1
1994327331	tennis	Settled	Loss	Illicit Picks	20	17.09	-117	f	Reilly Opelka  vs James Duckworth	James Duckworth   +2.5	2024-07-29 14:38:00	2024-07-30 04:00:00	pinnacle	1
2003653119	football	Settled	Win	Emory Hunt	20	19.8	-101	f	Penn State vs West Virginia	Penn State -7.5	2024-08-31 13:57:00	2024-08-31 16:05:00	pinnacle	1
2002751717	tennis	Settled	Win	TennisWinnersOnly	20	16	-125	f	Diane Parry vs Yafan Wang	Yafan Wang	2024-08-28 14:04:00	2024-08-28 18:26:00	pinnacle	1
1997908548	baseball	Settled	Win	Analytics Capper	30	28.3	-106	f	Cincinnati Reds vs Milwaukee Brewers	Cincinnati Reds	2024-08-11 14:19:00	2024-08-11 18:10:00	pinnacle	1
1998268677	baseball	Settled	Win	Analytics Capper	30	19.11	-157	f	Kansas City Royals vs Minnesota Twins	Minnesota Twins	2024-08-12 22:05:00	2024-08-12 23:40:00	pinnacle	1
2003646823	tennis	Settled	Loss	TennisWinnersOnly	20	17.39	-115	f	Nuno Borges  vs Jakub Mensik	Jakub Mensik   +3.5	2024-08-31 13:43:00	2024-08-31 20:25:00	pinnacle	1
1998621563	baseball	Settled	Win	Matt Snyder	20	21	105	f	Los Angeles Dodgers vs Milwaukee Brewers	Milwaukee Brewers	2024-08-14 13:35:00	2024-08-15 00:10:00	pinnacle	1
1999243830	basketball	Settled	Loss	Analytics Capper	20	19.42	-103	f	Phoenix Mercury vs Indiana Fever	Phoenix Mercury +3.0	2024-08-16 22:18:00	2024-08-16 23:32:00	pinnacle	1
2004780251	tennis	Settled	Loss	A11 Bets	4	12.3	307	t	Parlay	Aryna Sabalenka  (-395)	2024-09-04 15:32:00	2024-09-04 20:13:00	pinnacle	1
1996446615	baseball	Settled	Win	Matt Severance	10	8.85	-113	f	New York Mets vs Colorado Rockies	Colorado Rockies +1.5	2024-08-06 14:31:00	2024-08-07 00:40:00	pinnacle	1
2003646966	tennis	Settled	Loss	TennisWinnersOnly	20	12.5	-160	f	Beatriz Haddad Maia vs Anna Kalinskaya	Anna Kalinskaya	2024-08-31 13:43:00	2024-09-01 02:37:00	pinnacle	1
1996438620	tennis	Settled	Win	The New Kid	20	14.18	-141	f	Anastasia Potapova  vs Magdalena Frech	Over 20.5	2024-08-06 13:43:00	2024-08-06 15:50:00	pinnacle	1
2004354880	tennis	Settled	Win	A11 Bets	20	15.2	-132	t	Parlay	Over 3.5  (-170)	2024-09-02 15:55:00	2024-09-02 21:57:00	pinnacle	1
2000627806	baseball	Settled	Loss	Matt Snyder	20	21.4	107	f	Chicago White Sox vs San Francisco Giants	San Francisco Giants -1.5	2024-08-21 13:47:00	2024-08-21 19:45:00	pinnacle	1
2002667510	tennis	Settled	Win	Betting4Profit	20	18.02	-111	f	Casper Ruud  vs Gael Monfils	Over 38.5	2024-08-28 03:24:00	2024-08-28 22:39:00	pinnacle	1
2001226978	baseball	Settled	Loss	Zack Cimini	20	13.99	-143	f	St. Louis Cardinals vs Minnesota Twins	Minnesota Twins	2024-08-23 17:18:00	2024-08-24 00:10:00	pinnacle	1
2005892685	football	Settled	Win	Matt Severance	10	5.24	-191	f	Carolina Panthers vs New Orleans Saints	New Orleans Saints	2024-09-08 12:12:00	2024-09-08 17:00:00	pinnacle	1
2004995071	football	Settled	Loss	Mike McClure	10	7.94	-126	f	Zay Flowers (Receiving Yards)	Over 52.5 Receiving Yards	2024-09-05 13:24:00	2024-09-06 00:20:00	pinnacle	1
2005888070	football	Settled	Win	Picks Office	20	17.24	-116	f	New England Patriots vs Cincinnati Bengals	Under 41.5	2024-09-08 11:56:00	2024-09-08 17:00:00	pinnacle	1
1996675956	tennis	Settled	Win	The New Kid	20	14.81	-135	f	Erika Andreeva  vs Marina Stakusic	Over 20.5	2024-08-07 13:38:00	2024-08-07 16:38:00	pinnacle	1
1997303374	baseball	Settled	Win	Analytics Capper	20	19.23	-104	f	Los Angeles Angels vs Washington Nationals	Washington Nationals	2024-08-09 21:27:00	2024-08-09 22:45:00	pinnacle	1
2002457340	tennis	Settled	Win	TennisWinnersOnly	20	15.04	-133	f	Fabian Marozsan vs Hamad Medjedovic	Fabian Marozsan	2024-08-27 12:24:00	2024-08-27 21:44:00	pinnacle	1
1992732339	tennis	Settled	Win	The New Kid	30	22.73	-132	f	Elena-Gabriela Ruse vs Jaqueline Cristian	Jaqueline Cristian	2024-07-23 12:43:00	2024-07-23 14:09:00	pinnacle	1
1994285721	tennis	Settled	Win	The New Kid	20	18.69	-107	f	Francisco Cerundolo  vs Ugo Humbert	Over 22.5	2024-07-29 11:12:00	2024-07-29 12:05:00	pinnacle	1
1999484998	baseball	Settled	Win	Matt Severance	20	10.7	-187	f	Kyle Freeland (Pitching Outs)	Over 14.5 Pitching Out	2024-08-17 14:40:00	2024-08-18 00:10:00	pinnacle	1
2005970872	football	Settled	Refunded	A11 Bets	15	11.9	-126	f	Jacksonville Jaguars vs Miami Dolphins	Miami Dolphins -3.0	2024-09-08 16:41:00	2024-09-08 17:00:00	pinnacle	1
2001173388	baseball	Settled	Loss	Bruce Marshall	20	22.6	113	f	Milwaukee Brewers vs Oakland Athletics	Oakland Athletics	2024-08-23 14:07:00	2024-08-24 01:40:00	pinnacle	1
2002990396	tennis	Settled	Refunded	The Betting Expert	20	15.87	-126	f	Karolina Pliskova  vs Jasmine Paolini	Over 20.5	2024-08-29 12:02:00	2024-08-29 17:31:00	pinnacle	1
2006195541	baseball	Settled	Loss	Matt Severance	30	23.62	-127	f	Los Angeles Angels vs Minnesota Twins	Minnesota Twins -1.0	2024-09-09 18:06:00	2024-09-09 23:40:00	pinnacle	1
2000292949	baseball	Settled	Win	Zack Cimini	20	23	115	f	Milwaukee Brewers vs St. Louis Cardinals	Milwaukee Brewers	2024-08-20 03:26:00	2024-08-20 23:45:00	pinnacle	1
1999199825	tennis	Settled	Loss	Illicit Picks	40	34.78	-115	f	Ben Shelton  vs Fabian Marozsan	Fabian Marozsan   +2.5	2024-08-16 18:58:00	2024-08-16 19:45:00	pinnacle	1
2004145278	baseball	Settled	Loss	Wager Analyst	20	13.07	-153	f	St. Louis Cardinals vs New York Yankees	New York Yankees -0.5	2024-09-01 17:18:00	2024-09-01 17:35:00	pinnacle	1
2003054491	baseball	Settled	Win	Wager Analyst	20	15.5	-129	f	San Francisco Giants vs Milwaukee Brewers	Milwaukee Brewers	2024-08-29 16:46:00	2024-08-29 18:10:00	pinnacle	1
1993210891	baseball	Settled	Loss	NRFI King	20	13.89	-144	f	San Diego Padres vs Washington Nationals	Draw	2024-07-25 15:47:00	2024-07-25 16:05:00	pinnacle	1
1997658391	baseball	Settled	Loss	Green Cappers	20	19.8	-101	f	Detroit Tigers vs San Francisco Giants	Over 7.5	2024-08-10 18:45:00	2024-08-10 20:05:00	pinnacle	1
2006272569	baseball	Settled	Loss	A11 Bets	15	13.16	-114	f	Lotte Giants vs LG Twins	LG Twins	2024-09-09 23:36:00	2024-09-10 05:30:00	pinnacle	1
1999102295	tennis	Settled	Loss	TennisWinnersOnly	20	16	-125	f	Diana Shnaider  vs Leylah Annie Fernandez	Over 21.5	2024-08-16 14:10:00	2024-08-16 21:13:00	pinnacle	1
2004055233	tennis	Settled	Win	TennisWinnersOnly	20	13.07	-153	f	Brandon Nakashima vs Alexander Zverev	Over 3.5	2024-09-01 13:58:00	2024-09-01 20:42:00	pinnacle	1
1999228806	tennis	Settled	Loss	Me	10	20	200	f	Jessica Pegula vs Taylor Townsend	Taylor Townsend	2024-08-16 20:40:00	2024-08-16 23:18:00	pinnacle	1
2005621068	football	Settled	Win	TTW	15	13.39	-112	f	Texas vs Michigan	Texas -6.5	2024-09-07 15:58:00	2024-09-07 16:00:00	pinnacle	1
2002202706	tennis	Settled	Loss	OutofLineBets	30	32.1	107	f	Pedro Martinez vs Maks Kasnikowski	Maks Kasnikowski	2024-08-26 11:22:00	2024-08-26 17:38:00	pinnacle	1
2002626067	tennis	Settled	Win	OutofLineBets	20	14.71	-136	f	Lorenzo Sonego  vs Tommy Paul	Tommy Paul   -5.0	2024-08-27 22:29:00	2024-08-28 02:39:00	pinnacle	1
2005695877	tennis	Settled	Win	A11 Bets	20	15.51	-129	t	Parlay	Aryna Sabalenka  +1.5 (-837)	2024-09-07 19:04:00	2024-09-08 03:11:00	pinnacle	1
2005449196	tennis	Settled	Loss	OutofLineBets	30	26.09	-115	f	Richard Gasquet  vs Adria Soriano Barrera	Adria Soriano Barrera   +4.0	2024-09-07 03:36:00	2024-09-07 14:30:00	pinnacle	1
1999102105	tennis	Settled	Win	TennisWinnersOnly	40	28.78	-139	f	Mirra Andreeva vs Jasmine Paolini	Mirra Andreeva	2024-08-16 14:09:00	2024-08-16 19:05:00	pinnacle	1
2001306405	baseball	Settled	Refunded	Wager Analyst	20	15.04	-133	f	Los Angeles Angels vs Toronto Blue Jays	Toronto Blue Jays -1.0	2024-08-23 21:25:00	2024-08-23 23:07:00	pinnacle	1
2003292357	tennis	Settled	Win	OutofLineBets	20	17.39	-115	f	Ben Shelton  vs Frances Tiafoe	Frances Tiafoe   +2.5	2024-08-30 14:53:00	2024-08-30 18:49:00	pinnacle	1
1993627318	tennis	Settled	Loss	The New Kid	20	21	105	f	Tomas Machac vs Zhizhen Zhang	Zhizhen Zhang	2024-07-27 09:02:00	2024-07-28 15:20:00	pinnacle	1
1993334468	tennis	Settled	Loss	The New Kid	30	21.13	-142	f	Magda Linette  vs Magdalena Frech	Over 21	2024-07-26 06:40:00	2024-07-26 09:41:00	pinnacle	1
2004616020	baseball	Settled	Loss	Wager Analyst	40	27.4	-146	f	St. Louis Cardinals vs Milwaukee Brewers	Milwaukee Brewers	2024-09-03 21:01:00	2024-09-03 23:40:00	pinnacle	1
1994564266	tennis	Settled	Win	TTW	20	26.6	133	f	Aleksandar Kovacevic vs Yoshihito Nishioka	Aleksandar Kovacevic	2024-07-30 14:41:00	2024-07-30 17:00:00	pinnacle	1
2003292091	tennis	Settled	Loss	Green Cappers	10	9.71	-103	f	Qinwen Zheng  vs Jule Niemeier	Jule Niemeier   +5.5	2024-08-30 14:52:00	2024-08-30 15:09:00	pinnacle	1
2002752511	baseball	Settled	Loss	Matt Severance	40	35.09	-114	f	Oakland Athletics vs Cincinnati Reds	Under 10.5	2024-08-28 14:08:00	2024-08-28 22:40:00	pinnacle	1
1993883532	mma	Settled	Loss	The New Kid	10	18	180	f	Manel Kape vs Muhammad Mokaev	Manel Kape	2024-07-27 23:03:00	2024-07-28 00:19:00	pinnacle	1
1995006057	tennis	Settled	Win	The New Kid	15	22.8	152	f	Casper Ruud vs Felix Auger Aliassime	Felix Auger Aliassime	2024-08-01 03:24:00	2024-08-01 15:15:00	pinnacle	1
1996438898	tennis	Settled	Win	Sopranos Picks	20	23.6	118	f	Jakub Mensik vs Borna Coric	Borna Coric	2024-08-06 13:43:00	2024-08-06 15:30:00	pinnacle	1
2006149801	football	Settled	Loss	Prongs Picks	10	7.52	-133	f	George Kittle (Receiving Yards)	Over 40.5 Receiving Yards	2024-09-09 10:06:00	2024-09-09 20:20:00	pinnacle	1
2001540546	baseball	Settled	Win	Matt Severance	10	8.4	-119	f	Los Angeles Angels vs Toronto Blue Jays	Under 9	2024-08-24 13:54:00	2024-08-24 19:07:00	pinnacle	1
2003122836	football	Settled	Win	Wager Analyst	20	15.63	-128	f	North Carolina vs Minnesota	North Carolina	2024-08-29 20:22:00	2024-08-30 01:04:00	pinnacle	1
2000632541	tennis	Settled	Win	TennisWinnersOnly	20	19.23	-104	f	McCartney Kessler  vs Xinyu Wang	McCartney Kessler   +3.5	2024-08-21 14:11:00	2024-08-21 15:07:00	pinnacle	1
1994406295	tennis	Settled	Loss	Tennis Titan	20	23.76	118	t	Parlay	Adam Walton   (-155)	2024-07-29 19:57:00	2024-07-29 19:00:00	pinnacle	1
1997994200	tennis	Settled	Win	MatchPointBets	25	20	-125	f	Sebastian Korda  vs Alexander Zverev	Over 22.5	2024-08-11 17:49:00	2024-08-11 18:20:00	pinnacle	1
2002168525	tennis	Settled	Win	TennisWinnersOnly	20	26	130	f	Greet Minnen vs Magdalena Frech	Greet Minnen	2024-08-26 04:14:00	2024-08-26 17:20:00	pinnacle	1
hIUrc0waqcdh	baseball	Settled	Win	Me	20	48	240	t	SGP - CHI White Sox @ BAL Orioles	Game Run Line: BAL Orioles -2.5 Runs, Over 8.5 Runs, Gunnar Henderson - 1+ Hits, Runs and RBIs	2024-09-02 23:06:44	2024-09-02 23:06:44	bet365	1
2000673759	baseball	Settled	Win	Micah Roberts	20	16.39	-122	f	Arizona Diamondbacks vs Miami Marlins	Over 8.5	2024-08-21 16:37:00	2024-08-21 22:40:00	pinnacle	1
1999238610	baseball	Settled	Loss	Full Card Sweep	20	15.63	-128	f	Seattle Mariners vs Pittsburgh Pirates	Under 7	2024-08-16 21:39:00	2024-08-16 22:40:00	pinnacle	1
1996676480	tennis	Settled	Loss	Sopranos Picks	60	49.3	-122	t	Parlay	Felix Auger-Aliassime  (-290)	2024-08-07 13:41:00	2024-08-07 16:43:00	pinnacle	1
2003122908	baseball	Settled	Win	Wager Analyst	30	20.55	-146	f	Kansas City Royals vs Houston Astros	Houston Astros	2024-08-29 20:22:00	2024-08-30 00:10:00	pinnacle	1
1997908549	baseball	Settled	Loss	Analytics Capper	20	18.87	-106	f	San Diego Padres vs Miami Marlins	San Diego Padres -1.5	2024-08-11 14:19:00	2024-08-11 17:40:00	pinnacle	1
2000161333	tennis	Settled	Win	TennisWinnersOnly	20	13.59	-148	t	Parlay	Dominic Stricker  (-286)	2024-08-19 16:25:00	2024-08-19 19:38:00	pinnacle	1
1993056104	baseball	Settled	Win	SD	30	24.39	-123	f	Jack Flaherty	Under 5.5 Hits Allowed	2024-07-24 20:00:00	2024-07-24 22:40:00	pinnacle	1
1996083160	baseball	Settled	Win	Analytics Capper	40	44.8	112	f	Milwaukee Brewers vs Washington Nationals	Washington Nationals	2024-08-04 17:14:00	2024-08-04 17:35:00	pinnacle	1
2000365801	tennis	Settled	Loss	TennisWinnersOnly	20	17.54	-114	f	Marton Fucsovics  vs Alex Michelsen	Marton Fucsovics   +2.5	2024-08-20 14:25:00	2024-08-20 23:45:00	pinnacle	1
HdsAl_yVKrJ6	football	Settled	Loss	Wager Analyst	20	15.384615384615385	-130	f	Notre Dame @ Texas A&M	Texas A&M	2024-09-01 01:57:54	2024-09-01 01:57:54	bet365	1
1994592308	tennis	Settled	Loss	Illicit Picks	40	30.53	-131	f	Daniel Elahi Galan vs Frances Tiafoe	Frances Tiafoe  -1.5	2024-07-30 16:13:00	2024-07-30 22:15:00	pinnacle	1
2001300338	baseball	Settled	Win	Green Cappers	20	20.4	102	f	Texas Rangers vs Cleveland Guardians	Over 7	2024-08-23 20:53:00	2024-08-23 23:10:00	pinnacle	1
2000480807	baseball	Settled	Win	Wager Analyst	30	16.48	-182	f	Chicago White Sox vs San Francisco Giants	San Francisco Giants -1.0	2024-08-20 21:58:00	2024-08-21 01:45:00	pinnacle	1
1998477127	baseball	Settled	Win	Alex Selesnick	30	33.6	112	f	Paul Blackburn (Pitching Outs)	Under 17.5 Pitching Out	2024-08-13 19:23:00	2024-08-13 23:10:00	pinnacle	1
2002625559	baseball	Settled	Win	Wager Analyst	20	18.35	-109	f	Atlanta Braves vs Minnesota Twins	Atlanta Braves	2024-08-27 22:24:00	2024-08-27 23:40:00	pinnacle	1
1994071505	tennis	Settled	Win	The New Kid	20	14.18	-141	f	Nao Hibino  vs McCartney Kessler	Over 20.5	2024-07-28 14:56:00	2024-07-28 17:14:00	pinnacle	1
2000914908	tennis	Settled	Loss	TennisWinnersOnly	40	34.78	-115	f	Lucas Pouille vs Otto Virtanen	Lucas Pouille	2024-08-22 14:30:00	2024-08-22 16:44:00	pinnacle	1
1993505247	tennis	Settled	Loss	Tennis Titan	65	38.69	-168	f	Stan Wawrinka vs Pavel Kotov	Pavel Kotov	2024-07-26 19:14:00	2024-07-28 15:50:00	pinnacle	1
1994137787	baseball	Settled	Refunded	Matt Severance	20	15.87	-126	f	Colorado Rockies vs San Francisco Giants	San Francisco Giants -1.0	2024-07-28 17:38:00	2024-07-28 20:05:00	pinnacle	1
1993334556	tennis	Settled	Loss	The New Kid	20	15.87	-126	f	Alvaro Guillen Meza vs Max Hans Rehberg	Alvaro Guillen Meza	2024-07-26 06:42:00	2024-07-26 13:00:00	pinnacle	1
2004625557	tennis	Settled	Loss	A11 Bets	10	6.88	-146	t	Parlay	Iga Swiatek  (-369)	2024-09-03 22:37:00	2024-09-05 00:50:00	pinnacle	1
2006403365	baseball	Settled	Win	Matt Severance	30	23.81	-126	f	Colorado Rockies vs Detroit Tigers	Detroit Tigers -1.0	2024-09-10 11:52:00	2024-09-10 18:40:00	pinnacle	1
PRQzDjKsOs45	baseball	Settled	Loss	Alex Selesnick	20	19.047619047619047	-105	f	NY Mets @ ARI Diamondbacks	David Peterson - Under 16.5	2024-08-29 13:51:24	2024-08-29 19:40:00	bet365	1
2002487171	tennis	Settled	Win	Analytics Capper	5	4	-125	f	Zizou Bergs vs Pavel Kotov	Zizou Bergs	2024-08-27 14:39:00	2024-08-27 22:40:00	pinnacle	1
1997263378	tennis	Settled	Refunded	TTW	20	14.93	-134	f	Victoria Azarenka  vs Peyton Stearns	Peyton Stearns   +4.5	2024-08-09 18:41:00	2024-08-09 20:15:00	pinnacle	1
2001993058	football	Settled	Loss	Action Network	20	16.95	-118	f	New England Patriots vs Washington Commanders	New England Patriots -6.5	2024-08-25 15:43:00	2024-08-26 00:08:00	pinnacle	1
2006501128	baseball	Settled	Win	A11 Bets	15	15.9	106	f	San Diego Padres vs Seattle Mariners	San Diego Padres	2024-09-10 21:40:00	2024-09-11 01:40:00	pinnacle	1
1996738818	baseball	Settled	Loss	Analytics Capper	40	46.8	117	f	Houston Astros vs Texas Rangers	Texas Rangers	2024-08-07 17:37:00	2024-08-07 18:35:00	pinnacle	1
1999234202	baseball	Settled	Loss	Zack Cimini	20	20.8	104	f	Seattle Mariners vs Pittsburgh Pirates	Seattle Mariners	2024-08-16 21:09:00	2024-08-16 22:40:00	pinnacle	1
1997658261	baseball	Settled	Loss	Green Cappers	20	22.4	112	f	San Diego Padres vs Miami Marlins	Under 8.5	2024-08-10 18:45:00	2024-08-10 20:10:00	pinnacle	1
1998690164	baseball	Settled	Win	Matt Severance	20	11.63	-172	f	Oakland Athletics vs New York Mets	New York Mets	2024-08-14 18:36:00	2024-08-14 23:10:00	pinnacle	1
1998661521	baseball	Settled	Loss	Micah Roberts	20	16	-125	f	Washington Nationals vs Baltimore Orioles	Over 8.5	2024-08-14 16:40:00	2024-08-14 22:35:00	pinnacle	1
1999488277	baseball	Settled	Win	Dicey	20	12.66	-158	f	Chicago White Sox vs Houston Astros	Houston Astros -1.5	2024-08-17 14:47:00	2024-08-17 23:10:00	pinnacle	1
2004881259	tennis	Settled	Win	A11 Bets	15	16.06	107	t	Parlay	Over 3.5  (-208)	2024-09-05 00:50:00	2024-09-07 03:07:00	pinnacle	1
2001644771	baseball	Settled	Loss	Baseball Boss	20	16.95	-118	f	Arizona Diamondbacks vs Boston Red Sox	Boston Red Sox	2024-08-24 17:25:00	2024-08-24 20:10:00	pinnacle	1
1998717568	baseball	Settled	Loss	Analytics Capper	20	14.49	-138	f	Seattle Mariners vs Detroit Tigers	Seattle Mariners	2024-08-14 21:09:00	2024-08-14 22:40:00	pinnacle	1
2006640781	football	Settled	Win	Picks Office	20	17.86	-112	f	Los Angeles Rams vs Arizona Cardinals	Arizona Cardinals	2024-09-11 15:47:00	2024-09-15 20:05:00	pinnacle	1
1993824424	baseball	Settled	Win	The New Kid	15	16.5	110	f	Atlanta Braves vs New York Mets	Atlanta Braves	2024-07-27 18:42:00	2024-07-27 20:10:00	pinnacle	1
1993883601	mma	Settled	Win	The New Kid	10	11.3	113	f	Gregory Rodrigues vs Christian Leroy Duncan	Gregory Rodrigues	2024-07-27 23:03:00	2024-07-28 03:04:00	pinnacle	1
2005891071	football	Settled	Win	Picks Office	20	18.69	-107	f	Houston Texans vs Indianapolis Colts	Indianapolis Colts +3.0	2024-09-08 12:06:00	2024-09-08 17:00:00	pinnacle	1
2005716259	baseball	Settled	Win	Matt Severance	40	26.49	-151	f	Cincinnati Reds vs New York Mets	New York Mets	2024-09-07 20:08:00	2024-09-07 20:10:00	pinnacle	1
1993627181	tennis	Settled	Refunded	The New Kid	20	17.7	-113	f	Tallon Griekspoor vs Cameron Norrie	Tallon Griekspoor	2024-07-27 09:02:00	2024-07-28 14:00:00	pinnacle	1
1998441062	baseball	Settled	Loss	Matt Severance	20	27.45	137	t	Parlay	New York Mets (-176)	2024-08-13 17:38:00	2024-08-14 01:06:00	pinnacle	1
1998847667	tennis	Settled	Win	Analytics Capper	20	17.09	-117	f	Max Purcell vs Pablo Carreno-Busta	Pablo Carreno-Busta	2024-08-15 15:30:00	2024-08-15 17:00:00	pinnacle	1
bet365_4	football	Settled	Win	Wager Analyst	20	21	105	t	Parlay	Parlay	2024-09-07 19:31:00	2024-09-07 19:44:00	bet365	1
2004144864	baseball	Settled	Loss	Wager Analyst	20	21.4	107	f	San Diego Padres vs Tampa Bay Rays	Tampa Bay Rays	2024-09-01 17:17:00	2024-09-01 17:40:00	pinnacle	1
2005620635	football	Settled	Win	A11 Bets	10	8.26	-121	f	Arkansas vs Oklahoma State	Arkansas +10.5	2024-09-07 15:57:00	2024-09-07 16:00:00	pinnacle	1
2001173106	baseball	Settled	Loss	Matt Severance	10	8.26	-121	f	Arizona Diamondbacks vs Boston Red Sox	Under 10	2024-08-23 14:05:00	2024-08-23 23:10:00	pinnacle	1
1998950556	baseball	Settled	Win	Analytics Capper	30	25.86	-116	f	Washington Nationals vs Philadelphia Phillies	Philadelphia Phillies -1.5	2024-08-15 22:27:00	2024-08-15 22:40:00	pinnacle	1
1996539722	baseball	Settled	Loss	Analytics Capper	20	23.6	118	f	Cincinnati Reds vs Miami Marlins	Miami Marlins	2024-08-06 21:09:00	2024-08-06 22:40:00	pinnacle	1
1993120028	tennis	Settled	Win	Sopranos Picks	40	31.14	-129	t	Parlay	Lorenzo Musetti  (-247)	2024-07-25 05:22:00	2024-07-25 19:45:00	pinnacle	1
1999876129	baseball	Settled	Loss	Matt Severance	20	16.26	-123	f	Toronto Blue Jays vs Chicago Cubs	Chicago Cubs -1.0	2024-08-18 14:36:00	2024-08-18 18:20:00	pinnacle	1
2002457434	tennis	Settled	Win	TennisWinnersOnly	40	37.38	-107	f	Yulia Putintseva vs Linda Noskova	Yulia Putintseva	2024-08-27 12:25:00	2024-08-27 22:56:00	pinnacle	1
1993027876	baseball	Settled	Win	NRFI King	30	24	-125	f	Arizona Diamondbacks vs Kansas City Royals	Under 0.5	2024-07-24 17:58:00	2024-07-25 00:10:00	pinnacle	1
1994591787	tennis	Settled	Loss	Tennis Titan	20	17.09	-117	f	Brandon Nakashima  vs Christopher O'connell	Over 22.5	2024-07-30 16:11:00	2024-07-30 22:00:00	pinnacle	1
2004557488	tennis	Settled	Win	A11 Bets	50	36.77	-258	t	Parlay	Frances Tiafoe  +2.5 (-399)	2024-09-03 16:26:00	2024-09-04 04:47:00	pinnacle	1
1999875210	tennis	Settled	Win	TennisWinnersOnly	40	33.9	-118	f	Jannik Sinner  vs Alexander Zverev	Over 23	2024-08-18 14:34:00	2024-08-18 21:15:00	pinnacle	1
2003681708	tennis	Settled	Win	Illicit Picks	20	18.83	-107	t	Parlay	Tomas Machac  (-158)	2024-08-31 14:58:00	2024-08-31 15:17:00	pinnacle	1
1993119980	tennis	Settled	Loss	Sopranos Picks	40	36.7	-109	f	Andrey Rublev  vs Fabian Marozsan	Fabian Marozsan   +3.5	2024-07-25 05:21:00	2024-07-25 17:45:00	pinnacle	1
2004462298	baseball	Settled	Loss	A11 Bets	10	10.5	105	f	Doosan Bears vs Hanwha Eagles	Doosan Bears	2024-09-03 05:51:00	2024-09-03 09:30:00	pinnacle	1
1997303396	baseball	Settled	Win	Analytics Capper	20	18.52	-108	f	G2 Cleveland Guardians vs G2 Minnesota Twins	G2 Minnesota Twins	2024-08-09 21:27:00	2024-08-10 00:10:00	pinnacle	1
1997704397	baseball	Settled	Win	Analytics Capper	20	15.75	-127	f	New York Mets vs Seattle Mariners	Seattle Mariners	2024-08-10 21:37:00	2024-08-11 01:40:00	pinnacle	1
2004626208	baseball	Settled	Loss	Matt Severance	10	6.67	-150	f	New York Yankees vs Texas Rangers	New York Yankees	2024-09-03 22:43:00	2024-09-04 00:05:00	pinnacle	1
1997908545	baseball	Settled	Win	Analytics Capper	30	32.1	107	f	Philadelphia Phillies vs Arizona Diamondbacks	Arizona Diamondbacks	2024-08-11 14:19:00	2024-08-11 20:10:00	pinnacle	1
1995707118	tennis	Settled	Loss	TTW	15	22.65	151	f	Lorenzo Musetti vs Felix Auger Aliassime	Felix Auger Aliassime	2024-08-03 16:19:00	2024-08-03 17:15:00	pinnacle	1
2001744995	mma	Settled	Loss	Me	20	24.15	120	t	Parlay	Tabatha Ricci (-151)	2024-08-24 22:05:00	2024-08-25 04:09:00	pinnacle	1
1994055778	baseball	Settled	Win	Bruce Marshall	20	19.42	-103	f	Seattle Mariners vs Chicago White Sox	Seattle Mariners	2024-07-28 14:07:00	2024-07-28 18:10:00	pinnacle	1
2002457273	tennis	Settled	Win	TennisWinnersOnly	20	16.39	-122	f	Jaume Munar vs Gabriel Diallo	Gabriel Diallo	2024-08-27 12:24:00	2024-08-27 21:59:00	pinnacle	1
2000475109	tennis	Settled	Win	TTW	20	14.08	-142	f	Corentin Moutet vs Roman Safiullin	Roman Safiullin	2024-08-20 21:25:00	2024-08-20 23:55:00	pinnacle	1
2001811498	baseball	Settled	Win	DirtyBubbleBets	20	15.63	-128	f	LG Twins vs Kiwoom Heroes	Kiwoom Heroes +0.5	2024-08-25 03:58:00	2024-08-25 05:00:00	pinnacle	1
1993021127	baseball	Settled	Loss	NRFI King	30	20.41	-147	f	Milwaukee Brewers vs Chicago Cubs	Under 0.5	2024-07-24 17:30:00	2024-07-24 18:20:00	pinnacle	1
2006071507	football	Settled	Win	OutofLineBets	20	18.52	-108	f	Los Angeles Rams vs Detroit Lions	Detroit Lions -5.0	2024-09-08 23:11:00	2024-09-09 00:20:00	pinnacle	1
2000918032	baseball	Settled	Win	ChaseTheLock	20	22.8	114	f	Aaron Judge (Total Bases)	Over 1.5 Bases	2024-08-22 14:45:00	2024-08-22 17:05:00	pinnacle	1
2002752566	baseball	Settled	Loss	Matt Snyder	20	16.95	-118	f	San Diego Padres vs St. Louis Cardinals	San Diego Padres	2024-08-28 14:08:00	2024-08-28 23:45:00	pinnacle	1
2004353278	tennis	Settled	Loss	A11 Bets	30	27.27	-110	f	Jack Draper  vs Tomas Machac	Over 38.5	2024-09-02 15:45:00	2024-09-02 16:43:00	pinnacle	1
2002456966	tennis	Settled	Loss	TennisWinnersOnly	20	15.27	-131	t	Parlay	Arthur Fils  (-266)	2024-08-27 12:22:00	2024-08-27 19:35:00	pinnacle	1
2006234693	football	Settled	Loss	Wager Analyst	20	15.38	-130	t	Parlay	Under 50.5	2024-09-09 22:05:00	2024-09-10 03:08:00	pinnacle	1
2006031499	football	Settled	Refunded	Wager Analyst	20	17.54	-114	f	Denver Broncos vs Seattle Seahawks	Seattle Seahawks -6.0	2024-09-08 19:38:00	2024-09-08 20:05:00	pinnacle	1
1996792412	baseball	Settled	Win	Analytics Capper	60	55.05	-109	f	Tampa Bay Rays vs St. Louis Cardinals	St. Louis Cardinals	2024-08-07 21:42:00	2024-08-07 23:45:00	pinnacle	1
2001744192	baseball	Settled	Loss	Matt Severance	20	16	-125	f	St. Louis Cardinals vs Minnesota Twins	Minnesota Twins	2024-08-24 22:01:00	2024-08-25 18:10:00	pinnacle	1
2004779638	tennis	Settled	Loss	A11 Bets	15	18.2	121	t	Parlay	Over 3.5  (-216)	2024-09-04 15:30:00	2024-09-04 20:13:00	pinnacle	1
2004462308	baseball	Settled	Loss	A11 Bets	10	8.26	-121	f	Lotte Giants vs Samsung Lions	Lotte Giants	2024-09-03 05:51:00	2024-09-03 09:30:00	pinnacle	1
1997263289	tennis	Settled	Win	TTW	20	17.09	-117	f	Coco Gauff  vs Diana Shnaider	Diana Shnaider   +5.5	2024-08-09 18:41:00	2024-08-09 23:08:00	pinnacle	1
2002168303	tennis	Settled	Win	TennisWinnersOnly	40	26.32	-152	f	Giovanni Mpetshi Perricard vs Tomas Martin Etcheverry	Tomas Martin Etcheverry	2024-08-26 04:10:00	2024-08-26 19:47:00	pinnacle	1
2006350167	tennis	Settled	Loss	The Betting Expert	10	8.62	-116	f	Antonia Ruzic vs Nadia Podoroska	Nadia Podoroska	2024-09-10 08:46:00	2024-09-10 11:11:00	pinnacle	1
2005036144	baseball	Settled	Win	Wager Analyst	20	13.79	-145	f	Minnesota Twins vs Tampa Bay Rays	Minnesota Twins	2024-09-05 15:42:00	2024-09-05 17:10:00	pinnacle	1
2004332680	tennis	Settled	Win	TennisWinnersOnly	20	12.35	-162	f	Karolina Muchova vs Jasmine Paolini	Karolina Muchova	2024-09-02 13:28:00	2024-09-02 15:09:00	pinnacle	1
2006510109	baseball	Settled	Loss	Sharp Sheet	40	31.75	-126	f	Cincinnati Reds vs St. Louis Cardinals	St. Louis Cardinals	2024-09-10 18:50:00	2024-09-10 19:45:00	pinnacle	1
1998616871	tennis	Settled	Win	Tennis Titan	24	20.34	-118	f	Holger Rune  vs Matteo Berrettini	Over 23	2024-08-14 13:10:00	2024-08-14 16:40:00	pinnacle	1
1998385241	tennis	Settled	Loss	Me	10	31.65	316	t	Parlay	Alejandro Tabilo  (-268)	2024-08-13 13:52:00	2024-08-13 17:10:00	pinnacle	1
1993952103	tennis	Settled	Loss	The New Kid	20	16.26	-123	f	Bianca Vanessa Andreescu  vs Clara Tauson	Over 21.5	2024-07-28 06:41:00	2024-07-28 10:10:00	pinnacle	1
2002751496	tennis	Settled	Win	TennisWinnersOnly	20	15.63	-128	f	Rinky Hijikata vs Grigor Dimitrov	Grigor Dimitrov  -2.5	2024-08-28 14:04:00	2024-08-28 15:00:00	pinnacle	1
2001738715	football	Settled	Win	Emory Hunt	20	19.8	-101	f	North Alabama vs SE Missouri St	SE Missouri St -7.0	2024-08-24 21:38:00	2024-08-24 23:00:00	pinnacle	1
2005892800	football	Settled	Win	Matt Severance	10	10.5	105	f	Carolina Panthers vs New Orleans Saints	Carolina Panthers - Under 17.5	2024-09-08 12:13:00	2024-09-08 17:00:00	pinnacle	1
1999673251	baseball	Settled	Win	Analytics Capper	30	24.19	-124	f	Cleveland Guardians vs Milwaukee Brewers	Milwaukee Brewers	2024-08-17 22:50:00	2024-08-17 23:15:00	pinnacle	1
1999596252	baseball	Settled	Loss	Micah Roberts	20	15.75	-127	f	Washington Nationals vs Philadelphia Phillies	Over 9	2024-08-17 18:49:00	2024-08-17 22:05:00	pinnacle	1
1997037880	baseball	Settled	Win	ValueLockSports	20	15.87	-126	f	Philadelphia Phillies vs Arizona Diamondbacks	Over 9.5	2024-08-08 21:39:00	2024-08-09 01:40:00	pinnacle	1
1994071390	tennis	Settled	Loss	The New Kid	20	16.81	-119	f	Sachia Vickery vs Kamilla Rakhimova	Sachia Vickery	2024-07-28 14:56:00	2024-07-28 15:53:00	pinnacle	1
1993824403	baseball	Settled	Win	The New Kid	15	13.39	-112	f	San Diego Padres vs Baltimore Orioles	San Diego Padres	2024-07-27 18:42:00	2024-07-27 20:05:00	pinnacle	1
1996675878	tennis	Settled	Loss	The New Kid	20	15.38	-130	f	Caroline Dolehide  vs Amanda Anisimova	Over 20.5	2024-08-07 13:38:00	2024-08-07 19:00:00	pinnacle	1
1998950588	baseball	Settled	Loss	Analytics Capper	30	26.55	-113	f	Boston Red Sox vs Baltimore Orioles	Over 8	2024-08-15 22:27:00	2024-08-15 22:35:00	pinnacle	1
2004381402	tennis	Settled	Win	A11 Bets	50	36.43	-138	t	Parlay	Over 3.5  (-175)	2024-09-02 18:05:00	2024-09-02 21:57:00	pinnacle	1
2002752347	baseball	Settled	Loss	Matt Snyder	20	26.2	131	f	Kansas City Royals vs Cleveland Guardians	Kansas City Royals	2024-08-28 14:07:00	2024-08-28 17:10:00	pinnacle	1
1996083126	baseball	Settled	Loss	Analytics Capper	40	29.2	-137	f	Toronto Blue Jays vs New York Yankees	New York Yankees -1.5	2024-08-04 17:14:00	2024-08-04 17:35:00	pinnacle	1
2000161660	tennis	Settled	Win	TennisWinnersOnly	20	23.2	116	f	Katie Volynets vs Sofia Kenin	Sofia Kenin	2024-08-19 16:26:00	2024-08-20 00:21:00	pinnacle	1
7gHJNctSw3vi	baseball	Settled	Win	Me	10	52.5	525	t	SGP - BOS Red Sox @ NY Mets	Francisco  Lindor - Over 1.5 Hits, Runs and RBIs, Game Run Line: NY Mets -2.5 Runs, Over 7.5 Runs	2024-09-04 02:17:12	2024-09-04 02:17:12	bet365	1
2002990312	tennis	Settled	Win	The Betting Expert	20	20.6	103	f	Mariano Navone vs Dan Evans	Dan Evans	2024-08-29 12:01:00	2024-08-29 21:12:00	pinnacle	1
2005007429	tennis	Settled	Loss	Value Hunter	40	29.2	-137	f	Ignacio Buse vs Daniel Elahi Galan	Daniel Elahi Galan	2024-09-05 14:07:00	2024-09-06 14:30:00	pinnacle	1
1998238307	tennis	Settled	Loss	Illicit Picks	20	17.72	-113	t	Parlay	Hamad Medjedovic  +1.5 (-274)	2024-08-12 19:08:00	2024-08-13 01:27:00	pinnacle	1
2001299900	baseball	Settled	Win	PickzHub	20	50.46	252	t	Parlay	Atlanta Braves (-249)	2024-08-23 20:51:00	2024-08-23 23:20:00	pinnacle	1
2000702713	baseball	Settled	Loss	Matt Severance	5	6.95	139	f	Yariel Rodríguez (Pitching Outs)	Over 15.5 Pitching Out	2024-08-21 18:13:00	2024-08-21 23:07:00	pinnacle	1
1994327225	tennis	Settled	Win	Illicit Picks	40	37.74	-106	f	Christopher O'connell vs Harold Mayot	Christopher O'connell	2024-07-29 14:37:00	2024-07-29 15:00:00	pinnacle	1
2000285526	baseball	Settled	Win	Matt Severance	20	13.61	-147	f	Seattle Mariners vs Los Angeles Dodgers	Los Angeles Dodgers	2024-08-20 01:57:00	2024-08-20 02:10:00	pinnacle	1
2005892050	football	Settled	Win	Matt Severance	10	5.13	-195	f	Tennessee Titans vs Chicago Bears	Chicago Bears	2024-09-08 12:10:00	2024-09-08 17:00:00	pinnacle	1
1999673247	baseball	Settled	Loss	Analytics Capper	30	21.74	-138	f	Minnesota Twins vs Texas Rangers	Texas Rangers	2024-08-17 22:50:00	2024-08-17 23:05:00	pinnacle	1
2000915125	tennis	Settled	Loss	TennisWinnersOnly	20	18.52	-108	f	Beatriz Haddad Maia  vs Clara Burel	Over 21.5	2024-08-22 14:32:00	2024-08-22 18:39:00	pinnacle	1
2005975565	tennis	Settled	Win	TennisWinnersOnly	40	32	-125	f	Jannik Sinner  vs Taylor Fritz	Under 39.5	2024-09-08 16:53:00	2024-09-08 18:16:00	pinnacle	1
2000409736	tennis	Settled	Win	Illicit Picks	30	21.9	-137	f	Sebastian Baez vs Borna Coric	Borna Coric	2024-08-20 17:06:00	2024-08-20 20:15:00	pinnacle	1
2002884567	baseball	Settled	Win	Wager Analyst	20	16	-125	f	Miami Marlins vs Colorado Rockies	Colorado Rockies	2024-08-28 22:12:00	2024-08-29 00:40:00	pinnacle	1
2000365693	tennis	Settled	Win	TennisWinnersOnly	40	29.63	-135	f	Sebastian Baez vs Borna Coric	Borna Coric	2024-08-20 14:25:00	2024-08-20 20:15:00	pinnacle	1
1999983646	tennis	Settled	Loss	Illicit Picks	20	16.67	-120	f	Thiago Seyboth Wild vs James Duckworth	James Duckworth	2024-08-18 18:49:00	2024-08-19 01:15:00	pinnacle	1
2004428716	baseball	Settled	Win	The Betting Expert	20	21.2	106	f	Pittsburgh Pirates vs Chicago Cubs	Over 7.5	2024-09-02 23:03:00	2024-09-02 23:40:00	pinnacle	1
1999545137	tennis	Settled	Win	Illicit Picks	40	36.09	-307	t	Parlay	Frances Tiafoe  +1.5 (-230)	2024-08-17 16:59:00	2024-08-18 00:23:00	pinnacle	1
2002751382	tennis	Settled	Win	TennisWinnersOnly	40	33.06	-121	f	Francisco Cerundolo vs Tomas Martin Etcheverry	Tomas Martin Etcheverry	2024-08-28 14:03:00	2024-08-28 15:00:00	pinnacle	1
2003312826	tennis	Settled	Win	TTW	20	17.86	-112	f	Elina Svitolina  vs Coco Gauff	Elina Svitolina   +3.5	2024-08-30 16:06:00	2024-08-30 16:12:00	pinnacle	1
2004529009	tennis	Settled	Refunded	TennisWinnersOnly	40	35.09	-114	f	Grigor Dimitrov  vs Frances Tiafoe	Frances Tiafoe   +3.0	2024-09-03 14:07:00	2024-09-04 00:55:00	pinnacle	1
2000409825	tennis	Settled	Loss	Illicit Picks	20	26	130	f	Murkel Dellien vs Kimmer Coppejans	Kimmer Coppejans	2024-08-20 17:07:00	2024-08-20 17:15:00	pinnacle	1
1995144638	tennis	Settled	Win	Tennis Titan	40	32.2	-125	t	Parlay	Sebastian Korda  (-263)	2024-08-01 17:24:00	2024-08-01 19:00:00	pinnacle	1
2005897854	football	Settled	Win	Picks Office	20	18.18	-110	f	Las Vegas Raiders vs Los Angeles Chargers	Under 40.5	2024-09-08 12:32:00	2024-09-08 20:05:00	pinnacle	1
5J0KF0TMbpe8	tennis	Settled	Loss	A11 Bets	10	9.090909090909092	-110	f	Taylor Fritz v Alexander Zverev	Alexander Zverev to win set 4	2024-09-03 22:41:08	2024-09-03 22:41:08	bet365	1
1997984817	baseball	Settled	Win	ValueLockSports	20	17.24	-116	f	Houston Astros vs Boston Red Sox	Houston Astros -1.0	2024-08-11 17:22:00	2024-08-11 17:35:00	pinnacle	1
2002752296	baseball	Settled	Loss	Matt Severance	20	17.54	-114	f	Chicago Cubs vs Pittsburgh Pirates	Pittsburgh Pirates -1.0	2024-08-28 14:07:00	2024-08-28 16:35:00	pinnacle	1
1997037843	baseball	Settled	Win	ValueLockSports	40	38.1	-105	f	Cincinnati Reds vs Miami Marlins	Cincinnati Reds -1.5	2024-08-08 21:39:00	2024-08-08 22:10:00	pinnacle	1
2003648552	football	Settled	Loss	The Betting Expert	20	19.05	-105	f	Virginia Tech vs Vanderbilt	Virginia Tech -13.5	2024-08-31 13:47:00	2024-08-31 16:08:00	pinnacle	1
2004576665	baseball	Settled	Win	Matt Snyder	20	29.4	147	f	Boston Red Sox vs New York Mets	New York Mets -1.5	2024-09-03 17:51:00	2024-09-03 23:10:00	pinnacle	1
2004145012	baseball	Settled	Win	Wager Analyst	30	21.74	-138	f	New York Mets vs Chicago White Sox	New York Mets -1.0	2024-09-01 17:17:00	2024-09-01 18:10:00	pinnacle	1
1998686516	baseball	Settled	Win	Matt Severance	20	15.04	-133	f	Pittsburgh Pirates vs San Diego Padres	San Diego Padres	2024-08-14 18:19:00	2024-08-14 20:10:00	pinnacle	1
P18u-a0SAuSN	basketball	Settled	Loss	Me	5	35	700	f	IND Fever @ CHI Sky	Angel Reese: 20+ Rebounds	2024-08-30 13:23:41	2024-08-30 13:23:41	bet365	1
1999484208	baseball	Settled	Loss	Matt Severance	20	14.81	-135	f	San Diego Padres vs Colorado Rockies	Colorado Rockies +2.5	2024-08-17 14:38:00	2024-08-18 00:10:00	pinnacle	1
1998759676	baseball	Settled	Loss	Matt Severance	20	16.26	-123	f	Oakland Athletics vs New York Mets	New York Mets -1.0	2024-08-15 03:13:00	2024-08-15 17:10:00	pinnacle	1
2001626629	baseball	Settled	Win	Zack Cimini	20	19.23	-104	f	Philadelphia Phillies vs Kansas City Royals	Philadelphia Phillies	2024-08-24 16:47:00	2024-08-24 23:10:00	pinnacle	1
2000359457	baseball	Settled	Win	Alex Selesnick	20	19.23	-104	f	Erick Fedde (Pitching Outs)	Under 17.5 Pitching Out	2024-08-20 13:51:00	2024-08-20 23:45:00	pinnacle	1
2004395969	baseball	Settled	Loss	Wager Analyst	20	13.25	-151	f	Houston Astros vs Cincinnati Reds	Houston Astros	2024-09-02 19:08:00	2024-09-02 20:10:00	pinnacle	1
1993716327	tennis	Settled	Win	Sopranos Picks	40	33.31	-121	t	Parlay	Dayana Yastremska  (-325)	2024-07-27 13:58:00	2024-07-28 16:20:00	pinnacle	1
2003061595	tennis	Settled	Win	Illicit Picks	40	28.3	-142	t	Parlay	Jack Draper  (-1023)	2024-08-29 17:10:00	2024-08-29 18:48:00	pinnacle	1
8xXamAfFRcKq	tennis	Settled	Win	TTW	20	22	110	f	Linda Noskova v Emma Navarro	Linda Noskova	2024-08-23 23:44:28	2024-08-23 23:44:28	bet365	1
2003061716	tennis	Settled	Win	Illicit Picks	20	19.42	-103	f	Mariano Navone vs Dan Evans	Dan Evans	2024-08-29 17:10:00	2024-08-29 21:12:00	pinnacle	1
2006075294	basketball	Settled	Win	A11 Bets	20.01	14	-143	t	Parlay	Connecticut Sun (-520)	2024-09-08 23:42:00	2024-09-09 03:37:00	pinnacle	1
1994406162	tennis	Settled	Loss	Tennis Titan	25	19.53	-128	f	Reilly Opelka  vs James Duckworth	James Duckworth   +2.5	2024-07-29 19:57:00	2024-07-30 04:00:00	pinnacle	1
2003646612	tennis	Settled	Loss	TennisWinnersOnly	40	25.16	-159	f	Botic Van De Zandschulp vs Jack Draper	Over 3.5	2024-08-31 13:43:00	2024-08-31 16:48:00	pinnacle	1
2005892637	football	Settled	Win	Matt Severance	5	4.95	-101	f	Travis Etienne Jr. (Anytime TD)	Yes	2024-09-08 12:12:00	2024-09-08 17:00:00	pinnacle	1
1993063979	tennis	Settled	Loss	Sopranos Picks	60	66.6	111	f	Mattia Bellucci  vs Adrian Mannarino	Adrian Mannarino	2024-07-24 20:49:00	2024-07-24 19:00:00	pinnacle	1
1998920628	baseball	Settled	Loss	Green Cappers	20	18.18	-110	f	Atlanta Braves vs San Francisco Giants	Over 7	2024-08-15 19:37:00	2024-08-15 19:45:00	pinnacle	1
2000161416	tennis	Settled	Win	TennisWinnersOnly	20	20.8	104	f	Aryna Sabalenka vs Jessica Pegula	Aryna Sabalenka  -1.5	2024-08-19 16:25:00	2024-08-19 19:08:00	pinnacle	1
2004529496	tennis	Settled	Win	TennisWinnersOnly	20	15.63	-128	f	Qinwen Zheng vs Aryna Sabalenka	Aryna Sabalenka  -1.5	2024-09-03 14:10:00	2024-09-03 23:17:00	pinnacle	1
1995114952	baseball	Settled	Refunded	Matt Severance	10	8.7	-115	f	Colorado Rockies vs Los Angeles Angels	Under 9	2024-08-01 15:33:00	2024-08-02 01:38:00	pinnacle	1
2002603319	baseball	Settled	Loss	Jeff Hochman	10	14.3	143	f	Elly De La Cruz (Total Bases)	Over 1.5 Bases	2024-08-27 20:22:00	2024-08-27 22:40:00	pinnacle	1
2004992141	baseball	Settled	Win	Matt Snyder	20	15.27	-131	f	Philadelphia Phillies vs Miami Marlins	Philadelphia Phillies -1.5	2024-09-05 13:14:00	2024-09-05 22:40:00	pinnacle	1
1993716468	tennis	Settled	Win	Sopranos Picks	40	52	130	f	Jule Niemeier vs Sachia Vickery	Sachia Vickery	2024-07-27 13:58:00	2024-07-27 15:54:00	pinnacle	1
2003656891	baseball	Settled	Loss	Illicit Picks	20	12.42	-161	f	Pittsburgh Pirates vs Cleveland Guardians	Cleveland Guardians	2024-08-31 14:04:00	2024-08-31 22:10:00	pinnacle	1
2002762883	tennis	Settled	Win	TTW	20	16.26	-123	f	Moyuka Uchijima vs Jule Niemeier	Jule Niemeier	2024-08-28 14:51:00	2024-08-28 15:10:00	pinnacle	1
1998476443	baseball	Settled	Win	Matt Snyder	20	16	-125	f	St. Louis Cardinals vs Cincinnati Reds	Cincinnati Reds	2024-08-13 19:21:00	2024-08-13 22:40:00	pinnacle	1
2002885116	baseball	Settled	Win	NRFI King	20	15.75	-127	f	New York Mets vs Arizona Diamondbacks	Draw	2024-08-28 22:17:00	2024-08-29 01:40:00	pinnacle	1
2004416998	football	Settled	Loss	OutofLineBets	40	32.26	-124	f	Boston College vs Florida State	Florida State -14.5	2024-09-02 21:26:00	2024-09-02 23:30:00	pinnacle	1
1996438344	tennis	Settled	Loss	The New Kid	12	24.9	207	t	Parlay	Karen Khachanov  (-200)	2024-08-06 13:42:00	2024-08-07 01:15:00	pinnacle	1
2003008822	baseball	Settled	Loss	Matt Severance	20	16.81	-119	f	New York Mets vs Arizona Diamondbacks	Arizona Diamondbacks	2024-08-29 13:48:00	2024-08-29 19:40:00	pinnacle	1
1994685846	baseball	Settled	Loss	ValueLockSports	20	20.8	104	f	Minnesota Twins vs New York Mets	Minnesota Twins	2024-07-30 21:55:00	2024-07-30 23:10:00	pinnacle	1
2003470641	tennis	Settled	Loss	TTW	20	25.6	128	f	Alexei Popyrin  vs Novak Djokovic	Novak Djokovic	2024-08-31 01:54:00	2024-08-31 00:30:00	pinnacle	1
1998824319	tennis	Settled	Win	TennisWinnersOnly	20	15.75	-127	f	Alexander Zverev vs Karen Khachanov	Alexander Zverev  -1.5	2024-08-15 13:27:00	2024-08-15 15:15:00	pinnacle	1
2006744249	baseball	Settled	Loss	A11 Bets	10	8.7	-115	f	Lotte Giants vs Kia Tigers	Over 11	2024-09-12 03:23:00	2024-09-12 09:30:00	pinnacle	1
2004530766	football	Settled	Win	Mike McClure	20	19.05	-105	f	Baltimore Ravens vs Kansas City Chiefs	Over 46	2024-09-03 14:16:00	2024-09-06 00:40:00	pinnacle	1
2006234600	baseball	Settled	Win	Wager Analyst	20	15.63	-128	f	Chicago Cubs vs Los Angeles Dodgers	Over 9.5	2024-09-09 18:03:00	2024-09-09 22:10:00	pinnacle	1
2004571505	tennis	Settled	Loss	A11 Bets	5	21.47	429	t	Parlay	Iga Swiatek  (-361)	2024-09-03 17:30:00	2024-09-05 00:50:00	pinnacle	1
1996675264	tennis	Settled	Win	The New Kid	20	15.38	-130	f	Beatriz Haddad Maia  vs Marie Bouzkova	Over 21	2024-08-07 13:36:00	2024-08-07 15:30:00	pinnacle	1
bet365_3	football	Settled	Win	Super Boost	40	40	-100	f	GB Packers vs PHI Eagles	Shaquon Barkley 75+ combined yards	2024-09-06 17:36:20	2024-09-06 19:36:20	bet365	1
2003061805	tennis	Settled	Loss	Illicit Picks	20	17.46	-115	t	Parlay	Jakub Mensik  (-440)	2024-08-29 17:10:00	2024-08-29 20:00:00	pinnacle	1
2001300132	tennis	Settled	Win	OutofLineBets	30	21.74	-138	f	Rio Noguchi vs Yibing WU	Yibing WU  -1.5	2024-08-23 20:52:00	2024-08-24 03:35:00	pinnacle	1
irvy0CMTzTWQ	baseball	Settled	Loss	Top Cheddar	10	35	350	t	SGP - KC Royals @ HOU Astros	Framber Valdez - Under 6.5 Strikeouts, Seth Lugo - Under 18.5 Outs, Yordan Alvarez - 2+ Hits, Runs and RBIs	2024-08-30 13:23:31	2024-08-30 13:23:31	bet365	1
2005633321	tennis	Settled	Win	TennisWinnersOnly	40	31.01	-129	f	Jessica Pegula  vs Aryna Sabalenka	Over 20.5	2024-09-07 16:29:00	2024-09-07 20:17:00	pinnacle	1
1997303446	baseball	Settled	Loss	Analytics Capper	20	15.38	-130	f	Houston Astros vs Boston Red Sox	Boston Red Sox	2024-08-09 21:27:00	2024-08-09 23:10:00	pinnacle	1
1993120039	tennis	Settled	Win	Sopranos Picks	20	19.61	-102	f	Lina Glushko vs Leonie Kung	Leonie Kung	2024-07-25 05:22:00	2024-07-25 10:05:00	pinnacle	1
2003681826	tennis	Settled	Win	Illicit Picks	20	17.69	-114	t	Parlay	Over 3.5  (-171)	2024-08-31 14:59:00	2024-08-31 20:25:00	pinnacle	1
2002457560	tennis	Settled	Win	TennisWinnersOnly	20	16.81	-119	f	Anastasia Potapova  vs Leylah Annie Fernandez	Anastasia Potapova   +3.5	2024-08-27 12:26:00	2024-08-27 20:37:00	pinnacle	1
1997037818	baseball	Settled	Loss	Analytics Capper	40	35.71	-112	f	Philadelphia Phillies vs Arizona Diamondbacks	Arizona Diamondbacks	2024-08-08 21:38:00	2024-08-09 01:40:00	pinnacle	1
2006466307	baseball	Settled	Win	A11 Bets	10	11.6	116	f	New York Mets vs Toronto Blue Jays	Toronto Blue Jays	2024-09-10 15:14:00	2024-09-10 19:07:00	pinnacle	1
1998165563	baseball	Settled	Win	Matt Severance	20	21	105	f	New York Yankees vs Chicago White Sox	Chicago White Sox +2.5	2024-08-12 14:09:00	2024-08-13 00:10:00	pinnacle	1
2003090796	tennis	Settled	Win	Green Cappers	10	9.8	-102	f	Sofia Kenin  vs Jessica Pegula	Sofia Kenin   +5.5	2024-08-29 18:40:00	2024-08-29 18:54:00	pinnacle	1
2002761810	tennis	Settled	Win	TTW	20	15.75	-127	f	Francisco Cerundolo vs Tomas Martin Etcheverry	Tomas Martin Etcheverry	2024-08-28 14:47:00	2024-08-28 15:00:00	pinnacle	1
2004991490	tennis	Settled	Win	OutofLineBets	30	23.81	-126	f	Jaume Munar  vs Kilian Feldbausch	Jaume Munar   -3.5	2024-09-05 13:11:00	2024-09-05 15:00:00	pinnacle	1
1993626738	tennis	Settled	Loss	The New Kid	15	27.84	185	t	Parlay	Stefanos Tsitsipas  (-631)	2024-07-27 09:00:00	2024-07-28 14:00:00	pinnacle	1
1998655351	baseball	Settled	Win	Micah Roberts	20	18.02	-111	f	Colorado Rockies vs Arizona Diamondbacks	Over 9	2024-08-14 16:17:00	2024-08-14 19:40:00	pinnacle	1
1992786392	tennis	Settled	Loss	The New Kid	37.5	30.49	-123	f	Mattia Bellucci vs Aleksandar Vukic	Aleksandar Vukic	2024-07-23 17:26:00	2024-07-23 18:00:00	pinnacle	1
1998824162	tennis	Settled	Loss	TennisWinnersOnly	40	36.04	-111	f	Zhizhen Zhang  vs Andrey Rublev	Zhizhen Zhang   +3.5	2024-08-15 13:27:00	2024-08-15 18:15:00	pinnacle	1
2001540624	baseball	Settled	Win	Matt Severance	20	16.81	-119	f	Texas Rangers vs Cleveland Guardians	Cleveland Guardians	2024-08-24 13:54:00	2024-08-24 23:10:00	pinnacle	1
2002787694	baseball	Settled	Win	Zack Cimini	20	16.81	-119	f	New York Mets vs Arizona Diamondbacks	Arizona Diamondbacks	2024-08-28 16:21:00	2024-08-29 01:40:00	pinnacle	1
2002279078	baseball	Settled	Win	Micah Roberts	20	27.2	136	f	Toronto Blue Jays vs Boston Red Sox	Toronto Blue Jays	2024-08-26 17:09:00	2024-08-26 23:10:00	pinnacle	1
2002487291	tennis	Settled	Win	Analytics Capper	5	3.38	-148	f	Jelena Ostapenko vs Naomi Osaka	Naomi Osaka	2024-08-27 14:39:00	2024-08-27 18:11:00	pinnacle	1
1993121384	tennis	Settled	Refunded	The New Kid	20	16.95	-118	f	Magdalena Frech  vs Laura Samson	Over 20.5	2024-07-25 05:56:00	2024-07-25 09:07:00	pinnacle	1
1998403344	tennis	Settled	Loss	TTW	10	23.1	231	f	Harriet Dart vs Yulia Putintseva	Harriet Dart	2024-08-13 15:18:00	2024-08-14 01:35:00	pinnacle	1
2003292424	tennis	Settled	Loss	OutofLineBets	20	14.39	-139	f	Tallon Griekspoor vs Grigor Dimitrov	Over 3.5	2024-08-30 14:53:00	2024-08-30 20:10:00	pinnacle	1
1999483256	tennis	Settled	Loss	TennisWinnersOnly	20	17.39	-115	f	Jack Draper  vs Holger Rune	Over 23	2024-08-17 14:36:00	2024-08-18 01:50:00	pinnacle	1
1996439000	tennis	Settled	Win	Sopranos Picks	20	20.8	104	f	Tomas Martn Etcheverry  vs Nicolas Jarry	Over 23.5	2024-08-06 13:44:00	2024-08-06 19:40:00	pinnacle	1
1996676776	tennis	Settled	Loss	Sopranos Picks	40	39.22	-102	f	Magda Linette  vs Rebecca Marino	Rebecca Marino   +3.5	2024-08-07 13:42:00	2024-08-07 19:32:00	pinnacle	1
1998847724	tennis	Settled	Win	Analytics Capper	20	15.38	-130	f	Brandon Nakashima vs Arthur Fils	Brandon Nakashima	2024-08-15 15:30:00	2024-08-15 19:00:00	pinnacle	1
2001541920	football	Settled	Loss	Zack Cimini	20	17.54	-114	f	SMU vs Nevada	SMU -27.0	2024-08-24 13:57:00	2024-08-25 00:00:00	pinnacle	1
2006367228	tennis	Settled	Loss	Sopranos Picks	20	16.95	-118	f	Kristina Dmitruk vs Tena Lukas	Tena Lukas	2024-09-10 09:43:00	2024-09-10 11:30:00	pinnacle	1
2006501118	baseball	Settled	Win	Sharp Sheet	15	18.6	124	f	Kansas City Royals vs New York Yankees	Kansas City Royals	2024-09-10 17:39:00	2024-09-10 19:05:00	pinnacle	1
1998431366	tennis	Settled	Loss	Illicit Picks	10	16	160	f	Roman Safiullin vs Terence Atmane	Terence Atmane	2024-08-13 17:06:00	2024-08-13 22:20:00	pinnacle	1
bet365_2	football	Settled	Loss	Super Boost	40	40	-100	f	BAL Ravens vs KC Chiefs	Tavis Kelce 5+ receptions	2024-09-05 17:36:20	2024-09-05 19:36:20	bet365	1
2002988742	tennis	Settled	Loss	TennisWinnersOnly	20	16	-125	f	Jordan Thompson  vs Hubert Hurkacz	Over 39	2024-08-29 11:52:00	2024-08-29 15:10:00	pinnacle	1
1999482810	tennis	Settled	Win	TennisWinnersOnly	40	50.4	126	f	Hubert Hurkacz vs Frances Tiafoe	Frances Tiafoe	2024-08-17 14:35:00	2024-08-17 23:45:00	pinnacle	1
2002202577	tennis	Settled	Loss	OutofLineBets	30	28.85	-104	f	Hugo Grenier  vs Mitchell Krueger	Hugo Grenier   +1.5	2024-08-26 11:21:00	2024-08-26 15:00:00	pinnacle	1
2003428602	baseball	Settled	Win	Matt Snyder	20	22.2	111	f	San Diego Padres vs Tampa Bay Rays	San Diego Padres	2024-08-30 21:34:00	2024-08-30 22:50:00	pinnacle	1
2000632398	tennis	Settled	Win	TennisWinnersOnly	40	45.2	113	f	Thiago Seyboth Wild vs Learner Tien	Learner Tien	2024-08-21 14:11:00	2024-08-21 21:55:00	pinnacle	1
2006031333	football	Settled	Win	A11 Bets	10	7.81	-128	f	Dallas Cowboys vs Cleveland Browns	Dallas Cowboys +3.0	2024-09-08 19:38:00	2024-09-08 20:25:00	pinnacle	1
2000783409	baseball	Settled	Win	Matt Severance	10	7.87	-127	f	Seattle Mariners vs Los Angeles Dodgers	Los Angeles Dodgers -1.0	2024-08-22 00:02:00	2024-08-22 02:10:00	pinnacle	1
1999875328	tennis	Settled	Win	TennisWinnersOnly	20	27.2	136	f	Frances Tiafoe vs Holger Rune	Frances Tiafoe	2024-08-18 14:34:00	2024-08-19 01:20:00	pinnacle	1
1996279404	tennis	Settled	Loss	Sopranos Picks	60	49.18	-122	f	Arthur Cazaux  vs Taro Daniel	Arthur Cazaux   -1.5	2024-08-05 16:16:00	2024-08-06 15:15:00	pinnacle	1
2000688598	tennis	Settled	Loss	Illicit Picks	20	18.35	-109	f	Valentin Royer vs Ethan Quinn	Ethan Quinn	2024-08-21 17:25:00	2024-08-21 19:25:00	pinnacle	1
2004332690	tennis	Settled	Loss	TennisWinnersOnly	40	35.09	-114	f	Caroline Wozniacki vs Beatriz Haddad Maia	Caroline Wozniacki	2024-09-02 13:28:00	2024-09-02 18:48:00	pinnacle	1
2005560541	football	Settled	Win	Matt Severance	20	19.42	-103	f	Pittsburgh vs Cincinnati	Under 62.5	2024-09-07 13:08:00	2024-09-07 16:00:00	pinnacle	1
1993883797	tennis	Settled	Loss	The New Kid	15	18	120	f	Yoshihito Nishioka vs Arthur Rinderknech	Arthur Rinderknech	2024-07-27 23:04:00	2024-07-27 23:10:00	pinnacle	1
2000632619	tennis	Settled	Loss	TennisWinnersOnly	20	21	105	f	Greetje Minnen vs Ana Bogdan	Greetje Minnen	2024-08-21 14:12:00	2024-08-21 16:53:00	pinnacle	1
2003008675	baseball	Settled	Loss	Matt Severance	40	35.71	-112	f	Los Angeles Angels vs Detroit Tigers	Detroit Tigers -1.0	2024-08-29 13:47:00	2024-08-29 17:10:00	pinnacle	1
1996676598	tennis	Settled	Loss	The New Kid	20	19.61	-102	f	Alejandro Davidovich Fokina vs Roman Safiullin	Roman Safiullin	2024-08-07 13:41:00	2024-08-07 17:15:00	pinnacle	1
1998431258	tennis	Settled	Win	Illicit Picks	20	13.25	-151	f	Lorenzo Musetti vs Nicolas Jarry	Nicolas Jarry  +1.5	2024-08-13 17:06:00	2024-08-13 20:10:00	pinnacle	1
1999484511	baseball	Settled	Win	Zack Cimini	20	15.75	-127	f	Toronto Blue Jays vs Chicago Cubs	Under 8.5	2024-08-17 14:39:00	2024-08-17 18:20:00	pinnacle	1
2004558491	tennis	Settled	Win	A11 Bets	8	8.54	-259	t	Parlay	Over 3.5  (-258)	2024-09-03 16:31:00	2024-09-04 04:47:00	pinnacle	1
2000686247	tennis	Settled	Loss	TTW	20	16	-125	f	Zachary Svajda vs Pavel Kotov	Zachary Svajda	2024-08-21 17:15:00	2024-08-21 18:15:00	pinnacle	1
2001993005	football	Settled	Loss	Action Network	20	18.52	-108	f	Tennessee Titans vs New Orleans Saints	Under 36.5	2024-08-25 15:43:00	2024-08-25 18:00:00	pinnacle	1
1995006030	tennis	Settled	Loss	The New Kid	20	25.04	125	t	Parlay	Novak Djokovic  (-288)	2024-08-01 03:24:00	2024-08-01 17:10:00	pinnacle	1
1997909313	football	Settled	Win	Analytics Capper	10	9.26	-108	f	Denver Broncos vs Indianapolis Colts	Denver Broncos +2.0	2024-08-11 14:21:00	2024-08-11 17:07:00	pinnacle	1
2000632434	tennis	Settled	Win	TennisWinnersOnly	40	36.36	-104	f	Arthur Rinderknech vs David Goffin	David Goffin	2024-08-21 14:11:00	2024-08-21 18:05:00	pinnacle	1
1993883555	mma	Settled	Loss	The New Kid	12	7.27	-165	f	Preston Parsons vs Oban Elliott	Preston Parsons	2024-07-27 23:03:00	2024-07-27 23:40:00	pinnacle	1
2001173182	baseball	Settled	Win	Matt Severance	5	4.27	-117	f	Chris Flexen (Pitching Outs)	Over 14.5 Pitching Out	2024-08-23 14:06:00	2024-08-24 00:10:00	pinnacle	1
1995170995	tennis	Settled	Loss	The New Kid	15	18.3	122	f	Giovanni Perricard  vs Jordan Thompson	Giovanni Perricard	2024-08-01 19:00:00	2024-08-01 19:00:00	pinnacle	1
2005643848	football	Settled	Loss	Picks Office	20	18.35	-109	f	Temple vs Navy	Under 42.5	2024-09-07 16:54:00	2024-09-07 19:30:00	pinnacle	1
1998199446	baseball	Settled	Refunded	Matt Severance	20	14.71	-136	f	Pittsburgh Pirates vs San Diego Padres	San Diego Padres -1.0	2024-08-12 16:43:00	2024-08-13 01:40:00	pinnacle	1
1999092439	baseball	Settled	Loss	Matt Snyder	20	15.87	-126	f	Washington Nationals vs Philadelphia Phillies	Philadelphia Phillies -1.5	2024-08-16 13:23:00	2024-08-16 22:40:00	pinnacle	1
1998238218	tennis	Settled	Loss	Illicit Picks	20	15.88	-126	t	Parlay	Roman Safiullin  (-335)	2024-08-12 19:07:00	2024-08-13 01:27:00	pinnacle	1
2000123625	baseball	Settled	Win	Matt Severance	10	5.41	-185	f	Los Angeles Angels vs Kansas City Royals	Kansas City Royals	2024-08-19 13:22:00	2024-08-20 00:10:00	pinnacle	1
2002618515	baseball	Settled	Win	Wager Analyst	40	57.6	144	f	Kansas City Royals vs Cleveland Guardians	Kansas City Royals	2024-08-27 21:30:00	2024-08-27 22:40:00	pinnacle	1
tA16uzNEnVA_	tennis	Settled	Loss	A11 Bets	2	5.2	260	f	Jack Draper vs Tomas Machac	Tomas Machac & Yes	2024-09-02 21:23:29	2024-09-02 21:23:29	bet365	1
2000762241	baseball	Settled	Win	Matt Severance	10	6.9	-145	f	Cincinnati Reds vs Pittsburgh Pirates	Pittsburgh Pirates	2024-08-21 22:27:00	2024-08-22 22:40:00	pinnacle	1
1993399587	baseball	Settled	Win	Matt Severance	20	11.83	-169	f	Pittsburgh Pirates vs Arizona Diamondbacks	Arizona Diamondbacks	2024-07-26 13:35:00	2024-07-27 01:40:00	pinnacle	1
1992975479	baseball	Settled	Loss	Bruce Marshall	30	29.7	-101	f	St. Louis Cardinals vs Pittsburgh Pirates	St. Louis Cardinals	2024-07-24 14:20:00	2024-07-24 16:35:00	pinnacle	1
2002016588	baseball	Settled	Loss	Zack Cimini	20	21.8	109	f	New York Mets vs San Diego Padres	New York Mets	2024-08-25 16:34:00	2024-08-25 20:10:00	pinnacle	1
2001811447	baseball	Settled	Win	DirtyBubbleBets	40	42	105	f	Kia Tigers vs NC Dinos	NC Dinos	2024-08-25 03:58:00	2024-08-25 09:00:00	pinnacle	1
fc3TQqmGZvlK	baseball	Settled	Loss	Matt Snyder	20	15.384615384615385	-130	f	ATL Braves @ PHI Phillies	Reynaldo Lopez - Under 17.5	2024-08-30 13:23:37	2024-08-30 13:23:37	bet365	1
2004359612	tennis	Settled	Loss	A11 Bets	2	7.36	368	f	Jack Draper vs Tomas Machac	Tomas Machac  -1.5	2024-09-02 16:20:00	2024-09-02 16:43:00	pinnacle	1
NPUx2BdyRN5u	baseball	Settled	Loss	ChaseTheLock	20	22	110	f	STL Cardinals @ NY Yankees	Jazz Chisholm - Over 1.5	2024-08-30 13:23:12	2024-08-30 13:23:12	bet365	1
1998165168	baseball	Settled	Win	Zack Cimini	20	19.61	-102	f	Atlanta Braves vs San Francisco Giants	Atlanta Braves	2024-08-12 14:07:00	2024-08-13 01:45:00	pinnacle	1
1997048509	tennis	Settled	Refunded	Illicit Picks	30	21.28	-141	f	Thanasi Kokkinakis  vs Hubert Hurkacz	Thanasi Kokkinakis   +2.0	2024-08-08 23:13:00	2024-08-10 15:15:00	pinnacle	1
2002168325	tennis	Settled	Loss	TennisWinnersOnly	20	17.86	-112	f	Holger Rune  vs Brandon Nakashima	Over 39.5	2024-08-26 04:11:00	2024-08-26 21:37:00	pinnacle	1
1996914904	tennis	Settled	Loss	The New Kid	20	14.39	-139	f	Daria Kasatkina  vs Amanda Anisimova	Over 20.5	2024-08-08 13:57:00	2024-08-08 19:20:00	pinnacle	1
2001200318	tennis	Settled	Loss	Me	30	21.28	-141	f	David Goffin vs Lorenzo Sonego	David Goffin	2024-08-23 16:03:00	2024-08-23 20:30:00	pinnacle	1
2006272578	baseball	Settled	Win	A11 Bets	10	7.75	-129	f	Doosan Bears vs Kiwoom Heroes	Kiwoom Heroes +1.5	2024-09-09 23:37:00	2024-09-10 05:30:00	pinnacle	1
bet99_2	table tennis	Settled	Win	newms	20	21	105	f	Sylwester, Mista vs Morawiec, Daniel	Sylwester, Mista	2024-09-09 02:36:20	2024-09-09 02:36:20	bet99	1
1994840549	tennis	Settled	Win	The New Kid	20	17.54	-114	f	Anastasia Pavlyuchenkova vs Amanda Anisimova	Amanda Anisimova	2024-07-31 15:00:00	2024-07-31 15:08:00	pinnacle	1
1994285458	tennis	Settled	Loss	TTW	6	20.04	334	f	Donna Vekic  vs Bianca Vanessa Andreescu	Bianca Vanessa Andreescu	2024-07-29 11:11:00	2024-07-29 10:10:00	pinnacle	1
1993715662	tennis	Settled	Win	Sopranos Picks	20	30.4	152	f	Francisco Cerundolo vs Lorenzo Musetti	Francisco Cerundolo	2024-07-27 13:56:00	2024-07-27 18:00:00	pinnacle	1
2001811282	tennis	Settled	Win	OutofLineBets	30	26.32	-114	f	Luciano Emanuel Ambrogi  vs Luka Mikrut	Luka Mikrut   -2.0	2024-08-25 03:57:00	2024-08-25 12:00:00	pinnacle	1
1999307562	baseball	Settled	Win	Matt Severance	20	16.39	-122	f	Seattle Mariners vs Pittsburgh Pirates	Pittsburgh Pirates +1.5	2024-08-17 04:10:00	2024-08-17 17:05:00	pinnacle	1
2002988871	tennis	Settled	Win	TennisWinnersOnly	20	11.24	-178	f	Caroline Wozniacki vs Renata Zarazua	Caroline Wozniacki  -1.5	2024-08-29 11:52:00	2024-08-30 01:37:00	pinnacle	1
2004595524	baseball	Settled	Loss	The Betting Expert	20	22.2	111	f	Minnesota Twins vs Tampa Bay Rays	Over 7.5	2024-09-03 19:04:00	2024-09-03 22:50:00	pinnacle	1
2004106430	tennis	Settled	Loss	TTW	40	35.4	-113	f	Andrey Rublev vs Grigor Dimitrov	Andrey Rublev	2024-09-01 15:50:00	2024-09-01 16:15:00	pinnacle	1
2002597297	baseball	Settled	Win	Dicey	20	21.2	106	f	Houston Astros vs Philadelphia Phillies	Philadelphia Phillies -1.0	2024-08-27 20:02:00	2024-08-27 22:40:00	pinnacle	1
2001939648	baseball	Settled	Loss	Matt Severance	20	15.5	-129	f	Washington Nationals vs Atlanta Braves	Atlanta Braves -1.0	2024-08-25 13:30:00	2024-08-25 16:05:00	pinnacle	1
1994286673	tennis	Settled	Loss	Sopranos Picks	40	42.8	107	f	Stan Wawrinka vs Alexei Popyrin	Stan Wawrinka	2024-07-29 11:17:00	2024-07-30 13:00:00	pinnacle	1
2002762725	tennis	Settled	Win	TTW	20	18.02	-111	f	Miomir Kecmanovic  vs Lorenzo Musetti	Miomir Kecmanovic   +4.5	2024-08-28 14:51:00	2024-08-28 21:16:00	pinnacle	1
1996751116	tennis	Settled	Loss	Me	25	20.66	-121	f	Denis Shapovalov vs Brandon Nakashima	Denis Shapovalov	2024-08-07 18:23:00	2024-08-07 18:45:00	pinnacle	1
1996446686	baseball	Settled	Loss	Matt Snyder	20	23.4	117	f	Chicago White Sox vs Oakland Athletics	Oakland Athletics -1.5	2024-08-06 14:32:00	2024-08-07 01:40:00	pinnacle	1
1996279536	tennis	Settled	Win	Sopranos Picks	40	36.7	-109	f	Moyuka Uchijima vs Kayla Day	Moyuka Uchijima	2024-08-05 16:17:00	2024-08-05 16:44:00	pinnacle	1
2002487024	tennis	Settled	Win	OutofLineBets	30	22.22	-135	f	Timofey Skatov  vs Hubert Hurkacz	Timofey Skatov   +7.0	2024-08-27 14:38:00	2024-08-27 15:08:00	pinnacle	1
1999875518	tennis	Settled	Win	TennisWinnersOnly	40	33.33	-120	f	Iga Swiatek  vs Aryna Sabalenka	Aryna Sabalenka   +3.0	2024-08-18 14:35:00	2024-08-18 15:17:00	pinnacle	1
2004862884	baseball	Settled	Win	A11 Bets	15	12	-125	f	Cleveland Guardians vs Kansas City Royals	Kansas City Royals	2024-09-04 22:35:00	2024-09-04 23:40:00	pinnacle	1
2000123516	baseball	Settled	Win	Zack Cimini	20	21.2	106	f	Baltimore Orioles vs New York Mets	Under 8.5	2024-08-19 13:22:00	2024-08-19 23:20:00	pinnacle	1
2000628131	baseball	Settled	Win	Matt Severance	10	6.8	-147	f	Colorado Rockies vs Washington Nationals	Washington Nationals	2024-08-21 13:49:00	2024-08-21 22:45:00	pinnacle	1
1994424376	tennis	Settled	Win	Sopranos Picks	40	32.49	-124	t	Parlay	Emma Raducanu  (-223)	2024-07-29 22:00:00	2024-07-30 00:57:00	pinnacle	1
2000727149	baseball	Settled	Loss	Matt Severance	5	4.24	-118	f	Minnesota Twins vs San Diego Padres	San Diego Padres	2024-08-21 19:43:00	2024-08-21 22:40:00	pinnacle	1
2002988918	tennis	Settled	Refunded	TennisWinnersOnly	20	18.18	-110	f	Naomi Osaka  vs Karolina Muchova	Over 22	2024-08-29 11:53:00	2024-08-29 23:16:00	pinnacle	1
2003428419	baseball	Settled	Win	Matt Snyder	20	23.2	116	f	St. Louis Cardinals vs New York Yankees	New York Yankees -1.5	2024-08-30 21:33:00	2024-08-30 23:05:00	pinnacle	1
1999962629	baseball	Settled	Loss	Full Card Sweep	20	19.8	-101	f	Los Angeles Dodgers vs St. Louis Cardinals	Over 7.5	2024-08-18 17:57:00	2024-08-18 18:15:00	pinnacle	1
1994286576	tennis	Settled	Win	Sopranos Picks	20	19.61	-102	f	Christopher O'connell vs Harold Mayot	Christopher O'connell	2024-07-29 11:17:00	2024-07-29 15:00:00	pinnacle	1
2000123812	baseball	Settled	Win	Matt Severance	20	12.99	-154	f	Minnesota Twins vs San Diego Padres	San Diego Padres	2024-08-19 13:23:00	2024-08-20 01:40:00	pinnacle	1
2003798817	tennis	Settled	Win	TTW	20	18.02	-111	f	Nuno Borges  vs Jakub Mensik	Over 37.5	2024-08-31 19:22:00	2024-08-31 20:25:00	pinnacle	1
1994285970	tennis	Settled	Loss	The New Kid	20	18.02	-111	f	Emma Navarro  vs Viktoriya Tomova	Viktoriya Tomova   +5.5	2024-07-29 11:14:00	2024-07-29 13:00:00	pinnacle	1
1999520149	tennis	Settled	Win	Me	20	17.7	-113	f	Iga Swiatek  vs Mirra Andreeva	Iga Swiatek	2024-08-17 16:04:00	2024-08-17 15:15:00	pinnacle	1
1992976916	baseball	Settled	Loss	Matt Severance	15	13.27	-113	f	New York Mets vs New York Yankees	New York Yankees -1.0	2024-07-24 14:27:00	2024-07-24 23:05:00	pinnacle	1
2001811579	baseball	Settled	Loss	DirtyBubbleBets	20	16.13	-124	f	LG Twins vs Kiwoom Heroes	Under 4.5	2024-08-25 03:59:00	2024-08-25 05:00:00	pinnacle	1
2001300451	baseball	Settled	Loss	Green Cappers	20	20.6	103	f	New York Mets vs San Diego Padres	Over 8	2024-08-23 20:54:00	2024-08-24 01:40:00	pinnacle	1
1993627559	tennis	Settled	Loss	The New Kid	20	15.38	-130	f	Anna Schmiedlova  vs Katie Boulter	Over 20.5	2024-07-27 09:03:00	2024-07-28 13:10:00	pinnacle	1
1998160311	tennis	Settled	Loss	Tennis Titan	20	28.79	143	t	Parlay	Yoshihito Nishioka  (-168)	2024-08-12 13:43:00	2024-08-12 19:01:00	pinnacle	1
2004742098	baseball	Settled	Win	Matt Severance	20	10	-200	f	Detroit Tigers vs San Diego Padres	San Diego Padres	2024-09-04 12:45:00	2024-09-05 01:40:00	pinnacle	1
2003009245	baseball	Settled	Win	Matt Snyder	20	13.25	-151	f	Atlanta Braves vs Philadelphia Phillies	Philadelphia Phillies	2024-08-29 13:50:00	2024-08-29 22:40:00	pinnacle	1
2004861247	tennis	Settled	Loss	Value Hunter	40	31.79	-126	t	Parlay	Jannik Sinner  (-276)	2024-09-04 22:19:00	2024-09-05 00:50:00	pinnacle	1
2003357806	tennis	Settled	Win	TTW	20	28.4	142	f	Ben Shelton vs Frances Tiafoe	Frances Tiafoe	2024-08-30 18:10:00	2024-08-30 18:49:00	pinnacle	1
2006466371	baseball	Settled	Loss	Sharp Sheet	10	12	120	f	Atlanta Braves vs Washington Nationals	Washington Nationals	2024-09-10 15:14:00	2024-09-10 18:45:00	pinnacle	1
2001987508	baseball	Settled	Loss	Analytics Capper	40	37.74	-106	f	Cincinnati Reds vs Pittsburgh Pirates	Cincinnati Reds	2024-08-25 15:31:00	2024-08-25 17:35:00	pinnacle	1
2003035900	tennis	Settled	Win	TTW	20	18.18	-110	f	David Goffin  vs Adrian Mannarino	Over 36.5	2024-08-29 15:39:00	2024-08-29 18:43:00	pinnacle	1
1993399513	baseball	Settled	Loss	Bruce Marshall	20	22.2	111	f	Texas Rangers vs Toronto Blue Jays	Texas Rangers	2024-07-26 13:34:00	2024-07-26 23:07:00	pinnacle	1
2002846439	tennis	Settled	Loss	OutofLineBets	20	16.95	-118	f	Matteo Berrettini  vs Taylor Fritz	Matteo Berrettini   +3.5	2024-08-28 19:24:00	2024-08-29 00:57:00	pinnacle	1
2004529158	tennis	Settled	Win	TennisWinnersOnly	20	28	140	f	Grigor Dimitrov vs Frances Tiafoe	Frances Tiafoe	2024-09-03 14:08:00	2024-09-04 00:55:00	pinnacle	1
2003156637	football	Settled	Loss	OutofLineBets	20	17.09	-117	f	CS Sacramento vs San Jose State	CS Sacramento +2.0	2024-08-29 23:43:00	2024-08-30 02:00:00	pinnacle	1
1999092764	baseball	Settled	Loss	Matt Snyder	20	22.6	113	f	Chicago White Sox vs Houston Astros	Houston Astros -1.5	2024-08-16 13:25:00	2024-08-17 00:10:00	pinnacle	1
1996675381	tennis	Settled	Loss	The New Kid	20	15.63	-128	f	Elise Mertens  vs Katie Volynets	Over 21	2024-08-07 13:36:00	2024-08-07 15:15:00	pinnacle	1
1995005957	tennis	Settled	Loss	The New Kid	20	18.52	-108	f	Elmer Moller  vs Filip Cristian Jianu	Over 21.5	2024-08-01 03:23:00	2024-08-01 10:15:00	pinnacle	1
2006272582	baseball	Settled	Win	A11 Bets	5	6.7	134	f	Doosan Bears vs Kiwoom Heroes	Kiwoom Heroes	2024-09-09 23:37:00	2024-09-10 05:30:00	pinnacle	1
1993091270	baseball	Settled	Loss	Carribbean Capper	60	46.88	-128	f	San Francisco Giants vs Los Angeles Dodgers	Los Angeles Dodgers -1.0	2024-07-25 00:21:00	2024-07-25 02:10:00	pinnacle	1
2003125821	tennis	Settled	Refunded	OutofLineBets	20	16.26	-123	f	Max Purcell  vs Tommy Paul	Tommy Paul   -7.0	2024-08-29 20:33:00	2024-08-29 21:35:00	pinnacle	1
2005135643	football	Settled	Loss	TTW	10	17.1	171	f	Mark Andrews (Anytime TD)	Yes	2024-09-05 23:56:00	2024-09-06 00:30:00	pinnacle	1
2002457240	tennis	Settled	Win	TennisWinnersOnly	40	30.08	-133	f	Stefanos Tsitsipas  vs Thanasi Kokkinakis	Thanasi Kokkinakis   +4.5	2024-08-27 12:24:00	2024-08-27 15:12:00	pinnacle	1
2006031238	football	Settled	Loss	A11 Bets	10	8.7	-115	f	Las Vegas Raiders vs Los Angeles Chargers	Las Vegas Raiders +3.0	2024-09-08 19:37:00	2024-09-08 20:05:00	pinnacle	1
2003444214	baseball	Settled	Win	Matt Snyder	20	18.69	-107	f	Seattle Mariners vs Los Angeles Angels	Seattle Mariners -1.5	2024-08-30 23:25:00	2024-08-31 01:38:00	pinnacle	1
2005007283	tennis	Settled	Win	Tennis Titan	40	35.4	-113	f	Jessica Pegula  vs Karolina Muchova	Karolina Muchova   +2.5	2024-09-05 14:07:00	2024-09-06 01:13:00	pinnacle	1
1999545318	tennis	Settled	Win	Illicit Picks	20	15.27	-131	f	Alexander Zverev  vs Ben Shelton	Over 22.5	2024-08-17 16:59:00	2024-08-17 21:10:00	pinnacle	1
1996914511	tennis	Settled	Loss	The New Kid	10	23.34	233	t	Parlay	Grigor Dimitrov  (-387)	2024-08-08 13:55:00	2024-08-08 17:09:00	pinnacle	1
2000294030	baseball	Settled	Win	Matt Severance	20	11.7	-171	f	Minnesota Twins vs San Diego Padres	San Diego Padres +1.5	2024-08-20 03:39:00	2024-08-21 01:40:00	pinnacle	1
bet99_1	mma	Settled	Win	TTW	50	33.33	-150	f	Hill, Angela vs Ricci, Tabatha	Ricci, Tabatha	2024-08-25 02:36:20	2024-08-25 02:36:20	bet99	1
1992819301	tennis	Settled	Loss	Sopranos Picks	100	101	101	f	Christopher O'connell  vs Max Purcell	Christopher O'connell   +1.5	2024-07-23 19:29:00	2024-07-24 15:15:00	pinnacle	1
1994419562	baseball	Settled	Loss	Bruce Marshall	20	17.7	-113	f	Pittsburgh Pirates vs Houston Astros	Under 7.5	2024-07-29 21:26:00	2024-07-30 00:10:00	pinnacle	1
2003645661	tennis	Settled	Win	TennisWinnersOnly	40	36.36	-110	f	Matteo Arnaldi vs Jordan Thompson	Jordan Thompson	2024-08-31 13:41:00	2024-08-31 21:15:00	pinnacle	1
1996741457	tennis	Settled	Loss	The New Kid	15	11.19	-134	f	Ashlyn Krueger  vs Elisabetta Cocciaretto	Over 21	2024-08-07 17:46:00	2024-08-07 20:07:00	pinnacle	1
1996083519	baseball	Settled	Loss	Analytics Capper	40.33	26.19	-154	f	Tampa Bay Rays vs Houston Astros	Houston Astros	2024-08-04 17:15:00	2024-08-04 18:10:00	pinnacle	1
2006367159	tennis	Settled	Loss	Sopranos Picks	20	16.53	-121	f	Filip Jeff Planinsek  vs David Jorda Sanchis	David Jorda Sanchis   -2.5	2024-09-10 09:43:00	2024-09-10 11:15:00	pinnacle	1
1993119966	tennis	Settled	Win	Sopranos Picks	20	21	105	f	Thiago Seyboth Wild vs Yannick Hanfmann	Yannick Hanfmann	2024-07-25 05:20:00	2024-07-25 09:15:00	pinnacle	1
2006501140	baseball	Settled	Win	A11 Bets	15	21.15	141	f	Chicago Cubs vs Los Angeles Dodgers	Chicago Cubs	2024-09-10 21:40:00	2024-09-11 02:10:00	pinnacle	1
YvM8X0fPkCRh	football	Settled	Win	MAL	20	18.181818181818183	-110	t	SGP - Florida State @ Georgia Tech	Match Point Spread: Georgia Tech +17.5 Points, Under 60.5 Points	2024-08-24 19:44:32	2024-08-24 19:44:32	bet365	1
1996438825	tennis	Settled	Win	Sopranos Picks	60	53.1	-113	f	Gabriel Diallo  vs Karen Khachanov	Karen Khachanov   -2.5	2024-08-06 13:43:00	2024-08-06 21:00:00	pinnacle	1
1999889081	baseball	Settled	Loss	Analytics Capper	30	28.85	-104	f	Los Angeles Dodgers vs St. Louis Cardinals	St. Louis Cardinals	2024-08-18 15:10:00	2024-08-18 18:15:00	pinnacle	1
1994286467	tennis	Settled	Loss	Sopranos Picks	60	61.2	102	f	Jessica Pegula vs Elina Svitolina	Jessica Pegula	2024-07-29 11:16:00	2024-07-29 19:30:00	pinnacle	1
2003426238	baseball	Settled	Loss	Wager Analyst	10	12.2	122	f	Baltimore Orioles vs Colorado Rockies	Colorado Rockies	2024-08-30 21:20:00	2024-08-31 00:40:00	pinnacle	1
2000688201	tennis	Settled	Win	Illicit Picks	20	18.18	-110	f	Arthur Rinderknech vs David Goffin	David Goffin	2024-08-21 17:23:00	2024-08-21 18:05:00	pinnacle	1
2001982123	baseball	Settled	Loss	Matt Severance	20	16.53	-121	f	Arizona Diamondbacks vs Boston Red Sox	Under 10	2024-08-25 15:19:00	2024-08-25 17:35:00	pinnacle	1
2004055574	tennis	Settled	Loss	TennisWinnersOnly	20	17.63	-114	t	Parlay	Coco Gauff  (-201)	2024-09-01 13:59:00	2024-09-01 20:17:00	pinnacle	1
2001626187	baseball	Settled	Loss	Zack Cimini	20	17.86	-112	f	San Francisco Giants vs Seattle Mariners	Seattle Mariners	2024-08-24 16:46:00	2024-08-24 20:10:00	pinnacle	1
2002458072	baseball	Settled	Win	Matt Severance	40	36.04	-111	f	Los Angeles Angels vs Detroit Tigers	Under 9.5	2024-08-27 12:28:00	2024-08-28 01:25:00	pinnacle	1
2004462317	baseball	Settled	Win	A11 Bets	10	7.52	-133	f	LG Twins vs Kia Tigers	Kia Tigers	2024-09-03 05:51:00	2024-09-03 09:30:00	pinnacle	1
2004576935	baseball	Settled	Loss	Matt Severance	10	9.26	-108	f	Los Angeles Dodgers vs Los Angeles Angels	Los Angeles Angels +2.0	2024-09-03 17:52:00	2024-09-04 01:38:00	pinnacle	1
2004784611	baseball	Settled	Win	The Betting Expert	20	16.26	-123	f	Philadelphia Phillies vs Toronto Blue Jays	Philadelphia Phillies	2024-09-04 15:51:00	2024-09-04 19:07:00	pinnacle	1
2004744289	tennis	Settled	Win	TennisWinnersOnly	40	32.26	-124	f	Jannik Sinner vs Daniil Medvedev	Jannik Sinner  -1.5	2024-09-04 12:55:00	2024-09-05 01:10:00	pinnacle	1
2002380874	baseball	Settled	Win	Wager Analyst	20	15.87	-126	f	Tampa Bay Rays vs Seattle Mariners	Seattle Mariners	2024-08-27 01:00:00	2024-08-27 01:40:00	pinnacle	1
2002762989	tennis	Settled	Loss	TTW	20	15.75	-127	f	Ajla Tomljanovic  vs Elise Mertens	Ajla Tomljanovic   +4.5	2024-08-28 14:52:00	2024-08-28 15:08:00	pinnacle	1
1994951054	baseball	Settled	Win	Matt Severance	20	15.63	-128	f	Los Angeles Dodgers vs San Diego Padres	San Diego Padres	2024-07-31 21:14:00	2024-08-01 00:40:00	pinnacle	1
2006744262	baseball	Settled	Win	A11 Bets	10	9.15	-262	t	Parlay	KT Wiz (-261)	2024-09-12 03:23:00	2024-09-12 12:31:00	pinnacle	1
1996446579	baseball	Settled	Loss	Matt Severance	10	7.19	-139	f	Baltimore Orioles vs Toronto Blue Jays	Baltimore Orioles	2024-08-06 14:31:00	2024-08-06 23:07:00	pinnacle	1
2004847634	tennis	Settled	Win	OutofLineBets	30	21.28	-141	f	Marc Polmans vs Norbert Gombos	Norbert Gombos	2024-09-04 20:17:00	2024-09-05 03:05:00	pinnacle	1
2005562162	football	Settled	Loss	Matt Severance	10	8.77	-114	f	Iowa State vs Iowa	Iowa -2.5	2024-09-07 13:13:00	2024-09-07 19:30:00	pinnacle	1
2005448468	baseball	Settled	Win	A11 Bets	15	12.36	-122	t	Parlay	Kia Tigers (-386)	2024-09-07 03:31:00	2024-09-07 11:44:00	pinnacle	1
1996914839	tennis	Settled	Refunded	The New Kid	20	15.04	-133	f	Beatriz Haddad Maia  vs Katie Boulter	Over 21	2024-08-08 13:57:00	2024-08-08 18:26:00	pinnacle	1
2003009246	baseball	Settled	Win	Matt Snyder	20	13.51	-148	f	Kansas City Royals vs Houston Astros	Houston Astros	2024-08-29 13:50:00	2024-08-30 00:10:00	pinnacle	1
2006150259	football	Settled	Win	Prongs Picks	10	6.67	-150	f	Garrett Wilson (Receptions)	Over 5.5 Receptions	2024-09-09 10:08:00	2024-09-09 20:20:00	pinnacle	1
2002751882	tennis	Settled	Win	TennisWinnersOnly	20	14.52	-138	t	Parlay	Elina Svitolina  (-330)	2024-08-28 14:05:00	2024-08-28 23:35:00	pinnacle	1
2001299806	baseball	Settled	Win	PickzHub	40	25.75	-156	t	Parlay	New York Yankees (-328)	2024-08-23 20:50:00	2024-08-23 23:05:00	pinnacle	1
2004779373	tennis	Settled	Loss	A11 Bets	35	29.17	-121	t	Parlay	Aryna Sabalenka  (-395)	2024-09-04 15:29:00	2024-09-04 20:13:00	pinnacle	1
1992748214	tennis	Settled	Win	The New Kid	37.5	26.79	-140	f	Arthur Rinderknech vs Jeffrey John Wolf	Arthur Rinderknech	2024-07-23 14:26:00	2024-07-23 15:15:00	pinnacle	1
2003036122	baseball	Settled	Loss	The Betting Expert	20	17.54	-114	f	Texas Rangers vs Chicago White Sox	Over 8.5	2024-08-29 15:40:00	2024-08-29 18:10:00	pinnacle	1
1999535692	baseball	Settled	Refunded	Matt Severance	10	8.93	-112	f	Toronto Blue Jays vs Chicago Cubs	Chicago Cubs -1.0	2024-08-17 16:37:00	2024-08-17 18:20:00	pinnacle	1
2004274256	tennis	Settled	Loss	Edge	10	64.5	645	f	Frances Tiafoe  vs Alexei Popyrin	Alexei Popyrin	2024-09-02 01:45:00	2024-09-02 00:00:00	pinnacle	1
2003651403	football	Settled	Win	Mike McClure	20	15.15	-132	f	Miami Florida vs Florida	Miami Florida	2024-08-31 13:53:00	2024-08-31 19:45:00	pinnacle	1
1994055878	baseball	Settled	Loss	Bruce Marshall	20	27.2	136	f	San Diego Padres vs Baltimore Orioles	San Diego Padres	2024-07-28 14:07:00	2024-07-28 17:35:00	pinnacle	1
2004055057	tennis	Settled	Win	TennisWinnersOnly	40	31.5	-127	f	Casper Ruud vs Taylor Fritz	Taylor Fritz  -1.5	2024-09-01 13:58:00	2024-09-01 17:13:00	pinnacle	1
2004055407	tennis	Settled	Win	TennisWinnersOnly	40	32.52	-123	f	Qinwen Zheng  vs Donna Vekic	Donna Vekic   +3.5	2024-09-01 13:59:00	2024-09-02 03:25:00	pinnacle	1
1994137433	baseball	Settled	Loss	Matt Severance	10	7.75	-129	f	Cleveland Guardians vs Philadelphia Phillies	Philadelphia Phillies	2024-07-28 17:37:00	2024-07-28 17:35:00	pinnacle	1
1995672345	tennis	Settled	Loss	The New Kid	15	13.16	-114	f	Qinwen Zheng  vs Donna Vekic	Over 18.5	2024-08-03 14:53:00	2024-08-03 14:45:00	pinnacle	1
2005559750	football	Settled	Win	The Betting Expert	20	16.26	-123	f	Akron vs Rutgers	Over 39.5	2024-09-07 13:06:00	2024-09-07 16:00:00	pinnacle	1
1999228789	tennis	Settled	Loss	Me	20	19.05	-105	f	Jessica Pegula  vs Taylor Townsend	Taylor Townsend   +3.5	2024-08-16 20:40:00	2024-08-16 23:18:00	pinnacle	1
2003653756	football	Settled	Loss	Emory Hunt	20	16.67	-120	f	Kennesaw State vs UTSA	UTSA -23.5	2024-08-31 13:58:00	2024-08-31 19:30:00	pinnacle	1
2004361818	football	Settled	Loss	A11 Bets	15	12.02	-125	t	Parlay	Florida State (-840)	2024-09-02 16:29:00	2024-09-02 23:30:00	pinnacle	1
1992748255	tennis	Settled	Win	The New Kid	37.5	27.57	-136	f	Juan Pablo Ficovich vs Aidan Mayo	Aidan Mayo	2024-07-23 14:26:00	2024-07-23 16:25:00	pinnacle	1
2001939493	baseball	Settled	Win	Dicey	20	18.52	-108	f	Tampa Bay Rays vs Los Angeles Dodgers	Los Angeles Dodgers -1.5	2024-08-25 13:30:00	2024-08-25 20:10:00	pinnacle	1
1999101761	tennis	Settled	Win	TennisWinnersOnly	40	31.75	-126	f	Frances Tiafoe vs Jiri Lehecka	Frances Tiafoe	2024-08-16 14:08:00	2024-08-17 02:30:00	pinnacle	1
1998268716	baseball	Settled	Loss	Analytics Capper	20	19.05	-105	f	Toronto Blue Jays vs Los Angeles Angels	Los Angeles Angels	2024-08-12 22:05:00	2024-08-13 01:38:00	pinnacle	1
2004529816	football	Settled	Win	Alex Selesnick	20	17.86	-112	f	Najee Harris (Rushing Yards)	Over 52.5 Rushing Yards	2024-09-03 14:12:00	2024-09-08 17:00:00	pinnacle	1
1998642205	tennis	Settled	Win	Illicit Picks	20	23.4	117	f	Gael Monfils vs Alexei Popyrin	Gael Monfils	2024-08-14 15:23:00	2024-08-14 18:45:00	pinnacle	1
2004434691	tennis	Settled	Loss	A11 Bets	25	20.49	-122	f	Jannik Sinner vs Tommy Paul	Over 3.5	2024-09-02 23:48:00	2024-09-03 01:12:00	pinnacle	1
2003292036	tennis	Settled	Loss	Green Cappers	10	10.6	106	f	Elena-Gabriela Ruse  vs Paula Badosa	Paula Badosa   -5.5	2024-08-30 14:51:00	2024-08-30 15:09:00	pinnacle	1
1994137537	baseball	Settled	Loss	Matt Severance	20	15.5	-129	f	Chicago Cubs vs Kansas City Royals	Kansas City Royals -1.0	2024-07-28 17:37:00	2024-07-28 18:10:00	pinnacle	1
2000658302	tennis	Settled	Loss	OutofLineBets	20	16.39	-122	f	Thiago Agustin Tirante vs Diego Schwartzman	Thiago Agustin Tirante	2024-08-21 15:49:00	2024-08-21 16:42:00	pinnacle	1
2000409893	tennis	Settled	Loss	Illicit Picks	20	15.87	-126	f	Marton Fucsovics  vs Alex Michelsen	Marton Fucsovics   +2.5	2024-08-20 17:07:00	2024-08-20 23:45:00	pinnacle	1
2000161204	tennis	Settled	Loss	TennisWinnersOnly	40	41.2	103	f	Jannik Sinner  vs Frances Tiafoe	Frances Tiafoe   +3.5	2024-08-19 16:24:00	2024-08-19 22:15:00	pinnacle	1
2002016529	baseball	Settled	Win	Zack Cimini	20	19.61	-102	f	Cincinnati Reds vs Pittsburgh Pirates	Under 8.5	2024-08-25 16:34:00	2024-08-25 17:35:00	pinnacle	1
2006150404	football	Settled	Win	Prongs Picks	10	9.01	-111	f	Deebo Samuel Sr. (Rushing Yards)	Over 13.5 Rushing Yards	2024-09-09 10:09:00	2024-09-09 20:20:00	pinnacle	1
1993627452	tennis	Settled	Refunded	The New Kid	20	14.6	-137	f	Yulia Putintseva  vs Marta Kostyuk	Over 20.5	2024-07-27 09:03:00	2024-07-27 14:00:00	pinnacle	1
2002761487	tennis	Settled	Loss	TTW	30	25	-120	f	Matteo Berrettini  vs Taylor Fritz	Matteo Berrettini   +3.5	2024-08-28 14:47:00	2024-08-29 00:57:00	pinnacle	1
2000903010	baseball	Settled	Win	Matt Snyder	20	24.8	124	f	Cleveland Guardians vs New York Yankees	New York Yankees -1.5	2024-08-22 13:36:00	2024-08-22 17:05:00	pinnacle	1
1998824730	tennis	Settled	Win	TennisWinnersOnly	20	18.18	-110	f	Leylah Annie Fernandez  vs Elena Rybakina	Leylah Annie Fernandez   +4.0	2024-08-15 13:29:00	2024-08-15 15:07:00	pinnacle	1
2002240639	baseball	Settled	Loss	Zack Cimini	20	17.54	-114	f	Houston Astros vs Philadelphia Phillies	Over 7.5	2024-08-26 14:55:00	2024-08-26 22:40:00	pinnacle	1
2003330021	baseball	Settled	Win	Matt Severance	40	35.71	-112	f	Miami Marlins vs San Francisco Giants	San Francisco Giants -1.5	2024-08-30 16:59:00	2024-08-31 02:15:00	pinnacle	1
2003653453	football	Settled	Win	Emory Hunt	20	16.67	-120	f	South Dakota State vs Oklahoma State	Oklahoma State -9.5	2024-08-31 13:57:00	2024-08-31 18:00:00	pinnacle	1
2001291606	tennis	Settled	Loss	TTW	20	18.35	-109	f	Pablo Carreno-Busta vs Alex Michelsen	Pablo Carreno-Busta	2024-08-23 20:14:00	2024-08-23 23:00:00	pinnacle	1
2000009697	tennis	Settled	Win	Tennis Titan	24	20.34	-118	f	Jannik Sinner  vs Alexander Zverev	Over 23	2024-08-18 20:05:00	2024-08-18 21:15:00	pinnacle	1
1996439202	tennis	Settled	Loss	Sopranos Picks	40	29.41	-136	f	Victoria Azarenka  vs Anastasia Pavlyuchenkova	Anastasia Pavlyuchenkova   +4.5	2024-08-06 13:45:00	2024-08-06 19:35:00	pinnacle	1
2002846532	baseball	Settled	Loss	OutofLineBets	20	25	125	f	Toronto Blue Jays vs Boston Red Sox	Toronto Blue Jays	2024-08-28 19:24:00	2024-08-28 23:10:00	pinnacle	1
1993316711	baseball	Settled	Loss	Dicey	40	39.22	-102	f	Miami Marlins vs Milwaukee Brewers	Milwaukee Brewers -1.5	2024-07-26 01:09:00	2024-07-27 00:10:00	pinnacle	1
2003018676	tennis	Settled	Loss	TTW	15	28.95	193	f	Yulia Putintseva vs Xinyu Wang	Xinyu Wang	2024-08-29 14:31:00	2024-08-29 15:09:00	pinnacle	1
2005564043	football	Settled	Loss	Micah Roberts	20	17.54	-114	f	Tennessee vs NC State	NC State +9.5	2024-09-07 13:19:00	2024-09-07 23:30:00	pinnacle	1
1999888433	baseball	Settled	Loss	Matt Severance	20	14.6	-137	f	Miami Marlins vs New York Mets	New York Mets -1.0	2024-08-18 15:09:00	2024-08-18 16:05:00	pinnacle	1
1994286129	tennis	Settled	Win	The New Kid	20	19.61	-102	f	Christopher O'connell vs Harold Mayot	Christopher O'connell	2024-07-29 11:15:00	2024-07-29 15:00:00	pinnacle	1
2004744143	tennis	Settled	Win	TennisWinnersOnly	40	50	125	f	Jack Draper vs Alex De Minaur	Jack Draper	2024-09-04 12:55:00	2024-09-04 18:05:00	pinnacle	1
1993325437	tennis	Settled	Loss	Sopranos Picks	40	36.36	-110	f	Maya Joint vs Maja Chwalinska	Maja Chwalinska	2024-07-26 03:09:00	2024-07-26 13:44:00	pinnacle	1
2000727042	baseball	Settled	Loss	Wager Analyst	20	20.4	102	f	Chicago White Sox vs San Francisco Giants	San Francisco Giants -1.5	2024-08-21 19:42:00	2024-08-21 19:45:00	pinnacle	1
2000511181	baseball	Settled	Win	Zack Cimini	20	12.74	-157	f	Seattle Mariners vs Los Angeles Dodgers	Los Angeles Dodgers	2024-08-21 00:31:00	2024-08-21 02:10:00	pinnacle	1
2000359072	tennis	Settled	Win	Betting4Profit	20	14.29	-140	f	Juncheng Shang vs Mariano Navone	Juncheng Shang  -1.5	2024-08-20 13:49:00	2024-08-20 22:30:00	pinnacle	1
2004629603	tennis	Settled	Win	OutofLineBets	30	25.21	-119	f	Marcelo Tomas Barrios-Vera vs Beibit Zhukayev	Beibit Zhukayev	2024-09-03 23:19:00	2024-09-04 04:30:00	pinnacle	1
2004181042	tennis	Settled	Win	Tennis Titan	40	38.46	-104	f	Frances Tiafoe vs Alexei Popyrin	Frances Tiafoe	2024-09-01 18:43:00	2024-09-01 23:54:00	pinnacle	1
2000915078	tennis	Settled	Win	TennisWinnersOnly	20	18.02	-111	f	Arantxa Rus vs McCartney Kessler	McCartney Kessler	2024-08-22 14:31:00	2024-08-22 16:40:00	pinnacle	1
1999875917	baseball	Settled	Win	Matt Severance	20	15.75	-127	f	Boston Red Sox vs Baltimore Orioles	Baltimore Orioles	2024-08-18 14:36:00	2024-08-18 17:35:00	pinnacle	1
2004780022	tennis	Settled	Loss	A11 Bets	4	9.01	225	t	Parlay	Over 3.5  (-195)	2024-09-04 15:32:00	2024-09-04 20:13:00	pinnacle	1
2002314487	baseball	Settled	Loss	Sharp Sheet	20	18.18	-110	f	Chicago Cubs vs Pittsburgh Pirates	Pittsburgh Pirates	2024-08-26 18:57:00	2024-08-26 22:40:00	pinnacle	1
2002762746	tennis	Settled	Loss	TTW	10	19.3	193	f	Miomir Kecmanovic vs Lorenzo Musetti	Miomir Kecmanovic	2024-08-28 14:51:00	2024-08-28 21:16:00	pinnacle	1
2004337255	baseball	Settled	Win	Matt Severance	20	12.58	-159	f	Chicago White Sox vs Baltimore Orioles	Baltimore Orioles -1.5	2024-09-02 14:02:00	2024-09-02 19:05:00	pinnacle	1
2002350059	baseball	Settled	Win	OutofLineBets	30	33	110	f	San Diego Padres vs St. Louis Cardinals	San Diego Padres	2024-08-26 21:41:00	2024-08-26 23:45:00	pinnacle	1
2003390610	tennis	Settled	Win	Wager Analyst	20	13.16	-152	f	Brandon Nakashima vs Lorenzo Musetti	Brandon Nakashima	2024-08-30 19:18:00	2024-08-30 22:10:00	pinnacle	1
1992977431	tennis	Settled	Loss	TTW	30	22.9	-131	f	Lorenzo Sonego vs Alexandre Muller	Alexandre Muller	2024-07-24 14:29:00	2024-07-24 14:45:00	pinnacle	1
1995698024	mma	Settled	Win	The New Kid	25	18.03	-139	t	Parlay	Umar Nurmagomedov (-383)	2024-08-03 15:58:00	2024-08-03 21:41:00	pinnacle	1
2004571183	tennis	Settled	Loss	A11 Bets	5	25.01	500	t	Parlay	Iga Swiatek  (-361)	2024-09-03 17:28:00	2024-09-03 21:25:00	pinnacle	1
2006195876	tennis	Settled	Loss	OutofLineBets	30	28.04	-107	f	Bernard Tomic vs Micah Braswell	Micah Braswell	2024-09-09 18:08:00	2024-09-09 22:00:00	pinnacle	1
1998717452	tennis	Settled	Win	Analytics Capper	20	18.69	-107	f	Lorenzo Musetti vs Frances Tiafoe	Frances Tiafoe	2024-08-14 21:08:00	2024-08-14 23:15:00	pinnacle	1
1998824635	tennis	Settled	Win	TennisWinnersOnly	20	13.51	-148	f	Casper Ruud vs Felix Auger Aliassime	Felix Auger Aliassime	2024-08-15 13:29:00	2024-08-16 18:05:00	pinnacle	1
2003116008	baseball	Settled	Win	Wager Analyst	40	31.75	-126	f	Baltimore Orioles vs Los Angeles Dodgers	Over 8.5	2024-08-29 19:57:00	2024-08-30 02:10:00	pinnacle	1
2004416221	tennis	Settled	Win	A11 Bets	20	15.2	-132	t	Parlay	Iga Swiatek  (-817)	2024-09-02 21:18:00	2024-09-02 23:16:00	pinnacle	1
1998641900	tennis	Settled	Loss	Illicit Picks	40	34.19	-117	f	Jack Draper vs Jaume Munar	Jack Draper  -1.5	2024-08-14 15:21:00	2024-08-14 17:45:00	pinnacle	1
1995697955	mma	Settled	Win	The New Kid	10	21.83	218	t	Parlay	Umar Nurmagomedov (-383)	2024-08-03 15:58:00	2024-08-03 21:41:00	pinnacle	1
1994189288	tennis	Settled	Loss	The New Kid	20	17.86	-112	f	Jordan Thompson  vs Yoshihito Nishioka	Jordan Thompson	2024-07-28 20:28:00	2024-07-29 02:00:00	pinnacle	1
1998623150	tennis	Settled	Loss	Tennis Titan	20	20.97	104	t	Parlay	Sebastian Korda  (-500)	2024-08-14 13:45:00	2024-08-14 16:14:00	pinnacle	1
1994055951	baseball	Settled	Win	Matt Severance	20	13.7	-146	f	Washington Nationals vs St. Louis Cardinals	St. Louis Cardinals	2024-07-28 14:08:00	2024-07-28 18:15:00	pinnacle	1
1995698120	mma	Settled	Loss	The New Kid	10	11.3	113	f	Loopy Godinez vs Mackenzie Dern	Loopy Godinez	2024-08-03 15:59:00	2024-08-03 19:37:00	pinnacle	1
1996676575	tennis	Settled	Loss	Sopranos Picks	20	19.61	-102	f	Alejandro Davidovich Fokina vs Roman Safiullin	Roman Safiullin	2024-08-07 13:41:00	2024-08-07 17:15:00	pinnacle	1
2004155027	baseball	Settled	Loss	Wager Analyst	30	21.58	-139	f	Seattle Mariners vs Los Angeles Angels	Seattle Mariners -1.0	2024-09-01 17:39:00	2024-09-01 20:07:00	pinnacle	1
1999673248	baseball	Settled	Loss	Analytics Capper	30	28.3	-106	f	Boston Red Sox vs Baltimore Orioles	Baltimore Orioles	2024-08-17 22:50:00	2024-08-18 00:20:00	pinnacle	1
2004558647	basketball	Settled	Loss	A11 Bets	30	22.04	-137	t	Parlay	Las Vegas Aces (-903)	2024-09-03 16:32:00	2024-09-03 21:25:00	pinnacle	1
1994285883	tennis	Settled	Loss	The New Kid	7	22.05	315	f	Jaqueline Cristian  vs Angelique Kerber	Jaqueline Cristian	2024-07-29 11:13:00	2024-07-29 10:10:00	pinnacle	1
2000632477	tennis	Settled	Loss	TennisWinnersOnly	20	15.15	-132	f	Zachary Svajda vs Pavel Kotov	Zachary Svajda	2024-08-21 14:11:00	2024-08-21 18:15:00	pinnacle	1
2001542271	football	Settled	Loss	Jimmie Kaylor	20	18.35	-109	f	SMU vs Nevada	Over 55.5	2024-08-24 13:57:00	2024-08-25 00:00:00	pinnacle	1
2001038137	baseball	Settled	Win	Matt Severance	10	9.71	-103	f	Los Angeles Angels vs Toronto Blue Jays	Toronto Blue Jays -1.0	2024-08-22 22:04:00	2024-08-22 23:07:00	pinnacle	1
2002168413	tennis	Settled	Win	TennisWinnersOnly	20	16	-125	f	Jaqueline Cristian vs Daria Kasatkina	Daria Kasatkina  -1.5	2024-08-26 04:12:00	2024-08-26 15:05:00	pinnacle	1
2004055294	tennis	Settled	Win	TennisWinnersOnly	20	20.4	102	f	Frances Tiafoe vs Alexei Popyrin	Frances Tiafoe	2024-09-01 13:59:00	2024-09-01 23:54:00	pinnacle	1
2006234592	baseball	Settled	Loss	Wager Analyst	20	21.2	106	f	Chicago Cubs vs Los Angeles Dodgers	Los Angeles Dodgers -1.5	2024-09-09 18:03:00	2024-09-09 22:10:00	pinnacle	1
2000285552	baseball	Settled	Loss	Matt Severance	20	19.61	-102	f	Colorado Rockies vs Washington Nationals	Washington Nationals -1.0	2024-08-20 01:57:00	2024-08-20 22:45:00	pinnacle	1
2002251052	tennis	Settled	Loss	TennisMonster	60	35.93	-167	f	Alexander Shevchenko vs Dominik Koepfer	Dominik Koepfer	2024-08-26 15:30:00	2024-08-26 20:38:00	pinnacle	1
2003429338	baseball	Settled	Loss	Matt Snyder	20	23.6	118	f	Los Angeles Dodgers vs Arizona Diamondbacks	Arizona Diamondbacks	2024-08-30 21:39:00	2024-08-31 01:40:00	pinnacle	1
2002763090	tennis	Settled	Win	TTW	20	17.78	-113	t	Parlay	Ekaterina Alexandrova  (-300)	2024-08-28 14:52:00	2024-08-28 19:30:00	pinnacle	1
2004860659	baseball	Settled	Loss	Wager Analyst	40	29.41	-136	f	Houston Astros vs Cincinnati Reds	Houston Astros	2024-09-04 22:13:00	2024-09-04 22:40:00	pinnacle	1
2004360137	tennis	Settled	Loss	A11 Bets	6	11.88	198	f	Jack Draper vs Tomas Machac	Tomas Machac	2024-09-02 16:22:00	2024-09-02 16:43:00	pinnacle	1
2000939086	baseball	Settled	Win	Matt Severance	10	7.35	-136	f	Cleveland Guardians vs New York Yankees	New York Yankees -1.0	2024-08-22 16:04:00	2024-08-22 17:05:00	pinnacle	1
2002458287	baseball	Settled	Win	Matt Severance	40	30.3	-132	f	Toronto Blue Jays vs Boston Red Sox	Boston Red Sox	2024-08-27 12:29:00	2024-08-27 23:10:00	pinnacle	1
2003008749	baseball	Settled	Loss	Matt Snyder	20	13.89	-144	f	Texas Rangers vs Chicago White Sox	Texas Rangers -1.5	2024-08-29 13:48:00	2024-08-29 18:10:00	pinnacle	1
1999515788	baseball	Settled	Win	Matt Severance	10	5.71	-175	f	Osvaldo Bido (Pitching Outs)	Over 14.5 Pitching Out	2024-08-17 15:52:00	2024-08-17 23:07:00	pinnacle	1
2003681608	tennis	Settled	Win	Illicit Picks	30	27.78	-108	f	Matteo Arnaldi vs Jordan Thompson	Jordan Thompson	2024-08-31 14:58:00	2024-08-31 21:15:00	pinnacle	1
1998717583	baseball	Settled	Loss	Analytics Capper	20	16.26	-123	f	Atlanta Braves vs San Francisco Giants	San Francisco Giants	2024-08-14 21:09:00	2024-08-15 01:45:00	pinnacle	1
2005620298	football	Settled	Win	A11 Bets	10	7.52	-133	f	Kansas State vs Tulane	Tulane +10.5	2024-09-07 15:56:00	2024-09-07 16:00:00	pinnacle	1
2002787415	baseball	Settled	Loss	Wager Analyst	30	26.09	-115	f	Chicago Cubs vs Pittsburgh Pirates	Pittsburgh Pirates -1.0	2024-08-28 16:20:00	2024-08-28 16:35:00	pinnacle	1
1993121410	tennis	Settled	Loss	The New Kid	20	13.07	-153	f	Abedallah Shelbayh vs Rudolf Molleker	Rudolf Molleker	2024-07-25 05:56:00	2024-07-25 09:15:00	pinnacle	1
1993120082	tennis	Settled	Win	Sopranos Picks	100	86.21	-116	f	Pedro Martinez vs Facundo Diaz Acosta	Facundo Diaz Acosta	2024-07-25 05:23:00	2024-07-25 13:45:00	pinnacle	1
2004615983	baseball	Settled	Win	Wager Analyst	30	22.56	-133	f	Boston Red Sox vs New York Mets	New York Mets	2024-09-03 21:00:00	2024-09-03 23:10:00	pinnacle	1
1993334572	tennis	Settled	Win	The New Kid	20	15.75	-127	f	Calvin Hemery vs Marvin Moeller	Calvin Hemery	2024-07-26 06:42:00	2024-07-26 13:35:00	pinnacle	1
2006031262	football	Settled	Loss	A11 Bets	5	6.8	136	f	Las Vegas Raiders vs Los Angeles Chargers	Las Vegas Raiders	2024-09-08 19:37:00	2024-09-08 20:05:00	pinnacle	1
2005559356	football	Settled	Loss	The Betting Expert	20	18.52	-108	f	Toronto Argonauts vs Ottawa RedBlacks	Under 51.5	2024-09-07 13:05:00	2024-09-07 17:00:00	pinnacle	1
1994820891	tennis	Settled	Win	Illicit Picks	40	33.06	-121	f	Felix Auger Aliassime  vs Daniil Medvedev	Felix Auger Aliassime   +3.0	2024-07-31 13:25:00	2024-07-31 14:00:00	pinnacle	1
2002253096	tennis	Settled	Win	Illicit Picks	20	12.5	-160	f	Rinky Hijikata vs Alejandro Davidovich Fokina	Over 3.5	2024-08-26 15:36:00	2024-08-26 21:30:00	pinnacle	1
1993709229	tennis	Settled	Win	Sopranos Picks	60	51.28	-117	f	Mariano Navone vs Nuno Borges	Mariano Navone	2024-07-27 13:35:00	2024-07-28 14:00:00	pinnacle	1
2000904664	baseball	Settled	Loss	Matt Severance	20	13.33	-150	f	New York Mets vs San Diego Padres	San Diego Padres	2024-08-22 13:42:00	2024-08-23 01:40:00	pinnacle	1
2006402931	tennis	Settled	Win	Value Hunter	20	16.67	-120	f	Alexei Popyrin vs Ugo Humbert	Ugo Humbert	2024-09-10 11:50:00	2024-09-10 13:15:00	pinnacle	1
2002457514	tennis	Settled	Loss	TennisWinnersOnly	20	17.7	-113	f	Jelena Ostapenko  vs Naomi Osaka	Over 21.5	2024-08-27 12:25:00	2024-08-27 18:11:00	pinnacle	1
1995697627	mma	Settled	Loss	The New Kid	2	16.66	832	t	Parlay	Umar Nurmagomedov (-383)	2024-08-03 15:57:00	2024-08-03 21:41:00	pinnacle	1
2000150755	tennis	Settled	Loss	OutofLineBets	10	9.17	-109	f	Tristan Boyer vs Joris De Loore	Tristan Boyer	2024-08-19 15:47:00	2024-08-19 20:25:00	pinnacle	1
1993334505	tennis	Settled	Refunded	The New Kid	30	20.83	-144	f	Mirra Andreeva  vs Elina Avanesyan	Over 19.5	2024-07-26 06:40:00	2024-07-26 18:12:00	pinnacle	1
2001227229	baseball	Settled	Loss	Micah Roberts	20	17.54	-114	f	Houston Astros vs Baltimore Orioles	Houston Astros	2024-08-23 17:18:00	2024-08-23 23:05:00	pinnacle	1
1999197804	soccer	Settled	Win	Carribbean Capper	60	48.77	-124	t	Parlay	Liverpool (-306)	2024-08-16 18:52:00	2024-08-17 13:29:00	pinnacle	1
2004381114	tennis	Settled	Loss	TTW	20	15.63	-128	f	Caroline Wozniacki vs Beatriz Haddad Maia	Caroline Wozniacki	2024-09-02 18:04:00	2024-09-02 18:48:00	pinnacle	1
1994327288	tennis	Settled	Loss	Illicit Picks	20	15.15	-132	f	Mattia Bellucci vs Mackenzie Mcdonald	Mackenzie Mcdonald	2024-07-29 14:38:00	2024-07-29 18:00:00	pinnacle	1
1997618637	baseball	Settled	Loss	Green Cappers	20	16.95	-118	f	G1 Texas Rangers vs G1 New York Yankees	Over 9	2024-08-10 17:04:00	2024-08-10 17:05:00	pinnacle	1
1997303432	baseball	Settled	Loss	Analytics Capper	20	23.6	118	f	San Diego Padres vs Miami Marlins	Miami Marlins	2024-08-09 21:27:00	2024-08-09 23:10:00	pinnacle	1
1998403274	tennis	Settled	Loss	TTW	30	30.3	101	f	Yoshihito Nishioka vs Miomir Kecmanovic	Miomir Kecmanovic	2024-08-13 15:18:00	2024-08-13 22:05:00	pinnacle	1
1996438408	tennis	Settled	Win	The New Kid	15	17.7	118	f	Jakub Mensik vs Borna Coric	Borna Coric	2024-08-06 13:42:00	2024-08-06 15:30:00	pinnacle	1
1993311165	tennis	Settled	Loss	Sopranos Picks	40	37.74	-106	f	Ben Shelton  vs Juncheng Shang	Over 25.5	2024-07-26 00:32:00	2024-07-26 00:15:00	pinnacle	1
1992793448	baseball	Settled	Win	NRFI King	30	22.56	-133	f	St. Louis Cardinals vs Pittsburgh Pirates	Under 0.5	2024-07-23 17:57:00	2024-07-23 22:40:00	pinnacle	1
2000511163	baseball	Settled	Loss	Zack Cimini	20	21	105	f	Tampa Bay Rays vs Oakland Athletics	Oakland Athletics	2024-08-21 00:31:00	2024-08-21 01:40:00	pinnacle	1
2002462524	baseball	Settled	Loss	Matt Severance	20	12.2	-164	f	Aaron Nola (Pitching Outs)	Under 18.5 Pitching Out	2024-08-27 12:49:00	2024-08-27 22:40:00	pinnacle	1
2004572062	tennis	Settled	Loss	A11 Bets	5	48.66	973	t	Parlay	Iga Swiatek  (-361)	2024-09-03 17:32:00	2024-09-03 21:25:00	pinnacle	1
1994564130	tennis	Settled	Win	Illicit Picks	20	12.42	-161	f	JJ Wolf vs Miomir Kecmanovic	Miomir Kecmanovic	2024-07-30 14:40:00	2024-07-30 15:15:00	pinnacle	1
1996316398	tennis	Settled	Loss	Tennis Titan	60	48.78	-123	f	Alexander Bublik  vs Ben Shelton	Over 22.5	2024-08-05 19:12:00	2024-08-07 17:00:00	pinnacle	1
2004860679	baseball	Settled	Win	Wager Analyst	30	24.19	-124	f	Arizona Diamondbacks vs San Francisco Giants	Arizona Diamondbacks	2024-09-04 22:14:00	2024-09-05 01:45:00	pinnacle	1
2001738757	football	Settled	Win	Emory Hunt	20	17.09	-117	f	Florida A&M vs Norfolk St	Norfolk St +13.5	2024-08-24 21:38:00	2024-08-24 23:30:00	pinnacle	1
1999913380	baseball	Settled	Win	Matt Severance	5	4.46	-112	f	Chicago White Sox vs Houston Astros	Under 4.5	2024-08-18 16:07:00	2024-08-18 18:10:00	pinnacle	1
2003329431	baseball	Settled	Win	Matt Severance	40	32	-125	f	St. Louis Cardinals vs New York Yankees	New York Yankees -1.0	2024-08-30 16:57:00	2024-08-30 23:05:00	pinnacle	1
2005094487	tennis	Settled	Loss	TennisWinnersOnly	20	26.2	131	f	Jessica Pegula vs Karolina Muchova	Karolina Muchova	2024-09-05 19:25:00	2024-09-06 01:13:00	pinnacle	1
2000688129	tennis	Settled	Loss	Illicit Picks	10	12.9	129	f	Borna Coric vs Rinky Hijikata	Borna Coric  -1.5	2024-08-21 17:23:00	2024-08-21 20:00:00	pinnacle	1
1996083471	baseball	Settled	Win	Analytics Capper	18	12.08	-149	f	Chicago White Sox vs Minnesota Twins	Minnesota Twins -1.5	2024-08-04 17:15:00	2024-08-04 18:10:00	pinnacle	1
2001543745	football	Settled	Win	Thomas Casale	20	14.93	-134	f	Florida State vs Georgia Tech	Georgia Tech +12.5	2024-08-24 14:01:00	2024-08-24 16:10:00	pinnacle	1
2004861101	basketball	Settled	Loss	The Betting Expert	20	18.35	-109	f	Los Angeles Sparks vs Indiana Fever	Indiana Fever -10.5	2024-09-04 22:18:00	2024-09-04 23:02:00	pinnacle	1
2002487374	tennis	Settled	Loss	Analytics Capper	5	3.65	-138	t	Parlay	Emma Raducanu  (-310)	2024-08-27 14:40:00	2024-08-27 23:43:00	pinnacle	1
2004530801	football	Settled	Win	Mike McClure	20	17.86	-112	f	Minnesota Vikings vs New York Giants	Minnesota Vikings -1.0	2024-09-03 14:16:00	2024-09-08 17:00:00	pinnacle	1
2003018591	tennis	Settled	Win	TTW	20	19.8	-101	f	Jordan Thompson  vs Hubert Hurkacz	Jordan Thompson   +3.5	2024-08-29 14:31:00	2024-08-29 15:10:00	pinnacle	1
1993258194	baseball	Settled	Win	Matt Severance	20	16	-125	f	San Francisco Giants vs Los Angeles Dodgers	Los Angeles Dodgers	2024-07-25 18:40:00	2024-07-25 20:10:00	pinnacle	1
2002240566	baseball	Settled	Win	Micah Roberts	20	15.38	-130	f	G1 Kansas City Royals vs G1 Cleveland Guardians	G1 Kansas City Royals	2024-08-26 14:55:00	2024-08-26 17:10:00	pinnacle	1
1996283290	tennis	Settled	Loss	TTW	20	18.35	-109	f	Stefan Kozlov vs Ernesto Escobedo	Ernesto Escobedo	2024-08-05 16:36:00	2024-08-05 17:45:00	pinnacle	1
2005717856	football	Settled	Loss	A11 Bets	10	8.06	-124	f	Tulsa vs Arkansas State	Arkansas State -7.0	2024-09-07 20:14:00	2024-09-07 23:00:00	pinnacle	1
1999918221	baseball	Settled	Loss	Zack Cimini	20	17.7	-113	f	Arizona Diamondbacks vs Tampa Bay Rays	Arizona Diamondbacks	2024-08-18 16:18:00	2024-08-18 17:40:00	pinnacle	1
1999243726	baseball	Settled	Loss	Analytics Capper	30	22.56	-133	f	Kansas City Royals vs Cincinnati Reds	Cincinnati Reds	2024-08-16 22:17:00	2024-08-16 23:10:00	pinnacle	1
2004332974	football	Settled	Win	The Betting Expert	20	19.05	-105	f	Toronto Argonauts vs Hamilton Tiger-Cats	Over 52.5	2024-09-02 13:31:00	2024-09-02 18:30:00	pinnacle	1
2004576723	baseball	Settled	Win	Matt Severance	10	6.67	-150	f	Colorado Rockies vs Atlanta Braves	Atlanta Braves -1.5	2024-09-03 17:52:00	2024-09-03 23:20:00	pinnacle	1
1996970578	tennis	Settled	Loss	TTW	20	20.14	100	t	Parlay	Naomi Osaka  (-237)	2024-08-08 17:19:00	2024-08-08 19:58:00	pinnacle	1
1993883609	mma	Settled	Win	The New Kid	10	9.43	-106	f	Paddy Pimblett vs Bobby Green	Paddy Pimblett	2024-07-27 23:03:00	2024-07-28 03:43:00	pinnacle	1
1999888845	baseball	Settled	Loss	Analytics Capper	30	21.9	-137	f	Miami Marlins vs New York Mets	New York Mets -1.0	2024-08-18 15:10:00	2024-08-18 16:05:00	pinnacle	1
2004872445	baseball	Settled	Win	Wager Analyst	20	16.67	-120	f	Pittsburgh Pirates vs Chicago Cubs	Chicago Cubs -2.5	2024-09-04 23:47:00	2024-09-04 23:40:00	pinnacle	1
1992757046	baseball	Settled	Win	Matt Severance	30	28.3	-106	f	Arizona Diamondbacks vs Kansas City Royals	Under 9.5	2024-07-23 15:19:00	2024-07-24 00:10:00	pinnacle	1
2005970420	football	Settled	Loss	A11 Bets	20	17.96	-112	t	Parlay	Chicago Bears (-201)	2024-09-08 16:40:00	2024-09-08 19:53:00	pinnacle	1
2006626334	football	Settled	Win	Picks Office	20	17.39	-115	f	Buffalo Bills vs Miami Dolphins	Under 49	2024-09-11 14:52:00	2024-09-13 00:15:00	pinnacle	1
2001172861	baseball	Settled	Win	Matt Snyder	20	15.27	-131	f	Colorado Rockies vs New York Yankees	New York Yankees -1.5	2024-08-23 14:04:00	2024-08-23 23:05:00	pinnacle	1
1999102228	tennis	Settled	Loss	TennisWinnersOnly	20	18.87	-106	f	Liudmila Samsonova  vs Elina Avanesyan	Elina Avanesyan   +4.0	2024-08-16 14:09:00	2024-08-16 16:21:00	pinnacle	1
1999483576	tennis	Settled	Win	TennisWinnersOnly	40	35.71	-112	f	Jessica Pegula  vs Leylah Annie Fernandez	Leylah Annie Fernandez   +3.5	2024-08-17 14:37:00	2024-08-17 19:00:00	pinnacle	1
1994419529	baseball	Settled	Loss	Bob Konarski	20	20.8	104	f	Minnesota Twins vs New York Mets	Minnesota Twins	2024-07-29 21:26:00	2024-07-29 23:10:00	pinnacle	1
1996279483	tennis	Settled	Loss	Sopranos Picks	40	36.36	-110	f	Yafan Wang  vs Chloe Paquet	Chloe Paquet   +3.5	2024-08-05 16:17:00	2024-08-05 17:43:00	pinnacle	1
2003426199	baseball	Settled	Loss	Wager Analyst	30	25.42	-118	f	Baltimore Orioles vs Colorado Rockies	Colorado Rockies +1.5	2024-08-30 21:20:00	2024-08-31 00:40:00	pinnacle	1
2006466246	tennis	Settled	Win	Sharp Sheet	10	7.94	-126	f	Rebeka Masarova vs Zeynep Sonmez	Zeynep Sonmez	2024-09-10 15:13:00	2024-09-10 16:25:00	pinnacle	1
2003313116	tennis	Settled	Loss	The Betting Expert	20	47.8	239	f	Andrey Rublev vs Jiri Lehecka	Jiri Lehecka	2024-08-30 16:07:00	2024-08-30 19:37:00	pinnacle	1
2003053927	tennis	Settled	Loss	Tennis Titan	26	20.16	-129	f	Thanasi Kokkinakis vs Nuno Borges	Thanasi Kokkinakis	2024-08-29 16:44:00	2024-08-29 17:34:00	pinnacle	1
1996439117	tennis	Settled	Win	Sopranos Picks	40	37.91	-106	t	Parlay	Karolina Pliskova  (-335)	2024-08-06 13:44:00	2024-08-06 22:26:00	pinnacle	1
2001989358	baseball	Settled	Win	OutofLineBets	20	22.8	114	f	Arizona Diamondbacks vs Boston Red Sox	Arizona Diamondbacks	2024-08-25 15:34:00	2024-08-25 17:35:00	pinnacle	1
1992786456	tennis	Settled	Loss	The New Kid	37.5	33.19	-113	f	Nishesh Basavareddy vs Mark Lajal	Mark Lajal	2024-07-23 17:26:00	2024-07-23 19:10:00	pinnacle	1
2003655807	football	Settled	Win	Matt Severance	20	16.26	-123	f	Miami Ohio vs Northwestern	Northwestern -3.0	2024-08-31 14:02:00	2024-08-31 19:30:00	pinnacle	1
cyxeVT0OCTgR	tennis	Settled	Loss	A11 Bets	5	10	200	f	Taylor Fritz v Alexander Zverev	Alexander Zverev	2024-09-03 22:41:10	2024-09-03 22:41:10	bet365	1
1992778889	tennis	Settled	Win	TTW	30	32.1	107	f	Fabian Marozsan vs Thiago Monteiro	Fabian Marozsan	2024-07-23 16:57:00	2024-07-23 17:55:00	pinnacle	1
bet365_7	football	Settled	Loss	A11 Bets	20	23	115	t	Parlay	Parlay	2024-09-09 14:27:00	2024-09-10 00:27:00	bet365	1
2005756852	baseball	Settled	Win	Wager Analyst	30	21.9	-137	f	Colorado Rockies vs Milwaukee Brewers	Milwaukee Brewers -1.5	2024-09-07 23:05:00	2024-09-07 23:10:00	pinnacle	1
2004813632	baseball	Settled	Win	Dicey	20	25.4	127	f	Arizona Diamondbacks vs San Francisco Giants	Arizona Diamondbacks -1.5	2024-09-04 17:41:00	2024-09-05 01:45:00	pinnacle	1
2004595346	basketball	Settled	Loss	The Betting Expert	20	18.35	-109	f	Seattle Storm vs Connecticut Sun	Connecticut Sun -3.5	2024-09-03 19:04:00	2024-09-03 23:02:00	pinnacle	1
1999483880	tennis	Settled	Win	TennisWinnersOnly	20	16.01	-125	t	Parlay	Jannik Sinner  (-320)	2024-08-17 14:37:00	2024-08-17 20:44:00	pinnacle	1
1996539721	baseball	Settled	Win	Analytics Capper	20	23.2	116	f	Milwaukee Brewers vs Atlanta Braves	Milwaukee Brewers	2024-08-06 21:09:00	2024-08-06 23:20:00	pinnacle	1
1998641993	tennis	Settled	Win	Illicit Picks	20	21.07	105	t	Parlay	Jordan Thompson  (-172)	2024-08-14 15:21:00	2024-08-15 00:44:00	pinnacle	1
2004529406	tennis	Settled	Loss	TennisWinnersOnly	40	30.77	-130	f	Paula Badosa vs Emma Navarro	Paula Badosa	2024-09-03 14:09:00	2024-09-03 16:14:00	pinnacle	1
1992966564	tennis	Settled	Win	The New Kid	60	49.18	-122	f	Elina Avanesyan  vs Jaqueline Cristian	Over 20.5	2024-07-24 13:34:00	2024-07-25 14:20:00	pinnacle	1
2001992105	baseball	Settled	Loss	Matt Severance	20	14.18	-141	f	Chicago Cubs vs Miami Marlins	Chicago Cubs -1.0	2024-08-25 15:41:00	2024-08-25 17:40:00	pinnacle	1
1995729527	tennis	Settled	Loss	TTW	5	8.35	167	f	Lorenzo Musetti vs Felix Auger Aliassime	Felix Auger Aliassime	2024-08-03 17:08:00	2024-08-03 17:15:00	pinnacle	1
2002168382	tennis	Settled	Win	TennisWinnersOnly	40	31.75	-126	f	Diane Parry  vs Xiyu Wang	Diane Parry   +3.5	2024-08-26 04:12:00	2024-08-26 15:13:00	pinnacle	1
1996438086	tennis	Settled	Refunded	The New Kid	25	18.52	-135	f	Cameron Norrie vs Marcos Giron	Cameron Norrie	2024-08-06 13:41:00	2024-08-07 12:00:00	pinnacle	1
2004396064	baseball	Settled	Loss	Wager Analyst	40	41.2	103	f	Pittsburgh Pirates vs Chicago Cubs	Chicago Cubs -1.0	2024-09-02 19:09:00	2024-09-02 23:40:00	pinnacle	1
2004625427	basketball	Settled	Win	A11 Bets	15	17.13	-222	t	Parlay	Las Vegas Aces (-1080)	2024-09-03 22:36:00	2024-09-04 04:47:00	pinnacle	1
2002988655	tennis	Settled	Loss	TennisWinnersOnly	40	28.57	-140	f	Arthur Fils vs Gabriel Diallo	Arthur Fils  -1.5	2024-08-29 11:51:00	2024-08-29 19:34:00	pinnacle	1
2006231144	football	Settled	Loss	Picks Office	15	25.63	170	t	Parlay	Under 46 (-160)	2024-09-09 21:22:00	2024-09-10 03:08:00	pinnacle	1
2006446737	baseball	Settled	Win	The Betting Expert	10	8.55	-117	f	Miami Marlins vs Pittsburgh Pirates	Over 8.5	2024-09-10 14:16:00	2024-09-10 18:40:00	pinnacle	1
2004416322	tennis	Settled	Loss	A11 Bets	3	9.39	313	f	Alex De Minaur vs Jordan Thompson	Jordan Thompson	2024-09-02 21:19:00	2024-09-02 21:57:00	pinnacle	1
1998749097	baseball	Settled	Win	Matt Severance	20	14.81	-135	f	Boston Red Sox vs Baltimore Orioles	Baltimore Orioles	2024-08-15 01:17:00	2024-08-15 22:35:00	pinnacle	1
1997908546	baseball	Settled	Win	Analytics Capper	30	28.57	-105	f	Baltimore Orioles vs Tampa Bay Rays	Tampa Bay Rays	2024-08-11 14:19:00	2024-08-11 17:40:00	pinnacle	1
2005094463	tennis	Settled	Win	TennisWinnersOnly	40	34.48	-116	f	Jessica Pegula  vs Karolina Muchova	Karolina Muchova   +2.5	2024-09-05 19:25:00	2024-09-06 01:13:00	pinnacle	1
2004529646	football	Settled	Loss	Alex Selesnick	20	18.02	-111	f	Xavier Worthy (Receiving Yards)	Under 44.5 Receiving Yards	2024-09-03 14:11:00	2024-09-06 00:20:00	pinnacle	1
1998431436	tennis	Settled	Win	Illicit Picks	30	22.39	-134	f	Roman Safiullin  vs Terence Atmane	Terence Atmane   +3.5	2024-08-13 17:06:00	2024-08-13 22:20:00	pinnacle	1
1994071224	tennis	Settled	Win	The New Kid	20	14.08	-142	f	Magdalena Frech  vs Viktoriya Tomova	Over 20.5	2024-07-28 14:55:00	2024-07-28 16:00:00	pinnacle	1
2005283357	football	Settled	Win	Picks Office	20	19.23	-104	f	Green Bay Packers vs Philadelphia Eagles	Philadelphia Eagles -2.5	2024-09-06 15:19:00	2024-09-07 00:20:00	pinnacle	1
2002202620	tennis	Settled	Win	OutofLineBets	40	32	-125	f	Aleksandar Kovacevic vs Frances Tiafoe	Over 3.5	2024-08-26 11:21:00	2024-08-26 23:11:00	pinnacle	1
1996921546	tennis	Settled	Win	Sopranos Picks	60	57.69	-104	f	Daria Kasatkina vs Amanda Anisimova	Amanda Anisimova	2024-08-08 14:32:00	2024-08-08 19:20:00	pinnacle	1
1999307510	baseball	Settled	Win	Matt Severance	20	15.38	-130	f	Miami Marlins vs New York Mets	New York Mets -1.0	2024-08-17 04:10:00	2024-08-17 20:10:00	pinnacle	1
1999532868	baseball	Settled	Win	Matt Severance	10	8.2	-122	f	Toronto Blue Jays vs Chicago Cubs	Under 8.5	2024-08-17 16:31:00	2024-08-17 18:20:00	pinnacle	1
1998260971	tennis	Settled	Loss	Me	20	34.8	174	f	Jessica Pegula vs Amanda Anisimova	Amanda Anisimova	2024-08-12 20:53:00	2024-08-12 22:08:00	pinnacle	1
2003359915	tennis	Settled	Win	Tennis Titan	31	20.53	-151	f	Brandon Nakashima vs Lorenzo Musetti	Brandon Nakashima	2024-08-30 18:15:00	2024-08-30 22:10:00	pinnacle	1
1996792411	baseball	Settled	Win	Analytics Capper	60	39.47	-152	f	San Francisco Giants vs Washington Nationals	San Francisco Giants	2024-08-07 21:42:00	2024-08-07 22:45:00	pinnacle	1
2006501170	baseball	Settled	Win	A11 Bets	15	15.74	104	t	Parlay	Cleveland Guardians (-214)	2024-09-10 17:40:00	2024-09-10 22:21:00	pinnacle	1
1999234387	baseball	Settled	Loss	Zack Cimini	20	19.23	-104	f	Cleveland Guardians vs Milwaukee Brewers	Cleveland Guardians	2024-08-16 21:10:00	2024-08-17 00:10:00	pinnacle	1
1996675574	tennis	Settled	Loss	The New Kid	20	21.95	109	t	Parlay	Felix Auger-Aliassime  (-290)	2024-08-07 13:37:00	2024-08-07 16:43:00	pinnacle	1
1993824372	baseball	Settled	Loss	The New Kid	15	17.4	116	f	Texas Rangers vs Toronto Blue Jays	Texas Rangers	2024-07-27 18:42:00	2024-07-27 19:07:00	pinnacle	1
2005564268	football	Settled	Loss	Thomas Casale	20	18.02	-111	f	Houston vs Oklahoma	Oklahoma -27.5	2024-09-07 13:20:00	2024-09-07 23:45:00	pinnacle	1
bet365_10	baseball	Settled	Loss	A11 Bets	10	8	-120	f	Kiwoom Heroes @ LG Twins	LG Twins -1.5	2024-09-11 06:27:00	2024-09-11 09:27:00	bet365	1
1997908550	baseball	Settled	Win	Analytics Capper	20	14.29	-140	f	Texas Rangers vs New York Yankees	New York Yankees	2024-08-11 14:19:00	2024-08-11 17:35:00	pinnacle	1
1999889265	baseball	Settled	Loss	Analytics Capper	30	19.23	-156	f	San Diego Padres vs Colorado Rockies	San Diego Padres -1.0	2024-08-18 15:10:00	2024-08-18 19:10:00	pinnacle	1
2002781913	tennis	Settled	Win	Green Cappers	10	11	110	f	Tatjana Maria  vs Coco Gauff	Coco Gauff   -7.5	2024-08-28 16:04:00	2024-08-28 23:16:00	pinnacle	1
bet365_13	table tennis	Settled	Loss	newms	20	19	-110	f	Fabis vs Jakub	Adrian Fabis ML	2024-09-11 12:00:00	2024-09-11 20:00:00	bet365	1
1994056136	baseball	Settled	Win	Matt Severance	10	6.85	-146	f	Washington Nationals vs St. Louis Cardinals	St. Louis Cardinals	2024-07-28 14:08:00	2024-07-28 18:15:00	pinnacle	1
2000923357	baseball	Settled	Win	Green Cappers	20	19.42	-103	f	Cleveland Guardians vs New York Yankees	Under 8	2024-08-22 15:09:00	2024-08-22 17:05:00	pinnacle	1
1992975610	baseball	Settled	Win	Matt Snyder	30	28.3	-106	f	San Diego Padres vs Washington Nationals	San Diego Padres	2024-07-24 14:21:00	2024-07-24 22:45:00	pinnacle	1
1998403199	tennis	Settled	Win	TTW	20	18.02	-111	f	Zhizhen Zhang  vs Giovanni Mpetshi Perricard	Zhizhen Zhang	2024-08-13 15:17:00	2024-08-13 15:30:00	pinnacle	1
2000161074	baseball	Settled	Win	Micah Roberts	20	17.09	-117	f	Arizona Diamondbacks vs Miami Marlins	Over 8	2024-08-19 16:24:00	2024-08-19 22:40:00	pinnacle	1
1998403875	baseball	Settled	Win	Matt Snyder	20	20.4	102	f	Pittsburgh Pirates vs San Diego Padres	San Diego Padres -1.5	2024-08-13 15:20:00	2024-08-14 01:40:00	pinnacle	1
1992732268	tennis	Settled	Win	The New Kid	30	23.26	-129	f	Luca Van Assche vs Fabio Fognini	Fabio Fognini	2024-07-23 12:42:00	2024-07-23 15:00:00	pinnacle	1
2000212276	baseball	Settled	Win	Green Cappers	20	18.35	-109	f	Arizona Diamondbacks vs Miami Marlins	Under 0.5	2024-08-19 19:04:00	2024-08-19 22:40:00	pinnacle	1
2003329908	baseball	Settled	Win	Jeff Hochman	20	17.39	-115	f	Shohei Ohtani (Total Bases)	Over 1.5 Bases	2024-08-30 16:59:00	2024-08-31 01:40:00	pinnacle	1
dqxQRQdZzV6o	tennis	Settled	Loss	A11 Bets	2	10	500	t	Parlay	Parlay	2024-09-02 21:23:28	2024-09-02 21:23:28	bet365	1
1999483033	tennis	Settled	Win	TennisWinnersOnly	20	20.4	102	f	Alexander Zverev  vs Ben Shelton	Ben Shelton   +3.0	2024-08-17 14:35:00	2024-08-17 21:10:00	pinnacle	1
2005971518	football	Settled	Loss	A11 Bets	10	87.11	871	t	Parlay	Chicago Bears (-201)	2024-09-08 16:43:00	2024-09-08 19:53:00	pinnacle	1
2004595425	basketball	Settled	Loss	The Betting Expert	20	18.52	-108	f	Washington Mystics vs Dallas Wings	Dallas Wings -5.5	2024-09-03 19:04:00	2024-09-04 00:02:00	pinnacle	1
2004255940	tennis	Settled	Loss	Illicit Picks	30	29.7	-101	f	Jack Draper  vs Tomas Machac	Tomas Machac   +4.5	2024-09-01 23:09:00	2024-09-02 16:43:00	pinnacle	1
2002168459	tennis	Settled	Loss	TennisWinnersOnly	20	16.81	-119	f	Qinwen Zheng  vs Amanda Anisimova	Amanda Anisimova   +3.0	2024-08-26 04:13:00	2024-08-26 15:10:00	pinnacle	1
2005449341	baseball	Settled	Win	DirtyBubbleBets	15	9.93	-151	f	Hanwha Eagles vs LG Twins	LG Twins -0.5	2024-09-07 03:37:00	2024-09-07 05:00:00	pinnacle	1
2000688544	tennis	Settled	Win	Illicit Picks	20	17.53	-115	t	Parlay	Hamad Medjedovic  (-190)	2024-08-21 17:24:00	2024-08-21 22:07:00	pinnacle	1
2005386981	tennis	Settled	Loss	TennisWinnersOnly	40	33.9	-118	f	Taylor Fritz  vs Frances Tiafoe	Frances Tiafoe   +4.5	2024-09-06 21:10:00	2024-09-06 23:44:00	pinnacle	1
1995730161	baseball	Settled	Loss	Matt Severance	20	16.53	-121	f	New York Mets vs Los Angeles Angels	New York Mets	2024-08-03 17:09:00	2024-08-04 01:38:00	pinnacle	1
1996446512	baseball	Settled	Refunded	Matt Severance	10	7.94	-126	f	Los Angeles Angels vs New York Yankees	New York Yankees -1.5	2024-08-06 14:30:00	2024-08-06 23:05:00	pinnacle	1
1993334538	tennis	Settled	Refunded	The New Kid	20	17.7	-113	f	Aziz Dougaz  vs Gabi Adrian Boitan	Over 22	2024-07-26 06:41:00	2024-07-26 12:15:00	pinnacle	1
1998617490	baseball	Settled	Win	Matt Severance	20	12.12	-165	f	Washington Nationals vs Baltimore Orioles	Baltimore Orioles	2024-08-14 13:13:00	2024-08-14 22:35:00	pinnacle	1
2002145018	tennis	Settled	Win	Betting4Profit	20	18.35	-109	f	Reilly Opelka  vs Lorenzo Musetti	Reilly Opelka   +3.5	2024-08-25 23:37:00	2024-08-26 19:17:00	pinnacle	1
1996720457	baseball	Settled	Loss	The New Kid	25	22.73	-110	f	G1 Arizona Diamondbacks vs G1 Cleveland Guardians	G1 Cleveland Guardians	2024-08-07 16:41:00	2024-08-07 17:10:00	pinnacle	1
2005561549	football	Settled	Win	Jimmie Kaylor	30	27.27	-110	f	Texas vs Michigan	Texas -6.5	2024-09-07 13:11:00	2024-09-07 16:00:00	pinnacle	1
2004626179	baseball	Settled	Loss	Matt Severance	20	18.69	-107	f	St. Louis Cardinals vs Milwaukee Brewers	Milwaukee Brewers -1.0	2024-09-03 22:43:00	2024-09-03 23:40:00	pinnacle	1
2000674660	baseball	Settled	Loss	Micah Roberts	20	19.42	-103	f	Milwaukee Brewers vs St. Louis Cardinals	Milwaukee Brewers	2024-08-21 16:40:00	2024-08-21 23:45:00	pinnacle	1
2002751447	tennis	Settled	Loss	TennisWinnersOnly	40	37.74	-106	f	Andrey Rublev  vs Arthur Rinderknech	Arthur Rinderknech   +6.0	2024-08-28 14:03:00	2024-08-28 17:47:00	pinnacle	1
1997704398	baseball	Settled	Loss	Analytics Capper	20	16.13	-124	f	Pittsburgh Pirates vs Los Angeles Dodgers	Pittsburgh Pirates  0	2024-08-10 21:37:00	2024-08-11 01:10:00	pinnacle	1
2005094382	tennis	Settled	Win	TennisWinnersOnly	20	13.89	-144	f	Emma Navarro vs Aryna Sabalenka	Aryna Sabalenka  -1.5	2024-09-05 19:24:00	2024-09-05 23:16:00	pinnacle	1
2001540545	baseball	Settled	Win	Matt Severance	10	8.06	-124	f	Los Angeles Angels vs Toronto Blue Jays	Toronto Blue Jays -1.0	2024-08-24 13:54:00	2024-08-24 19:07:00	pinnacle	1
1998616956	tennis	Settled	Loss	Tennis Titan	26	20	-130	f	Tomas Martin Etcheverry vs Matteo Arnaldi	Matteo Arnaldi	2024-08-14 13:10:00	2024-08-14 20:45:00	pinnacle	1
2001540729	baseball	Settled	Loss	Matt Severance	20	15.04	-133	f	Tampa Bay Rays vs Los Angeles Dodgers	Los Angeles Dodgers -1.0	2024-08-24 13:55:00	2024-08-25 01:10:00	pinnacle	1
2006436854	tennis	Settled	Loss	TTW	15	15.97	106	t	Parlay	Caroline Dolehide  (-261)	2024-09-10 13:39:00	2024-09-10 20:55:00	pinnacle	1
-PvwmcQNR5lq	basketball	Settled	Win	WNBA Source	20	18.181818181818183	-110	f	ATL Dream @ SEA Storm	ATL Dream +5.5	2024-08-28 23:44:14	2024-08-28 23:44:14	bet365	1
2004881217	tennis	Settled	Win	A11 Bets	40	29.22	-137	t	Parlay	Aryna Sabalenka  (-421)	2024-09-05 00:50:00	2024-09-06 00:50:00	pinnacle	1
2005717943	tennis	Settled	Win	A11 Bets	10	7.52	-133	t	Parlay	Aryna Sabalenka  (-330)	2024-09-07 20:15:00	2024-09-08 02:28:00	pinnacle	1
2004529099	tennis	Settled	Win	TennisWinnersOnly	20	16.13	-124	f	Taylor Fritz  vs Alexander Zverev	Over 41	2024-09-03 14:07:00	2024-09-03 17:54:00	pinnacle	1
2006031341	football	Settled	Win	A11 Bets	5	6.05	121	f	Dallas Cowboys vs Cleveland Browns	Dallas Cowboys	2024-09-08 19:38:00	2024-09-08 20:25:00	pinnacle	1
2000628421	baseball	Settled	Win	Matt Severance	20	12.05	-166	f	Los Angeles Angels vs Kansas City Royals	Kansas City Royals	2024-08-21 13:51:00	2024-08-22 00:10:00	pinnacle	1
1992793377	baseball	Settled	Loss	NRFI King	30	20.69	-145	f	Chicago White Sox vs Texas Rangers	Under 0.5	2024-07-23 17:57:00	2024-07-24 00:05:00	pinnacle	1
1997303474	baseball	Settled	Win	Analytics Capper	20	13.89	-144	f	Cincinnati Reds vs Milwaukee Brewers	Milwaukee Brewers	2024-08-09 21:28:00	2024-08-10 00:10:00	pinnacle	1
1996325017	tennis	Settled	Loss	Sopranos Picks	20	22	110	f	Greetje Minnen  vs Destanee Aiava	Destanee Aiava   +3.5	2024-08-05 19:59:00	2024-08-05 19:40:00	pinnacle	1
1993325352	tennis	Settled	Win	Sopranos Picks	20	29.8	149	f	Andrey Rublev vs Francisco Cerundolo	Francisco Cerundolo	2024-07-26 03:07:00	2024-07-26 15:15:00	pinnacle	1
2004332621	tennis	Settled	Win	TennisWinnersOnly	20	12.9	-155	f	Alex De Minaur vs Jordan Thompson	Over 3.5	2024-09-02 13:27:00	2024-09-02 21:57:00	pinnacle	1
2004332764	baseball	Settled	Win	The Betting Expert	20	20.4	102	f	Chicago White Sox vs Baltimore Orioles	Over 8.5	2024-09-02 13:29:00	2024-09-02 19:05:00	pinnacle	1
2000401355	baseball	Settled	Loss	Micah Roberts	20	17.09	-117	f	Arizona Diamondbacks vs Miami Marlins	Over 7.5	2024-08-20 16:34:00	2024-08-20 22:40:00	pinnacle	1
2002251219	tennis	Settled	Loss	TennisMonster	25	39.95	159	t	Parlay	Tomas Martin Etcheverry  (-160)	2024-08-26 15:31:00	2024-08-26 19:47:00	pinnacle	1
2003647158	tennis	Settled	Loss	TennisWinnersOnly	20	15.75	-127	f	Yulia Putintseva  vs Jasmine Paolini	Over 21.5	2024-08-31 13:44:00	2024-08-31 15:18:00	pinnacle	1
1996437979	tennis	Settled	Loss	The New Kid	15	16.35	109	f	Alejandro Davidovich Fokina vs Roman Safiullin	Roman Safiullin	2024-08-06 13:41:00	2024-08-07 17:15:00	pinnacle	1
2000628026	baseball	Settled	Win	Alex Selesnick	20	15.15	-132	f	Matt Waldron (Pitching Outs)	Under 17.5 Pitching Out	2024-08-21 13:49:00	2024-08-21 22:40:00	pinnacle	1
1998836195	baseball	Settled	Win	Matt Severance	5	4.72	-106	f	Seattle Mariners vs Detroit Tigers	Under 8	2024-08-15 14:39:00	2024-08-15 17:10:00	pinnacle	1
2000949862	tennis	Settled	Win	OutofLineBets	20	17.09	-117	f	Jerome Kym  vs Quentin Halys	Jerome Kym   +2.5	2024-08-22 16:37:00	2024-08-22 19:46:00	pinnacle	1
2001173021	baseball	Settled	Win	Micah Roberts	20	23	115	f	Arizona Diamondbacks vs Boston Red Sox	Arizona Diamondbacks	2024-08-23 14:05:00	2024-08-23 23:10:00	pinnacle	1
2002751580	tennis	Settled	Loss	TennisWinnersOnly	20	16.81	-119	f	Casper Ruud vs Gael Monfils	Gael Monfils  +1.5	2024-08-28 14:04:00	2024-08-28 22:39:00	pinnacle	1
2000632578	tennis	Settled	Loss	TennisWinnersOnly	20	23.6	118	f	Anastasia Potapova vs Clara Tauson	Clara Tauson	2024-08-21 14:12:00	2024-08-21 17:36:00	pinnacle	1
2003873761	tennis	Settled	Loss	OutofLineBets	20	16.67	-120	f	Mark Lajal  vs Yasutaka Uchiyama	Mark Lajal   -2.0	2024-09-01 00:45:00	2024-09-01 03:30:00	pinnacle	1
2000949970	tennis	Settled	Win	OutofLineBets	20	18.18	-110	f	Nishesh Basavareddy  vs Hamad Medjedovic	Over 22.5	2024-08-22 16:37:00	2024-08-22 18:46:00	pinnacle	1
1994563975	tennis	Settled	Loss	Illicit Picks	20	23.2	116	f	Max Purcell vs Thanasi Kokkinakis	Max Purcell	2024-07-30 14:40:00	2024-07-30 17:00:00	pinnacle	1
1998624260	baseball	Settled	Loss	Me	15	26.13	174	t	Parlay	New York Yankees (-223)	2024-08-14 13:51:00	2024-08-14 19:46:00	pinnacle	1
1999918420	baseball	Settled	Win	Zack Cimini	20	19.8	-101	f	Minnesota Twins vs Texas Rangers	Texas Rangers	2024-08-18 16:18:00	2024-08-18 18:35:00	pinnacle	1
2003054001	tennis	Settled	Loss	Illicit Picks	20	14.49	-138	f	Alex De Minaur vs Otto Virtanen	Over 3.5	2024-08-29 16:44:00	2024-08-29 18:58:00	pinnacle	1
1996325000	tennis	Settled	Loss	Sopranos Picks	20	49.4	247	f	Greetje Minnen  vs Destanee Aiava	Destanee Aiava	2024-08-05 19:59:00	2024-08-05 19:40:00	pinnacle	1
2004862896	baseball	Settled	Win	A11 Bets	15	10.71	-140	f	Seattle Mariners vs Oakland Athletics	Seattle Mariners	2024-09-04 22:35:00	2024-09-05 01:40:00	pinnacle	1
aaWlxe7H1b-H	tennis	Settled	Loss	A11 Bets	2	10	500	t	SGP - Alex De Minaur vs Jordan Thompson	Jordan Thompson will win the Match, Over 36.5 Games	2024-09-03 22:41:05	2024-09-03 22:41:05	bet365	1
2002458171	baseball	Settled	Loss	Matt Snyder	20	14.29	-140	f	New York Yankees vs Washington Nationals	New York Yankees -1.5	2024-08-27 12:28:00	2024-08-27 22:45:00	pinnacle	1
2001226594	baseball	Settled	Win	Zack Cimini	20	16.67	-120	f	Los Angeles Angels vs Toronto Blue Jays	Over 8.5	2024-08-23 17:17:00	2024-08-23 23:07:00	pinnacle	1
2005643544	football	Settled	Loss	Picks Office	20	18.18	-110	f	California vs Auburn	Over 54	2024-09-07 16:53:00	2024-09-07 19:30:00	pinnacle	1
2002457953	baseball	Settled	Win	Matt Snyder	20	26.4	132	f	Kansas City Royals vs Cleveland Guardians	Kansas City Royals	2024-08-27 12:27:00	2024-08-27 22:40:00	pinnacle	1
2001982309	baseball	Settled	Win	Matt Severance	20	17.86	-112	f	Los Angeles Angels vs Toronto Blue Jays	Toronto Blue Jays -1.0	2024-08-25 15:20:00	2024-08-25 17:37:00	pinnacle	1
2000817394	tennis	Settled	Win	OutofLineBets	20	17.54	-114	f	Petr Nesterov  vs Ivan Gakhov	Petr Nesterov   +2.5	2024-08-22 02:57:00	2024-08-22 11:00:00	pinnacle	1
2sKeY2k-T8p3	basketball	Settled	Loss	Zay	10	90	900	t	SGP - IND Fever @ ATL Dream	NaLyssa Smith: 10+ Points, NaLyssa Smith: 10+ Rebounds	2024-08-27 02:15:37	2024-08-27 02:15:37	pinnacle	1
2005121386	baseball	Settled	Loss	Wager Analyst	40	38.1	-105	f	Detroit Tigers vs San Diego Padres	San Diego Padres -1.0	2024-09-05 21:59:00	2024-09-06 00:40:00	pinnacle	1
1997262880	tennis	Settled	Win	TTW	20	18.35	-109	f	Nishesh Basavareddy vs Paul Jubb	Nishesh Basavareddy	2024-08-09 18:40:00	2024-08-10 00:00:00	pinnacle	1
2006232749	football	Settled	Loss	A11 Bets	5	9.25	185	f	New York Jets vs San Francisco 49ers	New York Jets	2024-09-09 21:40:00	2024-09-10 00:15:00	pinnacle	1
2003014127	tennis	Settled	Win	Green Cappers	10	11.1	111	f	Clara Tauson  vs Diana Shnaider	Clara Tauson   +4.5	2024-08-29 14:11:00	2024-08-29 15:08:00	pinnacle	1
1992955337	tennis	Settled	Win	Sopranos Picks	60	44.44	-135	f	Magda Linette  vs Viktoriya Tomova	Magda Linette	2024-07-24 12:39:00	2024-07-24 10:45:00	pinnacle	1
2004992373	baseball	Settled	Loss	Matt Snyder	20	27.6	138	f	Detroit Tigers vs San Diego Padres	San Diego Padres -1.5	2024-09-05 13:14:00	2024-09-06 00:40:00	pinnacle	1
2006350256	tennis	Settled	Loss	The Betting Expert	10	9.43	-106	f	Kimberly Birrell vs Ena Shibahara	Kimberly Birrell	2024-09-10 08:46:00	2024-09-10 15:12:00	pinnacle	1
2006234625	baseball	Settled	Win	Wager Analyst	20	19.61	-102	f	Baltimore Orioles vs Boston Red Sox	Over 9.5	2024-09-09 22:04:00	2024-09-09 23:10:00	pinnacle	1
2004529427	tennis	Settled	Loss	The Betting Expert	20	15.38	-130	f	Paula Badosa vs Emma Navarro	Paula Badosa	2024-09-03 14:09:00	2024-09-03 16:14:00	pinnacle	1
2002988571	tennis	Settled	Loss	TennisWinnersOnly	40	31.25	-128	f	Thanasi Kokkinakis vs Nuno Borges	Thanasi Kokkinakis	2024-08-29 11:50:00	2024-08-29 17:34:00	pinnacle	1
2000004597	baseball	Settled	Loss	Matt Severance	10	7.63	-131	f	San Francisco Giants vs Oakland Athletics	Oakland Athletics +1.5	2024-08-18 19:47:00	2024-08-18 20:07:00	pinnacle	1
2004054319	baseball	Settled	Win	Alex Selesnick	30	28.3	-106	f	Ronel Blanco (Pitching Outs)	Under 17.5 Pitching Out	2024-09-01 13:55:00	2024-09-01 18:10:00	pinnacle	1
1997704399	mma	Settled	Win	Analytics Capper	20	14.08	-142	f	Serghei Spivac vs Marcin Tybura	Serghei Spivac	2024-08-10 21:37:00	2024-08-11 01:51:00	pinnacle	1
1995378577	tennis	Settled	Loss	TTW	20	18.02	-111	f	Emma Raducanu vs Paula Badosa	Emma Raducanu	2024-08-02 16:29:00	2024-08-02 18:02:00	pinnacle	1
1998847844	baseball	Settled	Loss	Analytics Capper	20	15.75	-127	f	Oakland Athletics vs New York Mets	New York Mets -1.0	2024-08-15 15:30:00	2024-08-15 17:10:00	pinnacle	1
1998860234	tennis	Settled	Win	Illicit Picks	40	40.84	102	t	Parlay	Holger Rune  (-253)	2024-08-15 16:19:00	2024-08-15 22:20:00	pinnacle	1
2004847598	baseball	Settled	Loss	The Betting Expert	20	19.05	-105	f	Washington Nationals vs Miami Marlins	Over 8.5	2024-09-04 20:17:00	2024-09-04 22:40:00	pinnacle	1
2001543915	football	Settled	Loss	Thomas Casale	20	20.8	104	f	SMU vs Nevada	Over 56.5	2024-08-24 14:01:00	2024-08-25 00:00:00	pinnacle	1
2000365985	tennis	Settled	Win	TennisWinnersOnly	20	15.63	-128	f	Greetje Minnen vs Jaqueline Cristian	Greetje Minnen	2024-08-20 14:26:00	2024-08-20 18:18:00	pinnacle	1
1994685818	baseball	Settled	Win	ValueLockSports	20	18.52	-108	f	Toronto Blue Jays vs Baltimore Orioles	Baltimore Orioles -1.5	2024-07-30 21:55:00	2024-07-30 22:35:00	pinnacle	1
2003329677	baseball	Settled	Win	Matt Severance	50	34.72	-144	f	Pittsburgh Pirates vs Cleveland Guardians	Cleveland Guardians	2024-08-30 16:58:00	2024-08-30 23:10:00	pinnacle	1
2006165583	football	Settled	Win	Erik Kuselias	20	15.5	-129	f	Brock Purdy (Completions)	Under 21.5 Pass Completions	2024-09-09 11:44:00	2024-09-09 20:20:00	pinnacle	1
1998231334	tennis	Settled	Loss	Tennis Titan	60	47.55	-127	t	Parlay	Alexandre Muller   (-284)	2024-08-12 18:40:00	2024-08-12 20:30:00	pinnacle	1
1993325294	tennis	Settled	Loss	Sopranos Picks	100	86.96	-115	f	Hugo Gaston vs Facundo Diaz Acosta	Facundo Diaz Acosta	2024-07-26 03:06:00	2024-07-26 12:45:00	pinnacle	1
2002487221	tennis	Settled	Loss	Analytics Capper	5	3.38	-148	f	Mariano Navone vs Daniel Altmaier	Daniel Altmaier	2024-08-27 14:39:00	2024-08-27 15:09:00	pinnacle	1
2003426317	baseball	Settled	Win	Wager Analyst	20	17.86	-112	f	Miami Marlins vs San Francisco Giants	San Francisco Giants -1.5	2024-08-30 21:20:00	2024-08-31 02:15:00	pinnacle	1
1994685859	baseball	Settled	Loss	ValueLockSports	40	37.38	-107	f	Kansas City Royals vs Chicago White Sox	Kansas City Royals -1.5	2024-07-30 21:55:00	2024-07-31 00:10:00	pinnacle	1
2004625596	tennis	Settled	Win	A11 Bets	10	8.47	-118	f	Qinwen Zheng vs Aryna Sabalenka	Aryna Sabalenka  -1.5	2024-09-03 22:37:00	2024-09-03 23:17:00	pinnacle	1
1993325386	tennis	Settled	Loss	Sopranos Picks	20	19.42	-103	f	Erler A / Mies A vs Glasspool L / Middelkoop M	Glasspool L / Middelkoop M	2024-07-26 03:08:00	2024-07-26 13:30:00	pinnacle	1
2003329773	baseball	Settled	Refunded	Matt Severance	40	34.19	-117	f	Kansas City Royals vs Houston Astros	Houston Astros -1.0	2024-08-30 16:58:00	2024-08-31 00:10:00	pinnacle	1
1999000937	baseball	Settled	Loss	Matt Severance	20	16.81	-119	f	Washington Nationals vs Philadelphia Phillies	Philadelphia Phillies -1.5	2024-08-16 03:43:00	2024-08-16 22:40:00	pinnacle	1
1993824538	baseball	Settled	Loss	The New Kid	5	37.93	758	t	Parlay	Atlanta Braves (+110)	2024-07-27 18:42:00	2024-07-27 20:10:00	pinnacle	1
2002762808	tennis	Settled	Win	TTW	20	22.8	114	f	Peyton Stearns vs Daria Kasatkina	Peyton Stearns	2024-08-28 14:51:00	2024-08-28 23:43:00	pinnacle	1
1998442178	baseball	Settled	Loss	Matt Severance	20	24.88	124	t	Parlay	San Diego Padres (-244)	2024-08-13 17:42:00	2024-08-14 01:17:00	pinnacle	1
1993952044	tennis	Settled	Win	The New Kid	20	14.93	-134	f	Christopher Eubanks vs Benjamin Hassan	Benjamin Hassan	2024-07-28 06:40:00	2024-07-28 12:00:00	pinnacle	1
2000658368	tennis	Settled	Win	OutofLineBets	20	16.39	-122	f	Kamil Majchrzak vs Daniel Elahi Galan	Kamil Majchrzak	2024-08-21 15:49:00	2024-08-21 23:00:00	pinnacle	1
1993027819	baseball	Settled	Loss	NRFI King	30	25.42	-118	f	Houston Astros vs Oakland Athletics	Under 0.5	2024-07-24 17:57:00	2024-07-24 19:37:00	pinnacle	1
bet365_11	baseball	Settled	Loss	A11 Bets	5	40	1000	t	Parlay	Parlay	2024-09-11 06:27:00	2024-09-11 09:27:00	bet365	1
1997908551	baseball	Settled	Loss	Analytics Capper	30	26.79	-112	f	Cleveland Guardians vs Minnesota Twins	Minnesota Twins	2024-08-11 14:19:00	2024-08-11 18:10:00	pinnacle	1
2004744406	tennis	Settled	Loss	TennisWinnersOnly	20	15.13	-133	t	Parlay	Karolina Muchova  (-280)	2024-09-04 12:55:00	2024-09-05 00:50:00	pinnacle	1
1999580730	baseball	Settled	Refunded	Micah Roberts	20	20.2	101	f	Arizona Diamondbacks vs Tampa Bay Rays	Under 7	2024-08-17 18:18:00	2024-08-17 20:10:00	pinnacle	1
1996082552	tennis	Settled	Win	Tennis Titan	50	48.25	-286	t	Parlay	Emil Ruusuvuori  (-220)	2024-08-04 17:12:00	2024-08-04 20:00:00	pinnacle	1
2002618546	baseball	Settled	Loss	Wager Analyst	20	13.33	-150	f	Tampa Bay Rays vs Seattle Mariners	Seattle Mariners	2024-08-27 21:30:00	2024-08-28 01:40:00	pinnacle	1
1994406188	tennis	Settled	Loss	Tennis Titan	10	17.8	178	f	Reilly Opelka vs James Duckworth	James Duckworth	2024-07-29 19:57:00	2024-07-30 04:00:00	pinnacle	1
1996083206	baseball	Settled	Win	Me	40	28.57	-140	f	Kansas City Royals vs Detroit Tigers	Detroit Tigers +1.5	2024-08-04 17:14:00	2024-08-04 17:40:00	pinnacle	1
2005564547	football	Settled	Loss	Thomas Casale	20	17.09	-117	f	Boise State vs Oregon	Oregon -18.0	2024-09-07 13:21:00	2024-09-08 02:00:00	pinnacle	1
1999123380	baseball	Settled	Win	Matt Severance	10	8.4	-119	f	Kansas City Royals vs Cincinnati Reds	Under 10	2024-08-16 15:35:00	2024-08-16 23:10:00	pinnacle	1
1995698075	mma	Settled	Win	The New Kid	10	7.41	-135	f	Deiveson Figueiredo vs Marlon Vera	Deiveson Figueiredo	2024-08-03 15:59:00	2024-08-03 20:34:00	pinnacle	1
1994580511	tennis	Settled	Win	Tennis Titan	30	28.8	-105	t	Parlay	Juncheng Shang  (-360)	2024-07-30 15:34:00	2024-07-30 17:10:00	pinnacle	1
1995697816	mma	Settled	Loss	The New Kid	5	30.43	608	t	Parlay	Umar Nurmagomedov (-383)	2024-08-03 15:58:00	2024-08-03 21:41:00	pinnacle	1
2002988382	tennis	Settled	Win	OutofLineBets	30	26.55	-113	f	Jerome Kym vs Yannick Hanfmann	Jerome Kym	2024-08-29 11:50:00	2024-08-29 13:30:00	pinnacle	1
2005387020	tennis	Settled	Loss	TennisWinnersOnly	20	48.8	244	f	Taylor Fritz vs Frances Tiafoe	Frances Tiafoe	2024-09-06 21:10:00	2024-09-06 23:44:00	pinnacle	1
1994056101	baseball	Settled	Loss	Bruce Marshall	20	24.6	123	f	Oakland Athletics vs Los Angeles Angels	Oakland Athletics	2024-07-28 14:08:00	2024-07-28 20:07:00	pinnacle	1
1997984873	baseball	Settled	Loss	ValueLockSports	20	17.54	-114	f	San Diego Padres vs Miami Marlins	San Diego Padres -1.5	2024-08-11 17:22:00	2024-08-11 17:40:00	pinnacle	1
2000285578	baseball	Settled	Loss	Matt Severance	20	17.7	-113	f	Cleveland Guardians vs New York Yankees	New York Yankees -1.0	2024-08-20 01:57:00	2024-08-20 23:05:00	pinnacle	1
2003654145	football	Settled	Loss	Emory Hunt	20	18.02	-111	f	Western Kentucky vs Alabama	Western Kentucky +32.5	2024-08-31 13:59:00	2024-08-31 23:07:00	pinnacle	1
1993201535	tennis	Settled	Win	Sopranos Picks	40	52.8	132	f	Pedro Martinez  vs Facundo Diaz Acosta	Facundo Diaz Acosta	2024-07-25 15:07:00	2024-07-25 13:40:00	pinnacle	1
2004780462	baseball	Settled	Loss	Matt Severance	10	5.75	-174	f	Chicago White Sox vs Baltimore Orioles	Baltimore Orioles -1.5	2024-09-04 15:33:00	2024-09-04 22:35:00	pinnacle	1
2001300361	baseball	Settled	Win	Green Cappers	20	18.18	-110	f	Los Angeles Angels vs Toronto Blue Jays	Over 8.5	2024-08-23 20:53:00	2024-08-23 23:07:00	pinnacle	1
2005283213	football	Settled	Loss	Picks Office	20	17.54	-114	f	BYU vs SMU	Over 56	2024-09-06 15:19:00	2024-09-06 23:00:00	pinnacle	1
2001541772	football	Settled	Win	Matt Severance	20	21.6	108	f	Montana State vs New Mexico	New Mexico +11.5	2024-08-24 13:56:00	2024-08-24 20:00:00	pinnacle	1
2005053953	baseball	Settled	Win	A11 Bets	20	14.08	-142	f	Minnesota Twins vs Tampa Bay Rays	Minnesota Twins	2024-09-05 16:43:00	2024-09-05 17:10:00	pinnacle	1
1996921394	tennis	Settled	Loss	Sopranos Picks	60	53.49	-113	t	Parlay	Emma Navarro  (-280)	2024-08-08 14:31:00	2024-08-08 17:24:00	pinnacle	1
2001811619	baseball	Settled	Win	DirtyBubbleBets	15	13.64	-110	f	KT Wiz vs SSG Landers	Under 5	2024-08-25 03:59:00	2024-08-25 09:00:00	pinnacle	1
1997908547	baseball	Settled	Loss	Analytics Capper	20	13.33	-150	f	Los Angeles Angels vs Washington Nationals	Washington Nationals	2024-08-11 14:19:00	2024-08-11 15:35:00	pinnacle	1
2003061841	tennis	Settled	Loss	Illicit Picks	20	15.15	-132	f	Thanasi Kokkinakis vs Nuno Borges	Thanasi Kokkinakis	2024-08-29 17:10:00	2024-08-29 17:34:00	pinnacle	1
1996921479	tennis	Settled	Loss	Sopranos Picks	40	30.3	-132	f	Lesia Tsurenko  vs Anna Kalinskaya	Lesia Tsurenko   +5.5	2024-08-08 14:32:00	2024-08-08 15:08:00	pinnacle	1
2005561840	football	Settled	Loss	Thomas Casale	20	18.87	-106	f	California vs Auburn	Auburn -10.5	2024-09-07 13:12:00	2024-09-07 19:30:00	pinnacle	1
1998626728	baseball	Settled	Loss	Matt Severance	10	9.35	-107	f	St. Louis Cardinals vs Cincinnati Reds	Under 9.5	2024-08-14 14:06:00	2024-08-14 22:40:00	pinnacle	1
1994419705	baseball	Settled	Win	Matt Severance	20	12.58	-159	f	Washington Nationals vs Arizona Diamondbacks	Arizona Diamondbacks	2024-07-29 21:27:00	2024-07-30 01:40:00	pinnacle	1
1996539720	baseball	Settled	Refunded	Analytics Capper	20	18.18	-110	f	Arizona Diamondbacks vs Cleveland Guardians	Cleveland Guardians	2024-08-06 21:09:00	2024-08-07 01:00:00	pinnacle	1
2000914984	tennis	Settled	Win	TennisWinnersOnly	20	17.86	-112	f	Maximilian Marterer vs Mitchell Krueger	Mitchell Krueger	2024-08-22 14:31:00	2024-08-22 16:43:00	pinnacle	1
2004332657	tennis	Settled	Win	TennisWinnersOnly	20	12.35	-162	f	Karolina Muchova vs Jasmine Paolini	Karolina Muchova	2024-09-02 13:28:00	2024-09-02 15:09:00	pinnacle	1
1999243686	baseball	Settled	Loss	Analytics Capper	30	22.22	-135	f	Washington Nationals vs Philadelphia Phillies	Philadelphia Phillies -1.5	2024-08-16 22:17:00	2024-08-16 22:40:00	pinnacle	1
bet365_6	football	Settled	Loss	Prongs Picks	10	8.69	-115	f	NY Jets vs SF 49ers	Breece Hall Over 96.5 combined yards	2024-09-09 17:36:20	2024-09-09 19:36:20	bet365	1
1999545190	tennis	Settled	Win	Illicit Picks	20	25.2	126	f	Hubert Hurkacz vs Frances Tiafoe	Frances Tiafoe	2024-08-17 16:59:00	2024-08-17 23:45:00	pinnacle	1
2006501736	baseball	Settled	Win	A11 Bets	10	101.21	1012	t	Parlay	Chicago Cubs (+141)	2024-09-10 21:45:00	2024-09-11 04:50:00	pinnacle	1
2000258603	baseball	Settled	Win	Wager Analyst	20	16.95	-118	f	Los Angeles Angels vs Kansas City Royals	Kansas City Royals -1.5	2024-08-19 23:01:00	2024-08-20 00:10:00	pinnacle	1
2001173057	baseball	Settled	Loss	Matt Severance	10	7.75	-129	f	Texas Rangers vs Cleveland Guardians	Cleveland Guardians	2024-08-23 14:05:00	2024-08-23 23:10:00	pinnacle	1
1992976573	baseball	Settled	Win	Matt Snyder	30	27.03	-111	f	Chicago White Sox vs Texas Rangers	Texas Rangers -1.5	2024-07-24 14:25:00	2024-07-25 00:05:00	pinnacle	1
1997907688	baseball	Settled	Loss	PickzHub	20	22.47	112	t	Parlay	Los Angeles Dodgers (-259)	2024-08-11 14:17:00	2024-08-11 20:24:00	pinnacle	1
2001300422	baseball	Settled	Loss	Green Cappers	20	21	105	f	Philadelphia Phillies vs Kansas City Royals	Under 9	2024-08-23 20:54:00	2024-08-24 00:10:00	pinnacle	1
2002168287	tennis	Settled	Win	TennisWinnersOnly	40	25.97	-154	f	Juncheng Shang vs Alexander Bublik	Juncheng Shang	2024-08-26 04:10:00	2024-08-26 15:12:00	pinnacle	1
nYq5a4jZm5Fw	baseball	Settled	Loss	MAL	20	23	115	f	TB Rays @ SEA Mariners	Luis Castillo (SEA Mariners) - Under 1.5	2024-08-28 17:47:22	2024-08-28 20:10:00	bet365	1
2001045600	baseball	Settled	Loss	Green Cappers	20	19.05	-105	f	Philadelphia Phillies vs Atlanta Braves	Over 7.5	2024-08-22 23:03:00	2024-08-22 23:15:00	pinnacle	1
2006365315	tennis	Settled	Win	OutofLineBets	20	17.86	-112	f	Govind Nanda vs Kaylan Bigun	Kaylan Bigun	2024-09-10 09:37:00	2024-09-10 14:00:00	pinnacle	1
1998622638	baseball	Settled	Loss	Matt Snyder	20	17.86	-112	f	Atlanta Braves vs San Francisco Giants	San Francisco Giants	2024-08-14 13:41:00	2024-08-15 01:45:00	pinnacle	1
1998847761	tennis	Settled	Win	Analytics Capper	20	12.82	-156	f	Anna Kalinskaya vs Paula Badosa	Paula Badosa	2024-08-15 15:30:00	2024-08-15 19:14:00	pinnacle	1
2002627045	baseball	Settled	Refunded	Sharp Sheet	20	24.4	122	f	Texas Rangers vs Chicago White Sox	Chicago White Sox	2024-08-27 22:35:00	2024-08-28 00:10:00	pinnacle	1
2006624031	tennis	Settled	Win	Sopranos Picks	40	42.4	106	f	Veronika Kudermetova vs Maria Camila Osorio Serrano	Maria Camila Osorio Serrano	2024-09-11 14:39:00	2024-09-11 21:00:00	pinnacle	1
2006675449	football	Settled	Loss	Picks Office	20	17.09	-117	f	Seattle Seahawks vs New England Patriots	Under 38	2024-09-11 18:38:00	2024-09-15 17:00:00	pinnacle	1
2006678474	football	Settled	Win	Mike McClure	20	19.42	-103	f	Buffalo Bills vs Miami Dolphins	Buffalo Bills +2.5	2024-09-11 18:55:00	2024-09-13 00:15:00	pinnacle	1
2006678671	baseball	Settled	Win	Matt Severance	30	22.39	-134	f	Colorado Rockies vs Detroit Tigers	Detroit Tigers -1.0	2024-09-11 18:57:00	2024-09-11 22:40:00	pinnacle	1
bet365_9	baseball	Settled	Loss	A11 Bets	10	6.66	-150	f	Lotte Giants @ SSG Landers	SSG Landers ML	2024-09-11 06:27:00	2024-09-11 09:27:00	bet365	1
bet365_1	baseball	Settled	Loss	Matt Snyder	20	15.38	-130	f	WAS Nationals vs ATL Braves	Chris Sale	2024-08-23 17:36:20	2024-08-23 19:36:20	bet365	1
2006640025	tennis	Settled	Loss	OutofLineBets	20	17.39	-115	f	James Trotter  vs Denis Kudla	James Trotter   +2.0	2024-09-11 15:44:00	2024-09-11 20:00:00	pinnacle	1
2006640073	tennis	Settled	Win	OutofLineBets	15	15.9	106	f	Adrian Mannarino  vs Nikoloz Basilashvili	Nikoloz Basilashvili   +4.5	2024-09-11 15:45:00	2024-09-11 17:15:00	pinnacle	1
2006688553	football	Settled	Loss	Picks Office	20	18.87	-106	f	New York Giants vs Washington Commanders	Over 44.5	2024-09-11 20:01:00	2024-09-15 17:00:00	pinnacle	1
2006702169	baseball	Settled	Loss	Wager Analyst	20	17.86	-112	f	Oakland Athletics vs Houston Astros	Houston Astros -1.5	2024-09-11 21:55:00	2024-09-12 00:10:00	pinnacle	1
2006702213	baseball	Settled	Loss	A11 Bets	10	8.93	-112	f	Oakland Athletics vs Houston Astros	Houston Astros -1.5	2024-09-11 21:56:00	2024-09-12 00:10:00	pinnacle	1
2006702229	baseball	Settled	Win	A11 Bets	10	7.46	-134	f	Milwaukee Brewers vs San Francisco Giants	San Francisco Giants	2024-09-11 21:56:00	2024-09-12 01:45:00	pinnacle	1
2006702277	basketball	Settled	Win	A11 Bets	20	17.18	-117	t	Parlay	Seattle Storm (-805)	2024-09-11 21:56:00	2024-09-12 05:10:00	pinnacle	1
2006702129	baseball	Settled	Win	Wager Analyst	20	14.93	-134	f	Baltimore Orioles vs Boston Red Sox	Boston Red Sox	2024-09-11 21:55:00	2024-09-11 23:10:00	pinnacle	1
bet365_12	baseball	Settled	Win	Wager Analyst	40	29.63	-135	f	Chicago Cubs vs Dodgers	Cubs Over 3.5 Runs	2024-09-11 12:00:00	2024-09-11 20:00:00	bet365	1
2006746051	tennis	Settled	Win	Sopranos Picks	20	15.87	-126	f	Francesca Jones vs Petra Marcinko	Francesca Jones	2024-09-12 03:41:00	2024-09-12 14:09:00	pinnacle	1
2006749788	baseball	Settled	Loss	A11 Bets	5	23.36	467	t	Parlay	Samsung Lions (-167)	2024-09-12 04:40:00	2024-09-12 12:30:00	pinnacle	1
2006824806	football	Settled	Loss	Picks Office	20	19.42	-103	f	Central Florida vs TCU	Central Florida -2.5	2024-09-12 14:09:00	2024-09-14 23:30:00	pinnacle	1
2006825207	football	Settled	Win	Picks Office	20	19.8	-101	f	Hawaii vs Sam Houston State	Sam Houston State -4.5	2024-09-12 14:12:00	2024-09-14 23:00:00	pinnacle	1
2006825262	football	Settled	Loss	Picks Office	20	19.42	-103	f	Arizona State vs Texas State	Texas State	2024-09-12 14:12:00	2024-09-12 23:30:00	pinnacle	1
2006850423	baseball	Settled	Loss	A11 Bets	10	9.07	-111	t	Parlay	Houston Astros (-262)	2024-09-12 16:04:00	2024-09-12 19:46:00	pinnacle	1
2006850490	baseball	Settled	Loss	A11 Bets	10	12.8	128	f	Cincinnati Reds vs St. Louis Cardinals	Cincinnati Reds	2024-09-12 16:04:00	2024-09-12 17:15:00	pinnacle	1
2006851541	football	Settled	Loss	Picks Office	20	18.52	-108	f	Rice vs Houston	Rice +4.5	2024-09-12 16:07:00	2024-09-15 00:00:00	pinnacle	1
2006862656	baseball	Settled	Loss	Wager Analyst	20	14.49	-138	f	Colorado Rockies vs Detroit Tigers	Detroit Tigers -1.5	2024-09-12 16:49:00	2024-09-12 17:10:00	pinnacle	1
2006862669	baseball	Settled	Loss	Matt Severance	20	14.49	-138	f	Colorado Rockies vs Detroit Tigers	Detroit Tigers -1.5	2024-09-12 16:49:00	2024-09-12 17:10:00	pinnacle	1
2006862681	baseball	Settled	Loss	Matt Snyder	20	14.49	-138	f	Colorado Rockies vs Detroit Tigers	Detroit Tigers -1.5	2024-09-12 16:49:00	2024-09-12 17:10:00	pinnacle	1
2006839737	tennis	Settled	Refunded	OutofLineBets	15	12.61	-119	f	Alexei Popyrin  vs Tomas Machac	Tomas Machac   +3.0	2024-09-12 15:20:00	2024-09-12 17:30:00	pinnacle	1
bet365_14	tennis	Settled	Win	Sopranos Picks	20	20	100	\N	Koolhof/Van De Zandschulp v Matos/Melo	Koolhof/Van De Zandschulp	\N	2024-09-12 13:43:00	Pinnacle	1
2006877433	tennis	Settled	Win	Sopranos Picks	20	17.7	-113	f	Titouan Droguet  vs Hugo Grenier	Over 22.5	2024-09-12 17:55:00	2024-09-12 18:30:00	pinnacle	1
2006882131	tennis	Settled	Win	Sopranos Picks	40	23.26	-172	f	Lucrezia Stefanini vs Marie Bouzkova	Marie Bouzkova  -1.5	2024-09-12 18:18:00	2024-09-12 19:08:00	pinnacle	1
2006882257	tennis	Settled	Loss	Sopranos Picks	20	20.05	100	t	Parlay	Caroline Garcia  (-174)	2024-09-12 18:18:00	2024-09-13 03:21:00	pinnacle	1
2006882311	tennis	Settled	Win	Sopranos Picks	20	18.52	-108	f	Ashlyn Krueger  vs Magdalena Frech	Over 21.5 (Games)	2024-09-12 18:19:00	2024-09-13 03:33:00	pinnacle	1
2006900450	tennis	Settled	Loss	Sopranos Picks	20	22.4	112	f	Patrick Maloney  vs Kaylan Bigun	Over 22.5 (Games)	2024-09-12 20:00:00	2024-09-12 20:15:00	pinnacle	1
2006901559	football	Settled	Win	A11 Bets	30	27.27	-110	t	Parlay	Under 55	2024-09-12 20:08:00	2024-09-13 03:11:00	pinnacle	1
2006902070	baseball	Settled	Win	Wager Analyst	20	15.27	-131	f	Milwaukee Brewers vs San Francisco Giants	Milwaukee Brewers	2024-09-12 20:12:00	2024-09-13 01:45:00	pinnacle	1
2006902780	football	Settled	Loss	Wager Analyst	20	14.81	-135	f	Arizona State vs Texas State	Texas State	2024-09-12 20:18:00	2024-09-12 23:30:00	pinnacle	1
2006903273	football	Settled	Win	Picks Office	20	19.61	-102	f	BYU vs Wyoming	BYU -11.5	2024-09-12 20:23:00	2024-09-15 01:00:00	pinnacle	1
2006918574	baseball	Settled	Win	Sharp Sheet	10	12.9	129	f	Texas Rangers vs Seattle Mariners	Texas Rangers	2024-09-12 23:09:00	2024-09-13 01:40:00	pinnacle	1
2006933174	tennis	Settled	Loss	Sopranos Picks	20	25.2	126	f	Jelena Ostapenko vs Marina Stakusic	Jelena Ostapenko	2024-09-13 01:03:00	2024-09-12 23:30:00	pinnacle	1
bet365_15	football	Settled	Loss	Super Boost	20	24	120	\N	Parlay - Bills @ Dolphins	Allen 200+ passing yards & Allen 25+ rushing yards	\N	2024-09-12 21:53:00	Bet365	1
2006943434	tennis	Settled	Win	Sopranos Picks	10	38.5	385	f	Jelena Ostapenko vs Marina Stakusic	Marina Stakusic	2024-09-13 02:00:00	2024-09-12 23:30:00	pinnacle	1
2006944866	tennis	Settled	Win	Sopranos Picks	2.5	47.2	1888	f	Jelena Ostapenko vs Marina Stakusic	Marina Stakusic	2024-09-13 02:10:00	2024-09-12 23:30:00	pinnacle	1
2006949806	tennis	Settled	Win	OutofLineBets	20	17.39	-115	f	Gerard Campana Lee  vs Rudolf Molleker	Gerard Campana Lee (Games) +3.0	2024-09-13 02:46:00	2024-09-13 12:15:00	pinnacle	1
2006955174	baseball	Settled	Refunded	A11 Bets	10	8.26	-121	f	NC Dinos vs Doosan Bears	Over 9.5	2024-09-13 03:46:00	2024-09-13 09:30:00	pinnacle	1
2006955162	baseball	Settled	Loss	A11 Bets	10	10.4	104	f	Hanwha Eagles vs Lotte Giants	Lotte Giants	2024-09-13 03:46:00	2024-09-13 09:30:00	pinnacle	1
2007070683	tennis	Settled	Win	Sopranos Picks	20	20.6	103	f	Titouan Droguet  vs Quentin Halys	Quentin Halys (Games) -2.5	2024-09-13 13:46:00	2024-09-13 19:55:00	pinnacle	1
2007070992	tennis	Settled	Loss	Sopranos Picks	20	21.2	106	f	Abedallah Shelbayh vs Denis Kudla	Denis Kudla (Sets)	2024-09-13 13:47:00	2024-09-13 22:35:00	pinnacle	1
2007072020	tennis	Settled	Loss	A11 Bets	10	8.2	-122	f	Flavio Cobolli vs Zizou Bergs	Flavio Cobolli (Sets)	2024-09-13 13:49:00	2024-09-13 15:40:00	pinnacle	1
2007072692	tennis	Settled	Win	OutofLineBets	20	17.09	-117	f	Adrian Mannarino vs Jacob Fearnley	Jacob Fearnley (Sets)	2024-09-13 13:52:00	2024-09-13 14:05:00	pinnacle	1
2007079474	tennis	Settled	Win	A11 Bets	10	7.3	-137	f	Ugo Humbert vs Carlos Alcaraz	Carlos Alcaraz (Sets) -1.5	2024-09-13 14:13:00	2024-09-13 17:35:00	pinnacle	1
bet365_16	tennis	Settled	Win	Sopranos Picks	10	16.25	162	\N	Sara Sorribes Tormo vs Rebecca Sramkova	Rebecca Sramkova	\N	2024-09-13 11:23:00	Bet365	1
2007109341	tennis	Settled	Win	Sopranos Picks	3	21.69	723	f	Sara Sorribes Tormo  vs Rebecca Sramkova	Rebecca Sramkova (Sets)	2024-09-13 15:41:00	2024-09-13 15:08:00	pinnacle	1
2007110923	baseball	Settled	Loss	Dicey	20	27	135	f	New York Mets vs Philadelphia Phillies	Philadelphia Phillies -1.5	2024-09-13 15:46:00	2024-09-13 22:40:00	pinnacle	1
2007112712	tennis	Settled	Loss	Sopranos Picks	20	35.4	177	f	Ella Seidel  vs Olga Danilovic	Ella Seidel (Sets)	2024-09-13 15:50:00	2024-09-13 14:45:00	pinnacle	1
2007198819	basketball	Settled	Win	Sharp Sheet	20	17.54	-114	f	Las Vegas Aces vs Indiana Fever	Indiana Fever +4.5	2024-09-13 19:22:00	2024-09-13 23:30:00	pinnacle	1
2007209592	tennis	Settled	Loss	Sopranos Picks	40	28.57	-140	f	Camila Osorio vs Kamilla Rakhimova	Kamilla Rakhimova (Sets)	2024-09-13 19:56:00	2024-09-13 21:25:00	pinnacle	1
2007217687	tennis	Settled	Loss	Life's a gamble	20	14.39	-139	f	Camila Osorio vs Kamilla Rakhimova	Kamilla Rakhimova (Sets)	2024-09-13 20:27:00	2024-09-13 21:25:00	pinnacle	1
2007222007	football	Settled	Loss	Me	20	18.18	-110	t	Parlay	Over 53.5	2024-09-13 20:49:00	2024-09-14 03:13:00	pinnacle	1
2007224548	football	Settled	Loss	Jimmie Kaylor	20	15.87	-126	f	UNLV vs Kansas	Over 56.5	2024-09-13 21:02:00	2024-09-13 23:00:00	pinnacle	1
2007280254	tennis	Settled	Win	Sopranos Picks	20	20.4	102	f	Varvara Lepchenko  vs Kira Pavlova	Kira Pavlova (Games) +5.5	2024-09-14 02:19:00	2024-09-14 02:00:00	pinnacle	1
2007293664	tennis	Settled	Loss	Sopranos Picks	5	19.55	391	f	Varvara Lepchenko  vs Kira Pavlova	Kira Pavlova (Sets)	2024-09-14 03:40:00	2024-09-14 02:00:00	pinnacle	1
2007294496	baseball	Settled	Win	DirtyBubbleBets	20	12.66	-158	f	Hanwha Eagles vs Lotte Giants	Hanwha Eagles - Under 2.5	2024-09-14 03:45:00	2024-09-14 05:00:00	pinnacle	1
2007294377	baseball	Settled	Win	DirtyBubbleBets	15	17.3	115	t	Parlay	SSG Landers (-189)	2024-09-14 03:44:00	2024-09-14 08:45:00	pinnacle	1
2007293899	baseball	Settled	Win	DirtyBubbleBets	20	19.05	-105	f	Samsung Lions vs SSG Landers	SSG Landers -1.5	2024-09-14 03:42:00	2024-09-14 05:00:00	pinnacle	1
2007294257	baseball	Settled	Win	DirtyBubbleBets	15	12.61	-119	f	KT Wiz vs Doosan Bears	Under 5	2024-09-14 03:44:00	2024-09-14 08:00:00	pinnacle	1
2007294082	baseball	Settled	Loss	DirtyBubbleBets	20	16.67	-120	f	LG Twins vs NC Dinos	NC Dinos +0.5	2024-09-14 03:43:00	2024-09-14 08:00:00	pinnacle	1
2007294557	baseball	Settled	Win	OutofLineBets	20	15.87	-126	f	KT Wiz vs Doosan Bears	Doosan Bears	2024-09-14 03:45:00	2024-09-14 08:00:00	pinnacle	1
2007294191	baseball	Settled	Win	DirtyBubbleBets	20	14.29	-140	f	Kiwoom Heroes vs Kia Tigers	Kiwoom Heroes +1.5	2024-09-14 03:43:00	2024-09-14 08:00:00	pinnacle	1
bet365_17	table tennis	Settled	Win	newms	20	25	125	\N	Damien Wederlick vs Jan Zandecki	Damien Wederlick	\N	2024-09-14 09:52:00	Bet365	1
2007484384	football	Settled	Loss	Picks Office	20	16.67	-120	f	Oklahoma State vs Tulsa	Tulsa +18.5	2024-09-14 13:55:00	2024-09-14 16:00:00	pinnacle	1
2007485488	football	Settled	Win	Emory Hunt	20	18.35	-109	f	Alabama vs Wisconsin	Alabama -15.5	2024-09-14 13:57:00	2024-09-14 16:00:00	pinnacle	1
2007486336	football	Settled	Win	Michah Roberts	20	15.04	-133	f	LSU vs South Carolina	South Carolina +7.0	2024-09-14 13:58:00	2024-09-14 16:00:00	pinnacle	1
2007486978	football	Settled	Win	Emory Hunt	20	15.87	-126	f	Boston College vs Missouri	Boston College +16.5	2024-09-14 14:00:00	2024-09-14 16:45:00	pinnacle	1
2007487419	football	Settled	Win	Jimmie Kaylor	20	15.5	-129	f	Boston College vs Missouri	Under 53.5	2024-09-14 14:00:00	2024-09-14 16:45:00	pinnacle	1
2007490758	football	Settled	Loss	Emory Hunt	20	20.6	103	f	Oregon vs Oregon State	Oregon State +17.0	2024-09-14 14:05:00	2024-09-14 19:30:00	pinnacle	1
2007491291	football	Settled	Win	Micah Roberts	20	17.86	-112	f	UTSA vs Texas	Texas -35.0	2024-09-14 14:06:00	2024-09-14 23:00:00	pinnacle	1
2007491756	football	Settled	Win	Jimmie Kaylor	20	18.35	-109	f	Georgia vs Kentucky	Under 45	2024-09-14 14:07:00	2024-09-14 23:30:00	pinnacle	1
2007495079	football	Settled	Loss	Picks Office	20	16.13	-124	f	Kennesaw State vs San Jose State	Kennesaw State +19.5	2024-09-14 14:12:00	2024-09-14 23:00:00	pinnacle	1
2007496948	tennis	Settled	Loss	Sopranos Picks	20	21.2	106	f	Vit Kopriva  vs Federico Coria	Federico Coria (Sets)	2024-09-14 14:14:00	2024-09-14 12:00:00	pinnacle	1
2007523661	football	Settled	Win	A11 Bets	20	13.56	-148	t	Parlay	Texas Tech (-421)	2024-09-14 14:57:00	2024-09-14 23:01:00	pinnacle	1
bet365_18	tennis	Settled	Loss	Sopranos Picks	20	65	225	\N	Vit Kopriva vs Federico Coria	Federico Coria Exact Score 2-1	\N	2024-09-14 11:39:00	Bet365	1
2007562524	baseball	Settled	Loss	Matt Severance	20	14.93	-134	f	Boston Red Sox vs New York Yankees	New York Yankees -1.0	2024-09-14 15:59:00	2024-09-14 17:05:00	pinnacle	1
2007562763	baseball	Settled	Loss	Matt Severance	10	6.71	-149	f	Los Angeles Dodgers vs Atlanta Braves	Los Angeles Dodgers +1.0	2024-09-14 16:00:00	2024-09-14 23:20:00	pinnacle	1
2007562913	baseball	Settled	Loss	Matt Severance	30	20.41	-147	f	Milwaukee Brewers vs Arizona Diamondbacks	Arizona Diamondbacks	2024-09-14 16:00:00	2024-09-15 00:10:00	pinnacle	1
2007580369	tennis	Settled	Refunded	Sopranos Picks	30	27.78	-108	f	Eva Lys vs Sonay Kartal	Sonay Kartal (Sets)	2024-09-14 16:32:00	2024-09-14 16:55:00	pinnacle	1
2007581497	tennis	Settled	Loss	Sopranos Picks	30	31.5	105	f	Magdalena Frech vs Caroline Garcia	Caroline Garcia (Sets)	2024-09-14 16:34:00	2024-09-15 01:09:00	pinnacle	1
2007629298	mma	Settled	Loss	MMABettingPro	60	60	100	f	Merab Dvalishvili vs Sean O'Malley	Sean O'Malley	2024-09-14 18:12:00	2024-09-15 05:31:00	pinnacle	1
2007629387	mma	Settled	Loss	MMABettingPro	40	32.26	-124	f	Valentina Shevchenko vs Alexa Grasso	Alexa Grasso	2024-09-14 18:12:00	2024-09-15 04:31:00	pinnacle	1
2007629583	mma	Settled	Win	MMABettingPro	40	37.51	-107	t	Parlay	Over 2.5 (-449)	2024-09-14 18:12:00	2024-09-15 04:09:00	pinnacle	1
2007629873	mma	Settled	Win	MMABettingPro	20	44	220	f	Diego Lopes Wins By Decision?	Yes	2024-09-14 18:13:00	2024-09-15 03:15:00	pinnacle	1
2007630240	mma	Settled	Loss	MMABettingPro	40	40.27	100	t	Parlay	Over 2.5 (-200)	2024-09-14 18:13:00	2024-09-15 00:48:00	pinnacle	1
2007630400	mma	Settled	Win	MMABettingPro	30	39.6	132	f	Joshua Van Wins By Decision?	Yes	2024-09-14 18:14:00	2024-09-15 00:10:00	pinnacle	1
2007630684	mma	Settled	Loss	MMABettingPro	30	22.39	-134	f	Ignacio Bahamondes vs Manuel Torres	Over 1.5	2024-09-14 18:14:00	2024-09-15 01:11:00	pinnacle	1
2007630796	mma	Settled	Loss	MMABettingPro	10	48.4	484	f	Ignacio Bahamondes Wins By Decision?	Yes	2024-09-14 18:15:00	2024-09-15 01:10:00	pinnacle	1
2007632353	mma	Settled	Loss	MMABettingPro	10	124.11	1241	t	Parlay	Over 2.5 (-108)	2024-09-14 18:19:00	2024-09-15 00:48:00	pinnacle	1
2007632521	mma	Settled	Loss	MMABettingPro	10	16.83	168	t	Parlay	Over 2.5 (-449)	2024-09-14 18:19:00	2024-09-15 00:48:00	pinnacle	1
2007632741	mma	Settled	Win	MMABettingPro	10	18.89	188	t	Parlay	Over 2.5 (+100)	2024-09-14 18:20:00	2024-09-15 05:03:00	pinnacle	1
2007633076	mma	Settled	Loss	MMABettingPro	5	12.25	245	f	Edgar Chairez vs Joshua Van	Edgar Chairez	2024-09-14 18:21:00	2024-09-15 00:15:00	pinnacle	1
bet365_19	mma	Settled	Loss	MMABettingPro	4	40	1000	\N	Torres vs Bahamonds	Torres by sub and round 1	\N	2024-09-14 21:32:00	Pinnacle	1
bet99_4	table tennis	Settled	Win	newms	30	21.43	-140	\N	Daniel Morawiec vs Schaniel Krzysztof	Schaniel Krzysztof	\N	2024-09-14 19:45:00	Pinnacle	1
2007637064	tennis	Settled	Win	Sopranos Picks	20	26	130	f	A Blinkova / M Sherif  vs A Korneeva / A Zakharova	A Blinkova / M Sherif (Sets)	2024-09-14 18:31:00	2024-09-14 19:00:00	pinnacle	1
2007641147	football	Settled	Loss	Wager Analyst	30	23.81	-126	f	West Virginia vs Pittsburgh	West Virginia	2024-09-14 18:40:00	2024-09-14 19:30:00	pinnacle	1
2007648795	tennis	Settled	Win	Sopranos Picks	20	17.54	-114	f	Tristan Boyer vs Karue Sell	Tristan Boyer (Sets)	2024-09-14 18:59:00	2024-09-14 19:30:00	pinnacle	1
2007692168	baseball	Settled	Loss	Wager Analyst	20	12.58	-159	f	Oakland Athletics vs Chicago White Sox	Oakland Athletics	2024-09-14 21:27:00	2024-09-14 23:10:00	pinnacle	1
2007692169	baseball	Settled	Win	Wager Analyst	20	14.71	-136	f	Tampa Bay Rays vs Cleveland Guardians	Cleveland Guardians	2024-09-14 21:27:00	2024-09-14 22:10:00	pinnacle	1
2007739282	mma	Settled	Loss	A11 Bets	35	35	100	f	Merab Dvalishvili vs Sean O'Malley	Sean O'Malley	2024-09-15 01:54:00	2024-09-15 05:31:00	pinnacle	1
2007739341	mma	Settled	Loss	A11 Bets	5	8	160	f	Sean O'Malley Wins By TKO/KO?	Yes	2024-09-15 01:55:00	2024-09-15 04:30:00	pinnacle	1
2007912726	tennis	Settled	Loss	Sopranos Picks	30	24.39	-123	f	Felix Auger Aliassime vs Jack Draper	Jack Draper (Sets)	2024-09-15 13:32:00	2024-09-15 14:05:00	pinnacle	1
2007913076	tennis	Settled	Loss	Sopranos Picks	20	23.2	116	f	Magdalena Frech vs Olivia Gadecki	Olivia Gadecki (Sets)	2024-09-15 13:33:00	2024-09-15 23:38:00	pinnacle	1
2007913414	tennis	Settled	Loss	Sopranos Picks	20	18.87	-106	f	Sonay Kartal  vs Rebecca Sramkova	Over 21.5 (Games)	2024-09-15 13:34:00	2024-09-15 15:08:00	pinnacle	1
2007913764	tennis	Settled	Loss	Sopranos Picks	20	21.4	107	f	Jacob Fearnley vs Quentin Halys	Quentin Halys (Sets)	2024-09-15 13:34:00	2024-09-15 15:50:00	pinnacle	1
bet99_6	football	Settled	Win	Erik Kuselias	10	8	-125	\N	Rams at Cardinals	Kyren Williams Under 17.5 rushing attempts	\N	2024-09-15 17:00:00	Bet99	1
bet99_7	football	Settled	Loss	Erik Kuselias	10	8.7	-115	\N	Bengals @ Chiefs	Zach Moss Over 12.5 carries	\N	2024-09-15 18:25:00	Bet99	1
2007935418	football	Settled	Win	Eric Kuselias	10	8.7	-115	f	Derrick Henry (Rushing Yards)	Over 70.5 Rushing Yards	2024-09-15 14:19:00	2024-09-15 17:00:00	pinnacle	1
2007936244	football	Settled	Win	Eric Kuselias	5	4.2	-119	f	CeeDee Lamb (Anytime TD)	Yes +0.5 Touchdowns	2024-09-15 14:21:00	2024-09-15 17:00:00	pinnacle	1
2007936480	football	Settled	Win	Eric Kuselias	20	21.6	108	f	New Orleans Saints vs Dallas Cowboys	New Orleans Saints - Over 20.5	2024-09-15 14:22:00	2024-09-15 17:00:00	pinnacle	1
2007937152	football	Settled	Win	Eric Kuselias	10	8.47	-118	f	Malik Nabers (Receiving Yards)	Over 66.5 Receiving Yards	2024-09-15 14:23:00	2024-09-15 17:00:00	pinnacle	1
2007938980	football	Settled	Loss	Eric Kuselias	10	9.43	-106	f	Matthew Stafford (Completions)	Over 23.5 Pass Completions	2024-09-15 14:27:00	2024-09-15 20:05:00	pinnacle	1
2007942040	football	Settled	Win	Micah Roberts	20	18.87	-106	f	Los Angeles Chargers vs Carolina Panthers	Los Angeles Chargers -4.5	2024-09-15 14:32:00	2024-09-15 17:00:00	pinnacle	1
2007942355	football	Settled	Loss	Micah Roberts	20	18.52	-108	f	Cleveland Browns vs Jacksonville Jaguars	Jacksonville Jaguars -3.0	2024-09-15 14:33:00	2024-09-15 17:00:00	pinnacle	1
2007943347	football	Settled	Loss	A11 Bets	50	44.73	-112	t	Parlay	New York Jets (-185)	2024-09-15 14:34:00	2024-09-15 20:25:00	pinnacle	1
2007943974	football	Settled	Win	Matt Severance	10	8	-125	f	New York Giants vs Washington Commanders	Washington Commanders	2024-09-15 14:35:00	2024-09-15 17:00:00	pinnacle	1
2007946196	football	Settled	Win	Larry Hartstein	20	17.09	-117	f	Deebo Samuel Sr. (Receiving Yards)	Over 55.5 Receiving Yards	2024-09-15 14:39:00	2024-09-15 17:00:00	pinnacle	1
2007947989	football	Settled	Loss	Emory Hunt	20	21.6	108	f	Las Vegas Raiders vs Baltimore Ravens	Baltimore Ravens -9.5	2024-09-15 14:42:00	2024-09-15 17:00:00	pinnacle	1
2007947993	football	Settled	Win	Emory Hunt	20	17.09	-117	f	New York Giants vs Washington Commanders	Washington Commanders -1.0	2024-09-15 14:42:00	2024-09-15 17:00:00	pinnacle	1
2007947992	football	Settled	Loss	Emory Hunt	20	19.61	-102	f	New Orleans Saints vs Dallas Cowboys	Dallas Cowboys -6.5	2024-09-15 14:42:00	2024-09-15 17:00:00	pinnacle	1
2007947991	football	Settled	Loss	Emory Hunt	20	19.42	-103	f	Indianapolis Colts vs Green Bay Packers	Indianapolis Colts -2.5	2024-09-15 14:42:00	2024-09-15 17:00:00	pinnacle	1
2007947994	football	Settled	Win	Emory Hunt	20	19.8	-101	f	New York Jets vs Tennessee Titans	New York Jets -4.0	2024-09-15 14:42:00	2024-09-15 17:00:00	pinnacle	1
bet365_20	football	Settled	Loss	Alex Selesnick	20	17.39	-115	\N	Saints @ Cowboys	Rico Dowdle under 49.5 combined yards	\N	2024-09-15 17:00:00	Bet365	1
bet365_21	football	Settled	Refunded	Alex Selesnick	20	18.18	-110	\N	Browns at Jacksonville	Evan Engram under 41.5 receiving yards	\N	2024-09-15 17:00:00	Bet365	1
2007949708	football	Settled	Win	Jimmie Kaylor	20	19.23	-104	f	Los Angeles Chargers vs Carolina Panthers	Los Angeles Chargers -4.5	2024-09-15 14:46:00	2024-09-15 17:00:00	pinnacle	1
2007949709	football	Settled	Win	Jimmie Kaylor	20	18.52	-108	f	Tampa Bay Buccaneers vs Detroit Lions	Tampa Bay Buccaneers +7.5	2024-09-15 14:46:00	2024-09-15 17:00:00	pinnacle	1
2007949883	football	Settled	Loss	Alex Selesnick	20	18.87	-106	f	Miles Sanders (Rushing Yards)	Over 24.5 Rushing Yards	2024-09-15 14:46:00	2024-09-15 17:00:00	pinnacle	1
2007951679	football	Settled	Win	Alex Selesnick	20	16.53	-121	f	Chris Godwin (Receiving Yards)	Over 60.5 Receiving Yards	2024-09-15 14:51:00	2024-09-15 17:00:00	pinnacle	1
2007951850	football	Settled	Loss	Alex Selesnick	20	18.35	-109	f	Amari Cooper (Receiving Yards)	Over 56.5 Receiving Yards	2024-09-15 14:51:00	2024-09-15 17:00:00	pinnacle	1
2007953375	football	Settled	Win	Alex Selesnick	20	17.39	-115	f	Breece Hall (Rushing Yards)	Under 75.5 Rushing Yards	2024-09-15 14:54:00	2024-09-15 17:00:00	pinnacle	1
2007953574	football	Settled	Win	Alex Selesnick	20	18.35	-109	f	Malik Nabers (Receiving Yards)	Over 66.5 Receiving Yards	2024-09-15 14:54:00	2024-09-15 17:00:00	pinnacle	1
2007954803	football	Settled	Win	Emory Hunt	20	17.24	-116	f	Pittsburgh Steelers vs Denver Broncos	Pittsburgh Steelers -2.5	2024-09-15 14:57:00	2024-09-15 20:25:00	pinnacle	1
2007955690	football	Settled	Refunded	Micah Roberts	20	19.8	-101	f	Chicago Bears vs Houston Texans	Houston Texans -6.0	2024-09-15 14:58:00	2024-09-16 00:20:00	pinnacle	1
2007955854	football	Settled	Loss	Emory Hunt	20	19.61	-102	f	Atlanta Falcons vs Philadelphia Eagles	Philadelphia Eagles -6.0	2024-09-15 14:59:00	2024-09-17 00:15:00	pinnacle	1
bet365_22	football	Settled	Loss	Super Boost	20	25	125	\N	Bengals @ Chiefs	Kelce 50+ receiving yards	\N	2024-09-15 20:25:00	Bet365	1
2007967838	tennis	Settled	Loss	OutofLineBets	15	17.4	116	f	Jacob Fearnley vs Quentin Halys	Quentin Halys (Sets)	2024-09-15 15:22:00	2024-09-15 15:50:00	pinnacle	1
2007968002	football	Settled	Win	OutofLineBets	20	17.24	-116	f	New York Giants vs Washington Commanders	Washington Commanders -1.0	2024-09-15 15:23:00	2024-09-15 17:00:00	pinnacle	1
2007994783	football	Settled	Win	Sharp Sheet	25	19.69	-127	f	Cincinnati Bengals vs Kansas City Chiefs	Cincinnati Bengals +7.0	2024-09-15 16:15:00	2024-09-15 20:25:00	pinnacle	1
bet365_23	table tennis	Settled	Loss	Marshy	22	18.33	-120	\N	Jakub Glanowski vs. Michael Minda 	Over 75.5 total points	\N	2024-09-15 16:17:00	Bet365	1
2008001002	football	Settled	Win	A11 Bets	5	15.2	304	f	Tampa Bay Buccaneers vs Detroit Lions	Tampa Bay Buccaneers	2024-09-15 16:26:00	2024-09-15 17:00:00	pinnacle	1
2008001003	football	Settled	Win	A11 Bets	10	10	-100	f	Tampa Bay Buccaneers vs Detroit Lions	Tampa Bay Buccaneers +7.5	2024-09-15 16:26:00	2024-09-15 17:00:00	pinnacle	1
2008001682	baseball	Settled	Refunded	Wager Analyst	30	28.04	-107	f	Milwaukee Brewers vs Arizona Diamondbacks	Arizona Diamondbacks -1.0	2024-09-15 16:28:00	2024-09-15 20:10:00	pinnacle	1
2008007846	football	Settled	Loss	ValueLockSports	20	18.02	-111	f	Cleveland Browns vs Jacksonville Jaguars	Jacksonville Jaguars -3.0	2024-09-15 16:40:00	2024-09-15 17:00:00	pinnacle	1
2008007967	football	Settled	Win	ValueLockSports	40	33.06	-121	f	New York Giants vs Washington Commanders	Washington Commanders	2024-09-15 16:40:00	2024-09-15 17:00:00	pinnacle	1
2008027789	tennis	Settled	Loss	Value Hunter	30	21.9	-137	f	Cannon Kingsley vs Murphy Cassone	Cannon Kingsley (Sets)	2024-09-15 17:22:00	2024-09-15 20:55:00	pinnacle	1
bet99_8	tennis	Settled	Loss	Sopranos Picks	40	33.33	-120	\N	Elena-Grabriela Ruse vs Yuan Yue	Elena-Grabriela Ruse	\N	2024-09-16 03:23:00	Bet99	1
2008078680	tennis	Settled	Win	Sopranos Picks	20	20.8	104	f	Dayeon Back vs Carol Zhao	Carol Zhao (Sets)	2024-09-15 19:21:00	2024-09-16 05:30:00	pinnacle	1
2008078785	tennis	Settled	Win	Sopranos Picks	20	21.4	107	f	Katie Volynets vs Clara Tauson	Katie Volynets (Sets)	2024-09-15 19:21:00	2024-09-16 05:59:00	pinnacle	1
2008237183	tennis	Settled	Win	Sopranos Picks	40	28.17	-142	f	Ugo Blanchet  vs Maxime Janvier	Ugo Blanchet (Sets)	2024-09-16 16:53:00	2024-09-16 15:15:00	pinnacle	1
2008264680	tennis	Settled	Win	OutofLineBets	20	16.39	-122	f	Aidan Mayo  vs James Trotter	James Trotter (Games) -1.0	2024-09-16 18:45:00	2024-09-16 23:15:00	pinnacle	1
2008279676	tennis	Settled	Loss	Sopranos Picks	40	41.2	103	f	Peyton Stearns  vs Emma Raducanu	Emma Raducanu (Games) -3.5	2024-09-16 19:54:00	2024-09-17 07:44:00	pinnacle	1
2008281998	football	Settled	Loss	Alex Selesnick	30	25.64	-117	f	Dallas Goedert (Receiving Yards)	Over 39.5 Receiving Yards	2024-09-16 20:05:00	2024-09-17 00:15:00	pinnacle	1
2008282085	football	Settled	Loss	Mike McClure	20	18.69	-107	f	Atlanta Falcons vs Philadelphia Eagles	Philadelphia Eagles -5.0	2024-09-16 20:06:00	2024-09-17 00:15:00	pinnacle	1
2008286089	tennis	Settled	Win	Sopranos Picks	20	16	-125	f	Gonzalo Villanueva  vs Mateus Alves	Mateus Alves (Games) -2.5	2024-09-16 20:28:00	2024-09-17 05:20:00	pinnacle	1
2008292153	baseball	Settled	Refunded	Matt Severance	20	15.15	-132	f	Washington Nationals vs New York Mets	New York Mets -1.0	2024-09-16 21:26:00	2024-09-16 23:10:00	pinnacle	1
2008292181	baseball	Settled	Win	Matt Severance	2	1.42	-141	f	Oakland Athletics vs Chicago Cubs	Chicago Cubs -1.0	2024-09-16 21:26:00	2024-09-16 23:40:00	pinnacle	1
2008292209	baseball	Settled	Win	Matt Severance	18	12.77	-141	f	Oakland Athletics vs Chicago Cubs	Chicago Cubs -1.0	2024-09-16 21:26:00	2024-09-16 23:40:00	pinnacle	1
2008292263	baseball	Settled	Win	Matt Snyder	20	26.2	131	f	Houston Astros vs San Diego Padres	San Diego Padres -1.0	2024-09-16 21:27:00	2024-09-17 01:40:00	pinnacle	1
2008292309	baseball	Settled	Win	Matt Snyder	20	17.7	-113	f	Paul Skenes (Total Strikeouts)	Over 6.5 Strikeouts	2024-09-16 21:28:00	2024-09-16 23:45:00	pinnacle	1
2008293502	baseball	Settled	Win	Wager Analyst	40	32	-125	f	Los Angeles Dodgers vs Atlanta Braves	Los Angeles Dodgers	2024-09-16 21:46:00	2024-09-16 23:20:00	pinnacle	1
2008293644	baseball	Settled	Win	Wager Analyst	20	13.7	-146	f	Minnesota Twins vs Cleveland Guardians	Under 8	2024-09-16 21:48:00	2024-09-16 22:40:00	pinnacle	1
2008298374	baseball	Settled	Win	A11 Bets	10	6.85	-146	f	Oakland Athletics vs Chicago Cubs	Chicago Cubs -1.0	2024-09-16 22:44:00	2024-09-16 23:40:00	pinnacle	1
2008298390	baseball	Settled	Win	A11 Bets	10	7.69	-130	f	Los Angeles Dodgers vs Atlanta Braves	Los Angeles Dodgers	2024-09-16 22:45:00	2024-09-16 23:20:00	pinnacle	1
2008298416	baseball	Settled	Win	A11 Bets	10	9.62	-104	f	Minnesota Twins vs Cleveland Guardians	Cleveland Guardians	2024-09-16 22:45:00	2024-09-16 22:40:00	pinnacle	1
2008298630	tennis	Settled	Win	TennisWinnersOnly	20	22.8	114	f	Yulia Putintseva vs Amanda Anisimova	Amanda Anisimova (Sets)	2024-09-16 22:47:00	2024-09-17 03:53:00	pinnacle	1
2008298679	tennis	Settled	Loss	TennisWinnersOnly	20	13.99	-143	f	Polina Kudermetova vs Priscilla Hon	Priscilla Hon (Sets)	2024-09-16 22:48:00	2024-09-17 03:53:00	pinnacle	1
2008298701	tennis	Settled	Win	TennisWinnersOnly	20	24.8	124	f	Sloane Stephens vs Hailey Baptiste	Hailey Baptiste (Sets)	2024-09-16 22:48:00	2024-09-17 05:50:00	pinnacle	1
bet365_24	football	Settled	Loss	A11 Bets	20	16	-125	\N	ATL Falcons @ PHI Eagles	SGP - Eagles ML - Under 54.5 total points	\N	2024-09-17 00:06:00	Pinnacle	1
bet365_25	table tennis	Settled	Win	newms	20	16.66	-120	\N	Igor Dabrowski vs Krzysztof Kotyl	Krzysztof Kotyl	\N	2024-09-17 01:33:00	Bet365	1
bet365_26	football	Settled	Loss	Alex Selesnick	20	27	135	\N	ATL Falcons @ PHI Eagles	Ray-Ray McCloud under 2.5 receptions	\N	2024-09-17 01:34:00	Bet365	1
2008317581	tennis	Settled	Loss	Tennis With T	10	77.25	772	t	Parlay	Reilly Opelka (Sets) (-484)	2024-09-17 01:47:00	2024-09-17 05:38:00	pinnacle	1
2008321548	tennis	Settled	Win	Sopranos Picks	20	15.87	-126	f	Yulia Putintseva  vs Amanda Anisimova	Over 21 (Games)	2024-09-17 02:38:00	2024-09-17 03:53:00	pinnacle	1
2008321580	tennis	Settled	Loss	Sopranos Picks	20	20.97	104	t	Parlay	Dayana Yastremska (Sets) (-277)	2024-09-17 02:38:00	2024-09-17 11:06:00	pinnacle	1
2008321609	tennis	Settled	Win	Sopranos Picks	30	23.44	-128	f	Reilly Opelka  vs Denis Yevseyev	Denis Yevseyev (Games) +4.5	2024-09-17 02:39:00	2024-09-17 08:00:00	pinnacle	1
2008321627	tennis	Settled	Win	Sopranos Picks	20	25	125	f	Marco Trungelliti vs Yosuke Watanuki	Marco Trungelliti (Sets)	2024-09-17 02:39:00	2024-09-17 09:00:00	pinnacle	1
2008323996	tennis	Settled	Loss	Sopranos Picks	20	22.8	114	f	Sijia Wei vs Xinyu Gao	Sijia Wei (Sets)	2024-09-17 03:24:00	2024-09-17 04:08:00	pinnacle	1
2008324038	tennis	Settled	Win	Sopranos Picks	20	21.4	107	f	Seong-chan Hong vs Alibek Kachmazov	Alibek Kachmazov (Sets)	2024-09-17 03:25:00	2024-09-17 08:45:00	pinnacle	1
bet99_9	table tennis	Settled	Loss	newms	10	27.4	274	\N	Parlay	Sebastian Szostok ML & Igor Dabrowski ML	\N	2024-09-17 03:27:00	Bet99	1
2008412729	baseball	Settled	Loss	Matt Snyder	20	20.6	103	f	San Francisco Giants vs Baltimore Orioles	Baltimore Orioles	2024-09-17 13:37:00	2024-09-17 22:35:00	pinnacle	1
2008412772	baseball	Settled	Loss	Matt Snyder	20	16.53	-121	f	Minnesota Twins vs Cleveland Guardians	Cleveland Guardians	2024-09-17 13:37:00	2024-09-17 22:40:00	pinnacle	1
2008412843	baseball	Settled	Win	Matt Severance	20	14.93	-134	f	Pittsburgh Pirates vs St. Louis Cardinals	St. Louis Cardinals	2024-09-17 13:37:00	2024-09-17 23:45:00	pinnacle	1
2008422461	tennis	Settled	Loss	Sopranos Picks	20	51	255	f	Mananchaya Sawangkaew  vs Rebecca Sramkova	Mananchaya Sawangkaew (Sets)	2024-09-17 14:15:00	2024-09-17 14:30:00	pinnacle	1
2008431520	tennis	Settled	Loss	Sopranos Picks	20	25.6	128	f	Francesco Maestrelli  vs Pol Martin Tiffon	Francesco Maestrelli (Sets)	2024-09-17 14:45:00	2024-09-17 15:00:00	pinnacle	1
bet99_10	table tennis	Settled	Win	newms	20	17.39	-115	\N	Martin Olejnik vs Piotr Chodorski	Piotr Chodorski	\N	2024-09-17 15:15:00	Bet99	1
bet99_11	table tennis	Settled	Loss	newms	20	44	120	\N	Jan Zandecki vs Martin Olejnik	Jan Zandecki	\N	2024-09-17 16:07:00	Pinnacle	1
bet99_12	table tennis	Settled	Win	newms	20	19.05	-105	\N	Martin Olejnik vs Jakub Kosowski	Martin Olejnik	\N	2024-09-17 17:15:00	Bet99	1
2008509725	tennis	Settled	Loss	Sopranos Picks	30	23.26	-129	f	Beibit Zhukayev vs Federico Agustin Gomez	Beibit Zhukayev (Sets)	2024-09-17 19:02:00	2024-09-18 06:45:00	pinnacle	1
2008509852	tennis	Settled	Win	Sopranos Picks	30	22.73	-132	f	Marco Trungelliti vs James McCabe	Marco Trungelliti (Sets)	2024-09-17 19:02:00	2024-09-18 04:05:00	pinnacle	1
2008510029	tennis	Settled	Win	Sopranos Picks	20	18.02	-111	f	Adam Walton  vs Lukas Klein	Lukas Klein (Games) -1.5	2024-09-17 19:03:00	2024-09-18 05:30:00	pinnacle	1
2008510133	tennis	Settled	Loss	Sopranos Picks	20	17.24	-116	f	Eliot Spizzirri vs Abedallah Shelbayh	Eliot Spizzirri (Sets)	2024-09-17 19:03:00	2024-09-18 01:45:00	pinnacle	1
2008545744	tennis	Settled	Loss	OutofLineBets	20	15.63	-128	f	Mitchell Krueger vs Yasutaka Uchiyama	Mitchell Krueger (Sets)	2024-09-17 21:24:00	2024-09-18 04:30:00	pinnacle	1
2008550877	baseball	Settled	Loss	Wager Analyst	40	37.04	-108	f	Detroit Tigers vs Kansas City Royals	Kansas City Royals -1.0	2024-09-17 22:08:00	2024-09-17 23:40:00	pinnacle	1
2008551333	tennis	Settled	Loss	Sopranos Picks	30	21.13	-142	f	Veronika Kudermetova  vs Liudmila Samsonova	Liudmila Samsonova (Games) -2.5	2024-09-17 22:12:00	2024-09-18 08:03:00	pinnacle	1
2008543256	tennis	Settled	Loss	Sopranos Picks	40	37.32	-108	t	Parlay	Magda Linette (Sets) (-400)	2024-09-17 21:02:00	2024-09-19 15:25:00	pinnacle	1
2008552178	baseball	Settled	Loss	A11 Bets	10	11.1	111	f	San Francisco Giants vs Baltimore Orioles	Baltimore Orioles	2024-09-17 22:17:00	2024-09-17 22:35:00	pinnacle	1
2008552180	baseball	Settled	Win	A11 Bets	10	13.4	134	f	Oakland Athletics vs Chicago Cubs	Oakland Athletics	2024-09-17 22:17:00	2024-09-17 23:40:00	pinnacle	1
2008554654	baseball	Settled	Loss	Picks Office	20	17.09	-117	f	Houston Astros vs San Diego Padres	San Diego Padres	2024-09-17 22:39:00	2024-09-18 01:40:00	pinnacle	1
2008554697	baseball	Settled	Loss	Picks Office	20	16.81	-119	f	Toronto Blue Jays vs Texas Rangers	Under 8	2024-09-17 22:39:00	2024-09-18 00:05:00	pinnacle	1
2008554731	baseball	Settled	Loss	Picks Office	20	15.75	-127	f	Washington Nationals vs New York Mets	Under 8	2024-09-17 22:39:00	2024-09-17 23:10:00	pinnacle	1
2009384256	football	Settled	Loss	Wager Analyst	5	4.55	-110	t	Parlay	Under 49.5	2024-09-20 22:11:00	2024-09-21 03:41:00	pinnacle	1
2008561658	tennis	Settled	Win	TennisWinnersOnly	20	17.39	-115	f	Luciano Darderi  vs Mikhail Kukushkin	Mikhail Kukushkin (Games) +2.5	2024-09-17 23:39:00	2024-09-18 09:00:00	pinnacle	1
2008561675	tennis	Settled	Win	TennisWinnersOnly	20	14.81	-135	f	Adam Walton vs Lukas Klein	Lukas Klein (Sets)	2024-09-17 23:39:00	2024-09-18 05:30:00	pinnacle	1
2008561792	tennis	Settled	Loss	TennisWinnersOnly	20	19.05	-105	f	Veronika Kudermetova  vs Liudmila Samsonova	Over 21.5 (Games)	2024-09-17 23:40:00	2024-09-18 08:03:00	pinnacle	1
bet365_27	table tennis	Settled	Win	newms	20	24	120	\N	Jakub Grzegorczyk vs Mateusz Trela	Jakub Grzegorczyk	\N	2024-09-17 14:08:00	Bet365	1
2008710902	tennis	Settled	Loss	Sopranos Picks	30	26.32	-114	f	Gijs Brouwer  vs Luca Van Assche	Luca Van Assche (Sets)	2024-09-18 14:11:00	2024-09-18 16:30:00	pinnacle	1
2008758003	tennis	Settled	Win	Sopranos Picks	20	18.18	-110	f	Bruno Kuzuhara  vs Andres Andrade	Andres Andrade (Sets) -1.5	2024-09-18 16:58:00	2024-09-18 17:00:00	pinnacle	1
2008759959	baseball	Settled	Loss	A11 Bets	10	8.55	-117	f	Oakland Athletics vs Chicago Cubs	Chicago Cubs -1.0	2024-09-18 17:04:00	2024-09-18 18:20:00	pinnacle	1
bet99_13	table tennis	Settled	Loss	newms	11	20	195	\N	Gumulinski, Piotr vs Pruszkowski, Jakub	Gumulinski, Piotr	\N	2024-09-18 17:17:00	Bet99	1
bet99_14	table tennis	Settled	Win	newms	30	21.43	-140	\N	Kosowski, Jakub vs Dosz, Adam	Dosz, Adam	\N	2024-09-18 17:18:00	Bet99	1
2008770993	baseball	Settled	Loss	Matt Severance	30	27.78	-108	f	San Francisco Giants vs Baltimore Orioles	Baltimore Orioles -1.0	2024-09-18 17:34:00	2024-09-18 22:35:00	pinnacle	1
bet99_15	table tennis	Settled	Win	newms	12	21.6	180	\N	Mecik, Patryk vs Brunner, Marian	Brunner, Marian	\N	2024-09-18 22:11:00	Bet99	1
2008817644	tennis	Settled	Win	Sopranos Picks	40	31.25	-128	f	Rinky Hijikata vs Damir Dzumhur	Rinky Hijikata (Sets)	2024-09-18 20:10:00	2024-09-19 04:45:00	pinnacle	1
2008561725	tennis	Settled	Loss	TennisWinnersOnly	20	14.65	-137	t	Parlay	Katie Volynets (Sets) (-398)	2024-09-17 23:40:00	2024-09-19 08:15:00	pinnacle	1
2008813888	tennis	Settled	Win	Sopranos Picks	20	14.71	-136	f	Nadia Podoroska  vs Katerina Siniakova	Nadia Podoroska (Games) +4.5	2024-09-18 19:53:00	2024-09-19 06:38:00	pinnacle	1
2008814885	tennis	Settled	Loss	Sopranos Picks	30	30	100	f	Juncheng Shang  vs Kei Nishikori	Over 22.5 (Games)	2024-09-18 19:57:00	2024-09-19 07:10:00	pinnacle	1
2008861192	tennis	Settled	Win	TennisWinnersOnly	20	14.08	-142	f	Pavel Kotov vs Christopher O'connell	Christopher O'connell (Sets)	2024-09-19 01:05:00	2024-09-19 08:15:00	pinnacle	1
2008814017	tennis	Settled	Loss	Sopranos Picks	20	20	-100	f	Pavel Kotov  vs Christopher O'connell	Over 23.5 (Games)	2024-09-18 19:53:00	2024-09-19 08:15:00	pinnacle	1
2008780254	tennis	Settled	Win	Analytics Capper	20	14.49	-138	f	Pavel Kotov vs Christopher O'connell	Christopher O'connell (Sets)	2024-09-18 18:03:00	2024-09-19 08:15:00	pinnacle	1
2008861137	tennis	Settled	Loss	TennisWinnersOnly	20	13.16	-152	f	Corentin Moutet vs Roberto Carballes Baena	Corentin Moutet (Sets)	2024-09-19 01:05:00	2024-09-19 07:55:00	pinnacle	1
2008813729	tennis	Settled	Win	Sopranos Picks	30	24.23	-124	t	Parlay	Beatriz Haddad Maia (Sets) (-323)	2024-09-18 19:52:00	2024-09-19 11:18:00	pinnacle	1
2008879631	tennis	Settled	Loss	Tennis Titan	25	17.86	-140	f	Emma Raducanu  vs Yue Yuan	Yue Yuan (Games) +4.5	2024-09-19 02:54:00	2024-09-19 09:07:00	pinnacle	1
2008861265	tennis	Settled	Loss	TennisWinnersOnly	20	16.13	-124	f	Emma Raducanu  vs Yue Yuan	Yue Yuan (Games) +4.5	2024-09-19 01:05:00	2024-09-19 09:07:00	pinnacle	1
2008861111	tennis	Settled	Win	TennisWinnersOnly	20	17.33	-116	t	Parlay	Bu Yunchaokete (Sets) (-195)	2024-09-19 01:05:00	2024-09-19 11:20:00	pinnacle	1
2008814941	tennis	Settled	Loss	Sopranos Picks	20	23.4	117	f	Aslan Karatsev vs Mattia Bellucci	Aslan Karatsev (Sets)	2024-09-18 19:57:00	2024-09-19 10:45:00	pinnacle	1
2008897985	tennis	Settled	Win	OutofLineBets	20	18.18	-110	f	Richard Gasquet  vs Matteo Martineau	Matteo Martineau (Games) +3.5	2024-09-19 05:44:00	2024-09-19 11:00:00	pinnacle	1
2008893769	baseball	Settled	Loss	A11 Bets	10	9.71	-103	f	Kia Tigers vs Doosan Bears	Kia Tigers -1.5	2024-09-19 04:39:00	2024-09-19 09:30:00	pinnacle	1
2008893817	baseball	Settled	Loss	A11 Bets	10	8.93	-112	f	LG Twins vs Lotte Giants	Over 11.5	2024-09-19 04:40:00	2024-09-19 09:30:00	pinnacle	1
2008893805	baseball	Settled	Win	A11 Bets	10	8.57	-117	t	Parlay	SSG Landers (-340)	2024-09-19 04:40:00	2024-09-19 13:25:00	pinnacle	1
2008818486	tennis	Settled	Loss	Analytics Capper	20	20.2	101	f	Xinyu Gao  vs Arianne Hartono	Xinyu Gao (Sets)	2024-09-18 20:13:00	2024-09-19 14:58:00	pinnacle	1
2009014178	baseball	Settled	Win	A11 Bets	10	6.41	-156	f	San Francisco Giants vs Baltimore Orioles	Baltimore Orioles	2024-09-19 16:43:00	2024-09-19 17:05:00	pinnacle	1
2009033365	soccer	Settled	Loss	A11 Bets	10	8.62	-116	f	Atalanta vs Arsenal	Arsenal	2024-09-19 17:39:00	2024-09-19 19:00:00	pinnacle	1
2009033364	soccer	Settled	Loss	A11 Bets	10	6.76	-148	f	Monaco vs Barcelona	Barcelona	2024-09-19 17:39:00	2024-09-19 19:00:00	pinnacle	1
2009033363	soccer	Settled	Win	A11 Bets	10	7.41	-135	f	Atletico Madrid vs RB Leipzig	Atletico Madrid	2024-09-19 17:39:00	2024-09-19 19:00:00	pinnacle	1
2009027964	baseball	Settled	Loss	Matt Severance	20	16.67	-120	f	Los Angeles Dodgers vs Miami Marlins	Under 8.5	2024-09-19 17:24:00	2024-09-19 20:40:00	pinnacle	1
2009028381	baseball	Settled	Win	Zack Cimini	20	16.81	-119	f	Arizona Diamondbacks vs Milwaukee Brewers	Arizona Diamondbacks	2024-09-19 17:25:00	2024-09-19 23:15:00	pinnacle	1
2009028201	baseball	Settled	Loss	Zack Cimini	20	25	125	f	Philadelphia Phillies vs New York Mets	Philadelphia Phillies	2024-09-19 17:25:00	2024-09-19 23:15:00	pinnacle	1
2009028609	baseball	Settled	Refunded	Matt Snyder	20	17.39	-115	f	Washington Nationals vs Chicago Cubs	Chicago Cubs -1.0	2024-09-19 17:25:00	2024-09-19 23:40:00	pinnacle	1
2009029977	football	Settled	Win	Jimmie Kaylor	20	20.4	102	f	New England Patriots vs New York Jets	New York Jets -6.5	2024-09-19 17:30:00	2024-09-20 00:15:00	pinnacle	1
2008891024	tennis	Settled	Win	Value Hunter	30	23.81	-126	f	Rinky Hijikata vs Damir Dzumhur	Rinky Hijikata (Sets)	2024-09-19 04:16:00	2024-09-19 04:45:00	pinnacle	1
2008813802	tennis	Settled	Win	Sopranos Picks	20	25.2	126	f	Diana Shnaider vs Marta Kostyuk	Diana Shnaider (Sets)	2024-09-18 19:53:00	2024-09-21 06:02:00	pinnacle	1
bet365_30	football	Settled	Loss	ChefsBestBets	20	15.38	-130	\N	WAS Nationals @ CHI Chubs	Javier Assad - Under 4.5 Strikeouts	\N	2024-09-19 17:53:00	Bet365	1
bet365_31	baseball	Settled	Win	ChefsBestBets	20	20.27	102	\N	2 legs parlay	Eflin BAL - Under 1.5 walks, Gilbert SEA - Under 2.5 walks	\N	2024-09-19 17:54:00	Bet365	1
bet365_32	football	Settled	Win	Icy Plays	10	14	140	\N	4 legs safety bet SGP - Patriots @ Jets 	Jets ML, Hall 4+ Receps., Williams 4+ receps., Rodgers 1+ TD pass	\N	2024-09-20 00:10:00	Pinnacle	1
bet365_33	table tennis	Settled	Loss	newms	20	27	137	\N	Krzysztof Kapik vs Krzysztof Wloczko	Krzysztof Kapik	\N	2024-09-19 22:11:00	Bet365	1
bet365_34	table tennis	Settled	Loss	newms	20	18.18	-110	\N	Krzysztof Kapik vs Karol Wisniewski	Karol Wisniewski	\N	2024-09-19 23:05:00	Pinnacle	1
bet365_35	football	Settled	Win	Super Boost	8	20	250	\N	Patriots @ Jets	Garrett Wilson anytime TD	\N	2024-09-19 23:07:00	Bet365	1
bet365_38	table tennis	Settled	Win	newms	20	16.66	-120	\N	Jaroslaw Rolak vs Bartlomiej Wisniewski	Bartlomiej Wisniewski	\N	2024-09-19 23:47:00	Bet365	1
2009109992	tennis	Settled	Loss	TennisWinnersOnly	40	31.5	-127	f	Daria Kasatkina vs Emma Raducanu	Emma Raducanu (Sets)	2024-09-19 23:49:00	2024-09-21 05:10:00	pinnacle	1
bet99_16	table tennis	Settled	Loss	newms	20	35	175	\N	Pawel Polanski vs Dariusz Scigany	Pawel Polanski	\N	2024-09-19 20:31:00	Bet99	1
bet365_39	table tennis	Settled	Win	newms	20	16	-125	\N	Krzysztof Kotyl vs Bartlomiej Wisniewski	Krzysztof Kotyl	\N	2024-09-20 01:18:00	Bet365	1
bet99_17	table tennis	Settled	Loss	marshy	15	12	-125	\N	Kotyl, Krzysztof vs Rolak, Jaroslaw	Over 74.5	\N	2024-09-20 03:11:00	Bet99	1
bet99_18	table tennis	Settled	Win	marshy	20	16	-125	\N	Fabis, Adrian vs Trela, Mateusz	over 74.5	\N	2024-09-20 03:03:00	Bet99	1
2009088988	baseball	Settled	Win	Wager Analyst	30	19.23	-156	f	Philadelphia Phillies vs New York Mets	New York Mets  0	2024-09-19 21:10:00	2024-09-19 23:15:00	pinnacle	1
2009082247	football	Settled	Win	Sharp Sheet	20	19.05	-105	f	New England Patriots vs New York Jets	Under 38.5	2024-09-19 20:30:00	2024-09-20 00:15:00	pinnacle	1
2009253764	football	Settled	Win	Micah Roberts	10	9.71	-103	f	Illinois vs Nebraska	Over 42.5	2024-09-20 15:12:00	2024-09-21 00:00:00	pinnacle	1
2009351416	football	Settled	Win	Sharp Sheet	30	28.3	-106	f	San Jose State vs Washington State	San Jose State +13.0	2024-09-20 19:31:00	2024-09-21 02:00:00	pinnacle	1
2009253453	football	Settled	Loss	Micah Roberts	20	19.05	-105	f	Stanford vs Syracuse	Syracuse -8.5	2024-09-20 15:11:00	2024-09-20 23:30:00	pinnacle	1
2009082307	football	Settled	Loss	Sharp Sheet	10	9.26	-108	f	South Alabama vs Appalachian State	Over 62.5	2024-09-19 20:30:00	2024-09-19 23:30:00	pinnacle	1
2009253786	football	Settled	Win	Jimmie Kaylor	10	9.71	-103	f	Illinois vs Nebraska	Over 42.5	2024-09-20 15:12:00	2024-09-21 00:00:00	pinnacle	1
bet99_20	baseball	Settled	Loss	Matt Severance	20	11.76	-170	\N	Giants @ Royals	Royals ML	\N	2024-09-21 00:09:00	Bet99	1
2009109917	tennis	Settled	Win	TennisWinnersOnly	40	40.8	102	f	Giovanni Mpetshi Perricard vs Yannick Hanfmann	Yannick Hanfmann (Sets)	2024-09-19 23:49:00	2024-09-20 07:15:00	pinnacle	1
2009144967	baseball	Settled	Refunded	DirtyBubbleBets	40	30.77	-130	f	Kiwoom Heroes vs SSG Landers	Kiwoom Heroes	2024-09-20 04:18:00	2024-09-20 09:30:00	pinnacle	1
2009109940	tennis	Settled	Loss	TennisWinnersOnly	20	20.4	102	f	Nicolas Jarry vs Lukas Klein	Lukas Klein (Sets)	2024-09-19 23:49:00	2024-09-20 09:15:00	pinnacle	1
2009145003	baseball	Settled	Refunded	DirtyBubbleBets	20	15.75	-127	f	Lotte Giants vs NC Dinos	NC Dinos +0.5	2024-09-20 04:18:00	2024-09-20 09:30:00	pinnacle	1
2009145042	tennis	Settled	Win	OutofLineBets	20	16.53	-121	f	Stefano Travaglia  vs Cezar Cretu	Cezar Cretu (Games) +3.0	2024-09-20 04:19:00	2024-09-20 12:30:00	pinnacle	1
2009144981	baseball	Settled	Refunded	DirtyBubbleBets	20	15.27	-131	f	Doosan Bears vs LG Twins	LG Twins	2024-09-20 04:18:00	2024-09-20 09:30:00	pinnacle	1
2009215172	tennis	Settled	Loss	A11 Bets	10	8.55	-117	f	Daria Kasatkina vs Emma Raducanu	Emma Raducanu (Sets)	2024-09-20 12:32:00	2024-09-21 05:10:00	pinnacle	1
2009110028	tennis	Settled	Loss	TennisWinnersOnly	20	19.23	-104	f	Rebeka Masarova vs Laura Siegemund	Rebeka Masarova (Sets)	2024-09-19 23:49:00	2024-09-20 14:45:00	pinnacle	1
bet99_19	baseball	Settled	Win	Alex Selesnick	30	28.57	-105	\N	Phillies @ Mets	David Peterson Under 17.5 outs	\N	2024-09-20 23:04:00	Bet99	1
2009307617	baseball	Settled	Win	Matt Severance	20	12.58	-159	f	Washington Nationals vs Chicago Cubs	Chicago Cubs	2024-09-20 17:50:00	2024-09-20 18:20:00	pinnacle	1
2009253228	baseball	Settled	Loss	Matt Snyder	20	18.02	-111	f	Chicago White Sox vs San Diego Padres	San Diego Padres -1.5	2024-09-20 15:10:00	2024-09-21 01:40:00	pinnacle	1
2008551472	tennis	Settled	Win	Sopranos Picks	20	19.42	-103	f	Mai Hontama  vs Lanlana Tararudee	Over 21.5 (Games)	2024-09-17 22:13:00	2024-09-19 04:00:00	pinnacle	1
2008861398	tennis	Settled	Loss	TennisWinnersOnly	20	20.6	103	f	Mai Hontama vs Lanlana Tararudee	Lanlana Tararudee (Sets)	2024-09-19 01:06:00	2024-09-19 04:00:00	pinnacle	1
2009035008	football	Settled	Win	A11 Bets	31	20.38	-153	t	Parlay	Washington State (-489)	2024-09-19 17:45:00	2024-09-21 06:42:00	pinnacle	1
2009019308	tennis	Settled	Loss	The Gambling Gatsby	20	22.6	113	f	Kyle Edmund  vs Dominic Stricker	Dominic Stricker (Games) -3.0	2024-09-19 17:00:00	2024-09-19 17:15:00	pinnacle	1
2009052360	tennis	Settled	Loss	Sopranos Picks	20	20.8	104	f	Alexis Galarneau  vs Ernesto Escobedo	Alexis Galarneau (Sets)	2024-09-19 18:38:00	2024-09-19 19:00:00	pinnacle	1
2009033524	soccer	Settled	Loss	A11 Bets	4.5	19.94	443	t	Parlay	Arsenal (-116)	2024-09-19 17:40:00	2024-09-19 20:53:00	pinnacle	1
2009082274	baseball	Settled	Win	Sharp Sheet	10	8.47	-118	f	Arizona Diamondbacks vs Milwaukee Brewers	Arizona Diamondbacks	2024-09-19 20:30:00	2024-09-19 23:15:00	pinnacle	1
2009136289	tennis	Settled	Loss	Tennis With T	5	24.5	490	t	Parlay	Taro Daniel (Sets) (-152)	2024-09-20 02:45:00	2024-09-20 06:34:00	pinnacle	1
bet365_40	baseball	Settled	Loss	Matt Snyder	20	18.18	-110	\N	Mariners @ Rangers	Jake deGrom Over 6.5 strikeouts	\N	2024-09-21 00:06:00	Bet365	1
2010269897	tennis	Settled	Win	OutofLineBets	30	29.7	-101	f	Otto Virtanen  vs Christopher O'connell	Christopher O'connell (Games) -3.0	2024-09-22 23:56:00	2024-09-23 06:00:00	pinnacle	1
2010217828	football	Settled	Loss	A11 Bets	20	23.4	117	t	Parlay	Cincinnati Bengals (-331)	2024-09-22 19:41:00	2024-09-24 03:02:00	pinnacle	1
bet365_47	football	Settled	Loss	Super Boost	80	80	100	\N	Chiefs @ Falcons - 2 legs parlay	Rice 50 rec. yards & Robinson 50 rush. yards	\N	2024-09-23 00:36:00	Bet365	1
2009383935	baseball	Settled	Win	Wager Analyst	20	17.39	-115	f	Colorado Rockies vs Los Angeles Dodgers	Los Angeles Dodgers -1.5	2024-09-20 22:08:00	2024-09-21 02:10:00	pinnacle	1
1992663681	baseball	Settled	Loss	The New Kid	60	46.88	-128	f	San Francisco Giants vs Los Angeles Dodgers	Over 7.5	2024-07-23 01:24:00	2024-07-23 02:10:00	pinnacle	1
2009383934	baseball	Settled	Loss	Wager Analyst	20	17.7	-113	f	Chicago White Sox vs San Diego Padres	San Diego Padres -1.5	2024-09-20 22:08:00	2024-09-21 01:40:00	pinnacle	1
2009351823	baseball	Settled	Win	Sharp Sheet	10	8.93	-112	f	Chicago White Sox vs San Diego Padres	Under 7	2024-09-20 19:32:00	2024-09-21 01:40:00	pinnacle	1
2009873382	baseball	Settled	Loss	A11 Bets	20	14.39	-139	f	Lotte Giants vs Hanwha Eagles	Lotte Giants	2024-09-22 03:28:00	2024-09-22 05:00:00	pinnacle	1
2009378050	tennis	Settled	Loss	Value Hunter	20	16.53	-121	f	Juan Bautista Torres  vs Juan Pablo Ficovich	Juan Bautista Torres (Sets)	2024-09-20 21:14:00	2024-09-20 21:00:00	pinnacle	1
2009389439	baseball	Settled	Win	A11 Bets	10	9.26	-108	f	Detroit Tigers vs Baltimore Orioles	Baltimore Orioles -1.0	2024-09-20 22:56:00	2024-09-20 23:05:00	pinnacle	1
2009383936	baseball	Settled	Loss	Wager Analyst	20	28	140	f	Detroit Tigers vs Baltimore Orioles	Detroit Tigers	2024-09-20 22:08:00	2024-09-20 23:05:00	pinnacle	1
2009389441	baseball	Settled	Win	A11 Bets	10	11.2	112	f	Seattle Mariners vs Texas Rangers	Seattle Mariners	2024-09-20 22:56:00	2024-09-21 00:05:00	pinnacle	1
2009389511	baseball	Settled	Loss	A11 Bets	5	60.41	1208	t	Parlay	New York Yankees (-196)	2024-09-20 22:57:00	2024-09-21 02:57:00	pinnacle	1
2009389476	football	Settled	Loss	A11 Bets	10	6.41	-157	t	Parlay	Missouri (-1335)	2024-09-20 22:56:00	2024-09-21 02:57:00	pinnacle	1
2009383933	baseball	Settled	Loss	Wager Analyst	20	22.4	112	f	San Francisco Giants vs Kansas City Royals	Kansas City Royals -1.5	2024-09-20 22:08:00	2024-09-21 00:10:00	pinnacle	1
2009847610	tennis	Settled	Win	TennisWinnersOnly	40	32	-125	f	Daria Kasatkina vs Beatriz Haddad Maia	Beatriz Haddad Maia (Sets)	2024-09-22 00:47:00	2024-09-22 07:08:00	pinnacle	1
2009847673	tennis	Settled	Loss	TennisWinnersOnly	20	15.38	-130	f	Laura Siegemund vs Rebecca Sramkova	Laura Siegemund (Sets)	2024-09-22 00:47:00	2024-09-22 09:09:00	pinnacle	1
2009847371	tennis	Settled	Win	TennisWinnersOnly	40	34.48	-116	f	Yannick Hanfmann vs Pedro Martinez	Yannick Hanfmann (Sets)	2024-09-22 00:45:00	2024-09-22 10:00:00	pinnacle	1
2009847587	tennis	Settled	Win	TennisWinnersOnly	20	18.92	-106	t	Parlay	Bu Yunchaokete (Sets) (-170)	2024-09-22 00:47:00	2024-09-22 12:09:00	pinnacle	1
2010217622	football	Settled	Win	A11 Bets	30	25.21	-119	f	Baltimore Ravens vs Dallas Cowboys	Baltimore Ravens	2024-09-22 19:40:00	2024-09-22 20:25:00	pinnacle	1
2009829025	football	Settled	Loss	A11 Bets	10	11.3	113	f	Purdue vs Oregon State	Purdue	2024-09-21 22:42:00	2024-09-22 00:30:00	pinnacle	1
2009847405	tennis	Settled	Loss	TennisWinnersOnly	20	16.81	-119	f	Nicolas Jarry  vs Alibek Kachmazov	Over 23 (Games)	2024-09-22 00:45:00	2024-09-22 05:10:00	pinnacle	1
2009841222	tennis	Settled	Win	OutofLineBets	30	27.27	-110	f	Nicolas Jarry  vs Alibek Kachmazov	Alibek Kachmazov (Games) +2.0	2024-09-22 00:08:00	2024-09-22 05:10:00	pinnacle	1
2009873399	baseball	Settled	Win	Me	20	16.81	-119	f	Doosan Bears vs LG Twins	LG Twins	2024-09-22 03:28:00	2024-09-22 05:00:00	pinnacle	1
2010269832	football	Settled	Loss	OutofLineBets	30	23.44	-128	f	Kansas City Chiefs vs Atlanta Falcons	Atlanta Falcons +3.5	2024-09-22 23:55:00	2024-09-23 00:20:00	pinnacle	1
2010270911	football	Settled	Win	TTW	10	8.85	-113	f	Bijan Robinson (Anytime TD)	Yes	2024-09-23 00:04:00	2024-09-23 00:20:00	pinnacle	1
2010270929	football	Settled	Loss	TTW	10	14.2	142	f	Carson Steele (Anytime TD)	Yes	2024-09-23 00:04:00	2024-09-23 00:20:00	pinnacle	1
2009641481	football	Settled	Win	Emory Hunt	20	19.61	-102	f	Tennessee vs Oklahoma	Tennessee -6.5	2024-09-21 14:53:00	2024-09-21 23:30:00	pinnacle	1
2009425048	tennis	Settled	Loss	Tennis With T	10	34.1	341	t	Parlay	Yoshihito Nishioka (Sets) (-160)	2024-09-21 03:34:00	2024-09-21 06:52:00	pinnacle	1
2009403614	tennis	Settled	Loss	OutofLineBets	5	24.55	491	f	Yi Zhou vs Adrian Mannarino	Yi Zhou (Sets)	2024-09-21 00:54:00	2024-09-21 05:15:00	pinnacle	1
2009403598	tennis	Settled	Win	OutofLineBets	20	17.09	-117	f	Yi Zhou  vs Adrian Mannarino	Yi Zhou (Games) +5.0	2024-09-21 00:54:00	2024-09-21 05:15:00	pinnacle	1
2009637251	football	Settled	Win	Picks Office	20	19.05	-105	f	Rutgers vs Virginia Tech	Rutgers +3.0	2024-09-21 14:45:00	2024-09-21 19:30:00	pinnacle	1
2009874116	baseball	Settled	Loss	A11 Bets	20	12.99	-154	f	SSG Landers vs KT Wiz	KT Wiz	2024-09-22 03:35:00	2024-09-22 05:00:00	pinnacle	1
2010289764	tennis	Settled	Win	TennisWinnersOnly	20	17.54	-114	f	Marin Cilic  vs Brandon Nakashima	Marin Cilic (Games) +3.0	2024-09-23 03:04:00	2024-09-23 10:00:00	pinnacle	1
2009425615	baseball	Settled	Refunded	A11 Bets	10	7.25	-138	f	Lotte Giants vs Hanwha Eagles	Lotte Giants	2024-09-21 03:39:00	2024-09-21 08:00:00	pinnacle	1
bet99_22	football - NFL	Settled	Win	Me	20	14.81	-135	\N	Cowboys @ Giants	Dak Prescott Over 1.5 TD Passes	\N	2024-09-27 00:10:00	Bet99	1
2009405227	tennis	Settled	Win	TennisWinnersOnly	40	33.33	-120	f	Lorenzo Musetti  vs Christopher O'connell	Christopher O'connell (Games) +2.5	2024-09-21 01:07:00	2024-09-21 08:30:00	pinnacle	1
2009425708	tennis	Settled	Loss	A11 Bets	20	16.7	-120	t	Parlay	Alexander Bublik (Sets) (-208)	2024-09-21 03:40:00	2024-09-21 11:48:00	pinnacle	1
2009405353	tennis	Settled	Loss	TennisWinnersOnly	20	14.81	-135	f	Zhizhen Zhang vs Mattia Bellucci	Mattia Bellucci (Sets)	2024-09-21 01:08:00	2024-09-21 12:20:00	pinnacle	1
2009405316	tennis	Settled	Win	TennisWinnersOnly	40	24.24	-165	f	Roman Safiullin vs Juncheng Shang	Juncheng Shang (Sets)	2024-09-21 01:08:00	2024-09-21 11:05:00	pinnacle	1
2009642333	tennis	Settled	Win	OutofLineBets	20	21	105	f	Nishesh Basavareddy  vs James Trotter	James Trotter (Games) +3.0	2024-09-21 14:55:00	2024-09-21 15:30:00	pinnacle	1
2009642068	football	Settled	Loss	OutofLineBets	30	25.86	-116	f	Rice vs Army	Rice +7.5	2024-09-21 14:54:00	2024-09-21 16:00:00	pinnacle	1
2009674135	football	Settled	Loss	Wager Analyst	30	30.3	101	f	Kansas vs West Virginia	Kansas	2024-09-21 15:49:00	2024-09-21 16:00:00	pinnacle	1
2009640374	football	Settled	Loss	Emory Hunt	20	22	110	f	USC vs Michigan	USC -5.5	2024-09-21 14:51:00	2024-09-21 19:30:00	pinnacle	1
bet365_41	football	Settled	Win	A11 Bets	15	13.04	-115	\N	Charlotte @ Indiana	Indiana -24.5	\N	2024-09-21 17:23:00	Bet365	1
2009639039	baseball	Settled	Loss	Matt Severance	20	13.61	-147	f	San Francisco Giants vs Kansas City Royals	Kansas City Royals	2024-09-21 14:48:00	2024-09-21 21:10:00	pinnacle	1
2009643256	football	Settled	Win	OutofLineBets	30	26.32	-114	f	Memphis vs Navy	Navy +9.5	2024-09-21 14:56:00	2024-09-21 19:30:00	pinnacle	1
2009641167	football	Settled	Loss	Emory Hunt	20	20.6	103	f	California vs Florida State	California +2.5	2024-09-21 14:52:00	2024-09-21 23:00:00	pinnacle	1
2010289865	tennis	Settled	Loss	TennisWinnersOnly	20	17.54	-114	f	Zhizhen Zhang  vs Bu Yunchaokete	Bu Yunchaokete (Games) +2.5	2024-09-23 03:05:00	2024-09-23 12:00:00	pinnacle	1
2009637833	football	Settled	Loss	Picks Office	20	16.95	-118	f	Miami Florida vs South Florida	South Florida +17.0	2024-09-21 14:46:00	2024-09-21 23:00:00	pinnacle	1
2010485469	tennis	Settled	Loss	TTW	20	14.93	-134	f	Botic Van De Zandschulp  vs Luca Nardi	Luca Nardi (Games) +3.5	2024-09-24 02:01:00	2024-09-24 02:15:00	pinnacle	1
2010031641	football	Settled	Win	OutofLineBets	30	26.79	-112	f	New York Giants vs Cleveland Browns	Under 38.5	2024-09-22 13:30:00	2024-09-22 17:00:00	pinnacle	1
2010361285	tennis	Settled	Win	OutofLineBets	30	23.44	-128	f	Raphael Collignon  vs Gastao Elias	Raphael Collignon (Games) -4.0	2024-09-23 13:44:00	2024-09-23 15:00:00	pinnacle	1
2009643403	football	Settled	Win	OutofLineBets	30	26.55	-113	f	Florida Atlantic vs Connecticut	Connecticut	2024-09-21 14:57:00	2024-09-21 23:00:00	pinnacle	1
2010488661	tennis	Settled	Win	OutofLineBets	20	17.86	-112	f	Lorenzo Musetti  vs Juncheng Shang	Juncheng Shang (Games) +1.0	2024-09-24 02:37:00	2024-09-24 11:30:00	pinnacle	1
2010564761	basketball	Settled	Loss	A11 Bets	20	16.24	-124	t	Parlay	Hapoel Tel Aviv (-191)	2024-09-24 13:12:00	2024-09-24 20:34:00	pinnacle	1
2010499326	tennis	Settled	Loss	A11 Bets	40	30.77	-130	f	Marin Cilic vs Zhizhen Zhang	Zhizhen Zhang (Sets)	2024-09-24 04:36:00	2024-09-24 12:00:00	pinnacle	1
2010565847	baseball	Settled	Loss	Matt Severance	13	21.41	164	t	Parlay	New York Yankees (-150)	2024-09-24 13:18:00	2024-09-25 02:25:00	pinnacle	1
2010486108	tennis	Settled	Win	TTW	20	21.4	107	f	Lorenzo Musetti vs Juncheng Shang	Juncheng Shang (Sets)	2024-09-24 02:11:00	2024-09-24 11:30:00	pinnacle	1
2009109979	tennis	Settled	Win	TennisWinnersOnly	20	25.6	128	f	Mikhail Kukushkin vs Alexander Shevchenko	Mikhail Kukushkin (Sets)	2024-09-19 23:49:00	2024-09-20 05:40:00	pinnacle	1
2009389440	baseball	Settled	Win	A11 Bets	10	8.85	-113	f	Philadelphia Phillies vs New York Mets	Philadelphia Phillies	2024-09-20 22:56:00	2024-09-20 23:10:00	pinnacle	1
2009388973	baseball	Settled	Win	OutofLineBets	20	17.7	-113	f	Philadelphia Phillies vs New York Mets	Philadelphia Phillies	2024-09-20 22:52:00	2024-09-20 23:10:00	pinnacle	1
2010044002	football	Settled	Loss	Alex Selesnick	20	19.05	-105	f	Malik Willis (Passing Yards)	Under 146.5 Passing Yards	2024-09-22 13:52:00	2024-09-22 17:00:00	pinnacle	1
2010049926	football	Settled	Win	Jason La Canfora	20	17.7	-113	f	Baltimore Ravens vs Dallas Cowboys	Baltimore Ravens	2024-09-22 14:07:00	2024-09-22 20:25:00	pinnacle	1
2010127849	football	Settled	Loss	Sharp Sheet	20	18.18	-110	f	Kansas City Chiefs vs Atlanta Falcons	Atlanta Falcons +3.0	2024-09-22 16:27:00	2024-09-23 00:20:00	pinnacle	1
2010054147	football	Settled	Win	Jason La Canfora	20	18.52	-108	f	Kansas City Chiefs vs Atlanta Falcons	Under 46.5	2024-09-22 14:14:00	2024-09-23 00:20:00	pinnacle	1
2010045167	football	Settled	Loss	Jason La Canfora	10	23.5	235	f	Brock Bowers (Anytime TD)	Yes +0.5 Touchdowns	2024-09-22 13:56:00	2024-09-22 20:05:00	pinnacle	1
2010048067	football	Settled	Win	Alex Selesnick	20	19.05	-105	f	Marvin Harrison Jr. (Receiving Yards)	Over 60.5 Receiving Yards	2024-09-22 14:03:00	2024-09-22 20:25:00	pinnacle	1
2010081033	tennis	Settled	Win	OutofLineBets	20	15.04	-133	f	Trey Hilderbrand vs Christian Langmo	Trey Hilderbrand (Sets)	2024-09-22 15:04:00	2024-09-22 16:15:00	pinnacle	1
2009786673	football	Settled	Win	TTW	15	18	120	f	Arkansas vs Auburn	Arkansas	2024-09-21 19:37:00	2024-09-21 19:30:00	pinnacle	1
2009716779	football	Settled	Win	Sharp Sheet	30	29.41	-102	f	Georgia Tech vs Louisville	Louisville -9.0	2024-09-21 17:10:00	2024-09-21 19:30:00	pinnacle	1
2009716255	football	Settled	Win	Sharp Sheet	40	31.25	-128	f	Memphis vs Navy	Navy +10.0	2024-09-21 17:09:00	2024-09-21 19:30:00	pinnacle	1
2009804825	baseball	Settled	Win	OutofLineBets	20	18.69	-107	f	Seattle Mariners vs Texas Rangers	Seattle Mariners	2024-09-21 20:25:00	2024-09-21 23:05:00	pinnacle	1
2010855759	baseball	Settled	Win	Matt Severance	20	14.93	-134	f	Seattle Mariners vs Houston Astros	Seattle Mariners	2024-09-25 14:22:00	2024-09-25 18:10:00	pinnacle	1
2010741935	tennis	Settled	Refunded	TTW	15	17.7	118	f	Amanda Anisimova vs Xinyu Wang	Xinyu Wang (Sets)	2024-09-25 02:53:00	2024-09-25 04:30:00	pinnacle	1
2010851647	baseball	Settled	Refunded	A11 Bets	10	15.4	154	f	New York Mets vs Atlanta Braves	New York Mets	2024-09-25 14:10:00	2024-09-25 23:20:00	pinnacle	1
2010707486	tennis	Settled	Refunded	OutofLineBets	30	26.09	-115	f	Marcos Giron  vs Hubert Hurkacz	Marcos Giron (Games) +3.0	2024-09-24 22:11:00	2024-09-25 07:10:00	pinnacle	1
2010733380	tennis	Settled	Win	TennisWinnersOnly	40	37.38	-107	f	Botic Van De Zandschulp vs Matteo Berrettini	Matteo Berrettini (Sets) -1.5	2024-09-25 01:39:00	2024-09-25 05:10:00	pinnacle	1
2010487204	tennis	Settled	Win	A11 Bets	20	16.65	-121	t	Parlay	Ugo Humbert + Alex Michelsen	2024-09-24 02:22:00	2024-09-25 11:08:00	pinnacle	1
2009717046	football	Settled	Loss	Sharp Sheet	20	16.95	-118	f	Miami Florida vs South Florida	South Florida +17.0	2024-09-21 17:10:00	2024-09-21 23:00:00	pinnacle	1
bet365_45	football	Settled	Loss	A11 Bets	20	13.17	-154	\N	NFL - 2 legs parlay	Eagles +10.5 & Dolphins +10.5	\N	2024-09-22 17:02:00	Bet365	1
2010404190	tennis	Settled	Win	OutofLineBets	20	18.02	-111	f	Aidan Mayo  vs Remy Bertola	Remy Bertola (Games) +2.0	2024-09-23 17:28:00	2024-09-23 18:55:00	pinnacle	1
2010431038	baseball	Settled	Win	Sharp Sheet	10	10.8	108	f	Boston Red Sox vs Toronto Blue Jays	Under 8	2024-09-23 19:14:00	2024-09-23 23:07:00	pinnacle	1
2010403749	football	Settled	Loss	A11 Bets	30	18.56	-162	t	Parlay	Jacksonville Jaguars +14.5 (-407)	2024-09-23 17:27:00	2024-09-24 02:34:00	pinnacle	1
2010131440	football	Settled	Loss	A11 Bets	20	17.61	-114	t	Parlay	Cleveland Browns (-277)	2024-09-22 16:33:00	2024-09-22 20:09:00	pinnacle	1
2010458388	football	Settled	Loss	OutofLineBets	20	18.52	-108	f	Jacksonville Jaguars vs Buffalo Bills	Jacksonville Jaguars +4.5	2024-09-23 22:30:00	2024-09-23 23:35:00	pinnacle	1
2010430982	football	Settled	Loss	Sharp Sheet	40	34.19	-117	f	Jacksonville Jaguars vs Buffalo Bills	Jacksonville Jaguars +5.5	2024-09-23 19:13:00	2024-09-23 23:35:00	pinnacle	1
2010403898	football	Settled	Loss	A11 Bets	5	10.5	210	f	Jacksonville Jaguars vs Buffalo Bills	Jacksonville Jaguars	2024-09-23 17:27:00	2024-09-23 23:35:00	pinnacle	1
2010483816	tennis	Settled	Loss	TennisWinnersOnly	20	18.35	-109	f	Rebecca Sramkova vs Polina Kudermetova	Polina Kudermetova (Sets)	2024-09-24 01:45:00	2024-09-24 05:45:00	pinnacle	1
2010404084	tennis	Settled	Win	OutofLineBets	30	24.19	-124	f	Taro Daniel  vs Christopher O'connell	Christopher O'connell (Games) -2.5	2024-09-23 17:28:00	2024-09-24 02:05:00	pinnacle	1
2010483745	tennis	Settled	Loss	TennisWinnersOnly	20	23.8	119	f	Corentin Moutet vs Alexander Shevchenko	Alexander Shevchenko (Sets)	2024-09-24 01:44:00	2024-09-24 04:30:00	pinnacle	1
2010483641	tennis	Settled	Win	TennisWinnersOnly	40	42.8	107	f	Lorenzo Musetti vs Juncheng Shang	Juncheng Shang (Sets)	2024-09-24 01:43:00	2024-09-24 11:30:00	pinnacle	1
2010403829	football	Settled	Loss	A11 Bets	10	12.2	122	f	Travis Etienne Jr. (Anytime TD)	Yes +0.5 Touchdowns	2024-09-23 17:27:00	2024-09-23 23:30:00	pinnacle	1
2010483725	tennis	Settled	Win	TennisWinnersOnly	20	17.54	-114	f	Marin Cilic  vs Zhizhen Zhang	Over 23 (Games)	2024-09-24 01:44:00	2024-09-24 12:00:00	pinnacle	1
bet365_48	hockey	Settled	Win	Me	20	31	155	\N	Devils @ Canadiens	Canadiens -1.5	\N	2024-09-24 23:07:00	Bet365	1
2010447668	tennis	Settled	Win	Tennis Titan	25	19.08	-131	f	Marin Cilic  vs Zhizhen Zhang	Over 22.5 (Games)	2024-09-23 20:42:00	2024-09-24 12:00:00	pinnacle	1
2010632696	basketball	Settled	Win	A11 Bets	10	8.55	-117	f	Turk Telekom vs BC Lietkabelis	BC Lietkabelis +6.5	2024-09-24 17:53:00	2024-09-24 16:30:00	pinnacle	1
2010633611	hockey	Settled	Win	Me	50	32.26	-155	f	New Jersey Devils vs Montreal Canadiens	Montreal Canadiens	2024-09-24 17:56:00	2024-09-24 23:05:00	pinnacle	1
2010651486	baseball	Settled	Loss	OutofLineBets	20	18.35	-109	f	Los Angeles Angels vs Chicago White Sox	Los Angeles Angels	2024-09-24 18:41:00	2024-09-24 23:40:00	pinnacle	1
2010483787	tennis	Settled	Win	TennisWinnersOnly	20	18.18	-110	f	Arina Rodionova vs Mai Hontama	Arina Rodionova (Sets)	2024-09-24 01:45:00	2024-09-24 04:24:00	pinnacle	1
2010733507	tennis	Settled	Win	TennisWinnersOnly	20	15.38	-130	f	Varvara Gracheva vs Hailey Baptiste	Hailey Baptiste (Sets)	2024-09-25 01:40:00	2024-09-25 11:29:00	pinnacle	1
2010875460	tennis	Settled	Win	Tennis Titan	25	20	-125	f	Gregoire Barrere  vs Pierre-Hugues Herbert	Over 22.5 (Games)	2024-09-25 15:27:00	2024-09-25 16:45:00	pinnacle	1
2011045905	tennis	Settled	Win	A11 Bets	20	13.98	-144	t	Parlay	Holger Rune + Carlos Alcaraz	2024-09-26 03:06:00	2024-09-27 08:32:00	pinnacle	1
2010912489	tennis	Settled	Win	OutofLineBets	20	14.39	-139	f	Alexander Blockx  vs Denis Shapovalov	Alexander Blockx (Games) +4.5	2024-09-25 17:14:00	2024-09-25 18:45:00	pinnacle	1
2010913268	baseball	Settled	Win	A11 Bets	10	7.19	-139	f	Seattle Mariners vs Houston Astros	Seattle Mariners	2024-09-25 17:15:00	2024-09-25 18:10:00	pinnacle	1
2010851615	baseball	Settled	Loss	A11 Bets	20	22.4	112	f	Tampa Bay Rays vs Detroit Tigers	Tampa Bay Rays	2024-09-25 14:09:00	2024-09-25 22:40:00	pinnacle	1
2010855673	baseball	Settled	Win	Matt Severance	40	23.12	-173	f	Miami Marlins vs Minnesota Twins	Minnesota Twins	2024-09-25 14:22:00	2024-09-25 23:40:00	pinnacle	1
2010995187	basketball	Settled	Loss	Sharp Sheet	20	19.42	-103	f	Phoenix Mercury vs Minnesota Lynx	Under 81.5	2024-09-25 20:57:00	2024-09-26 01:41:00	pinnacle	1
2010995216	baseball	Settled	Loss	Sharp Sheet	10	11.4	114	f	St. Louis Cardinals vs Colorado Rockies	Colorado Rockies	2024-09-25 20:58:00	2024-09-26 00:40:00	pinnacle	1
2010994148	tennis	Settled	Win	OutofLineBets	20	19.42	-103	f	Yi Zhou  vs Pavel Kotov	Yi Zhou (Games) +4.5	2024-09-25 20:47:00	2024-09-26 05:20:00	pinnacle	1
2011049029	tennis	Settled	Win	Tennis Zeus	20	14.49	-138	f	Anna Blinkova  vs Karolina Muchova	Under 18.5 (Games)	2024-09-26 03:31:00	2024-09-26 10:37:00	pinnacle	1
2011130231	tennis	Settled	Loss	A11 Bets	10	10.2	102	f	Alexander Bublik vs Flavio Cobolli	Alexander Bublik (Sets)	2024-09-26 12:59:00	2024-09-26 14:00:00	pinnacle	1
2011045796	tennis	Settled	Win	OutofLineBets	30	23.81	-126	f	Nishesh Basavareddy  vs Ethan Quinn	Nishesh Basavareddy (Games) -2.0	2024-09-26 03:05:00	2024-09-27 21:20:00	pinnacle	1
2011083865	baseball	Settled	Win	A11 Bets	40	33.33	-120	f	SSG Landers vs NC Dinos	SSG Landers	2024-09-26 08:57:00	2024-09-26 09:30:00	pinnacle	1
2011002462	baseball	Settled	Loss	A11 Bets	15	16.95	113	f	San Diego Padres vs Los Angeles Dodgers	San Diego Padres	2024-09-25 21:52:00	2024-09-26 02:10:00	pinnacle	1
2010707565	tennis	Settled	Win	OutofLineBets	20	16	-125	f	Arthur Rinderknech vs Jakub Mensik	Jakub Mensik (Sets)	2024-09-24 22:12:00	2024-09-25 03:15:00	pinnacle	1
2011002403	baseball	Settled	Win	A11 Bets	10	12.47	124	t	Parlay	Minnesota Twins + Arizona Diamondbacks	2024-09-25 21:51:00	2024-09-26 04:28:00	pinnacle	1
2010994087	tennis	Settled	Win	OutofLineBets	30	26.32	-114	f	Felix Auger Aliassime  vs Yoshihito Nishioka	Yoshihito Nishioka (Games) +3.5	2024-09-25 20:47:00	2024-09-26 02:05:00	pinnacle	1
2010733433	tennis	Settled	Win	TennisWinnersOnly	20	14.08	-142	f	Roberto Carballes Baena vs Pavel Kotov	Pavel Kotov (Sets)	2024-09-25 01:39:00	2024-09-25 03:15:00	pinnacle	1
2011045651	tennis	Settled	Loss	TennisWinnersOnly	20	17.95	-112	t	Parlay	Elisabetta Cocciaretto + Xiyu Wang	2024-09-26 03:04:00	2024-09-26 08:09:00	pinnacle	1
2011130204	tennis	Settled	Loss	A11 Bets	10	6.94	-144	f	Casper Ruud vs Jordan Thompson	Casper Ruud (Sets)	2024-09-26 12:58:00	2024-09-26 13:15:00	pinnacle	1
2011045354	tennis	Settled	Loss	TennisWinnersOnly	20	18.87	-106	f	Alexander Bublik vs Flavio Cobolli	Alexander Bublik (Sets)	2024-09-26 03:02:00	2024-09-26 14:00:00	pinnacle	1
2011048988	tennis	Settled	Refunded	Tennis Zeus	20	18.69	-107	f	Goncalo Oliveira  vs Gabriel Diallo	Under 21 (Games)	2024-09-26 03:31:00	2024-09-26 04:30:00	pinnacle	1
2011049167	tennis	Settled	Loss	Tennis With T	5	68.77	1375	t	Parlay	Holger Rune + Kei Nishikori + Arthur Fils +1.5 + Stefanos Tsitsipas + Christopher O'connell	2024-09-26 03:32:00	2024-09-26 05:34:00	pinnacle	1
2011045883	tennis	Settled	Loss	A11 Bets	20	14.79	-136	t	Parlay	Carlos Alcaraz + Stefanos Tsitsipas	2024-09-26 03:06:00	2024-09-26 05:34:00	pinnacle	1
2011045853	tennis	Settled	Loss	A11 Bets	10	16.1	161	f	Alex Michelsen vs Stefanos Tsitsipas	Stefanos Tsitsipas (Sets) -1.5	2024-09-26 03:06:00	2024-09-26 04:00:00	pinnacle	1
2011046083	tennis	Settled	Loss	A11 Bets	15	15.27	101	t	Parlay	Alexei Popyrin + Casper Ruud +1.5	2024-09-26 03:07:00	2024-09-26 06:19:00	pinnacle	1
2011045297	tennis	Settled	Win	TennisWinnersOnly	20	18.35	-109	f	Alexei Popyrin  vs Tomas Machac	Tomas Machac (Games) +2.5	2024-09-26 03:02:00	2024-09-26 03:40:00	pinnacle	1
2011053824	tennis	Settled	Win	TTW	20	23.8	119	f	Frances Tiafoe vs Brandon Nakashima	Brandon Nakashima (Sets)	2024-09-26 04:20:00	2024-09-26 06:15:00	pinnacle	1
2011045204	tennis	Settled	Win	TennisWinnersOnly	40	48	120	f	Frances Tiafoe vs Brandon Nakashima	Brandon Nakashima (Sets)	2024-09-26 03:01:00	2024-09-26 06:15:00	pinnacle	1
2011045966	tennis	Settled	Loss	A11 Bets	7	16.24	232	f	Reilly Opelka vs Ben Shelton	Reilly Opelka (Sets)	2024-09-26 03:07:00	2024-09-26 06:15:00	pinnacle	1
2011045152	tennis	Settled	Win	TennisWinnersOnly	40	33.9	-118	f	Tomas Martin Etcheverry vs Christopher O'connell	Christopher O'connell (Sets)	2024-09-26 03:01:00	2024-09-26 07:00:00	pinnacle	1
2011002532	baseball	Settled	Loss	A11 Bets	20	13.25	-151	f	Milwaukee Brewers vs Pittsburgh Pirates	Milwaukee Brewers	2024-09-25 21:52:00	2024-09-25 22:40:00	pinnacle	1
2011002518	baseball	Settled	Win	A11 Bets	20	15.5	-129	f	Kansas City Royals vs Washington Nationals	Kansas City Royals	2024-09-25 21:52:00	2024-09-25 22:45:00	pinnacle	1
2011002436	baseball	Settled	Win	A11 Bets	15	16.8	112	f	Baltimore Orioles vs New York Yankees	Baltimore Orioles	2024-09-25 21:52:00	2024-09-25 23:05:00	pinnacle	1
2011053868	tennis	Settled	Win	TTW	30	19.61	-153	f	Marin Cilic vs Kei Nishikori	Kei Nishikori (Sets)	2024-09-26 04:20:00	2024-09-26 10:45:00	pinnacle	1
2011083947	baseball	Settled	Win	A11 Bets	10	22.22	222	t	Parlay	Doosan Bears + SSG Landers	2024-09-26 08:57:00	2024-09-26 12:51:00	pinnacle	1
2011083917	baseball	Settled	Win	A11 Bets	20	15.15	-132	f	Doosan Bears vs Lotte Giants	Doosan Bears	2024-09-26 08:57:00	2024-09-26 09:30:00	pinnacle	1
2011045587	tennis	Settled	Loss	TennisWinnersOnly	20	18.52	-108	f	Yafan Wang  vs Ashlyn Krueger	Yafan Wang (Games) +2.5	2024-09-26 03:04:00	2024-09-26 11:08:00	pinnacle	1
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

