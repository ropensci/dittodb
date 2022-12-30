--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

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
-- Name: odbc; Type: SCHEMA; Schema: -; Owner: travis
--

CREATE SCHEMA odbc;


ALTER SCHEMA odbc OWNER TO travis;

--
-- Name: rpostgres; Type: SCHEMA; Schema: -; Owner: travis
--

CREATE SCHEMA rpostgres;


ALTER SCHEMA rpostgres OWNER TO travis;

--
-- Name: rpostgresql; Type: SCHEMA; Schema: -; Owner: travis
--

CREATE SCHEMA rpostgresql;


ALTER SCHEMA rpostgresql OWNER TO travis;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: airlines; Type: TABLE; Schema: odbc; Owner: travis
--

CREATE TABLE odbc.airlines (
    carrier text,
    name text
);


ALTER TABLE odbc.airlines OWNER TO travis;

--
-- Name: airports; Type: TABLE; Schema: odbc; Owner: travis
--

CREATE TABLE odbc.airports (
    faa text,
    name text,
    lat double precision,
    lon double precision,
    alt double precision,
    tz double precision,
    dst text,
    tzone text
);


ALTER TABLE odbc.airports OWNER TO travis;

--
-- Name: flights; Type: TABLE; Schema: odbc; Owner: travis
--

CREATE TABLE odbc.flights (
    year integer,
    month integer,
    day integer,
    dep_time integer,
    sched_dep_time integer,
    dep_delay double precision,
    arr_time integer,
    sched_arr_time integer,
    arr_delay double precision,
    carrier text,
    flight integer,
    tailnum text,
    origin text,
    dest text,
    air_time double precision,
    distance double precision,
    hour double precision,
    minute double precision,
    time_hour timestamp without time zone
);


ALTER TABLE odbc.flights OWNER TO travis;

--
-- Name: planes; Type: TABLE; Schema: odbc; Owner: travis
--

CREATE TABLE odbc.planes (
    tailnum text,
    year integer,
    type text,
    manufacturer text,
    model text,
    engines integer,
    seats integer,
    speed integer,
    engine text
);


ALTER TABLE odbc.planes OWNER TO travis;

--
-- Name: weather; Type: TABLE; Schema: odbc; Owner: travis
--

CREATE TABLE odbc.weather (
    origin text,
    year integer,
    month integer,
    day integer,
    hour integer,
    temp double precision,
    dewp double precision,
    humid double precision,
    wind_dir double precision,
    wind_speed double precision,
    wind_gust double precision,
    precip double precision,
    pressure double precision,
    visib double precision,
    time_hour timestamp without time zone
);


ALTER TABLE odbc.weather OWNER TO travis;

--
-- Name: airlines; Type: TABLE; Schema: rpostgres; Owner: travis
--

CREATE TABLE rpostgres.airlines (
    carrier text,
    name text
);


ALTER TABLE rpostgres.airlines OWNER TO travis;

--
-- Name: airports; Type: TABLE; Schema: rpostgres; Owner: travis
--

CREATE TABLE rpostgres.airports (
    faa text,
    name text,
    lat real,
    lon real,
    alt real,
    tz real,
    dst text,
    tzone text
);


ALTER TABLE rpostgres.airports OWNER TO travis;

--
-- Name: flights; Type: TABLE; Schema: rpostgres; Owner: travis
-- times are bigints so that we get more type coverage (especially with bit64)
--

CREATE TABLE rpostgres.flights (
    year integer,
    month integer,
    day integer,
    dep_time bigint,
    sched_dep_time bigint,
    dep_delay real,
    arr_time bigint,
    sched_arr_time bigint,
    arr_delay real,
    carrier text,
    flight integer,
    tailnum text,
    origin text,
    dest text,
    air_time real,
    distance real,
    hour real,
    minute real,
    time_hour timestamp with time zone
);


ALTER TABLE rpostgres.flights OWNER TO travis;

--
-- Name: planes; Type: TABLE; Schema: rpostgres; Owner: travis
--

CREATE TABLE rpostgres.planes (
    tailnum text,
    year integer,
    type text,
    manufacturer text,
    model text,
    engines integer,
    seats integer,
    speed integer,
    engine text
);


ALTER TABLE rpostgres.planes OWNER TO travis;

--
-- Name: weather; Type: TABLE; Schema: rpostgres; Owner: travis
--

CREATE TABLE rpostgres.weather (
    origin text,
    year integer,
    month integer,
    day integer,
    hour integer,
    temp real,
    dewp real,
    humid real,
    wind_dir real,
    wind_speed real,
    wind_gust real,
    precip real,
    pressure real,
    visib real,
    time_hour timestamp with time zone
);


ALTER TABLE rpostgres.weather OWNER TO travis;

--
-- Name: airlines; Type: TABLE; Schema: rpostgresql; Owner: travis
--

CREATE TABLE rpostgresql.airlines (
    carrier text,
    name text
);


ALTER TABLE rpostgresql.airlines OWNER TO travis;

--
-- Name: airports; Type: TABLE; Schema: rpostgresql; Owner: travis
--

CREATE TABLE rpostgresql.airports (
    faa text,
    name text,
    lat double precision,
    lon double precision,
    alt double precision,
    tz double precision,
    dst text,
    tzone text
);


ALTER TABLE rpostgresql.airports OWNER TO travis;

--
-- Name: flights; Type: TABLE; Schema: rpostgresql; Owner: travis
--

CREATE TABLE rpostgresql.flights (
    year integer,
    month integer,
    day integer,
    dep_time integer,
    sched_dep_time integer,
    dep_delay double precision,
    arr_time integer,
    sched_arr_time integer,
    arr_delay double precision,
    carrier text,
    flight integer,
    tailnum text,
    origin text,
    dest text,
    air_time double precision,
    distance double precision,
    hour double precision,
    minute double precision,
    time_hour timestamp with time zone
);


ALTER TABLE rpostgresql.flights OWNER TO travis;

--
-- Name: planes; Type: TABLE; Schema: rpostgresql; Owner: travis
--

CREATE TABLE rpostgresql.planes (
    tailnum text,
    year integer,
    type text,
    manufacturer text,
    model text,
    engines integer,
    seats integer,
    speed integer,
    engine text
);


ALTER TABLE rpostgresql.planes OWNER TO travis;

--
-- Name: weather; Type: TABLE; Schema: rpostgresql; Owner: travis
--

CREATE TABLE rpostgresql.weather (
    origin text,
    year integer,
    month integer,
    day integer,
    hour integer,
    temp double precision,
    dewp double precision,
    humid double precision,
    wind_dir double precision,
    wind_speed double precision,
    wind_gust double precision,
    precip double precision,
    pressure double precision,
    visib double precision,
    time_hour timestamp with time zone
);


ALTER TABLE rpostgresql.weather OWNER TO travis;

--
-- Data for Name: airlines; Type: TABLE DATA; Schema: odbc; Owner: travis
--

COPY odbc.airlines (carrier, name) FROM stdin;
9E	Endeavor Air Inc.
AA	American Airlines Inc.
AS	Alaska Airlines Inc.
B6	JetBlue Airways
DL	Delta Air Lines Inc.
EV	ExpressJet Airlines Inc.
F9	Frontier Airlines Inc.
FL	AirTran Airways Corporation
HA	Hawaiian Airlines Inc.
MQ	Envoy Air
OO	SkyWest Airlines Inc.
UA	United Air Lines Inc.
US	US Airways Inc.
VX	Virgin America
WN	Southwest Airlines Co.
YV	Mesa Airlines Inc.
\.


--
-- Data for Name: airports; Type: TABLE DATA; Schema: odbc; Owner: travis
--

COPY odbc.airports (faa, name, lat, lon, alt, tz, dst, tzone) FROM stdin;
04G	Lansdowne Airport	41.1304722	-80.6195833	1044	-5	A	America/New_York
06A	Moton Field Municipal Airport	32.4605722	-85.6800278	264	-6	A	America/Chicago
06C	Schaumburg Regional	41.9893408	-88.1012428	801	-6	A	America/Chicago
06N	Randall Airport	41.431912	-74.3915611	523	-5	A	America/New_York
09J	Jekyll Island Airport	31.0744722	-81.4277778	11	-5	A	America/New_York
0A9	Elizabethton Municipal Airport	36.3712222	-82.1734167	1593	-5	A	America/New_York
0G6	Williams County Airport	41.4673056	-84.5067778	730	-5	A	America/New_York
0G7	Finger Lakes Regional Airport	42.8835647	-76.7812318	492	-5	A	America/New_York
0P2	Shoestring Aviation Airfield	39.7948244	-76.6471914	1000	-5	U	America/New_York
0S9	Jefferson County Intl	48.0538086	-122.8106436	108	-8	A	America/Los_Angeles
0W3	Harford County Airport	39.5668378	-76.2024028	409	-5	A	America/New_York
10C	Galt Field Airport	42.4028889	-88.3751111	875	-6	U	America/Chicago
17G	Port Bucyrus-Crawford County Airport	40.7815556	-82.9748056	1003	-5	A	America/New_York
19A	Jackson County Airport	34.1758638	-83.5615972	951	-5	U	America/New_York
1A3	Martin Campbell Field Airport	35.0158056	-84.3468333	1789	-5	A	America/New_York
1B9	Mansfield Municipal	42.0001331	-71.1967714	122	-5	A	America/New_York
1C9	Frazier Lake Airpark	54.013333333333335	-124.76833333333333	152	-8	A	America/Vancouver
1CS	Clow International Airport	41.6959744	-88.1292306	670	-6	U	America/Chicago
1G3	Kent State Airport	41.1513889	-81.4151111	1134	-5	A	America/New_York
1G4	Grand Canyon West Airport	35.899904	-113.815674	4813	-7	A	America/Phoenix
1H2	Effingham Memorial Airport	39.07	-88.534	585	-6	A	America/Chicago
1OH	Fortman Airport	40.5553253	-84.3866186	885	-5	U	America/New_York
1RL	Point Roberts Airpark	48.9797222	-123.0788889	10	-8	A	America/Los_Angeles
23M	Clarke CO	32.0517	-88.4434	320	-6	A	America/Chicago
24C	Lowell City Airport	42.95392	-85.3439058	681	-5	A	America/New_York
24J	Suwannee County Airport	30.300125	-83.0246944	104	-5	A	America/New_York
25D	Forest Lake Airport	45.2477456	-92.9943853	925	-6	A	America/Chicago
29D	Grove City Airport	41.1460278	-80.16775	1371	-5	A	America/New_York
2A0	Mark Anton Airport	35.48625	-84.9310833	718	-5	A	America/New_York
2B2	Plum Island Airport	42.7953611	-70.8394444	11	-5	A	America/New_York
2G2	Jefferson County Airpark	40.3602179	-80.7008742	1196	-5	A	America/New_York
2G9	Somerset County Airport	40.0388708	-79.0149951	2275	-5	A	America/New_York
2H0	Shelby County Airport	39.410556	-88.845556	550	-6	A	America/Chicago
2J9	Quincy Municipal Airport	30.5978708	-84.557425	225	-5	A	America/New_York
369	Atmautluak Airport	60.866667	-162.273056	18	-9	A	America/Anchorage
36U	Heber City Municipal Airport	40.4818056	-111.4288056	5637	-7	A	America/Denver
38W	Lynden Airport	48.9558961	-122.4581183	106	-8	A	America/Los_Angeles
3D2	Ephraim-Gibraltar Airport	45.1354167	-87.1879444	773	-6	A	America/Chicago
3G3	Wadsworth Municipal	41.0031572	-81.7564401	974	-5	A	America/New_York
3G4	Ashland County Airport	40.9029722	-82.2556389	1206	-5	A	America/New_York
3J1	Ridgeland Airport	32.4934167	-80.99175	79	-5	A	America/New_York
3W2	Put-in-Bay Airport	41.3521	-82.497	595	-5	A	America/New_York
40J	Perry-Foley Airport	30.0692778	-83.5805833	44	-5	A	America/New_York
41N	Braceville Airport	41.2111675	-80.9692572	900	-5	A	America/New_York
47A	Cherokee County Airport	34.3122175	-84.4221556	1219	-5	A	America/New_York
49A	Gilmer County Airport	34.6282222	-84.5265833	1486	-5	A	America/New_York
49X	Chemehuevi Valley	34.528889	-114.431971	638	-8	A	America/Los_Angeles
4A4	Polk County Airport - Cornelius Moore Field	34.0186944	-85.1464722	974	-5	A	America/New_York
4A7	Clayton County Tara Field	33.389099	-84.332397	874	-5	A	America/New_York
4A9	Isbell Field Airport	34.4736944	-85.7213889	877	-6	A	America/Chicago
4B8	Robertson Field	41.6893333	-72.8646944	202	-5	A	America/New_York
4G0	Pittsburgh-Monroeville Airport	40.4526389	-79.7749167	1187	-5	A	America/New_York
4G2	Hamburg Inc Airport	42.7008925	-78.9147569	751	-5	A	America/New_York
4G4	Youngstown Elser Metro Airport	40.9617953	-80.6773264	1070	-5	A	America/New_York
4I7	Putnam County Airport	39.6335556	-86.8138056	842	-5	U	America/New_York
4U9	Dell Flight Strip	44.7357483	-112.7200133	6007	-7	A	America/Denver
52A	Madison GA Municipal Airport	33.612125	-83.4604444	694	-5	A	America/New_York
54J	DeFuniak Springs Airport	30.7311111	-86.1537778	289	-6	A	America/Chicago
55J	Fernandina Beach Municipal Airport	30.6118333	-81.4611944	16	-5	A	America/New_York
55S	Packwood	46.3625	-121.4067	1057	-8	A	America/Los_Angeles
57C	East Troy Municipal Airport	42.7971667	-88.3726111	860	-6	A	America/Chicago
5B2	Saratoga County Airport	43.050722	-73.861638	433	-5	A	America/New_York
60J	Ocean Isle Beach Airport	33.9085056	-78.4366722	32	-5	U	America/New_York
6A2	Griffin-Spalding County Airport	33.2269722	-84.2749444	958	-5	A	America/New_York
6J4	Saluda County	33.5561	-81.4768	539	-5	A	America/New_York
6K8	Tok Junction Airport	63.329444	-142.953611	1639	-9	A	America/Anchorage
6S0	Big Timber Airport	45.8063889	-109.9811111	4492	-7	A	America/Denver
6S2	Florence	43.9828168	-124.1113687	51	-8	A	America/Los_Angeles
6Y8	Welke Airport	45.721111	-85.520278	664	-5	A	America/New_York
70J	Cairo-Grady County Airport	30.8879767	-84.1547353	265	-5	A	America/New_York
70N	Spring Hill Airport	41.3473569	-75.4158972	1729	-5	A	America/New_York
7A4	Foster Field	42.4664444	-90.1693889	990	-6	A	America/Chicago
7D9	Germack Airport	41.7778322	-80.9039797	820	-5	A	America/New_York
7N7	Spitfire Aerodrome	39.7355633	-75.3977211	40	-5	A	America/New_York
8M8	Garland Airport	44.8065278	-84.2761944	1218	-5	A	America/New_York
93C	Richland Airport	43.2833575	-90.2982819	742	-6	A	America/Chicago
99N	Bamberg County Airport	33.3045278	-81.1084167	231	-5	A	America/New_York
9A1	Covington Municipal Airport	33.6323083	-83.8474472	809	-5	A	America/New_York
9A5	Barwick Lafayette Airport	34.6884792	-85.2903319	777	-5	A	America/New_York
9G1	Rock Airport	40.6035463	-79.8261189	1063	-5	A	America/New_York
A39	Phoenix Regional Airport	32.99169921875	-111.920997619629	1300	-7	A	America/Phoenix
A50	Colorado Springs East	38.87	-104.41	6145	-7	A	America/Denver
AAF	Apalachicola Regional Airport	29.7276066	-85.0274416	20	-5	A	America/New_York
AAP	Andrau Airport	29.43	-95.35	80	-6	A	America/Chicago
ABE	Lehigh Valley Intl	40.652083	-75.440806	393	-5	A	America/New_York
ABI	Abilene Rgnl	32.411319	-99.681897	1791	-6	A	America/Chicago
ABL	Ambler Airport	67.106389	-157.8575	334	-9	A	America/Anchorage
ABQ	Albuquerque International Sunport	35.0402222	-106.6091944	5355	-7	A	America/Denver
ABR	Aberdeen Regional Airport	45.4491	-98.4218	1302	-6	A	America/Chicago
ABY	Southwest Georgia Regional Airport	31.5355	-84.1945	197	-5	A	America/New_York
ACJ	Jimmy Carter Regional	32.0665	-84.1133	468	-5	A	America/New_York
ACK	Nantucket Mem	41.253053	-70.060181	48	-5	A	America/New_York
ACT	Waco Rgnl	31.611289	-97.230519	516	-6	A	America/Chicago
ACV	Arcata	40.978111	-124.108611	221	-8	A	America/Los_Angeles
ACY	Atlantic City Intl	39.457583	-74.577167	75	-5	A	America/New_York
ADK	Adak Airport	51.878	-176.646	18	-9	A	America/Anchorage
ADM	Ardmore Muni	34.300833	-97.008889	762	-6	A	America/Chicago
ADQ	Kodiak	57.749967	-152.493856	78	-9	A	America/Anchorage
ADS	Addison	32.9685594	-96.8364478	644	-6	A	America/Chicago
ADW	Andrews Afb	38.810806	-76.867028	280	-5	A	America/New_York
AET	Allakaket Airport	66.5519	-152.6222	441	-9	A	America/Anchorage
AEX	Alexandria Intl	31.3274	-92.549833	89	-6	A	America/Chicago
AFE	Kake Airport	56.961389	-133.910278	172	-9	A	America/Anchorage
AFW	Fort Worth Alliance Airport	32.987778	-97.318889	722	-6	A	America/Chicago
AGC	Allegheny County Airport	40.3544	-79.9302	1252	-5	A	America/New_York
AGN	Angoon Seaplane Base	57.503611	-134.585	0	-9	A	America/Anchorage
AGS	Augusta Rgnl At Bush Fld	33.369944	-81.9645	144	-5	A	America/New_York
AHN	Athens Ben Epps Airport	33.9486	-83.3263	808	-5	A	America/New_York
AIA	Alliance Municipal Airport	42.053333	-102.803889	3931	-7	A	America/Denver
AIK	Municipal Airport	33.6493889	-81.6850278	529	-5	A	America/New_York
AIN	Wainwright Airport	70.638056	-159.994722	41	-9	A	America/Anchorage
AIZ	Lee C Fine Memorial Airport	38.096035	-92.5494875	869	-6	A	America/Chicago
AKB	Atka Airport	52.220278	-174.206389	56	-9	A	America/Anchorage
AKC	Akron Fulton Intl	41.0375	-81.466917	1067	-5	A	America/New_York
AKI	Akiak Airport	60.902778	-161.230556	30	-9	A	America/Anchorage
AKK	Akhiok Airport	56.938611	-154.1825	44	-9	A	America/Anchorage
AKN	King Salmon	58.676778	-156.649278	68	-9	A	America/Anchorage
AKP	Anaktuvuk Pass Airport	68.1336	-151.743	2103	-9	A	America/Anchorage
ALB	Albany Intl	42.748267	-73.801692	285	-5	A	America/New_York
ALI	Alice Intl	27.740889	-98.026944	178	-6	A	America/Chicago
ALM	Alamogordo White Sands Regional Airport	32.8399	-105.991	4200	-7	A	America/Denver
ALO	Waterloo Regional Airport	42.5571	-92.4003	873	-6	A	America/Chicago
ALS	San Luis Valley Regional Airport	37.435	-105.866667	7539	-7	A	America/Denver
ALW	Walla Walla Regional Airport	46.0949	-118.288	1191	-8	A	America/Los_Angeles
ALX	Alexandria	38.806346	-77.0621	1	-5	A	America/New_York
ALZ	Alitak Seaplane Base	56.899444	-154.247778	0	-9	A	America/Anchorage
AMA	Rick Husband Amarillo Intl	35.219369	-101.705931	3607	-6	A	America/Chicago
ANB	Anniston Metro	33.588167	-85.858111	612	-6	A	America/Chicago
ANC	Ted Stevens Anchorage Intl	61.174361	-149.996361	152	-9	A	America/Anchorage
AND	Anderson Rgnl	34.494583	-82.709389	782	-5	A	America/New_York
ANI	Aniak Airport	61.5816	-159.543	88	-9	A	America/Anchorage
ANN	Annette Island	55.042436	-131.572233	119	-9	A	America/Anchorage
ANP	Lee Airport	38.942778	-76.568333	34	-5	A	America/New_York
ANQ	Tri-State Steuben County Airport	41.6396983	-85.0834933	995	-5	A	America/New_York
ANV	Anvik Airport	62.6467	-160.191	309	-9	A	America/Anchorage
AOH	Lima Allen County Airport	40.707478	-84.0270781	975	-5	A	America/New_York
AOO	Altoona Blair Co	40.296372	-78.320022	1504	-5	A	America/New_York
AOS	Amook Bay Seaplane Base	57.471389	-153.815278	0	-9	A	America/Anchorage
APA	Centennial	39.570129	-104.849294	5883	-7	A	America/Denver
APC	Napa County Airport	38.2131944	-122.2806944	35	-8	A	America/Los_Angeles
APF	Naples Muni	26.152619	-81.775294	8	-5	A	America/New_York
APG	Phillips Aaf	39.466219	-76.168808	57	-5	A	America/New_York
APN	Alpena County Regional Airport	45.0781	-83.5603	689	-5	A	America/New_York
AQC	Klawock Seaplane Base	55.554658	-133.101693	0	-9	A	America/Anchorage
ARA	Acadiana Rgnl	30.037758	-91.883896	24	-6	A	America/Chicago
ARB	Ann Arbor Municipal Airport	42.132274	-83.444418	839	-5	A	America/New_York
ARC	Arctic Village Airport	68.1147	-145.579	2092	-9	A	America/Anchorage
ART	Watertown Intl	43.991922	-76.021739	325	-5	A	America/New_York
ARV	Lakeland	45.927778	-89.730833	1629	-6	A	America/Chicago
ASE	Aspen Pitkin County Sardy Field	39.2232	-106.869	7820	-7	A	America/Denver
ASH	Boire Field Airport	42.78175	-71.5147778	199	-5	A	America/New_York
AST	Astoria Regional Airport	46.157972	-123.878694	15	-8	A	America/Los_Angeles
ATK	Atqasuk Edward Burnell Sr Memorial Airport	70.4673	-157.436	96	-9	A	America/Anchorage
ATL	Hartsfield Jackson Atlanta Intl	33.636719	-84.428067	1026	-5	A	America/New_York
ATT	Camp Mabry Austin City	30.31666	-97.7666	0	-6	A	America/Chicago
ATW	Appleton	44.257526	-88.507576	680	-6	A	America/Chicago
ATY	Watertown Regional Airport	44.914	-97.1547	1748	-6	A	America/Chicago
AUG	Augusta State	44.320647	-69.797317	352	-5	A	America/New_York
AUK	Alakanuk Airport	62.68	-164.66	10	-9	A	America/Anchorage
AUO	Auburn University Regional	32.3691	-85.2604	777	-6	A	America/Chicago
AUS	Austin Bergstrom Intl	30.194528	-97.669889	542	-6	A	America/Chicago
AUW	Wausau Downtown Airport	44.9262845	-89.6270018	1201	-6	U	America/Chicago
AVL	Asheville Regional Airport	35.436194	-82.541806	2165	-5	A	America/New_York
AVO	Executive	27.591389	-81.528889	160	-5	A	America/New_York
AVP	Wilkes Barre Scranton Intl	41.338478	-75.723403	962	-5	A	America/New_York
AVW	Marana Regional	32.409556	-111.218388	2031	-7	U	America/Phoenix
AVX	Avalon	33.405	-118.415833	1602	-8	A	America/Los_Angeles
AZA	Phoenix-Mesa Gateway	33.307833	-111.655	1382	-7	N	America/Phoenix
AZO	Kalamazoo	42.234875	-85.552058	874	-5	A	America/New_York
BAB	Beale Afb	39.136089	-121.436567	113	-8	A	America/Los_Angeles
BAD	Barksdale Afb	32.50182	-93.662674	166	-6	A	America/Chicago
BAF	Barnes Municipal	42.1579472	-72.715875	270	-5	A	America/New_York
BBX	Wings Field	40.1375	-75.265	302	-5	A	America/New_York
BCE	Bryce Canyon	37.706444	-112.145806	7590	-7	A	America/Denver
BCT	Boca Raton	26.3785	-80.107694	13	-5	A	America/New_York
BDE	Baudette Intl	48.728444	-94.612222	1086	-6	A	America/Chicago
BDL	Bradley Intl	41.938889	-72.683222	173	-5	A	America/New_York
BDR	Igor I Sikorsky Mem	41.163472	-73.126167	9	-5	A	America/New_York
BEC	Beech Factory Airport	37.6939167	-97.2149167	1409	-6	A	America/Chicago
BED	Laurence G Hanscom Fld	42.469953	-71.289031	133	-5	A	America/New_York
BEH	Southwest Michigan Regional Airport	42.1285833	-86.4285	643	-5	A	America/New_York
BET	Bethel	60.779778	-161.838	121	-9	A	America/Anchorage
BFD	Bradford Regional Airport	41.8031	-78.6401	2143	-5	A	America/New_York
BFF	Western Nebraska Regional Airport	41.874	-103.596	3967	-7	A	America/Denver
BFI	Boeing Fld King Co Intl	47.53	-122.301947	21	-8	A	America/Los_Angeles
BFL	Meadows Fld	35.433598	-119.05677	507	-8	A	America/Los_Angeles
BFM	Mobile Downtown	30.626783	-88.068092	26	-6	A	America/Chicago
BFP	Beaver Falls	40.7724722	-80.3914444	1253	-5	A	America/New_York
BFT	Beaufort	32.477411	-80.723161	37	-5	A	America/New_York
BGE	Decatur County Industrial Air Park	30.9715981	-84.6369278	141	-5	A	America/New_York
BGM	Greater Binghamton Edwin A Link Fld	42.208689	-75.979839	1636	-5	A	America/New_York
BGR	Bangor Intl	44.807444	-68.828139	192	-5	A	America/New_York
BHB	Hancock County - Bar Harbor	44.4497689	-68.3615653	83	-5	A	America/New_York
BHM	Birmingham Intl	33.562942	-86.75355	644	-6	A	America/Chicago
BID	Block Island State Airport	41.168056	-71.577778	108	-5	A	America/New_York
BIF	Biggs Aaf	31.849528	-106.380039	3948	-7	A	America/Denver
BIG	Allen Aaf	63.994547	-145.721642	1291	-9	A	America/Anchorage
BIL	Billings Logan International Airport	45.80921	-108.537654	3652	-7	A	America/Denver
BIS	Bismarck Municipal Airport	46.775842	-100.757931	1661	-6	A	America/Chicago
BIV	Tulip City Airport	42.7427778	-86.1078333	698	-5	A	America/New_York
BIX	Keesler Afb	30.410425	-88.924433	33	-6	A	America/Chicago
BJC	Rocky Mountain Metropolitan Airport	39.90888888	-105.11722222	5670	-7	A	America/Denver
BJI	Bemidji Regional Airport	47.510722	-94.934722	1391	-6	A	America/Chicago
BKC	Buckland Airport	65.981667	-161.149167	31	-9	A	America/Anchorage
BKD	Stephens Co	32.719047	-98.891	1284	-6	A	America/Chicago
BKF	Buckley Afb	39.701668	-104.75166	5662	-7	A	America/Denver
BKG	Branson LLC	36.531994	-93.200556	1302	-6	A	America/Chicago
BKH	Barking Sands Pmrf	22.022833	-159.785	23	-10	A	Pacific/Honolulu
BKL	Burke Lakefront Airport	41.5175	-81.683333	583	-5	A	America/New_York
BKW	Raleigh County Memorial Airport	37.7873	-81.1242	2504	-5	A	America/New_York
BKX	Brookings Regional Airport	44.3048	-96.8169	1648	-6	A	America/Chicago
BLD	Boulder City Municipal Airport	35.5651	-114.514	2201	-7	U	America/Phoenix
BLF	Mercer County Airport	37.2958	-81.2077	2857	-5	A	America/New_York
BLH	Blythe Airport	33.619167	-114.716889	399	-8	A	America/Los_Angeles
BLI	Bellingham Intl	48.792694	-122.537528	170	-8	A	America/Los_Angeles
BLV	Scott Afb Midamerica	38.545178	-89.835183	459	-6	A	America/Chicago
BMC	Brigham City	41.552	-112.062	4229	-7	A	America/Denver
BMG	Monroe County Airport	39.1460208	-86.6166805	846	-5	A	America/New_York
BMI	Central Illinois Rgnl	40.477111	-88.915917	871	-6	A	America/Chicago
BMT	Beaumont Municipal	30.0702044	-94.2150967	32	-6	A	America/Chicago
BMX	Big Mountain Afs	59.361247	-155.258822	663	-9	A	America/Anchorage
BNA	Nashville Intl	36.124472	-86.678194	599	-6	A	America/Chicago
BOI	Boise Air Terminal	43.564361	-116.222861	2871	-7	A	America/Denver
BOS	General Edward Lawrence Logan Intl	42.364347	-71.005181	19	-5	A	America/New_York
BOW	Bartow Municipal Airport	27.9434	-81.7834	125	-5	U	America/New_York
BPT	Southeast Texas Rgnl	29.950833	-94.020694	15	-6	A	America/Chicago
BQK	Brunswick Golden Isles Airport	31.2588	-81.4665	26	-5	A	America/New_York
BRD	Brainerd Lakes Rgnl	46.398308	-94.138078	1226	-6	U	America/Chicago
BRL	Southeast Iowa Regional Airport	40.7832	-91.1255	698	-6	A	America/Chicago
BRO	Brownsville South Padre Island Intl	25.906833	-97.425861	22	-6	A	America/Chicago
BRW	Wiley Post Will Rogers Mem	71.285446	-156.766003	44	-9	A	America/Anchorage
BSF	Bradshaw Aaf	19.760056	-155.553717	6190	-10	A	Pacific/Honolulu
BTI	Barter Island Lrrs	70.133989	-143.581867	2	-9	A	America/Anchorage
BTM	Bert Mooney Airport	45.954806	-112.497472	5550	-7	A	America/Denver
BTR	Baton Rouge Metro Ryan Fld	30.533167	-91.149639	70	-6	A	America/Chicago
BTT	Bettles	66.913944	-151.529056	644	-9	A	America/Anchorage
BTV	Burlington Intl	44.471861	-73.153278	335	-5	A	America/New_York
BUF	Buffalo Niagara Intl	42.940525	-78.732167	724	-5	A	America/New_York
BUR	Bob Hope	34.200667	-118.358667	778	-8	A	America/Los_Angeles
BUU	Municipal Airport	42.6907171	-88.3046825	780	-6	A	America/Chicago
BUY	Burlington-Alamance Regional Airport	36.0485433	-79.4748892	617	-5	A	America/New_York
BVY	Beverly Municipal Airport	42.584141	-70.9161444	107	-5	A	America/New_York
BWD	KBWD	31.7936111	-98.9565	1387	-6	A	America/Chicago
BWG	Bowling Green-Warren County Regional Airport	36.9645278	-86.4196667	547	-6	A	America/Chicago
BWI	Baltimore Washington Intl	39.175361	-76.668333	146	-5	A	America/New_York
BXK	Buckeye Municipal Airport	33.420417	-112.68618	1033	-7	U	America/Phoenix
BXS	Borrego Valley Airport	33.2590278	-116.3209722	520	-8	A	America/Los_Angeles
BYH	Arkansas Intl	35.964347	-89.943956	254	-6	A	America/Chicago
BYS	Bicycle Lake Aaf	35.280531	-116.630031	2350	-8	A	America/Los_Angeles
BYW	Blakely Island Airport	48.56025	-122.80243	0	-8	A	America/Los_Angeles
BZN	Gallatin Field	45.777643	-111.160151	4500	-7	A	America/Denver
C02	Grand Geneva Resort Airport	42.6149167	-88.3895833	835	-6	U	America/Chicago
C16	Frasca Field	40.144979	-88.200197	735	-6	A	America/Chicago
C47	Portage Municipal Airport	43.5603136	-89.4828607	825	-6	U	America/Chicago
C65	Plymouth Municipal Airport	41.3651307	-86.3002574	800	-5	A	America/New_York
C89	Sylvania Airport	42.70325	-87.9589722	785	-6	A	America/Chicago
C91	Dowagiac Municipal Airport	41.9929342	-86.1280125	748	-5	U	America/New_York
CAE	Columbia Metropolitan	33.938833	-81.119528	236	-5	A	America/New_York
CAK	Akron Canton Regional Airport	40.9160833	-81.4421944	1228	-5	A	America/New_York
CAR	Caribou Muni	46.8715	-68.017917	626	-5	A	America/New_York
CBE	Greater Cumberland Rgnl.	39.615278	-78.760556	775	-5	A	America/New_York
CBM	Columbus Afb	33.643833	-88.443833	219	-6	A	America/Chicago
CCO	Coweta County Airport	33.3115656	-84.7697554	970	-5	A	America/New_York
CCR	Buchanan Field Airport	37.9896667	-122.0568889	26	-8	A	America/Los_Angeles
CDB	Cold Bay	55.206061	-162.725436	96	-9	A	America/Anchorage
CDC	Cedar City Rgnl	37.700967	-113.098847	5622	-7	A	America/Denver
CDI	Cambridge Municipal Airport	39.9750278	-81.5775833	799	-5	U	America/New_York
CDK	CedarKey	29.1342222	-83.0504722	11	-5	A	America/New_York
CDN	Woodward Field	34.2835833	-80.5648611	302	-5	A	America/New_York
CDR	Chadron Municipal Airport	42.8375	-103.095556	3297	-7	A	America/Denver
CDS	Childress Muni	34.433781	-100.287992	1954	-6	A	America/Chicago
CDV	Merle K Mudhole Smith	60.491778	-145.477556	48	-9	A	America/Anchorage
CDW	Caldwell Essex County Airport	40.8752222	-74.2813611	172	-5	A	America/New_York
CEC	Del Norte County Airport	41.7802	-124.237	57	-8	A	America/Los_Angeles
CEF	Westover Arb Metropolitan	42.194014	-72.534783	241	-5	A	America/New_York
CEM	Central Airport	65.573889	-144.780833	937	-9	A	America/Anchorage
CEU	Clemson	34.6722222	-82.8858889	891	-5	A	America/New_York
CEW	Bob Sikes	30.778833	-86.522111	213	-6	A	America/Chicago
CEZ	Cortez Muni	37.303	-108.628056	5918	-7	A	America/Denver
CFD	Coulter Fld	30.715694	-96.331361	367	-6	A	America/Chicago
CGA	Craig Seaplane Base	55.478889	-133.147778	0	-9	A	America/Anchorage
CGC	Crystal River	28.8676111	-82.5741111	9	-5	A	America/New_York
CGF	Cuyahoga County	41.565124	-81.4863555	879	-5	A	America/New_York
CGI	Cape Girardeau Regional Airport	37.2253	-89.5708	342	-6	A	America/Chicago
CGX	Meigs Field	41.860278	-87.609722	585	-6	A	America/Chicago
CGZ	Casa Grande Municipal Airport	32.954889	-111.766832	1464	-7	U	America/Phoenix
CHA	Lovell Fld	35.035278	-85.203808	683	-5	A	America/New_York
CHI	All Airports	41.883611	-87.631667	596	-6	A	America/Chicago
CHO	Charlottesville-Albemarle	38.138639	-78.452861	639	-5	A	America/New_York
CHS	Charleston Afb Intl	32.898647	-80.040528	45	-5	A	America/New_York
CHU	Chuathbaluk Airport	61.579167	-159.215556	243	-9	A	America/Anchorage
CIC	Chico Muni	39.795383	-121.858422	238	-8	A	America/Los_Angeles
CID	Cedar Rapids	41.884694	-91.710806	869	-6	A	America/Chicago
CIK	Chalkyitsik Airport	66.645	-143.74	544	-9	A	America/Anchorage
CIL	Council Airport	64.897778	-163.703333	85	-9	A	America/Anchorage
CIU	Chippewa County International Airport	46.2508	-84.4724	800	-5	A	America/New_York
CKB	Harrison Marion Regional Airport	39.2966	-80.2281	1217	-5	A	America/New_York
CKD	Crooked Creek Airport	61.867778	-158.135	178	-9	A	America/Anchorage
CKF	Crisp County Cordele Airport	31.9888333	-83.7739167	310	-5	A	America/New_York
CKV	Clarksville-Montgomery County Regional Airport	36.621944	-87.415	550	-6	A	America/Chicago
CLC	Clear Lake Metroport	29.5569	-95.137497	35	-6	A	America/Chicago
CLD	McClellan-Palomar Airport	33.0742	-117.1648	328	-8	A	America/Los_Angeles
CLE	Cleveland Hopkins Intl	41.411689	-81.849794	791	-5	A	America/New_York
CLL	Easterwood Fld	30.588583	-96.363833	321	-6	A	America/Chicago
CLM	William R Fairchild International Airport	48.1202	-123.5	291	-8	A	America/Los_Angeles
CLS	Chehalis-Centralia	46.4062	-122.5897	177	-8	A	America/Los_Angeles
CLT	Charlotte Douglas Intl	35.214	-80.943139	748	-5	A	America/New_York
CLW	Clearwater Air Park	27.9764722	-82.7586667	70	-5	A	America/New_York
CMH	Port Columbus Intl	39.997972	-82.891889	815	-5	A	America/New_York
CMI	Champaign	40.03925	-88.278056	754	-6	A	America/Chicago
CMX	Houghton County Memorial Airport	47.1684	-88.4891	1095	-5	A	America/New_York
CNM	Cavern City Air Terminal	32.337472	-104.263278	3295	-7	A	America/Denver
CNW	Tstc Waco	31.637831	-97.074139	470	-6	A	America/Chicago
CNY	Canyonlands Field	38.755	-109.754722	4555	-7	A	America/Denver
COD	Yellowstone Rgnl	44.520194	-109.023806	5102	-7	A	America/Denver
COE	Pappy Boyington	47.7743056	-116.8195833	2320	-8	A	America/Los_Angeles
COF	Patrick Afb	28.234922	-80.610125	8	-5	A	America/New_York
COI	Merritt Island Airport	28.3416111	-80.6854722	6	-5	A	America/New_York
CON	Concord Municipal	43.20267	-71.50233	342	-5	A	America/New_York
COS	City Of Colorado Springs Muni	38.805805	-104.700778	6187	-7	A	America/Denver
COT	Cotulla Lasalle Co	28.456694	-99.220294	474	-6	A	America/Chicago
COU	Columbia Rgnl	38.818094	-92.219631	889	-6	A	America/Chicago
CPR	Natrona Co Intl	42.908	-106.464417	5347	-7	A	America/Denver
CPS	St. Louis Downtown Airport	38.5707244	-90.1562211	413	-6	U	America/Chicago
CRE	Grand Strand Airport	33.81175	-78.7239444	31	-5	A	America/New_York
CRP	Corpus Christi Intl	27.770361	-97.501222	44	-6	A	America/Chicago
CRW	Yeager	38.373147	-81.593189	981	-5	A	America/New_York
CSG	Columbus Metropolitan Airport	32.5163333	-84.9388611	397	-5	A	America/New_York
CTB	Cut Bank Muni	48.608353	-112.376144	3854	-7	A	America/Denver
CTH	Chester County G O Carlson Airport	39.9789	-75.8654	660	-5	A	America/New_York
CTJ	West Georgia Regional Airport - O V Gray Field	33.6316964	-85.1522641	1165	-5	A	America/New_York
CTY	Cross City	29.6355278	-83.10475	42	-5	A	America/New_York
CVG	Cincinnati Northern Kentucky Intl	39.048836	-84.667822	896	-5	A	America/New_York
CVN	Clovis Muni	34.425139	-103.079278	4216	-7	A	America/Denver
CVO	Corvallis Muni	44.5067	-123.2915	250	-8	A	America/Los_Angeles
CVS	Cannon Afb	34.382775	-103.322147	4295	-7	A	America/Denver
CVX	Charlevoix Municipal Airport	45.3047778	-85.2753333	669	-5	A	America/New_York
CWA	Central Wisconsin	44.772726	-89.646635	840	-6	A	America/Chicago
CWI	Clinton Municipal	41.83075	-90.3289722	708	-6	A	America/Chicago
CWT	Chatsworth Station	34.256944	-118.598889	978	-8	A	America/Los_Angeles
CXF	Coldfoot Airport	67.251389	-150.176111	1014	-9	A	America/Anchorage
CXL	Calexico Intl	32.669502	-115.51333	4	-8	A	America/Los_Angeles
CXO	Lone Star Executive	30.351833	-95.414467	245	-6	A	America/Chicago
CXY	Capital City Airport	40.2171389	-76.8513611	347	-5	A	America/New_York
CYF	Chefornak Airport	60.149167	-164.285556	40	-9	A	America/Anchorage
CYM	Chatham Seaplane Base	57.515	-134.946111	0	-9	A	America/Anchorage
CYS	Cheyenne Rgnl Jerry Olson Fld	41.155722	-104.811839	6156	-7	A	America/Denver
CYT	Yakataga Airport	60.081901	-142.493611	12	-9	A	America/Anchorage
CZF	Cape Romanzof Lrrs	61.780297	-166.038747	457	-9	A	America/Anchorage
CZG	Tri-Cities	42.0471	-76.0578	833	-5	A	America/New_York
CZN	Chisana Airport	62.071111	-142.048333	1011	-9	A	America/Anchorage
DAB	Daytona Beach Intl	29.179917	-81.058056	34	-5	A	America/New_York
DAL	Dallas Love Fld	32.847111	-96.851778	487	-6	A	America/Chicago
DAW	Skyhaven Airport	43.2840556	-70.9292778	321	-5	A	America/New_York
DAY	James M Cox Dayton Intl	39.902375	-84.219375	1009	-5	A	America/New_York
DBN	W H Barron Field	32.3388	-82.591	311	-5	A	America/New_York
DBQ	Dubuque Rgnl	42.402	-90.709472	1076	-6	A	America/Chicago
DCA	Ronald Reagan Washington Natl	38.852083	-77.037722	15	-5	A	America/New_York
DDC	Dodge City Regional Airport	37.7634	-99.9656	2594	-6	A	America/Chicago
DEC	Decatur	39.834564	-88.865689	682	-6	A	America/Chicago
DEN	Denver Intl	39.861656	-104.673178	5431	-7	A	America/Denver
DET	Coleman A Young Muni	42.409195	-83.009861	626	-5	A	America/New_York
DFW	Dallas Fort Worth Intl	32.896828	-97.037997	607	-6	A	America/Chicago
DGL	Douglas Municipal Airport	31.3426028	-109.5064544	4173	-7	N	America/Phoenix
DHB	Deer Harbor Seaplane	48.618397	-123.00596	0	-8	A	America/Los_Angeles
DHN	Dothan Rgnl	31.321339	-85.449628	401	-6	A	America/Chicago
DHT	Dalhart Muni	36.022586	-102.547278	3991	-6	A	America/Chicago
DIK	Dickinson Theodore Roosevelt Regional Airport	46.7975	-102.801944	2592	-7	A	America/Denver
DKB	De Kalb Taylor Municipal Airport	41.9338342	-88.7056864	914	-6	U	America/Chicago
DKK	Chautauqua County-Dunkirk Airport	42.4933353	-79.2720417	693	-5	A	America/New_York
DKX	Knoxville Downtown Island Airport	35.9638333	-83.8736667	833	-5	A	America/New_York
DLF	Laughlin Afb	29.359486	-100.777975	1082	-6	A	America/Chicago
DLG	Dillingham	59.044667	-158.5055	74	-9	A	America/Anchorage
DLH	Duluth Intl	46.842091	-92.193649	1428	-6	A	America/Chicago
DLL	Baraboo Wisconsin Dells Airport	43.5217843	-89.7709266	979	-6	A	America/Chicago
DMA	Davis Monthan Afb	32.166467	-110.883144	2704	-7	A	America/Phoenix
DNL	Daniel Field Airport	33.4665028	-82.0393808	423	-5	A	America/New_York
DNN	Dalton Municipal Airport	34.7229444	-84.87025	709	-5	A	America/New_York
DNV	Vermilion Regional	40.1996944	-87.5955278	696	-6	A	America/Chicago
DOV	Dover Afb	39.129539	-75.465958	28	-5	A	America/New_York
DPA	Dupage	41.907778	-88.248611	758	-6	A	America/Chicago
DQH	Douglas Municipal Airport	31.4767385	-82.8605664	257	-5	A	America/New_York
DRG	Deering Airport	66.0696	-162.766	21	-9	A	America/Anchorage
DRI	Beauregard Rgnl	30.831722	-93.339917	202	-6	A	America/Chicago
DRM	Drummond Island Airport	46.0093114	-83.7439342	668	-5	A	America/New_York
DRO	Durango La Plata Co	37.151516	-107.75377	6685	-7	A	America/Denver
DRT	Del Rio Intl	29.374208	-100.927158	1002	-6	A	America/Chicago
DSM	Des Moines Intl	41.533972	-93.663083	958	-6	A	America/Chicago
DTA	Delta Municipal Airport	39.3806386	-112.5077147	4759	-7	A	America/Denver
DTS	Destin	30.4000611	-86.4714772	23	-6	A	America/Chicago
DTW	Detroit Metro Wayne Co	42.212444	-83.353389	645	-5	A	America/New_York
DUC	Halliburton Field Airport	34.4713056	-97.9598611	1114	-6	A	America/Chicago
DUG	Bisbee Douglas Intl	31.469028	-109.603667	4154	-7	A	America/Phoenix
DUJ	DuBois Regional Airport	41.1783	-78.8987	1817	-5	A	America/New_York
DUT	Unalaska	53.900139	-166.5435	22	-9	A	America/Anchorage
DVL	Devils Lake Regional Airport	48.114444	-98.908611	1445	-6	A	America/Chicago
DVT	Deer Valley Municipal Airport	33.4117	112.457	1478	8	A	Asia/Chongqing
DWA	Yolo County Airport	38.5793889	-121.8569444	100	-8	A	America/Los_Angeles
DWH	David Wayne Hooks Field	30.063746	-95.554276	152	-6	A	America/Chicago
DWS	Orlando	28.398	-81.57	340	-5	A	America/New_York
DXR	Danbury Municipal Airport	41.3715353	-73.4821906	458	-5	A	America/New_York
DYS	Dyess Afb	32.420756	-99.8546	1789	-6	A	America/Chicago
E25	Wickenburg Municipal Airport	33.96889877	-112.7990036	2377	-7	A	America/Phoenix
E51	Bagdad Airport	34.5958528	-113.170195	4183	-7	A	America/Phoenix
E55	Ocean Ridge Airport	38.8016111	-123.5306389	940	-8	A	America/Los_Angeles
E63	Gila Bend Municipal Airport	32.960169	-112.673636	789	-7	U	America/Phoenix
E91	Chinle Municipal Airport	36.1108806	-109.5754222	5547	-7	N	America/Denver
EAA	Eagle Airport	64.778056	-141.149722	908	-9	A	America/Anchorage
EAR	Kearney Municipal Airport	40.727	-99.0068	2131	-6	A	America/Chicago
EAT	Pangborn Field	47.398	-120.206	1249	-8	A	America/Los_Angeles
EAU	Chippewa Valley Regional Airport	44.8658	-91.4843	913	-6	A	America/Chicago
ECA	Iosco County	44.311	-83.422	606	-5	A	America/New_York
ECG	Elizabeth City Cgas Rgnl	36.260581	-76.174572	12	-5	A	America/New_York
ECP	Panama City-NW Florida Bea.	30.3417	-85.7973	69	-6	A	America/Chicago
EDF	Elmendorf Afb	61.250986	-149.806503	212	-9	A	America/Anchorage
EDW	Edwards Afb	34.905417	-117.883739	2302	-8	A	America/Los_Angeles
EEK	Eek Airport	60.213611	-162.043889	15	-9	A	America/Anchorage
EEN	Dillant Hopkins Airport	72.270833	42.898333	149	-5	A	\N
EET	Shelby County Airport	33.1777778	-86.7832222	586	-6	A	America/Chicago
EFD	Ellington Fld	29.607333	-95.15875	32	-6	A	America/Chicago
EGA	Eagle County Airport	39.6427611	-106.9159347	6548	-7	U	America/Denver
EGE	Eagle Co Rgnl	39.642556	-106.917694	6540	-7	A	America/Denver
EGT	Wellington Municipal	37.39411	-97.423225	1277	-6	A	America/Chicago
EGV	Eagle River	45.932333	-89.268283	1642	-6	A	America/Chicago
EGX	Egegik Airport	58.185556	-157.375556	92	-9	A	America/Anchorage
EHM	Cape Newenham Lrrs	58.646428	-162.062778	541	-9	A	America/Anchorage
EIL	Eielson Afb	64.665667	-147.1015	548	-9	A	America/Anchorage
EKI	Elkhart Municipal	41.719444	-86.003333	778	-5	A	America/New_York
EKN	Elkins Randolph Co Jennings Randolph	38.889444	-79.857139	1987	-5	A	America/New_York
EKO	Elko Regional Airport	40.8249	-115.792	5140	-8	A	America/Los_Angeles
EKY	Bessemer	33.1876	-86.5558	700	-6	A	America/Chicago
ELD	South Arkansas Rgnl At Goodwin Fld	33.220972	-92.813278	277	-6	A	America/Chicago
ELI	Elim Airport	64.615	-162.270556	162	-9	A	America/Anchorage
ELM	Elmira Corning Rgnl	42.159889	-76.891611	954	-5	A	America/New_York
ELP	El Paso Intl	31.80725	-106.377583	3958	-7	A	America/Denver
ELV	Elfin Cove Seaplane Base	58.195278	-136.3475	0	-9	A	America/Anchorage
ELY	Ely Airport	39.299722	-114.841944	6259	-8	A	America/Los_Angeles
EMK	Emmonak Airport	62.786111	-164.490833	13	-9	A	America/Anchorage
EMP	Emporia Municipal Airport	38.3321	-96.1912	1208	-6	A	America/Chicago
ENA	Kenai Muni	60.573111	-151.245	99	-9	A	America/Anchorage
END	Vance Afb	36.339167	-97.9165	1307	-6	A	America/Chicago
ENV	Wendover	40.718694	-114.030889	4237	-7	A	America/Denver
ENW	Kenosha Regional Airport	42.5956944	-87.9278056	742	-6	A	America/Chicago
EOK	Keokuk Municipal Airport	40.4599078	-91.4285011	671	-6	A	America/Chicago
EPM	Eastport Municipal Airport	44.9101111	-67.0126944	45	-5	A	America/New_York
EQY	Monroe Reqional Airport	35.01833	-80.62001	679	-5	A	America/New_York
ERI	Erie Intl Tom Ridge Fld	42.082022	-80.176217	733	-5	A	America/New_York
ERV	Kerrville Municipal Airport	29.9766667	-99.0854722	1617	-6	A	America/Chicago
ERY	Luce County Airport	46.311199	-85.457298	869	-5	A	America/New_York
ESC	Delta County Airport	45.722778	-87.093611	609	-5	A	America/New_York
ESD	Orcas Island Airport	48.708056	-122.910556	31	-8	A	America/Los_Angeles
ESF	Esler Rgnl	31.394903	-92.295772	112	-6	A	America/Chicago
ESN	Easton-Newnam Field Airport	38.8041667	-76.069	72	-5	A	America/New_York
EUF	Weedon Field	31.5708	-85.0774	285	-6	A	America/Chicago
EUG	Mahlon Sweet Fld	44.124583	-123.211972	374	-8	A	America/Los_Angeles
EVV	Evansville Regional	38.036997	-87.532364	418	-6	A	America/Chicago
EVW	Evanston-Uinta CO Burns Fld	41.1649	-111.0208	7143	-7	A	America/Denver
EWB	New Bedford Regional Airport	41.6761	-70.9569	80	-5	A	America/New_York
EWK	Newton City-County Airport	38.0570785	-97.2752278	1533	-6	A	America/Chicago
EWN	Craven Co Rgnl	35.072972	-77.042944	18	-5	A	America/New_York
EWR	Newark Liberty Intl	40.6925	-74.168667	18	-5	A	America/New_York
EXI	Excursion Inlet Seaplane Base	58.420556	-135.449167	0	-9	A	America/Anchorage
EYW	Key West Intl	24.556111	-81.759556	3	-5	A	America/New_York
F57	Seaplane Base	28.0575	-81.7628056	140	-5	A	America/New_York
FAF	Felker Aaf	37.1325	-76.608841	12	-5	A	America/New_York
FAI	Fairbanks Intl	64.815114	-147.856267	434	-9	A	America/Anchorage
FAR	Hector International Airport	46.92065	-96.8157639	902	-6	A	America/Chicago
FAT	Fresno Yosemite Intl	36.776194	-119.71814	336	-8	A	America/Los_Angeles
FAY	Fayetteville Regional Grannis Field	34.9912	-78.8803	189	-5	A	America/New_York
FBG	Fredericksburg Amtrak Station	38.298416	-77.456875	130	-5	A	America/New_York
FBK	Ladd Aaf	64.8375	-147.614444	454	-9	A	America/Anchorage
FBR	Fort Bridger	41.236	-110.2436	7038	-7	A	America/Denver
FBS	Friday Harbor Seaplane Base	48.537222	-123.009722	0	-8	A	America/Los_Angeles
FCA	Glacier Park Intl	48.310472	-114.256	2977	-7	A	America/Denver
FCM	Flying Cloud Airport	44.4938	-93.2726	906	-6	A	America/Chicago
FCS	Butts Aaf	38.678394	-104.756581	5838	-7	A	America/Denver
FDW	Fairfield County Airport	34.315472	-81.108806	577	-5	A	America/New_York
FDY	Findlay Airport	41.0120278	-83.6686111	819	-5	U	America/New_York
FFA	First Flight Airport	36.02	-75.67	13	-5	A	America/New_York
FFC	Atlanta Regional Airport - Falcon Field	33.35725	-84.5718333	808	-5	A	America/New_York
FFO	Wright Patterson Afb	39.826111	-84.048332	823	-5	A	America/New_York
FFT	Capital City Airport	38.1819722	-84.9061389	812	-5	A	America/New_York
FFZ	Mesa Falcon Field	33.4608001708984	-111.727996826172	1394	-7	A	America/Phoenix
FHU	Sierra Vista Muni Libby Aaf	31.588472	-110.344389	4719	-7	A	America/Phoenix
FIT	Fitchburg Municipal Airport	42.5541111	-71.7589722	348	-5	A	America/New_York
FKL	Franklin	41.377874	-79.860362	1540	-5	A	America/New_York
FLD	Fond Du Lac County Airport	43.7711667	-88.4884167	808	-6	A	America/Chicago
FLG	Flagstaff Pulliam Airport	35.140318	-111.6692392	7015	-7	N	America/Phoenix
FLL	Fort Lauderdale Hollywood Intl	26.072583	-80.15275	9	-5	A	America/New_York
FLO	Florence Rgnl	34.185361	-79.723889	146	-5	A	America/New_York
FLV	Sherman Aaf	39.368332	-94.914686	772	-6	A	America/Chicago
FME	Tipton	39.085386	-76.759414	150	-5	A	America/New_York
FMH	Otis Angb	41.658439	-70.521417	131	-5	A	America/New_York
FMN	Four Corners Rgnl	36.74125	-108.229944	5506	-7	A	America/Denver
FMY	Page Fld	26.586611	-81.86325	17	-5	A	America/New_York
FNL	Fort Collins Loveland Muni	40.451828	-105.011336	5016	-7	A	America/Denver
FNR	Funter Bay Seaplane Base	58.254444	-134.897778	0	-9	A	America/Anchorage
FNT	Bishop International	42.965424	-83.743629	782	-5	A	America/New_York
FOD	Fort Dodge Rgnl	42.5512	-94.191842	1157	-6	A	America/Chicago
FOE	Forbes Fld	38.950944	-95.663611	1078	-6	A	America/Chicago
FOK	Francis S Gabreski	40.843656	-72.631789	67	-5	A	America/New_York
FRD	Friday Harbor Airport	48.521944	-123.024444	113	-8	A	America/Los_Angeles
FRI	Marshall Aaf	39.055275	-96.764453	1063	-6	A	America/Chicago
FRN	Bryant Ahp	61.266381	-149.653119	378	-9	A	America/Anchorage
FRP	St Lucie County International Airport	27.497472	-80.372638	23	-5	A	America/New_York
FSD	Sioux Falls	43.582014	-96.741914	1429	-6	A	America/Chicago
FSI	Henry Post Aaf	34.649833	-98.402167	1189	-6	A	America/Chicago
FSM	Fort Smith Rgnl	35.336583	-94.367444	469	-6	A	America/Chicago
FST	Fort Stockton Pecos Co	30.915667	-102.916139	3011	-6	A	America/Chicago
FTK	Godman Aaf	37.907058	-85.972106	756	-5	A	America/New_York
FTW	Fort Worth Meacham Intl	32.819778	-97.362444	710	-6	A	America/Chicago
FTY	Fulton County Airport Brown Field	33.7791	-84.5214	841	-5	A	America/New_York
FUL	Fullerton Municipal Airport	33.521925	-117.584722	96	-8	A	America/Los_Angeles
FWA	Fort Wayne	40.978472	-85.195139	815	-5	A	America/New_York
FXE	Fort Lauderdale Executive	26.197281	-80.170706	13	-5	A	America/New_York
FYU	Fort Yukon	66.571492	-145.250417	433	-9	A	America/Anchorage
FYV	Drake Fld	36.005094	-94.170059	1251	-6	A	America/Chicago
FZG	Fitzgerald Municipal Airport	31.6839046	-83.2709036	365	-5	A	America/New_York
FZI	Fostoria Metropolitan Airport	41.1908333	-83.3930833	752	-5	A	America/New_York
GAD	Northeast Alabama Regional Airport	33.9726489	-86.0890834	569	-6	A	America/Chicago
GAI	Montgomery County Airpark	39.1006	-77.09576	0	-5	A	America/New_York
GAL	Edward G Pitka Sr	64.736178	-156.937417	152	-9	A	America/Anchorage
GAM	Gambell Airport	63.7668	-171.733	27	-9	A	America/Anchorage
GBN	Great Bend Municipal	38.344167	-98.859167	1887	-6	A	America/Chicago
GCC	Gillette-Campbell County Airport	44.3489167	-105.5393611	4365	-7	A	America/Denver
GCK	Garden City Rgnl	37.927528	-100.724417	2891	-6	A	America/Chicago
GCN	Grand Canyon National Park Airport	35.9523611	-112.1469722	6609	-7	N	America/Phoenix
GCW	Grand Canyon West Airport	35.5925	-113.4859	4825	-7	U	America/Phoenix
GDV	Dawson Community Airport	47.138611	-104.807222	749	-7	A	America/Denver
GDW	Gladwin Zettel Memorial Airport	43.9705893	-84.47502	774	-5	A	America/New_York
GED	Sussex Co	38.689194	-75.358889	50	-5	A	America/New_York
GEG	Spokane Intl	47.619861	-117.533833	2376	-8	A	America/Los_Angeles
GEU	Glendale Municipal Airport	33.5269167	-112.2951389	1071	-7	N	America/Phoenix
GFK	Grand Forks Intl	47.949256	-97.176111	845	-6	A	America/Chicago
GFL	Floyd Bennett Memorial Airport	43.341222	-73.610305	328	-5	A	America/New_York
GGE	Georgetown County Airport	33.3114018	-79.3203139	40	-5	A	America/New_York
GGG	East Texas Rgnl	32.384014	-94.711486	365	-6	A	America/Chicago
GGW	Wokal Field Glasgow International Airport	48.2125	-106.615	2296	-7	A	America/Denver
GHG	Marshfield Municipal Airport	42.09825	-70.6721389	9	-5	A	America/New_York
GIF	Gilbert Airport	28.062778	-81.753333	145	-5	A	America/New_York
GJT	Grand Junction Regional	39.122413	-108.526735	4858	-7	A	America/Denver
GKN	Gulkana	62.154888	-145.456639	1580	-9	A	America/Anchorage
GKY	Arlington Municipal	32.6638611	-97.0942778	628	-6	A	America/Chicago
GLD	Renner Fld	39.370621	-101.698992	3656	-7	A	America/Denver
GLH	Mid Delta Regional Airport	33.4829	-90.9856	131	-6	A	America/Chicago
GLS	Scholes Intl At Galveston	29.265322	-94.860406	6	-6	A	America/Chicago
GLV	Golovin Airport	64.550556	-163.007222	59	-9	A	America/Anchorage
GNT	Grants Milan Muni	35.167286	-107.901989	6537	-7	A	America/Denver
GNU	Goodnews Airport	59.1175	-161.5775	15	-9	A	America/Anchorage
GNV	Gainesville Rgnl	29.690056	-82.271778	152	-5	A	America/New_York
GON	Groton New London	41.330056	-72.045139	9	-5	A	America/New_York
GPT	Gulfport-Biloxi	30.407278	-89.070111	28	-6	A	America/Chicago
GPZ	Grand Rapids Itasca County	47.211111	-93.509722	413	-6	A	America/Chicago
GQQ	Galion Municipal Airport	40.7533889	-82.7238056	1224	-5	A	America/New_York
GRB	Austin Straubel Intl	44.485072	-88.129589	695	-6	A	America/Chicago
GRF	Gray Aaf	47.079217	-122.580783	302	-8	A	America/Los_Angeles
GRI	Central Nebraska Regional Airport	40.9675	-98.3096	1847	-6	A	America/Chicago
GRK	Robert Gray Aaf	31.06725	-97.828917	1015	-6	A	America/Chicago
GRM	Grand Marais Cook County Airport	47.8383333	-90.3829444	1799	-6	U	America/Chicago
GRR	Gerald R Ford Intl	42.880833	-85.522806	794	-5	A	America/New_York
GSB	Seymour Johnson Afb	35.339383	-77.960589	110	-5	A	America/New_York
GSO	Piedmont Triad	36.09775	-79.937306	925	-5	A	America/New_York
GSP	Greenville-Spartanburg International	34.895556	-82.218889	964	-5	A	America/New_York
GST	Gustavus Airport	58.4253	-135.707	34	-9	A	America/Anchorage
GTB	Wheeler Sack Aaf	44.055619	-75.719458	690	-5	A	America/New_York
GTF	Great Falls Intl	47.482	-111.370689	3677	-7	A	America/Denver
GTR	Golden Triangle Regional Airport	33.450333	-88.591361	264	-6	A	America/Chicago
GTU	Georgetown Municipal Airport	30.678809	-97.6793837	790	-6	A	America/Chicago
GUC	Gunnison - Crested Butte	38.533889	-106.933056	7678	-7	A	America/Denver
GUP	Gallup Muni	35.511058	-108.789308	6472	-7	A	America/Denver
GUS	Grissom Arb	40.648094	-86.152119	812	-5	A	America/New_York
GVL	Lee Gilmer Memorial Airport	34.272627	-83.8302233	1276	-5	A	America/New_York
GVQ	Genesee County Airport	43.03175	-78.1696667	914	-5	A	America/New_York
GVT	Majors	33.067839	-96.065333	535	-6	A	America/Chicago
GWO	Greenwood Leflore	33.494328	-90.084706	162	-6	A	America/Chicago
GYY	Gary Chicago International Airport	41.6163	-87.4128	591	-6	A	America/Chicago
HBG	Hattiesburg Bobby L. Chain Municipal Airport	31.2649444	-89.2528889	151	-6	A	America/Chicago
HBR	Hobart Muni	34.991308	-99.051353	1564	-6	A	America/Chicago
HCC	Columbia County	42.2913	-73.7103	198	-5	A	America/New_York
HCR	Holy Cross Airport	62.1883	-159.775	70	-9	A	America/Anchorage
HDH	Dillingham	21.579475	-158.197281	14	-10	A	Pacific/Honolulu
HDI	Hardwick Field Airport	35.2199994	-84.832369	874	-5	A	America/New_York
HDN	Yampa Valley	40.481181	-107.21766	6602	-7	A	America/Denver
HDO	Hondo Municipal Airport	29.3591	-99.1775	930	-6	A	America/Chicago
HFD	Hartford Brainard	41.736722	-72.649444	18	-5	A	America/New_York
HGR	Hagerstown Regional Richard A Henson Field	39.7079	-77.7295	704	-5	A	America/New_York
HHH	Hilton Head	32.216	-80.752	10	-5	U	America/New_York
HHI	Wheeler Aaf	21.4835	-158.039667	837	-10	A	Pacific/Honolulu
HHR	Jack Northrop Fld Hawthorne Muni	33.922839	-118.335186	66	-8	A	America/Los_Angeles
HIB	Chisholm Hibbing	47.3866	-92.838994	1353	-6	A	America/Chicago
HIF	Hill Afb	41.123939	-111.973039	4789	-7	A	America/Denver
HII	Lake Havasu City Airport	34.5711111	-114.3582778	783	-7	N	America/Phoenix
HIO	Portland Hillsboro	45.540394	-122.949825	204	-8	A	America/Los_Angeles
HKB	Healy River Airport	63.8675	-148.968889	1263	-9	A	America/Anchorage
HKY	Hickory Rgnl	35.741147	-81.38955	1189	-5	A	America/New_York
HLG	Wheeling Ohio County Airport	40.175	-80.6463	1195	-5	A	America/New_York
HLN	Helena Rgnl	46.606806	-111.98275	3877	-7	A	America/Denver
HLR	Hood Aaf	31.138731	-97.714469	924	-6	A	America/Chicago
HMN	Holloman Afb	32.852519	-106.106525	4093	-7	A	America/Denver
HNH	Hoonah Airport	58.096111	-135.409722	19	-9	A	America/Anchorage
HNL	Honolulu Intl	21.318681	-157.922428	13	-10	N	Pacific/Honolulu
HNM	Hana	20.795636	-156.014439	78	-10	A	Pacific/Honolulu
HNS	Haines Airport	59.2438	-135.524	15	-9	A	America/Anchorage
HOB	Lea Co Rgnl	32.687528	-103.217028	3661	-7	A	America/Denver
HOM	Homer	59.645556	-151.476583	84	-9	A	America/Anchorage
HON	Huron Rgnl	44.3852	-98.228542	1289	-6	A	America/Chicago
HOP	Campbell Aaf	36.668567	-87.496183	573	-6	A	America/Chicago
HOT	Memorial Field	34.478	-93.0962	540	-6	A	America/Chicago
HOU	William P Hobby	29.645419	-95.278889	46	-6	A	America/Chicago
HPB	Hooper Bay Airport	61.5239	-166.147	7	-9	A	America/Anchorage
HPN	Westchester Co	41.066959	-73.707575	439	-5	A	America/New_York
HQM	Bowerman Field	46.9711944	-123.9365556	18	-8	A	America/Los_Angeles
HQU	McDuffie County Airport	33.5297315	-82.5169509	501	-5	A	America/New_York
HRL	Valley Intl	26.2285	-97.654389	36	-6	A	America/Chicago
HRO	Boone Co	36.261519	-93.154728	1365	-6	A	America/Chicago
HRT	Hurlburt Fld	30.427803	-86.689278	38	-6	A	America/Chicago
HSH	Henderson Executive Airport	35.972778	-115.134444	1881	-8	A	America/Los_Angeles
HSL	Huslia Airport	65.697778	-156.351389	213	-9	A	America/Anchorage
HST	Homestead Arb	25.48855	-80.383567	6	-5	A	America/New_York
HSV	Huntsville International Airport-Carl T Jones Field	34.6371944	-86.7750556	629	-6	A	America/Chicago
HTL	Roscommon Co	44.359806	-84.671112	1150	-5	A	America/New_York
HTS	Tri State Milton J Ferguson Field	38.3667	-82.558	828	-5	A	America/New_York
HUA	Redstone Aaf	34.678653	-86.684781	685	-6	A	America/Chicago
HUF	Terre Haute Intl Hulman Fld	39.451464	-87.307561	589	-5	A	America/New_York
HUL	Houlton Intl	46.123083	-67.792056	489	-5	A	America/New_York
HUS	Hughes Airport	66.039167	-154.264722	299	-9	A	America/Anchorage
HUT	Hutchinson Municipal Airport	38.0655	-97.8606	1543	-6	A	America/Chicago
HVN	Tweed-New Haven Airport	41.26375	-72.886806	14	-5	A	America/New_York
HVR	Havre City Co	48.542983	-109.762342	2590	-7	A	America/Denver
HWD	Hayward Executive Airport	37.65888888888889	-122.12166666666666	52	-8	A	America/Los_Angeles
HWO	North Perry	26.001222	-80.240722	8	-5	A	America/New_York
HXD	Hilton Head Airport	32.2243611	-80.6974722	19	-5	A	America/New_York
HYA	Barnstable Muni Boardman Polando Fld	41.669336	-70.280356	55	-5	A	America/New_York
HYG	Hydaburg Seaplane Base	55.206389	-132.828333	0	-9	A	America/Anchorage
HYL	Hollis Seaplane Base	55.481667	-132.646111	0	-9	A	America/Anchorage
HYS	Hays Regional Airport	38.8422	-99.2732	1998	-6	A	America/Chicago
HZL	Hazleton Municipal	40.989167	-76.0025	1603	-5	A	America/New_York
IAB	Mc Connell Afb	37.621853	-97.268192	1371	-6	A	America/Chicago
IAD	Washington Dulles Intl	38.944533	-77.455811	313	-5	A	America/New_York
IAG	Niagara Falls Intl	43.107333	-78.946194	589	-5	A	America/New_York
IAH	George Bush Intercontinental	29.984433	-95.341442	97	-6	A	America/Chicago
IAN	Bob Baker Memorial Airport	66.975833	-160.436667	166	-9	A	America/Anchorage
ICT	Wichita Mid Continent	37.649944	-97.433056	1333	-6	A	America/Chicago
ICY	Icy Bay Airport	59.968889	-141.661667	50	-9	A	America/Anchorage
IDA	Idaho Falls Rgnl	43.514556	-112.07075	4744	-7	A	America/Denver
IDL	Idlewild Intl	40.639751	-73.778924	13	-5	A	America/New_York
IFP	Laughlin-Bullhead Intl	35.1574	-114.56	695	-7	A	America/Phoenix
IGG	Igiugig Airport	59.324	-155.902	90	-9	A	America/Anchorage
IGM	Kingman Airport	35.2595	-113.938	3449	-7	A	America/Phoenix
IGQ	Lansing Municipal	41.5349167	-87.5295278	620	-6	A	America/Chicago
IJD	Windham Airport	41.7440278	-72.1802222	246	-5	A	America/New_York
IKK	Greater Kankakee	41.071389	-87.846278	630	-6	A	America/Chicago
IKO	Nikolski Air Station	52.941667	-168.848889	77	-9	A	America/Anchorage
IKR	Kirtland Air Force Base	35.040222	-106.609194	5355	-7	A	America/Denver
IKV	Ankeny Regl Airport	41.691389	-93.566389	910	-6	A	America/Chicago
ILG	New Castle	39.678722	-75.606528	79	-5	A	America/New_York
ILI	Iliamna	59.754356	-154.910961	186	-9	A	America/Anchorage
ILM	Wilmington Intl	34.270615	-77.902569	32	-5	A	America/New_York
ILN	Wilmington Airborne Airpark	39.42792	-83.792118	1077	-5	U	America/New_York
IMM	Immokalee	26.433889	-81.401389	37	-5	A	America/New_York
IMT	Ford Airport	45.8183611	-88.1145556	1182	-6	A	America/Chicago
IND	Indianapolis Intl	39.717331	-86.294383	797	-5	A	America/New_York
INJ	Hillsboro Muni	32.083486	-97.097228	685	-6	A	America/Chicago
INK	Winkler Co	31.779628	-103.201361	2822	-6	A	America/Chicago
INL	Falls Intl	48.566186	-93.403067	1185	-6	A	America/Chicago
INS	Creech Afb	36.587183	-115.673353	3133	-8	A	America/Los_Angeles
INT	Smith Reynolds	36.133722	-80.222	969	-5	A	America/New_York
INW	Winslow-Lindbergh Regional Airport	35.0219167	-110.7225278	4941	-7	N	America/Phoenix
IOW	Iowa City Municipal Airport	41.639244	-91.546503	668	-6	A	America/Chicago
IPL	Imperial Co	32.834219	-115.578744	-54	-8	A	America/Los_Angeles
IPT	Williamsport Rgnl	41.241836	-76.921094	529	-5	A	America/New_York
IRC	Circle City Airport	65.827778	-144.076111	613	-9	A	America/Anchorage
IRK	Kirksville Regional Airport	40.0935	-92.5449	966	-6	A	America/Chicago
ISM	Kissimmee Gateway Airport	28.289806	-81.437083	82	-5	A	America/New_York
ISN	Sloulin Fld Intl	48.177939	-103.642347	1982	-6	A	America/Chicago
ISO	Kinston Regional Jetport	35.331389	-77.608889	94	-5	A	America/New_York
ISP	Long Island Mac Arthur	40.79525	-73.100222	99	-5	A	America/New_York
ISW	Alexander Field South Wood County Airport	44.3606456	-89.8381412	1021	-6	A	America/Chicago
ITH	Ithaca Tompkins Rgnl	42.491028	-76.458444	1099	-5	A	America/New_York
ITO	Hilo Intl	19.721375	-155.048469	38	-10	N	Pacific/Honolulu
IWD	Gogebic Iron County Airport	46.5274747	-90.1313967	1230	-6	U	America/Chicago
IWS	West Houston	29.818194	-95.672611	111	-6	A	America/Chicago
IYK	Inyokern Airport	35.658889	-117.829444	2455	-8	A	America/Los_Angeles
IZG	Eastern Slopes Regional	43.9911389	-70.9478889	455	-5	A	America/New_York
JAC	Jackson Hole Airport	43.607333333	-110.73775	6451	-7	A	America/Denver
JAN	Jackson Evers Intl	32.311167	-90.075889	346	-6	A	America/Chicago
JAX	Jacksonville Intl	30.494056	-81.687861	30	-5	A	America/New_York
JBR	Jonesboro Muni	35.831708	-90.646417	262	-6	A	America/Chicago
JCI	New Century AirCenter Airport	38.8309167	-94.8903056	1087	-6	A	America/Chicago
JEF	Jefferson City Memorial Airport	38.5912	-92.1561	549	-6	A	America/Chicago
JES	Jesup-Wayne County Airport	31.553889	-81.8825	107	-5	A	America/New_York
JFK	John F Kennedy Intl	40.639751	-73.778925	13	-5	A	America/New_York
JGC	Grand Canyon Heliport	35.96666666	-112.13333333	2500	-7	A	America/Phoenix
JHM	Kapalua	20.962936	-156.673031	256	-10	N	Pacific/Honolulu
JHW	Chautauqua County-Jamestown	42.153333	-79.258056	525	-5	A	America/New_York
JKA	Jack Edwards Airport	30.2896389	-87.6717778	17	-6	A	America/Chicago
JLN	Joplin Rgnl	37.151814	-94.498269	981	-6	A	America/Chicago
JMS	Jamestown Regional Airport	46.9297	-98.6782	1498	-6	A	America/Chicago
JNU	Juneau Intl	58.354972	-134.576278	21	-9	A	America/Anchorage
JOT	Regional Airport	41.517778	-88.175556	582	-6	A	America/Chicago
JRA	West 30th St. Heliport	40.7545	-74.0071	7	-5	A	America/New_York
JRB	Wall Street Heliport	40.701214	-74.009028	7	-5	A	America/New_York
JST	John Murtha Johnstown-Cambria County Airport	40.316111	-78.833889	2284	-5	A	America/New_York
JVL	Southern Wisconsin Regional Airport	42.62025	-89.0415556	808	-6	A	America/Chicago
JXN	Reynolds Field	42.260556	-84.460556	1001	-5	A	America/New_York
JYL	Plantation Airpark	32.6452778	-81.5971111	188	-5	A	America/New_York
JYO	Leesburg Executive Airport	39.078	-77.558	389	-5	A	America/New_York
JZP	Pickens County Airport	34.4534722	-84.4572222	1535	-5	A	America/New_York
K03	Wainwright As	70.613378	-159.86035	35	-9	A	America/Anchorage
K27	Burrello-Mechanicville Airport	42.893133	-73.66845	195	-5	A	America/New_York
K83	Sabetha Municipal	39.5425	-95.4677	1330	-6	A	America/Chicago
KAE	Kake Seaplane Base	56.973056	-133.945556	0	-9	A	America/Anchorage
KAL	Kaltag Airport	64.3191	-158.741	187	-9	A	America/Anchorage
KBC	Birch Creek Airport	66.256708	-145.815319	450	-9	A	America/Anchorage
KBW	Chignik Bay Seaplane Base	56.295556	-158.401398	0	-9	A	America/Anchorage
KCC	Coffman Cove Seaplane Base	56.014722	-132.833889	0	-9	A	America/Anchorage
KCL	Chignik Lagoon Airport	56.311111	-158.534167	25	-9	A	America/Anchorage
KCQ	Chignik Lake Airport	56.255	-158.775278	50	-9	A	America/Anchorage
KEH	Kenmore Air Harbor Inc Seaplane Base	47.7548	-122.259	14	-8	A	America/Los_Angeles
KEK	Ekwok Airport	59.356944	-157.471111	135	-9	A	America/Anchorage
KFP	False Pass Airport	54.8475	-163.410278	20	-9	A	America/Anchorage
KGK	Koliganek Airport	59.726667	-157.259444	269	-9	A	America/Anchorage
KGX	Grayling Airport	62.894444	-160.065	99	-9	A	America/Anchorage
KKA	Koyuk Alfred Adams Airport	64.939444	-161.154167	154	-9	A	America/Anchorage
KKB	Kitoi Bay Seaplane Base	58.190833	-152.370556	0	-9	A	America/Anchorage
KKH	Kongiganak Airport	59.960833	-162.881111	30	-9	A	America/Anchorage
KLG	Kalskag Airport	61.5363	-160.341	55	-9	A	America/Anchorage
KLL	Levelock Airport	59.128056	-156.858611	39	-9	A	America/Anchorage
KLN	Larsen Bay Airport	57.535	-153.976667	87	-9	A	America/Anchorage
KLS	Kelso Longview	46.118	-122.898389	20	-8	A	America/Los_Angeles
KLW	Klawock Airport	55.579167	-133.076111	80	-9	A	America/Anchorage
KMO	Manokotak Airport	58.990278	-159.05	51	-9	A	America/Anchorage
KMY	Moser Bay Seaplane Base	57.025556	-154.145833	0	-9	A	America/Anchorage
KNW	New Stuyahok Airport	59.4499	-157.328	302	-9	A	America/Anchorage
KOA	Kona Intl At Keahole	19.738767	-156.045631	47	-10	N	Pacific/Honolulu
KOT	Kotlik Airport	63.030556	-163.532778	15	-9	A	America/Anchorage
KOY	Olga Bay Seaplane Base	57.161389	-154.229722	0	-9	A	America/Anchorage
KOZ	Ouzinkie Airport	57.922876	-152.500511	55	-9	A	America/Anchorage
KPB	Point Baker Seaplane Base	56.351944	-133.6225	0	-9	A	America/Anchorage
KPC	Port Clarence Coast Guard Station	65.2537	-166.859	10	-9	A	America/Anchorage
KPN	Kipnuk Airport	59.933056	-164.030556	11	-9	A	America/Anchorage
KPR	Port Williams Seaplane Base	58.49	-152.582222	0	-9	A	America/Anchorage
KPV	Perryville Airport	55.906667	-159.160833	29	-9	A	America/Anchorage
KPY	Port Bailey Seaplane Base	57.93	-153.040556	0	-9	A	America/Anchorage
KQA	Akutan Seaplane Base	54.1325	-165.785	0	-9	A	America/Anchorage
KSM	St Marys Airport	62.0605	-163.302	311	-9	A	America/Anchorage
KTB	Thorne Bay Seaplane Base	55.688056	-132.536667	0	-9	A	America/Anchorage
KTN	Ketchikan Intl	55.355556	-131.71375	88	-9	A	America/Anchorage
KTS	Brevig Mission Airport	65.331389	-166.465833	35	-9	A	America/Anchorage
KUK	Kasigluk Airport	60.873333	-162.524444	40	-9	A	America/Anchorage
KVC	King Cove Airport	55.1163	-162.266	155	-9	A	America/Anchorage
KVL	Kivalina Airport	67.7362	-164.563	13	-9	A	America/Anchorage
KWK	Kwigillingok Airport	59.876389	-163.168611	18	-9	A	America/Anchorage
KWN	Quinhagak Airport	59.755	-161.845278	42	-9	A	America/Anchorage
KWP	West Point Village Seaplane Base	57.77	-153.548889	0	-9	A	America/Anchorage
KWT	Kwethluk Airport	60.790278	-161.443611	30	-9	A	America/Anchorage
KYK	Karuluk Airport	57.566944	-154.450278	137	-9	A	America/Anchorage
KYU	Koyukuk Airport	64.875833	-157.730556	149	-9	A	America/Anchorage
KZB	Zachar Bay Seaplane Base	57.55	-153.75	0	-9	A	America/Anchorage
L06	Furnace Creek	36.273	-116.515	0	-8	A	America/Los_Angeles
L35	Big Bear City	34.2637778	-116.8560278	6725	-8	A	America/Los_Angeles
L52	Oceano County Airport	35.10147222	-120.62236111	14	-8	U	America/Los_Angeles
LAA	Lamar Muni	38.069694	-102.6885	3706	-7	A	America/Denver
LAF	Purude University Airport	40.4123056	-86.9368889	606	-5	A	America/New_York
LAL	Lakeland Linder Regional Airport	27.9889167	-82.0185556	142	-5	A	America/New_York
LAM	Los Alamos Airport	35.8798019	-106.2694153	7171	-7	A	America/Denver
LAN	Capital City	42.7787	-84.587357	861	-5	A	America/New_York
LAR	Laramie Regional Airport	41.3121	-105.675	7284	-7	A	America/Denver
LAS	Mc Carran Intl	36.080056	-115.15225	2141	-8	A	America/Los_Angeles
LAW	Lawton-Fort Sill Regional Airport	34.5677144	-98.4166367	1110	-6	A	America/Chicago
LAX	Los Angeles Intl	33.942536	-118.408075	126	-8	A	America/Los_Angeles
LBB	Lubbock Preston Smith Intl	33.663639	-101.822778	3282	-6	A	America/Chicago
LBE	Arnold Palmer Regional Airport	40.2759	-79.4048	1185	-5	A	America/New_York
LBF	North Platte Regional Airport Lee Bird Field	41.1262	-100.684	2776	-6	A	America/Chicago
LBL	Liberal Muni	37.044222	-100.95986	2885	-6	A	America/Chicago
LBT	Municipal Airport	34.6098056	-79.0595556	125	-5	A	America/New_York
LCH	Lake Charles Rgnl	30.126112	-93.223335	15	-6	A	America/Chicago
LCK	Rickenbacker Intl	39.813786	-82.927822	744	-5	A	America/New_York
LCQ	Lake City Municipal Airport	30.181944	-82.576944	201	-5	A	America/New_York
LDJ	Linden Airport	40.6174472	-74.2445942	23	-5	A	America/New_York
LEB	Lebanon Municipal Airport	43.6261	-72.3042	603	-5	A	America/New_York
LEW	Lewiston Maine	44.0484728	-70.2835075	288	-5	A	America/New_York
LEX	Blue Grass	38.0365	-84.605889	979	-5	A	America/New_York
LFI	Langley Afb	37.082881	-76.360547	11	-5	A	America/New_York
LFK	Angelina Co	31.234014	-94.75	296	-6	A	America/Chicago
LFT	Lafayette Rgnl	30.205278	-91.987611	43	-6	A	America/Chicago
LGA	La Guardia	40.777245	-73.872608	22	-5	A	America/New_York
LGB	Long Beach	33.817722	-118.151611	60	-8	A	America/Los_Angeles
LGC	LaGrange-Callaway Airport	33.0088611	-85.0726111	694	-5	A	America/New_York
LGU	Logan-Cache	41.791	-111.852	4457	-7	A	America/Denver
LHD	Lake Hood Seaplane Base	61.1866382	-149.9653918	71	-9	A	America/Anchorage
LHM	Lincoln Regional Airport Karl Harder Field	38.9091667	-121.3513333	121	-8	A	America/Los_Angeles
LHV	William T. Piper Mem.	41.1357778	-77.4223056	556	-5	A	America/New_York
LHX	La Junta Muni	38.049719	-103.509431	4238	-7	A	America/Denver
LIH	Lihue	21.975983	-159.338958	153	-10	N	Pacific/Honolulu
LIT	Adams Fld	34.729444	-92.224306	262	-6	A	America/Chicago
LIV	Livingood Airport	65.531111	-148.541111	696	-9	A	America/Anchorage
LKE	Kenmore Air Harbor Seaplane Base	47.629	-122.339	14	-8	A	America/Los_Angeles
LKK	Kulik Lake Airport	58.96591	-155.108089	1000	-9	U	America/Anchorage
LKP	Lake Placid Airport	44.264444	-73.961944	1747	-5	A	America/New_York
LMT	Klamath Falls Airport	42.1561	-121.733	4095	-8	A	America/Los_Angeles
LNA	Palm Beach Co Park	26.593	-80.085056	14	-5	A	America/New_York
LNK	Lincoln	40.850971	-96.75925	1219	-6	A	America/Chicago
LNN	Lost Nation Municipal Airport	41.6840278	-81.38975	626	-5	A	America/New_York
LNR	Tri-County Regional Airport	43.211667	-90.181667	718	-6	A	America/Chicago
LNS	Lancaster Airport	40.1217	-76.2961	403	-5	A	America/New_York
LNY	Lanai	20.785611	-156.951419	1308	-10	N	Pacific/Honolulu
LOT	Lewis University Airport	41.606326	-88.083003	680	-6	A	America/Chicago
LOU	Bowman Fld	38.228	-85.663722	546	-5	A	America/New_York
LOZ	London-Corbin Airport-MaGee Field	37.0868889	-84.0773889	1212	-5	A	America/New_York
LPC	Lompoc Airport	34.6656	-120.4675	88	-8	A	America/Los_Angeles
LPR	Lorain County Regional Airport	41.3442778	-82.1776389	793	-5	A	America/New_York
LPS	Lopez Island Airport	48.4839	-122.938	209	-8	A	America/Los_Angeles
LRD	Laredo Intl	27.54375	-99.461556	508	-6	A	America/Chicago
LRF	Little Rock Afb	34.916944	-92.149722	311	-6	A	America/Chicago
LRO	Mount Pleasant Regional-Faison Field	32.5387	-79.4697	12	-5	A	\N
LRU	Las Cruces Intl	32.289417	-106.921972	4456	-7	A	America/Denver
LSE	La Crosse Municipal	43.878986	-91.256711	654	-6	A	America/Chicago
LSF	Lawson Aaf	32.337322	-84.991283	232	-5	A	America/New_York
LSV	Nellis Afb	36.236197	-115.034253	1870	-8	A	America/Los_Angeles
LTS	Altus Afb	34.667067	-99.266681	1382	-6	A	America/Chicago
LUF	Luke Afb	33.535	-112.38306	1085	-7	A	America/Phoenix
LUK	Cincinnati Muni Lunken Fld	39.103333	-84.418611	483	-5	A	America/New_York
LUP	Kalaupapa Airport	21.211	-156.974	24	-10	A	Pacific/Honolulu
LUR	Cape Lisburne Lrrs	68.875133	-166.110022	12	-9	A	America/Anchorage
LVK	Livermore Municipal	37.41362	-121.49133	400	-8	A	America/Los_Angeles
LVM	Mission Field Airport	45.6993889	-110.4483056	4660	-7	A	America/Denver
LVS	Las Vegas Muni	35.654222	-105.142389	6877	-7	A	America/Denver
LWA	South Haven Area Regional Airport	42.3511944	-86.2556389	666	-5	A	America/New_York
LWB	Greenbrier Valley Airport	37.858333	-80.399444	2302	-5	U	America/New_York
LWC	Lawrence Municipal	39.009167	-95.2175	833	-6	A	America/Chicago
LWM	Lawrence Municipal Airport	42.7171944	-71.1234167	148	-5	A	America/New_York
LWS	Lewiston Nez Perce Co	46.3745	-117.015389	1442	-8	A	America/Los_Angeles
LWT	Lewistown Municipal Airport	47.0493	-109.467	4170	-7	A	America/Denver
LXY	Mexia - Limestone County Airport	31.6411783	-96.5144594	544	-6	A	America/Chicago
LYH	Lynchburg Regional Preston Glenn Field	37.3267	-79.2004	938	-5	A	America/New_York
LYU	Ely Municipal	47.824444	-91.830833	1456	-6	A	America/Chicago
LZU	Gwinnett County Airport-Briscoe Field	33.9780761	-83.9623772	1061	-5	A	America/New_York
M94	Desert Aire	46.4124	-119.5518	586	-8	A	America/Los_Angeles
MAE	Madera Municipal Airport	36.9886111	-120.1124444	255	-8	A	America/Los_Angeles
MAF	Midland Intl	31.942528	-102.201914	2871	-6	A	America/Chicago
MBL	Manistee County-Blacker Airport	44.2725	-86.246944	621	-5	A	America/New_York
MBS	Mbs Intl	43.532913	-84.079647	668	-5	A	America/New_York
MCC	Mc Clellan Afld	38.667639	-121.400611	75	-8	A	America/Los_Angeles
MCD	Mackinac Island Airport	45.8649344	-84.637344	740	-5	U	America/New_York
MCE	Merced Municipal Airport	37.284722	-120.513889	156	-8	A	America/Los_Angeles
MCF	Macdill Afb	27.849339	-82.521214	14	-5	A	America/New_York
MCG	McGrath Airport	62.9529	-155.606	338	-9	A	America/Anchorage
MCI	Kansas City Intl	39.297606	-94.713905	1026	-6	A	America/Chicago
MCK	McCook Regional Airport	40.206389	-100.592222	2583	-6	A	America/Chicago
MCL	McKinley National Park Airport	63.732757	-148.91129	1720	-9	A	America/Anchorage
MCN	Middle Georgia Rgnl	32.69285	-83.649211	354	-5	A	America/New_York
MCO	Orlando Intl	28.429394	-81.308994	96	-5	A	America/New_York
MCW	Mason City Municipal	43.2247	-93.4067	1243	-6	A	America/Chicago
MDT	Harrisburg Intl	40.193494	-76.763403	310	-5	A	America/New_York
MDW	Chicago Midway Intl	41.785972	-87.752417	620	-6	A	America/Chicago
ME5	Banks Airport	44.1653889	-68.4281667	100	-5	A	America/New_York
MEI	Key Field	32.332624	-88.751868	297	-6	A	America/Chicago
MEM	Memphis Intl	35.042417	-89.976667	341	-6	A	America/Chicago
MER	Castle	37.380481	-120.568189	189	-8	A	America/Los_Angeles
MFD	Mansfield Lahm Regional	40.8214167	-82.5166389	1297	-5	A	America/New_York
MFE	Mc Allen Miller Intl	26.175833	-98.238611	107	-6	A	America/Chicago
MFI	Marshfield Municipal Airport	44.6368797	-90.1893267	1278	-6	A	America/Chicago
MFR	Rogue Valley Intl Medford	42.374228	-122.8735	1335	-8	A	America/Los_Angeles
MGC	Michigan City Municipal Airport	41.7033	-86.8211	500	-6	A	America/Chicago
MGE	Dobbins Arb	33.915382	-84.516319	1068	-5	A	America/New_York
MGJ	Orange County Airport	41.5099884	-74.2646444	364	-5	A	America/New_York
MGM	Montgomery Regional Airport	32.3006389	-86.3939722	221	-6	A	America/Chicago
MGR	Moultrie Municipal Airport	31.0849167	-83.80325	294	-5	A	America/New_York
MGW	Morgantown Muni Walter L Bill Hart Fld	39.642908	-79.916314	1248	-5	A	America/New_York
MGY	Dayton-Wright Brothers Airport	39.5889722	-84.2248611	957	-5	U	America/New_York
MHK	Manhattan Reigonal	39.140972	-96.670833	1057	-6	A	America/Chicago
MHM	Minchumina Airport	63.886111	-152.301944	678	-9	A	America/Anchorage
MHR	Sacramento Mather	38.553897	-121.297592	96	-8	A	America/Los_Angeles
MHT	Manchester Regional Airport	42.932556	-71.435667	266	-5	A	America/New_York
MHV	Mojave	35.059364	-118.151856	2791	-8	A	America/Los_Angeles
MIA	Miami Intl	25.79325	-80.290556	8	-5	A	America/New_York
MIB	Minot Afb	48.415572	-101.357661	1668	-6	A	America/Chicago
MIC	Crystal Airport	45.0343	-93.2114	869	-6	A	America/Chicago
MIE	Delaware County Airport	40.2424722	-85.39575	937	-5	U	America/New_York
MIV	Millville Muni	39.367806	-75.072222	85	-5	A	America/New_York
MKC	Downtown	39.1275	-94.598889	759	-6	A	America/Chicago
MKE	General Mitchell Intl	42.947222	-87.896583	723	-6	A	America/Chicago
MKG	Muskegon County Airport	43.1695	-86.2382	628	-5	A	America/New_York
MKK	Molokai	21.152886	-157.096256	454	-10	N	Pacific/Honolulu
MKL	Mc Kellar Sipes Rgnl	35.599889	-88.915611	434	-6	A	America/Chicago
MKO	Davis Fld	35.656489	-95.366656	612	-6	A	America/Chicago
MLB	Melbourne Intl	28.102753	-80.645258	33	-5	A	America/New_York
MLC	Mc Alester Rgnl	34.882403	-95.783463	770	-6	A	America/Chicago
MLD	Malad City	42.17	-112.289	4503	-7	A	America/Denver
MLI	Quad City Intl	41.448528	-90.507539	590	-6	A	America/Chicago
MLJ	Baldwin County Airport	33.154225	-83.2414139	385	-5	A	America/New_York
MLL	Marshall Don Hunter Sr. Airport	61.8646418	-162.026111	103	-9	A	America/Anchorage
MLS	Frank Wiley Field	46.428	-105.886	2630	-7	A	America/Denver
MLT	Millinocket Muni	45.647836	-68.685561	408	-5	A	America/New_York
MLU	Monroe Rgnl	32.510864	-92.037689	79	-6	A	America/Chicago
MLY	Manley Hot Springs Airport	64.9975	-150.644167	270	-9	A	America/Anchorage
MMH	Mammoth Yosemite Airport	37.624049	-118.837772	7128	-8	A	America/Los_Angeles
MMI	McMinn Co	35.39919	-84.56177	874	-5	N	America/New_York
MMU	Morristown Municipal Airport	40.79935	-74.4148747	187	-5	A	America/New_York
MMV	Mc Minnville Muni	45.194444	-123.135944	163	-8	A	America/Los_Angeles
MNM	Menominee Marinette Twin Co	45.12665	-87.638443	625	-6	A	America/Chicago
MNT	Minto Airport	65.143611	-149.37	460	-9	A	America/Anchorage
MNZ	Manassas	38.721389	-77.515556	192	-5	A	America/New_York
MOB	Mobile Rgnl	30.691231	-88.242814	219	-6	A	America/Chicago
MOD	Modesto City Co Harry Sham	37.625817	-120.954422	97	-8	A	America/Los_Angeles
MOT	Minot Intl	48.259378	-101.280333	1716	-6	A	America/Chicago
MOU	Mountain Village Airport	62.0954	-163.682	337	-9	A	America/Anchorage
MPB	Miami Seaplane Base	25.7783	-80.1703	0	-5	A	America/New_York
MPI	MariposaYosemite	37.3039	-120.0222	2454	-8	A	America/Los_Angeles
MPV	Edward F Knapp State	44.203503	-72.562328	1165	-5	A	America/New_York
MQB	Macomb Municipal Airport	40.5200833	-90.6523889	707	-6	U	America/Chicago
MQI	Dare County Regional	35.5514	-75.4173	13	-5	A	America/New_York
MQT	Sawyer International Airport	46.353611	-87.395278	1221	-5	A	America/New_York
MRB	Eastern WV Regional Airport	39.2407	-77.591	554	-5	A	America/New_York
MRI	Merrill Fld	61.213544	-149.844447	137	-9	A	America/Anchorage
MRK	Marco Islands	25.9950278	-81.6725278	5	-5	A	America/New_York
MRN	Foothills Regional Airport	35.8202336	-81.6115119	1270	-5	A	America/New_York
MRY	Monterey Peninsula	36.587	-121.842944	257	-8	A	America/Los_Angeles
MSL	Northwest Alabama Regional Airport	34.7453	-87.6102	550	-6	A	America/Chicago
MSN	Dane Co Rgnl Truax Fld	43.139858	-89.337514	887	-6	A	America/Chicago
MSO	Missoula Intl	46.916306	-114.090556	3205	-7	A	America/Denver
MSP	Minneapolis St Paul Intl	44.881956	-93.221767	841	-6	A	America/Chicago
MSS	Massena Intl Richards Fld	44.935833	-74.845547	215	-5	A	America/New_York
MSY	Louis Armstrong New Orleans Intl	29.993389	-90.258028	4	-6	A	America/Chicago
MTC	Selfridge Angb	42.608333	-82.8355	580	-5	A	America/New_York
MTH	Florida Keys Marathon Airport	24.726111	-81.051389	7	-5	A	America/New_York
MTJ	Montrose Regional Airport	38.509794	-107.894242	5759	-7	A	America/Denver
MTM	Metlakatla Seaplane Base	55.131111	-131.578056	0	-9	A	America/Anchorage
MTN	Martin State	39.3256667	-76.4137778	22	-5	A	America/New_York
MUE	Waimea Kohala	20.001328	-155.668108	2671	-10	A	Pacific/Honolulu
MUI	Muir Aaf	40.434811	-76.569411	489	-5	A	America/New_York
MUO	Mountain Home Afb	43.043603	-115.872431	2996	-7	A	America/Denver
MVL	Morrisville Stowe State Airport	44.535	-72.614	732	-5	A	America/New_York
MVY	Martha\\\\'s Vineyard	41.391667	-70.615278	67	-5	A	America/New_York
MWA	Williamson Country Regional Airport	37.7549569	-89.0110936	472	-6	A	America/Chicago
MWC	Lawrence J Timmerman Airport	43.1103889	-88.0344167	745	-6	A	America/Chicago
MWH	Grant Co Intl	47.207708	-119.32019	1185	-8	A	America/Los_Angeles
MWL	Mineral Wells	32.781606	-98.060175	974	-6	A	America/Chicago
MWM	Windom Municipal Airport	43.9134017	-95.1094083	1410	-6	A	America/Chicago
MXF	Maxwell Afb	32.382944	-86.365778	171	-6	A	America/Chicago
MXY	McCarthy Airport	61.4370608	-142.90307372	1531	-9	U	America/Anchorage
MYF	Montgomery Field	32.4759	117.759	17	8	A	Asia/Chongqing
MYL	McCall Municipal Airport	44.889722	-116.101389	5021	-7	A	America/Denver
MYR	Myrtle Beach Intl	33.67975	-78.928333	25	-5	A	America/New_York
MYU	Mekoryuk Airport	60.3714	-166.271	48	-9	A	America/Anchorage
MYV	Yuba County Airport	39.0553	-121.3411	62	-8	A	America/Los_Angeles
MZJ	Pinal Airpark	32.509722	-111.325278	1893	-7	N	America/Phoenix
N53	Stroudsburg-Pocono Airport	41.0358717	-75.1606789	480	-5	A	America/New_York
N69	Stormville Airport	41.5769708	-73.7323514	358	-5	A	America/New_York
N87	Trenton-Robbinsville Airport	40.2139444	-74.6017778	118	-5	A	America/New_York
NBG	New Orleans Nas Jrb	29.825333	-90.035	3	-6	A	America/Chicago
NBU	Naval Air Station	42.090556	-87.8225	653	-6	A	America/Chicago
NCN	Chenega Bay Airport	60.077222	-147.991944	72	-9	A	America/Anchorage
NEL	Lakehurst Naes	40.033333	-74.353333	103	-5	A	America/New_York
NEW	Lakefront	30.0424167	-90.02825	7	-6	A	America/Chicago
NFL	Fallon Nas	39.416584	-118.70098	3934	-8	A	America/Los_Angeles
NGF	Kaneohe Bay Mcaf	21.450453	-157.768	24	-10	A	Pacific/Honolulu
NGP	Corpus Christi NAS	27.692701	-97.290376	18	-6	A	America/Chicago
NGU	Norfolk Ns	36.937644	-76.289289	15	-5	A	America/New_York
NGZ	NAS Alameda	37.7861	-122.3186	10	-8	U	America/Los_Angeles
NHK	Patuxent River Nas	38.285981	-76.411781	39	-5	A	America/New_York
NIB	Nikolai Airport	63.010833	-154.383889	427	-9	A	America/Anchorage
NID	China Lake Naws	35.685422	-117.692039	2283	-8	A	America/Los_Angeles
NIP	Jacksonville Nas	30.235834	-81.680556	22	-5	A	America/New_York
NJK	El Centro Naf	32.829222	-115.671667	-42	-8	A	America/Los_Angeles
NKT	Cherry Point Mcas	34.900872	-76.880733	29	-5	A	America/New_York
NKX	Miramar Mcas	32.867694	-117.14175	478	-8	A	America/Los_Angeles
NLC	Lemoore Nas	36.333012	-119.95208	234	-8	A	America/Los_Angeles
NLG	Nelson Lagoon	56.0075	-161.160278	14	-9	A	America/Anchorage
NME	Nightmute Airport	60.471111	-164.700833	4	-9	A	America/Anchorage
NMM	Meridian Nas	32.552083	-88.555557	317	-6	A	America/Chicago
NNL	Nondalton Airport	59.966944	-154.851667	262	-9	A	America/Anchorage
NOW	Port Angeles Cgas	48.141481	-123.414075	13	-8	A	America/Los_Angeles
NPA	Pensacola Nas	30.352656	-87.318647	28	-6	A	America/Chicago
NPZ	Porter County Municipal Airport	41.4539722	-87.0070833	770	-6	A	America/Chicago
NQA	Millington Rgnl Jetport	35.356667	-89.870278	320	-6	A	America/Chicago
NQI	Kingsville Nas	27.507223	-97.809723	50	-6	A	America/Chicago
NQX	Key West Nas	24.575834	-81.688889	6	-5	A	America/New_York
NSE	Whiting Fld Nas North	30.724167	-87.021944	199	-6	A	America/Chicago
NTD	Point Mugu Nas	34.120285	-119.12094	13	-8	A	America/Los_Angeles
NTU	Oceana Nas	36.820703	-76.033542	22	-5	A	America/New_York
NUI	Nuiqsut Airport	70.21	-151.005556	38	-9	A	America/Anchorage
NUL	Nulato Airport	64.729444	-158.074167	399	-9	A	America/Anchorage
NUP	Nunapitchuk Airport	60.905833	-162.439167	12	-9	A	America/Anchorage
NUQ	Moffett Federal Afld	37.416142	-122.049139	32	-8	A	America/Los_Angeles
NUW	Whidbey Island Nas	48.351803	-122.655906	47	-8	A	America/Los_Angeles
NXP	Twentynine Palms Eaf	34.296161	-116.162203	2051	-8	A	America/Los_Angeles
NXX	Willow Grove Nas Jrb	40.199833	-75.148167	358	-5	A	America/New_York
NY9	Long Lake	43.9750617	-74.42044	1629	-5	A	America/New_York
NYC	All Airports	40.714167	-74.005833	31	-5	A	America/New_York
NYG	Quantico Mcaf	38.501683	-77.305333	11	-5	A	America/New_York
NZC	Cecil Field	30.2187	-81.8767	81	-5	A	America/New_York
NZJ	El Toro	33.676132	-117.731164	383	-8	A	America/Los_Angeles
NZY	North Island Nas	32.699219	-117.21531	26	-8	A	America/Los_Angeles
O03	Morgantown Airport	40.1570414	-75.8704892	600	-5	A	America/New_York
O27	Oakdale Airport	37.7563333	-120.8001944	237	-8	A	America/Los_Angeles
OAJ	Albert J Ellis	34.829164	-77.612139	94	-5	A	America/New_York
OAK	Metropolitan Oakland Intl	37.721278	-122.220722	9	-8	A	America/Los_Angeles
OAR	Marina Muni	36.681878	-121.762347	134	-8	A	America/Los_Angeles
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: odbc; Owner: travis
--

COPY odbc.flights (year, month, day, dep_time, sched_dep_time, dep_delay, arr_time, sched_arr_time, arr_delay, carrier, flight, tailnum, origin, dest, air_time, distance, hour, minute, time_hour) FROM stdin;
2013	1	1	517	515	2	830	819	11	UA	1545	N14228	EWR	IAH	227	1400	5	15	2013-01-01 10:00:00
2013	1	1	533	529	4	850	830	20	UA	1714	N24211	LGA	IAH	227	1416	5	29	2013-01-01 10:00:00
2013	1	1	542	540	2	923	850	33	AA	1141	N619AA	JFK	MIA	160	1089	5	40	2013-01-01 10:00:00
2013	1	1	544	545	-1	1004	1022	-18	B6	725	N804JB	JFK	BQN	183	1576	5	45	2013-01-01 10:00:00
2013	1	1	554	600	-6	812	837	-25	DL	461	N668DN	LGA	ATL	116	762	6	0	2013-01-01 11:00:00
2013	1	1	554	558	-4	740	728	12	UA	1696	N39463	EWR	ORD	150	719	5	58	2013-01-01 10:00:00
2013	1	1	555	600	-5	913	854	19	B6	507	N516JB	EWR	FLL	158	1065	6	0	2013-01-01 11:00:00
2013	1	1	557	600	-3	709	723	-14	EV	5708	N829AS	LGA	IAD	53	229	6	0	2013-01-01 11:00:00
2013	1	1	557	600	-3	838	846	-8	B6	79	N593JB	JFK	MCO	140	944	6	0	2013-01-01 11:00:00
2013	1	1	558	600	-2	753	745	8	AA	301	N3ALAA	LGA	ORD	138	733	6	0	2013-01-01 11:00:00
2013	1	1	558	600	-2	849	851	-2	B6	49	N793JB	JFK	PBI	149	1028	6	0	2013-01-01 11:00:00
2013	1	1	558	600	-2	853	856	-3	B6	71	N657JB	JFK	TPA	158	1005	6	0	2013-01-01 11:00:00
2013	1	1	558	600	-2	924	917	7	UA	194	N29129	JFK	LAX	345	2475	6	0	2013-01-01 11:00:00
2013	1	1	558	600	-2	923	937	-14	UA	1124	N53441	EWR	SFO	361	2565	6	0	2013-01-01 11:00:00
2013	1	1	559	600	-1	941	910	31	AA	707	N3DUAA	LGA	DFW	257	1389	6	0	2013-01-01 11:00:00
2013	1	1	559	559	0	702	706	-4	B6	1806	N708JB	JFK	BOS	44	187	5	59	2013-01-01 10:00:00
2013	1	1	559	600	-1	854	902	-8	UA	1187	N76515	EWR	LAS	337	2227	6	0	2013-01-01 11:00:00
2013	1	1	600	600	0	851	858	-7	B6	371	N595JB	LGA	FLL	152	1076	6	0	2013-01-01 11:00:00
2013	1	1	600	600	0	837	825	12	MQ	4650	N542MQ	LGA	ATL	134	762	6	0	2013-01-01 11:00:00
2013	1	1	601	600	1	844	850	-6	B6	343	N644JB	EWR	PBI	147	1023	6	0	2013-01-01 11:00:00
2013	1	1	602	610	-8	812	820	-8	DL	1919	N971DL	LGA	MSP	170	1020	6	10	2013-01-01 11:00:00
2013	1	1	602	605	-3	821	805	16	MQ	4401	N730MQ	LGA	DTW	105	502	6	5	2013-01-01 11:00:00
2013	1	1	606	610	-4	858	910	-12	AA	1895	N633AA	EWR	MIA	152	1085	6	10	2013-01-01 11:00:00
2013	1	1	606	610	-4	837	845	-8	DL	1743	N3739P	JFK	ATL	128	760	6	10	2013-01-01 11:00:00
2013	1	1	607	607	0	858	915	-17	UA	1077	N53442	EWR	MIA	157	1085	6	7	2013-01-01 11:00:00
2013	1	1	608	600	8	807	735	32	MQ	3768	N9EAMQ	EWR	ORD	139	719	6	0	2013-01-01 11:00:00
2013	1	1	611	600	11	945	931	14	UA	303	N532UA	JFK	SFO	366	2586	6	0	2013-01-01 11:00:00
2013	1	1	613	610	3	925	921	4	B6	135	N635JB	JFK	RSW	175	1074	6	10	2013-01-01 11:00:00
2013	1	1	615	615	0	1039	1100	-21	B6	709	N794JB	JFK	SJU	182	1598	6	15	2013-01-01 11:00:00
2013	1	1	615	615	0	833	842	-9	DL	575	N326NB	EWR	ATL	120	746	6	15	2013-01-01 11:00:00
2013	1	1	622	630	-8	1017	1014	3	US	245	N807AW	EWR	PHX	342	2133	6	30	2013-01-01 11:00:00
2013	1	1	623	610	13	920	915	5	AA	1837	N3EMAA	LGA	MIA	153	1096	6	10	2013-01-01 11:00:00
2013	1	1	623	627	-4	933	932	1	UA	496	N459UA	LGA	IAH	229	1416	6	27	2013-01-01 11:00:00
2013	1	1	624	630	-6	909	840	29	EV	4626	N11107	EWR	MSP	190	1008	6	30	2013-01-01 11:00:00
2013	1	1	624	630	-6	840	830	10	MQ	4599	N518MQ	LGA	MSP	166	1020	6	30	2013-01-01 11:00:00
2013	1	1	627	630	-3	1018	1018	0	US	27	N535UW	JFK	PHX	330	2153	6	30	2013-01-01 11:00:00
2013	1	1	628	630	-2	1137	1140	-3	AA	413	N3BAAA	JFK	SJU	192	1598	6	30	2013-01-01 11:00:00
2013	1	1	628	630	-2	1016	947	29	UA	1665	N33289	EWR	LAX	366	2454	6	30	2013-01-01 11:00:00
2013	1	1	629	630	-1	824	810	14	AA	303	N3CYAA	LGA	ORD	140	733	6	30	2013-01-01 11:00:00
2013	1	1	629	630	-1	721	740	-19	WN	4646	N273WN	LGA	BWI	40	185	6	30	2013-01-01 11:00:00
2013	1	1	629	630	-1	824	833	-9	US	1019	N426US	EWR	CLT	91	529	6	30	2013-01-01 11:00:00
2013	1	1	632	608	24	740	728	12	EV	4144	N13553	EWR	IAD	52	212	6	8	2013-01-01 11:00:00
2013	1	1	635	635	0	1028	940	48	AA	711	N3GKAA	LGA	DFW	248	1389	6	35	2013-01-01 11:00:00
2013	1	1	637	645	-8	930	935	-5	B6	389	N709JB	LGA	MCO	144	950	6	45	2013-01-01 11:00:00
2013	1	1	639	640	-1	739	749	-10	B6	1002	N805JB	JFK	BOS	41	187	6	40	2013-01-01 11:00:00
2013	1	1	643	646	-3	922	940	-18	UA	556	N497UA	EWR	PBI	146	1023	6	46	2013-01-01 11:00:00
2013	1	1	643	645	-2	837	848	-11	US	926	N178US	EWR	CLT	91	529	6	45	2013-01-01 11:00:00
2013	1	1	644	636	8	931	940	-9	UA	1701	N75435	EWR	FLL	151	1065	6	36	2013-01-01 11:00:00
2013	1	1	645	647	-2	815	810	5	B6	102	N796JB	JFK	BUF	63	301	6	47	2013-01-01 11:00:00
2013	1	1	646	645	1	910	916	-6	UA	883	N569UA	LGA	DEN	243	1620	6	45	2013-01-01 11:00:00
2013	1	1	646	645	1	1023	1030	-7	UA	1496	N38727	EWR	SNA	380	2434	6	45	2013-01-01 11:00:00
2013	1	1	651	655	-4	936	942	-6	B6	203	N558JB	JFK	LAS	323	2248	6	55	2013-01-01 11:00:00
2013	1	1	652	655	-3	932	921	11	B6	117	N178JB	JFK	MSY	191	1182	6	55	2013-01-01 11:00:00
2013	1	1	653	700	-7	936	1009	-33	DL	1383	N327NW	LGA	PBI	149	1035	7	0	2013-01-01 12:00:00
2013	1	1	655	655	0	1021	1030	-9	DL	1415	N3763D	JFK	SLC	294	1990	6	55	2013-01-01 11:00:00
2013	1	1	655	700	-5	1037	1045	-8	DL	1865	N705TW	JFK	SFO	362	2586	7	0	2013-01-01 12:00:00
2013	1	1	655	700	-5	1002	1020	-18	DL	2003	N997DL	LGA	MIA	161	1096	7	0	2013-01-01 12:00:00
2013	1	1	656	700	-4	854	850	4	AA	305	N4WNAA	LGA	ORD	143	733	7	0	2013-01-01 12:00:00
2013	1	1	656	659	-3	949	959	-10	AA	1815	N5FMAA	JFK	MCO	142	944	6	59	2013-01-01 11:00:00
2013	1	1	656	705	-9	1007	940	27	MQ	4534	N722MQ	LGA	XNA	233	1147	7	5	2013-01-01 12:00:00
2013	1	1	656	700	-4	948	1011	-23	UA	1115	N24212	EWR	TPA	156	997	7	0	2013-01-01 12:00:00
2013	1	1	657	700	-3	959	1013	-14	DL	1879	N318NB	LGA	FLL	164	1076	7	0	2013-01-01 12:00:00
2013	1	1	658	700	-2	944	939	5	DL	1547	N6703D	LGA	ATL	126	762	7	0	2013-01-01 12:00:00
2013	1	1	658	700	-2	1027	1025	2	VX	399	N627VA	JFK	LAX	361	2475	7	0	2013-01-01 12:00:00
2013	1	1	659	700	-1	1008	1015	-7	AA	2279	N3EKAA	LGA	MIA	159	1096	7	0	2013-01-01 12:00:00
2013	1	1	659	700	-1	1008	1007	1	B6	981	N646JB	JFK	FLL	156	1069	7	0	2013-01-01 12:00:00
2013	1	1	659	705	-6	907	913	-6	DL	831	N998DL	LGA	DTW	105	502	7	5	2013-01-01 12:00:00
2013	1	1	659	700	-1	959	1008	-9	UA	960	N838UA	EWR	RSW	164	1068	7	0	2013-01-01 12:00:00
2013	1	1	701	700	1	1123	1154	-31	UA	1203	N77296	EWR	SJU	188	1608	7	0	2013-01-01 12:00:00
2013	1	1	702	700	2	1058	1014	44	B6	671	N779JB	JFK	LAX	381	2475	7	0	2013-01-01 12:00:00
2013	1	1	709	700	9	852	832	20	UA	1092	N26226	LGA	ORD	135	733	7	0	2013-01-01 12:00:00
2013	1	1	711	715	-4	1151	1206	-15	B6	715	N651JB	JFK	SJU	190	1598	7	15	2013-01-01 12:00:00
2013	1	1	712	715	-3	1023	1035	-12	AA	825	N3ETAA	JFK	FLL	159	1069	7	15	2013-01-01 12:00:00
2013	1	1	715	713	2	911	850	21	UA	544	N841UA	EWR	ORD	156	719	7	13	2013-01-01 12:00:00
2013	1	1	717	720	-3	850	840	10	FL	850	N978AT	LGA	MKE	134	738	7	20	2013-01-01 12:00:00
2013	1	1	719	721	-2	1017	1012	5	B6	987	N562JB	JFK	MCO	147	944	7	21	2013-01-01 12:00:00
2013	1	1	723	725	-2	1013	1017	-4	UA	962	N514UA	EWR	PBI	153	1023	7	25	2013-01-01 12:00:00
2013	1	1	724	730	-6	1111	1040	31	AA	715	N541AA	LGA	DFW	254	1389	7	30	2013-01-01 12:00:00
2013	1	1	724	725	-1	1020	1030	-10	AS	11	N594AS	EWR	SEA	338	2402	7	25	2013-01-01 12:00:00
2013	1	1	725	730	-5	1052	1040	12	AA	2083	N4WRAA	EWR	DFW	238	1372	7	30	2013-01-01 12:00:00
2013	1	1	727	730	-3	959	952	7	UA	1162	N37462	EWR	DEN	254	1605	7	30	2013-01-01 12:00:00
2013	1	1	728	732	-4	1041	1038	3	UA	473	N488UA	LGA	IAH	238	1416	7	32	2013-01-01 12:00:00
2013	1	1	729	730	-1	1049	1115	-26	VX	11	N635VA	JFK	SFO	356	2586	7	30	2013-01-01 12:00:00
2013	1	1	732	735	-3	857	858	-1	B6	20	N304JB	JFK	ROC	64	264	7	35	2013-01-01 12:00:00
2013	1	1	732	729	3	1041	1039	2	B6	1601	N563JB	LGA	RSW	167	1080	7	29	2013-01-01 12:00:00
2013	1	1	732	645	47	1011	941	30	UA	1111	N37456	EWR	MCO	145	937	6	45	2013-01-01 11:00:00
2013	1	1	733	736	-3	854	850	4	B6	44	N552JB	JFK	SYR	54	209	7	36	2013-01-01 12:00:00
2013	1	1	734	737	-3	1047	1113	-26	B6	643	N625JB	JFK	SFO	350	2586	7	37	2013-01-01 12:00:00
2013	1	1	739	745	-6	918	930	-12	AA	309	N4WPAA	LGA	ORD	137	733	7	45	2013-01-01 12:00:00
2013	1	1	739	739	0	1104	1038	26	UA	1479	N37408	EWR	IAH	249	1400	7	39	2013-01-01 12:00:00
2013	1	1	741	745	-4	1038	1036	2	B6	983	N633JB	LGA	TPA	158	1010	7	45	2013-01-01 12:00:00
2013	1	1	743	730	13	1107	1100	7	AA	33	N338AA	JFK	LAX	358	2475	7	30	2013-01-01 12:00:00
2013	1	1	743	749	-6	1043	1054	-11	B6	341	N624JB	JFK	SRQ	164	1041	7	49	2013-01-01 12:00:00
2013	1	1	743	730	13	1059	1056	3	DL	495	N3760C	JFK	SEA	349	2422	7	30	2013-01-01 12:00:00
2013	1	1	745	745	0	1135	1125	10	AA	59	N336AA	JFK	SFO	378	2586	7	45	2013-01-01 12:00:00
2013	1	1	746	746	0	1119	1129	-10	UA	1668	N24224	EWR	SFO	373	2565	7	46	2013-01-01 12:00:00
2013	1	1	749	710	39	939	850	49	MQ	3737	N508MQ	EWR	ORD	148	719	7	10	2013-01-01 12:00:00
2013	1	1	752	755	-3	1041	1059	-18	DL	2263	N325US	LGA	MCO	140	950	7	55	2013-01-01 12:00:00
2013	1	1	752	750	2	1025	1029	-4	UA	477	N511UA	LGA	DEN	249	1620	7	50	2013-01-01 12:00:00
2013	1	1	752	759	-7	955	959	-4	US	1733	N543UW	LGA	CLT	96	544	7	59	2013-01-01 12:00:00
2013	1	1	753	755	-2	1056	1110	-14	AA	2267	N3HMAA	LGA	MIA	157	1096	7	55	2013-01-01 12:00:00
2013	1	1	754	759	-5	1039	1041	-2	DL	2047	N935DL	LGA	ATL	126	762	7	59	2013-01-01 12:00:00
2013	1	1	754	755	-1	1103	1030	33	WN	733	N789SW	LGA	DEN	279	1620	7	55	2013-01-01 12:00:00
2013	1	1	758	800	-2	1053	1054	-1	B6	517	N645JB	EWR	MCO	142	937	8	0	2013-01-01 13:00:00
2013	1	1	759	800	-1	1057	1127	-30	DL	1843	N955DL	JFK	MIA	158	1089	8	0	2013-01-01 13:00:00
2013	1	1	800	800	0	1022	1014	8	DL	2119	N317US	LGA	MSP	171	1020	8	0	2013-01-01 13:00:00
2013	1	1	800	810	-10	949	955	-6	MQ	4406	N828MQ	JFK	RDU	80	427	8	10	2013-01-01 13:00:00
2013	1	1	801	805	-4	900	919	-19	B6	1172	N206JB	EWR	BOS	38	200	8	5	2013-01-01 13:00:00
2013	1	1	803	810	-7	903	925	-22	AA	1838	N3GEAA	JFK	BOS	38	187	8	10	2013-01-01 13:00:00
2013	1	1	803	800	3	1132	1144	-12	UA	223	N510UA	JFK	SFO	369	2586	8	0	2013-01-01 13:00:00
2013	1	1	804	810	-6	1103	1116	-13	DL	1959	N947DL	JFK	MCO	147	944	8	10	2013-01-01 13:00:00
2013	1	1	805	805	0	1015	1005	10	B6	219	N273JB	JFK	CLT	98	541	8	5	2013-01-01 13:00:00
2013	1	1	805	800	5	1118	1106	12	B6	3	N570JB	JFK	FLL	165	1069	8	0	2013-01-01 13:00:00
2013	1	1	805	815	-10	1006	1010	-4	MQ	4490	N739MQ	LGA	CMH	101	479	8	15	2013-01-01 13:00:00
2013	1	1	807	810	-3	1043	1043	0	DL	269	N308DE	JFK	ATL	126	760	8	10	2013-01-01 13:00:00
2013	1	1	809	815	-6	1043	1050	-7	EV	4388	N14542	EWR	JAX	132	820	8	15	2013-01-01 13:00:00
2013	1	1	810	810	0	1048	1037	11	9E	3538	N915XJ	JFK	MSP	189	1029	8	10	2013-01-01 13:00:00
2013	1	1	810	815	-5	1100	1128	-28	DL	2395	N349NW	LGA	PBI	149	1035	8	15	2013-01-01 13:00:00
2013	1	1	811	815	-4	1006	1032	-26	EV	4260	N11193	EWR	CHS	101	628	8	15	2013-01-01 13:00:00
2013	1	1	811	630	101	1047	830	137	MQ	4576	N531MQ	LGA	CLT	118	544	6	30	2013-01-01 11:00:00
2013	1	1	811	815	-4	1026	1016	10	US	675	N654AW	EWR	CLT	96	529	8	15	2013-01-01 13:00:00
2013	1	1	812	814	-2	1040	1017	23	EV	4537	N17108	EWR	MEM	180	946	8	14	2013-01-01 13:00:00
2013	1	1	813	815	-2	1103	1056	7	DL	914	N375NC	LGA	DEN	267	1620	8	15	2013-01-01 13:00:00
2013	1	1	814	810	4	1047	1030	17	FL	346	N977AT	LGA	ATL	132	762	8	10	2013-01-01 13:00:00
2013	1	1	817	810	7	1005	948	17	B6	1051	N228JB	JFK	PIT	86	340	8	10	2013-01-01 13:00:00
2013	1	1	820	820	0	1254	1310	-16	B6	717	N527JB	JFK	SJU	190	1598	8	20	2013-01-01 13:00:00
2013	1	1	820	830	-10	940	954	-14	DL	27	N324US	JFK	BOS	36	187	8	30	2013-01-01 13:00:00
2013	1	1	820	820	0	1249	1329	-40	DL	301	N900PC	JFK	SJU	182	1598	8	20	2013-01-01 13:00:00
2013	1	1	821	820	1	1153	1129	24	B6	181	N521JB	JFK	SAN	354	2446	8	20	2013-01-01 13:00:00
2013	1	1	821	825	-4	932	945	-13	MQ	4418	N846MQ	JFK	DCA	52	213	8	25	2013-01-01 13:00:00
2013	1	1	822	830	-8	1014	1016	-2	EV	4104	N12540	LGA	CLE	91	419	8	30	2013-01-01 13:00:00
2013	1	1	823	825	-2	1019	1024	-5	US	487	N655AW	JFK	CLT	96	541	8	25	2013-01-01 13:00:00
2013	1	1	823	823	0	1151	1135	16	UA	1223	N39728	EWR	DFW	250	1372	8	23	2013-01-01 13:00:00
2013	1	1	824	830	-6	1027	1025	2	AA	1855	N573AA	LGA	STL	169	888	8	30	2013-01-01 13:00:00
2013	1	1	825	827	-2	1058	1105	-7	B6	611	N292JB	JFK	JAX	130	828	8	27	2013-01-01 13:00:00
2013	1	1	826	715	71	1136	1045	51	AA	443	N3GVAA	JFK	MIA	160	1089	7	15	2013-01-01 12:00:00
2013	1	1	826	817	9	1145	1158	-13	UA	1480	N76522	EWR	SFO	357	2565	8	17	2013-01-01 13:00:00
2013	1	1	828	830	-2	1027	1012	15	B6	905	N274JB	JFK	ORD	160	740	8	30	2013-01-01 13:00:00
2013	1	1	828	823	5	1150	1143	7	UA	1506	N76528	EWR	LAX	359	2454	8	23	2013-01-01 13:00:00
2013	1	1	829	830	-1	1152	1200	-8	UA	443	N554UA	JFK	LAX	360	2475	8	30	2013-01-01 13:00:00
2013	1	1	829	830	-1	1117	1140	-23	UA	1592	N75425	EWR	MCO	145	937	8	30	2013-01-01 13:00:00
2013	1	1	830	830	0	1018	1015	3	AA	313	N4YCAA	LGA	ORD	137	733	8	30	2013-01-01 13:00:00
2013	1	1	830	835	-5	1052	1105	-13	MQ	4610	N513MQ	LGA	ATL	123	762	8	35	2013-01-01 13:00:00
2013	1	1	831	835	-4	1021	1039	-18	EV	4412	N13969	EWR	MYR	92	550	8	35	2013-01-01 13:00:00
2013	1	1	832	840	-8	1006	1030	-24	MQ	4521	N725MQ	LGA	RDU	77	431	8	40	2013-01-01 13:00:00
2013	1	1	833	835	-2	1134	1102	32	F9	835	N203FR	LGA	DEN	257	1620	8	35	2013-01-01 13:00:00
2013	1	1	835	835	0	1210	1150	20	AA	717	N3BDAA	LGA	DFW	249	1389	8	35	2013-01-01 13:00:00
2013	1	1	839	850	-11	1027	1035	-8	MQ	4558	N711MQ	LGA	CLE	88	419	8	50	2013-01-01 13:00:00
2013	1	1	840	845	-5	1311	1350	-39	AA	1357	N5FSAA	JFK	SJU	188	1598	8	45	2013-01-01 13:00:00
2013	1	1	840	845	-5	1053	1102	-9	DL	2304	N926DL	JFK	DTW	108	509	8	45	2013-01-01 13:00:00
2013	1	1	846	845	1	1138	1205	-27	B6	553	N564JB	EWR	RSW	157	1068	8	45	2013-01-01 13:00:00
2013	1	1	848	1835	853	1001	1950	851	MQ	3944	N942MQ	JFK	BWI	41	184	18	35	2013-01-01 23:00:00
2013	1	1	848	851	-3	1155	1136	19	UA	1741	N27724	EWR	JAC	275	1874	8	51	2013-01-01 13:00:00
2013	1	1	851	851	0	1032	1036	-4	EV	4548	N19966	EWR	RDU	75	416	8	51	2013-01-01 13:00:00
2013	1	1	851	859	-8	1102	1105	-3	DL	869	N361NB	EWR	DTW	106	488	8	59	2013-01-01 13:00:00
2013	1	1	851	840	11	1215	1206	9	UA	1626	N39297	EWR	SAN	367	2425	8	40	2013-01-01 13:00:00
2013	1	1	852	855	-3	1046	1020	26	WN	3848	N777QC	EWR	MDW	146	711	8	55	2013-01-01 13:00:00
2013	1	1	853	845	8	1147	1145	2	B6	59	N184JB	JFK	TPA	159	1005	8	45	2013-01-01 13:00:00
2013	1	1	855	859	-4	1143	1145	-2	DL	1747	N646DL	LGA	ATL	129	762	8	59	2013-01-01 13:00:00
2013	1	1	856	900	-4	1226	1220	6	AA	1	N324AA	JFK	LAX	358	2475	9	0	2013-01-01 14:00:00
2013	1	1	856	900	-4	1222	1232	-10	DL	2143	N970DL	LGA	MIA	158	1096	9	0	2013-01-01 14:00:00
2013	1	1	856	855	1	1140	1203	-23	UA	1296	N75426	EWR	PBI	150	1023	8	55	2013-01-01 13:00:00
2013	1	1	857	900	-3	1516	1530	-14	HA	51	N380HA	JFK	HNL	659	4983	9	0	2013-01-01 14:00:00
2013	1	1	857	905	-8	1107	1120	-13	DL	181	N321NB	LGA	DTW	110	502	9	5	2013-01-01 14:00:00
2013	1	1	857	900	-3	1124	1133	-9	DL	485	N371NB	EWR	ATL	125	746	9	0	2013-01-01 14:00:00
2013	1	1	857	851	6	1157	1222	-25	UA	1670	N45440	EWR	SEA	343	2402	8	51	2013-01-01 13:00:00
2013	1	1	858	900	-2	1102	1110	-8	MQ	4478	N737MQ	LGA	DTW	103	502	9	0	2013-01-01 14:00:00
2013	1	1	859	900	-1	1140	1204	-24	DL	1885	N360NB	LGA	MCO	140	950	9	0	2013-01-01 14:00:00
2013	1	1	859	900	-1	1223	1225	-2	VX	407	N846VA	JFK	LAX	359	2475	9	0	2013-01-01 14:00:00
2013	1	1	900	900	0	1211	1203	8	UA	1170	N19130	EWR	FLL	161	1065	9	0	2013-01-01 14:00:00
2013	1	1	902	903	-1	1048	1045	3	UA	580	N820UA	EWR	ORD	145	719	9	3	2013-01-01 14:00:00
2013	1	1	903	820	43	1045	955	50	MQ	4655	N532MQ	LGA	BNA	142	764	8	20	2013-01-01 13:00:00
2013	1	1	904	906	-2	1207	1226	-19	UA	1401	N77525	EWR	MIA	158	1085	9	6	2013-01-01 14:00:00
2013	1	1	905	905	0	1309	1229	40	B6	1061	N281JB	JFK	AUS	263	1521	9	5	2013-01-01 14:00:00
2013	1	1	906	843	23	1134	1125	9	UA	1643	N17139	EWR	DEN	246	1605	8	43	2013-01-01 13:00:00
2013	1	1	908	910	-2	1020	1027	-7	B6	56	N203JB	JFK	BTV	52	266	9	10	2013-01-01 14:00:00
2013	1	1	908	915	-7	1004	1033	-29	US	1467	N959UW	LGA	PHL	32	96	9	15	2013-01-01 14:00:00
2013	1	1	908	908	0	1228	1219	9	UA	1220	N12216	EWR	IAH	233	1400	9	8	2013-01-01 14:00:00
2013	1	1	909	810	59	1331	1315	16	AA	655	N5EXAA	JFK	STT	184	1623	8	10	2013-01-01 13:00:00
2013	1	1	912	900	12	1241	1220	21	AA	647	N5CRAA	JFK	MIA	166	1089	9	0	2013-01-01 14:00:00
2013	1	1	912	906	6	1219	1226	-7	UA	1601	N38403	EWR	MIA	159	1085	9	6	2013-01-01 14:00:00
2013	1	1	913	918	-5	1346	1416	-30	UA	1519	N24715	EWR	STT	189	1634	9	18	2013-01-01 14:00:00
2013	1	1	914	920	-6	1244	1240	4	AA	1589	N517AA	EWR	DFW	238	1372	9	20	2013-01-01 14:00:00
2013	1	1	914	900	14	1058	1043	15	UA	783	N810UA	EWR	CLE	85	404	9	0	2013-01-01 14:00:00
2013	1	1	917	920	-3	1313	1245	28	AA	721	N596AA	LGA	DFW	258	1389	9	20	2013-01-01 14:00:00
2013	1	1	917	915	2	1206	1211	-5	B6	41	N568JB	JFK	MCO	145	944	9	15	2013-01-01 14:00:00
2013	1	1	917	920	-3	1052	1108	-16	B6	1103	N216JB	JFK	RDU	80	427	9	20	2013-01-01 14:00:00
2013	1	1	920	905	15	1039	1025	14	B6	1305	N346JB	JFK	IAD	52	228	9	5	2013-01-01 14:00:00
2013	1	1	920	920	0	1152	1125	27	MQ	4582	N527MQ	LGA	CLT	92	544	9	20	2013-01-01 14:00:00
2013	1	1	921	900	21	1237	1227	10	DL	120	N713TW	JFK	LAX	333	2475	9	0	2013-01-01 14:00:00
2013	1	1	923	919	4	1026	1030	-4	B6	1004	N580JB	JFK	BOS	38	187	9	19	2013-01-01 14:00:00
2013	1	1	926	929	-3	1404	1421	-17	B6	215	N775JB	EWR	SJU	191	1608	9	29	2013-01-01 14:00:00
2013	1	1	926	922	4	1221	1219	2	B6	57	N534JB	JFK	PBI	151	1028	9	22	2013-01-01 14:00:00
2013	1	1	926	928	-2	1233	1220	13	UA	1597	N27733	EWR	EGE	287	1726	9	28	2013-01-01 14:00:00
2013	1	1	927	930	-3	1231	1257	-26	DL	1335	N951DL	LGA	RSW	166	1080	9	30	2013-01-01 14:00:00
2013	1	1	929	929	0	1028	1042	-14	EV	4636	N11551	EWR	DCA	43	199	9	29	2013-01-01 14:00:00
2013	1	1	929	925	4	1220	1150	30	WN	766	N957WN	EWR	DEN	264	1605	9	25	2013-01-01 14:00:00
2013	1	1	930	905	25	1218	1209	9	UA	1148	N57439	EWR	TPA	149	997	9	5	2013-01-01 14:00:00
2013	1	1	931	930	1	1237	1238	-1	B6	375	N508JB	LGA	FLL	161	1076	9	30	2013-01-01 14:00:00
2013	1	1	931	930	1	1121	1108	13	UA	255	N479UA	LGA	ORD	154	733	9	30	2013-01-01 14:00:00
2013	1	1	932	930	2	1219	1225	-6	VX	251	N641VA	JFK	LAS	324	2248	9	30	2013-01-01 14:00:00
2013	1	1	933	937	-4	1057	1102	-5	B6	4	N503JB	JFK	BUF	66	301	9	37	2013-01-01 14:00:00
2013	1	1	933	904	29	1252	1210	42	B6	17	N579JB	JFK	FLL	170	1069	9	4	2013-01-01 14:00:00
2013	1	1	933	935	-2	1120	1105	15	WN	3895	N487WN	LGA	MDW	145	725	9	35	2013-01-01 14:00:00
2013	1	1	936	940	-4	1235	1251	-16	DL	2137	N975DL	LGA	TPA	159	1010	9	40	2013-01-01 14:00:00
2013	1	1	936	945	-9	1257	1309	-12	DL	1903	N900DE	LGA	SRQ	169	1047	9	45	2013-01-01 14:00:00
2013	1	1	937	940	-3	1238	1235	3	B6	361	N615JB	LGA	PBI	154	1035	9	40	2013-01-01 14:00:00
2013	1	1	937	940	-3	1127	1120	7	WN	1807	N729SW	LGA	MKE	143	738	9	40	2013-01-01 14:00:00
2013	1	1	940	945	-5	1119	1130	-11	AA	319	N4WJAA	LGA	ORD	133	733	9	45	2013-01-01 14:00:00
2013	1	1	940	955	-15	1226	1220	6	MQ	4654	N525MQ	LGA	ATL	129	762	9	55	2013-01-01 14:00:00
2013	1	1	941	945	-4	1300	1258	2	B6	679	N806JB	JFK	LAX	352	2475	9	45	2013-01-01 14:00:00
2013	1	1	946	959	-13	1146	1202	-16	EV	4175	N15912	EWR	AVL	105	583	9	59	2013-01-01 14:00:00
2013	1	1	947	953	-6	1053	1110	-17	B6	600	N306JB	JFK	PWM	47	273	9	53	2013-01-01 14:00:00
2013	1	1	950	954	-4	1155	1142	13	EV	4681	N12567	EWR	STL	170	872	9	54	2013-01-01 14:00:00
2013	1	1	953	959	-6	1141	1129	12	MQ	4670	N6EAMQ	LGA	BNA	144	764	9	59	2013-01-01 14:00:00
2013	1	1	953	921	32	1320	1241	39	UA	222	N586UA	EWR	LAX	346	2454	9	21	2013-01-01 14:00:00
2013	1	1	955	1000	-5	1336	1325	11	US	75	N642AW	EWR	PHX	324	2133	10	0	2013-01-01 15:00:00
2013	1	1	956	1000	-4	1241	1241	0	DL	1847	N956DL	LGA	ATL	129	762	10	0	2013-01-01 15:00:00
2013	1	1	957	733	144	1056	853	123	UA	856	N534UA	EWR	BOS	37	200	7	33	2013-01-01 12:00:00
2013	1	1	959	1002	-3	1313	1319	-6	DL	2379	N965DL	LGA	FLL	151	1076	10	2	2013-01-01 15:00:00
2013	1	1	959	1000	-1	1151	1206	-15	US	1177	N765US	LGA	CLT	90	544	10	0	2013-01-01 15:00:00
2013	1	1	1003	1010	-7	1255	1320	-25	B6	503	N565JB	EWR	FLL	152	1065	10	10	2013-01-01 15:00:00
2013	1	1	1003	959	4	1408	1329	39	US	196	N541UW	JFK	PHX	342	2153	9	59	2013-01-01 14:00:00
2013	1	1	1005	1000	5	1239	1234	5	UA	1625	N81449	EWR	DEN	254	1605	10	0	2013-01-01 15:00:00
2013	1	1	1007	1010	-3	1147	1140	7	MQ	3795	N503MQ	EWR	ORD	131	719	10	10	2013-01-01 15:00:00
2013	1	1	1009	1015	-6	1219	1229	-10	DL	2319	N933DL	LGA	MSP	160	1020	10	15	2013-01-01 15:00:00
2013	1	1	1010	1015	-5	1204	1210	-6	US	1103	N162UW	EWR	CLT	90	529	10	15	2013-01-01 15:00:00
2013	1	1	1010	1015	-5	1225	1214	11	US	1441	N712US	JFK	CLT	97	541	10	15	2013-01-01 15:00:00
2013	1	1	1011	1001	10	1133	1128	5	EV	5736	N820AS	LGA	IAD	59	229	10	1	2013-01-01 15:00:00
2013	1	1	1011	1015	-4	1246	1307	-21	DL	1529	N399DA	JFK	LAS	320	2248	10	15	2013-01-01 15:00:00
2013	1	1	1021	1023	-2	1254	1252	2	FL	347	N942AT	LGA	ATL	129	762	10	23	2013-01-01 15:00:00
2013	1	1	1024	1029	-5	1140	1150	-10	EV	4709	N14905	EWR	BUF	59	282	10	29	2013-01-01 15:00:00
2013	1	1	1024	1030	-6	1204	1215	-11	MQ	4471	N719MQ	LGA	RDU	78	431	10	30	2013-01-01 15:00:00
2013	1	1	1025	1020	5	1356	1330	26	AA	731	N3FXAA	LGA	DFW	247	1389	10	20	2013-01-01 15:00:00
2013	1	1	1025	951	34	1258	1302	-4	UA	501	N437UA	EWR	MCO	137	937	9	51	2013-01-01 14:00:00
2013	1	1	1026	1030	-4	1351	1340	11	AA	19	N328AA	JFK	LAX	356	2475	10	30	2013-01-01 15:00:00
2013	1	1	1028	1026	2	1350	1339	11	UA	1004	N76508	LGA	IAH	237	1416	10	26	2013-01-01 15:00:00
2013	1	1	1029	1030	-1	1427	1355	32	AA	179	N325AA	JFK	SFO	389	2586	10	30	2013-01-01 15:00:00
2013	1	1	1030	1035	-5	1229	1246	-17	EV	4277	N11189	EWR	CHS	100	628	10	35	2013-01-01 15:00:00
2013	1	1	1031	1030	1	1353	1415	-22	VX	23	N625VA	JFK	SFO	363	2586	10	30	2013-01-01 15:00:00
2013	1	1	1031	1030	1	1323	1334	-11	UA	1294	N77258	EWR	FLL	157	1065	10	30	2013-01-01 15:00:00
2013	1	1	1032	1035	-3	1305	1250	15	EV	4180	N13955	EWR	IND	135	645	10	35	2013-01-01 15:00:00
2013	1	1	1033	1017	16	1130	1136	-6	UA	779	N849UA	EWR	BOS	42	200	10	17	2013-01-01 15:00:00
2013	1	1	1037	1030	7	1221	1210	11	AA	321	N581AA	LGA	ORD	133	733	10	30	2013-01-01 15:00:00
2013	1	1	1038	1030	8	1223	1202	21	UA	985	N423UA	EWR	ORD	149	719	10	30	2013-01-01 15:00:00
2013	1	1	1042	1040	2	1325	1326	-1	B6	31	N529JB	JFK	MCO	142	944	10	40	2013-01-01 15:00:00
2013	1	1	1044	1045	-1	1231	1212	19	EV	4322	N15555	EWR	MKE	151	725	10	45	2013-01-01 15:00:00
2013	1	1	1044	1045	-1	1352	1351	1	UA	455	N667UA	EWR	IAH	229	1400	10	45	2013-01-01 15:00:00
2013	1	1	1044	1041	3	1339	1350	-11	UA	1060	N76503	EWR	RSW	157	1068	10	41	2013-01-01 15:00:00
2013	1	1	1047	1055	-8	1359	1405	-6	AA	739	N3AVAA	LGA	DFW	230	1389	10	55	2013-01-01 15:00:00
2013	1	1	1047	1050	-3	1401	1410	-9	DL	1275	N3748Y	JFK	SLC	295	1990	10	50	2013-01-01 15:00:00
2013	1	1	1048	1050	-2	1302	1250	12	MQ	4589	N537MQ	LGA	DTW	112	502	10	50	2013-01-01 15:00:00
2013	1	1	1053	1050	3	1402	1358	4	B6	373	N520JB	LGA	FLL	165	1076	10	50	2013-01-01 15:00:00
2013	1	1	1054	1059	-5	1326	1339	-13	DL	1647	N920DE	LGA	ATL	129	762	10	59	2013-01-01 15:00:00
2013	1	1	1056	1059	-3	1203	1209	-6	EV	4479	N11544	EWR	PWM	51	284	10	59	2013-01-01 15:00:00
2013	1	1	1056	1100	-4	1407	1413	-6	DL	2185	N917DL	LGA	TPA	158	1010	11	0	2013-01-01 16:00:00
2013	1	1	1058	1100	-2	1210	1216	-6	US	2171	N951UW	LGA	DCA	50	214	11	0	2013-01-01 16:00:00
2013	1	1	1059	1100	-1	1201	1215	-14	WN	321	N505SW	LGA	BWI	43	185	11	0	2013-01-01 16:00:00
2013	1	1	1059	1100	-1	1210	1215	-5	MQ	3792	N509MQ	JFK	DCA	50	213	11	0	2013-01-01 16:00:00
2013	1	1	1059	1053	6	1342	1351	-9	UA	369	N451UA	EWR	LAS	325	2227	10	53	2013-01-01 15:00:00
2013	1	1	1101	1043	18	1345	1332	13	B6	545	N630JB	EWR	PBI	145	1023	10	43	2013-01-01 15:00:00
2013	1	1	1103	1100	3	1410	1421	-11	DL	2071	N339NW	LGA	MIA	155	1096	11	0	2013-01-01 16:00:00
2013	1	1	1105	1047	18	1428	1405	23	UA	688	N521UA	EWR	SFO	356	2565	10	47	2013-01-01 15:00:00
2013	1	1	1107	1115	-8	1305	1310	-5	MQ	4485	N730MQ	LGA	CMH	95	479	11	15	2013-01-01 16:00:00
2013	1	1	1109	1115	-6	1402	1425	-23	AA	2099	N3GSAA	LGA	MIA	157	1096	11	15	2013-01-01 16:00:00
2013	1	1	1111	1115	-4	1222	1226	-4	B6	24	N279JB	JFK	BTV	52	266	11	15	2013-01-01 16:00:00
2013	1	1	1112	1100	12	1440	1438	2	UA	285	N517UA	JFK	SFO	364	2586	11	0	2013-01-01 16:00:00
2013	1	1	1113	1115	-2	1318	1315	3	DL	1031	N320NB	LGA	DTW	104	502	11	15	2013-01-01 16:00:00
2013	1	1	1114	900	134	1447	1222	145	UA	1086	N76502	LGA	IAH	248	1416	9	0	2013-01-01 14:00:00
2013	1	1	1120	944	96	1331	1213	78	EV	4495	N16561	EWR	SAV	117	708	9	44	2013-01-01 14:00:00
2013	1	1	1120	1125	-5	1330	1325	5	WN	1057	N469WN	LGA	STL	176	888	11	25	2013-01-01 16:00:00
2013	1	1	1123	1110	13	1410	1336	34	UA	405	N587UA	LGA	DEN	256	1620	11	10	2013-01-01 16:00:00
2013	1	1	1124	1100	24	1435	1431	4	B6	641	N590JB	JFK	SFO	349	2586	11	0	2013-01-01 16:00:00
2013	1	1	1124	1125	-1	1445	1445	0	DL	1171	N376NW	LGA	RSW	169	1080	11	25	2013-01-01 16:00:00
2013	1	1	1125	1130	-5	1325	1332	-7	US	1085	N169UW	LGA	CLT	94	544	11	30	2013-01-01 16:00:00
2013	1	1	1127	1129	-2	1303	1309	-6	EV	4294	N14180	EWR	RDU	73	416	11	29	2013-01-01 16:00:00
2013	1	1	1127	1130	-3	1504	1448	16	UA	703	N518UA	JFK	LAX	357	2475	11	30	2013-01-01 16:00:00
2013	1	1	1127	1129	-2	1421	1425	-4	UA	1143	N14118	EWR	PBI	156	1023	11	29	2013-01-01 16:00:00
2013	1	1	1128	1129	-1	1422	1437	-15	UA	987	N496UA	EWR	TPA	156	997	11	29	2013-01-01 16:00:00
2013	1	1	1130	1125	5	1301	1305	-4	AA	327	N3DEAA	LGA	ORD	127	733	11	25	2013-01-01 16:00:00
2013	1	1	1130	1131	-1	1345	1342	3	DL	2219	N343NB	LGA	MSP	166	1020	11	31	2013-01-01 16:00:00
2013	1	1	1132	1135	-3	1324	1330	-6	MQ	4553	N856MQ	LGA	CLE	89	419	11	35	2013-01-01 16:00:00
2013	1	1	1133	1129	4	1440	1437	3	B6	133	N652JB	JFK	RSW	168	1074	11	29	2013-01-01 16:00:00
2013	1	1	1133	1130	3	1448	1450	-2	VX	409	N839VA	JFK	LAX	347	2475	11	30	2013-01-01 16:00:00
2013	1	1	1135	1140	-5	1429	1445	-16	AA	1623	N3EYAA	EWR	MIA	156	1085	11	40	2013-01-01 16:00:00
2013	1	1	1137	1140	-3	1445	1451	-6	DL	2175	N999DN	LGA	PBI	153	1035	11	40	2013-01-01 16:00:00
2013	1	1	1143	1145	-2	1512	1507	5	UA	1010	N39726	EWR	SNA	371	2434	11	45	2013-01-01 16:00:00
2013	1	1	1144	1145	-1	1422	1411	11	EV	4876	N695CA	EWR	ATL	126	746	11	45	2013-01-01 16:00:00
2013	1	1	1147	1155	-8	1335	1327	8	FL	353	N932AT	LGA	CAK	82	397	11	55	2013-01-01 16:00:00
2013	1	1	1150	1156	-6	1302	1314	-12	EV	4693	N21144	EWR	SYR	46	195	11	56	2013-01-01 16:00:00
2013	1	1	1153	1159	-6	1350	1341	9	EV	4275	N29917	EWR	CMH	95	463	11	59	2013-01-01 16:00:00
2013	1	1	1153	1123	30	1454	1425	29	B6	1	N552JB	JFK	FLL	167	1069	11	23	2013-01-01 16:00:00
2013	1	1	1153	1200	-7	1450	1529	-39	DL	863	N712TW	JFK	LAX	330	2475	12	0	2013-01-01 17:00:00
2013	1	1	1154	1200	-6	1253	1306	-13	B6	1174	N206JB	EWR	BOS	40	200	12	0	2013-01-01 17:00:00
2013	1	1	1154	1200	-6	1452	1430	22	MQ	4658	N8EGMQ	LGA	ATL	141	762	12	0	2013-01-01 17:00:00
2013	1	1	1155	1200	-5	1517	1510	7	AA	3	N322AA	JFK	LAX	353	2475	12	0	2013-01-01 17:00:00
2013	1	1	1155	1200	-5	1507	1519	-12	DL	1443	N969DL	LGA	FLL	160	1076	12	0	2013-01-01 17:00:00
2013	1	1	1155	1200	-5	1441	1440	1	DL	1947	N904DL	LGA	ATL	133	762	12	0	2013-01-01 17:00:00
2013	1	1	1155	1200	-5	1312	1315	-3	MQ	4425	N846MQ	JFK	DCA	57	213	12	0	2013-01-01 17:00:00
2013	1	1	1157	1158	-1	1310	1315	-5	EV	4511	N16546	EWR	ROC	50	246	11	58	2013-01-01 16:00:00
2013	1	1	1157	1205	-8	1342	1345	-3	MQ	4431	N723MQ	LGA	RDU	80	431	12	5	2013-01-01 17:00:00
2013	1	1	1157	1200	-3	1452	1456	-4	UA	1197	N13113	EWR	MCO	151	937	12	0	2013-01-01 17:00:00
2013	1	1	1158	1205	-7	1530	1520	10	AA	743	N426AA	LGA	DFW	248	1389	12	5	2013-01-01 17:00:00
2013	1	1	1158	1200	-2	1256	1300	-4	WN	1568	N783SW	EWR	BWI	38	169	12	0	2013-01-01 17:00:00
2013	1	1	1158	1200	-2	1338	1331	7	UA	701	N588UA	LGA	ORD	142	733	12	0	2013-01-01 17:00:00
2013	1	1	1200	1200	0	1408	1356	12	US	1443	N755US	JFK	CLT	102	541	12	0	2013-01-01 17:00:00
2013	1	1	1202	1207	-5	1318	1314	4	EV	4347	N11536	EWR	BTV	51	266	12	7	2013-01-01 17:00:00
2013	1	1	1202	1159	3	1645	1653	-8	UA	1663	N38403	EWR	SJU	187	1608	11	59	2013-01-01 16:00:00
2013	1	1	1203	1205	-2	1501	1437	24	EV	3850	N13978	EWR	ATL	142	746	12	5	2013-01-01 17:00:00
2013	1	1	1203	1200	3	1519	1545	-26	VX	25	N843VA	JFK	SFO	353	2586	12	0	2013-01-01 17:00:00
2013	1	1	1204	1200	4	1500	1448	12	B6	523	N612JB	EWR	MCO	139	937	12	0	2013-01-01 17:00:00
2013	1	1	1205	1200	5	1503	1505	-2	UA	1461	N39418	EWR	IAH	221	1400	12	0	2013-01-01 17:00:00
2013	1	1	1206	1209	-3	1325	1328	-3	EV	4216	N14168	EWR	BUF	59	282	12	9	2013-01-01 17:00:00
2013	1	1	1208	1158	10	1540	1502	38	B6	625	N239JB	JFK	HOU	253	1428	11	58	2013-01-01 16:00:00
2013	1	1	1211	1215	-4	1423	1413	10	EV	4135	N21537	EWR	CLT	102	529	12	15	2013-01-01 17:00:00
2013	1	1	1217	1220	-3	1414	1350	24	MQ	3697	N517MQ	EWR	ORD	143	719	12	20	2013-01-01 17:00:00
2013	1	1	1217	1218	-1	1525	1529	-4	UA	391	N573UA	EWR	SFO	345	2565	12	18	2013-01-01 17:00:00
2013	1	1	1219	1220	-1	1415	1415	0	AA	1757	N545AA	LGA	STL	161	888	12	20	2013-01-01 17:00:00
2013	1	1	1219	1225	-6	1451	1500	-9	DL	1715	N342NB	LGA	MSY	195	1183	12	25	2013-01-01 17:00:00
2013	1	1	1220	1220	0	1403	1340	23	WN	133	N254WN	EWR	MDW	142	711	12	20	2013-01-01 17:00:00
2013	1	1	1222	1159	23	1512	1429	43	EV	4679	N14916	EWR	JAX	131	820	11	59	2013-01-01 16:00:00
2013	1	1	1222	1229	-7	1520	1526	-6	B6	27	N192JB	JFK	TPA	160	1005	12	29	2013-01-01 17:00:00
2013	1	1	1228	1224	4	1631	1604	27	UA	1114	N38459	EWR	PHX	339	2133	12	24	2013-01-01 17:00:00
2013	1	1	1230	1235	-5	1440	1438	2	EV	5311	N741EV	EWR	DTW	108	488	12	35	2013-01-01 17:00:00
2013	1	1	1231	1238	-7	1449	1446	3	DL	1131	N920DL	LGA	DTW	108	502	12	38	2013-01-01 17:00:00
2013	1	1	1231	1229	2	1523	1529	-6	UA	428	N402UA	EWR	FLL	156	1065	12	29	2013-01-01 17:00:00
2013	1	1	1237	1245	-8	1340	1350	-10	AA	1850	N3EGAA	JFK	BOS	40	187	12	45	2013-01-01 17:00:00
2013	1	1	1238	1240	-2	1410	1405	5	WN	564	N297WN	LGA	MKE	137	738	12	40	2013-01-01 17:00:00
2013	1	1	1240	1229	11	1451	1428	23	EV	4118	N14543	EWR	DTW	114	488	12	29	2013-01-01 17:00:00
2013	1	1	1240	1245	-5	1554	1600	-6	AA	2253	N3BUAA	LGA	MIA	156	1096	12	45	2013-01-01 17:00:00
2013	1	1	1240	1235	5	1415	1415	0	MQ	4404	N828MQ	JFK	RDU	79	427	12	35	2013-01-01 17:00:00
2013	1	1	1241	1247	-6	1342	1355	-13	EV	4129	N36915	EWR	DCA	45	199	12	47	2013-01-01 17:00:00
2013	1	1	1245	1245	0	1616	1615	1	DL	2174	N711ZX	JFK	SLC	298	1990	12	45	2013-01-01 17:00:00
2013	1	1	1245	1249	-4	1722	1800	-38	DL	315	N670DN	JFK	SJU	188	1598	12	49	2013-01-01 17:00:00
2013	1	1	1246	1225	21	1424	1348	36	B6	66	N228JB	JFK	BUF	70	301	12	25	2013-01-01 17:00:00
2013	1	1	1248	1250	-2	1607	1607	0	UA	1280	N26210	LGA	IAH	238	1416	12	50	2013-01-01 17:00:00
2013	1	1	1251	1252	-1	1611	1555	16	B6	85	N657JB	JFK	FLL	173	1069	12	52	2013-01-01 17:00:00
2013	1	1	1252	1245	7	1624	1550	34	AA	745	N3FTAA	LGA	DFW	243	1389	12	45	2013-01-01 17:00:00
2013	1	1	1253	1212	41	1524	1436	48	UA	754	N576UA	EWR	DEN	252	1605	12	12	2013-01-01 17:00:00
2013	1	1	1255	1300	-5	1541	1537	4	DL	781	N644DL	LGA	ATL	132	762	13	0	2013-01-01 18:00:00
2013	1	1	1255	1255	0	1540	1535	5	WN	1251	N732SW	LGA	DEN	264	1620	12	55	2013-01-01 17:00:00
2013	1	1	1255	1200	55	1451	1330	81	MQ	4601	N518MQ	LGA	BNA	139	764	12	0	2013-01-01 17:00:00
2013	1	1	1255	1259	-4	1501	1502	-1	US	1459	N540UW	LGA	CLT	100	544	12	59	2013-01-01 17:00:00
2013	1	1	1255	1300	-5	1401	1409	-8	US	2128	N957UW	LGA	BOS	38	184	13	0	2013-01-01 18:00:00
2013	1	1	1257	1258	-1	1601	1610	-9	B6	209	N793JB	JFK	LGB	346	2465	12	58	2013-01-01 17:00:00
2013	1	1	1257	1300	-3	1454	1450	4	MQ	4426	N739MQ	LGA	CMH	97	479	13	0	2013-01-01 18:00:00
2013	1	1	1258	1308	-10	1532	1537	-5	FL	348	N717JL	LGA	ATL	128	762	13	8	2013-01-01 18:00:00
2013	1	1	1258	1300	-2	1459	1440	19	AA	329	N511AA	LGA	ORD	147	733	13	0	2013-01-01 18:00:00
2013	1	1	1301	1240	21	1633	1540	53	AA	1853	N544AA	EWR	DFW	252	1372	12	40	2013-01-01 17:00:00
2013	1	1	1301	1150	71	1518	1345	93	MQ	4646	N542MQ	LGA	MSP	170	1020	11	50	2013-01-01 16:00:00
2013	1	1	1301	1255	6	1629	1603	26	UA	765	N825UA	EWR	DFW	243	1372	12	55	2013-01-01 17:00:00
2013	1	1	1302	1259	3	1402	1404	-2	B6	1006	N273JB	JFK	BOS	40	187	12	59	2013-01-01 17:00:00
2013	1	1	1302	1300	2	1553	1601	-8	UA	1435	N78511	EWR	MIA	158	1085	13	0	2013-01-01 18:00:00
2013	1	1	1304	1227	37	1518	1422	56	EV	4640	N19966	EWR	DAY	107	533	12	27	2013-01-01 17:00:00
2013	1	1	1304	1259	5	1430	1418	12	B6	32	N346JB	JFK	ROC	65	264	12	59	2013-01-01 17:00:00
2013	1	1	1305	1315	-10	1523	1520	3	MQ	4564	N725MQ	LGA	DTW	102	502	13	15	2013-01-01 18:00:00
2013	1	1	1306	1240	26	1622	1555	27	AA	2041	N5DMAA	JFK	MIA	163	1089	12	40	2013-01-01 17:00:00
2013	1	1	1306	1300	6	1622	1610	12	WN	2596	N773SA	EWR	HOU	239	1411	13	0	2013-01-01 18:00:00
2013	1	1	1310	1300	10	1559	1554	5	B6	991	N593JB	JFK	PBI	150	1028	13	0	2013-01-01 18:00:00
2013	1	1	1314	1315	-1	1507	1505	2	US	1615	N177US	EWR	CLT	95	529	13	15	2013-01-01 18:00:00
2013	1	1	1315	1317	-2	1413	1423	-10	EV	4112	N13538	EWR	ALB	33	143	13	17	2013-01-01 18:00:00
2013	1	1	1316	1314	2	1412	1415	-3	EV	4340	N11551	EWR	BWI	38	169	13	14	2013-01-01 18:00:00
2013	1	1	1317	1325	-8	1454	1505	-11	MQ	4475	N711MQ	LGA	RDU	80	431	13	25	2013-01-01 18:00:00
2013	1	1	1318	1322	-4	1358	1416	-18	EV	4106	N19554	EWR	BDL	25	116	13	22	2013-01-01 18:00:00
2013	1	1	1320	1315	5	1602	1605	-3	B6	393	N537JB	LGA	MCO	140	950	13	15	2013-01-01 18:00:00
2013	1	1	1320	1320	0	1625	1636	-11	UA	1425	N58101	EWR	LAX	334	2454	13	20	2013-01-01 18:00:00
2013	1	1	1323	1300	23	1651	1608	43	DL	1185	N3736C	EWR	SLC	295	1969	13	0	2013-01-01 18:00:00
2013	1	1	1325	1330	-5	1606	1605	1	DL	2043	N318US	JFK	ATL	131	760	13	30	2013-01-01 18:00:00
2013	1	1	1327	1330	-3	1638	1655	-17	VX	411	N642VA	JFK	LAX	352	2475	13	30	2013-01-01 18:00:00
2013	1	1	1327	1329	-2	1624	1629	-5	UA	906	N847UA	EWR	FLL	157	1065	13	29	2013-01-01 18:00:00
2013	1	1	1330	1321	9	1613	1536	37	EV	3849	N14558	EWR	IND	149	645	13	21	2013-01-01 18:00:00
2013	1	1	1333	1335	-2	1608	1608	0	B6	615	N306JB	JFK	JAX	134	828	13	35	2013-01-01 18:00:00
2013	1	1	1336	1340	-4	1508	1500	8	EV	4665	N13988	EWR	PIT	69	319	13	40	2013-01-01 18:00:00
2013	1	1	1337	1220	77	1649	1531	78	B6	673	N636JB	JFK	LAX	352	2475	12	20	2013-01-01 17:00:00
2013	1	1	1339	1345	-6	1642	1705	-23	AA	1073	N3EMAA	LGA	MIA	161	1096	13	45	2013-01-01 18:00:00
2013	1	1	1339	1335	4	1654	1631	23	B6	431	N510JB	LGA	SRQ	170	1047	13	35	2013-01-01 18:00:00
2013	1	1	1341	1345	-4	1709	1705	4	AA	117	N339AA	JFK	LAX	362	2475	13	45	2013-01-01 18:00:00
2013	1	1	1342	1320	22	1617	1504	73	EV	3832	N13969	EWR	STL	194	872	13	20	2013-01-01 18:00:00
2013	1	1	1343	1330	13	1658	1640	18	AA	753	N3CFAA	LGA	DFW	235	1389	13	30	2013-01-01 18:00:00
2013	1	1	1344	1344	0	2005	1944	21	UA	15	N76065	EWR	HNL	656	4963	13	44	2013-01-01 18:00:00
2013	1	1	1346	1330	16	1736	1710	26	WN	2335	N900WN	EWR	PHX	334	2133	13	30	2013-01-01 18:00:00
2013	1	1	1350	1329	21	1504	1453	11	EV	4254	N14542	EWR	BUF	57	282	13	29	2013-01-01 18:00:00
2013	1	1	1350	1355	-5	1456	1510	-14	B6	602	N216JB	JFK	PWM	49	273	13	55	2013-01-01 18:00:00
2013	1	1	1351	1355	-4	1446	1459	-13	EV	4434	N13566	EWR	MHT	37	209	13	55	2013-01-01 18:00:00
2013	1	1	1353	1357	-4	1549	1525	24	EV	4171	N14105	EWR	MSN	152	799	13	57	2013-01-01 18:00:00
2013	1	1	1354	1356	-2	1556	1600	-4	EV	4370	N23139	EWR	CHS	102	628	13	56	2013-01-01 18:00:00
2013	1	1	1354	1359	-5	1452	1514	-22	DL	2068	N344NB	JFK	BOS	37	187	13	59	2013-01-01 18:00:00
2013	1	1	1355	1315	40	1538	1452	46	EV	4552	N13958	EWR	GSO	86	445	13	15	2013-01-01 18:00:00
2013	1	1	1355	1356	-1	1646	1650	-4	B6	1783	N709JB	JFK	MCO	144	944	13	56	2013-01-01 18:00:00
2013	1	1	1355	1350	5	1537	1515	22	WN	2162	N7704B	LGA	MDW	141	725	13	50	2013-01-01 18:00:00
2013	1	1	1356	1350	6	1612	1545	27	MQ	4577	N513MQ	LGA	CLT	98	544	13	50	2013-01-01 18:00:00
2013	1	1	1356	1259	57	1538	1438	60	UA	32	N17128	EWR	ORD	135	719	12	59	2013-01-01 17:00:00
2013	1	1	1356	1354	2	1537	1526	11	UA	617	N840UA	LGA	ORD	146	733	13	54	2013-01-01 18:00:00
2013	1	1	1356	1350	6	1659	1640	19	UA	1258	N26906	EWR	IAH	218	1400	13	50	2013-01-01 18:00:00
2013	1	1	1358	1350	8	1742	1715	27	US	688	N654AW	EWR	PHX	318	2133	13	50	2013-01-01 18:00:00
2013	1	1	1400	1250	70	1645	1502	103	EV	4869	N748EV	LGA	MEM	178	963	12	50	2013-01-01 17:00:00
2013	1	1	1400	1400	0	1634	1636	-2	DL	2247	N6704Z	LGA	ATL	130	762	14	0	2013-01-01 19:00:00
2013	1	1	1402	1323	39	1650	1526	84	EV	4516	N13123	EWR	MEM	183	946	13	23	2013-01-01 18:00:00
2013	1	1	1408	1411	-3	1646	1640	6	FL	349	N895AT	LGA	ATL	133	762	14	11	2013-01-01 19:00:00
2013	1	1	1411	1315	56	1717	1611	66	B6	505	N516JB	EWR	FLL	154	1065	13	15	2013-01-01 18:00:00
2013	1	1	1416	1411	5	1603	1549	14	UA	683	N456UA	EWR	ORD	136	719	14	11	2013-01-01 19:00:00
2013	1	1	1418	1419	-1	1726	1732	-6	UA	16	N37464	EWR	SEA	348	2402	14	19	2013-01-01 19:00:00
2013	1	1	1419	1420	-1	1557	1550	7	MQ	3728	N500MQ	EWR	ORD	136	719	14	20	2013-01-01 19:00:00
2013	1	1	1421	1422	-1	1517	1535	-18	B6	1010	N274JB	JFK	BOS	38	187	14	22	2013-01-01 19:00:00
2013	1	1	1421	1355	26	1735	1709	26	B6	83	N503JB	JFK	SEA	349	2422	13	55	2013-01-01 18:00:00
2013	1	1	1421	1430	-9	1724	1752	-28	DL	1531	N327NW	LGA	RSW	160	1080	14	30	2013-01-01 19:00:00
2013	1	1	1422	1410	12	1613	1555	18	MQ	4491	N737MQ	LGA	CLE	93	419	14	10	2013-01-01 19:00:00
2013	1	1	1422	1425	-3	1748	1759	-11	UA	257	N502UA	JFK	SFO	362	2586	14	25	2013-01-01 19:00:00
2013	1	1	1423	1430	-7	1535	1550	-15	EV	5710	N835AS	LGA	IAD	53	229	14	30	2013-01-01 19:00:00
2013	1	1	1424	1349	35	1701	1556	65	EV	4687	N15574	EWR	CVG	129	569	13	49	2013-01-01 18:00:00
2013	1	1	1424	1420	4	1659	1644	15	EV	4935	N678CA	EWR	ATL	132	746	14	20	2013-01-01 19:00:00
2013	1	1	1428	1329	59	1803	1640	83	B6	355	N635JB	JFK	BUR	371	2465	13	29	2013-01-01 18:00:00
2013	1	1	1430	1359	31	1718	1652	26	UA	278	N563UA	EWR	PBI	149	1023	13	59	2013-01-01 18:00:00
2013	1	1	1430	1430	0	1735	1744	-9	UA	997	N452UA	LGA	IAH	227	1416	14	30	2013-01-01 19:00:00
2013	1	1	1431	1429	2	1727	1722	5	B6	1161	N562JB	LGA	PBI	151	1035	14	29	2013-01-01 19:00:00
2013	1	1	1431	1440	-9	1627	1616	11	UA	601	N849UA	EWR	CLE	91	404	14	40	2013-01-01 19:00:00
2013	1	1	1433	1435	-2	1636	1644	-8	DL	1819	N327NB	LGA	MSP	163	1020	14	35	2013-01-01 19:00:00
2013	1	1	1436	1435	1	1840	1820	20	DL	1322	N722TW	JFK	SFO	375	2586	14	35	2013-01-01 19:00:00
2013	1	1	1439	1445	-6	1558	1613	-15	DL	1972	N319NB	JFK	DCA	56	213	14	45	2013-01-01 19:00:00
2013	1	1	1440	1440	0	1658	1643	15	DL	1231	N926DL	LGA	DTW	94	502	14	40	2013-01-01 19:00:00
2013	1	1	1442	1450	-8	1728	1755	-27	AA	1813	N5FMAA	JFK	MCO	141	944	14	50	2013-01-01 19:00:00
2013	1	1	1443	1444	-1	1600	1602	-2	EV	4292	N13908	EWR	IAD	51	212	14	44	2013-01-01 19:00:00
2013	1	1	1445	1455	-10	1635	1645	-10	AA	337	N4UCAA	LGA	ORD	147	733	14	55	2013-01-01 19:00:00
2013	1	1	1445	1445	0	1729	1710	19	MQ	4669	N532MQ	LGA	ATL	129	762	14	45	2013-01-01 19:00:00
2013	1	1	1446	1455	-9	1803	1825	-22	AA	1769	N5EWAA	JFK	MIA	161	1089	14	55	2013-01-01 19:00:00
2013	1	1	1448	1445	3	1651	1647	4	US	1445	N560UW	LGA	CLT	96	544	14	45	2013-01-01 19:00:00
2013	1	1	1449	1450	-1	1651	1640	11	MQ	4403	N853MQ	JFK	RDU	78	427	14	50	2013-01-01 19:00:00
2013	1	1	1451	1500	-9	1634	1636	-2	9E	4105	N8444F	JFK	IAD	57	228	15	0	2013-01-01 20:00:00
2013	1	1	1452	1455	-3	1637	1639	-2	9E	3295	N920XJ	JFK	BUF	68	301	14	55	2013-01-01 19:00:00
2013	1	1	1452	1457	-5	1753	1811	-18	B6	61	N292JB	JFK	FLL	162	1069	14	57	2013-01-01 19:00:00
2013	1	1	1453	1450	3	1707	1645	22	MQ	4172	N610MQ	JFK	CLE	99	425	14	50	2013-01-01 19:00:00
2013	1	1	1453	1500	-7	1601	1620	-19	US	2179	N951UW	LGA	DCA	51	214	15	0	2013-01-01 20:00:00
2013	1	1	1454	1458	-4	1554	1615	-21	EV	4390	N11544	EWR	PWM	47	284	14	58	2013-01-01 19:00:00
2013	1	1	1454	1500	-6	1635	1636	-1	9E	3843	N8409N	JFK	SYR	57	209	15	0	2013-01-01 20:00:00
2013	1	1	1454	1500	-6	1815	1837	-22	DL	1467	N702TW	JFK	LAX	340	2475	15	0	2013-01-01 20:00:00
2013	1	1	1455	1457	-2	1731	1730	1	B6	119	N279JB	JFK	MSY	192	1182	14	57	2013-01-01 19:00:00
2013	1	1	1455	1459	-4	1655	1645	10	B6	1053	N203JB	JFK	PIT	87	340	14	59	2013-01-01 19:00:00
2013	1	1	1455	1500	-5	1753	1810	-17	DL	1997	N997DL	LGA	PBI	152	1035	15	0	2013-01-01 20:00:00
2013	1	1	1456	1500	-4	1649	1632	17	UA	685	N802UA	LGA	ORD	140	733	15	0	2013-01-01 20:00:00
2013	1	1	1456	1455	1	1830	1813	17	UA	1134	N24212	EWR	AUS	252	1504	14	55	2013-01-01 19:00:00
2013	1	1	1457	1500	-3	1758	1815	-17	UA	379	N401UA	EWR	RSW	166	1068	15	0	2013-01-01 20:00:00
2013	1	1	1457	1500	-3	1652	1656	-4	US	720	N539UW	EWR	CLT	97	529	15	0	2013-01-01 20:00:00
2013	1	1	1458	1500	-2	1658	1655	3	MQ	4429	N736MQ	LGA	CMH	94	479	15	0	2013-01-01 20:00:00
2013	1	1	1459	1501	-2	1651	1651	0	EV	5675	N15572	EWR	CMH	96	463	15	1	2013-01-01 20:00:00
2013	1	1	1459	1454	5	1750	1751	-1	UA	1105	N75435	EWR	TPA	152	997	14	54	2013-01-01 19:00:00
2013	1	1	1500	1459	1	1809	1806	3	B6	377	N633JB	LGA	FLL	167	1076	14	59	2013-01-01 19:00:00
2013	1	1	1502	1500	2	1802	1806	-4	UA	456	N406UA	EWR	FLL	156	1065	15	0	2013-01-01 20:00:00
2013	1	1	1505	1310	115	1638	1431	127	EV	4497	N17984	EWR	RIC	63	277	13	10	2013-01-01 18:00:00
2013	1	1	1505	1510	-5	1654	1655	-1	MQ	4447	N734MQ	LGA	RDU	82	431	15	10	2013-01-01 20:00:00
2013	1	1	1506	1505	1	1838	1820	18	AA	759	N3DUAA	LGA	DFW	248	1389	15	5	2013-01-01 20:00:00
2013	1	1	1506	1512	-6	1723	1741	-18	UA	407	N513UA	LGA	DEN	237	1620	15	12	2013-01-01 20:00:00
2013	1	1	1507	1515	-8	1651	1656	-5	9E	3792	N8631E	JFK	ROC	66	264	15	15	2013-01-01 20:00:00
2013	1	1	1507	1510	-3	1748	1745	3	MQ	4309	N803MQ	JFK	IND	130	665	15	10	2013-01-01 20:00:00
2013	1	1	1508	1450	18	1813	1747	26	UA	1687	N76529	EWR	MCO	146	937	14	50	2013-01-01 19:00:00
2013	1	1	1510	1517	-7	1811	1811	0	B6	537	N563JB	EWR	TPA	156	997	15	17	2013-01-01 20:00:00
2013	1	1	1511	1500	11	1753	1742	11	DL	2347	N678DL	LGA	ATL	135	762	15	0	2013-01-01 20:00:00
2013	1	1	1511	1515	-4	1657	1700	-3	DL	1456	N318NB	LGA	BUF	60	292	15	15	2013-01-01 20:00:00
2013	1	1	1512	1518	-6	1805	1823	-18	B6	153	N645JB	JFK	MCO	142	944	15	18	2013-01-01 20:00:00
2013	1	1	1513	1505	8	1714	1703	11	EV	4223	N13914	EWR	CLT	102	529	15	5	2013-01-01 20:00:00
2013	1	1	1513	1515	-2	1705	1700	5	MQ	4333	N635MQ	JFK	PIT	79	340	15	15	2013-01-01 20:00:00
2013	1	1	1515	1437	38	1834	1742	52	B6	347	N178JB	JFK	SRQ	171	1041	14	37	2013-01-01 19:00:00
2013	1	1	1518	1516	2	1837	1832	5	UA	1699	N53442	EWR	SFO	348	2565	15	16	2013-01-01 20:00:00
2013	1	1	1520	1430	50	1835	1735	60	AA	883	N589AA	EWR	DFW	236	1372	14	30	2013-01-01 19:00:00
2013	1	1	1520	1525	-5	1643	1655	-12	MQ	3823	N509MQ	JFK	DCA	57	213	15	25	2013-01-01 20:00:00
2013	1	1	1520	1520	0	1817	1816	1	UA	1593	N13750	EWR	MCO	152	937	15	20	2013-01-01 20:00:00
2013	1	1	1521	1515	6	1830	1823	7	DL	507	N378NW	LGA	MCO	145	950	15	15	2013-01-01 20:00:00
2013	1	1	1522	1530	-8	1731	1725	6	MQ	4146	N902MQ	JFK	CMH	98	483	15	30	2013-01-01 20:00:00
2013	1	1	1522	1530	-8	1858	1855	3	UA	530	N512UA	JFK	LAX	356	2475	15	30	2013-01-01 20:00:00
2013	1	1	1523	1516	7	1831	1828	3	UA	1600	N18112	EWR	LAX	337	2454	15	16	2013-01-01 20:00:00
2013	1	1	1524	1457	27	1828	1801	27	B6	141	N504JB	JFK	PBI	156	1028	14	57	2013-01-01 19:00:00
2013	1	1	1525	1340	105	1831	1626	125	B6	525	N231JB	EWR	MCO	152	937	13	40	2013-01-01 18:00:00
2013	1	1	1525	1530	-5	1934	1805	\N	MQ	4525	N719MQ	LGA	XNA	\N	1147	15	30	2013-01-01 20:00:00
2013	1	1	1526	1530	-4	1714	1650	24	WN	4105	N280WN	EWR	MDW	141	711	15	30	2013-01-01 20:00:00
2013	1	1	1527	1530	-3	1841	1855	-14	AA	1039	N3HYAA	JFK	FLL	163	1069	15	30	2013-01-01 20:00:00
2013	1	1	1527	1455	32	1655	1628	27	B6	8	N607JB	JFK	BUF	66	301	14	55	2013-01-01 19:00:00
2013	1	1	1527	1533	-6	1836	1857	-21	B6	137	N794JB	JFK	RSW	168	1074	15	33	2013-01-01 20:00:00
2013	1	1	1527	1515	12	1854	1810	44	UA	1695	N69059	EWR	IAH	210	1400	15	15	2013-01-01 20:00:00
2013	1	1	1528	1459	29	2002	1647	\N	EV	3806	N17108	EWR	STL	\N	872	14	59	2013-01-01 19:00:00
2013	1	1	1528	1530	-2	1731	1725	6	AA	2223	N573AA	LGA	STL	160	888	15	30	2013-01-01 20:00:00
2013	1	1	1529	1457	32	1720	1634	46	UA	459	N497UA	EWR	ORD	138	719	14	57	2013-01-01 19:00:00
2013	1	1	1529	1530	-1	1733	1737	-4	US	1665	N738US	LGA	CLT	103	544	15	30	2013-01-01 20:00:00
2013	1	1	1530	1530	0	1650	1655	-5	9E	3369	N913XJ	JFK	BWI	40	184	15	30	2013-01-01 20:00:00
2013	1	1	1531	1453	38	1637	1603	34	EV	4372	N13975	EWR	DCA	45	199	14	53	2013-01-01 19:00:00
2013	1	1	1531	1459	32	1745	1658	47	EV	4572	N15912	EWR	GSP	106	594	14	59	2013-01-01 19:00:00
2013	1	1	1531	1520	11	1809	1750	19	UA	365	N514UA	EWR	DEN	247	1605	15	20	2013-01-01 20:00:00
2013	1	1	1534	1530	4	1755	1735	20	EV	4093	N17115	EWR	GRR	120	605	15	30	2013-01-01 20:00:00
2013	1	1	1536	1520	16	1709	1650	19	WN	2081	N226WN	LGA	MKE	133	738	15	20	2013-01-01 20:00:00
2013	1	1	1538	1540	-2	1827	1851	-24	DL	4	N372DA	JFK	MCO	133	944	15	40	2013-01-01 20:00:00
2013	1	1	1539	1530	9	1904	1910	-6	AA	85	N342AA	JFK	SFO	360	2586	15	30	2013-01-01 20:00:00
2013	1	1	1539	1545	-6	1853	1910	-17	AA	133	N319AA	JFK	LAX	351	2475	15	45	2013-01-01 20:00:00
2013	1	1	1539	1537	2	1854	1819	35	UA	1222	N14250	EWR	LAS	342	2227	15	37	2013-01-01 20:00:00
2013	1	1	1540	1338	122	2020	1825	115	B6	705	N570JB	JFK	SJU	193	1598	13	38	2013-01-01 18:00:00
2013	1	1	1542	1545	-3	1852	1913	-21	DL	1283	N3750D	JFK	SAN	342	2446	15	45	2013-01-01 20:00:00
2013	1	1	1543	1550	-7	1933	1925	8	DL	1773	N688DL	JFK	SLC	320	1990	15	50	2013-01-01 20:00:00
2013	1	1	1543	1543	0	1731	1733	-2	UA	636	N413UA	LGA	CLE	88	419	15	43	2013-01-01 20:00:00
2013	1	1	1546	1540	6	1753	1748	5	9E	3338	N904XJ	JFK	ORD	146	740	15	40	2013-01-01 20:00:00
2013	1	1	1547	1545	2	1823	1815	8	DL	1942	N994DL	EWR	ATL	129	746	15	45	2013-01-01 20:00:00
2013	1	1	1548	1420	88	1751	1620	91	MQ	4588	N6EAMQ	LGA	MSP	167	1020	14	20	2013-01-01 19:00:00
2013	1	1	1549	1445	64	1912	1656	136	EV	4181	N21197	EWR	MCI	234	1092	14	45	2013-01-01 19:00:00
2013	1	1	1549	1548	1	1851	1859	-8	UA	80	N54241	EWR	MIA	156	1085	15	48	2013-01-01 20:00:00
2013	1	1	1550	1550	0	1844	1831	13	9E	3372	N934XJ	JFK	IND	139	665	15	50	2013-01-01 20:00:00
2013	1	1	1552	1600	-8	1732	1720	12	EV	5709	N825AS	LGA	IAD	55	229	16	0	2013-01-01 21:00:00
2013	1	1	1552	1600	-8	1826	1820	6	FL	620	N997AT	LGA	ATL	132	762	16	0	2013-01-01 21:00:00
2013	1	1	1552	1600	-8	1749	1757	-8	9E	3459	N910XJ	JFK	BNA	150	765	16	0	2013-01-01 21:00:00
2013	1	1	1552	1600	-8	1933	1915	18	AA	565	N3CGAA	JFK	DFW	254	1391	16	0	2013-01-01 21:00:00
2013	1	1	1554	1600	-6	1701	1734	-33	9E	3331	N931XJ	JFK	BOS	41	187	16	0	2013-01-01 21:00:00
2013	1	1	1554	1559	-5	1857	1841	16	DL	847	N918DE	LGA	ATL	131	762	15	59	2013-01-01 20:00:00
2013	1	1	1554	1600	-6	1830	1820	10	MQ	3985	N606MQ	JFK	CVG	118	589	16	0	2013-01-01 21:00:00
2013	1	1	1556	1600	-4	1737	1739	-2	EV	5163	N761ND	LGA	PIT	69	335	16	0	2013-01-01 21:00:00
2013	1	1	1557	1600	-3	1910	1939	-29	DL	1508	N955DL	JFK	RSW	171	1074	16	0	2013-01-01 21:00:00
2013	1	1	1557	1600	-3	1746	1742	4	UA	687	N487UA	LGA	ORD	143	733	16	0	2013-01-01 21:00:00
2013	1	1	1558	1534	24	1808	1703	65	EV	4502	N16546	EWR	BNA	168	748	15	34	2013-01-01 20:00:00
2013	1	1	1558	1359	119	1718	1515	123	EV	5712	N826AS	JFK	IAD	53	228	13	59	2013-01-01 18:00:00
2013	1	1	1558	1600	-2	1910	1903	7	B6	509	N708JB	EWR	FLL	166	1065	16	0	2013-01-01 21:00:00
2013	1	1	1559	1605	-6	1844	1912	-28	DL	91	N374DA	JFK	LAS	309	2248	16	5	2013-01-01 21:00:00
2013	1	1	1600	1610	-10	1712	1729	-17	9E	4088	N8968E	JFK	PHL	35	94	16	10	2013-01-01 21:00:00
2013	1	1	1601	1601	0	1750	1735	15	UA	702	N484UA	EWR	ORD	141	719	16	1	2013-01-01 21:00:00
2013	1	1	1602	1605	-3	1834	1838	-4	DL	1861	N301NB	LGA	MCI	189	1107	16	5	2013-01-01 21:00:00
2013	1	1	1603	1547	16	1720	1708	12	EV	3272	N14168	EWR	BUF	58	282	15	47	2013-01-01 20:00:00
2013	1	1	1603	1550	13	1751	1739	12	B6	917	N316JB	JFK	ORD	150	740	15	50	2013-01-01 20:00:00
2013	1	1	1603	1600	3	1839	1830	9	WN	591	N965WN	EWR	DEN	254	1605	16	0	2013-01-01 21:00:00
2013	1	1	1603	1605	-2	1818	1750	28	MQ	4415	N730MQ	LGA	RDU	79	431	16	5	2013-01-01 21:00:00
2013	1	1	1603	1600	3	1912	1906	6	UA	367	N820UA	EWR	FLL	162	1065	16	0	2013-01-01 21:00:00
2013	1	1	1604	1510	54	1817	1710	67	MQ	4579	N0EGMQ	LGA	CLT	106	544	15	10	2013-01-01 20:00:00
2013	1	1	1605	1610	-5	1804	1800	4	AA	341	N569AA	LGA	ORD	146	733	16	10	2013-01-01 21:00:00
2013	1	1	1607	1555	12	1735	1715	20	B6	12	N184JB	JFK	SYR	58	209	15	55	2013-01-01 20:00:00
2013	1	1	1607	1443	84	1711	1553	78	UA	465	N435UA	EWR	BOS	35	200	14	43	2013-01-01 19:00:00
2013	1	1	1608	1535	33	2002	1850	72	AA	763	N3GKAA	LGA	DFW	249	1389	15	35	2013-01-01 20:00:00
2013	1	1	1608	1600	8	1953	1925	28	AA	1467	N3DYAA	LGA	MIA	171	1096	16	0	2013-01-01 21:00:00
2013	1	1	1608	1609	-1	1847	1910	-23	B6	157	N712JB	JFK	MCO	137	944	16	9	2013-01-01 21:00:00
2013	1	1	1610	1615	-5	1913	1948	-35	DL	1411	N947DL	JFK	FLL	155	1069	16	15	2013-01-01 21:00:00
2013	1	1	1610	1615	-5	1827	1830	-3	DL	1619	N360NB	LGA	MSP	168	1020	16	15	2013-01-01 21:00:00
2013	1	1	1610	1555	15	1852	1834	18	DL	1939	N362NW	LGA	DEN	235	1620	15	55	2013-01-01 20:00:00
2013	1	1	1611	1601	10	2010	1941	29	UA	1635	N76504	EWR	PHX	328	2133	16	1	2013-01-01 21:00:00
2013	1	1	1615	1602	13	1748	1728	20	EV	4406	N36915	EWR	PIT	73	319	16	2	2013-01-01 21:00:00
2013	1	1	1619	1625	-6	1912	1855	17	MQ	4661	N537MQ	LGA	ATL	136	762	16	25	2013-01-01 21:00:00
2013	1	1	1620	1620	0	1945	1922	23	UA	1178	N18119	EWR	IAH	242	1400	16	20	2013-01-01 21:00:00
2013	1	1	1621	1548	33	1904	1830	34	DL	95	N704X	JFK	ATL	130	760	15	48	2013-01-01 20:00:00
2013	1	1	1623	1620	3	2002	1959	3	US	35	N550UW	JFK	PHX	317	2153	16	20	2013-01-01 21:00:00
2013	1	1	1625	1550	35	2054	2050	4	AA	1635	N630AA	JFK	SJU	188	1598	15	50	2013-01-01 20:00:00
2013	1	1	1626	1630	-4	2007	1952	15	B6	675	N804JB	JFK	LAX	370	2475	16	30	2013-01-01 21:00:00
2013	1	1	1626	1630	-4	1855	1853	2	DL	702	N361NW	JFK	DTW	108	509	16	30	2013-01-01 21:00:00
2013	1	1	1627	1459	88	1925	1805	80	B6	63	N599JB	JFK	TPA	159	1005	14	59	2013-01-01 19:00:00
2013	1	1	1627	1630	-3	1940	2020	-40	VX	27	N847VA	JFK	SFO	354	2586	16	30	2013-01-01 21:00:00
2013	1	1	1628	1524	64	1740	1641	59	EV	4133	N14959	EWR	IAD	53	212	15	24	2013-01-01 20:00:00
2013	1	1	1628	1630	-2	1907	1923	-16	DL	920	N331NW	JFK	DEN	248	1626	16	30	2013-01-01 21:00:00
2013	1	1	1630	1548	42	1902	1755	67	EV	4352	N22909	EWR	CVG	121	569	15	48	2013-01-01 20:00:00
2013	1	1	1630	1636	-6	1913	1943	-30	B6	143	N534JB	JFK	PBI	147	1028	16	36	2013-01-01 21:00:00
2013	1	1	1631	1617	14	1740	1727	13	EV	4299	N14972	EWR	DCA	48	199	16	17	2013-01-01 21:00:00
2013	1	1	1631	1635	-4	1956	2000	-4	US	656	N649AW	EWR	PHX	309	2133	16	35	2013-01-01 21:00:00
2013	1	1	1631	1630	1	1935	1950	-15	UA	1726	N75425	EWR	SAN	346	2425	16	30	2013-01-01 21:00:00
2013	1	1	1632	1635	-3	1903	1840	23	WN	190	N258WN	LGA	STL	181	888	16	35	2013-01-01 21:00:00
2013	1	1	1632	1635	-3	1824	1810	14	MQ	3695	N507MQ	EWR	ORD	139	719	16	35	2013-01-01 21:00:00
2013	1	1	1634	1626	8	1913	1852	21	UA	69	N27213	EWR	DEN	247	1605	16	26	2013-01-01 21:00:00
2013	1	1	1635	1630	5	1830	1810	20	UA	162	N16701	EWR	CLE	84	404	16	30	2013-01-01 21:00:00
2013	1	1	1636	1639	-3	1747	1755	-8	B6	1176	N190JB	EWR	BOS	42	200	16	39	2013-01-01 21:00:00
2013	1	1	1637	1545	52	1858	1819	39	9E	3321	N604LR	JFK	MSP	173	1029	15	45	2013-01-01 20:00:00
2013	1	1	1639	1517	82	1815	1639	96	EV	4580	N16561	EWR	MKE	140	725	15	17	2013-01-01 20:00:00
2013	1	1	1640	1640	0	1859	1850	9	MQ	4540	N723MQ	LGA	DTW	106	502	16	40	2013-01-01 21:00:00
2013	1	1	1641	1650	-9	1746	1820	-34	AA	1790	N3BYAA	JFK	BOS	41	187	16	50	2013-01-01 21:00:00
2013	1	1	1642	1610	32	1944	1919	25	UA	1587	N17229	EWR	RSW	161	1068	16	10	2013-01-01 21:00:00
2013	1	1	1645	1639	6	1832	1816	16	EV	4336	N13538	EWR	GSO	89	445	16	39	2013-01-01 21:00:00
2013	1	1	1649	1639	10	1937	1911	26	EV	4705	N14960	EWR	ATL	139	746	16	39	2013-01-01 21:00:00
2013	1	1	1650	1615	35	2009	1913	56	B6	985	N564JB	LGA	TPA	162	1010	16	15	2013-01-01 21:00:00
2013	1	1	1651	1650	1	2000	2004	-4	B6	185	N665JB	JFK	SAN	349	2446	16	50	2013-01-01 21:00:00
2013	1	1	1652	1640	12	2030	1955	35	AA	773	N565AA	LGA	DFW	252	1389	16	40	2013-01-01 21:00:00
2013	1	1	1653	1700	-7	2005	2018	-13	DL	1807	N980DL	LGA	FLL	158	1076	17	0	2013-01-01 22:00:00
2013	1	1	1654	1644	10	1752	1753	-1	EV	4539	N27962	EWR	MHT	38	209	16	44	2013-01-01 21:00:00
2013	1	1	1654	1700	-6	2020	2034	-14	DL	706	N320NB	JFK	AUS	251	1521	17	0	2013-01-01 22:00:00
2013	1	1	1655	1621	34	1804	1724	40	EV	3260	N19554	EWR	ALB	36	143	16	21	2013-01-01 21:00:00
2013	1	1	1655	1700	-5	1953	1950	3	AA	575	N5DRAA	JFK	EGE	280	1747	17	0	2013-01-01 22:00:00
2013	1	1	1655	1700	-5	2027	2049	-22	DL	31	N713TW	JFK	SFO	357	2586	17	0	2013-01-01 22:00:00
2013	1	1	1655	1655	0	2025	2030	-5	VX	413	N626VA	JFK	LAX	362	2475	16	55	2013-01-01 21:00:00
2013	1	1	1656	1700	-4	1941	1955	-14	AA	257	N3CAAA	JFK	LAS	322	2248	17	0	2013-01-01 22:00:00
2013	1	1	1657	1650	7	1921	1840	41	WN	2773	N462WN	EWR	STL	181	872	16	50	2013-01-01 21:00:00
2013	1	1	1657	1630	27	1948	1926	22	UA	1609	N17105	EWR	MCO	148	937	16	30	2013-01-01 21:00:00
2013	1	1	1658	1700	-2	1808	1840	-32	MQ	4323	N688MQ	JFK	ORF	52	290	17	0	2013-01-01 22:00:00
2013	1	1	1701	1710	-9	2026	2015	11	AA	695	N3FUAA	JFK	AUS	247	1521	17	10	2013-01-01 22:00:00
2013	1	1	1701	1700	1	1856	1840	16	UA	689	N418UA	LGA	ORD	144	733	17	0	2013-01-01 22:00:00
2013	1	1	1702	1700	2	2044	2028	16	UA	1259	N16632	LGA	IAH	234	1416	17	0	2013-01-01 22:00:00
2013	1	1	1705	1705	0	2054	2010	44	AA	1905	N4WRAA	EWR	DFW	251	1372	17	5	2013-01-01 22:00:00
2013	1	1	1705	1710	-5	1924	1915	9	US	1447	N188US	LGA	CLT	110	544	17	10	2013-01-01 22:00:00
2013	1	1	1707	1705	2	1928	1940	-12	DL	2121	N3730B	EWR	ATL	121	746	17	5	2013-01-01 22:00:00
2013	1	1	1707	1700	7	2006	2000	6	UA	342	N543UA	EWR	LAX	334	2454	17	0	2013-01-01 22:00:00
2013	1	1	1708	1700	8	2037	2005	32	WN	1066	N778SW	EWR	HOU	245	1411	17	0	2013-01-01 22:00:00
2013	1	1	1711	1650	21	1820	1806	14	EV	4194	N15986	EWR	BTV	48	266	16	50	2013-01-01 21:00:00
2013	1	1	1711	1635	36	1918	1845	33	B6	1085	N228JB	JFK	CLT	112	541	16	35	2013-01-01 21:00:00
2013	1	1	1711	1600	71	2005	1857	68	B6	369	N579JB	LGA	PBI	149	1035	16	0	2013-01-01 21:00:00
2013	1	1	1712	1719	-7	1939	1958	-19	UA	509	N569UA	LGA	DEN	241	1620	17	19	2013-01-01 22:00:00
2013	1	1	1712	1700	12	2042	2036	6	UA	635	N485UA	EWR	SAT	242	1569	17	0	2013-01-01 22:00:00
2013	1	1	1713	1700	13	2006	2014	-8	B6	15	N346JB	JFK	FLL	156	1069	17	0	2013-01-01 22:00:00
2013	1	1	1714	1720	-6	1915	1915	0	AA	1351	N3CVAA	JFK	ORD	146	740	17	20	2013-01-01 22:00:00
2013	1	1	1716	1730	-14	1947	1953	-6	F9	511	N263AV	LGA	DEN	242	1620	17	30	2013-01-01 22:00:00
2013	1	1	1716	1545	91	2140	2039	61	B6	703	N651JB	JFK	SJU	183	1598	15	45	2013-01-01 20:00:00
2013	1	1	1716	1709	7	1902	1846	16	UA	1623	N19130	EWR	ORD	143	719	17	9	2013-01-01 22:00:00
2013	1	1	1717	1720	-3	1920	1910	10	AA	345	N539AA	LGA	ORD	141	733	17	20	2013-01-01 22:00:00
2013	1	1	1718	1710	8	2154	2201	-7	B6	699	N507JB	JFK	SJU	189	1598	17	10	2013-01-01 22:00:00
2013	1	1	1719	1720	-1	1908	1905	3	MQ	4479	N713MQ	LGA	RDU	80	431	17	20	2013-01-01 22:00:00
2013	1	1	1720	1725	-5	2121	2105	16	DL	513	N723TW	JFK	LAX	363	2475	17	25	2013-01-01 22:00:00
2013	1	1	1725	1730	-5	1929	1926	3	US	449	N680AW	EWR	CLT	104	529	17	30	2013-01-01 22:00:00
2013	1	1	1725	1720	5	2045	2021	24	UA	1712	N17122	EWR	IAH	235	1400	17	20	2013-01-01 22:00:00
2013	1	1	1726	1730	-4	2054	2050	4	AA	543	N386AA	JFK	MIA	157	1089	17	30	2013-01-01 22:00:00
2013	1	1	1726	1729	-3	2042	2100	-18	UA	512	N557UA	JFK	SFO	347	2586	17	29	2013-01-01 22:00:00
2013	1	1	1727	1725	2	2043	2040	3	AA	145	N377AA	JFK	SAN	357	2446	17	25	2013-01-01 22:00:00
2013	1	1	1728	1600	88	2004	1817	107	EV	3843	N13903	EWR	SDF	135	642	16	0	2013-01-01 21:00:00
2013	1	1	1729	1718	11	2052	2055	-3	UA	1284	N14120	EWR	SFO	360	2565	17	18	2013-01-01 22:00:00
2013	1	1	1730	1730	0	2013	1959	14	FL	623	N967AT	LGA	ATL	128	762	17	30	2013-01-01 22:00:00
2013	1	1	1730	1730	0	2126	2110	16	B6	179	N618JB	JFK	PHX	323	2153	17	30	2013-01-01 22:00:00
2013	1	1	1730	1729	1	2039	2058	-19	UA	1715	N77296	EWR	SEA	344	2402	17	29	2013-01-01 22:00:00
2013	1	1	1732	1630	62	2028	1825	123	EV	4092	N16911	EWR	DAY	119	533	16	30	2013-01-01 21:00:00
2013	1	1	1736	1640	56	2047	2001	46	B6	139	N329JB	JFK	RSW	176	1074	16	40	2013-01-01 21:00:00
2013	1	1	1738	1745	-7	2030	2042	-12	B6	547	N508JB	EWR	PBI	147	1023	17	45	2013-01-01 22:00:00
2013	1	1	1739	1745	-6	1956	1953	3	DL	2331	N965DL	LGA	DTW	93	502	17	45	2013-01-01 22:00:00
2013	1	1	1739	1740	-1	2051	2112	-21	DL	1339	N3761R	JFK	PDX	341	2454	17	40	2013-01-01 22:00:00
2013	1	1	1740	1630	70	2102	1954	68	DL	2139	N369NW	LGA	MIA	167	1096	16	30	2013-01-01 21:00:00
2013	1	1	1740	1745	-5	2158	2020	\N	MQ	4413	N739MQ	LGA	XNA	\N	1147	17	45	2013-01-01 22:00:00
2013	1	1	1742	1746	-4	2028	2052	-24	DL	1585	N933DL	LGA	MCO	145	950	17	46	2013-01-01 22:00:00
2013	1	1	1743	1615	88	1925	1819	66	9E	3651	N8515F	JFK	RDU	72	427	16	15	2013-01-01 21:00:00
2013	1	1	1744	1750	-6	2043	2045	-2	B6	527	N661JB	EWR	MCO	137	937	17	50	2013-01-01 22:00:00
2013	1	1	1744	1720	24	2052	2025	27	B6	163	N658JB	JFK	TPA	160	1005	17	20	2013-01-01 22:00:00
2013	1	1	1744	1745	-1	2055	2059	-4	DL	1935	N900DE	LGA	TPA	160	1010	17	45	2013-01-01 22:00:00
2013	1	1	1744	1745	-1	1925	1915	10	WN	128	N8324A	LGA	MDW	137	725	17	45	2013-01-01 22:00:00
2013	1	1	1745	1749	-4	1943	1909	34	B6	1307	N216JB	JFK	IAD	65	228	17	49	2013-01-01 22:00:00
2013	1	1	1750	1750	0	2109	2115	-6	UA	535	N525UA	JFK	LAX	345	2475	17	50	2013-01-01 22:00:00
2013	1	1	1751	1745	6	2044	2040	4	B6	9	N527JB	JFK	MCO	141	944	17	45	2013-01-01 22:00:00
2013	1	1	1751	1745	6	2015	1910	65	WN	3384	N764SW	EWR	MDW	148	711	17	45	2013-01-01 22:00:00
2013	1	1	1753	1745	8	2058	2037	21	B6	391	N630JB	LGA	MCO	144	950	17	45	2013-01-01 22:00:00
2013	1	1	1756	1725	31	2036	2019	17	UA	376	N523UA	EWR	MCO	140	937	17	25	2013-01-01 22:00:00
2013	1	1	1757	1703	54	1904	1813	51	EV	4373	N14998	EWR	DCA	45	199	17	3	2013-01-01 22:00:00
2013	1	1	1757	1759	-2	2027	2042	-15	DL	1047	N643DL	LGA	ATL	125	762	17	59	2013-01-01 22:00:00
2013	1	1	1758	1800	-2	1905	1917	-12	B6	1016	N304JB	JFK	BOS	36	187	18	0	2013-01-01 23:00:00
2013	1	1	1758	1800	-2	2105	2110	-5	B6	989	N663JB	JFK	FLL	152	1069	18	0	2013-01-01 23:00:00
2013	1	1	1758	1749	9	2020	1943	37	UA	1676	N37274	EWR	ORD	135	719	17	49	2013-01-01 22:00:00
2013	1	1	1759	1759	0	1957	1949	8	EV	4581	N13566	EWR	CMH	95	463	17	59	2013-01-01 22:00:00
2013	1	1	1800	1800	0	1945	1951	-6	B6	1111	N294JB	JFK	RDU	78	427	18	0	2013-01-01 23:00:00
2013	1	1	1800	1800	0	1951	1954	-3	UA	1053	N16703	EWR	CLE	83	404	18	0	2013-01-01 23:00:00
2013	1	1	1802	1805	-3	1930	1944	-14	DL	1006	N359NB	LGA	BUF	61	292	18	5	2013-01-01 23:00:00
2013	1	1	1802	1801	1	2125	2137	-12	UA	1165	N75429	EWR	LAX	340	2454	18	1	2013-01-01 23:00:00
2013	1	1	1803	1726	37	2011	1934	37	EV	4382	N13958	EWR	DTW	104	488	17	26	2013-01-01 22:00:00
2013	1	1	1803	1620	103	2008	1750	138	MQ	4622	N504MQ	LGA	BNA	154	764	16	20	2013-01-01 21:00:00
2013	1	1	1803	1800	3	2021	2001	20	US	373	N510UW	JFK	CLT	100	541	18	0	2013-01-01 23:00:00
2013	1	1	1805	1757	8	2117	2119	-2	UA	1152	N39463	EWR	PDX	336	2434	17	57	2013-01-01 22:00:00
2013	1	1	1806	1810	-4	2002	1945	17	MQ	4484	N711MQ	LGA	BNA	152	764	18	10	2013-01-01 23:00:00
2013	1	1	1807	1738	29	2251	2103	\N	UA	1228	N31412	EWR	SAN	\N	2425	17	38	2013-01-01 22:00:00
2013	1	1	1808	1815	-7	2111	2130	-19	AS	7	N553AS	EWR	SEA	336	2402	18	15	2013-01-01 23:00:00
2013	1	1	1809	1810	-1	2117	2132	-15	B6	217	N592JB	JFK	LGB	337	2465	18	10	2013-01-01 23:00:00
2013	1	1	1811	1759	12	2132	2118	14	UA	618	N482UA	EWR	DFW	228	1372	17	59	2013-01-01 22:00:00
2013	1	1	1814	1700	74	2051	1855	116	EV	4202	N19966	EWR	STL	177	872	17	0	2013-01-01 22:00:00
2013	1	1	1814	1815	-1	2122	2151	-29	B6	173	N569JB	JFK	SJC	334	2569	18	15	2013-01-01 23:00:00
2013	1	1	1815	1325	290	2120	1542	338	EV	4417	N17185	EWR	OMA	213	1134	13	25	2013-01-01 18:00:00
2013	1	1	1815	1805	10	1928	1920	8	WN	731	N266WN	LGA	BWI	46	185	18	5	2013-01-01 23:00:00
2013	1	1	1816	1805	11	2013	1955	18	MQ	4626	N8EGMQ	LGA	CMH	93	479	18	5	2013-01-01 23:00:00
2013	1	1	1816	1800	16	2101	2050	11	UA	638	N522UA	EWR	LAS	307	2227	18	0	2013-01-01 23:00:00
2013	1	1	1817	1820	-3	2008	2005	3	AA	353	N3AXAA	LGA	ORD	138	733	18	20	2013-01-01 23:00:00
2013	1	1	1820	1820	0	2216	2150	26	AA	119	N3FMAA	EWR	LAX	366	2454	18	20	2013-01-01 23:00:00
2013	1	1	1823	1830	-7	2036	2055	-19	DL	924	N337NW	JFK	MSP	158	1029	18	30	2013-01-01 23:00:00
2013	1	1	1824	1830	-6	2203	2205	-2	AA	269	N3ETAA	JFK	SEA	348	2422	18	30	2013-01-01 23:00:00
2013	1	1	1825	1829	-4	2056	2053	3	9E	3286	N906XJ	JFK	DTW	107	509	18	29	2013-01-01 23:00:00
2013	1	1	1825	1829	-4	2046	2032	14	US	1973	N460UW	EWR	CLT	106	529	18	29	2013-01-01 23:00:00
2013	1	1	1826	1810	16	2132	2130	2	AA	1611	N3DWAA	LGA	MIA	153	1096	18	10	2013-01-01 23:00:00
2013	1	1	1826	1830	-4	2154	2207	-13	DL	1643	N3772H	JFK	SEA	334	2422	18	30	2013-01-01 23:00:00
2013	1	1	1827	1829	-2	2105	2056	9	UA	1139	N39728	EWR	DEN	246	1605	18	29	2013-01-01 23:00:00
2013	1	1	1828	1805	23	2023	1951	32	EV	4334	N11119	LGA	CLE	80	419	18	5	2013-01-01 23:00:00
2013	1	1	1830	1829	1	2131	2125	6	UA	1684	N33714	EWR	PBI	152	1023	18	29	2013-01-01 23:00:00
2013	1	1	1832	1823	9	1948	1940	8	EV	4326	N13988	EWR	PWM	48	284	18	23	2013-01-01 23:00:00
2013	1	1	1832	1835	-3	2059	2103	-4	9E	3830	N8894A	JFK	CHS	106	636	18	35	2013-01-01 23:00:00
2013	1	1	1832	1828	4	2144	2144	0	UA	1075	N18220	EWR	SNA	342	2434	18	28	2013-01-01 23:00:00
2013	1	1	1834	1840	-6	2027	2020	7	MQ	3730	N517MQ	EWR	ORD	137	719	18	40	2013-01-01 23:00:00
2013	1	1	1834	1800	34	2014	1942	32	UA	668	N467UA	LGA	ORD	123	733	18	0	2013-01-01 23:00:00
2013	1	1	1836	1726	70	2107	1933	94	EV	4179	N14543	EWR	CVG	123	569	17	26	2013-01-01 22:00:00
2013	1	1	1840	1836	4	2022	2010	12	B6	130	N281JB	JFK	BUF	70	301	18	36	2013-01-01 23:00:00
2013	1	1	1840	1845	-5	2055	2030	25	MQ	4517	N725MQ	LGA	CRW	96	444	18	45	2013-01-01 23:00:00
2013	1	1	1840	1845	-5	2223	2226	-3	UA	389	N508UA	JFK	SFO	357	2586	18	45	2013-01-01 23:00:00
2013	1	1	1842	1422	260	1958	1535	263	EV	4633	N18120	EWR	BTV	46	266	14	22	2013-01-01 19:00:00
2013	1	1	1842	1829	13	2144	2136	8	UA	1292	N14214	EWR	FLL	149	1065	18	29	2013-01-01 23:00:00
2013	1	1	1843	1850	-7	2052	2050	2	AA	2019	N594AA	LGA	STL	169	888	18	50	2013-01-01 23:00:00
2013	1	1	1843	1845	-2	1955	2024	-29	DL	904	N344NB	JFK	BOS	34	187	18	45	2013-01-01 23:00:00
2013	1	1	1843	1835	8	2339	2346	-7	DL	329	N900PC	JFK	SJU	192	1598	18	35	2013-01-01 23:00:00
2013	1	1	1846	1745	61	2147	2055	52	AA	785	N3ESAA	LGA	DFW	223	1389	17	45	2013-01-01 22:00:00
2013	1	1	1846	1855	-9	2336	2355	-19	AA	1613	N5BYAA	JFK	SJU	190	1598	18	55	2013-01-01 23:00:00
2013	1	1	1848	1745	63	2238	2120	78	AA	177	N332AA	JFK	SFO	361	2586	17	45	2013-01-01 22:00:00
2013	1	1	1849	1900	-11	2131	2129	2	FL	645	N920AT	LGA	ATL	134	762	19	0	2013-01-02 00:00:00
2013	1	1	1850	1900	-10	2007	2016	-9	EV	5714	N835AS	JFK	IAD	55	228	19	0	2013-01-02 00:00:00
2013	1	1	1850	1850	0	2142	2141	1	9E	3364	N908XJ	JFK	MSY	207	1182	18	50	2013-01-01 23:00:00
2013	1	1	1850	1850	0	2249	2240	9	VX	29	N638VA	JFK	SFO	364	2586	18	50	2013-01-01 23:00:00
2013	1	1	1853	1900	-7	2004	2018	-14	US	2187	N951UW	LGA	DCA	54	214	19	0	2013-01-02 00:00:00
2013	1	1	1854	1830	24	2055	2015	40	MQ	4674	N518MQ	LGA	CLE	87	419	18	30	2013-01-01 23:00:00
2013	1	1	1855	1859	-4	2140	2145	-5	DL	947	N339NW	LGA	ATL	135	762	18	59	2013-01-01 23:00:00
2013	1	1	1855	1848	7	2203	2200	3	UA	1128	N36207	LGA	IAH	231	1416	18	48	2013-01-01 23:00:00
2013	1	1	1856	1645	131	2212	2005	127	AA	181	N323AA	JFK	LAX	336	2475	16	45	2013-01-01 21:00:00
2013	1	1	1856	1859	-3	2133	2155	-22	B6	155	N505JB	JFK	MCO	133	944	18	59	2013-01-01 23:00:00
2013	1	1	1856	1855	1	2142	2142	0	DL	951	N173DZ	JFK	ATL	132	760	18	55	2013-01-01 23:00:00
2013	1	1	1858	1900	-2	2034	2035	-1	WN	2944	N905WN	LGA	MKE	131	738	19	0	2013-01-02 00:00:00
2013	1	1	1859	1900	-1	2012	2021	-9	EV	4131	N11544	EWR	RIC	55	277	19	0	2013-01-02 00:00:00
2013	1	1	1859	1900	-1	2151	2238	-47	DL	1967	N329NW	JFK	MIA	150	1089	19	0	2013-01-02 00:00:00
2013	1	1	1900	1845	15	2212	2227	-15	B6	91	N523JB	JFK	OAK	330	2576	18	45	2013-01-01 23:00:00
2013	1	1	1904	1905	-1	2139	2227	-48	DL	2159	N3758Y	JFK	MCO	133	944	19	5	2013-01-02 00:00:00
2013	1	1	1904	1905	-1	2157	2208	-11	UA	1444	N14242	EWR	TPA	150	997	19	5	2013-01-02 00:00:00
2013	1	1	1905	1900	5	2311	2301	10	DL	853	N727TW	JFK	SFO	361	2586	19	0	2013-01-02 00:00:00
2013	1	1	1906	1915	-9	2211	2244	-33	DL	2391	N922DL	JFK	TPA	159	1005	19	15	2013-01-02 00:00:00
2013	1	1	1909	1912	-3	2239	2237	2	B6	87	N559JB	JFK	SLC	291	1990	19	12	2013-01-02 00:00:00
2013	1	1	1909	1910	-1	2212	2224	-12	DL	1629	N6710E	JFK	LAS	323	2248	19	10	2013-01-02 00:00:00
2013	1	1	1910	1909	1	2126	2046	40	EV	3807	N13978	EWR	BNA	159	748	19	9	2013-01-02 00:00:00
2013	1	1	1910	1910	0	2126	2107	19	9E	3359	N925XJ	JFK	ORD	141	740	19	10	2013-01-02 00:00:00
2013	1	1	1910	1855	15	2118	2103	15	US	1491	N540UW	LGA	CLT	107	544	18	55	2013-01-01 23:00:00
2013	1	1	1911	1910	1	2050	2055	-5	MQ	4569	N737MQ	LGA	RDU	81	431	19	10	2013-01-02 00:00:00
2013	1	1	1912	1915	-3	2200	2219	-19	DL	1485	N917DL	LGA	MCO	142	950	19	15	2013-01-02 00:00:00
2013	1	1	1912	1908	4	2242	2257	-15	UA	927	N432UA	EWR	PHX	309	2133	19	8	2013-01-02 00:00:00
2013	1	1	1915	1920	-5	2238	2257	-19	DL	6	N633DL	JFK	SLC	281	1990	19	20	2013-01-02 00:00:00
2013	1	1	1915	1904	11	2242	2246	-4	UA	1606	N76503	EWR	SFO	351	2565	19	4	2013-01-02 00:00:00
2013	1	1	1916	1920	-4	2053	2100	-7	AA	359	N3CUAA	LGA	ORD	136	733	19	20	2013-01-02 00:00:00
2013	1	1	1919	1900	19	2125	2107	18	EV	3267	N14558	EWR	CLT	105	529	19	0	2013-01-02 00:00:00
2013	1	1	1921	1920	1	2315	2319	-4	DL	541	N375DA	JFK	PHX	314	2153	19	20	2013-01-02 00:00:00
2013	1	1	1923	1837	46	2139	2045	54	EV	4125	N23139	EWR	GRR	116	605	18	37	2013-01-01 23:00:00
2013	1	1	1923	1859	24	2239	2234	5	B6	171	N552JB	JFK	SMF	333	2521	18	59	2013-01-01 23:00:00
2013	1	1	1925	1930	-5	2037	2050	-13	EV	5742	N833AS	LGA	IAD	52	229	19	30	2013-01-02 00:00:00
2013	1	1	1925	1900	25	2259	2238	21	DL	87	N624AG	JFK	LAX	332	2475	19	0	2013-01-02 00:00:00
2013	1	1	1926	1910	16	2258	2215	43	AA	2075	N4XFAA	EWR	DFW	248	1372	19	10	2013-01-02 00:00:00
2013	1	1	1928	1930	-2	2117	2135	-18	9E	4261	N8611A	JFK	RDU	75	427	19	30	2013-01-02 00:00:00
2013	1	1	1929	1920	9	3	7	-4	UA	1071	N27205	EWR	BQN	192	1585	19	20	2013-01-02 00:00:00
2013	1	1	1930	1745	105	2233	2112	81	DL	503	N3764D	JFK	SAN	333	2446	17	45	2013-01-01 22:00:00
2013	1	1	1934	1725	129	2126	1855	151	MQ	4255	N909MQ	JFK	BNA	154	765	17	25	2013-01-01 22:00:00
2013	1	1	1935	1930	5	2223	2143	40	EV	4085	N12157	EWR	OMA	209	1134	19	30	2013-01-02 00:00:00
2013	1	1	1937	1905	32	2250	2225	25	AA	21	N327AA	JFK	LAX	332	2475	19	5	2013-01-02 00:00:00
2013	1	1	1938	1703	155	2109	1823	166	EV	4300	N18557	EWR	RIC	68	277	17	3	2013-01-01 22:00:00
2013	1	1	1939	1840	59	29	2151	\N	9E	3325	N905XJ	JFK	DFW	\N	1391	18	40	2013-01-01 23:00:00
2013	1	1	1939	1940	-1	2238	2240	-2	AA	1787	N3EGAA	JFK	TPA	158	1005	19	40	2013-01-02 00:00:00
2013	1	1	1940	1905	35	2033	2021	12	UA	698	N580UA	EWR	BOS	36	200	19	5	2013-01-02 00:00:00
2013	1	1	1941	1940	1	2231	2241	-10	B6	381	N632JB	LGA	FLL	152	1076	19	40	2013-01-02 00:00:00
2013	1	1	1942	1705	157	2124	1830	174	MQ	4410	N835MQ	JFK	DCA	60	213	17	5	2013-01-01 22:00:00
2013	1	1	1945	1940	5	2247	2231	16	9E	3361	N913XJ	JFK	JAX	129	828	19	40	2013-01-02 00:00:00
2013	1	1	1946	1930	16	2148	2134	14	EV	4532	N34110	EWR	CHS	106	628	19	30	2013-01-02 00:00:00
2013	1	1	1949	1859	50	2237	2153	44	B6	711	N640JB	JFK	LAS	309	2248	18	59	2013-01-01 23:00:00
2013	1	1	1952	1930	22	2358	2207	\N	EV	4333	N11194	EWR	TUL	\N	1215	19	30	2013-01-02 00:00:00
2013	1	1	1952	2000	-8	2314	2325	-11	VX	415	N640VA	JFK	LAX	349	2475	20	0	2013-01-02 01:00:00
2013	1	1	1952	1930	22	2257	2251	6	UA	1416	N76523	EWR	SEA	342	2402	19	30	2013-01-02 00:00:00
2013	1	1	1955	2000	-5	2145	2151	-6	9E	3409	N920XJ	JFK	PIT	76	340	20	0	2013-01-02 01:00:00
2013	1	1	1957	2005	-8	2100	2126	-26	9E	4091	N8598B	JFK	BWI	41	184	20	5	2013-01-02 01:00:00
2013	1	1	1957	1945	12	2307	2329	-22	B6	645	N652JB	JFK	SFO	337	2586	19	45	2013-01-02 00:00:00
2013	1	1	1957	2000	-3	2321	2310	11	UA	299	N817UA	EWR	DFW	233	1372	20	0	2013-01-02 01:00:00
2013	1	1	1959	1930	29	2331	2306	25	DL	1181	N319NB	JFK	SAT	251	1587	19	30	2013-01-02 00:00:00
2013	1	1	1959	2000	-1	2310	2307	3	UA	1233	N76514	EWR	IAH	232	1400	20	0	2013-01-02 01:00:00
2013	1	1	2000	1930	30	2255	2140	75	EV	4361	N12567	EWR	TYS	138	631	19	30	2013-01-02 00:00:00
2013	1	1	2000	2000	0	2054	2110	-16	9E	3664	N836AY	JFK	PHL	30	94	20	0	2013-01-02 01:00:00
2013	1	1	2002	1955	7	2306	2310	-4	AA	1709	N3GSAA	LGA	MIA	159	1096	19	55	2013-01-02 00:00:00
2013	1	1	2003	2000	3	2302	2311	-9	UA	1680	N11206	EWR	MIA	154	1085	20	0	2013-01-02 01:00:00
2013	1	1	2006	1630	216	2230	1848	222	EV	4644	N14972	EWR	SAV	121	708	16	30	2013-01-01 21:00:00
2013	1	1	2006	2000	6	2132	2130	2	UA	1271	N12218	LGA	ORD	126	733	20	0	2013-01-02 01:00:00
2013	1	1	2008	1855	73	2223	2100	83	MQ	4649	N527MQ	LGA	MSP	163	1020	18	55	2013-01-01 23:00:00
2013	1	1	2008	2015	-7	2206	2210	-4	MQ	4555	N734MQ	LGA	CMH	91	479	20	15	2013-01-02 01:00:00
2013	1	1	2009	1808	121	2145	1942	123	EV	4440	N14143	EWR	PIT	65	319	18	8	2013-01-01 23:00:00
2013	1	1	2012	2016	-4	2154	2158	-4	UA	1204	N24715	EWR	CLE	77	404	20	16	2013-01-02 01:00:00
2013	1	1	2013	2015	-2	2120	2130	-10	AA	1762	N3BNAA	JFK	BOS	35	187	20	15	2013-01-02 01:00:00
2013	1	1	2015	2005	10	2149	2144	5	9E	3320	N931XJ	JFK	BUF	62	301	20	5	2013-01-02 01:00:00
2013	1	1	2016	1930	46	\N	2220	\N	EV	4204	N14168	EWR	OKC	\N	1325	19	30	2013-01-02 00:00:00
2013	1	1	2016	1940	36	2215	2125	50	MQ	3783	N509MQ	JFK	CMH	99	483	19	40	2013-01-02 00:00:00
2013	1	1	2017	1935	42	2223	2136	47	9E	3899	N8444F	JFK	CLE	91	425	19	35	2013-01-02 00:00:00
2013	1	1	2017	2015	2	2318	2321	-3	B6	47	N593JB	JFK	FLL	149	1069	20	15	2013-01-02 01:00:00
2013	1	1	2018	2020	-2	2314	2324	-10	UA	1299	N13718	EWR	RSW	157	1068	20	20	2013-01-02 01:00:00
2013	1	1	2020	2030	-10	2148	2155	-7	FL	354	N895AT	LGA	CAK	73	397	20	30	2013-01-02 01:00:00
2013	1	1	2021	2025	-4	2351	2341	10	B6	1069	N203JB	JFK	AUS	255	1521	20	25	2013-01-02 01:00:00
2013	1	1	2023	1945	38	2240	2206	34	9E	3352	N602LR	JFK	CVG	118	589	19	45	2013-01-02 00:00:00
2013	1	1	2024	1835	109	2328	2157	91	B6	359	N607JB	JFK	BUR	328	2465	18	35	2013-01-01 23:00:00
2013	1	1	2025	2030	-5	2334	2348	-14	DL	1318	N3740C	JFK	FLL	157	1069	20	30	2013-01-02 01:00:00
2013	1	1	2025	2028	-3	2358	2351	7	UA	1615	N76516	EWR	AUS	248	1504	20	28	2013-01-02 01:00:00
2013	1	1	2026	2004	22	2157	2133	24	EV	4224	N11189	EWR	MKE	130	725	20	4	2013-01-02 01:00:00
2013	1	1	2026	1930	56	2319	2229	50	B6	39	N558JB	JFK	PBI	150	1028	19	30	2013-01-02 00:00:00
2013	1	1	2026	1955	31	2205	2120	45	WN	195	N957WN	EWR	MDW	134	711	19	55	2013-01-02 00:00:00
2013	1	1	2030	2030	0	2132	2139	-7	EV	4660	N14203	EWR	MHT	33	209	20	30	2013-01-02 01:00:00
2013	1	1	2030	2045	-15	2150	2225	-35	AA	371	N545AA	LGA	ORD	126	733	20	45	2013-01-02 01:00:00
2013	1	1	2030	2035	-5	2354	2342	12	B6	629	N192JB	JFK	HOU	245	1428	20	35	2013-01-02 01:00:00
2013	1	1	2030	2030	0	2308	2258	10	B6	115	N267JB	JFK	MSY	195	1182	20	30	2013-01-02 01:00:00
2013	1	1	2031	2030	1	2344	2335	9	UA	834	N822UA	EWR	IAH	223	1400	20	30	2013-01-02 01:00:00
2013	1	1	2033	2034	-1	2134	2151	-17	UA	994	N486UA	EWR	BOS	35	200	20	34	2013-01-02 01:00:00
2013	1	1	2035	2030	5	2337	5	-28	UA	1482	N38268	EWR	LAX	333	2454	20	30	2013-01-02 01:00:00
2013	1	1	2037	2010	27	2224	2150	34	EV	4356	N15572	EWR	RDU	78	416	20	10	2013-01-02 01:00:00
2013	1	1	2040	2040	0	2317	2314	3	B6	619	N184JB	JFK	JAX	131	828	20	40	2013-01-02 01:00:00
2013	1	1	2046	2035	11	2144	2213	-29	9E	3357	N916XJ	JFK	DCA	43	213	20	35	2013-01-02 01:00:00
2013	1	1	2046	2050	-4	2328	2356	-28	UA	926	N414UA	EWR	MCO	136	937	20	50	2013-01-02 01:00:00
2013	1	1	2050	1959	51	2229	2144	45	MQ	4423	N853MQ	JFK	RDU	83	427	19	59	2013-01-02 00:00:00
2013	1	1	2052	2029	23	2349	2350	-1	B6	165	N536JB	JFK	PDX	331	2454	20	29	2013-01-02 01:00:00
2013	1	1	2052	2045	7	2357	2359	-2	B6	147	N535JB	JFK	RSW	163	1074	20	45	2013-01-02 01:00:00
2013	1	1	2053	2055	-2	2254	2250	4	MQ	4573	N730MQ	LGA	DTW	102	502	20	55	2013-01-02 01:00:00
2013	1	1	2055	2100	-5	2350	2355	-5	UA	380	N441UA	EWR	PBI	142	1023	21	0	2013-01-02 02:00:00
2013	1	1	2056	2004	52	2156	2112	44	EV	4170	N12540	EWR	ALB	31	143	20	4	2013-01-02 01:00:00
2013	1	1	2056	1944	72	2210	2109	61	EV	4692	N11536	EWR	IAD	51	212	19	44	2013-01-02 00:00:00
2013	1	1	2056	2100	-4	2337	2343	-6	B6	399	N510JB	LGA	MCO	140	950	21	0	2013-01-02 02:00:00
2013	1	1	2056	2100	-4	2240	2235	5	MQ	4507	N856MQ	LGA	RDU	77	431	21	0	2013-01-02 02:00:00
2013	1	1	2057	2100	-3	2237	2220	17	MQ	3744	N521MQ	EWR	ORD	133	719	21	0	2013-01-02 02:00:00
2013	1	1	2058	2100	-2	2342	2317	25	EV	4088	N14953	EWR	SDF	136	642	21	0	2013-01-02 02:00:00
2013	1	1	2058	2100	-2	2235	2230	5	WN	946	N509SW	LGA	MDW	134	725	21	0	2013-01-02 02:00:00
2013	1	1	2058	2100	-2	8	2359	9	UA	1241	N27724	EWR	TPA	159	997	21	0	2013-01-02 02:00:00
2013	1	1	2100	2100	0	2307	2250	17	MQ	4584	N0EGMQ	LGA	CLT	101	544	21	0	2013-01-02 02:00:00
2013	1	1	2101	2050	11	2156	2202	-6	B6	1020	N587JB	JFK	BOS	34	187	20	50	2013-01-02 01:00:00
2013	1	1	2102	2108	-6	146	158	-12	UA	1180	N78511	EWR	SJU	199	1608	21	8	2013-01-02 02:00:00
2013	1	1	2103	2110	-7	2345	17	-32	DL	1668	N3738B	JFK	LAS	309	2248	21	10	2013-01-02 02:00:00
2013	1	1	2107	2040	27	2354	2359	-5	B6	677	N779JB	JFK	LAX	323	2475	20	40	2013-01-02 01:00:00
2013	1	1	2108	2057	11	25	39	-14	UA	1517	N17245	EWR	SFO	354	2565	20	57	2013-01-02 01:00:00
2013	1	1	2109	2115	-6	2351	2357	-6	B6	529	N796JB	EWR	MCO	138	937	21	15	2013-01-02 02:00:00
2013	1	1	2110	2020	50	2340	2245	55	MQ	4662	N532MQ	LGA	ATL	127	762	20	20	2013-01-02 01:00:00
2013	1	1	2115	2110	5	2240	2223	17	EV	4119	N15986	EWR	RIC	65	277	21	10	2013-01-02 02:00:00
2013	1	1	2115	1700	255	2330	1920	250	9E	3347	N924XJ	JFK	CVG	115	589	17	0	2013-01-01 22:00:00
2013	1	1	2116	2110	6	2202	2212	-10	EV	4404	N15912	EWR	PVD	28	160	21	10	2013-01-02 02:00:00
2013	1	1	2119	1930	109	2358	2136	142	EV	4543	N13123	EWR	DSM	200	1017	19	30	2013-01-02 00:00:00
2013	1	1	2120	2130	-10	16	18	-2	B6	383	N603JB	LGA	FLL	160	1076	21	30	2013-01-02 02:00:00
2013	1	1	2121	2040	41	6	2323	43	B6	227	N307JB	EWR	MCO	143	937	20	40	2013-01-02 01:00:00
2013	1	1	2122	2125	-3	2312	2250	22	MQ	4660	N1EAMQ	LGA	BNA	153	764	21	25	2013-01-02 02:00:00
2013	1	1	2128	2135	-7	26	50	-24	AA	185	N338AA	JFK	LAX	338	2475	21	35	2013-01-02 02:00:00
2013	1	1	2128	2125	3	2243	2240	3	MQ	4449	N810MQ	JFK	DCA	54	213	21	25	2013-01-02 02:00:00
2013	1	1	2129	2120	9	2342	2351	-9	B6	97	N625JB	JFK	DEN	223	1626	21	20	2013-01-02 02:00:00
2013	1	1	2134	2045	49	20	2352	28	UA	1106	N27733	EWR	FLL	152	1065	20	45	2013-01-02 01:00:00
2013	1	1	2136	2145	-9	25	39	-14	B6	515	N198JB	EWR	FLL	154	1065	21	45	2013-01-02 02:00:00
2013	1	1	2140	2135	5	210	224	-14	B6	701	N284JB	JFK	SJU	189	1598	21	35	2013-01-02 02:00:00
2013	1	1	2157	2155	2	43	41	2	B6	43	N537JB	JFK	MCO	140	944	21	55	2013-01-02 02:00:00
2013	1	1	2158	2200	-2	2254	2307	-13	EV	4103	N14998	EWR	BWI	36	169	22	0	2013-01-02 03:00:00
2013	1	1	2205	1720	285	46	2040	246	AA	1999	N5DNAA	EWR	MIA	146	1085	17	20	2013-01-01 22:00:00
2013	1	1	2209	2145	24	58	37	21	B6	35	N608JB	JFK	PBI	143	1028	21	45	2013-01-02 02:00:00
2013	1	1	2209	2155	14	2400	2337	23	B6	1109	N216JB	JFK	RDU	86	427	21	55	2013-01-02 02:00:00
2013	1	1	2211	2145	26	2339	2311	28	B6	104	N228JB	JFK	BUF	64	301	21	45	2013-01-02 02:00:00
2013	1	1	2217	2229	-12	249	315	-26	B6	713	N547JB	JFK	SJU	191	1598	22	29	2013-01-02 03:00:00
2013	1	1	2217	2130	47	140	27	73	B6	21	N516JB	JFK	TPA	163	1005	21	30	2013-01-02 02:00:00
2013	1	1	2221	2000	141	2331	2124	127	EV	4462	N13566	EWR	BUF	56	282	20	0	2013-01-02 01:00:00
2013	1	1	2224	2200	24	2324	2316	8	EV	4206	N16561	EWR	PWM	47	284	22	0	2013-01-02 03:00:00
2013	1	1	2229	2159	30	149	100	49	B6	11	N531JB	JFK	FLL	153	1069	21	59	2013-01-02 02:00:00
2013	1	1	2240	2245	-5	2340	2356	-16	B6	608	N279JB	JFK	PWM	44	273	22	45	2013-01-02 03:00:00
2013	1	1	2250	2255	-5	2352	2359	-7	B6	1018	N521JB	JFK	BOS	37	187	22	55	2013-01-02 03:00:00
2013	1	1	2302	2200	62	2342	2253	49	EV	4276	N13903	EWR	BDL	24	116	22	0	2013-01-02 03:00:00
2013	1	1	2306	2245	21	28	5	23	B6	30	N281JB	JFK	ROC	59	264	22	45	2013-01-02 03:00:00
2013	1	1	2307	2245	22	32	2357	35	B6	128	N178JB	JFK	BTV	59	266	22	45	2013-01-02 03:00:00
2013	1	1	2310	2255	15	24	15	9	B6	112	N646JB	JFK	BUF	57	301	22	55	2013-01-02 03:00:00
2013	1	1	2312	2000	192	21	2110	191	EV	4312	N13958	EWR	DCA	44	199	20	0	2013-01-02 01:00:00
2013	1	1	2323	2200	83	22	2313	69	EV	4257	N13538	EWR	BTV	44	266	22	0	2013-01-02 03:00:00
2013	1	1	2326	2130	116	131	18	73	B6	199	N594JB	JFK	LAS	290	2248	21	30	2013-01-02 02:00:00
2013	1	1	2327	2250	37	32	2359	33	B6	22	N639JB	JFK	SYR	45	209	22	50	2013-01-02 03:00:00
2013	1	1	2343	1724	379	314	1938	456	EV	4321	N21197	EWR	MCI	222	1092	17	24	2013-01-01 22:00:00
2013	1	1	2353	2359	-6	425	445	-20	B6	739	N591JB	JFK	PSE	195	1617	23	59	2013-01-02 04:00:00
2013	1	1	2353	2359	-6	418	442	-24	B6	707	N794JB	JFK	SJU	185	1598	23	59	2013-01-02 04:00:00
2013	1	1	2356	2359	-3	425	437	-12	B6	727	N588JB	JFK	BQN	186	1576	23	59	2013-01-02 04:00:00
2013	1	1	\N	1630	\N	\N	1815	\N	EV	4308	N18120	EWR	RDU	\N	416	16	30	2013-01-01 21:00:00
2013	1	1	\N	1935	\N	\N	2240	\N	AA	791	N3EHAA	LGA	DFW	\N	1389	19	35	2013-01-02 00:00:00
2013	1	1	\N	1500	\N	\N	1825	\N	AA	1925	N3EVAA	LGA	MIA	\N	1096	15	0	2013-01-01 20:00:00
2013	1	1	\N	600	\N	\N	901	\N	B6	125	N618JB	JFK	FLL	\N	1069	6	0	2013-01-01 11:00:00
2013	1	2	42	2359	43	518	442	36	B6	707	N580JB	JFK	SJU	189	1598	23	59	2013-01-03 04:00:00
2013	1	2	126	2250	156	233	2359	154	B6	22	N636JB	JFK	SYR	49	209	22	50	2013-01-03 03:00:00
2013	1	2	458	500	-2	703	650	13	US	1030	N162UW	EWR	CLT	108	529	5	0	2013-01-02 10:00:00
2013	1	2	512	515	-3	809	819	-10	UA	1453	N76515	EWR	IAH	214	1400	5	15	2013-01-02 10:00:00
2013	1	2	535	540	-5	831	850	-19	AA	1141	N621AA	JFK	MIA	156	1089	5	40	2013-01-02 10:00:00
2013	1	2	536	529	7	840	828	12	UA	407	N493UA	LGA	IAH	231	1416	5	29	2013-01-02 10:00:00
2013	1	2	539	545	-6	959	1022	-23	B6	725	N624JB	JFK	BQN	184	1576	5	45	2013-01-02 10:00:00
2013	1	2	554	600	-6	845	901	-16	B6	125	N637JB	JFK	FLL	156	1069	6	0	2013-01-02 11:00:00
2013	1	2	554	600	-6	841	851	-10	B6	49	N658JB	JFK	PBI	146	1028	6	0	2013-01-02 11:00:00
2013	1	2	554	600	-6	909	858	11	B6	371	N805JB	LGA	FLL	159	1076	6	0	2013-01-02 11:00:00
2013	1	2	555	600	-5	931	910	21	AA	707	N3BEAA	LGA	DFW	255	1389	6	0	2013-01-02 11:00:00
2013	1	2	555	600	-5	856	856	0	B6	71	N806JB	JFK	TPA	158	1005	6	0	2013-01-02 11:00:00
2013	1	2	555	600	-5	750	757	-7	DL	731	N366NB	LGA	DTW	87	502	6	0	2013-01-02 11:00:00
2013	1	2	556	600	-4	724	723	1	EV	5708	N836AS	LGA	IAD	54	229	6	0	2013-01-02 11:00:00
2013	1	2	556	600	-4	837	837	0	DL	461	N618DL	LGA	ATL	128	762	6	0	2013-01-02 11:00:00
2013	1	2	557	605	-8	832	823	9	DL	544	N325US	LGA	CVG	117	585	6	5	2013-01-02 11:00:00
2013	1	2	558	600	-2	838	815	23	FL	345	N896AT	LGA	ATL	129	762	6	0	2013-01-02 11:00:00
2013	1	2	558	600	-2	916	931	-15	UA	303	N505UA	JFK	SFO	341	2586	6	0	2013-01-02 11:00:00
2013	1	2	559	601	-2	809	901	-52	UA	402	N484UA	EWR	LAS	289	2227	6	1	2013-01-02 11:00:00
2013	1	2	559	600	-1	906	907	-1	UA	1077	N12225	EWR	MIA	157	1085	6	0	2013-01-02 11:00:00
2013	1	2	600	600	0	814	749	25	EV	4334	N13914	EWR	CMH	98	463	6	0	2013-01-02 11:00:00
2013	1	2	600	605	-5	751	818	-27	EV	5147	N760EV	EWR	MSP	155	1008	6	5	2013-01-02 11:00:00
2013	1	2	600	600	0	819	815	4	9E	4171	N8946A	EWR	CVG	120	569	6	0	2013-01-02 11:00:00
2013	1	2	600	600	0	846	846	0	B6	79	N529JB	JFK	MCO	140	944	6	0	2013-01-02 11:00:00
2013	1	2	600	600	0	737	725	12	WN	3136	N8311Q	LGA	MDW	117	725	6	0	2013-01-02 11:00:00
2013	1	2	600	605	-5	748	805	-17	MQ	4401	N713MQ	LGA	DTW	82	502	6	5	2013-01-02 11:00:00
2013	1	2	600	600	0	747	735	12	UA	1280	N62631	LGA	ORD	125	733	6	0	2013-01-02 11:00:00
2013	1	2	602	600	2	646	659	-13	US	1833	N951UW	LGA	PHL	28	96	6	0	2013-01-02 11:00:00
2013	1	2	603	600	3	733	745	-12	AA	301	N3CRAA	LGA	ORD	118	733	6	0	2013-01-02 11:00:00
2013	1	2	603	559	4	912	916	-4	UA	1676	N17229	EWR	LAX	341	2454	5	59	2013-01-02 10:00:00
2013	1	2	605	600	5	851	935	-44	UA	421	N832UA	EWR	SFO	329	2565	6	0	2013-01-02 11:00:00
2013	1	2	606	610	-4	846	845	1	DL	1743	N387DA	JFK	ATL	129	760	6	10	2013-01-02 11:00:00
2013	1	2	606	610	-4	825	820	5	DL	1919	N915DE	LGA	MSP	167	1020	6	10	2013-01-02 11:00:00
2013	1	2	607	610	-3	859	910	-11	AA	1895	N5ELAA	EWR	MIA	151	1085	6	10	2013-01-02 11:00:00
2013	1	2	609	600	9	909	854	15	B6	507	N630JB	EWR	FLL	158	1065	6	0	2013-01-02 11:00:00
2013	1	2	610	600	10	826	807	19	EV	5310	N740EV	LGA	MEM	172	963	6	0	2013-01-02 11:00:00
2013	1	2	610	615	-5	854	844	10	DL	575	N304DQ	EWR	ATL	124	746	6	15	2013-01-02 11:00:00
2013	1	2	611	600	11	756	725	31	WN	1563	N235WN	EWR	MDW	139	711	6	0	2013-01-02 11:00:00
2013	1	2	612	600	12	901	850	11	B6	343	N579JB	EWR	PBI	146	1023	6	0	2013-01-02 11:00:00
2013	1	2	612	615	-3	1053	1100	-7	B6	709	N629JB	JFK	SJU	191	1598	6	15	2013-01-02 11:00:00
2013	1	2	616	600	16	1001	917	44	UA	1141	N19141	JFK	LAX	354	2475	6	0	2013-01-02 11:00:00
2013	1	2	617	615	2	837	817	20	US	1567	N745VJ	JFK	CLT	106	541	6	15	2013-01-02 11:00:00
2013	1	2	621	610	11	912	915	-3	AA	1837	N3EVAA	LGA	MIA	155	1096	6	10	2013-01-02 11:00:00
2013	1	2	622	630	-8	820	830	-10	MQ	4599	N6EAMQ	LGA	MSP	159	1020	6	30	2013-01-02 11:00:00
2013	1	2	624	600	24	908	825	43	MQ	4650	N513MQ	LGA	ATL	138	762	6	0	2013-01-02 11:00:00
2013	1	2	625	630	-5	833	830	3	MQ	4576	N504MQ	LGA	CLT	106	544	6	30	2013-01-02 11:00:00
2013	1	2	625	629	-4	935	934	1	UA	473	N461UA	LGA	IAH	230	1416	6	29	2013-01-02 11:00:00
2013	1	2	625	630	-5	954	946	8	UA	516	N802UA	EWR	DFW	249	1372	6	30	2013-01-02 11:00:00
2013	1	2	626	630	-4	850	833	17	US	1019	N445US	EWR	CLT	103	529	6	30	2013-01-02 11:00:00
2013	1	2	628	630	-2	935	932	3	DL	2137	N912DE	LGA	TPA	159	1010	6	30	2013-01-02 11:00:00
2013	1	2	628	615	13	730	715	15	WN	3641	N961WN	EWR	BWI	42	169	6	15	2013-01-02 11:00:00
2013	1	2	629	615	14	746	735	11	EV	4144	N15574	EWR	IAD	51	212	6	15	2013-01-02 11:00:00
2013	1	2	629	620	9	844	827	17	EV	4460	N11565	EWR	CVG	118	569	6	20	2013-01-02 11:00:00
2013	1	2	629	630	-1	1010	1014	-4	US	245	N837AW	EWR	PHX	308	2133	6	30	2013-01-02 11:00:00
2013	1	2	630	610	20	948	921	27	B6	135	N665JB	JFK	RSW	177	1074	6	10	2013-01-02 11:00:00
2013	1	2	630	635	-5	948	942	6	DL	1879	N969DL	LGA	FLL	166	1076	6	35	2013-01-02 11:00:00
2013	1	2	630	630	0	727	740	-13	WN	4648	N7735A	LGA	BWI	42	185	6	30	2013-01-02 11:00:00
2013	1	2	632	635	-3	812	812	0	EV	4150	N16987	EWR	RDU	82	416	6	35	2013-01-02 11:00:00
2013	1	2	632	630	2	941	940	1	UA	387	N521UA	EWR	LAX	325	2454	6	30	2013-01-02 11:00:00
2013	1	2	634	630	4	806	810	-4	AA	303	N3DYAA	LGA	ORD	123	733	6	30	2013-01-02 11:00:00
2013	1	2	636	637	-1	1012	955	17	UA	1276	N38727	EWR	AUS	248	1504	6	37	2013-01-02 11:00:00
2013	1	2	636	631	5	1005	1014	-9	UA	908	N406UA	EWR	PHX	299	2133	6	31	2013-01-02 11:00:00
2013	1	2	637	640	-3	832	809	23	EV	3829	N17108	EWR	BNA	138	748	6	40	2013-01-02 11:00:00
2013	1	2	637	630	7	1012	1018	-6	US	27	N545UW	JFK	PHX	312	2153	6	30	2013-01-02 11:00:00
2013	1	2	637	631	6	821	815	6	UA	1162	N39297	EWR	CLE	79	404	6	31	2013-01-02 11:00:00
2013	1	2	640	640	0	732	749	-17	B6	1002	N807JB	JFK	BOS	34	187	6	40	2013-01-02 11:00:00
2013	1	2	640	646	-6	926	941	-15	UA	1627	N37267	EWR	PBI	145	1023	6	46	2013-01-02 11:00:00
2013	1	2	641	635	6	926	917	9	EV	3831	N12996	EWR	ATL	138	746	6	35	2013-01-02 11:00:00
2013	1	2	641	635	6	1013	940	33	AA	711	N3CFAA	LGA	DFW	249	1389	6	35	2013-01-02 11:00:00
2013	1	2	641	647	-6	804	810	-6	B6	102	N766JB	JFK	BUF	60	301	6	47	2013-01-02 11:00:00
2013	1	2	641	645	-4	930	935	-5	B6	389	N563JB	LGA	MCO	142	950	6	45	2013-01-02 11:00:00
2013	1	2	642	630	12	854	841	13	US	1433	N538UW	LGA	CLT	109	544	6	30	2013-01-02 11:00:00
2013	1	2	647	645	2	849	916	-27	UA	320	N587UA	LGA	DEN	218	1620	6	45	2013-01-02 11:00:00
2013	1	2	647	646	1	738	809	-31	UA	785	N821UA	EWR	BOS	34	200	6	46	2013-01-02 11:00:00
2013	1	2	647	645	2	903	848	15	US	926	N565UW	EWR	CLT	102	529	6	45	2013-01-02 11:00:00
2013	1	2	649	655	-6	951	1030	-39	DL	1415	N374DA	JFK	SLC	274	1990	6	55	2013-01-02 11:00:00
2013	1	2	649	651	-2	934	946	-12	UA	392	N464UA	EWR	MCO	141	937	6	51	2013-01-02 11:00:00
2013	1	2	654	700	-6	946	1045	-59	DL	1865	N711ZX	JFK	SFO	323	2586	7	0	2013-01-02 12:00:00
2013	1	2	654	651	3	1003	955	8	UA	1701	N78285	EWR	FLL	168	1065	6	51	2013-01-02 11:00:00
2013	1	2	655	659	-4	955	959	-4	AA	1815	N5EUAA	JFK	MCO	144	944	6	59	2013-01-02 11:00:00
2013	1	2	655	655	0	929	942	-13	B6	203	N651JB	JFK	LAS	297	2248	6	55	2013-01-02 11:00:00
2013	1	2	655	700	-5	1031	1034	-3	DL	763	N705TW	JFK	LAX	317	2475	7	0	2013-01-02 12:00:00
2013	1	2	655	700	-5	1005	1009	-4	DL	1383	N378NW	LGA	PBI	162	1035	7	0	2013-01-02 12:00:00
2013	1	2	655	700	-5	1015	1020	-5	DL	2003	N926DL	LGA	MIA	161	1096	7	0	2013-01-02 12:00:00
2013	1	2	656	700	-4	1013	1007	6	B6	981	N656JB	JFK	FLL	162	1069	7	0	2013-01-02 12:00:00
2013	1	2	656	705	-9	1014	940	34	MQ	4534	N719MQ	LGA	XNA	233	1147	7	5	2013-01-02 12:00:00
2013	1	2	657	700	-3	806	809	-3	US	2163	N945UW	LGA	DCA	46	214	7	0	2013-01-02 12:00:00
2013	1	2	659	700	-1	959	1025	-26	VX	399	N626VA	JFK	LAX	330	2475	7	0	2013-01-02 12:00:00
2013	1	2	700	630	30	917	840	37	EV	4471	N17984	EWR	CLT	102	529	6	30	2013-01-02 11:00:00
2013	1	2	700	700	0	851	850	1	AA	305	N436AA	LGA	ORD	122	733	7	0	2013-01-02 12:00:00
2013	1	2	700	700	0	1017	1015	2	AA	2279	N3JJAA	LGA	MIA	163	1096	7	0	2013-01-02 12:00:00
2013	1	2	701	705	-4	1001	943	18	DL	1445	N339NB	LGA	MSY	193	1183	7	5	2013-01-02 12:00:00
2013	1	2	702	700	2	1054	1008	46	UA	756	N574UA	EWR	TPA	164	997	7	0	2013-01-02 12:00:00
2013	1	2	704	655	9	947	921	26	B6	117	N236JB	JFK	MSY	192	1182	6	55	2013-01-02 11:00:00
2013	1	2	704	705	-1	908	913	-5	DL	831	N974DL	LGA	DTW	90	502	7	5	2013-01-02 12:00:00
2013	1	2	704	700	4	1142	1154	-12	UA	1152	N37456	EWR	SJU	194	1608	7	0	2013-01-02 12:00:00
2013	1	2	705	630	35	1209	1140	29	AA	413	N3GEAA	JFK	SJU	197	1598	6	30	2013-01-02 11:00:00
2013	1	2	705	710	-5	827	850	-23	MQ	3737	N512MQ	EWR	ORD	115	719	7	10	2013-01-02 12:00:00
2013	1	2	707	715	-8	1022	1045	-23	AA	443	N3HYAA	JFK	MIA	160	1089	7	15	2013-01-02 12:00:00
2013	1	2	709	700	9	1006	1014	-8	B6	671	N583JB	JFK	LAX	327	2475	7	0	2013-01-02 12:00:00
2013	1	2	712	700	12	945	941	4	DL	1547	N541US	LGA	ATL	125	762	7	0	2013-01-02 12:00:00
2013	1	2	712	700	12	844	832	12	UA	1223	N76254	LGA	ORD	127	733	7	0	2013-01-02 12:00:00
2013	1	2	714	715	-1	1026	1035	-9	AA	825	N3BAAA	JFK	FLL	161	1069	7	15	2013-01-02 12:00:00
2013	1	2	715	721	-6	1013	1012	1	B6	987	N625JB	JFK	MCO	144	944	7	21	2013-01-02 12:00:00
2013	1	2	715	715	0	1047	1112	-25	UA	223	N517UA	JFK	SFO	341	2586	7	15	2013-01-02 12:00:00
2013	1	2	719	720	-1	1027	1029	-2	UA	1526	N33284	EWR	RSW	168	1068	7	20	2013-01-02 12:00:00
2013	1	2	720	600	80	905	735	90	MQ	3768	N520MQ	EWR	ORD	112	719	6	0	2013-01-02 11:00:00
2013	1	2	722	725	-3	949	1030	-41	AS	11	N592AS	EWR	SEA	314	2402	7	25	2013-01-02 12:00:00
2013	1	2	723	713	10	846	849	-3	UA	393	N529UA	EWR	ORD	114	719	7	13	2013-01-02 12:00:00
2013	1	2	724	730	-6	1039	1115	-36	VX	11	N847VA	JFK	SFO	344	2586	7	30	2013-01-02 12:00:00
2013	1	2	727	645	42	1024	1028	-4	UA	277	N820UA	EWR	SNA	338	2434	6	45	2013-01-02 11:00:00
2013	1	2	728	730	-2	1001	952	9	UA	311	N413UA	EWR	DEN	251	1605	7	30	2013-01-02 12:00:00
2013	1	2	729	720	9	846	840	6	FL	850	N982AT	LGA	MKE	113	738	7	20	2013-01-02 12:00:00
2013	1	2	729	729	0	1047	1039	8	B6	1601	N645JB	LGA	RSW	168	1080	7	29	2013-01-02 12:00:00
2013	1	2	729	730	-1	1011	1056	-45	DL	495	N3768	JFK	SEA	309	2422	7	30	2013-01-02 12:00:00
2013	1	2	730	715	15	1206	1206	0	B6	715	N559JB	JFK	SJU	187	1598	7	15	2013-01-02 12:00:00
2013	1	2	732	730	2	1105	1100	5	AA	33	N322AA	JFK	LAX	351	2475	7	30	2013-01-02 12:00:00
2013	1	2	732	736	-4	914	850	24	B6	44	N506JB	JFK	SYR	50	209	7	36	2013-01-02 12:00:00
2013	1	2	732	732	0	1047	1040	7	UA	1509	N73291	LGA	IAH	230	1416	7	32	2013-01-02 12:00:00
2013	1	2	733	735	-2	902	858	4	B6	20	N337JB	JFK	ROC	57	264	7	35	2013-01-02 12:00:00
2013	1	2	733	737	-4	1043	1113	-30	B6	643	N804JB	JFK	SFO	335	2586	7	37	2013-01-02 12:00:00
2013	1	2	734	700	34	1045	1025	20	WN	20	N485WN	EWR	HOU	235	1411	7	0	2013-01-02 12:00:00
2013	1	2	734	732	2	844	853	-9	UA	1199	N37408	EWR	BOS	34	200	7	32	2013-01-02 12:00:00
2013	1	2	737	745	-8	1042	1036	6	B6	983	N504JB	LGA	TPA	162	1010	7	45	2013-01-02 12:00:00
2013	1	2	738	745	-7	926	930	-4	AA	309	N528AA	LGA	ORD	121	733	7	45	2013-01-02 12:00:00
2013	1	2	739	745	-6	1116	1125	-9	AA	59	N325AA	JFK	SFO	353	2586	7	45	2013-01-02 12:00:00
2013	1	2	739	735	4	1033	1031	2	UA	1296	N19117	EWR	MCO	144	937	7	35	2013-01-02 12:00:00
2013	1	2	740	740	0	1025	1015	10	WN	1581	N468WN	LGA	DEN	263	1620	7	40	2013-01-02 12:00:00
2013	1	2	741	743	-2	932	920	12	EV	4348	N14542	EWR	GSO	94	445	7	43	2013-01-02 12:00:00
2013	1	2	741	740	1	1005	1019	-14	UA	328	N533UA	LGA	DEN	220	1620	7	40	2013-01-02 12:00:00
2013	1	2	743	745	-2	858	857	1	9E	3373	N902XJ	JFK	PHL	30	94	7	45	2013-01-02 12:00:00
2013	1	2	744	730	14	1017	1007	10	DL	807	N989DL	EWR	ATL	128	746	7	30	2013-01-02 12:00:00
2013	1	2	745	730	15	1112	1040	32	AA	715	N455AA	LGA	DFW	244	1389	7	30	2013-01-02 12:00:00
2013	1	2	745	746	-1	1118	1129	-11	UA	1668	N37287	EWR	SFO	350	2565	7	46	2013-01-02 12:00:00
2013	1	2	747	749	-2	1051	1054	-3	B6	341	N508JB	JFK	SRQ	167	1041	7	49	2013-01-02 12:00:00
2013	1	2	750	725	25	1048	1020	28	UA	1724	N79521	EWR	PBI	151	1023	7	25	2013-01-02 12:00:00
2013	1	2	751	800	-9	942	945	-3	9E	3643	N8869B	JFK	PIT	68	340	8	0	2013-01-02 13:00:00
2013	1	2	752	800	-8	956	959	-3	EV	4166	N11536	EWR	GSP	109	594	8	0	2013-01-02 13:00:00
2013	1	2	752	800	-8	912	918	-6	EV	4233	N21130	EWR	BTV	49	266	8	0	2013-01-02 13:00:00
2013	1	2	752	745	7	1055	1042	13	UA	251	N430UA	EWR	IAH	215	1400	7	45	2013-01-02 12:00:00
2013	1	2	754	635	79	900	745	75	EV	4241	N22909	EWR	DCA	46	199	6	35	2013-01-02 11:00:00
2013	1	2	754	755	-1	1055	1059	-4	DL	2263	N361NW	LGA	MCO	143	950	7	55	2013-01-02 12:00:00
2013	1	2	755	800	-5	1100	1054	6	B6	517	N703JB	EWR	MCO	146	937	8	0	2013-01-02 13:00:00
2013	1	2	755	800	-5	1048	1106	-18	B6	3	N509JB	JFK	FLL	155	1069	8	0	2013-01-02 13:00:00
2013	1	2	755	759	-4	1037	1039	-2	DL	2047	N660DL	LGA	ATL	123	762	7	59	2013-01-02 12:00:00
2013	1	2	757	800	-3	1058	1127	-29	DL	1843	N918DL	JFK	MIA	155	1089	8	0	2013-01-02 13:00:00
2013	1	2	757	759	-2	1018	959	19	US	1733	N537UW	LGA	CLT	106	544	7	59	2013-01-02 12:00:00
2013	1	2	758	755	3	1052	1110	-18	AA	2267	N3CNAA	LGA	MIA	160	1096	7	55	2013-01-02 12:00:00
2013	1	2	759	805	-6	901	919	-18	B6	1172	N309JB	EWR	BOS	38	200	8	5	2013-01-02 13:00:00
2013	1	2	800	810	-10	1102	1116	-14	DL	1959	N995DL	JFK	MCO	143	944	8	10	2013-01-02 13:00:00
2013	1	2	801	730	31	1136	1040	56	AA	2083	N487AA	EWR	DFW	241	1372	7	30	2013-01-02 12:00:00
2013	1	2	801	810	-9	951	955	-4	MQ	4406	N837MQ	JFK	RDU	86	427	8	10	2013-01-02 13:00:00
2013	1	2	804	805	-1	1039	1110	-31	UA	423	N528UA	EWR	PDX	310	2434	8	5	2013-01-02 13:00:00
2013	1	2	806	810	-4	1300	1315	-15	AA	655	N5FTAA	JFK	STT	193	1623	8	10	2013-01-02 13:00:00
2013	1	2	807	810	-3	1133	1129	4	DL	1271	N322US	JFK	FLL	170	1069	8	10	2013-01-02 13:00:00
2013	1	2	808	810	-2	1049	1045	4	DL	269	N971DL	JFK	ATL	124	760	8	10	2013-01-02 13:00:00
2013	1	2	808	815	-7	1020	1016	4	US	675	N656AW	EWR	CLT	107	529	8	15	2013-01-02 13:00:00
2013	1	2	809	810	-1	950	948	2	B6	1051	N304JB	JFK	PIT	71	340	8	10	2013-01-02 13:00:00
\.


--
-- Data for Name: planes; Type: TABLE DATA; Schema: odbc; Owner: travis
--

COPY odbc.planes (tailnum, year, type, manufacturer, model, engines, seats, speed, engine) FROM stdin;
N10156	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N102UW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N103US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N104UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N10575	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N105UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N107US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N108UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N109UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N110UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N11106	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11107	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11109	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11113	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11119	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11121	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11127	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11137	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11140	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11150	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11155	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11164	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11165	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11176	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11181	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11184	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11187	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11189	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11191	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11192	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11193	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11194	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11199	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N111US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N11206	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N112US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N113UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N114UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N11535	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11536	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11539	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11544	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11547	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11548	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11551	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11565	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N117UW	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N118US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N119US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N1200K	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1201P	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N12109	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12114	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12116	1996	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12122	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12125	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12126	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12135	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12136	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12142	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12145	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12157	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12160	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12163	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12166	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12167	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12172	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12175	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12195	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N121DE	1987	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N121UW	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N12201	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12216	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12218	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12221	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12225	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12238	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N122US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N123UW	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N124US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N12540	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12552	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12563	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12564	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12567	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12569	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N125UW	2009	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N126UW	2009	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N127UW	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N128UW	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N12900	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12921	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12922	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12924	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12957	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12967	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12996	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13110	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N13113	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N13118	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13123	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13124	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13132	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13133	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13138	1999	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N13161	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N131EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13202	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13248	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N132EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N133EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N134EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13538	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13550	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13553	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13566	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N135EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N136DL	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N136EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13716	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N13718	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N13750	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N137DL	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N137EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N138EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13903	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13908	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13913	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13914	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13949	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13955	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13956	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13958	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13964	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13965	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13968	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13969	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13970	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13975	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13978	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13979	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13988	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13989	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13992	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13994	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13995	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13997	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14102	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14105	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14106	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14107	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14115	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14116	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14117	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14118	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14120	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14121	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14125	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14143	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14148	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14153	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14158	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14162	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14168	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14171	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14173	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14174	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14177	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14179	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14180	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14186	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14188	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14198	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14203	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14204	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14214	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14219	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14228	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14230	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14231	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14237	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14242	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14250	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N143DA	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N14542	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14543	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14558	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14562	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14568	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14570	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14573	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14629	1965	Fixed wing multi engine	BOEING	737-524	2	149	\N	Turbo-fan
N146PQ	2007	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N14704	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N14731	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N147PQ	2007	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N14902	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14904	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14905	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14907	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14916	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14920	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14923	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14950	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14952	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14953	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14959	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14960	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14972	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14974	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14977	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14991	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14993	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14998	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N1501P	1990	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N150UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N151UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N152DL	1990	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N152UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N153DL	1990	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N153PQ	2007	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N153UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N154DL	1991	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N154UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N15555	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15572	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15574	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N155DL	1991	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N155UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N156DL	1991	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N156UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N15710	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N15712	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N157UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N15910	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15912	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15973	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15980	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15983	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15985	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15986	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N1602	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1603	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1604R	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1605	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N16065	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1607B	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1608	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1609	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1610D	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N16112	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N1611B	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1612T	2001	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1613B	2001	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N16147	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16149	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16151	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16170	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16178	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16183	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N161PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N161UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N16217	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N16234	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N162PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N162UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N163US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N16541	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16546	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16559	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16561	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16571	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N165US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N166PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N16701	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16703	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16709	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16713	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16732	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N167US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N168AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N16911	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16918	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16919	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16951	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16954	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16961	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16963	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16976	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16981	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16987	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16999	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N169AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N169DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N169UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N170PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N170US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17104	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17105	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17108	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17115	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17122	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17126	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17128	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17133	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17138	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17139	2000	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17146	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17159	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17169	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17185	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17196	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N171DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N171DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N171US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17229	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N17233	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N17244	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N17245	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N172DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N172DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N172US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N173AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N173DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N173US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N174AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N174DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N174DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N174US	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17560	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N175AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N175DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N175DZ	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N176AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N176DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N176DZ	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N176PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N176UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17719	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N17730	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N177DN	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N177DZ	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N177US	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N178DN	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N178DZ	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N178JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N178US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17984	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N179DN	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N179JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N179UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N180DN	1992	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N180US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N18101	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N18102	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N18112	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N18114	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N18119	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N18120	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N181DN	1992	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N181PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N181UW	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N18220	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N18223	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N18243	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N182DN	1992	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N182UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N183DN	1993	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N183JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N183UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N184AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N184DN	1993	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N184JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N184US	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N18556	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N18557	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N185DN	1995	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N185UW	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N186DN	1995	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N186PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N186US	2002	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N187DN	1996	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N187JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N187PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N187US	2002	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N188DN	1996	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N188US	2002	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N189DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N189UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N190DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N190JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N190UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N19117	1996	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N19130	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N19136	1999	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N19141	2000	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N191DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N191UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N192DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N192JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N192UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N193DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N193JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N193UW	2008	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N194DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N194UW	\N	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N19554	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N195DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N195PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N195UW	2008	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N196DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N196UW	2009	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N197DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N197JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N197PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N197UW	2009	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N198DN	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N198JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N198UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N19966	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N199DN	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N199UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N200PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N200WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N201AA	1959	Fixed wing single engine	CESSNA	150	1	2	90	Reciprocating
N201FR	2008	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N201LV	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N202AA	1980	Fixed wing multi engine	CESSNA	421C	2	8	90	Reciprocating
N202FR	2008	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N202WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N203FR	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N203JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N203WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N204FR	2004	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N204WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N205FR	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N205WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N206FR	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N206JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N206UA	1999	Fixed wing multi engine	BOEING	777-222	2	400	\N	Turbo-fan
N206WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N207FR	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N207WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N208FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N208WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N20904	2012	Fixed wing multi engine	BOEING	787-8	2	260	\N	Turbo-fan
N209FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N209WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N210FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N210WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N21108	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N21129	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21130	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21144	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21154	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21197	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N211FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N211WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N212WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N213FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N213WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N214FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N214WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N21537	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N215WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N216FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N216JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N216WR	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N21723	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N217JC	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N218FR	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N218WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N219WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N220WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N221FR	2007	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N221WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N222WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N223WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N224WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N225WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N226WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N227WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N228JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N228PQ	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N228UA	2002	Fixed wing multi engine	BOEING	777-222	2	400	\N	Turbo-fan
N228WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N22909	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N22971	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N229JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N229WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N230WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N23139	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N231JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N231WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N232PQ	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N232WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N233LV	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N234WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N235WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N236JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N236WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N23707	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N23708	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N23721	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N237WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N238JB	\N	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N238WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N239JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N239WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N240AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N240WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N24103	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N24128	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N241WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N24202	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N24211	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N24212	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N24224	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N242WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N243WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N244WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N245AY	1987	Fixed wing multi engine	BOEING	767-201	2	255	\N	Turbo-jet
N245WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N246LV	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N24702	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N24706	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N24715	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N24729	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N247JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N247WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N248WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N249JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N249WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N250WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N25134	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N251WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N252WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N253WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N254WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N255WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N256WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N25705	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N257WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N258JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N258WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N259WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N260WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26123	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N26141	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N261AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N261WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26208	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N26210	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N26215	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N26226	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N262WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N263WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N264LV	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26545	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N26549	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N265JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N265WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N266JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N266WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N267JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N267WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N268WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26906	2012	Fixed wing multi engine	BOEING	787-8	2	260	\N	Turbo-fan
N269WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N270WN	1998	Fixed wing multi engine	BOEING	737-705	2	149	\N	Turbo-fan
N27152	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N27190	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N271LV	\N	Fixed wing multi engine	BOEING	737-705	2	149	\N	Turbo-fan
N27200	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N27205	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N27213	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N27239	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N272AT	\N	Fixed wing multi engine	BOEING	777-200	2	400	\N	Turbo-jet
N272PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N272WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N273AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N273JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N273WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N27421	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N27477	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N274JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N274WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N275WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N276AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N276WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N27722	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N27724	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N27733	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N277WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N278AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N278WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N27901	2012	Fixed wing multi engine	BOEING	787-8	2	260	\N	Turbo-fan
N27962	1999	Fixed wing multi engine	EMBRAER	EMB-145	2	55	\N	Turbo-jet
N279AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N279JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N279PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N279WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N280WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N281AT	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A340-313	4	375	\N	Turbo-jet
N281JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N281WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N282WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N283JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N283WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N28457	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N28478	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N284AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N284JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N284WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N285AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N285WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N286WN	2004	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N287AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N287WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N288WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N289AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N289CT	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N290WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N29124	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N29129	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N291AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N291WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N292JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N292PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N292WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N293PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N293WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N294JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N294PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N294WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N295AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N295PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N295WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N296JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N296PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N296WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N29717	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N297PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N297WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N298JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N298PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N298WN	\N	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N29906	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N29917	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N299AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N299PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N299WN	\N	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N301DQ	\N	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N301NB	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N302AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N302DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N302NB	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N303AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N303DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N30401	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N304DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N304JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N305AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N305DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N306AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N306DQ	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N306JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N307AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N307DQ	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N307JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N308DE	\N	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N309AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N309AT	2006	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N309DE	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N309JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N309US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N310DE	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N310NW	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N31131	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N311US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N312US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N313US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N31412	2002	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N314NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N314US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N315AS	2002	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N315AT	\N	Fixed wing single engine	JOHN G HESS	AT-5	1	2	\N	4 Cycle
N315NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N315US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N316JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N316NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N316US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N317JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N317NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N317US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N317WN	1988	Fixed wing multi engine	BOEING	737-3Q8	2	149	\N	Turbo-fan
N318AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N318JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N318NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N318US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N319AA	1985	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N319AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N319NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N319US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N320AA	1985	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N320AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N320NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N320US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N321NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N321US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N322NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N322US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N323AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N323AS	2004	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N323JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N323NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N323US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N32404	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N324AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N324JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N324NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N324US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N325AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N325NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N325US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N326AT	2007	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N326NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N326US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N327AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N327NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N327NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N328AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N328JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N328NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N328NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N329AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N329JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N329NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N329NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N330AT	2007	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N330NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N330NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N33103	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N33132	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N33182	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N331NB	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N331NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N33203	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33209	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33262	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33264	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33266	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33284	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33286	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33289	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33292	\N	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33294	2005	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N332AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N332NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N332NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N333NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N333NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N334JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N334NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N334NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N335AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N335NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N335NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N336AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N336AT	2008	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N336NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N336NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N33714	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N337JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N337NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N337NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N338AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N338AT	2008	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N338NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N338NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N339AA	1988	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N339JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N339NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N339NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N340LV	1987	Fixed wing multi engine	BOEING	737-3K2	2	149	\N	Turbo-jet
N340NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N340NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N34110	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N34111	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N34131	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N34137	1999	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N341NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N341NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N34222	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N34282	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N342NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N342NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N343NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N343NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N34455	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N34460	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N344AA	1992	Fixed wing multi engine	GULFSTREAM AEROSPACE	G-IV	2	22	\N	Turbo-fan
N344NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N344NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N344SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N345NB	\N	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N345NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N345SA	1987	Fixed wing multi engine	BOEING	737-3K2	2	149	\N	Turbo-jet
N346JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N346NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N346SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N347AA	1985	Rotorcraft	SIKORSKY	S-76A	2	14	\N	Turbo-shaft
N347NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N347NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N347SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N348JB	2012	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N348NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N348NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N349NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N349NW	1996	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N349SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N350AA	1980	Fixed wing multi engine	PIPER	PA-31-350	2	8	162	Reciprocating
N350NA	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N350SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N351AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N351JB	2012	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N351NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N351NW	1997	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N35204	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N35260	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N35271	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N352AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N352NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N352NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N352SW	1990	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N353AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N353AT	2009	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N353JB	2012	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N353NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N353NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N353SW	1990	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N35407	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N354AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N354JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N354NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N354NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N354SW	1991	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N355AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N355JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N355NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N355NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N355SW	1991	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N356NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N356SW	1991	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N357AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N357NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N357NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N357SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N358AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N358JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N358NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N358NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N358SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N359AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N359NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N359NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N359SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N360AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N360NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N360NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N360SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N361AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N361NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N361NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N361SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N361VA	2013	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N36207	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N36247	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N36272	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N36280	2003	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N362AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N362NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N362NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N362SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N363AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N363NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N363NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N363SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N36444	2010	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36447	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36469	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36472	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36476	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N364AA	1973	Fixed wing multi engine	CESSNA	310Q	2	6	167	Reciprocating
N364NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N364NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N364SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N365AA	2001	Rotorcraft	AGUSTA SPA	A109E	2	8	\N	Turbo-shaft
N365NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N365NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N365SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N366AA	1991	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N366NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N366NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N366SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N367NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N367SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N368AA	1991	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N368JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N368NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N368NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N368SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N36915	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N369AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N369NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N369NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N369SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N370AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N370NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N370NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N370SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N371AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N371CA	2003	Fixed wing multi engine	BOMBARDIER INC	CL-600-2C10	2	80	\N	Turbo-fan
N371DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N371NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N371NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N371SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N37252	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37253	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37255	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37263	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37267	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37273	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37274	2002	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37277	2002	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37281	2003	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37287	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37290	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37293	2005	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37298	2005	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N372AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N372DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N372NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N372SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N3730B	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3731T	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3732J	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3733Z	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3734B	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3735D	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3736C	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3737C	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3738B	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3739P	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N373AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N373DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N373JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N373NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N373SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N37408	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N37409	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N3740C	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37413	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37419	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3741S	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37420	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37422	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37427	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3742C	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37434	2009	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37437	2009	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3743H	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3744F	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37456	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3745B	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37462	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37464	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37465	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37466	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37468	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3746H	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37470	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37471	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37474	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3747D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3748Y	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3749D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N374AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N374DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N374JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N374NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N374SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N3750D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3751B	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3752	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3753	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3754A	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3755D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3756	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3757D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
\.


--
-- Data for Name: weather; Type: TABLE DATA; Schema: odbc; Owner: travis
--

COPY odbc.weather (origin, year, month, day, hour, temp, dewp, humid, wind_dir, wind_speed, wind_gust, precip, pressure, visib, time_hour) FROM stdin;
EWR	2013	1	1	1	39.02	26.06	59.37	270	10.357019999999999	\N	0	1012	10	2013-01-01 06:00:00
EWR	2013	1	1	2	39.02	26.96	61.63	250	8.05546	\N	0	1012.3	10	2013-01-01 07:00:00
EWR	2013	1	1	3	39.02	28.04	64.43	240	11.5078	\N	0	1012.5	10	2013-01-01 08:00:00
EWR	2013	1	1	4	39.92	28.04	62.21	250	12.658579999999999	\N	0	1012.2	10	2013-01-01 09:00:00
EWR	2013	1	1	5	39.02	28.04	64.43	260	12.658579999999999	\N	0	1011.9	10	2013-01-01 10:00:00
EWR	2013	1	1	6	37.94	28.04	67.21	240	11.5078	\N	0	1012.4	10	2013-01-01 11:00:00
EWR	2013	1	1	7	39.02	28.04	64.43	240	14.960139999999999	\N	0	1012.2	10	2013-01-01 12:00:00
EWR	2013	1	1	8	39.92	28.04	62.21	250	10.357019999999999	\N	0	1012.2	10	2013-01-01 13:00:00
EWR	2013	1	1	9	39.92	28.04	62.21	260	14.960139999999999	\N	0	1012.7	10	2013-01-01 14:00:00
EWR	2013	1	1	10	41	28.04	59.65	260	13.809359999999998	\N	0	1012.4	10	2013-01-01 15:00:00
EWR	2013	1	1	11	41	26.96	57.06	260	14.960139999999999	\N	0	1011.4	10	2013-01-01 16:00:00
EWR	2013	1	1	13	39.2	28.4	69.67	330	16.11092	\N	0	\N	10	2013-01-01 18:00:00
EWR	2013	1	1	14	39.02	24.08	54.68	280	13.809359999999998	\N	0	1010.8	10	2013-01-01 19:00:00
EWR	2013	1	1	15	37.94	24.08	57.04	290	9.20624	\N	0	1011.9	10	2013-01-01 20:00:00
EWR	2013	1	1	16	37.04	19.94	49.62	300	13.809359999999998	20.714039999999997	0	1012.1	10	2013-01-01 21:00:00
EWR	2013	1	1	17	35.96	19.04	49.83	330	11.5078	\N	0	1013.2	10	2013-01-01 22:00:00
EWR	2013	1	1	18	33.98	15.08	45.43	310	12.658579999999999	25.317159999999998	0	1014.1	10	2013-01-01 23:00:00
EWR	2013	1	1	19	33.08	12.92	42.84	320	10.357019999999999	\N	0	1014.4	10	2013-01-02 00:00:00
EWR	2013	1	1	20	32	15.08	49.19	310	14.960139999999999	\N	0	1015.2	10	2013-01-02 01:00:00
EWR	2013	1	1	21	30.02	12.92	48.48	320	18.41248	26.46794	0	1016	10	2013-01-02 02:00:00
EWR	2013	1	1	22	28.94	12.02	48.69	320	18.41248	25.317159999999998	0	1016.5	10	2013-01-02 03:00:00
EWR	2013	1	1	23	28.04	10.94	48.15	310	16.11092	\N	0	1016.4	10	2013-01-02 04:00:00
EWR	2013	1	2	0	26.96	10.94	50.34	310	14.960139999999999	25.317159999999998	0	1016.3	10	2013-01-02 05:00:00
EWR	2013	1	2	1	26.06	10.94	52.25	330	12.658579999999999	24.166379999999997	0	1016.3	10	2013-01-02 06:00:00
EWR	2013	1	2	2	24.98	10.94	54.65	330	13.809359999999998	\N	0	1017	10	2013-01-02 07:00:00
EWR	2013	1	2	3	24.08	8.96	51.93	320	14.960139999999999	\N	0	1016.6	10	2013-01-02 08:00:00
EWR	2013	1	2	4	24.08	8.96	51.93	330	12.658579999999999	\N	0	1016.9	10	2013-01-02 09:00:00
EWR	2013	1	2	5	24.08	8.96	51.93	330	6.904679999999999	\N	0	1016.9	10	2013-01-02 10:00:00
EWR	2013	1	2	6	24.08	8.96	51.93	310	3.4523399999999995	\N	0	1017.2	10	2013-01-02 11:00:00
EWR	2013	1	2	7	24.98	10.04	52.5	300	6.904679999999999	\N	0	1017.6	10	2013-01-02 12:00:00
EWR	2013	1	2	8	24.98	10.04	52.5	280	9.20624	\N	0	1018.5	10	2013-01-02 13:00:00
EWR	2013	1	2	9	26.96	10.04	48.36	290	11.5078	\N	0	1019	10	2013-01-02 14:00:00
EWR	2013	1	2	10	28.94	10.94	46.41	280	9.20624	\N	0	1018.5	10	2013-01-02 15:00:00
EWR	2013	1	2	11	30.92	12.02	44.92	300	14.960139999999999	25.317159999999998	0	1017.5	10	2013-01-02 16:00:00
EWR	2013	1	2	12	32	12.92	44.74	290	12.658579999999999	23.0156	0	1017.1	10	2013-01-02 17:00:00
EWR	2013	1	2	13	33.98	12.92	41.33	290	16.11092	25.317159999999998	0	1017.3	10	2013-01-02 18:00:00
EWR	2013	1	2	14	33.98	10.94	37.86	310	17.261699999999998	26.46794	0	1017.8	10	2013-01-02 19:00:00
EWR	2013	1	2	15	33.98	12.02	39.72	310	13.809359999999998	20.714039999999997	0	1018.5	10	2013-01-02 20:00:00
EWR	2013	1	2	16	32	12.92	44.74	310	6.904679999999999	\N	0	1018.6	10	2013-01-02 21:00:00
EWR	2013	1	2	17	32	12.92	44.74	290	12.658579999999999	18.41248	0	1019.7	10	2013-01-02 22:00:00
EWR	2013	1	2	18	30.92	12.92	46.74	300	11.5078	\N	0	1020.3	10	2013-01-02 23:00:00
EWR	2013	1	2	19	30.92	14	49.01	290	6.904679999999999	\N	0	1020.4	10	2013-01-03 00:00:00
EWR	2013	1	2	20	30.02	14	50.84	280	9.20624	16.11092	0	1020.6	10	2013-01-03 01:00:00
EWR	2013	1	2	21	30.02	14	50.84	270	5.7539	\N	0	1021.2	10	2013-01-03 02:00:00
EWR	2013	1	2	22	28.94	15.08	55.69	270	8.05546	\N	0	1021.7	10	2013-01-03 03:00:00
EWR	2013	1	2	23	28.94	15.08	55.69	280	9.20624	\N	0	1022.2	10	2013-01-03 04:00:00
EWR	2013	1	3	0	28.04	15.08	57.79	290	8.05546	\N	0	1021.8	10	2013-01-03 05:00:00
EWR	2013	1	3	1	28.04	15.08	57.79	280	10.357019999999999	\N	0	1022.1	10	2013-01-03 06:00:00
EWR	2013	1	3	2	26.96	15.08	60.41	270	8.05546	\N	0	1022.3	10	2013-01-03 07:00:00
EWR	2013	1	3	3	26.96	15.08	60.41	280	6.904679999999999	\N	0	1022.1	10	2013-01-03 08:00:00
EWR	2013	1	3	4	26.06	15.08	62.7	290	5.7539	\N	0	1021.9	10	2013-01-03 09:00:00
EWR	2013	1	3	5	26.06	15.08	62.7	290	5.7539	\N	0	1022	10	2013-01-03 10:00:00
EWR	2013	1	3	6	26.06	15.98	65.21	310	6.904679999999999	\N	0	1022.4	10	2013-01-03 11:00:00
EWR	2013	1	3	7	26.06	15.98	65.21	320	5.7539	\N	0	1022.2	10	2013-01-03 12:00:00
EWR	2013	1	3	8	26.96	17.06	65.84	310	5.7539	\N	0	1022.4	10	2013-01-03 13:00:00
EWR	2013	1	3	9	28.04	17.06	62.97	290	5.7539	\N	0	1022.8	10	2013-01-03 14:00:00
EWR	2013	1	3	10	30.92	15.08	51.38	290	9.20624	\N	0	1022.1	10	2013-01-03 15:00:00
EWR	2013	1	3	11	30.92	14	49.01	\N	4.60312	\N	0	1021	10	2013-01-03 16:00:00
EWR	2013	1	3	12	33.08	12.92	42.84	260	8.05546	\N	0	1019.8	10	2013-01-03 17:00:00
EWR	2013	1	3	13	33.98	12.92	41.33	260	9.20624	\N	0	1019.1	10	2013-01-03 18:00:00
EWR	2013	1	3	14	33.98	12.92	41.33	240	8.05546	\N	0	1018.7	10	2013-01-03 19:00:00
EWR	2013	1	3	15	33.08	14	44.92	250	11.5078	\N	0	1018.8	10	2013-01-03 20:00:00
EWR	2013	1	3	16	32	14	46.92	270	10.357019999999999	\N	0	1018.9	10	2013-01-03 21:00:00
EWR	2013	1	3	17	30.02	15.08	53.29	240	9.20624	\N	0	1019.3	10	2013-01-03 22:00:00
EWR	2013	1	3	18	30.92	15.08	51.38	240	10.357019999999999	\N	0	1019.6	10	2013-01-03 23:00:00
EWR	2013	1	3	19	30.92	15.08	51.38	230	11.5078	\N	0	1019.6	10	2013-01-04 00:00:00
EWR	2013	1	3	20	30.92	15.08	51.38	240	11.5078	\N	0	1019.4	10	2013-01-04 01:00:00
EWR	2013	1	3	21	30.92	15.98	53.44	240	12.658579999999999	\N	0	1019	10	2013-01-04 02:00:00
EWR	2013	1	3	22	28.94	17.06	60.69	230	10.357019999999999	\N	0	1019	10	2013-01-04 03:00:00
EWR	2013	1	3	23	30.02	17.96	60.38	240	10.357019999999999	\N	0	1018.4	10	2013-01-04 04:00:00
EWR	2013	1	4	0	30.02	17.96	60.38	240	13.809359999999998	\N	0	1018	10	2013-01-04 05:00:00
EWR	2013	1	4	1	28.94	17.96	63.1	230	8.05546	\N	0	1018.1	10	2013-01-04 06:00:00
EWR	2013	1	4	2	30.02	19.04	63.24	240	10.357019999999999	\N	0	1018.3	10	2013-01-04 07:00:00
EWR	2013	1	4	3	28.94	19.04	66.09	250	11.5078	\N	0	1018.2	10	2013-01-04 08:00:00
EWR	2013	1	4	4	28.94	19.94	68.68	230	6.904679999999999	\N	0	1018.4	10	2013-01-04 09:00:00
EWR	2013	1	4	5	30.92	21.02	66.34	240	11.5078	\N	0	1018.4	10	2013-01-04 10:00:00
EWR	2013	1	4	6	33.08	21.02	60.81	230	16.11092	\N	0	1018.7	10	2013-01-04 11:00:00
EWR	2013	1	4	7	33.98	21.92	60.93	240	10.357019999999999	\N	0	1018.7	10	2013-01-04 12:00:00
EWR	2013	1	4	8	35.06	21.92	58.37	250	13.809359999999998	\N	0	1019	10	2013-01-04 13:00:00
EWR	2013	1	4	9	35.96	21.02	54.21	250	14.960139999999999	19.56326	0	1019	10	2013-01-04 14:00:00
EWR	2013	1	4	10	37.04	19.04	47.75	260	16.11092	27.618719999999996	0	1018.1	10	2013-01-04 15:00:00
EWR	2013	1	4	11	37.04	19.04	47.75	270	20.714039999999997	27.618719999999996	0	1016.9	10	2013-01-04 16:00:00
EWR	2013	1	4	12	39.92	19.94	44.33	260	17.261699999999998	25.317159999999998	0	1015.8	10	2013-01-04 17:00:00
EWR	2013	1	4	13	37.94	19.04	46.09	250	24.166379999999997	31.07106	0	1015.1	10	2013-01-04 18:00:00
EWR	2013	1	4	14	37.94	19.94	47.89	250	21.864819999999998	28.769499999999997	0	1014.7	10	2013-01-04 19:00:00
EWR	2013	1	4	15	37.94	19.94	47.89	250	18.41248	27.618719999999996	0	1014.6	10	2013-01-04 20:00:00
EWR	2013	1	4	16	37.04	19.94	49.62	250	17.261699999999998	25.317159999999998	0	1014.8	10	2013-01-04 21:00:00
EWR	2013	1	4	17	35.96	21.02	54.21	230	13.809359999999998	\N	0	1015.2	10	2013-01-04 22:00:00
EWR	2013	1	4	18	35.06	21.02	56.18	230	9.20624	\N	0	1015.4	10	2013-01-04 23:00:00
EWR	2013	1	4	19	35.06	21.02	56.18	240	11.5078	19.56326	0	1015.5	10	2013-01-05 00:00:00
EWR	2013	1	4	20	35.06	19.94	53.66	250	11.5078	\N	0	1015.3	10	2013-01-05 01:00:00
EWR	2013	1	4	21	35.06	19.94	53.66	250	13.809359999999998	\N	0	1015.7	10	2013-01-05 02:00:00
EWR	2013	1	4	22	33.98	19.04	53.91	250	11.5078	\N	0	1016.2	10	2013-01-05 03:00:00
EWR	2013	1	4	23	33.08	19.04	55.89	240	11.5078	\N	0	1016.6	10	2013-01-05 04:00:00
EWR	2013	1	5	0	33.08	17.96	53.36	260	10.357019999999999	\N	0	1017.1	10	2013-01-05 05:00:00
EWR	2013	1	5	1	33.08	17.06	51.33	270	10.357019999999999	\N	0	1017.7	10	2013-01-05 06:00:00
EWR	2013	1	5	2	32	17.06	53.6	280	12.658579999999999	\N	0	1018.8	10	2013-01-05 07:00:00
EWR	2013	1	5	3	32	17.06	53.6	290	18.41248	23.0156	0	1019.3	10	2013-01-05 08:00:00
EWR	2013	1	5	4	32	17.06	53.6	260	11.5078	\N	0	1020.2	10	2013-01-05 09:00:00
EWR	2013	1	5	5	32	17.06	53.6	240	12.658579999999999	\N	0	1021	10	2013-01-05 10:00:00
EWR	2013	1	5	6	33.08	17.96	53.36	250	10.357019999999999	\N	0	1022.4	10	2013-01-05 11:00:00
EWR	2013	1	5	7	32	19.04	58.37	250	9.20624	\N	0	1023	10	2013-01-05 12:00:00
EWR	2013	1	5	8	35.06	19.94	53.66	240	9.20624	20.714039999999997	0	1024.5	10	2013-01-05 13:00:00
EWR	2013	1	5	9	37.94	21.02	50.14	270	10.357019999999999	\N	0	1024.8	10	2013-01-05 14:00:00
EWR	2013	1	5	10	41	21.02	44.51	310	10.357019999999999	21.864819999999998	0	1024.9	10	2013-01-05 15:00:00
EWR	2013	1	5	11	42.08	19.94	40.77	320	14.960139999999999	26.46794	0	1024.6	10	2013-01-05 16:00:00
EWR	2013	1	5	12	42.98	19.94	39.38	310	13.809359999999998	\N	0	1023.9	10	2013-01-05 17:00:00
EWR	2013	1	5	13	44.06	19.94	37.79	290	11.5078	19.56326	0	1023.6	10	2013-01-05 18:00:00
EWR	2013	1	5	14	44.06	19.94	37.79	310	9.20624	16.11092	0	1024	10	2013-01-05 19:00:00
EWR	2013	1	5	15	42.98	19.04	37.9	310	8.05546	\N	0	1024.1	10	2013-01-05 20:00:00
EWR	2013	1	5	16	41	19.94	42.51	310	4.60312	\N	0	1024	10	2013-01-05 21:00:00
EWR	2013	1	5	17	39.92	19.94	44.33	280	4.60312	\N	0	1024.7	10	2013-01-05 22:00:00
EWR	2013	1	5	18	39.02	21.92	49.93	240	8.05546	\N	0	1025	10	2013-01-05 23:00:00
EWR	2013	1	5	19	35.96	21.92	56.32	240	6.904679999999999	\N	0	1024.8	10	2013-01-06 00:00:00
EWR	2013	1	5	20	33.98	21.92	60.93	240	4.60312	\N	0	1024.2	10	2013-01-06 01:00:00
EWR	2013	1	5	21	33.08	23	66.11	220	4.60312	\N	0	1024.1	10	2013-01-06 02:00:00
EWR	2013	1	5	22	33.08	23	66.11	210	4.60312	\N	0	1023.3	10	2013-01-06 03:00:00
EWR	2013	1	5	23	32	23	69.04	210	4.60312	\N	0	1022.8	10	2013-01-06 04:00:00
EWR	2013	1	6	0	33.98	23	63.77	210	5.7539	\N	0	1023.3	10	2013-01-06 05:00:00
EWR	2013	1	6	1	33.98	23	63.77	230	9.20624	\N	0	1023.4	10	2013-01-06 06:00:00
EWR	2013	1	6	2	33.98	23	63.77	200	4.60312	\N	0	1022.5	10	2013-01-06 07:00:00
EWR	2013	1	6	3	33.98	24.08	66.72	200	5.7539	\N	0	1021.7	10	2013-01-06 08:00:00
EWR	2013	1	6	4	33.08	28.04	81.5	200	8.05546	\N	0	1020.5	10	2013-01-06 09:00:00
EWR	2013	1	6	5	33.8	30.2	88.37	210	5.7539	\N	0	\N	6	2013-01-06 10:00:00
EWR	2013	1	6	6	33.98	30.92	88.42	210	5.7539	\N	0	1020.3	6	2013-01-06 11:00:00
EWR	2013	1	6	7	35.06	32	93.03	230	9.20624	\N	0	\N	6	2013-01-06 12:00:00
EWR	2013	1	6	8	35.96	32	86.59	240	8.05546	\N	0	\N	6	2013-01-06 13:00:00
EWR	2013	1	6	9	37.4	32	86.59	230	11.5078	\N	0	\N	8	2013-01-06 14:00:00
EWR	2013	1	6	10	39.92	30.92	74.98	250	11.5078	\N	0	\N	9	2013-01-06 15:00:00
EWR	2013	1	6	11	42.98	30.02	59.93	240	10.357019999999999	\N	0	1017.4	10	2013-01-06 16:00:00
EWR	2013	1	6	12	46.04	28.94	51.03	250	10.357019999999999	\N	0	1016.3	10	2013-01-06 17:00:00
EWR	2013	1	6	13	46.94	26.96	45.48	240	13.809359999999998	19.56326	0	1015.5	10	2013-01-06 18:00:00
EWR	2013	1	6	14	48.02	24.98	40.22	250	14.960139999999999	18.41248	0	1015.1	10	2013-01-06 19:00:00
EWR	2013	1	6	15	46.94	24.08	40.35	260	11.5078	\N	0	1015	10	2013-01-06 20:00:00
EWR	2013	1	6	16	44.96	26.06	47.23	260	6.904679999999999	\N	0	1015.5	10	2013-01-06 21:00:00
EWR	2013	1	6	17	44.06	26.06	48.87	270	8.05546	\N	0	1016	10	2013-01-06 22:00:00
EWR	2013	1	6	18	44.06	24.98	46.73	250	10.357019999999999	\N	0	1016.5	10	2013-01-06 23:00:00
EWR	2013	1	6	19	42.98	24.98	48.7	260	10.357019999999999	\N	0	1016.6	10	2013-01-07 00:00:00
EWR	2013	1	6	20	42.98	26.06	50.94	270	10.357019999999999	\N	0	1016.5	10	2013-01-07 01:00:00
EWR	2013	1	6	21	42.08	26.06	52.73	270	10.357019999999999	\N	0	1016.7	10	2013-01-07 02:00:00
EWR	2013	1	6	22	41	26.96	57.06	270	6.904679999999999	\N	0	1017.2	10	2013-01-07 03:00:00
EWR	2013	1	6	23	39.92	26.96	59.5	270	9.20624	\N	0	1017.6	10	2013-01-07 04:00:00
EWR	2013	1	7	0	39.92	26.96	59.5	260	8.05546	\N	0	1018.1	10	2013-01-07 05:00:00
EWR	2013	1	7	1	37.94	26.96	64.29	270	8.05546	\N	0	1018.7	10	2013-01-07 06:00:00
EWR	2013	1	7	2	35.96	26.96	69.51	280	6.904679999999999	\N	0	1019.3	10	2013-01-07 07:00:00
EWR	2013	1	7	3	37.04	28.04	69.63	260	6.904679999999999	\N	0	1019.8	10	2013-01-07 08:00:00
EWR	2013	1	7	4	35.96	28.04	72.66	280	9.20624	\N	0	1020.6	10	2013-01-07 09:00:00
EWR	2013	1	7	5	35.06	26.96	72.03	290	4.60312	\N	0	1021.7	10	2013-01-07 10:00:00
EWR	2013	1	7	6	35.96	28.04	72.66	270	6.904679999999999	\N	0	1023.1	10	2013-01-07 11:00:00
EWR	2013	1	7	7	37.94	28.94	69.73	250	8.05546	\N	0	1024.1	10	2013-01-07 12:00:00
EWR	2013	1	7	8	39.92	28.94	64.54	280	5.7539	\N	0	1025.1	10	2013-01-07 13:00:00
EWR	2013	1	7	9	44.06	26.96	50.73	300	13.809359999999998	23.0156	0	1025.9	10	2013-01-07 14:00:00
EWR	2013	1	7	10	44.96	24.08	43.49	320	14.960139999999999	21.864819999999998	0	1026.5	10	2013-01-07 15:00:00
EWR	2013	1	7	11	46.04	23	39.9	300	11.5078	20.714039999999997	0	1026.6	10	2013-01-07 16:00:00
EWR	2013	1	7	12	46.94	21.92	36.85	300	14.960139999999999	24.166379999999997	0	1026.9	10	2013-01-07 17:00:00
EWR	2013	1	7	13	46.04	19.94	35.05	360	11.5078	\N	0	1027.1	10	2013-01-07 18:00:00
EWR	2013	1	7	14	46.94	19.94	33.88	290	11.5078	20.714039999999997	0	1027.6	10	2013-01-07 19:00:00
EWR	2013	1	7	15	44.96	17.96	33.55	320	8.05546	\N	0	1028.4	10	2013-01-07 20:00:00
EWR	2013	1	7	16	42.98	17.96	36.18	330	6.904679999999999	\N	0	1028.8	10	2013-01-07 21:00:00
EWR	2013	1	7	17	42.08	17.96	37.46	320	3.4523399999999995	\N	0	1029.1	10	2013-01-07 22:00:00
EWR	2013	1	7	18	41	19.04	40.9	310	4.60312	\N	0	1029.3	10	2013-01-07 23:00:00
EWR	2013	1	7	19	39.92	21.02	46.41	0	0	\N	0	1029.3	10	2013-01-08 00:00:00
EWR	2013	1	7	20	39.92	21.02	46.41	0	0	\N	0	1029.1	10	2013-01-08 01:00:00
EWR	2013	1	7	21	37.04	24.08	59.09	0	0	\N	0	1028.9	10	2013-01-08 02:00:00
EWR	2013	1	7	22	35.96	23	58.94	230	3.4523399999999995	\N	0	1029.3	10	2013-01-08 03:00:00
EWR	2013	1	7	23	32	23	69.04	210	6.904679999999999	\N	0	1029.2	10	2013-01-08 04:00:00
EWR	2013	1	8	0	32	23	69.04	210	3.4523399999999995	\N	0	1029.2	10	2013-01-08 05:00:00
EWR	2013	1	8	1	32	24.08	72.24	210	6.904679999999999	\N	0	1029	10	2013-01-08 06:00:00
EWR	2013	1	8	2	32	24.98	75	190	3.4523399999999995	\N	0	1028.7	10	2013-01-08 07:00:00
EWR	2013	1	8	3	30.92	26.06	81.95	190	4.60312	\N	0	1028.2	10	2013-01-08 08:00:00
EWR	2013	1	8	4	30.02	24.98	81.27	240	4.60312	\N	0	1028.6	10	2013-01-08 09:00:00
EWR	2013	1	8	5	28.94	24.08	81.8	210	4.60312	\N	0	1028.9	10	2013-01-08 10:00:00
EWR	2013	1	8	6	30.92	24.98	78.35	0	0	\N	0	1029.2	9	2013-01-08 11:00:00
EWR	2013	1	8	7	30.02	24.98	81.27	210	5.7539	\N	0	1030	8	2013-01-08 12:00:00
EWR	2013	1	8	8	35.06	26.96	72.03	240	6.904679999999999	\N	0	1030.5	9	2013-01-08 13:00:00
EWR	2013	1	8	9	39.02	28.94	66.85	230	9.20624	\N	0	1030.3	9	2013-01-08 14:00:00
EWR	2013	1	8	10	44.06	28.94	55.02	220	13.809359999999998	\N	0	1029.7	9	2013-01-08 15:00:00
EWR	2013	1	8	11	46.04	30.02	53.33	230	10.357019999999999	\N	0	1028.2	10	2013-01-08 16:00:00
EWR	2013	1	8	12	46.94	30.02	51.55	230	14.960139999999999	25.317159999999998	0	1027.9	10	2013-01-08 17:00:00
EWR	2013	1	8	13	48.92	30.02	47.86	240	11.5078	\N	0	1027.6	10	2013-01-08 18:00:00
EWR	2013	1	8	14	48.92	30.02	47.86	220	11.5078	\N	0	1027.9	10	2013-01-08 19:00:00
EWR	2013	1	8	15	48.92	28.04	44.14	240	11.5078	\N	0	1027.7	10	2013-01-08 20:00:00
EWR	2013	1	8	16	46.04	28.04	49.19	230	10.357019999999999	\N	0	1027.8	10	2013-01-08 21:00:00
EWR	2013	1	8	17	44.06	28.94	55.02	220	6.904679999999999	\N	0	1028.1	10	2013-01-08 22:00:00
EWR	2013	1	8	18	39.92	30.92	69.96	220	8.05546	\N	0	1028.7	10	2013-01-08 23:00:00
EWR	2013	1	8	19	39.92	30.92	69.96	200	5.7539	\N	0	1028.7	10	2013-01-09 00:00:00
EWR	2013	1	8	20	39.02	30.02	69.86	210	5.7539	\N	0	1028.6	10	2013-01-09 01:00:00
EWR	2013	1	8	21	37.94	28.94	69.73	210	3.4523399999999995	\N	0	1028.6	10	2013-01-09 02:00:00
EWR	2013	1	8	22	37.94	28.94	69.73	210	4.60312	\N	0	1029.3	10	2013-01-09 03:00:00
EWR	2013	1	8	23	37.04	28.94	72.24	230	4.60312	\N	0	1029.2	10	2013-01-09 04:00:00
EWR	2013	1	9	0	35.96	28.94	75.39	0	0	\N	0	1029.1	10	2013-01-09 05:00:00
EWR	2013	1	9	1	33.98	28.94	81.57	0	0	\N	0	1028.7	10	2013-01-09 06:00:00
EWR	2013	1	9	2	35.06	28.94	78.13	0	0	\N	0	1028.5	10	2013-01-09 07:00:00
EWR	2013	1	9	3	35.96	30.02	78.79	0	0	\N	0	1028.4	10	2013-01-09 08:00:00
EWR	2013	1	9	4	35.96	28.94	75.39	0	0	\N	0	1028.2	10	2013-01-09 09:00:00
EWR	2013	1	9	5	35.06	28.94	78.13	0	0	\N	0	1028	9	2013-01-09 10:00:00
EWR	2013	1	9	6	35.06	28.94	78.13	0	0	\N	0	1028.4	9	2013-01-09 11:00:00
EWR	2013	1	9	7	33.98	30.02	85.24	260	4.60312	\N	0	1029	6	2013-01-09 12:00:00
EWR	2013	1	9	8	37.04	30.92	78.31	0	0	\N	0	1028.7	7	2013-01-09 13:00:00
EWR	2013	1	9	9	42.08	32	67.22	0	0	\N	0	1028.3	7	2013-01-09 14:00:00
EWR	2013	1	9	10	44.06	33.08	65.07	170	3.4523399999999995	\N	0	1026.4	7	2013-01-09 15:00:00
EWR	2013	1	9	11	46.94	33.98	60.47	230	5.7539	\N	0	1025.9	7	2013-01-09 16:00:00
EWR	2013	1	9	12	46.04	33.98	62.56	200	9.20624	\N	0	1024.1	9	2013-01-09 17:00:00
EWR	2013	1	9	13	46.94	33.98	60.47	270	8.05546	\N	0	1024.7	9	2013-01-09 18:00:00
EWR	2013	1	9	14	46.94	35.06	63.13	180	8.05546	\N	0	1021.1	8	2013-01-09 19:00:00
EWR	2013	1	9	15	48.92	37.04	63.39	210	13.809359999999998	20.714039999999997	0	1020.7	9	2013-01-09 20:00:00
EWR	2013	1	9	16	50	37.04	60.89	240	11.5078	20.714039999999997	0	1021	10	2013-01-09 21:00:00
EWR	2013	1	9	17	48.92	37.04	63.39	240	12.658579999999999	\N	0	1021.7	10	2013-01-09 22:00:00
EWR	2013	1	9	18	48.02	37.04	65.56	250	10.357019999999999	\N	0	1022.1	10	2013-01-09 23:00:00
EWR	2013	1	9	19	46.94	37.04	68.28	260	11.5078	\N	0	1022.6	10	2013-01-10 00:00:00
EWR	2013	1	9	20	44.96	37.04	73.59	230	11.5078	\N	0	1022.5	10	2013-01-10 01:00:00
EWR	2013	1	9	21	44.06	35.96	72.98	230	12.658579999999999	\N	0	1022.5	10	2013-01-10 02:00:00
EWR	2013	1	9	22	44.06	35.06	70.42	240	12.658579999999999	\N	0	1023	10	2013-01-10 03:00:00
EWR	2013	1	9	23	42.98	33.08	67.81	220	8.05546	\N	0	1023.7	10	2013-01-10 04:00:00
EWR	2013	1	10	0	41	32	70.08	230	8.05546	\N	0	1024.6	10	2013-01-10 05:00:00
EWR	2013	1	10	1	39.02	30.02	69.86	210	9.20624	\N	0	1025.9	10	2013-01-10 06:00:00
EWR	2013	1	10	2	39.02	28.94	66.85	230	6.904679999999999	\N	0	1026.9	10	2013-01-10 07:00:00
EWR	2013	1	10	3	39.92	26.96	59.5	270	5.7539	\N	0	1027.5	10	2013-01-10 08:00:00
EWR	2013	1	10	4	41	26.06	54.97	320	6.904679999999999	\N	0	1028.2	10	2013-01-10 09:00:00
EWR	2013	1	10	5	41	26.06	54.97	300	12.658579999999999	20.714039999999997	0	1029	10	2013-01-10 10:00:00
EWR	2013	1	10	6	39.92	24.98	54.81	280	6.904679999999999	17.261699999999998	0	1030	10	2013-01-10 11:00:00
EWR	2013	1	10	7	41	24.98	52.56	330	6.904679999999999	\N	0	1031.4	10	2013-01-10 12:00:00
EWR	2013	1	10	8	42.98	24.98	48.7	330	8.05546	\N	0	1032.2	10	2013-01-10 13:00:00
EWR	2013	1	10	9	44.96	23	41.56	320	17.261699999999998	26.46794	0	1032.7	10	2013-01-10 14:00:00
EWR	2013	1	10	10	44.96	21.92	39.72	320	11.5078	\N	0	1032.8	10	2013-01-10 15:00:00
EWR	2013	1	10	11	46.94	21.92	36.85	330	13.809359999999998	23.0156	0	1032	10	2013-01-10 16:00:00
EWR	2013	1	10	12	48.92	21.92	34.21	320	14.960139999999999	20.714039999999997	0	1031.3	10	2013-01-10 17:00:00
EWR	2013	1	10	13	50	21.92	32.86	310	12.658579999999999	18.41248	0	1031.5	10	2013-01-10 18:00:00
EWR	2013	1	10	14	50	21.92	32.86	300	11.5078	19.56326	0	1031.9	10	2013-01-10 19:00:00
EWR	2013	1	10	15	48.92	21.02	32.93	330	10.357019999999999	\N	0	1032.4	10	2013-01-10 20:00:00
EWR	2013	1	10	16	46.94	21.92	36.85	310	8.05546	\N	0	1032.8	10	2013-01-10 21:00:00
EWR	2013	1	10	17	46.04	21.92	38.12	320	8.05546	\N	0	1033.3	10	2013-01-10 22:00:00
EWR	2013	1	10	18	44.96	23	41.56	330	6.904679999999999	\N	0	1033.8	10	2013-01-10 23:00:00
EWR	2013	1	10	19	44.06	23	43.02	340	4.60312	\N	0	1033.6	10	2013-01-11 00:00:00
EWR	2013	1	10	20	44.06	23	43.02	340	6.904679999999999	\N	0	1034	10	2013-01-11 01:00:00
EWR	2013	1	10	21	41	24.98	52.56	10	8.05546	\N	0	1033.5	10	2013-01-11 02:00:00
EWR	2013	1	10	22	39.02	24.98	56.77	30	8.05546	\N	0	1034	10	2013-01-11 03:00:00
EWR	2013	1	10	23	39.92	24.08	52.79	0	0	\N	0	1034.4	10	2013-01-11 04:00:00
EWR	2013	1	11	0	37.94	24.98	59.22	20	4.60312	\N	0	1033.6	10	2013-01-11 05:00:00
EWR	2013	1	11	1	37.04	24.08	59.09	20	8.05546	\N	0	1033.2	10	2013-01-11 06:00:00
EWR	2013	1	11	2	35.06	24.08	63.91	30	5.7539	\N	0	1033.1	10	2013-01-11 07:00:00
EWR	2013	1	11	3	35.96	24.08	61.67	10	5.7539	\N	0	1032.2	10	2013-01-11 08:00:00
EWR	2013	1	11	4	35.96	24.08	61.67	10	6.904679999999999	\N	0	1031.3	10	2013-01-11 09:00:00
EWR	2013	1	11	5	37.04	24.98	61.35	0	0	\N	0	1031.7	10	2013-01-11 10:00:00
EWR	2013	1	11	6	37.94	24.98	59.22	0	0	\N	0	1031.8	10	2013-01-11 11:00:00
EWR	2013	1	11	7	39.02	26.06	59.37	0	0	\N	0	1031.9	10	2013-01-11 12:00:00
EWR	2013	1	11	8	41	28.94	61.89	80	5.7539	\N	0	1031.4	10	2013-01-11 13:00:00
EWR	2013	1	11	9	42.08	30.92	64.35	80	5.7539	\N	0	1031.1	10	2013-01-11 14:00:00
EWR	2013	1	11	10	42.98	32	64.93	80	5.7539	\N	0	1029.7	10	2013-01-11 15:00:00
EWR	2013	1	11	11	44.06	33.08	65.07	90	5.7539	\N	0	1028.4	10	2013-01-11 16:00:00
EWR	2013	1	11	12	44.96	35.96	70.52	\N	4.60312	\N	0	1027.3	10	2013-01-11 17:00:00
EWR	2013	1	11	13	44.96	37.04	73.59	90	5.7539	\N	0	1026.6	10	2013-01-11 18:00:00
EWR	2013	1	11	14	44.96	37.94	76.25	80	5.7539	\N	0	1025.9	10	2013-01-11 19:00:00
EWR	2013	1	11	15	44.96	39.92	82.38	110	4.60312	\N	0	1024.9	10	2013-01-11 20:00:00
EWR	2013	1	11	16	46.4	41	82.45	90	4.60312	\N	0	\N	10	2013-01-11 21:00:00
EWR	2013	1	11	17	46.4	44.6	93.4	150	5.7539	\N	0.05	\N	3	2013-01-11 22:00:00
EWR	2013	1	11	18	46.4	44.96	95.99	130	5.7539	\N	0.06	\N	3	2013-01-11 23:00:00
EWR	2013	1	11	19	46.4	44.96	95.99	0	0	\N	0.19	\N	3	2013-01-12 00:00:00
EWR	2013	1	11	20	46.4	44.6	100	60	6.904679999999999	\N	0.07	\N	2.5	2013-01-12 01:00:00
EWR	2013	1	11	21	42.98	42.98	100	20	5.7539	\N	0.09	1020.6	1	2013-01-12 02:00:00
EWR	2013	1	11	22	44.6	44.6	100	360	3.4523399999999995	\N	0.05	\N	1	2013-01-12 03:00:00
EWR	2013	1	11	23	42.98	42.98	100	10	8.05546	\N	0.02	\N	2	2013-01-12 04:00:00
EWR	2013	1	12	0	44.06	42.98	100	360	5.7539	\N	0.01	\N	1.5	2013-01-12 05:00:00
EWR	2013	1	12	1	44.06	42.98	95.95	340	9.20624	\N	0.01	1018.8	1	2013-01-12 06:00:00
EWR	2013	1	12	2	44.06	44.06	100	360	6.904679999999999	\N	0.01	1019.2	1.5	2013-01-12 07:00:00
EWR	2013	1	12	3	44.96	44.6	100	20	9.20624	\N	0	\N	6	2013-01-12 08:00:00
EWR	2013	1	12	4	44.96	44.6	100	20	8.05546	\N	0	\N	6	2013-01-12 09:00:00
EWR	2013	1	12	5	44.96	44.6	100	360	9.20624	\N	0	\N	6	2013-01-12 10:00:00
EWR	2013	1	12	6	44.06	44.06	100	20	8.05546	\N	0	1019.5	6	2013-01-12 11:00:00
EWR	2013	1	12	7	44.96	44.06	96.63	10	10.357019999999999	\N	0	1020.4	6	2013-01-12 12:00:00
EWR	2013	1	12	8	44.96	44.06	96.63	10	8.05546	\N	0	1021	7	2013-01-12 13:00:00
EWR	2013	1	12	9	46.04	44.06	92.75	10	6.904679999999999	\N	0	1020.9	6	2013-01-12 14:00:00
EWR	2013	1	12	10	46.94	44.96	92.78	360	4.60312	\N	0	1021.1	6	2013-01-12 15:00:00
EWR	2013	1	12	11	48.02	44.96	89.08	40	5.7539	\N	0	1020.4	6	2013-01-12 16:00:00
EWR	2013	1	12	12	46.94	44.96	92.78	30	4.60312	\N	0	1020.5	6	2013-01-12 17:00:00
EWR	2013	1	12	13	48.02	44.96	89.08	30	3.4523399999999995	\N	0	1020.7	6	2013-01-12 18:00:00
EWR	2013	1	12	14	48.02	44.96	89.08	50	5.7539	\N	0	1020.3	5	2013-01-12 19:00:00
EWR	2013	1	12	15	48.2	44.96	92.78	40	3.4523399999999995	\N	0	\N	2.5	2013-01-12 20:00:00
EWR	2013	1	12	16	46.94	44.96	92.78	50	4.60312	\N	0	1021	2.5	2013-01-12 21:00:00
EWR	2013	1	12	17	46.94	44.96	92.78	30	6.904679999999999	\N	0	1021.7	2.5	2013-01-12 22:00:00
EWR	2013	1	12	18	46.94	44.96	92.78	0	0	\N	0	1021	3	2013-01-12 23:00:00
EWR	2013	1	12	19	46.04	44.06	92.75	0	0	\N	0	1021.7	3	2013-01-13 00:00:00
EWR	2013	1	12	20	46.04	44.06	92.75	0	0	\N	0	1020.9	3	2013-01-13 01:00:00
EWR	2013	1	12	21	46.04	44.06	92.75	0	0	\N	0	1020.2	3	2013-01-13 02:00:00
EWR	2013	1	12	22	46.04	44.06	92.75	0	0	\N	0	1020.4	3	2013-01-13 03:00:00
EWR	2013	1	12	23	46.4	44.96	95.99	0	0	\N	0	\N	2	2013-01-13 04:00:00
EWR	2013	1	13	0	46.4	44.96	100	160	4.60312	\N	0	\N	0.25	2013-01-13 05:00:00
EWR	2013	1	13	1	44.96	44.96	100	0	0	\N	0	1020.5	0.25	2013-01-13 06:00:00
EWR	2013	1	13	2	44.96	44.96	100	150	4.60312	\N	0	\N	0.25	2013-01-13 07:00:00
EWR	2013	1	13	3	44.96	44.96	100	200	5.7539	\N	0	\N	0.25	2013-01-13 08:00:00
EWR	2013	1	13	4	44.6	44.6	100	210	5.7539	\N	0	\N	0.25	2013-01-13 09:00:00
EWR	2013	1	13	5	44.6	44.6	100	170	3.4523399999999995	\N	0	\N	0.25	2013-01-13 10:00:00
EWR	2013	1	13	6	44.6	44.6	100	160	4.60312	\N	0	\N	0.5	2013-01-13 11:00:00
EWR	2013	1	13	7	44.6	44.6	100	160	5.7539	\N	0	\N	0.25	2013-01-13 12:00:00
EWR	2013	1	13	8	44.06	44.06	100	0	0	\N	0	1020.9	0.12	2013-01-13 13:00:00
EWR	2013	1	13	9	44.06	44.06	100	0	0	\N	0	1021	0.12	2013-01-13 14:00:00
EWR	2013	1	13	10	44.06	44.06	100	140	4.60312	\N	0	1021.1	0.5	2013-01-13 15:00:00
EWR	2013	1	13	11	46.4	44.6	93.4	160	3.4523399999999995	\N	0	\N	2	2013-01-13 16:00:00
EWR	2013	1	13	12	46.94	44.6	93.4	\N	4.60312	\N	0	\N	3	2013-01-13 17:00:00
EWR	2013	1	13	13	48.02	44.96	89.08	140	3.4523399999999995	\N	0	1018.1	3	2013-01-13 18:00:00
EWR	2013	1	13	14	48.2	44.96	89.08	\N	4.60312	\N	0	\N	3	2013-01-13 19:00:00
EWR	2013	1	13	15	46.94	44.6	93.4	120	5.7539	\N	0	\N	3	2013-01-13 20:00:00
EWR	2013	1	13	16	46.94	44.06	89.65	0	0	\N	0	1017.5	5	2013-01-13 21:00:00
EWR	2013	1	13	17	48.02	44.96	89.08	0	0	\N	0	1017.5	7	2013-01-13 22:00:00
EWR	2013	1	13	18	48.92	44.96	86.13	0	0	\N	0	1017.2	10	2013-01-13 23:00:00
EWR	2013	1	13	19	48.2	46.94	96.02	0	0	\N	0	\N	2	2013-01-14 00:00:00
EWR	2013	1	13	20	48.2	46.94	100	120	3.4523399999999995	\N	0	\N	0.5	2013-01-14 01:00:00
EWR	2013	1	13	21	48.02	48.02	100	0	0	\N	0	1016.4	0.5	2013-01-14 02:00:00
EWR	2013	1	13	22	48.02	48.02	100	0	0	\N	0	1016.5	0.5	2013-01-14 03:00:00
EWR	2013	1	13	23	48.02	48.02	100	0	0	\N	0	1016.4	0.5	2013-01-14 04:00:00
EWR	2013	1	14	0	48.92	48.2	100	0	0	\N	0	\N	0.5	2013-01-14 05:00:00
EWR	2013	1	14	1	48.92	48.92	100	0	0	\N	0	1015.9	0.5	2013-01-14 06:00:00
EWR	2013	1	14	2	48.92	48.92	100	0	0	\N	0	1016	0.5	2013-01-14 07:00:00
EWR	2013	1	14	3	48.92	48.92	100	0	0	\N	0	1015.7	0.5	2013-01-14 08:00:00
EWR	2013	1	14	4	50	48.92	100	0	0	\N	0	\N	0.5	2013-01-14 09:00:00
EWR	2013	1	14	5	48.92	48.92	100	140	3.4523399999999995	\N	0	1014	0.5	2013-01-14 10:00:00
EWR	2013	1	14	6	51.08	51.08	100	\N	3.4523399999999995	18.41248	0	1016	0.5	2013-01-14 11:00:00
EWR	2013	1	14	7	51.8	51.8	100	290	6.904679999999999	\N	0	\N	2.5	2013-01-14 12:00:00
EWR	2013	1	14	8	51.98	51.08	96.73	260	4.60312	\N	0	1017.7	2.5	2013-01-14 13:00:00
EWR	2013	1	14	9	53.6	51.98	100	250	5.7539	\N	0	\N	6	2013-01-14 14:00:00
EWR	2013	1	14	10	55.94	53.06	90.03	270	5.7539	\N	0	1018.6	8	2013-01-14 15:00:00
EWR	2013	1	14	11	57.92	50	74.86	320	11.5078	\N	0	1018.6	9	2013-01-14 16:00:00
EWR	2013	1	14	12	55.94	44.96	66.52	340	11.5078	\N	0	1018.3	10	2013-01-14 17:00:00
EWR	2013	1	14	13	57.02	44.06	61.81	320	10.357019999999999	17.261699999999998	0	1019	10	2013-01-14 18:00:00
EWR	2013	1	14	14	55.94	37.94	50.72	340	12.658579999999999	20.714039999999997	0	1020	10	2013-01-14 19:00:00
EWR	2013	1	14	15	55.04	39.02	54.67	350	13.809359999999998	\N	0	1020.8	10	2013-01-14 20:00:00
EWR	2013	1	14	16	53.06	30.92	42.58	320	14.960139999999999	27.618719999999996	0	1021	10	2013-01-14 21:00:00
EWR	2013	1	14	17	51.08	30.92	45.81	330	10.357019999999999	\N	0	1021.8	10	2013-01-14 22:00:00
EWR	2013	1	14	18	51.08	30.02	44.16	330	11.5078	18.41248	0	1022.4	10	2013-01-14 23:00:00
EWR	2013	1	14	19	48.92	28.04	44.14	320	11.5078	\N	0	1024.5	10	2013-01-15 00:00:00
EWR	2013	1	14	20	48.02	26.96	43.67	330	12.658579999999999	\N	0	1024.6	10	2013-01-15 01:00:00
EWR	2013	1	14	21	44.06	30.92	59.64	330	17.261699999999998	\N	0	1025.1	10	2013-01-15 02:00:00
EWR	2013	1	14	22	41	35.06	79.21	340	11.5078	\N	0.04	1025.5	10	2013-01-15 03:00:00
EWR	2013	1	14	23	41	35.96	82.09	350	8.05546	\N	0.02	1025.7	10	2013-01-15 04:00:00
EWR	2013	1	15	0	39.92	35.96	85.61	50	4.60312	\N	0.02	1024.8	10	2013-01-15 05:00:00
EWR	2013	1	15	1	37.94	35.06	89.25	30	9.20624	\N	0.03	1025.3	10	2013-01-15 06:00:00
EWR	2013	1	15	2	37.4	35.6	93.14	50	12.658579999999999	\N	0.04	\N	9	2013-01-15 07:00:00
EWR	2013	1	15	3	37.4	35.6	93.14	50	10.357019999999999	\N	0	\N	10	2013-01-15 08:00:00
EWR	2013	1	15	4	35.96	32	85.37	360	8.05546	\N	0	1024.9	10	2013-01-15 09:00:00
EWR	2013	1	15	5	35.96	30.92	81.72	360	10.357019999999999	\N	0	1025.2	10	2013-01-15 10:00:00
EWR	2013	1	15	6	37.04	30.02	75.5	360	8.05546	\N	0	1026	10	2013-01-15 11:00:00
EWR	2013	1	15	7	37.04	28.04	69.63	10	9.20624	\N	0	1026.5	10	2013-01-15 12:00:00
EWR	2013	1	15	8	37.04	28.04	69.63	10	12.658579999999999	\N	0	1027.4	10	2013-01-15 13:00:00
EWR	2013	1	15	9	37.04	26.96	66.6	10	13.809359999999998	\N	0	1027.2	10	2013-01-15 14:00:00
EWR	2013	1	15	10	37.04	26.06	64.17	20	10.357019999999999	\N	0	1027.7	10	2013-01-15 15:00:00
EWR	2013	1	15	11	39.02	24.98	56.77	360	11.5078	\N	0	1026.8	10	2013-01-15 16:00:00
EWR	2013	1	15	12	39.02	26.06	59.37	20	8.05546	\N	0	1025.4	10	2013-01-15 17:00:00
EWR	2013	1	15	13	39.02	24.98	56.77	330	8.05546	\N	0	1025.2	10	2013-01-15 18:00:00
EWR	2013	1	15	14	39.02	26.06	59.37	350	9.20624	\N	0	1024.9	10	2013-01-15 19:00:00
EWR	2013	1	15	15	39.02	26.06	59.37	350	9.20624	\N	0	1025.4	10	2013-01-15 20:00:00
EWR	2013	1	15	16	39.02	24.98	56.77	340	8.05546	\N	0	1025.5	10	2013-01-15 21:00:00
EWR	2013	1	15	17	39.02	26.06	59.37	360	8.05546	\N	0	1025.1	10	2013-01-15 22:00:00
EWR	2013	1	15	18	39.02	26.06	59.37	360	5.7539	\N	0	1025.7	10	2013-01-15 23:00:00
EWR	2013	1	15	19	37.94	26.06	61.94	10	4.60312	\N	0	1025	10	2013-01-16 00:00:00
EWR	2013	1	15	20	37.94	24.98	59.22	20	6.904679999999999	\N	0	1025.3	10	2013-01-16 01:00:00
EWR	2013	1	15	21	37.94	26.96	64.29	30	5.7539	\N	0	1024.1	10	2013-01-16 02:00:00
EWR	2013	1	15	22	37.04	28.94	72.24	20	8.05546	\N	0	1023.7	9	2013-01-16 03:00:00
EWR	2013	1	15	23	35.96	30.02	78.79	20	9.20624	\N	0.02	1023.3	8	2013-01-16 04:00:00
EWR	2013	1	16	0	33.98	30.92	88.42	20	10.357019999999999	\N	0.05	1023.1	6	2013-01-16 05:00:00
EWR	2013	1	16	1	33.08	30.92	91.66	20	12.658579999999999	\N	0.07	1021.9	6	2013-01-16 06:00:00
EWR	2013	1	16	2	33.08	30.92	91.66	20	10.357019999999999	\N	0.06	1021.6	5	2013-01-16 07:00:00
EWR	2013	1	16	3	33.08	32	95.75	360	11.5078	\N	0.13	1020.3	4	2013-01-16 08:00:00
EWR	2013	1	16	4	32	32	100	20	8.05546	\N	0.15	\N	4	2013-01-16 09:00:00
EWR	2013	1	16	5	32	32	100	20	5.7539	\N	0.09	1018.7	4	2013-01-16 10:00:00
EWR	2013	1	16	6	33.8	32	95.75	10	6.904679999999999	\N	0.06	\N	4	2013-01-16 11:00:00
EWR	2013	1	16	7	33.8	32	95.75	30	8.05546	\N	0.03	\N	2	2013-01-16 12:00:00
EWR	2013	1	16	8	33.8	32	95.75	40	8.05546	\N	0.02	\N	3	2013-01-16 13:00:00
EWR	2013	1	16	9	33.98	33.08	96.46	340	6.904679999999999	\N	0	1015.2	3	2013-01-16 14:00:00
EWR	2013	1	16	10	33.98	32	92.36	350	5.7539	\N	0.01	1015.5	3	2013-01-16 15:00:00
EWR	2013	1	16	11	33.98	33.08	96.46	330	5.7539	\N	0.02	1014.3	3	2013-01-16 16:00:00
EWR	2013	1	16	12	33.98	33.08	96.46	30	5.7539	\N	0	1012.2	3	2013-01-16 17:00:00
EWR	2013	1	16	13	35.06	33.08	92.4	70	5.7539	\N	0.01	1009	3	2013-01-16 18:00:00
EWR	2013	1	16	14	35.6	33.98	95.79	360	11.5078	\N	0	\N	3	2013-01-16 19:00:00
EWR	2013	1	16	15	35.96	33.98	93.08	\N	6.904679999999999	\N	0	\N	6	2013-01-16 20:00:00
EWR	2013	1	16	16	35.06	33.98	95.79	\N	5.7539	\N	0	1012.9	6	2013-01-16 21:00:00
EWR	2013	1	16	17	35.96	33.98	93.08	230	8.05546	\N	0	\N	6	2013-01-16 22:00:00
EWR	2013	1	16	18	35.96	33.98	92.43	210	10.357019999999999	\N	0	1012.6	7	2013-01-16 23:00:00
EWR	2013	1	16	19	35.96	33.98	93.08	240	12.658579999999999	\N	0	\N	8	2013-01-17 00:00:00
EWR	2013	1	16	20	37.4	33.98	88.57	250	12.658579999999999	\N	0	\N	9	2013-01-17 01:00:00
EWR	2013	1	16	21	37.4	33.98	88.57	250	10.357019999999999	\N	0	\N	10	2013-01-17 02:00:00
EWR	2013	1	16	22	35.96	33.98	92.43	230	9.20624	\N	0	1013.1	10	2013-01-17 03:00:00
EWR	2013	1	16	23	37.04	33.98	88.57	250	6.904679999999999	\N	0	1013.2	10	2013-01-17 04:00:00
EWR	2013	1	17	0	37.94	33.08	82.46	250	9.20624	\N	0	1013.6	10	2013-01-17 05:00:00
EWR	2013	1	17	1	39.02	32	75.69	250	10.357019999999999	\N	0	1013.7	10	2013-01-17 06:00:00
EWR	2013	1	17	2	37.94	33.08	82.46	220	10.357019999999999	\N	0	1014.2	10	2013-01-17 07:00:00
EWR	2013	1	17	3	37.94	33.08	82.46	230	9.20624	\N	0	1013.9	10	2013-01-17 08:00:00
EWR	2013	1	17	4	39.02	30.92	72.46	260	6.904679999999999	\N	0	1013.5	10	2013-01-17 09:00:00
EWR	2013	1	17	5	39.02	30.02	69.86	270	9.20624	\N	0	1014.5	10	2013-01-17 10:00:00
EWR	2013	1	17	6	37.94	30.02	72.87	270	8.05546	\N	0	1015.8	10	2013-01-17 11:00:00
EWR	2013	1	17	7	39.02	28.04	64.43	310	9.20624	\N	0	1016.7	10	2013-01-17 12:00:00
EWR	2013	1	17	8	39.02	28.04	64.43	280	8.05546	\N	0	1017.9	10	2013-01-17 13:00:00
EWR	2013	1	17	9	42.08	28.94	59.36	270	6.904679999999999	\N	0	1018.1	10	2013-01-17 14:00:00
EWR	2013	1	17	10	42.08	28.04	57.22	310	12.658579999999999	\N	0	1018.2	10	2013-01-17 15:00:00
EWR	2013	1	17	11	42.98	26.96	52.87	300	11.5078	\N	0	1017.7	10	2013-01-17 16:00:00
EWR	2013	1	17	12	46.04	26.96	47.05	330	12.658579999999999	\N	0	1017.5	10	2013-01-17 17:00:00
EWR	2013	1	17	13	44.06	26.06	48.87	300	11.5078	\N	0	1017.5	10	2013-01-17 18:00:00
EWR	2013	1	17	14	42.98	24.98	48.7	300	12.658579999999999	\N	0	1017.4	10	2013-01-17 19:00:00
EWR	2013	1	17	15	42.98	24.98	48.7	320	8.05546	17.261699999999998	0	1017.7	10	2013-01-17 20:00:00
EWR	2013	1	17	16	42.08	24.08	48.56	350	9.20624	\N	0	1018.3	10	2013-01-17 21:00:00
EWR	2013	1	17	17	41	24.98	52.56	360	6.904679999999999	\N	0	1018.4	10	2013-01-17 22:00:00
EWR	2013	1	17	18	41	24.08	50.63	\N	3.4523399999999995	\N	0	1019	10	2013-01-17 23:00:00
EWR	2013	1	17	19	41	24.98	52.56	310	5.7539	\N	0	1018.8	10	2013-01-18 00:00:00
EWR	2013	1	17	20	39.02	23	52.26	350	11.5078	\N	0	1018	10	2013-01-18 01:00:00
EWR	2013	1	17	21	37.94	24.98	59.22	360	13.809359999999998	\N	0	1017.7	10	2013-01-18 02:00:00
EWR	2013	1	17	22	37.04	23	56.48	360	9.20624	\N	0	1016.6	10	2013-01-18 03:00:00
EWR	2013	1	17	23	35.96	26.06	66.97	30	9.20624	\N	0	1016.9	10	2013-01-18 04:00:00
EWR	2013	1	18	0	35.06	23	61.08	40	10.357019999999999	\N	0	1016.9	10	2013-01-18 05:00:00
EWR	2013	1	18	1	33.08	21.92	63.17	20	12.658579999999999	\N	0	1018.3	10	2013-01-18 06:00:00
EWR	2013	1	18	2	30.92	19.04	60.97	10	12.658579999999999	\N	0	1019.2	10	2013-01-18 07:00:00
EWR	2013	1	18	3	30.02	17.06	58.08	20	9.20624	\N	0	1019.2	10	2013-01-18 08:00:00
EWR	2013	1	18	4	30.02	17.06	58.08	360	5.7539	\N	0	1020.5	10	2013-01-18 09:00:00
EWR	2013	1	18	5	30.02	15.98	55.42	340	12.658579999999999	\N	0	1022.5	10	2013-01-18 10:00:00
EWR	2013	1	18	6	28.94	15.08	55.69	350	12.658579999999999	\N	0	1024.3	10	2013-01-18 11:00:00
EWR	2013	1	18	7	28.04	12.92	52.57	330	21.864819999999998	32.22184	0	1026.3	10	2013-01-18 12:00:00
EWR	2013	1	18	8	28.04	8.06	42.32	340	16.11092	24.166379999999997	0	1028	10	2013-01-18 13:00:00
EWR	2013	1	18	9	28.94	6.98	38.85	310	16.11092	26.46794	0	1030.1	10	2013-01-18 14:00:00
EWR	2013	1	18	10	30.02	5	33.97	330	14.960139999999999	\N	0	1030.6	10	2013-01-18 15:00:00
EWR	2013	1	18	11	30.92	6.98	35.84	300	12.658579999999999	21.864819999999998	0	1030.6	10	2013-01-18 16:00:00
EWR	2013	1	18	12	30.92	5	32.75	300	10.357019999999999	\N	0	1030.3	10	2013-01-18 17:00:00
EWR	2013	1	18	13	30.92	1.94	28.44	340	16.11092	24.166379999999997	0	1030.7	10	2013-01-18 18:00:00
EWR	2013	1	18	14	30.92	3.02	29.9	330	9.20624	16.11092	0	1030.6	10	2013-01-18 19:00:00
EWR	2013	1	18	15	30.92	1.94	28.44	310	10.357019999999999	\N	0	1030.8	10	2013-01-18 20:00:00
EWR	2013	1	18	16	28.94	1.94	30.82	270	10.357019999999999	\N	0	1031.5	10	2013-01-18 21:00:00
EWR	2013	1	18	17	28.94	3.02	32.41	250	8.05546	\N	0	1032.2	10	2013-01-18 22:00:00
EWR	2013	1	18	18	26.96	5	38.5	220	5.7539	\N	0	1032.3	10	2013-01-18 23:00:00
EWR	2013	1	18	19	28.04	8.06	42.32	200	8.05546	\N	0	1032.3	10	2013-01-19 00:00:00
EWR	2013	1	18	20	28.94	8.96	42.48	180	8.05546	\N	0	1031.5	10	2013-01-19 01:00:00
EWR	2013	1	18	21	28.04	10.94	48.15	210	6.904679999999999	\N	0	1031.7	10	2013-01-19 02:00:00
EWR	2013	1	18	22	28.94	10.94	46.41	190	8.05546	\N	0	1030.8	10	2013-01-19 03:00:00
EWR	2013	1	18	23	28.94	12.02	48.69	180	9.20624	\N	0	1029.4	10	2013-01-19 04:00:00
EWR	2013	1	19	0	28.04	12.92	52.57	190	10.357019999999999	\N	0	1029.4	10	2013-01-19 05:00:00
EWR	2013	1	19	1	28.04	12.02	50.52	210	11.5078	\N	0	1029.2	10	2013-01-19 06:00:00
EWR	2013	1	19	2	28.94	14	53.13	200	13.809359999999998	\N	0	1028.5	10	2013-01-19 07:00:00
EWR	2013	1	19	3	30.02	15.98	55.42	200	13.809359999999998	\N	0	1027.4	10	2013-01-19 08:00:00
EWR	2013	1	19	4	28.94	17.06	60.69	210	9.20624	\N	0	1027.1	10	2013-01-19 09:00:00
EWR	2013	1	19	5	30.02	19.04	63.24	220	10.357019999999999	\N	0	1026.5	10	2013-01-19 10:00:00
EWR	2013	1	19	6	30.92	21.02	66.34	210	10.357019999999999	\N	0	1026.3	10	2013-01-19 11:00:00
EWR	2013	1	19	7	32	21.92	65.97	230	13.809359999999998	\N	0	1026	10	2013-01-19 12:00:00
EWR	2013	1	19	8	35.06	24.08	63.91	210	18.41248	24.166379999999997	0	1025.8	10	2013-01-19 13:00:00
EWR	2013	1	19	9	37.94	24.98	59.22	220	17.261699999999998	\N	0	1025.4	10	2013-01-19 14:00:00
EWR	2013	1	19	10	42.98	24.98	48.7	220	23.0156	28.769499999999997	0	1024.1	10	2013-01-19 15:00:00
EWR	2013	1	19	11	46.04	24.98	43.34	230	20.714039999999997	\N	0	1022	10	2013-01-19 16:00:00
EWR	2013	1	19	12	48.02	24.98	40.22	220	23.0156	27.618719999999996	0	1020.4	10	2013-01-19 17:00:00
EWR	2013	1	19	13	50	24.08	35.98	220	18.41248	27.618719999999996	0	1019.4	10	2013-01-19 18:00:00
EWR	2013	1	19	14	51.08	23	33.04	220	19.56326	25.317159999999998	0	1018.7	10	2013-01-19 19:00:00
EWR	2013	1	19	15	51.98	23	31.96	220	19.56326	25.317159999999998	0	1018.1	10	2013-01-19 20:00:00
EWR	2013	1	19	16	50	26.06	39.07	200	12.658579999999999	\N	0	1017.6	10	2013-01-19 21:00:00
EWR	2013	1	19	17	48.02	26.96	43.67	200	13.809359999999998	\N	0	1017.5	10	2013-01-19 22:00:00
EWR	2013	1	19	18	46.94	26.96	45.48	200	14.960139999999999	23.0156	0	1017.2	10	2013-01-19 23:00:00
EWR	2013	1	19	19	46.94	26.96	45.48	210	12.658579999999999	24.166379999999997	0	1016.9	10	2013-01-20 00:00:00
EWR	2013	1	19	20	44.96	26.96	49.02	210	18.41248	\N	0	1016.1	10	2013-01-20 01:00:00
EWR	2013	1	19	21	44.96	26.96	49.02	210	18.41248	26.46794	0	1015.3	10	2013-01-20 02:00:00
EWR	2013	1	19	22	44.06	28.04	53.03	220	17.261699999999998	23.0156	0	1014.4	10	2013-01-20 03:00:00
EWR	2013	1	19	23	42.98	28.04	55.27	220	16.11092	25.317159999999998	0	1013.4	10	2013-01-20 04:00:00
EWR	2013	1	20	0	41	28.04	59.65	200	11.5078	\N	0	1012.1	10	2013-01-20 05:00:00
EWR	2013	1	20	1	39.92	28.94	64.54	190	9.20624	\N	0	1011.3	10	2013-01-20 06:00:00
EWR	2013	1	20	2	39.02	28.94	66.85	220	10.357019999999999	\N	0	1010.9	10	2013-01-20 07:00:00
EWR	2013	1	20	3	37.04	28.94	72.24	200	6.904679999999999	\N	0	1010.1	10	2013-01-20 08:00:00
EWR	2013	1	20	4	39.02	28.94	66.85	180	4.60312	\N	0	1008.9	10	2013-01-20 09:00:00
EWR	2013	1	20	5	39.02	28.94	66.85	200	9.20624	\N	0	1008.1	10	2013-01-20 10:00:00
EWR	2013	1	20	6	39.02	28.94	66.85	200	8.05546	\N	0	1007.5	10	2013-01-20 11:00:00
EWR	2013	1	20	7	39.92	28.94	64.54	220	9.20624	\N	0	1007.3	10	2013-01-20 12:00:00
EWR	2013	1	20	8	44.96	28.04	51.24	230	11.5078	\N	0	1007.6	10	2013-01-20 13:00:00
EWR	2013	1	20	9	48.92	28.04	44.14	230	16.11092	24.166379999999997	0	1007.5	10	2013-01-20 14:00:00
EWR	2013	1	20	10	53.96	28.04	36.63	240	19.56326	29.920279999999998	0	1006.9	10	2013-01-20 15:00:00
EWR	2013	1	20	11	53.96	26.96	35.04	250	19.56326	41.428079999999994	0	1006	10	2013-01-20 16:00:00
EWR	2013	1	20	12	55.94	24.08	28.93	260	20.714039999999997	39.12652	0	1005.5	10	2013-01-20 17:00:00
EWR	2013	1	20	13	53.96	19.04	25.12	260	25.317159999999998	34.523399999999995	0	1006	10	2013-01-20 18:00:00
EWR	2013	1	20	14	53.06	14	20.87	250	26.46794	37.975739999999995	0	1006.9	10	2013-01-20 19:00:00
EWR	2013	1	20	15	51.98	14	21.72	290	23.0156	31.07106	0	1008.3	10	2013-01-20 20:00:00
EWR	2013	1	20	16	48.02	10.94	21.98	290	21.864819999999998	32.22184	0	1009.8	10	2013-01-20 21:00:00
EWR	2013	1	20	17	44.06	10.04	24.53	280	19.56326	34.523399999999995	0	1011.5	10	2013-01-20 22:00:00
EWR	2013	1	20	18	42.08	12.92	30.08	290	21.864819999999998	29.920279999999998	0	1012.7	10	2013-01-20 23:00:00
EWR	2013	1	20	19	39.02	12.02	32.55	300	14.960139999999999	23.0156	0	1014	10	2013-01-21 00:00:00
EWR	2013	1	20	20	37.04	14	38.38	310	17.261699999999998	26.46794	0	1015.3	10	2013-01-21 01:00:00
EWR	2013	1	20	21	33.98	12.02	39.72	310	12.658579999999999	\N	0	1015.9	10	2013-01-21 02:00:00
EWR	2013	1	20	22	32	10.94	40.99	310	16.11092	\N	0	1016.9	10	2013-01-21 03:00:00
EWR	2013	1	20	23	30.02	10.04	42.66	320	12.658579999999999	18.41248	0	1017.6	10	2013-01-21 04:00:00
EWR	2013	1	21	0	28.94	8.06	40.79	310	11.5078	\N	0	1017.8	10	2013-01-21 05:00:00
EWR	2013	1	21	1	28.04	8.06	42.32	320	8.05546	\N	0	1018.6	10	2013-01-21 06:00:00
EWR	2013	1	21	2	28.04	6.98	40.31	290	8.05546	\N	0	1018.7	10	2013-01-21 07:00:00
EWR	2013	1	21	3	26.96	6.08	40.45	250	5.7539	\N	0	1018.8	10	2013-01-21 08:00:00
EWR	2013	1	21	4	26.06	6.98	43.74	240	5.7539	\N	0	1018.8	10	2013-01-21 09:00:00
EWR	2013	1	21	5	26.96	8.96	46.08	250	6.904679999999999	\N	0	1018.8	10	2013-01-21 10:00:00
EWR	2013	1	21	6	26.06	8.96	47.82	260	6.904679999999999	\N	0	1019	10	2013-01-21 11:00:00
EWR	2013	1	21	7	26.06	8.96	47.82	270	3.4523399999999995	\N	0	1019	10	2013-01-21 12:00:00
EWR	2013	1	21	8	26.96	8.06	44.25	260	5.7539	\N	0	1019.1	10	2013-01-21 13:00:00
EWR	2013	1	21	9	28.04	8.96	44.07	230	3.4523399999999995	\N	0	1019.2	10	2013-01-21 14:00:00
EWR	2013	1	21	10	28.94	8.96	42.48	0	0	\N	0	1018.3	10	2013-01-21 15:00:00
EWR	2013	1	21	11	30.02	8.96	40.65	180	6.904679999999999	\N	0	1016.8	10	2013-01-21 16:00:00
EWR	2013	1	21	12	30.92	10.04	41.13	170	8.05546	\N	0	1015.2	10	2013-01-21 17:00:00
EWR	2013	1	21	13	32	10.04	39.38	240	9.20624	\N	0	1014.7	10	2013-01-21 18:00:00
EWR	2013	1	21	14	32	10.94	40.99	190	8.05546	\N	0	1014	10	2013-01-21 19:00:00
EWR	2013	1	21	15	30.92	12.02	44.92	200	6.904679999999999	\N	0	1012.8	10	2013-01-21 20:00:00
EWR	2013	1	21	16	32	12.02	43	0	0	\N	0	1012.2	10	2013-01-21 21:00:00
EWR	2013	1	21	17	32	12.92	44.74	160	3.4523399999999995	\N	0	1012.3	10	2013-01-21 22:00:00
EWR	2013	1	21	18	32	12.92	44.74	0	0	\N	0	1011.6	10	2013-01-21 23:00:00
EWR	2013	1	21	19	32	14	46.92	300	8.05546	\N	0	1011.9	10	2013-01-22 00:00:00
EWR	2013	1	21	20	30.02	17.06	58.08	330	9.20624	\N	0	1011.8	10	2013-01-22 01:00:00
EWR	2013	1	21	21	30.02	15.98	55.42	260	9.20624	\N	0	1011.4	10	2013-01-22 02:00:00
EWR	2013	1	21	22	28.04	17.06	62.97	300	16.11092	\N	0	1010.7	10	2013-01-22 03:00:00
EWR	2013	1	21	23	26.96	12.92	54.95	290	12.658579999999999	\N	0	1010.7	10	2013-01-22 04:00:00
EWR	2013	1	22	0	26.06	6.08	41.98	290	10.357019999999999	19.56326	0	1010.7	10	2013-01-22 05:00:00
EWR	2013	1	22	1	24.98	6.98	45.74	270	13.809359999999998	18.41248	0	1011.4	10	2013-01-22 06:00:00
EWR	2013	1	22	2	24.08	6.98	47.49	280	18.41248	26.46794	0	1011.8	10	2013-01-22 07:00:00
EWR	2013	1	22	3	23	6.98	49.69	280	16.11092	25.317159999999998	0	1012.3	10	2013-01-22 08:00:00
EWR	2013	1	22	4	21.02	6.98	54.03	290	16.11092	\N	0	1013.4	10	2013-01-22 09:00:00
EWR	2013	1	22	5	19.94	6.08	54.3	290	14.960139999999999	21.864819999999998	0	1014.5	10	2013-01-22 10:00:00
EWR	2013	1	22	6	19.94	5	51.68	280	13.809359999999998	\N	0	1015.4	10	2013-01-22 11:00:00
EWR	2013	1	22	7	19.94	6.8	57.41	280	16.11092	\N	0	\N	9	2013-01-22 12:00:00
EWR	2013	1	22	8	21.02	3.02	45.07	280	24.166379999999997	29.920279999999998	0	1017.3	10	2013-01-22 13:00:00
EWR	2013	1	22	9	21.02	-2.02	35.6	300	24.166379999999997	35.67418	0	1017.6	10	2013-01-22 14:00:00
EWR	2013	1	22	10	21.92	-2.92	32.83	270	18.41248	28.769499999999997	0	1017.8	10	2013-01-22 15:00:00
EWR	2013	1	22	11	23	-5.98	27.09	300	21.864819999999998	32.22184	0	1017.3	10	2013-01-22 16:00:00
EWR	2013	1	22	12	23	-7.06	25.71	270	25.317159999999998	33.37262	0	1016.8	10	2013-01-22 17:00:00
EWR	2013	1	22	13	23	-5.98	27.09	290	19.56326	26.46794	0	1016.9	10	2013-01-22 18:00:00
EWR	2013	1	22	14	23	-5.98	27.09	280	19.56326	27.618719999999996	0	1017.3	10	2013-01-22 19:00:00
EWR	2013	1	22	15	21.02	-7.06	27.95	290	21.864819999999998	29.920279999999998	0	1018.1	10	2013-01-22 20:00:00
EWR	2013	1	22	16	19.04	-5.98	32.05	290	14.960139999999999	26.46794	0	1019.1	10	2013-01-22 21:00:00
EWR	2013	1	22	17	19.04	-5.08	33.47	280	13.809359999999998	\N	0	1020.3	10	2013-01-22 22:00:00
EWR	2013	1	22	18	17.96	-5.08	35.05	280	19.56326	24.166379999999997	0	1021	10	2013-01-22 23:00:00
EWR	2013	1	22	19	17.06	-5.98	34.89	290	20.714039999999997	26.46794	0	1021.7	10	2013-01-23 00:00:00
EWR	2013	1	22	20	15.98	-5.98	36.56	290	21.864819999999998	27.618719999999996	0	1022.2	10	2013-01-23 01:00:00
EWR	2013	1	22	21	15.98	-0.94	46.51	300	14.960139999999999	21.864819999999998	0	1022.7	10	2013-01-23 02:00:00
EWR	2013	1	22	22	15.08	-7.06	36.09	300	16.11092	23.0156	0	1023.3	10	2013-01-23 03:00:00
EWR	2013	1	22	23	14	-7.96	36.21	280	14.960139999999999	21.864819999999998	0	1023.1	10	2013-01-23 04:00:00
EWR	2013	1	23	0	12.92	-7.06	39.67	280	12.658579999999999	21.864819999999998	0	1022.9	10	2013-01-23 05:00:00
EWR	2013	1	23	1	12.92	-7.96	37.97	270	11.5078	\N	0	1023.3	10	2013-01-23 06:00:00
EWR	2013	1	23	2	12.02	-7.06	41.28	270	10.357019999999999	18.41248	0	1023.7	10	2013-01-23 07:00:00
EWR	2013	1	23	3	12.02	-5.98	43.5	270	8.05546	\N	0	1023.5	10	2013-01-23 08:00:00
EWR	2013	1	23	4	12.02	-5.08	45.43	270	9.20624	\N	0	1023.6	10	2013-01-23 09:00:00
EWR	2013	1	23	5	10.94	-4	50.19	270	10.357019999999999	\N	0	1023.8	10	2013-01-23 10:00:00
EWR	2013	1	23	6	10.94	-4	50.19	270	11.5078	\N	0	1024	10	2013-01-23 11:00:00
EWR	2013	1	23	7	12.02	-2.92	50.37	270	11.5078	\N	0	1024.2	10	2013-01-23 12:00:00
EWR	2013	1	23	8	14	-2.02	48.18	270	12.658579999999999	\N	0	1024.5	10	2013-01-23 13:00:00
EWR	2013	1	23	9	15.98	-2.02	44.19	270	11.5078	\N	0	1024.9	10	2013-01-23 14:00:00
EWR	2013	1	23	10	17.96	-5.08	35.05	310	14.960139999999999	20.714039999999997	0	1024.4	10	2013-01-23 15:00:00
EWR	2013	1	23	11	19.94	-5.98	30.84	320	12.658579999999999	17.261699999999998	0	1023.4	10	2013-01-23 16:00:00
EWR	2013	1	23	12	19.94	-5.98	30.84	300	13.809359999999998	\N	0	1022.3	10	2013-01-23 17:00:00
EWR	2013	1	23	13	19.94	-4	33.92	290	11.5078	\N	0	1021.8	10	2013-01-23 18:00:00
EWR	2013	1	23	14	19.04	-5.98	32.05	270	17.261699999999998	21.864819999999998	0	1021.8	10	2013-01-23 19:00:00
EWR	2013	1	23	15	19.04	-5.98	32.05	300	14.960139999999999	20.714039999999997	0	1021.9	10	2013-01-23 20:00:00
EWR	2013	1	23	16	17.96	-5.98	33.57	310	11.5078	\N	0	1022.1	10	2013-01-23 21:00:00
EWR	2013	1	23	17	17.06	-5.98	34.89	280	12.658579999999999	\N	0	1022.7	10	2013-01-23 22:00:00
EWR	2013	1	23	18	17.06	-4	38.38	300	8.05546	\N	0	1023.1	10	2013-01-23 23:00:00
EWR	2013	1	23	19	15.98	-2.02	44.19	310	5.7539	\N	0	1023	10	2013-01-24 00:00:00
EWR	2013	1	23	20	15.98	-0.04	48.52	300	8.05546	\N	0	1022.7	10	2013-01-24 01:00:00
EWR	2013	1	23	21	15.08	-0.04	50.46	270	5.7539	\N	0	1022.9	10	2013-01-24 02:00:00
EWR	2013	1	23	22	15.08	-0.04	50.46	280	4.60312	\N	0	1022.9	10	2013-01-24 03:00:00
EWR	2013	1	23	23	15.08	1.04	53.07	280	4.60312	\N	0	1022.5	10	2013-01-24 04:00:00
EWR	2013	1	24	0	14	-0.04	52.9	270	4.60312	\N	0	1021.6	10	2013-01-24 05:00:00
EWR	2013	1	24	1	14	1.04	55.64	310	3.4523399999999995	\N	0	1021	10	2013-01-24 06:00:00
EWR	2013	1	24	2	12.92	1.94	60.84	310	4.60312	\N	0	1020.7	10	2013-01-24 07:00:00
EWR	2013	1	24	3	12.02	1.94	63.31	30	4.60312	\N	0	1020.7	10	2013-01-24 08:00:00
EWR	2013	1	24	4	12.92	5	70.07	20	5.7539	\N	0	1020.8	10	2013-01-24 09:00:00
EWR	2013	1	24	5	14	3.02	61	350	5.7539	\N	0	1021.5	10	2013-01-24 10:00:00
EWR	2013	1	24	6	12.92	3.02	63.97	10	9.20624	\N	0	1022.2	10	2013-01-24 11:00:00
EWR	2013	1	24	7	14	3.02	61	350	9.20624	\N	0	1022.7	10	2013-01-24 12:00:00
EWR	2013	1	24	8	17.06	1.94	50.79	350	11.5078	\N	0	1023.3	10	2013-01-24 13:00:00
EWR	2013	1	24	9	19.04	-0.04	42.52	350	13.809359999999998	\N	0	1023.8	10	2013-01-24 14:00:00
EWR	2013	1	24	10	21.92	-5.08	29.61	310	18.41248	21.864819999999998	0	1024.2	10	2013-01-24 15:00:00
EWR	2013	1	24	11	23	-9.04	23.34	320	23.0156	32.22184	0	1024	10	2013-01-24 16:00:00
EWR	2013	1	24	12	24.08	-7.96	23.52	310	24.166379999999997	34.523399999999995	0	1023.8	10	2013-01-24 17:00:00
EWR	2013	1	24	13	24.08	-7.06	24.57	330	28.769499999999997	40.2773	0	1024	10	2013-01-24 18:00:00
EWR	2013	1	24	14	24.08	-5.98	25.89	320	25.317159999999998	35.67418	0	1024.9	10	2013-01-24 19:00:00
EWR	2013	1	24	15	24.08	-5.08	27.04	310	16.11092	29.920279999999998	0	1025.8	10	2013-01-24 20:00:00
EWR	2013	1	24	16	21.92	-4	31.18	320	21.864819999999998	28.769499999999997	0	1026.6	10	2013-01-24 21:00:00
EWR	2013	1	24	17	21.02	-2.92	34.11	300	17.261699999999998	26.46794	0	1027.6	10	2013-01-24 22:00:00
EWR	2013	1	24	18	19.94	-4	33.92	290	18.41248	32.22184	0	1028.5	10	2013-01-24 23:00:00
EWR	2013	1	24	19	19.04	-2.92	37.11	300	20.714039999999997	27.618719999999996	0	1029	10	2013-01-25 00:00:00
EWR	2013	1	24	20	17.96	-2.02	40.57	290	20.714039999999997	35.67418	0	1028.6	10	2013-01-25 01:00:00
EWR	2013	1	24	21	17.96	-0.94	42.69	300	12.658579999999999	27.618719999999996	0	1029	10	2013-01-25 02:00:00
EWR	2013	1	24	22	17.06	-2.02	42.17	290	17.261699999999998	35.67418	0	1029.5	10	2013-01-25 03:00:00
EWR	2013	1	24	23	15.98	-2.92	42.34	290	13.809359999999998	20.714039999999997	0	1029.7	10	2013-01-25 04:00:00
EWR	2013	1	25	0	15.08	-2.92	44.04	290	16.11092	23.0156	0	1029.7	10	2013-01-25 05:00:00
EWR	2013	1	25	1	14	-2.92	46.17	300	12.658579999999999	20.714039999999997	0	1030.3	10	2013-01-25 06:00:00
EWR	2013	1	25	2	14	-2.02	48.18	290	16.11092	\N	0	1030.3	10	2013-01-25 07:00:00
EWR	2013	1	25	3	12.92	-0.94	53.17	290	12.658579999999999	23.0156	0	1030.4	10	2013-01-25 08:00:00
EWR	2013	1	25	4	12.92	-0.94	53.17	260	5.7539	\N	0	1030.3	10	2013-01-25 09:00:00
EWR	2013	1	25	5	12.92	-0.04	55.47	280	13.809359999999998	\N	0	1030	10	2013-01-25 10:00:00
EWR	2013	1	25	6	12.92	1.04	58.34	280	6.904679999999999	\N	0	1030	10	2013-01-25 11:00:00
EWR	2013	1	25	7	14	1.94	58.02	\N	4.60312	\N	0	1029.5	10	2013-01-25 12:00:00
EWR	2013	1	25	8	15.98	3.02	55.95	300	6.904679999999999	\N	0	1029.9	10	2013-01-25 13:00:00
EWR	2013	1	25	9	17.96	3.02	51.36	280	6.904679999999999	\N	0	1030.3	10	2013-01-25 14:00:00
EWR	2013	1	25	10	19.94	1.94	44.88	280	5.7539	\N	0	1029.3	10	2013-01-25 15:00:00
EWR	2013	1	25	11	21.02	1.94	42.87	10	4.60312	\N	0	1027	10	2013-01-25 16:00:00
EWR	2013	1	25	12	21.92	1.94	41.26	260	4.60312	\N	0	1026.1	10	2013-01-25 17:00:00
EWR	2013	1	25	13	23	1.04	37.81	240	4.60312	\N	0	1024.5	10	2013-01-25 18:00:00
EWR	2013	1	25	14	24.08	3.02	39.62	220	6.904679999999999	\N	0	1023.7	10	2013-01-25 19:00:00
EWR	2013	1	25	15	24.08	3.02	39.62	220	8.05546	\N	0	1023.2	10	2013-01-25 20:00:00
EWR	2013	1	25	16	23	8.06	54.61	210	8.05546	\N	0	\N	1.5	2013-01-25 21:00:00
EWR	2013	1	25	17	21.2	15.98	85.63	240	11.5078	\N	0.01	\N	1.5	2013-01-25 22:00:00
EWR	2013	1	25	18	19.4	15.98	87.64	210	5.7539	\N	0.01	\N	1.5	2013-01-25 23:00:00
EWR	2013	1	25	19	19.4	15.8	85.63	250	9.20624	\N	0.02	\N	2	2013-01-26 00:00:00
EWR	2013	1	25	20	19.94	15.8	85.63	250	8.05546	\N	0	\N	7	2013-01-26 01:00:00
EWR	2013	1	25	21	17.96	14	85.51	260	6.904679999999999	\N	0	\N	9	2013-01-26 02:00:00
EWR	2013	1	25	22	17.96	12.92	80.29	280	6.904679999999999	\N	0	1018.6	9	2013-01-26 03:00:00
EWR	2013	1	25	23	17.06	12.92	83.47	250	4.60312	\N	0	1018.4	10	2013-01-26 04:00:00
EWR	2013	1	26	0	15.98	12.92	87.47	280	6.904679999999999	\N	0	1018.4	10	2013-01-26 05:00:00
EWR	2013	1	26	1	15.08	12.02	87.42	290	8.05546	\N	0	1018.5	10	2013-01-26 06:00:00
EWR	2013	1	26	2	14	10.94	87.36	280	3.4523399999999995	\N	0	1018	10	2013-01-26 07:00:00
EWR	2013	1	26	3	14	10.04	83.92	290	5.7539	\N	0	1017.8	10	2013-01-26 08:00:00
EWR	2013	1	26	4	15.98	8.96	73.34	300	9.20624	\N	0	1018.1	10	2013-01-26 09:00:00
EWR	2013	1	26	5	15.08	8.96	76.27	300	9.20624	\N	0	1018.9	10	2013-01-26 10:00:00
EWR	2013	1	26	6	15.98	8.06	70.43	300	4.60312	\N	0	1019.5	10	2013-01-26 11:00:00
EWR	2013	1	26	7	17.06	8.06	67.21	300	6.904679999999999	\N	0	1020.6	10	2013-01-26 12:00:00
EWR	2013	1	26	8	19.04	8.06	61.72	310	10.357019999999999	\N	0	1021	10	2013-01-26 13:00:00
EWR	2013	1	26	9	19.94	8.96	61.85	310	10.357019999999999	\N	0	1021.5	10	2013-01-26 14:00:00
EWR	2013	1	26	10	23	10.04	57.03	290	11.5078	\N	0	1021.7	10	2013-01-26 15:00:00
EWR	2013	1	26	11	23	10.04	57.03	290	11.5078	18.41248	0	1021.7	10	2013-01-26 16:00:00
EWR	2013	1	26	12	24.08	8.96	51.93	320	9.20624	\N	0	1020.6	10	2013-01-26 17:00:00
EWR	2013	1	26	13	26.96	10.04	48.36	290	13.809359999999998	24.166379999999997	0	1020.8	10	2013-01-26 18:00:00
EWR	2013	1	26	14	28.04	10.04	46.26	300	11.5078	\N	0	1021	10	2013-01-26 19:00:00
EWR	2013	1	26	15	28.04	6.98	40.31	300	16.11092	24.166379999999997	0	1021.5	10	2013-01-26 20:00:00
EWR	2013	1	26	16	26.96	6.08	40.45	300	14.960139999999999	21.864819999999998	0	1022.2	10	2013-01-26 21:00:00
EWR	2013	1	26	17	24.98	5	41.8	320	19.56326	28.769499999999997	0	1023.7	10	2013-01-26 22:00:00
EWR	2013	1	26	18	24.08	5	43.4	320	14.960139999999999	27.618719999999996	0	1025	10	2013-01-26 23:00:00
EWR	2013	1	26	19	23	6.08	47.7	310	13.809359999999998	\N	0	1025.5	10	2013-01-27 00:00:00
EWR	2013	1	26	20	23	6.08	47.7	320	17.261699999999998	24.166379999999997	0	1026.5	10	2013-01-27 01:00:00
EWR	2013	1	26	21	21.92	6.98	52.01	320	13.809359999999998	\N	0	1027.5	10	2013-01-27 02:00:00
EWR	2013	1	26	22	21.02	6.98	54.03	320	12.658579999999999	\N	0	1028.5	10	2013-01-27 03:00:00
EWR	2013	1	26	23	19.94	6.98	56.56	300	10.357019999999999	\N	0	1028.8	10	2013-01-27 04:00:00
EWR	2013	1	27	0	19.04	8.06	61.72	290	8.05546	\N	0	1029.1	10	2013-01-27 05:00:00
EWR	2013	1	27	1	19.04	8.06	61.72	290	9.20624	\N	0	1030	10	2013-01-27 06:00:00
EWR	2013	1	27	2	19.04	8.96	64.28	290	8.05546	\N	0.33	1030.3	10	2013-01-27 07:00:00
EWR	2013	1	27	3	19.04	8.96	64.28	280	6.904679999999999	\N	0.03	1030.3	10	2013-01-27 08:00:00
EWR	2013	1	27	4	19.04	8.96	64.28	260	8.05546	\N	0.05	1030.4	10	2013-01-27 09:00:00
EWR	2013	1	27	5	19.04	8.06	61.72	270	6.904679999999999	\N	0.26	1031.1	10	2013-01-27 10:00:00
EWR	2013	1	27	6	17.06	8.06	67.21	240	4.60312	\N	0.17	1031.6	10	2013-01-27 11:00:00
EWR	2013	1	27	7	19.04	8.96	64.28	260	8.05546	\N	0.32	1032.4	10	2013-01-27 12:00:00
EWR	2013	1	27	8	21.92	10.04	59.69	270	8.05546	\N	0	1032.6	10	2013-01-27 13:00:00
EWR	2013	1	27	9	26.96	12.92	54.95	310	11.5078	\N	0	1033.2	10	2013-01-27 14:00:00
EWR	2013	1	27	10	30.02	10.04	42.66	310	12.658579999999999	\N	0	1033.7	10	2013-01-27 15:00:00
EWR	2013	1	27	11	32	8.96	37.52	340	14.960139999999999	20.714039999999997	0	1032.6	10	2013-01-27 16:00:00
EWR	2013	1	27	12	33.98	10.94	37.86	300	14.960139999999999	\N	0	1032.1	10	2013-01-27 17:00:00
EWR	2013	1	27	13	35.06	8.96	33.19	300	12.658579999999999	\N	0	1031.5	10	2013-01-27 18:00:00
EWR	2013	1	27	14	35.96	8.06	30.76	320	11.5078	\N	0	1031.4	10	2013-01-27 19:00:00
EWR	2013	1	27	15	35.96	8.06	30.76	280	8.05546	\N	0	1031.6	10	2013-01-27 20:00:00
EWR	2013	1	27	16	33.98	8.06	33.28	310	10.357019999999999	17.261699999999998	0	1032.3	10	2013-01-27 21:00:00
EWR	2013	1	27	17	33.08	8.06	34.5	320	6.904679999999999	\N	0	1032.5	10	2013-01-27 22:00:00
EWR	2013	1	27	18	32	8.06	36.03	\N	3.4523399999999995	\N	0	1033	10	2013-01-27 23:00:00
EWR	2013	1	27	19	32	8.06	36.03	0	0	\N	0	1032.7	10	2013-01-28 00:00:00
EWR	2013	1	27	20	30.92	8.96	39.19	\N	4.60312	\N	0	1032.9	10	2013-01-28 01:00:00
EWR	2013	1	27	21	30.02	8.96	40.65	0	0	\N	0	1032.7	10	2013-01-28 02:00:00
EWR	2013	1	27	22	30.02	10.04	42.66	\N	3.4523399999999995	\N	0	1032.4	10	2013-01-28 03:00:00
EWR	2013	1	27	23	28.04	10.04	46.26	0	0	\N	0	1032.4	10	2013-01-28 04:00:00
EWR	2013	1	28	0	26.96	12.02	52.81	0	0	\N	0	1032.7	10	2013-01-28 05:00:00
EWR	2013	1	28	1	26.06	12.92	57.04	0	0	\N	0	1032.2	10	2013-01-28 06:00:00
EWR	2013	1	28	2	26.06	12.92	57.04	0	0	\N	0	1031.4	10	2013-01-28 07:00:00
EWR	2013	1	28	3	26.96	15.98	62.83	0	0	\N	0	1030.9	10	2013-01-28 08:00:00
EWR	2013	1	28	4	28.04	15.08	57.79	240	3.4523399999999995	\N	0	1030.5	10	2013-01-28 09:00:00
EWR	2013	1	28	5	28.04	15.98	60.1	0	0	\N	0	1029.8	10	2013-01-28 10:00:00
EWR	2013	1	28	6	30.02	17.06	58.08	0	0	\N	0	1029.7	10	2013-01-28 11:00:00
EWR	2013	1	28	7	30.02	19.04	63.24	160	4.60312	\N	0	1029.6	7	2013-01-28 12:00:00
EWR	2013	1	28	8	30.92	19.94	63.36	190	4.60312	\N	0	1029.5	6	2013-01-28 13:00:00
EWR	2013	1	28	9	30.2	26.06	85	230	6.904679999999999	\N	0	\N	2	2013-01-28 14:00:00
EWR	2013	1	28	10	30.92	28.4	92.92	180	8.05546	\N	0	\N	2.5	2013-01-28 15:00:00
EWR	2013	1	28	11	33.8	28.94	86.39	200	10.357019999999999	\N	0	\N	2.5	2013-01-28 16:00:00
EWR	2013	1	28	12	33.8	30.2	88.37	170	9.20624	\N	0	\N	2.5	2013-01-28 17:00:00
EWR	2013	1	28	13	33.8	30.92	91.66	170	8.05546	\N	0	\N	2.5	2013-01-28 18:00:00
EWR	2013	1	28	14	33.8	32	95.75	170	6.904679999999999	\N	0	\N	2	2013-01-28 19:00:00
EWR	2013	1	28	15	33.98	32	92.36	\N	4.60312	\N	0	1019.6	2	2013-01-28 20:00:00
EWR	2013	1	28	16	33.98	32	92.36	220	11.5078	19.56326	0	1018.7	2	2013-01-28 21:00:00
EWR	2013	1	28	17	33.98	33.08	96.46	230	11.5078	\N	0	\N	5	2013-01-28 22:00:00
EWR	2013	1	28	18	33.98	33.08	96.46	230	8.05546	\N	0	1018.3	5	2013-01-28 23:00:00
EWR	2013	1	28	19	33.98	33.08	96.46	230	6.904679999999999	\N	0	1017.8	5	2013-01-29 00:00:00
EWR	2013	1	28	20	33.98	33.08	96.46	240	9.20624	\N	0	1017.2	5	2013-01-29 01:00:00
EWR	2013	1	28	21	35.06	33.08	92.4	240	9.20624	\N	0	1016.5	5	2013-01-29 02:00:00
EWR	2013	1	28	22	35.6	33.8	93.08	240	11.5078	\N	0	\N	5	2013-01-29 03:00:00
EWR	2013	1	28	23	35.6	33.8	93.08	230	8.05546	\N	0	\N	5	2013-01-29 04:00:00
EWR	2013	1	29	0	35.06	33.98	95.79	210	5.7539	\N	0	1016.2	5	2013-01-29 05:00:00
EWR	2013	1	29	1	35.96	33.98	92.43	240	6.904679999999999	\N	0	1016.3	5	2013-01-29 06:00:00
EWR	2013	1	29	2	37.04	35.06	92.46	240	3.4523399999999995	\N	0	1016.2	7	2013-01-29 07:00:00
EWR	2013	1	29	3	37.04	35.96	95.82	220	6.904679999999999	\N	0	1016.1	7	2013-01-29 08:00:00
EWR	2013	1	29	4	37.94	37.04	96.52	0	0	\N	0	1017.1	7	2013-01-29 09:00:00
EWR	2013	1	29	5	37.94	35.96	92.49	0	0	\N	0	1018.4	7	2013-01-29 10:00:00
EWR	2013	1	29	6	37.94	35.96	92.49	0	0	\N	0	1018.8	6	2013-01-29 11:00:00
EWR	2013	1	29	7	42.08	39.02	88.81	0	0	\N	0	1019.4	6	2013-01-29 12:00:00
EWR	2013	1	29	8	42.98	39.92	88.85	200	3.4523399999999995	\N	0	1019.6	6	2013-01-29 13:00:00
EWR	2013	1	29	9	48.02	42.08	79.79	0	0	\N	0	1020.1	7	2013-01-29 14:00:00
EWR	2013	1	29	10	51.98	39.92	63.33	10	5.7539	\N	0	1020.1	9	2013-01-29 15:00:00
EWR	2013	1	29	11	51.98	39.92	63.33	90	5.7539	\N	0	1019.1	10	2013-01-29 16:00:00
EWR	2013	1	29	12	51.08	39.02	63.22	110	8.05546	\N	0	1019.2	10	2013-01-29 17:00:00
EWR	2013	1	29	13	44.96	39.02	79.54	120	11.5078	\N	0	1018.9	6	2013-01-29 18:00:00
EWR	2013	1	29	14	44.96	39.02	79.54	\N	6.904679999999999	\N	0	1019.4	6	2013-01-29 19:00:00
EWR	2013	1	29	15	46.4	39.2	75.84	120	5.7539	\N	0	\N	5	2013-01-29 20:00:00
EWR	2013	1	29	16	44.6	39.2	82.31	140	5.7539	\N	0	\N	4	2013-01-29 21:00:00
EWR	2013	1	29	17	44.6	39.92	85.25	90	6.904679999999999	\N	0	\N	4	2013-01-29 22:00:00
EWR	2013	1	29	18	42.98	39.92	88.85	\N	4.60312	\N	0.04	1020.2	4	2013-01-29 23:00:00
EWR	2013	1	29	19	42.98	41	93.3	130	5.7539	\N	0.02	\N	4	2013-01-30 00:00:00
EWR	2013	1	29	20	42.98	41	93.3	0	0	\N	0	\N	4	2013-01-30 01:00:00
EWR	2013	1	29	21	44.6	41	92.65	0	0	\N	0	\N	4	2013-01-30 02:00:00
EWR	2013	1	29	22	42.98	41	92.65	0	0	\N	0	1019	3	2013-01-30 03:00:00
EWR	2013	1	29	23	44.06	42.08	92.69	60	4.60312	\N	0	1018.8	3	2013-01-30 04:00:00
EWR	2013	1	30	0	42.8	41	95.9	30	6.904679999999999	\N	0	\N	2.5	2013-01-30 05:00:00
EWR	2013	1	30	1	41	39.92	95.9	30	6.904679999999999	\N	0	1016.5	2.5	2013-01-30 06:00:00
EWR	2013	1	30	2	41	39.92	95.9	20	4.60312	\N	0	1015.8	2.5	2013-01-30 07:00:00
EWR	2013	1	30	3	41	39.92	100	20	6.904679999999999	\N	0	\N	0.5	2013-01-30 08:00:00
EWR	2013	1	30	4	39.92	39.92	100	20	6.904679999999999	\N	0	\N	0.25	2013-01-30 09:00:00
EWR	2013	1	30	5	39.92	39.92	100	20	4.60312	\N	0	1013.4	0.25	2013-01-30 10:00:00
EWR	2013	1	30	6	39.92	39.92	100	350	3.4523399999999995	\N	0	1012.4	0.25	2013-01-30 11:00:00
EWR	2013	1	30	7	42.08	42.08	100	0	0	\N	0	\N	0.12	2013-01-30 12:00:00
EWR	2013	1	30	8	44.6	44.6	100	50	4.60312	\N	0	\N	0.25	2013-01-30 13:00:00
EWR	2013	1	30	9	44.96	44.96	100	50	6.904679999999999	\N	0	\N	0.25	2013-01-30 14:00:00
EWR	2013	1	30	10	50	46.94	100	80	5.7539	\N	0	\N	1	2013-01-30 15:00:00
EWR	2013	1	30	11	51.98	48.02	87.37	90	5.7539	\N	0	\N	3	2013-01-30 16:00:00
EWR	2013	1	30	12	55.04	50	83.08	70	3.4523399999999995	\N	0	1005.7	3	2013-01-30 17:00:00
EWR	2013	1	30	13	64.04	57.02	77.92	180	10.357019999999999	\N	0	1003.9	10	2013-01-30 18:00:00
EWR	2013	1	30	14	64.4	57.2	80.55	180	12.658579999999999	18.41248	0.01	\N	10	2013-01-30 19:00:00
EWR	2013	1	30	15	55.94	51.08	83.69	100	8.05546	\N	0	1002.8	10	2013-01-30 20:00:00
EWR	2013	1	30	16	59	53.06	80.64	130	9.20624	\N	0	1002.1	10	2013-01-30 21:00:00
EWR	2013	1	30	17	59	53.06	82.12	150	8.05546	\N	0	\N	10	2013-01-30 22:00:00
EWR	2013	1	30	18	60.8	53.96	93.05	160	6.904679999999999	\N	0.02	\N	10	2013-01-30 23:00:00
EWR	2013	1	30	19	51.98	50	92.93	50	3.4523399999999995	\N	0	1001.1	9	2013-01-31 00:00:00
EWR	2013	1	30	20	51.98	51.08	96.73	0	0	\N	0	999.5	10	2013-01-31 01:00:00
EWR	2013	1	30	21	59	55.04	86.69	160	6.904679999999999	\N	0	997.5	10	2013-01-31 02:00:00
EWR	2013	1	30	22	62.06	57.02	83.54	180	14.960139999999999	\N	0	995.9	10	2013-01-31 03:00:00
EWR	2013	1	30	23	62.06	57.02	83.54	180	21.864819999999998	33.37262	0.01	994.1	10	2013-01-31 04:00:00
EWR	2013	1	31	0	62.6	59	89.7	190	25.317159999999998	36.82496	0.09	\N	6	2013-01-31 05:00:00
EWR	2013	1	31	1	62.06	59	93.79	190	23.0156	39.12652	0.07	\N	6	2013-01-31 06:00:00
EWR	2013	1	31	2	62.06	57.92	86.29	180	31.07106	47.181979999999996	0.05	986.4	6	2013-01-31 07:00:00
EWR	2013	1	31	3	62.06	59	89.7	180	27.618719999999996	44.880419999999994	0.19	983.9	3	2013-01-31 08:00:00
EWR	2013	1	31	4	60.8	59	93.79	230	40.2773	58.68978	0.3	\N	6	2013-01-31 09:00:00
EWR	2013	1	31	5	59	55.4	87.83	220	18.41248	27.618719999999996	0.06	\N	10	2013-01-31 10:00:00
EWR	2013	1	31	6	57.2	53.6	87.74	270	42.57886	55.23743999999999	0.03	\N	10	2013-01-31 11:00:00
EWR	2013	1	31	7	48.2	35.6	61.52	260	31.07106	37.975739999999995	0.01	\N	10	2013-01-31 12:00:00
EWR	2013	1	31	8	46.04	30.02	53.33	270	39.12652	48.33275999999999	0	992.3	10	2013-01-31 13:00:00
EWR	2013	1	31	9	44.06	24.98	46.73	270	32.22184	51.78509999999999	0	994.2	10	2013-01-31 14:00:00
EWR	2013	1	31	10	44.96	21.02	38.23	260	33.37262	41.428079999999994	0	995.4	10	2013-01-31 15:00:00
EWR	2013	1	31	11	46.04	19.04	33.73	280	33.37262	43.729639999999996	0	996.3	10	2013-01-31 16:00:00
EWR	2013	1	31	12	46.04	19.04	33.73	260	31.07106	42.57886	0	996.6	10	2013-01-31 17:00:00
EWR	2013	1	31	13	44.96	19.04	35.14	250	23.0156	42.57886	0	997.9	10	2013-01-31 18:00:00
EWR	2013	1	31	14	44.06	17.96	34.72	260	27.618719999999996	42.57886	0	999.1	10	2013-01-31 19:00:00
EWR	2013	1	31	15	42.08	15.08	33.06	270	26.46794	44.880419999999994	0	1000.4	10	2013-01-31 20:00:00
EWR	2013	1	31	16	39.02	17.06	40.57	270	31.07106	40.2773	0	1002.2	10	2013-01-31 21:00:00
EWR	2013	1	31	17	35.96	12.92	38.2	260	28.769499999999997	43.729639999999996	0	1004.5	10	2013-01-31 22:00:00
EWR	2013	1	31	18	35.06	12.92	39.58	250	24.166379999999997	29.920279999999998	0	1006	10	2013-01-31 23:00:00
EWR	2013	1	31	19	33.08	15.08	47.1	270	20.714039999999997	31.07106	0	1006.6	10	2013-02-01 00:00:00
EWR	2013	1	31	20	32	19.04	58.37	250	17.261699999999998	26.46794	0	1007.3	10	2013-02-01 01:00:00
EWR	2013	1	31	21	32	10.04	39.38	260	28.769499999999997	36.82496	0	1008	10	2013-02-01 02:00:00
EWR	2013	1	31	22	30.92	6.98	35.84	260	27.618719999999996	35.67418	0	1008.5	10	2013-02-01 03:00:00
EWR	2013	1	31	23	30.02	8.06	39.03	260	14.960139999999999	\N	0	1008.9	10	2013-02-01 04:00:00
EWR	2013	2	1	0	28.94	10.94	46.41	250	19.56326	23.0156	0	1009.6	10	2013-02-01 05:00:00
EWR	2013	2	1	1	28.94	10.94	46.41	240	11.5078	\N	0	1009.9	10	2013-02-01 06:00:00
EWR	2013	2	1	2	28.04	10.94	48.15	240	9.20624	\N	0	1009.7	10	2013-02-01 07:00:00
EWR	2013	2	1	3	28.04	10.94	48.15	220	13.809359999999998	\N	0	1009.6	10	2013-02-01 08:00:00
EWR	2013	2	1	4	28.04	10.94	48.15	230	17.261699999999998	\N	0	1009.8	10	2013-02-01 09:00:00
EWR	2013	2	1	5	28.04	12.02	50.52	220	13.809359999999998	20.714039999999997	0	1010.4	10	2013-02-01 10:00:00
EWR	2013	2	1	6	28.94	12.02	48.69	260	9.20624	\N	0	1010.9	10	2013-02-01 11:00:00
EWR	2013	2	1	7	28.94	12.02	48.69	280	10.357019999999999	\N	0	1010.9	10	2013-02-01 12:00:00
EWR	2013	2	1	8	30.02	10.94	44.41	270	10.357019999999999	\N	0	1011.3	10	2013-02-01 13:00:00
EWR	2013	2	1	9	30.02	10.04	42.66	290	17.261699999999998	23.0156	0	1012.1	10	2013-02-01 14:00:00
EWR	2013	2	1	10	30.02	6.98	37.17	300	17.261699999999998	27.618719999999996	0	1012.1	10	2013-02-01 15:00:00
EWR	2013	2	1	11	32	5	31.35	330	25.317159999999998	32.22184	0	1011.8	10	2013-02-01 16:00:00
EWR	2013	2	1	12	30.92	5	32.75	320	18.41248	27.618719999999996	0	1012.1	10	2013-02-01 17:00:00
EWR	2013	2	1	13	33.98	3.02	26.43	280	20.714039999999997	31.07106	0	1012.8	10	2013-02-01 18:00:00
EWR	2013	2	1	14	33.08	1.94	26.07	300	14.960139999999999	33.37262	0	1013.8	10	2013-02-01 19:00:00
EWR	2013	2	1	15	30.92	6.08	34.4	310	19.56326	\N	0	1015.4	10	2013-02-01 20:00:00
EWR	2013	2	1	16	30.2	14	55.12	280	26.46794	\N	0	\N	10	2013-02-01 21:00:00
EWR	2013	2	1	17	26.96	15.98	62.83	280	18.41248	26.46794	0	1018.6	10	2013-02-01 22:00:00
EWR	2013	2	1	18	26.06	15.08	62.7	260	13.809359999999998	\N	0	1020	10	2013-02-01 23:00:00
EWR	2013	2	1	19	24.98	17.06	71.47	280	14.960139999999999	\N	0	1021.1	10	2013-02-02 00:00:00
EWR	2013	2	1	20	24.98	14	62.55	270	14.960139999999999	\N	0	1022	10	2013-02-02 01:00:00
EWR	2013	2	1	21	24.98	12.02	57.33	270	11.5078	\N	0	1022.7	10	2013-02-02 02:00:00
EWR	2013	2	1	22	24.08	10.04	54.51	270	12.658579999999999	\N	0	1023.3	10	2013-02-02 03:00:00
EWR	2013	2	1	23	24.08	8.06	49.87	260	10.357019999999999	\N	0	1024.2	10	2013-02-02 04:00:00
EWR	2013	2	2	0	23	6.98	49.69	250	11.5078	\N	0	1024.4	10	2013-02-02 05:00:00
EWR	2013	2	2	1	21.92	6.08	49.92	260	13.809359999999998	\N	0	1024.8	10	2013-02-02 06:00:00
EWR	2013	2	2	2	21.92	6.08	49.92	260	12.658579999999999	\N	0	1025.3	10	2013-02-02 07:00:00
EWR	2013	2	2	3	21.02	6.08	51.86	260	14.960139999999999	\N	0	1025.5	10	2013-02-02 08:00:00
EWR	2013	2	2	4	19.94	5	51.68	260	14.960139999999999	\N	0	1025.5	10	2013-02-02 09:00:00
EWR	2013	2	2	5	19.04	5	53.71	260	11.5078	\N	0	1025.3	10	2013-02-02 10:00:00
EWR	2013	2	2	6	19.04	5	53.71	240	8.05546	\N	0	1026	10	2013-02-02 11:00:00
EWR	2013	2	2	7	19.94	6.98	56.56	260	10.357019999999999	\N	0	1026.5	10	2013-02-02 12:00:00
EWR	2013	2	2	8	21.02	6.08	51.86	250	10.357019999999999	\N	0	1026.2	10	2013-02-02 13:00:00
EWR	2013	2	2	9	24.08	6.08	45.59	260	6.904679999999999	\N	0	1025.7	10	2013-02-02 14:00:00
EWR	2013	2	2	10	26.06	6.08	41.98	\N	6.904679999999999	\N	0	1024.8	10	2013-02-02 15:00:00
EWR	2013	2	2	11	28.94	3.92	33.78	230	13.809359999999998	19.56326	0	1023.5	10	2013-02-02 16:00:00
EWR	2013	2	2	12	28.04	3.02	33.62	230	17.261699999999998	\N	0	1022.5	10	2013-02-02 17:00:00
EWR	2013	2	2	13	30.02	3.92	32.32	220	16.11092	19.56326	0	1021.3	10	2013-02-02 18:00:00
EWR	2013	2	2	14	30.02	3.92	32.32	220	13.809359999999998	\N	0	1020.5	10	2013-02-02 19:00:00
EWR	2013	2	2	15	28.94	3.92	33.78	240	12.658579999999999	20.714039999999997	0	1020	10	2013-02-02 20:00:00
EWR	2013	2	2	16	28.94	6.08	37.29	240	11.5078	\N	0	1019.4	10	2013-02-02 21:00:00
EWR	2013	2	2	17	28.04	6.98	40.31	260	10.357019999999999	19.56326	0	1019.3	10	2013-02-02 22:00:00
EWR	2013	2	2	18	28.04	8.06	42.32	250	6.904679999999999	\N	0	1019.2	10	2013-02-02 23:00:00
EWR	2013	2	2	19	26.96	12.02	52.81	230	10.357019999999999	\N	0	1019.3	10	2013-02-03 00:00:00
EWR	2013	2	2	20	24.98	19.04	77.82	290	9.20624	\N	0	1019.4	5	2013-02-03 01:00:00
EWR	2013	2	2	21	24.98	19.94	80.87	280	6.904679999999999	\N	0	1019.3	3	2013-02-03 02:00:00
EWR	2013	2	2	22	24.08	21.02	87.91	0	0	\N	0	1018.8	2	2013-02-03 03:00:00
EWR	2013	2	2	23	24.8	21.2	87.91	0	0	\N	0.01	\N	4	2013-02-03 04:00:00
EWR	2013	2	3	0	24.98	21.92	87.96	0	0	\N	0	\N	5	2013-02-03 05:00:00
EWR	2013	2	3	1	24.98	21.92	87.96	0	0	\N	0.01	1016.5	4	2013-02-03 06:00:00
EWR	2013	2	3	2	24.98	23	92.05	20	3.4523399999999995	\N	0	1015.7	4	2013-02-03 07:00:00
EWR	2013	2	3	3	24.08	21.92	91.32	20	4.60312	\N	0	1014.8	6	2013-02-03 08:00:00
EWR	2013	2	3	4	24.08	21.02	87.91	10	8.05546	\N	0	1014.1	6	2013-02-03 09:00:00
EWR	2013	2	3	5	24.98	21.02	84.67	20	6.904679999999999	\N	0	1014.1	9	2013-02-03 10:00:00
EWR	2013	2	3	6	24.8	19.4	80.8	360	5.7539	\N	0	\N	10	2013-02-03 11:00:00
EWR	2013	2	3	7	24.08	19.94	85.85	30	6.904679999999999	\N	0	\N	10	2013-02-03 12:00:00
EWR	2013	2	3	8	24.8	19.94	83.96	10	8.05546	\N	0	\N	10	2013-02-03 13:00:00
EWR	2013	2	3	9	26.96	21.2	79.77	350	9.20624	\N	0	\N	10	2013-02-03 14:00:00
EWR	2013	2	3	10	26.96	21.02	78	20	6.904679999999999	\N	0	1013.3	10	2013-02-03 15:00:00
EWR	2013	2	3	11	28.04	21.02	74.61	350	8.05546	\N	0	1012	10	2013-02-03 16:00:00
EWR	2013	2	3	12	28.94	19.94	68.68	\N	3.4523399999999995	\N	0	1010.8	10	2013-02-03 17:00:00
EWR	2013	2	3	13	30.92	21.2	68.83	270	6.904679999999999	\N	0	\N	10	2013-02-03 18:00:00
EWR	2013	2	3	14	32	19.04	58.37	310	8.05546	\N	0	1009.3	10	2013-02-03 19:00:00
EWR	2013	2	3	15	32	17.96	55.72	300	10.357019999999999	\N	0	1009.2	10	2013-02-03 20:00:00
EWR	2013	2	3	16	30.92	15.98	53.44	290	9.20624	17.261699999999998	0	1009	10	2013-02-03 21:00:00
EWR	2013	2	3	17	30.02	15.98	55.42	280	11.5078	\N	0	1009.3	10	2013-02-03 22:00:00
EWR	2013	2	3	18	28.94	17.06	60.69	260	6.904679999999999	\N	0	1009.7	10	2013-02-03 23:00:00
EWR	2013	2	3	19	28.04	17.06	62.97	270	8.05546	\N	0	1009.9	10	2013-02-04 00:00:00
EWR	2013	2	3	20	26.96	17.06	65.84	270	5.7539	\N	0	1010.1	10	2013-02-04 01:00:00
EWR	2013	2	3	21	26.06	17.06	68.33	270	5.7539	\N	0	1009.9	10	2013-02-04 02:00:00
EWR	2013	2	3	22	26.96	17.96	68.44	230	5.7539	\N	0	1009.7	10	2013-02-04 03:00:00
EWR	2013	2	3	23	26.96	17.96	68.44	230	9.20624	\N	0	1009.7	10	2013-02-04 04:00:00
EWR	2013	2	4	0	26.96	19.04	71.69	260	10.357019999999999	\N	0	1009.8	10	2013-02-04 05:00:00
EWR	2013	2	4	1	26.06	17.06	68.33	280	14.960139999999999	\N	0	1010.2	10	2013-02-04 06:00:00
EWR	2013	2	4	2	26.06	12.02	54.82	290	18.41248	26.46794	0	1010.8	10	2013-02-04 07:00:00
EWR	2013	2	4	3	24.98	10.04	52.5	280	16.11092	20.714039999999997	0	1011.3	10	2013-02-04 08:00:00
EWR	2013	2	4	4	24.08	10.04	54.51	270	16.11092	\N	0	1012.4	10	2013-02-04 09:00:00
EWR	2013	2	4	5	23	8.96	54.34	270	14.960139999999999	\N	0	1013.2	10	2013-02-04 10:00:00
EWR	2013	2	4	6	23	8.96	54.34	260	11.5078	\N	0	1013.9	10	2013-02-04 11:00:00
EWR	2013	2	4	7	24.08	8.96	51.93	270	14.960139999999999	\N	0	1014.6	10	2013-02-04 12:00:00
EWR	2013	2	4	8	24.98	8.96	50.02	270	17.261699999999998	23.0156	0	1015	10	2013-02-04 13:00:00
EWR	2013	2	4	9	28.04	8.96	44.07	290	17.261699999999998	25.317159999999998	0	1015.3	10	2013-02-04 14:00:00
EWR	2013	2	4	10	30.02	6.98	37.17	280	18.41248	26.46794	0	1015	10	2013-02-04 15:00:00
EWR	2013	2	4	11	30.02	6.98	37.17	250	20.714039999999997	28.769499999999997	0	1014.7	10	2013-02-04 16:00:00
EWR	2013	2	4	12	30.92	8.06	37.63	290	20.714039999999997	26.46794	0	1014.2	10	2013-02-04 17:00:00
EWR	2013	2	4	13	32	6.98	34.31	260	18.41248	32.22184	0	1013.6	10	2013-02-04 18:00:00
EWR	2013	2	4	14	30.92	6.08	34.4	260	14.960139999999999	26.46794	0	1013.5	10	2013-02-04 19:00:00
EWR	2013	2	4	15	30.02	6.08	35.68	280	18.41248	26.46794	0	1013.7	10	2013-02-04 20:00:00
EWR	2013	2	4	16	28.94	6.08	37.29	260	16.11092	28.769499999999997	0	1013.9	10	2013-02-04 21:00:00
EWR	2013	2	4	17	28.94	6.98	38.85	260	13.809359999999998	17.261699999999998	0	1014.5	10	2013-02-04 22:00:00
EWR	2013	2	4	18	28.04	8.06	42.32	230	8.05546	\N	0	1015.2	10	2013-02-04 23:00:00
EWR	2013	2	4	19	28.04	8.96	44.07	250	5.7539	\N	0	1015.2	10	2013-02-05 00:00:00
EWR	2013	2	4	20	24.98	10.04	52.5	210	4.60312	\N	0	1015.1	10	2013-02-05 01:00:00
EWR	2013	2	4	21	28.04	10.94	48.15	220	3.4523399999999995	\N	0	1015.1	10	2013-02-05 02:00:00
EWR	2013	2	4	22	28.04	12.02	50.52	200	3.4523399999999995	\N	0	1015.1	10	2013-02-05 03:00:00
EWR	2013	2	4	23	28.94	14	53.13	\N	3.4523399999999995	\N	0	1014.7	10	2013-02-05 04:00:00
EWR	2013	2	5	0	28.04	21.02	74.61	210	6.904679999999999	\N	0	1014.2	10	2013-02-05 05:00:00
EWR	2013	2	5	1	28.04	23	81.11	0	0	\N	0	1014	9	2013-02-05 06:00:00
EWR	2013	2	5	2	28.04	24.08	84.87	0	0	\N	0	1013.7	9	2013-02-05 07:00:00
EWR	2013	2	5	3	28.04	24.08	84.87	0	0	\N	0	1013.6	6	2013-02-05 08:00:00
EWR	2013	2	5	4	28.04	24.98	88.12	0	0	\N	0.01	1013	7	2013-02-05 09:00:00
EWR	2013	2	5	5	28.94	24.98	84.93	30	3.4523399999999995	\N	0	1013.5	8	2013-02-05 10:00:00
EWR	2013	2	5	6	28.4	26.6	92.86	20	6.904679999999999	\N	0	\N	4	2013-02-05 11:00:00
EWR	2013	2	5	7	26.96	23	84.8	10	9.20624	\N	0	1014.3	6	2013-02-05 12:00:00
EWR	2013	2	5	8	28.04	24.08	84.87	20	9.20624	\N	0	1014.6	6	2013-02-05 13:00:00
EWR	2013	2	5	9	28.94	24.8	86.18	20	9.20624	\N	0	\N	6	2013-02-05 14:00:00
EWR	2013	2	5	10	28.94	24.98	86.18	10	9.20624	\N	0	\N	6	2013-02-05 15:00:00
EWR	2013	2	5	11	30.2	24.98	81.27	360	10.357019999999999	\N	0	\N	7	2013-02-05 16:00:00
EWR	2013	2	5	12	30.92	24.98	78.35	10	6.904679999999999	\N	0	1014.1	7	2013-02-05 17:00:00
EWR	2013	2	5	13	30.92	26.6	86.28	40	8.05546	\N	0	\N	6	2013-02-05 18:00:00
EWR	2013	2	5	14	30.92	26.06	81.95	10	6.904679999999999	\N	0	1012.9	7	2013-02-05 19:00:00
EWR	2013	2	5	15	30.92	26.06	81.95	50	3.4523399999999995	\N	0	1012.9	5	2013-02-05 20:00:00
EWR	2013	2	5	16	30.92	26.06	81.95	20	5.7539	\N	0	1012.9	5	2013-02-05 21:00:00
EWR	2013	2	5	17	30.92	26.06	81.95	20	5.7539	\N	0	1012.6	6	2013-02-05 22:00:00
EWR	2013	2	5	18	32	26.96	81.42	10	4.60312	\N	0	1013	4	2013-02-05 23:00:00
EWR	2013	2	5	19	30.92	28.04	88.92	10	4.60312	\N	0	1012.9	4	2013-02-06 00:00:00
EWR	2013	2	5	20	30.92	28.4	92.92	360	5.7539	\N	0.01	\N	3	2013-02-06 01:00:00
EWR	2013	2	5	21	30.92	28.94	92.26	20	4.60312	\N	0	1013	3	2013-02-06 02:00:00
EWR	2013	2	5	22	30.92	28.94	92.26	30	4.60312	\N	0	1013.2	3	2013-02-06 03:00:00
EWR	2013	2	5	23	32	30.02	92.29	0	0	\N	0	1013.3	3	2013-02-06 04:00:00
EWR	2013	2	6	0	32	30.02	92.29	340	4.60312	\N	0	1013.3	3	2013-02-06 05:00:00
EWR	2013	2	6	1	32	30.92	95.73	0	0	\N	0	1013.4	2	2013-02-06 06:00:00
EWR	2013	2	6	2	32	30.2	96.41	0	0	\N	0	\N	3	2013-02-06 07:00:00
EWR	2013	2	6	3	30.2	28.4	92.92	280	4.60312	\N	0	\N	3	2013-02-06 08:00:00
EWR	2013	2	6	4	30.02	28.04	92.23	260	6.904679999999999	\N	0	1014.5	3	2013-02-06 09:00:00
EWR	2013	2	6	5	30.2	26.6	88.82	280	6.904679999999999	\N	0	\N	5	2013-02-06 10:00:00
EWR	2013	2	6	6	30.92	26.96	85.05	260	5.7539	\N	0	1016.5	5	2013-02-06 11:00:00
EWR	2013	2	6	7	30.92	26.96	85.05	260	6.904679999999999	\N	0	1017.9	4	2013-02-06 12:00:00
EWR	2013	2	6	8	33.08	26.06	75.11	270	10.357019999999999	\N	0	1018.5	6	2013-02-06 13:00:00
EWR	2013	2	6	9	35.06	24.98	66.36	290	16.11092	\N	0	1019.3	9	2013-02-06 14:00:00
EWR	2013	2	6	10	37.94	24.98	59.22	280	13.809359999999998	19.56326	0	1019.5	10	2013-02-06 15:00:00
EWR	2013	2	6	11	39.02	21.92	49.93	290	13.809359999999998	21.864819999999998	0	1019.4	10	2013-02-06 16:00:00
EWR	2013	2	6	12	39.02	19.94	45.91	270	17.261699999999998	21.864819999999998	0	1019.4	10	2013-02-06 17:00:00
EWR	2013	2	6	13	39.02	21.02	48.07	290	9.20624	\N	0	1019.7	10	2013-02-06 18:00:00
EWR	2013	2	6	14	41	17.96	39.05	290	16.11092	21.864819999999998	0	1020.1	10	2013-02-06 19:00:00
EWR	2013	2	6	15	39.02	17.06	40.57	290	16.11092	24.166379999999997	0	1020.9	10	2013-02-06 20:00:00
EWR	2013	2	6	16	37.94	15.08	38.84	310	14.960139999999999	25.317159999999998	0	1021.8	10	2013-02-06 21:00:00
EWR	2013	2	6	17	37.04	14	38.38	310	10.357019999999999	18.41248	0	1023.2	10	2013-02-06 22:00:00
EWR	2013	2	6	18	35.96	12.92	38.2	320	11.5078	\N	0	1024.5	10	2013-02-06 23:00:00
EWR	2013	2	6	19	35.06	12.92	39.58	320	14.960139999999999	\N	0	1025.5	10	2013-02-07 00:00:00
EWR	2013	2	6	20	33.08	10.94	39.25	340	17.261699999999998	21.864819999999998	0	1026.4	10	2013-02-07 01:00:00
EWR	2013	2	6	21	32	6.98	34.31	350	13.809359999999998	\N	0	1026.9	10	2013-02-07 02:00:00
EWR	2013	2	6	22	30.92	3.92	31.16	340	13.809359999999998	\N	0	1027.8	10	2013-02-07 03:00:00
EWR	2013	2	6	23	28.94	3.02	32.41	350	13.809359999999998	\N	0	1027.9	10	2013-02-07 04:00:00
EWR	2013	2	7	0	28.94	3.92	33.78	340	10.357019999999999	\N	0	1028.2	10	2013-02-07 05:00:00
EWR	2013	2	7	1	26.06	3.92	38.03	10	6.904679999999999	\N	0	1028.8	10	2013-02-07 06:00:00
EWR	2013	2	7	2	26.06	5	39.96	350	8.05546	\N	0	1029.4	10	2013-02-07 07:00:00
EWR	2013	2	7	3	26.06	5	39.96	340	6.904679999999999	\N	0	1029.5	10	2013-02-07 08:00:00
EWR	2013	2	7	4	24.98	6.08	43.91	340	5.7539	\N	0	1030.6	10	2013-02-07 09:00:00
EWR	2013	2	7	5	26.06	6.08	41.98	360	6.904679999999999	\N	0	1030.7	10	2013-02-07 10:00:00
EWR	2013	2	7	6	26.06	6.98	43.74	10	4.60312	\N	0	1031.4	10	2013-02-07 11:00:00
EWR	2013	2	7	7	26.06	6.98	43.74	10	4.60312	\N	0	1032.6	10	2013-02-07 12:00:00
EWR	2013	2	7	8	28.04	6.98	40.31	360	6.904679999999999	\N	0	1032.8	10	2013-02-07 13:00:00
EWR	2013	2	7	9	28.04	8.06	42.32	20	6.904679999999999	\N	0	1032.8	10	2013-02-07 14:00:00
EWR	2013	2	7	10	30.02	8.06	39.03	20	10.357019999999999	\N	0	1033.2	10	2013-02-07 15:00:00
EWR	2013	2	7	11	30.92	8.96	39.19	0	0	\N	0	1032.3	10	2013-02-07 16:00:00
EWR	2013	2	7	12	32	10.04	39.38	80	5.7539	\N	0	1031.7	10	2013-02-07 17:00:00
EWR	2013	2	7	13	32	8.96	37.52	70	5.7539	\N	0	1031.3	10	2013-02-07 18:00:00
EWR	2013	2	7	14	33.08	8.96	35.92	\N	4.60312	\N	0	1030.7	10	2013-02-07 19:00:00
EWR	2013	2	7	15	33.08	10.04	37.7	90	6.904679999999999	\N	0	1030.3	10	2013-02-07 20:00:00
EWR	2013	2	7	16	33.08	8.06	34.5	110	5.7539	\N	0	1029.7	10	2013-02-07 21:00:00
EWR	2013	2	7	17	33.08	10.04	37.7	100	5.7539	\N	0	1029.9	10	2013-02-07 22:00:00
EWR	2013	2	7	18	32	15.98	51.15	80	6.904679999999999	\N	0	1030.2	10	2013-02-07 23:00:00
EWR	2013	2	7	19	32	19.04	58.37	60	5.7539	\N	0	1030.2	10	2013-02-08 00:00:00
EWR	2013	2	7	20	32	19.94	60.66	60	8.05546	\N	0	1029.6	10	2013-02-08 01:00:00
EWR	2013	2	7	21	33.08	21.92	63.17	50	6.904679999999999	\N	0	1029	10	2013-02-08 02:00:00
EWR	2013	2	7	22	33.08	21.92	63.17	40	6.904679999999999	\N	0	1028.2	10	2013-02-08 03:00:00
EWR	2013	2	7	23	33.8	23	66.11	40	6.904679999999999	\N	0	\N	10	2013-02-08 04:00:00
EWR	2013	2	8	0	35.06	24.98	66.36	60	6.904679999999999	\N	0	1026.1	10	2013-02-08 05:00:00
EWR	2013	2	8	1	35.06	26.06	69.4	60	9.20624	17.261699999999998	0	1025.2	10	2013-02-08 06:00:00
EWR	2013	2	8	2	35.06	26.06	69.4	60	10.357019999999999	\N	0	1024.2	10	2013-02-08 07:00:00
EWR	2013	2	8	3	35.06	26.96	72.03	50	10.357019999999999	21.864819999999998	0	1022.9	10	2013-02-08 08:00:00
EWR	2013	2	8	4	33.98	26.06	72.45	30	9.20624	\N	0	1022.3	10	2013-02-08 09:00:00
EWR	2013	2	8	5	33.98	26.06	72.45	30	10.357019999999999	\N	0	1021.5	10	2013-02-08 10:00:00
EWR	2013	2	8	6	33.08	28.94	84.56	30	13.809359999999998	\N	0	1020.2	3	2013-02-08 11:00:00
EWR	2013	2	8	7	33.8	30.92	91.66	40	12.658579999999999	\N	0.01	\N	3	2013-02-08 12:00:00
EWR	2013	2	8	8	33.98	32	92.36	30	11.5078	\N	0.02	1018.5	1	2013-02-08 13:00:00
EWR	2013	2	8	9	35.06	33.08	92.4	40	11.5078	\N	0.03	1016.9	1	2013-02-08 14:00:00
EWR	2013	2	8	10	35.6	33.8	93.08	40	16.11092	\N	0.04	\N	5	2013-02-08 15:00:00
EWR	2013	2	8	11	35.06	33.08	92.4	40	18.41248	27.618719999999996	0.04	1013.3	5	2013-02-08 16:00:00
EWR	2013	2	8	12	35.6	33.8	93.08	40	23.0156	29.920279999999998	0.07	\N	5	2013-02-08 17:00:00
EWR	2013	2	8	13	33.98	30.92	88.42	40	21.864819999999998	32.22184	0.09	\N	5	2013-02-08 18:00:00
EWR	2013	2	8	14	33.98	32	92.36	30	27.618719999999996	33.37262	0.04	\N	4	2013-02-08 19:00:00
EWR	2013	2	8	15	33.8	32	95.75	20	19.56326	\N	0.06	\N	2	2013-02-08 20:00:00
EWR	2013	2	8	16	33.8	32	95.73	20	17.261699999999998	\N	0.08	\N	2	2013-02-08 21:00:00
EWR	2013	2	8	17	32	30.92	95.73	10	19.56326	\N	0.06	\N	1	2013-02-08 22:00:00
EWR	2013	2	8	18	32	30.2	92.97	10	21.864819999999998	28.769499999999997	0.02	\N	2	2013-02-08 23:00:00
EWR	2013	2	8	19	30.92	28.94	92.92	10	23.0156	\N	0	\N	1.5	2013-02-09 00:00:00
EWR	2013	2	8	20	30.92	28.04	88.92	360	21.864819999999998	27.618719999999996	0	1004	2.5	2013-02-09 01:00:00
EWR	2013	2	8	21	30.92	28.04	88.92	310	13.809359999999998	25.317159999999998	0.01	1005.4	2.5	2013-02-09 02:00:00
EWR	2013	2	8	22	30.2	28.4	95.65	330	18.41248	26.46794	0.03	\N	1.5	2013-02-09 03:00:00
EWR	2013	2	8	23	28.4	26.6	92.86	340	19.56326	\N	0.11	\N	0.5	2013-02-09 04:00:00
EWR	2013	2	9	0	28.04	26.06	92.16	360	11.5078	\N	0.13	1008.2	0.5	2013-02-09 05:00:00
EWR	2013	2	9	1	28.04	26.96	95.65	350	11.5078	\N	0.09	1008.4	0.5	2013-02-09 06:00:00
EWR	2013	2	9	2	28.94	28.94	100	350	18.41248	\N	0.2	\N	1	2013-02-09 07:00:00
EWR	2013	2	9	3	30.02	28.4	100	330	13.809359999999998	\N	0.13	\N	10	2013-02-09 08:00:00
EWR	2013	2	9	4	30.2	26.96	88.22	320	13.809359999999998	\N	0	\N	9	2013-02-09 09:00:00
EWR	2013	2	9	5	30.2	24.8	80.07	310	16.11092	24.166379999999997	0	\N	10	2013-02-09 10:00:00
EWR	2013	2	9	6	30.02	23	74.81	280	10.357019999999999	\N	0	1011.9	10	2013-02-09 11:00:00
EWR	2013	2	9	7	28.4	21.2	74.08	300	23.0156	\N	0	\N	10	2013-02-09 12:00:00
EWR	2013	2	9	8	26.96	17.96	68.44	310	18.41248	27.618719999999996	0	1014.1	10	2013-02-09 13:00:00
EWR	2013	2	9	9	26.96	17.06	65.84	310	13.809359999999998	28.769499999999997	0	1015.2	10	2013-02-09 14:00:00
EWR	2013	2	9	10	28.04	15.98	60.1	310	19.56326	28.769499999999997	0	1016.5	10	2013-02-09 15:00:00
EWR	2013	2	9	11	28.94	15.98	57.92	320	28.769499999999997	35.67418	0	1016.8	10	2013-02-09 16:00:00
EWR	2013	2	9	12	30.92	15.08	51.38	320	19.56326	26.46794	0	1017.1	10	2013-02-09 17:00:00
EWR	2013	2	9	13	33.08	14	44.92	300	17.261699999999998	23.0156	0	1017.8	10	2013-02-09 18:00:00
EWR	2013	2	9	14	33.08	10.04	37.7	310	25.317159999999998	33.37262	0	1018.3	10	2013-02-09 19:00:00
EWR	2013	2	9	15	33.08	8.06	34.5	320	16.11092	29.920279999999998	0	1018.9	10	2013-02-09 20:00:00
EWR	2013	2	9	16	30.92	10.04	41.13	300	21.864819999999998	29.920279999999998	0	1020.1	10	2013-02-09 21:00:00
EWR	2013	2	9	17	30.02	8.06	39.03	320	18.41248	26.46794	0	1021.6	10	2013-02-09 22:00:00
EWR	2013	2	9	18	28.04	8.06	42.32	320	10.357019999999999	19.56326	0	1022.8	10	2013-02-09 23:00:00
EWR	2013	2	9	19	26.96	6.98	42.14	310	11.5078	26.46794	0	1024	10	2013-02-10 00:00:00
EWR	2013	2	9	20	24.98	6.98	45.74	310	12.658579999999999	23.0156	0	1025.4	10	2013-02-10 01:00:00
EWR	2013	2	9	21	24.08	6.98	47.49	310	11.5078	\N	0	1026.5	10	2013-02-10 02:00:00
EWR	2013	2	9	22	21.92	8.06	54.61	300	9.20624	\N	0	1027	10	2013-02-10 03:00:00
EWR	2013	2	9	23	19.94	6.98	56.56	310	6.904679999999999	\N	0	1027.8	10	2013-02-10 04:00:00
EWR	2013	2	10	0	19.94	6.98	56.56	310	11.5078	\N	0	1028.2	10	2013-02-10 05:00:00
EWR	2013	2	10	1	19.04	6.98	58.78	310	9.20624	\N	0	1028.4	10	2013-02-10 06:00:00
EWR	2013	2	10	2	19.04	6.98	58.78	310	10.357019999999999	\N	0	1028.5	10	2013-02-10 07:00:00
EWR	2013	2	10	3	19.04	6.98	58.78	330	6.904679999999999	\N	0	1028.5	10	2013-02-10 08:00:00
EWR	2013	2	10	4	17.06	8.06	67.21	250	4.60312	\N	0	1028.9	10	2013-02-10 09:00:00
EWR	2013	2	10	5	15.98	8.06	70.43	290	5.7539	\N	0	1029.7	10	2013-02-10 10:00:00
EWR	2013	2	10	6	15.98	6.98	67.07	350	4.60312	\N	0	1030.1	10	2013-02-10 11:00:00
EWR	2013	2	10	7	17.96	8.06	64.65	0	0	\N	0	1031	10	2013-02-10 12:00:00
EWR	2013	2	10	8	23	8.06	52.18	330	5.7539	\N	0	1031.8	10	2013-02-10 13:00:00
EWR	2013	2	10	9	26.06	8.96	47.82	360	3.4523399999999995	\N	0	1032.2	10	2013-02-10 14:00:00
EWR	2013	2	10	10	26.96	8.96	46.08	0	0	\N	0	1032.4	10	2013-02-10 15:00:00
EWR	2013	2	10	11	28.94	10.04	44.58	200	3.4523399999999995	\N	0	1031.8	10	2013-02-10 16:00:00
EWR	2013	2	10	12	32	8.96	37.52	0	0	\N	0	1030.4	10	2013-02-10 17:00:00
EWR	2013	2	10	13	33.98	12.92	41.33	0	0	\N	0	1029.8	10	2013-02-10 18:00:00
EWR	2013	2	10	14	35.06	14	41.51	210	3.4523399999999995	\N	0	1029.6	10	2013-02-10 19:00:00
EWR	2013	2	10	15	33.98	10.04	36.37	190	5.7539	\N	0	1029	10	2013-02-10 20:00:00
EWR	2013	2	10	16	33.98	10.94	37.86	190	4.60312	\N	0	1028.7	10	2013-02-10 21:00:00
EWR	2013	2	10	17	33.98	15.08	45.43	160	3.4523399999999995	\N	0	1029.1	10	2013-02-10 22:00:00
EWR	2013	2	10	18	32	17.96	55.72	170	4.60312	\N	0	1029	10	2013-02-10 23:00:00
EWR	2013	2	10	19	32	19.04	58.37	150	5.7539	\N	0	1028.9	10	2013-02-11 00:00:00
EWR	2013	2	10	20	32	19.94	60.66	0	0	\N	0	1028.5	10	2013-02-11 01:00:00
EWR	2013	2	10	21	30.92	21.02	66.34	160	3.4523399999999995	\N	0	1028.2	10	2013-02-11 02:00:00
EWR	2013	2	10	22	30.92	21.02	66.34	180	4.60312	\N	0	1027.4	10	2013-02-11 03:00:00
EWR	2013	2	10	23	32	21.92	65.97	170	3.4523399999999995	\N	0	1027.3	10	2013-02-11 04:00:00
EWR	2013	2	11	0	30.92	21.92	68.92	0	0	\N	0	1026.5	10	2013-02-11 05:00:00
EWR	2013	2	11	1	30.92	21.02	66.34	0	0	\N	0	1026	10	2013-02-11 06:00:00
EWR	2013	2	11	2	32	23	69.04	0	0	\N	0	1024.8	10	2013-02-11 07:00:00
EWR	2013	2	11	3	33.08	26.06	75.11	0	0	\N	0	1023.5	9	2013-02-11 08:00:00
EWR	2013	2	11	4	32	26.96	81.42	20	3.4523399999999995	\N	0	1022.2	10	2013-02-11 09:00:00
EWR	2013	2	11	5	33.98	28.94	81.57	20	3.4523399999999995	\N	0.01	1021.1	8	2013-02-11 10:00:00
EWR	2013	2	11	6	35.6	33.8	93.08	0	0	\N	0.06	\N	4	2013-02-11 11:00:00
EWR	2013	2	11	7	37.4	37.4	100	30	3.4523399999999995	\N	0.07	\N	3	2013-02-11 12:00:00
EWR	2013	2	11	8	37.94	37.4	100	360	8.05546	\N	0.17	\N	2	2013-02-11 13:00:00
EWR	2013	2	11	9	35.96	35.96	100	20	6.904679999999999	\N	0.07	\N	1	2013-02-11 14:00:00
EWR	2013	2	11	10	35.96	35.96	100	30	5.7539	\N	0.02	1014.5	0.5	2013-02-11 15:00:00
EWR	2013	2	11	11	37.04	35.96	95.82	360	3.4523399999999995	\N	0.01	1013.4	0.5	2013-02-11 16:00:00
EWR	2013	2	11	12	39.02	39.02	100	0	0	\N	0.01	1011.2	0.5	2013-02-11 17:00:00
EWR	2013	2	11	13	39.92	39.02	96.55	0	0	\N	0	1009.6	0.5	2013-02-11 18:00:00
EWR	2013	2	11	14	39.02	39.02	100	220	4.60312	\N	0	1008.8	0.5	2013-02-11 19:00:00
EWR	2013	2	11	15	41	41	100	0	0	\N	0	1007.1	0.5	2013-02-11 20:00:00
EWR	2013	2	11	16	41	39.92	95.9	250	3.4523399999999995	\N	0	1006.4	0.5	2013-02-11 21:00:00
EWR	2013	2	11	17	42.08	41	95.92	0	0	\N	0	1005.6	0.5	2013-02-11 22:00:00
\.


--
-- Data for Name: airlines; Type: TABLE DATA; Schema: rpostgres; Owner: travis
--

COPY rpostgres.airlines (carrier, name) FROM stdin;
9E	Endeavor Air Inc.
AA	American Airlines Inc.
AS	Alaska Airlines Inc.
B6	JetBlue Airways
DL	Delta Air Lines Inc.
EV	ExpressJet Airlines Inc.
F9	Frontier Airlines Inc.
FL	AirTran Airways Corporation
HA	Hawaiian Airlines Inc.
MQ	Envoy Air
OO	SkyWest Airlines Inc.
UA	United Air Lines Inc.
US	US Airways Inc.
VX	Virgin America
WN	Southwest Airlines Co.
YV	Mesa Airlines Inc.
\.


--
-- Data for Name: airports; Type: TABLE DATA; Schema: rpostgres; Owner: travis
--

COPY rpostgres.airports (faa, name, lat, lon, alt, tz, dst, tzone) FROM stdin;
04G	Lansdowne Airport	41.130474	-80.61958	1044	-5	A	America/New_York
06A	Moton Field Municipal Airport	32.46057	-85.68003	264	-6	A	America/Chicago
06C	Schaumburg Regional	41.98934	-88.10124	801	-6	A	America/Chicago
06N	Randall Airport	41.43191	-74.39156	523	-5	A	America/New_York
09J	Jekyll Island Airport	31.074472	-81.42778	11	-5	A	America/New_York
0A9	Elizabethton Municipal Airport	36.371223	-82.173416	1593	-5	A	America/New_York
0G6	Williams County Airport	41.467304	-84.506775	730	-5	A	America/New_York
0G7	Finger Lakes Regional Airport	42.883564	-76.781235	492	-5	A	America/New_York
0P2	Shoestring Aviation Airfield	39.794823	-76.647194	1000	-5	U	America/New_York
0S9	Jefferson County Intl	48.05381	-122.810646	108	-8	A	America/Los_Angeles
0W3	Harford County Airport	39.566837	-76.2024	409	-5	A	America/New_York
10C	Galt Field Airport	42.40289	-88.375114	875	-6	U	America/Chicago
17G	Port Bucyrus-Crawford County Airport	40.781555	-82.97481	1003	-5	A	America/New_York
19A	Jackson County Airport	34.175865	-83.5616	951	-5	U	America/New_York
1A3	Martin Campbell Field Airport	35.015804	-84.34683	1789	-5	A	America/New_York
1B9	Mansfield Municipal	42.000134	-71.19677	122	-5	A	America/New_York
1C9	Frazier Lake Airpark	54.013332	-124.76833	152	-8	A	America/Vancouver
1CS	Clow International Airport	41.695976	-88.129234	670	-6	U	America/Chicago
1G3	Kent State Airport	41.15139	-81.41511	1134	-5	A	America/New_York
1G4	Grand Canyon West Airport	35.899902	-113.815674	4813	-7	A	America/Phoenix
1H2	Effingham Memorial Airport	39.07	-88.534	585	-6	A	America/Chicago
1OH	Fortman Airport	40.555325	-84.38662	885	-5	U	America/New_York
1RL	Point Roberts Airpark	48.97972	-123.07889	10	-8	A	America/Los_Angeles
23M	Clarke CO	32.0517	-88.4434	320	-6	A	America/Chicago
24C	Lowell City Airport	42.95392	-85.3439	681	-5	A	America/New_York
24J	Suwannee County Airport	30.300125	-83.0247	104	-5	A	America/New_York
25D	Forest Lake Airport	45.247746	-92.994385	925	-6	A	America/Chicago
29D	Grove City Airport	41.146027	-80.16775	1371	-5	A	America/New_York
2A0	Mark Anton Airport	35.48625	-84.93108	718	-5	A	America/New_York
2B2	Plum Island Airport	42.79536	-70.83945	11	-5	A	America/New_York
2G2	Jefferson County Airpark	40.360218	-80.700874	1196	-5	A	America/New_York
2G9	Somerset County Airport	40.03887	-79.01499	2275	-5	A	America/New_York
2H0	Shelby County Airport	39.410557	-88.84556	550	-6	A	America/Chicago
2J9	Quincy Municipal Airport	30.59787	-84.55743	225	-5	A	America/New_York
369	Atmautluak Airport	60.86667	-162.27306	18	-9	A	America/Anchorage
36U	Heber City Municipal Airport	40.481804	-111.4288	5637	-7	A	America/Denver
38W	Lynden Airport	48.955894	-122.458115	106	-8	A	America/Los_Angeles
3D2	Ephraim-Gibraltar Airport	45.135418	-87.18794	773	-6	A	America/Chicago
3G3	Wadsworth Municipal	41.00316	-81.75644	974	-5	A	America/New_York
3G4	Ashland County Airport	40.902973	-82.25564	1206	-5	A	America/New_York
3J1	Ridgeland Airport	32.493416	-80.99175	79	-5	A	America/New_York
3W2	Put-in-Bay Airport	41.3521	-82.497	595	-5	A	America/New_York
40J	Perry-Foley Airport	30.069279	-83.58058	44	-5	A	America/New_York
41N	Braceville Airport	41.211166	-80.96925	900	-5	A	America/New_York
47A	Cherokee County Airport	34.312218	-84.42216	1219	-5	A	America/New_York
49A	Gilmer County Airport	34.628223	-84.52658	1486	-5	A	America/New_York
49X	Chemehuevi Valley	34.52889	-114.43197	638	-8	A	America/Los_Angeles
4A4	Polk County Airport - Cornelius Moore Field	34.018696	-85.14647	974	-5	A	America/New_York
4A7	Clayton County Tara Field	33.3891	-84.3324	874	-5	A	America/New_York
4A9	Isbell Field Airport	34.473694	-85.72139	877	-6	A	America/Chicago
4B8	Robertson Field	41.689335	-72.86469	202	-5	A	America/New_York
4G0	Pittsburgh-Monroeville Airport	40.45264	-79.77492	1187	-5	A	America/New_York
4G2	Hamburg Inc Airport	42.700893	-78.91476	751	-5	A	America/New_York
4G4	Youngstown Elser Metro Airport	40.961796	-80.67733	1070	-5	A	America/New_York
4I7	Putnam County Airport	39.633556	-86.813805	842	-5	U	America/New_York
4U9	Dell Flight Strip	44.73575	-112.72002	6007	-7	A	America/Denver
52A	Madison GA Municipal Airport	33.612125	-83.46044	694	-5	A	America/New_York
54J	DeFuniak Springs Airport	30.731112	-86.15378	289	-6	A	America/Chicago
55J	Fernandina Beach Municipal Airport	30.611834	-81.4612	16	-5	A	America/New_York
55S	Packwood	46.3625	-121.4067	1057	-8	A	America/Los_Angeles
57C	East Troy Municipal Airport	42.797165	-88.37261	860	-6	A	America/Chicago
5B2	Saratoga County Airport	43.05072	-73.86164	433	-5	A	America/New_York
60J	Ocean Isle Beach Airport	33.908504	-78.43667	32	-5	U	America/New_York
6A2	Griffin-Spalding County Airport	33.22697	-84.27495	958	-5	A	America/New_York
6J4	Saluda County	33.5561	-81.4768	539	-5	A	America/New_York
6K8	Tok Junction Airport	63.329445	-142.95361	1639	-9	A	America/Anchorage
6S0	Big Timber Airport	45.80639	-109.98111	4492	-7	A	America/Denver
6S2	Florence	43.98282	-124.11137	51	-8	A	America/Los_Angeles
6Y8	Welke Airport	45.72111	-85.52028	664	-5	A	America/New_York
70J	Cairo-Grady County Airport	30.887978	-84.15473	265	-5	A	America/New_York
70N	Spring Hill Airport	41.34736	-75.41589	1729	-5	A	America/New_York
7A4	Foster Field	42.466446	-90.16939	990	-6	A	America/Chicago
7D9	Germack Airport	41.777832	-80.90398	820	-5	A	America/New_York
7N7	Spitfire Aerodrome	39.735565	-75.39772	40	-5	A	America/New_York
8M8	Garland Airport	44.806526	-84.27619	1218	-5	A	America/New_York
93C	Richland Airport	43.283356	-90.29828	742	-6	A	America/Chicago
99N	Bamberg County Airport	33.304527	-81.10841	231	-5	A	America/New_York
9A1	Covington Municipal Airport	33.63231	-83.84745	809	-5	A	America/New_York
9A5	Barwick Lafayette Airport	34.68848	-85.29033	777	-5	A	America/New_York
9G1	Rock Airport	40.603546	-79.82612	1063	-5	A	America/New_York
A39	Phoenix Regional Airport	32.9917	-111.921	1300	-7	A	America/Phoenix
A50	Colorado Springs East	38.87	-104.41	6145	-7	A	America/Denver
AAF	Apalachicola Regional Airport	29.727606	-85.02744	20	-5	A	America/New_York
AAP	Andrau Airport	29.43	-95.35	80	-6	A	America/Chicago
ABE	Lehigh Valley Intl	40.652084	-75.4408	393	-5	A	America/New_York
ABI	Abilene Rgnl	32.41132	-99.6819	1791	-6	A	America/Chicago
ABL	Ambler Airport	67.10639	-157.8575	334	-9	A	America/Anchorage
ABQ	Albuquerque International Sunport	35.040222	-106.60919	5355	-7	A	America/Denver
ABR	Aberdeen Regional Airport	45.4491	-98.4218	1302	-6	A	America/Chicago
ABY	Southwest Georgia Regional Airport	31.5355	-84.1945	197	-5	A	America/New_York
ACJ	Jimmy Carter Regional	32.0665	-84.1133	468	-5	A	America/New_York
ACK	Nantucket Mem	41.25305	-70.06018	48	-5	A	America/New_York
ACT	Waco Rgnl	31.611288	-97.23052	516	-6	A	America/Chicago
ACV	Arcata	40.97811	-124.10861	221	-8	A	America/Los_Angeles
ACY	Atlantic City Intl	39.457584	-74.57716	75	-5	A	America/New_York
ADK	Adak Airport	51.878	-176.646	18	-9	A	America/Anchorage
ADM	Ardmore Muni	34.300835	-97.00889	762	-6	A	America/Chicago
ADQ	Kodiak	57.749966	-152.49385	78	-9	A	America/Anchorage
ADS	Addison	32.96856	-96.83645	644	-6	A	America/Chicago
ADW	Andrews Afb	38.810806	-76.86703	280	-5	A	America/New_York
AET	Allakaket Airport	66.5519	-152.6222	441	-9	A	America/Anchorage
AEX	Alexandria Intl	31.3274	-92.549835	89	-6	A	America/Chicago
AFE	Kake Airport	56.961388	-133.91028	172	-9	A	America/Anchorage
AFW	Fort Worth Alliance Airport	32.987778	-97.318886	722	-6	A	America/Chicago
AGC	Allegheny County Airport	40.3544	-79.9302	1252	-5	A	America/New_York
AGN	Angoon Seaplane Base	57.503613	-134.585	0	-9	A	America/Anchorage
AGS	Augusta Rgnl At Bush Fld	33.369946	-81.9645	144	-5	A	America/New_York
AHN	Athens Ben Epps Airport	33.9486	-83.3263	808	-5	A	America/New_York
AIA	Alliance Municipal Airport	42.053333	-102.80389	3931	-7	A	America/Denver
AIK	Municipal Airport	33.649387	-81.68503	529	-5	A	America/New_York
AIN	Wainwright Airport	70.638054	-159.99472	41	-9	A	America/Anchorage
AIZ	Lee C Fine Memorial Airport	38.096035	-92.549484	869	-6	A	America/Chicago
AKB	Atka Airport	52.22028	-174.20639	56	-9	A	America/Anchorage
AKC	Akron Fulton Intl	41.0375	-81.46692	1067	-5	A	America/New_York
AKI	Akiak Airport	60.90278	-161.23056	30	-9	A	America/Anchorage
AKK	Akhiok Airport	56.93861	-154.1825	44	-9	A	America/Anchorage
AKN	King Salmon	58.676777	-156.64928	68	-9	A	America/Anchorage
AKP	Anaktuvuk Pass Airport	68.1336	-151.743	2103	-9	A	America/Anchorage
ALB	Albany Intl	42.74827	-73.80169	285	-5	A	America/New_York
ALI	Alice Intl	27.740889	-98.02695	178	-6	A	America/Chicago
ALM	Alamogordo White Sands Regional Airport	32.8399	-105.991	4200	-7	A	America/Denver
ALO	Waterloo Regional Airport	42.5571	-92.4003	873	-6	A	America/Chicago
ALS	San Luis Valley Regional Airport	37.435	-105.86667	7539	-7	A	America/Denver
ALW	Walla Walla Regional Airport	46.0949	-118.288	1191	-8	A	America/Los_Angeles
ALX	Alexandria	38.806347	-77.0621	1	-5	A	America/New_York
ALZ	Alitak Seaplane Base	56.899445	-154.24777	0	-9	A	America/Anchorage
AMA	Rick Husband Amarillo Intl	35.219368	-101.70593	3607	-6	A	America/Chicago
ANB	Anniston Metro	33.588165	-85.85811	612	-6	A	America/Chicago
ANC	Ted Stevens Anchorage Intl	61.174362	-149.99637	152	-9	A	America/Anchorage
AND	Anderson Rgnl	34.494583	-82.70939	782	-5	A	America/New_York
ANI	Aniak Airport	61.5816	-159.543	88	-9	A	America/Anchorage
ANN	Annette Island	55.042435	-131.57224	119	-9	A	America/Anchorage
ANP	Lee Airport	38.94278	-76.56834	34	-5	A	America/New_York
ANQ	Tri-State Steuben County Airport	41.639698	-85.083496	995	-5	A	America/New_York
ANV	Anvik Airport	62.6467	-160.191	309	-9	A	America/Anchorage
AOH	Lima Allen County Airport	40.707478	-84.02708	975	-5	A	America/New_York
AOO	Altoona Blair Co	40.29637	-78.32002	1504	-5	A	America/New_York
AOS	Amook Bay Seaplane Base	57.47139	-153.81528	0	-9	A	America/Anchorage
APA	Centennial	39.57013	-104.8493	5883	-7	A	America/Denver
APC	Napa County Airport	38.213196	-122.28069	35	-8	A	America/Los_Angeles
APF	Naples Muni	26.152618	-81.77529	8	-5	A	America/New_York
APG	Phillips Aaf	39.46622	-76.16881	57	-5	A	America/New_York
APN	Alpena County Regional Airport	45.0781	-83.5603	689	-5	A	America/New_York
AQC	Klawock Seaplane Base	55.554657	-133.1017	0	-9	A	America/Anchorage
ARA	Acadiana Rgnl	30.037758	-91.883896	24	-6	A	America/Chicago
ARB	Ann Arbor Municipal Airport	42.132275	-83.44442	839	-5	A	America/New_York
ARC	Arctic Village Airport	68.1147	-145.579	2092	-9	A	America/Anchorage
ART	Watertown Intl	43.99192	-76.021736	325	-5	A	America/New_York
ARV	Lakeland	45.927776	-89.730835	1629	-6	A	America/Chicago
ASE	Aspen Pitkin County Sardy Field	39.2232	-106.869	7820	-7	A	America/Denver
ASH	Boire Field Airport	42.78175	-71.51478	199	-5	A	America/New_York
AST	Astoria Regional Airport	46.15797	-123.87869	15	-8	A	America/Los_Angeles
ATK	Atqasuk Edward Burnell Sr Memorial Airport	70.4673	-157.436	96	-9	A	America/Anchorage
ATL	Hartsfield Jackson Atlanta Intl	33.63672	-84.42807	1026	-5	A	America/New_York
ATT	Camp Mabry Austin City	30.31666	-97.7666	0	-6	A	America/Chicago
ATW	Appleton	44.257526	-88.507576	680	-6	A	America/Chicago
ATY	Watertown Regional Airport	44.914	-97.1547	1748	-6	A	America/Chicago
AUG	Augusta State	44.32065	-69.79732	352	-5	A	America/New_York
AUK	Alakanuk Airport	62.68	-164.66	10	-9	A	America/Anchorage
AUO	Auburn University Regional	32.3691	-85.2604	777	-6	A	America/Chicago
AUS	Austin Bergstrom Intl	30.194529	-97.66989	542	-6	A	America/Chicago
AUW	Wausau Downtown Airport	44.926285	-89.627	1201	-6	U	America/Chicago
AVL	Asheville Regional Airport	35.436195	-82.54181	2165	-5	A	America/New_York
AVO	Executive	27.591389	-81.52889	160	-5	A	America/New_York
AVP	Wilkes Barre Scranton Intl	41.338478	-75.723404	962	-5	A	America/New_York
AVW	Marana Regional	32.409557	-111.21839	2031	-7	U	America/Phoenix
AVX	Avalon	33.405	-118.41583	1602	-8	A	America/Los_Angeles
AZA	Phoenix-Mesa Gateway	33.307835	-111.655	1382	-7	N	America/Phoenix
AZO	Kalamazoo	42.234875	-85.552055	874	-5	A	America/New_York
BAB	Beale Afb	39.13609	-121.43657	113	-8	A	America/Los_Angeles
BAD	Barksdale Afb	32.50182	-93.662674	166	-6	A	America/Chicago
BAF	Barnes Municipal	42.157948	-72.71587	270	-5	A	America/New_York
BBX	Wings Field	40.1375	-75.265	302	-5	A	America/New_York
BCE	Bryce Canyon	37.706444	-112.145805	7590	-7	A	America/Denver
BCT	Boca Raton	26.3785	-80.1077	13	-5	A	America/New_York
BDE	Baudette Intl	48.728443	-94.61222	1086	-6	A	America/Chicago
BDL	Bradley Intl	41.93889	-72.68322	173	-5	A	America/New_York
BDR	Igor I Sikorsky Mem	41.16347	-73.12617	9	-5	A	America/New_York
BEC	Beech Factory Airport	37.693916	-97.21492	1409	-6	A	America/Chicago
BED	Laurence G Hanscom Fld	42.46995	-71.28903	133	-5	A	America/New_York
BEH	Southwest Michigan Regional Airport	42.128582	-86.4285	643	-5	A	America/New_York
BET	Bethel	60.779778	-161.838	121	-9	A	America/Anchorage
BFD	Bradford Regional Airport	41.8031	-78.6401	2143	-5	A	America/New_York
BFF	Western Nebraska Regional Airport	41.874	-103.596	3967	-7	A	America/Denver
BFI	Boeing Fld King Co Intl	47.53	-122.30195	21	-8	A	America/Los_Angeles
BFL	Meadows Fld	35.433598	-119.05677	507	-8	A	America/Los_Angeles
BFM	Mobile Downtown	30.626783	-88.06809	26	-6	A	America/Chicago
BFP	Beaver Falls	40.772472	-80.39144	1253	-5	A	America/New_York
BFT	Beaufort	32.47741	-80.72316	37	-5	A	America/New_York
BGE	Decatur County Industrial Air Park	30.971598	-84.636925	141	-5	A	America/New_York
BGM	Greater Binghamton Edwin A Link Fld	42.20869	-75.979836	1636	-5	A	America/New_York
BGR	Bangor Intl	44.807446	-68.82814	192	-5	A	America/New_York
BHB	Hancock County - Bar Harbor	44.449768	-68.361565	83	-5	A	America/New_York
BHM	Birmingham Intl	33.562943	-86.75355	644	-6	A	America/Chicago
BID	Block Island State Airport	41.168056	-71.57778	108	-5	A	America/New_York
BIF	Biggs Aaf	31.849527	-106.380035	3948	-7	A	America/Denver
BIG	Allen Aaf	63.99455	-145.72165	1291	-9	A	America/Anchorage
BIL	Billings Logan International Airport	45.80921	-108.53765	3652	-7	A	America/Denver
BIS	Bismarck Municipal Airport	46.77584	-100.757935	1661	-6	A	America/Chicago
BIV	Tulip City Airport	42.74278	-86.107834	698	-5	A	America/New_York
BIX	Keesler Afb	30.410425	-88.92443	33	-6	A	America/Chicago
BJC	Rocky Mountain Metropolitan Airport	39.90889	-105.117226	5670	-7	A	America/Denver
BJI	Bemidji Regional Airport	47.510723	-94.93472	1391	-6	A	America/Chicago
BKC	Buckland Airport	65.98167	-161.14917	31	-9	A	America/Anchorage
BKD	Stephens Co	32.719048	-98.891	1284	-6	A	America/Chicago
BKF	Buckley Afb	39.701668	-104.75166	5662	-7	A	America/Denver
BKG	Branson LLC	36.531994	-93.200554	1302	-6	A	America/Chicago
BKH	Barking Sands Pmrf	22.022833	-159.785	23	-10	A	Pacific/Honolulu
BKL	Burke Lakefront Airport	41.5175	-81.683334	583	-5	A	America/New_York
BKW	Raleigh County Memorial Airport	37.7873	-81.1242	2504	-5	A	America/New_York
BKX	Brookings Regional Airport	44.3048	-96.8169	1648	-6	A	America/Chicago
BLD	Boulder City Municipal Airport	35.5651	-114.514	2201	-7	U	America/Phoenix
BLF	Mercer County Airport	37.2958	-81.2077	2857	-5	A	America/New_York
BLH	Blythe Airport	33.619167	-114.71689	399	-8	A	America/Los_Angeles
BLI	Bellingham Intl	48.792694	-122.53753	170	-8	A	America/Los_Angeles
BLV	Scott Afb Midamerica	38.545177	-89.83518	459	-6	A	America/Chicago
BMC	Brigham City	41.552	-112.062	4229	-7	A	America/Denver
BMG	Monroe County Airport	39.14602	-86.616684	846	-5	A	America/New_York
BMI	Central Illinois Rgnl	40.47711	-88.91592	871	-6	A	America/Chicago
BMT	Beaumont Municipal	30.070204	-94.215096	32	-6	A	America/Chicago
BMX	Big Mountain Afs	59.361248	-155.25882	663	-9	A	America/Anchorage
BNA	Nashville Intl	36.124474	-86.67819	599	-6	A	America/Chicago
BOI	Boise Air Terminal	43.56436	-116.22286	2871	-7	A	America/Denver
BOS	General Edward Lawrence Logan Intl	42.364346	-71.00518	19	-5	A	America/New_York
BOW	Bartow Municipal Airport	27.9434	-81.7834	125	-5	U	America/New_York
BPT	Southeast Texas Rgnl	29.950832	-94.02069	15	-6	A	America/Chicago
BQK	Brunswick Golden Isles Airport	31.2588	-81.4665	26	-5	A	America/New_York
BRD	Brainerd Lakes Rgnl	46.398308	-94.13808	1226	-6	U	America/Chicago
BRL	Southeast Iowa Regional Airport	40.7832	-91.1255	698	-6	A	America/Chicago
BRO	Brownsville South Padre Island Intl	25.906834	-97.42586	22	-6	A	America/Chicago
BRW	Wiley Post Will Rogers Mem	71.285446	-156.766	44	-9	A	America/Anchorage
BSF	Bradshaw Aaf	19.760056	-155.55371	6190	-10	A	Pacific/Honolulu
BTI	Barter Island Lrrs	70.13399	-143.58186	2	-9	A	America/Anchorage
BTM	Bert Mooney Airport	45.954807	-112.497475	5550	-7	A	America/Denver
BTR	Baton Rouge Metro Ryan Fld	30.533167	-91.149635	70	-6	A	America/Chicago
BTT	Bettles	66.91394	-151.52905	644	-9	A	America/Anchorage
BTV	Burlington Intl	44.471863	-73.153275	335	-5	A	America/New_York
BUF	Buffalo Niagara Intl	42.940525	-78.73217	724	-5	A	America/New_York
BUR	Bob Hope	34.20067	-118.358665	778	-8	A	America/Los_Angeles
BUU	Municipal Airport	42.690716	-88.30468	780	-6	A	America/Chicago
BUY	Burlington-Alamance Regional Airport	36.048542	-79.47489	617	-5	A	America/New_York
BVY	Beverly Municipal Airport	42.58414	-70.916145	107	-5	A	America/New_York
BWD	KBWD	31.793612	-98.9565	1387	-6	A	America/Chicago
BWG	Bowling Green-Warren County Regional Airport	36.964527	-86.41967	547	-6	A	America/Chicago
BWI	Baltimore Washington Intl	39.17536	-76.668335	146	-5	A	America/New_York
BXK	Buckeye Municipal Airport	33.420418	-112.68618	1033	-7	U	America/Phoenix
BXS	Borrego Valley Airport	33.25903	-116.32097	520	-8	A	America/Los_Angeles
BYH	Arkansas Intl	35.964348	-89.943954	254	-6	A	America/Chicago
BYS	Bicycle Lake Aaf	35.280533	-116.63003	2350	-8	A	America/Los_Angeles
BYW	Blakely Island Airport	48.56025	-122.80243	0	-8	A	America/Los_Angeles
BZN	Gallatin Field	45.77764	-111.16015	4500	-7	A	America/Denver
C02	Grand Geneva Resort Airport	42.614918	-88.38958	835	-6	U	America/Chicago
C16	Frasca Field	40.144978	-88.200195	735	-6	A	America/Chicago
C47	Portage Municipal Airport	43.560314	-89.482864	825	-6	U	America/Chicago
C65	Plymouth Municipal Airport	41.36513	-86.300255	800	-5	A	America/New_York
C89	Sylvania Airport	42.70325	-87.95897	785	-6	A	America/Chicago
C91	Dowagiac Municipal Airport	41.992935	-86.12801	748	-5	U	America/New_York
CAE	Columbia Metropolitan	33.93883	-81.11953	236	-5	A	America/New_York
CAK	Akron Canton Regional Airport	40.916084	-81.44219	1228	-5	A	America/New_York
CAR	Caribou Muni	46.8715	-68.017914	626	-5	A	America/New_York
CBE	Greater Cumberland Rgnl.	39.615276	-78.76056	775	-5	A	America/New_York
CBM	Columbus Afb	33.643833	-88.44383	219	-6	A	America/Chicago
CCO	Coweta County Airport	33.311565	-84.76975	970	-5	A	America/New_York
CCR	Buchanan Field Airport	37.989666	-122.05689	26	-8	A	America/Los_Angeles
CDB	Cold Bay	55.206062	-162.72543	96	-9	A	America/Anchorage
CDC	Cedar City Rgnl	37.700966	-113.09885	5622	-7	A	America/Denver
CDI	Cambridge Municipal Airport	39.97503	-81.57758	799	-5	U	America/New_York
CDK	CedarKey	29.134222	-83.05047	11	-5	A	America/New_York
CDN	Woodward Field	34.283585	-80.56486	302	-5	A	America/New_York
CDR	Chadron Municipal Airport	42.8375	-103.09556	3297	-7	A	America/Denver
CDS	Childress Muni	34.43378	-100.287994	1954	-6	A	America/Chicago
CDV	Merle K Mudhole Smith	60.49178	-145.47755	48	-9	A	America/Anchorage
CDW	Caldwell Essex County Airport	40.87522	-74.281364	172	-5	A	America/New_York
CEC	Del Norte County Airport	41.7802	-124.237	57	-8	A	America/Los_Angeles
CEF	Westover Arb Metropolitan	42.194016	-72.53478	241	-5	A	America/New_York
CEM	Central Airport	65.57389	-144.78084	937	-9	A	America/Anchorage
CEU	Clemson	34.672222	-82.88589	891	-5	A	America/New_York
CEW	Bob Sikes	30.778833	-86.52211	213	-6	A	America/Chicago
CEZ	Cortez Muni	37.303	-108.62806	5918	-7	A	America/Denver
CFD	Coulter Fld	30.715694	-96.33136	367	-6	A	America/Chicago
CGA	Craig Seaplane Base	55.47889	-133.14778	0	-9	A	America/Anchorage
CGC	Crystal River	28.86761	-82.57411	9	-5	A	America/New_York
CGF	Cuyahoga County	41.565125	-81.48636	879	-5	A	America/New_York
CGI	Cape Girardeau Regional Airport	37.2253	-89.5708	342	-6	A	America/Chicago
CGX	Meigs Field	41.86028	-87.60972	585	-6	A	America/Chicago
CGZ	Casa Grande Municipal Airport	32.954887	-111.76683	1464	-7	U	America/Phoenix
CHA	Lovell Fld	35.03528	-85.20381	683	-5	A	America/New_York
CHI	All Airports	41.88361	-87.63167	596	-6	A	America/Chicago
CHO	Charlottesville-Albemarle	38.138638	-78.45286	639	-5	A	America/New_York
CHS	Charleston Afb Intl	32.898647	-80.04053	45	-5	A	America/New_York
CHU	Chuathbaluk Airport	61.579166	-159.21556	243	-9	A	America/Anchorage
CIC	Chico Muni	39.795383	-121.85842	238	-8	A	America/Los_Angeles
CID	Cedar Rapids	41.884693	-91.71081	869	-6	A	America/Chicago
CIK	Chalkyitsik Airport	66.645	-143.74	544	-9	A	America/Anchorage
CIL	Council Airport	64.89778	-163.70334	85	-9	A	America/Anchorage
CIU	Chippewa County International Airport	46.2508	-84.4724	800	-5	A	America/New_York
CKB	Harrison Marion Regional Airport	39.2966	-80.2281	1217	-5	A	America/New_York
CKD	Crooked Creek Airport	61.86778	-158.135	178	-9	A	America/Anchorage
CKF	Crisp County Cordele Airport	31.988832	-83.77392	310	-5	A	America/New_York
CKV	Clarksville-Montgomery County Regional Airport	36.621944	-87.415	550	-6	A	America/Chicago
CLC	Clear Lake Metroport	29.5569	-95.1375	35	-6	A	America/Chicago
CLD	McClellan-Palomar Airport	33.0742	-117.1648	328	-8	A	America/Los_Angeles
CLE	Cleveland Hopkins Intl	41.41169	-81.84979	791	-5	A	America/New_York
CLL	Easterwood Fld	30.588583	-96.36383	321	-6	A	America/Chicago
CLM	William R Fairchild International Airport	48.1202	-123.5	291	-8	A	America/Los_Angeles
CLS	Chehalis-Centralia	46.4062	-122.5897	177	-8	A	America/Los_Angeles
CLT	Charlotte Douglas Intl	35.214	-80.94314	748	-5	A	America/New_York
CLW	Clearwater Air Park	27.976473	-82.75867	70	-5	A	America/New_York
CMH	Port Columbus Intl	39.99797	-82.89189	815	-5	A	America/New_York
CMI	Champaign	40.03925	-88.27805	754	-6	A	America/Chicago
CMX	Houghton County Memorial Airport	47.1684	-88.4891	1095	-5	A	America/New_York
CNM	Cavern City Air Terminal	32.33747	-104.263275	3295	-7	A	America/Denver
CNW	Tstc Waco	31.63783	-97.07414	470	-6	A	America/Chicago
CNY	Canyonlands Field	38.755	-109.75472	4555	-7	A	America/Denver
COD	Yellowstone Rgnl	44.520195	-109.0238	5102	-7	A	America/Denver
COE	Pappy Boyington	47.774307	-116.81958	2320	-8	A	America/Los_Angeles
COF	Patrick Afb	28.234922	-80.61012	8	-5	A	America/New_York
COI	Merritt Island Airport	28.341612	-80.68547	6	-5	A	America/New_York
CON	Concord Municipal	43.20267	-71.50233	342	-5	A	America/New_York
COS	City Of Colorado Springs Muni	38.805805	-104.700775	6187	-7	A	America/Denver
COT	Cotulla Lasalle Co	28.456694	-99.22029	474	-6	A	America/Chicago
COU	Columbia Rgnl	38.818092	-92.21963	889	-6	A	America/Chicago
CPR	Natrona Co Intl	42.908	-106.46442	5347	-7	A	America/Denver
CPS	St. Louis Downtown Airport	38.570724	-90.15622	413	-6	U	America/Chicago
CRE	Grand Strand Airport	33.81175	-78.723946	31	-5	A	America/New_York
CRP	Corpus Christi Intl	27.77036	-97.50122	44	-6	A	America/Chicago
CRW	Yeager	38.373146	-81.593185	981	-5	A	America/New_York
CSG	Columbus Metropolitan Airport	32.516335	-84.93886	397	-5	A	America/New_York
CTB	Cut Bank Muni	48.608353	-112.376144	3854	-7	A	America/Denver
CTH	Chester County G O Carlson Airport	39.9789	-75.8654	660	-5	A	America/New_York
CTJ	West Georgia Regional Airport - O V Gray Field	33.631695	-85.15227	1165	-5	A	America/New_York
CTY	Cross City	29.635529	-83.10475	42	-5	A	America/New_York
CVG	Cincinnati Northern Kentucky Intl	39.048836	-84.66782	896	-5	A	America/New_York
CVN	Clovis Muni	34.42514	-103.07928	4216	-7	A	America/Denver
CVO	Corvallis Muni	44.5067	-123.2915	250	-8	A	America/Los_Angeles
CVS	Cannon Afb	34.382774	-103.32214	4295	-7	A	America/Denver
CVX	Charlevoix Municipal Airport	45.30478	-85.27533	669	-5	A	America/New_York
CWA	Central Wisconsin	44.772724	-89.64664	840	-6	A	America/Chicago
CWI	Clinton Municipal	41.83075	-90.32897	708	-6	A	America/Chicago
CWT	Chatsworth Station	34.256943	-118.59889	978	-8	A	America/Los_Angeles
CXF	Coldfoot Airport	67.25139	-150.17612	1014	-9	A	America/Anchorage
CXL	Calexico Intl	32.669502	-115.51333	4	-8	A	America/Los_Angeles
CXO	Lone Star Executive	30.351833	-95.41447	245	-6	A	America/Chicago
CXY	Capital City Airport	40.21714	-76.851364	347	-5	A	America/New_York
CYF	Chefornak Airport	60.149166	-164.28555	40	-9	A	America/Anchorage
CYM	Chatham Seaplane Base	57.515	-134.9461	0	-9	A	America/Anchorage
CYS	Cheyenne Rgnl Jerry Olson Fld	41.155724	-104.81184	6156	-7	A	America/Denver
CYT	Yakataga Airport	60.0819	-142.4936	12	-9	A	America/Anchorage
CZF	Cape Romanzof Lrrs	61.780296	-166.03874	457	-9	A	America/Anchorage
CZG	Tri-Cities	42.0471	-76.0578	833	-5	A	America/New_York
CZN	Chisana Airport	62.07111	-142.04834	1011	-9	A	America/Anchorage
DAB	Daytona Beach Intl	29.179916	-81.05806	34	-5	A	America/New_York
DAL	Dallas Love Fld	32.84711	-96.851776	487	-6	A	America/Chicago
DAW	Skyhaven Airport	43.284054	-70.929276	321	-5	A	America/New_York
DAY	James M Cox Dayton Intl	39.902374	-84.219376	1009	-5	A	America/New_York
DBN	W H Barron Field	32.3388	-82.591	311	-5	A	America/New_York
DBQ	Dubuque Rgnl	42.402	-90.70947	1076	-6	A	America/Chicago
DCA	Ronald Reagan Washington Natl	38.85208	-77.03772	15	-5	A	America/New_York
DDC	Dodge City Regional Airport	37.7634	-99.9656	2594	-6	A	America/Chicago
DEC	Decatur	39.834564	-88.86569	682	-6	A	America/Chicago
DEN	Denver Intl	39.861656	-104.67318	5431	-7	A	America/Denver
DET	Coleman A Young Muni	42.409195	-83.009865	626	-5	A	America/New_York
DFW	Dallas Fort Worth Intl	32.896828	-97.037994	607	-6	A	America/Chicago
DGL	Douglas Municipal Airport	31.342604	-109.506454	4173	-7	N	America/Phoenix
DHB	Deer Harbor Seaplane	48.618397	-123.00596	0	-8	A	America/Los_Angeles
DHN	Dothan Rgnl	31.321339	-85.44963	401	-6	A	America/Chicago
DHT	Dalhart Muni	36.022587	-102.54728	3991	-6	A	America/Chicago
DIK	Dickinson Theodore Roosevelt Regional Airport	46.7975	-102.80194	2592	-7	A	America/Denver
DKB	De Kalb Taylor Municipal Airport	41.933834	-88.70569	914	-6	U	America/Chicago
DKK	Chautauqua County-Dunkirk Airport	42.493336	-79.27204	693	-5	A	America/New_York
DKX	Knoxville Downtown Island Airport	35.963833	-83.873665	833	-5	A	America/New_York
DLF	Laughlin Afb	29.359486	-100.77798	1082	-6	A	America/Chicago
DLG	Dillingham	59.044666	-158.5055	74	-9	A	America/Anchorage
DLH	Duluth Intl	46.84209	-92.19365	1428	-6	A	America/Chicago
DLL	Baraboo Wisconsin Dells Airport	43.521786	-89.77093	979	-6	A	America/Chicago
DMA	Davis Monthan Afb	32.166466	-110.88314	2704	-7	A	America/Phoenix
DNL	Daniel Field Airport	33.466503	-82.03938	423	-5	A	America/New_York
DNN	Dalton Municipal Airport	34.722946	-84.87025	709	-5	A	America/New_York
DNV	Vermilion Regional	40.199696	-87.59553	696	-6	A	America/Chicago
DOV	Dover Afb	39.12954	-75.46596	28	-5	A	America/New_York
DPA	Dupage	41.90778	-88.24861	758	-6	A	America/Chicago
DQH	Douglas Municipal Airport	31.476738	-82.860565	257	-5	A	America/New_York
DRG	Deering Airport	66.0696	-162.766	21	-9	A	America/Anchorage
DRI	Beauregard Rgnl	30.831722	-93.33992	202	-6	A	America/Chicago
DRM	Drummond Island Airport	46.00931	-83.743935	668	-5	A	America/New_York
DRO	Durango La Plata Co	37.151516	-107.75377	6685	-7	A	America/Denver
DRT	Del Rio Intl	29.374208	-100.927155	1002	-6	A	America/Chicago
DSM	Des Moines Intl	41.533974	-93.663086	958	-6	A	America/Chicago
DTA	Delta Municipal Airport	39.38064	-112.50771	4759	-7	A	America/Denver
DTS	Destin	30.40006	-86.47147	23	-6	A	America/Chicago
DTW	Detroit Metro Wayne Co	42.212444	-83.353386	645	-5	A	America/New_York
DUC	Halliburton Field Airport	34.471306	-97.95986	1114	-6	A	America/Chicago
DUG	Bisbee Douglas Intl	31.469028	-109.60367	4154	-7	A	America/Phoenix
DUJ	DuBois Regional Airport	41.1783	-78.8987	1817	-5	A	America/New_York
DUT	Unalaska	53.90014	-166.5435	22	-9	A	America/Anchorage
DVL	Devils Lake Regional Airport	48.114445	-98.90861	1445	-6	A	America/Chicago
DVT	Deer Valley Municipal Airport	33.4117	112.457	1478	8	A	Asia/Chongqing
DWA	Yolo County Airport	38.579388	-121.85694	100	-8	A	America/Los_Angeles
DWH	David Wayne Hooks Field	30.063745	-95.554276	152	-6	A	America/Chicago
DWS	Orlando	28.398	-81.57	340	-5	A	America/New_York
DXR	Danbury Municipal Airport	41.371536	-73.48219	458	-5	A	America/New_York
DYS	Dyess Afb	32.420757	-99.8546	1789	-6	A	America/Chicago
E25	Wickenburg Municipal Airport	33.9689	-112.799	2377	-7	A	America/Phoenix
E51	Bagdad Airport	34.59585	-113.1702	4183	-7	A	America/Phoenix
E55	Ocean Ridge Airport	38.801613	-123.53064	940	-8	A	America/Los_Angeles
E63	Gila Bend Municipal Airport	32.96017	-112.67364	789	-7	U	America/Phoenix
E91	Chinle Municipal Airport	36.11088	-109.575424	5547	-7	N	America/Denver
EAA	Eagle Airport	64.77805	-141.14972	908	-9	A	America/Anchorage
EAR	Kearney Municipal Airport	40.727	-99.0068	2131	-6	A	America/Chicago
EAT	Pangborn Field	47.398	-120.206	1249	-8	A	America/Los_Angeles
EAU	Chippewa Valley Regional Airport	44.8658	-91.4843	913	-6	A	America/Chicago
ECA	Iosco County	44.311	-83.422	606	-5	A	America/New_York
ECG	Elizabeth City Cgas Rgnl	36.260582	-76.174576	12	-5	A	America/New_York
ECP	Panama City-NW Florida Bea.	30.3417	-85.7973	69	-6	A	America/Chicago
EDF	Elmendorf Afb	61.250984	-149.8065	212	-9	A	America/Anchorage
EDW	Edwards Afb	34.90542	-117.883736	2302	-8	A	America/Los_Angeles
EEK	Eek Airport	60.21361	-162.04388	15	-9	A	America/Anchorage
EEN	Dillant Hopkins Airport	72.270836	42.898335	149	-5	A	\N
EET	Shelby County Airport	33.177776	-86.783226	586	-6	A	America/Chicago
EFD	Ellington Fld	29.607332	-95.15875	32	-6	A	America/Chicago
EGA	Eagle County Airport	39.64276	-106.91593	6548	-7	U	America/Denver
EGE	Eagle Co Rgnl	39.642555	-106.917694	6540	-7	A	America/Denver
EGT	Wellington Municipal	37.39411	-97.423225	1277	-6	A	America/Chicago
EGV	Eagle River	45.932335	-89.26828	1642	-6	A	America/Chicago
EGX	Egegik Airport	58.185555	-157.37555	92	-9	A	America/Anchorage
EHM	Cape Newenham Lrrs	58.646427	-162.06277	541	-9	A	America/Anchorage
EIL	Eielson Afb	64.665665	-147.1015	548	-9	A	America/Anchorage
EKI	Elkhart Municipal	41.719444	-86.003334	778	-5	A	America/New_York
EKN	Elkins Randolph Co Jennings Randolph	38.889442	-79.85714	1987	-5	A	America/New_York
EKO	Elko Regional Airport	40.8249	-115.792	5140	-8	A	America/Los_Angeles
EKY	Bessemer	33.1876	-86.5558	700	-6	A	America/Chicago
ELD	South Arkansas Rgnl At Goodwin Fld	33.22097	-92.81328	277	-6	A	America/Chicago
ELI	Elim Airport	64.615	-162.27055	162	-9	A	America/Anchorage
ELM	Elmira Corning Rgnl	42.15989	-76.89161	954	-5	A	America/New_York
ELP	El Paso Intl	31.80725	-106.37759	3958	-7	A	America/Denver
ELV	Elfin Cove Seaplane Base	58.19528	-136.3475	0	-9	A	America/Anchorage
ELY	Ely Airport	39.29972	-114.84194	6259	-8	A	America/Los_Angeles
EMK	Emmonak Airport	62.78611	-164.49083	13	-9	A	America/Anchorage
EMP	Emporia Municipal Airport	38.3321	-96.1912	1208	-6	A	America/Chicago
ENA	Kenai Muni	60.573112	-151.245	99	-9	A	America/Anchorage
END	Vance Afb	36.33917	-97.9165	1307	-6	A	America/Chicago
ENV	Wendover	40.718693	-114.03089	4237	-7	A	America/Denver
ENW	Kenosha Regional Airport	42.595695	-87.9278	742	-6	A	America/Chicago
EOK	Keokuk Municipal Airport	40.459908	-91.4285	671	-6	A	America/Chicago
EPM	Eastport Municipal Airport	44.91011	-67.012695	45	-5	A	America/New_York
EQY	Monroe Reqional Airport	35.01833	-80.62001	679	-5	A	America/New_York
ERI	Erie Intl Tom Ridge Fld	42.082024	-80.176216	733	-5	A	America/New_York
ERV	Kerrville Municipal Airport	29.976667	-99.08547	1617	-6	A	America/Chicago
ERY	Luce County Airport	46.3112	-85.4573	869	-5	A	America/New_York
ESC	Delta County Airport	45.72278	-87.09361	609	-5	A	America/New_York
ESD	Orcas Island Airport	48.708057	-122.91055	31	-8	A	America/Los_Angeles
ESF	Esler Rgnl	31.394903	-92.29577	112	-6	A	America/Chicago
ESN	Easton-Newnam Field Airport	38.804165	-76.069	72	-5	A	America/New_York
EUF	Weedon Field	31.5708	-85.0774	285	-6	A	America/Chicago
EUG	Mahlon Sweet Fld	44.124584	-123.211975	374	-8	A	America/Los_Angeles
EVV	Evansville Regional	38.037	-87.532364	418	-6	A	America/Chicago
EVW	Evanston-Uinta CO Burns Fld	41.1649	-111.0208	7143	-7	A	America/Denver
EWB	New Bedford Regional Airport	41.6761	-70.9569	80	-5	A	America/New_York
EWK	Newton City-County Airport	38.05708	-97.27523	1533	-6	A	America/Chicago
EWN	Craven Co Rgnl	35.07297	-77.042946	18	-5	A	America/New_York
EWR	Newark Liberty Intl	40.6925	-74.16867	18	-5	A	America/New_York
EXI	Excursion Inlet Seaplane Base	58.420555	-135.44917	0	-9	A	America/Anchorage
EYW	Key West Intl	24.55611	-81.75956	3	-5	A	America/New_York
F57	Seaplane Base	28.0575	-81.7628	140	-5	A	America/New_York
FAF	Felker Aaf	37.1325	-76.60884	12	-5	A	America/New_York
FAI	Fairbanks Intl	64.81512	-147.85626	434	-9	A	America/Anchorage
FAR	Hector International Airport	46.92065	-96.815765	902	-6	A	America/Chicago
FAT	Fresno Yosemite Intl	36.776196	-119.71814	336	-8	A	America/Los_Angeles
FAY	Fayetteville Regional Grannis Field	34.9912	-78.8803	189	-5	A	America/New_York
FBG	Fredericksburg Amtrak Station	38.298416	-77.45688	130	-5	A	America/New_York
FBK	Ladd Aaf	64.8375	-147.61444	454	-9	A	America/Anchorage
FBR	Fort Bridger	41.236	-110.2436	7038	-7	A	America/Denver
FBS	Friday Harbor Seaplane Base	48.537224	-123.00972	0	-8	A	America/Los_Angeles
FCA	Glacier Park Intl	48.31047	-114.256	2977	-7	A	America/Denver
FCM	Flying Cloud Airport	44.4938	-93.2726	906	-6	A	America/Chicago
FCS	Butts Aaf	38.678394	-104.756584	5838	-7	A	America/Denver
FDW	Fairfield County Airport	34.31547	-81.1088	577	-5	A	America/New_York
FDY	Findlay Airport	41.012028	-83.66861	819	-5	U	America/New_York
FFA	First Flight Airport	36.02	-75.67	13	-5	A	America/New_York
FFC	Atlanta Regional Airport - Falcon Field	33.35725	-84.57183	808	-5	A	America/New_York
FFO	Wright Patterson Afb	39.82611	-84.04833	823	-5	A	America/New_York
FFT	Capital City Airport	38.181973	-84.906136	812	-5	A	America/New_York
FFZ	Mesa Falcon Field	33.4608	-111.728	1394	-7	A	America/Phoenix
FHU	Sierra Vista Muni Libby Aaf	31.588472	-110.34439	4719	-7	A	America/Phoenix
FIT	Fitchburg Municipal Airport	42.55411	-71.75897	348	-5	A	America/New_York
FKL	Franklin	41.377872	-79.86036	1540	-5	A	America/New_York
FLD	Fond Du Lac County Airport	43.771168	-88.48842	808	-6	A	America/Chicago
FLG	Flagstaff Pulliam Airport	35.14032	-111.66924	7015	-7	N	America/Phoenix
FLL	Fort Lauderdale Hollywood Intl	26.072582	-80.15275	9	-5	A	America/New_York
FLO	Florence Rgnl	34.18536	-79.72389	146	-5	A	America/New_York
FLV	Sherman Aaf	39.368332	-94.91469	772	-6	A	America/Chicago
FME	Tipton	39.085384	-76.759415	150	-5	A	America/New_York
FMH	Otis Angb	41.65844	-70.521416	131	-5	A	America/New_York
FMN	Four Corners Rgnl	36.74125	-108.22994	5506	-7	A	America/Denver
FMY	Page Fld	26.58661	-81.86325	17	-5	A	America/New_York
FNL	Fort Collins Loveland Muni	40.451828	-105.01134	5016	-7	A	America/Denver
FNR	Funter Bay Seaplane Base	58.254444	-134.89778	0	-9	A	America/Anchorage
FNT	Bishop International	42.965424	-83.74363	782	-5	A	America/New_York
FOD	Fort Dodge Rgnl	42.5512	-94.19184	1157	-6	A	America/Chicago
FOE	Forbes Fld	38.950943	-95.66361	1078	-6	A	America/Chicago
FOK	Francis S Gabreski	40.843655	-72.63179	67	-5	A	America/New_York
FRD	Friday Harbor Airport	48.521942	-123.024445	113	-8	A	America/Los_Angeles
FRI	Marshall Aaf	39.055275	-96.76445	1063	-6	A	America/Chicago
FRN	Bryant Ahp	61.26638	-149.65312	378	-9	A	America/Anchorage
FRP	St Lucie County International Airport	27.497473	-80.372635	23	-5	A	America/New_York
FSD	Sioux Falls	43.582012	-96.74191	1429	-6	A	America/Chicago
FSI	Henry Post Aaf	34.649834	-98.40217	1189	-6	A	America/Chicago
FSM	Fort Smith Rgnl	35.336582	-94.36745	469	-6	A	America/Chicago
FST	Fort Stockton Pecos Co	30.915667	-102.91614	3011	-6	A	America/Chicago
FTK	Godman Aaf	37.90706	-85.97211	756	-5	A	America/New_York
FTW	Fort Worth Meacham Intl	32.81978	-97.36244	710	-6	A	America/Chicago
FTY	Fulton County Airport Brown Field	33.7791	-84.5214	841	-5	A	America/New_York
FUL	Fullerton Municipal Airport	33.521927	-117.584724	96	-8	A	America/Los_Angeles
FWA	Fort Wayne	40.978474	-85.19514	815	-5	A	America/New_York
FXE	Fort Lauderdale Executive	26.19728	-80.17071	13	-5	A	America/New_York
FYU	Fort Yukon	66.571495	-145.25041	433	-9	A	America/Anchorage
FYV	Drake Fld	36.005093	-94.17006	1251	-6	A	America/Chicago
FZG	Fitzgerald Municipal Airport	31.683905	-83.270905	365	-5	A	America/New_York
FZI	Fostoria Metropolitan Airport	41.190834	-83.39308	752	-5	A	America/New_York
GAD	Northeast Alabama Regional Airport	33.97265	-86.08908	569	-6	A	America/Chicago
GAI	Montgomery County Airpark	39.1006	-77.09576	0	-5	A	America/New_York
GAL	Edward G Pitka Sr	64.736176	-156.93742	152	-9	A	America/Anchorage
GAM	Gambell Airport	63.7668	-171.733	27	-9	A	America/Anchorage
GBN	Great Bend Municipal	38.344166	-98.85917	1887	-6	A	America/Chicago
GCC	Gillette-Campbell County Airport	44.348915	-105.53936	4365	-7	A	America/Denver
GCK	Garden City Rgnl	37.92753	-100.72442	2891	-6	A	America/Chicago
GCN	Grand Canyon National Park Airport	35.952362	-112.14697	6609	-7	N	America/Phoenix
GCW	Grand Canyon West Airport	35.5925	-113.4859	4825	-7	U	America/Phoenix
GDV	Dawson Community Airport	47.13861	-104.80722	749	-7	A	America/Denver
GDW	Gladwin Zettel Memorial Airport	43.97059	-84.47502	774	-5	A	America/New_York
GED	Sussex Co	38.689194	-75.35889	50	-5	A	America/New_York
GEG	Spokane Intl	47.61986	-117.53384	2376	-8	A	America/Los_Angeles
GEU	Glendale Municipal Airport	33.526917	-112.295135	1071	-7	N	America/Phoenix
GFK	Grand Forks Intl	47.949257	-97.17611	845	-6	A	America/Chicago
GFL	Floyd Bennett Memorial Airport	43.34122	-73.610306	328	-5	A	America/New_York
GGE	Georgetown County Airport	33.3114	-79.32031	40	-5	A	America/New_York
GGG	East Texas Rgnl	32.384014	-94.71149	365	-6	A	America/Chicago
GGW	Wokal Field Glasgow International Airport	48.2125	-106.615	2296	-7	A	America/Denver
GHG	Marshfield Municipal Airport	42.09825	-70.67214	9	-5	A	America/New_York
GIF	Gilbert Airport	28.062778	-81.753334	145	-5	A	America/New_York
GJT	Grand Junction Regional	39.122414	-108.52673	4858	-7	A	America/Denver
GKN	Gulkana	62.15489	-145.45663	1580	-9	A	America/Anchorage
GKY	Arlington Municipal	32.66386	-97.09428	628	-6	A	America/Chicago
GLD	Renner Fld	39.37062	-101.69899	3656	-7	A	America/Denver
GLH	Mid Delta Regional Airport	33.4829	-90.9856	131	-6	A	America/Chicago
GLS	Scholes Intl At Galveston	29.265322	-94.860405	6	-6	A	America/Chicago
GLV	Golovin Airport	64.55055	-163.00722	59	-9	A	America/Anchorage
GNT	Grants Milan Muni	35.167286	-107.90199	6537	-7	A	America/Denver
GNU	Goodnews Airport	59.1175	-161.5775	15	-9	A	America/Anchorage
GNV	Gainesville Rgnl	29.690056	-82.271774	152	-5	A	America/New_York
GON	Groton New London	41.330055	-72.045135	9	-5	A	America/New_York
GPT	Gulfport-Biloxi	30.407278	-89.070114	28	-6	A	America/Chicago
GPZ	Grand Rapids Itasca County	47.21111	-93.50972	413	-6	A	America/Chicago
GQQ	Galion Municipal Airport	40.753387	-82.72381	1224	-5	A	America/New_York
GRB	Austin Straubel Intl	44.485073	-88.129585	695	-6	A	America/Chicago
GRF	Gray Aaf	47.079216	-122.58078	302	-8	A	America/Los_Angeles
GRI	Central Nebraska Regional Airport	40.9675	-98.3096	1847	-6	A	America/Chicago
GRK	Robert Gray Aaf	31.06725	-97.82892	1015	-6	A	America/Chicago
GRM	Grand Marais Cook County Airport	47.838333	-90.38294	1799	-6	U	America/Chicago
GRR	Gerald R Ford Intl	42.880833	-85.522804	794	-5	A	America/New_York
GSB	Seymour Johnson Afb	35.339382	-77.96059	110	-5	A	America/New_York
GSO	Piedmont Triad	36.09775	-79.93731	925	-5	A	America/New_York
GSP	Greenville-Spartanburg International	34.895557	-82.21889	964	-5	A	America/New_York
GST	Gustavus Airport	58.4253	-135.707	34	-9	A	America/Anchorage
GTB	Wheeler Sack Aaf	44.05562	-75.71946	690	-5	A	America/New_York
GTF	Great Falls Intl	47.482	-111.37069	3677	-7	A	America/Denver
GTR	Golden Triangle Regional Airport	33.450333	-88.59136	264	-6	A	America/Chicago
GTU	Georgetown Municipal Airport	30.678808	-97.67938	790	-6	A	America/Chicago
GUC	Gunnison - Crested Butte	38.53389	-106.93306	7678	-7	A	America/Denver
GUP	Gallup Muni	35.51106	-108.78931	6472	-7	A	America/Denver
GUS	Grissom Arb	40.648094	-86.15212	812	-5	A	America/New_York
GVL	Lee Gilmer Memorial Airport	34.27263	-83.83022	1276	-5	A	America/New_York
GVQ	Genesee County Airport	43.03175	-78.16967	914	-5	A	America/New_York
GVT	Majors	33.06784	-96.06533	535	-6	A	America/Chicago
GWO	Greenwood Leflore	33.494328	-90.08471	162	-6	A	America/Chicago
GYY	Gary Chicago International Airport	41.6163	-87.4128	591	-6	A	America/Chicago
HBG	Hattiesburg Bobby L. Chain Municipal Airport	31.264944	-89.25289	151	-6	A	America/Chicago
HBR	Hobart Muni	34.991306	-99.05135	1564	-6	A	America/Chicago
HCC	Columbia County	42.2913	-73.7103	198	-5	A	America/New_York
HCR	Holy Cross Airport	62.1883	-159.775	70	-9	A	America/Anchorage
HDH	Dillingham	21.579475	-158.19728	14	-10	A	Pacific/Honolulu
HDI	Hardwick Field Airport	35.22	-84.83237	874	-5	A	America/New_York
HDN	Yampa Valley	40.481182	-107.21766	6602	-7	A	America/Denver
HDO	Hondo Municipal Airport	29.3591	-99.1775	930	-6	A	America/Chicago
HFD	Hartford Brainard	41.73672	-72.649445	18	-5	A	America/New_York
HGR	Hagerstown Regional Richard A Henson Field	39.7079	-77.7295	704	-5	A	America/New_York
HHH	Hilton Head	32.216	-80.752	10	-5	U	America/New_York
HHI	Wheeler Aaf	21.4835	-158.03967	837	-10	A	Pacific/Honolulu
HHR	Jack Northrop Fld Hawthorne Muni	33.92284	-118.33518	66	-8	A	America/Los_Angeles
HIB	Chisholm Hibbing	47.3866	-92.839	1353	-6	A	America/Chicago
HIF	Hill Afb	41.12394	-111.97304	4789	-7	A	America/Denver
HII	Lake Havasu City Airport	34.57111	-114.35828	783	-7	N	America/Phoenix
HIO	Portland Hillsboro	45.540394	-122.94982	204	-8	A	America/Los_Angeles
HKB	Healy River Airport	63.8675	-148.96889	1263	-9	A	America/Anchorage
HKY	Hickory Rgnl	35.741146	-81.38955	1189	-5	A	America/New_York
HLG	Wheeling Ohio County Airport	40.175	-80.6463	1195	-5	A	America/New_York
HLN	Helena Rgnl	46.606808	-111.98275	3877	-7	A	America/Denver
HLR	Hood Aaf	31.138731	-97.71447	924	-6	A	America/Chicago
HMN	Holloman Afb	32.85252	-106.10652	4093	-7	A	America/Denver
HNH	Hoonah Airport	58.09611	-135.40973	19	-9	A	America/Anchorage
HNL	Honolulu Intl	21.318682	-157.92242	13	-10	N	Pacific/Honolulu
HNM	Hana	20.795635	-156.01443	78	-10	A	Pacific/Honolulu
HNS	Haines Airport	59.2438	-135.524	15	-9	A	America/Anchorage
HOB	Lea Co Rgnl	32.687527	-103.217026	3661	-7	A	America/Denver
HOM	Homer	59.645557	-151.47658	84	-9	A	America/Anchorage
HON	Huron Rgnl	44.3852	-98.22854	1289	-6	A	America/Chicago
HOP	Campbell Aaf	36.668568	-87.496185	573	-6	A	America/Chicago
HOT	Memorial Field	34.478	-93.0962	540	-6	A	America/Chicago
HOU	William P Hobby	29.645418	-95.27889	46	-6	A	America/Chicago
HPB	Hooper Bay Airport	61.5239	-166.147	7	-9	A	America/Anchorage
HPN	Westchester Co	41.06696	-73.70757	439	-5	A	America/New_York
HQM	Bowerman Field	46.971195	-123.936554	18	-8	A	America/Los_Angeles
HQU	McDuffie County Airport	33.52973	-82.51695	501	-5	A	America/New_York
HRL	Valley Intl	26.2285	-97.65439	36	-6	A	America/Chicago
HRO	Boone Co	36.26152	-93.15473	1365	-6	A	America/Chicago
HRT	Hurlburt Fld	30.427803	-86.68928	38	-6	A	America/Chicago
HSH	Henderson Executive Airport	35.97278	-115.134445	1881	-8	A	America/Los_Angeles
HSL	Huslia Airport	65.69778	-156.3514	213	-9	A	America/Anchorage
HST	Homestead Arb	25.48855	-80.38357	6	-5	A	America/New_York
HSV	Huntsville International Airport-Carl T Jones Field	34.637196	-86.775055	629	-6	A	America/Chicago
HTL	Roscommon Co	44.359806	-84.67111	1150	-5	A	America/New_York
HTS	Tri State Milton J Ferguson Field	38.3667	-82.558	828	-5	A	America/New_York
HUA	Redstone Aaf	34.678654	-86.684784	685	-6	A	America/Chicago
HUF	Terre Haute Intl Hulman Fld	39.451466	-87.30756	589	-5	A	America/New_York
HUL	Houlton Intl	46.12308	-67.79205	489	-5	A	America/New_York
HUS	Hughes Airport	66.03917	-154.26472	299	-9	A	America/Anchorage
HUT	Hutchinson Municipal Airport	38.0655	-97.8606	1543	-6	A	America/Chicago
HVN	Tweed-New Haven Airport	41.26375	-72.8868	14	-5	A	America/New_York
HVR	Havre City Co	48.542984	-109.762344	2590	-7	A	America/Denver
HWD	Hayward Executive Airport	37.65889	-122.121666	52	-8	A	America/Los_Angeles
HWO	North Perry	26.001223	-80.24072	8	-5	A	America/New_York
HXD	Hilton Head Airport	32.22436	-80.69747	19	-5	A	America/New_York
HYA	Barnstable Muni Boardman Polando Fld	41.669334	-70.28036	55	-5	A	America/New_York
HYG	Hydaburg Seaplane Base	55.20639	-132.82834	0	-9	A	America/Anchorage
HYL	Hollis Seaplane Base	55.481667	-132.64612	0	-9	A	America/Anchorage
HYS	Hays Regional Airport	38.8422	-99.2732	1998	-6	A	America/Chicago
HZL	Hazleton Municipal	40.989166	-76.0025	1603	-5	A	America/New_York
IAB	Mc Connell Afb	37.621853	-97.26819	1371	-6	A	America/Chicago
IAD	Washington Dulles Intl	38.944534	-77.45581	313	-5	A	America/New_York
IAG	Niagara Falls Intl	43.107334	-78.9462	589	-5	A	America/New_York
IAH	George Bush Intercontinental	29.984432	-95.34144	97	-6	A	America/Chicago
IAN	Bob Baker Memorial Airport	66.97583	-160.43666	166	-9	A	America/Anchorage
ICT	Wichita Mid Continent	37.649944	-97.43306	1333	-6	A	America/Chicago
ICY	Icy Bay Airport	59.968887	-141.66167	50	-9	A	America/Anchorage
IDA	Idaho Falls Rgnl	43.514557	-112.07075	4744	-7	A	America/Denver
IDL	Idlewild Intl	40.63975	-73.77892	13	-5	A	America/New_York
IFP	Laughlin-Bullhead Intl	35.1574	-114.56	695	-7	A	America/Phoenix
IGG	Igiugig Airport	59.324	-155.902	90	-9	A	America/Anchorage
IGM	Kingman Airport	35.2595	-113.938	3449	-7	A	America/Phoenix
IGQ	Lansing Municipal	41.534916	-87.529526	620	-6	A	America/Chicago
IJD	Windham Airport	41.744026	-72.18022	246	-5	A	America/New_York
IKK	Greater Kankakee	41.07139	-87.846275	630	-6	A	America/Chicago
IKO	Nikolski Air Station	52.941666	-168.84889	77	-9	A	America/Anchorage
IKR	Kirtland Air Force Base	35.040222	-106.60919	5355	-7	A	America/Denver
IKV	Ankeny Regl Airport	41.691387	-93.56639	910	-6	A	America/Chicago
ILG	New Castle	39.678722	-75.60653	79	-5	A	America/New_York
ILI	Iliamna	59.754356	-154.91096	186	-9	A	America/Anchorage
ILM	Wilmington Intl	34.270615	-77.90257	32	-5	A	America/New_York
ILN	Wilmington Airborne Airpark	39.42792	-83.792114	1077	-5	U	America/New_York
IMM	Immokalee	26.43389	-81.40139	37	-5	A	America/New_York
IMT	Ford Airport	45.81836	-88.114555	1182	-6	A	America/Chicago
IND	Indianapolis Intl	39.71733	-86.29438	797	-5	A	America/New_York
INJ	Hillsboro Muni	32.083485	-97.09723	685	-6	A	America/Chicago
INK	Winkler Co	31.779629	-103.20136	2822	-6	A	America/Chicago
INL	Falls Intl	48.566185	-93.40307	1185	-6	A	America/Chicago
INS	Creech Afb	36.587185	-115.673355	3133	-8	A	America/Los_Angeles
INT	Smith Reynolds	36.13372	-80.222	969	-5	A	America/New_York
INW	Winslow-Lindbergh Regional Airport	35.021915	-110.72253	4941	-7	N	America/Phoenix
IOW	Iowa City Municipal Airport	41.639244	-91.5465	668	-6	A	America/Chicago
IPL	Imperial Co	32.83422	-115.57874	-54	-8	A	America/Los_Angeles
IPT	Williamsport Rgnl	41.241837	-76.9211	529	-5	A	America/New_York
IRC	Circle City Airport	65.82778	-144.07611	613	-9	A	America/Anchorage
IRK	Kirksville Regional Airport	40.0935	-92.5449	966	-6	A	America/Chicago
ISM	Kissimmee Gateway Airport	28.289806	-81.43708	82	-5	A	America/New_York
ISN	Sloulin Fld Intl	48.17794	-103.64235	1982	-6	A	America/Chicago
ISO	Kinston Regional Jetport	35.33139	-77.60889	94	-5	A	America/New_York
ISP	Long Island Mac Arthur	40.79525	-73.10022	99	-5	A	America/New_York
ISW	Alexander Field South Wood County Airport	44.360645	-89.83814	1021	-6	A	America/Chicago
ITH	Ithaca Tompkins Rgnl	42.491028	-76.45844	1099	-5	A	America/New_York
ITO	Hilo Intl	19.721375	-155.04846	38	-10	N	Pacific/Honolulu
IWD	Gogebic Iron County Airport	46.527473	-90.13139	1230	-6	U	America/Chicago
IWS	West Houston	29.818193	-95.67261	111	-6	A	America/Chicago
IYK	Inyokern Airport	35.65889	-117.829445	2455	-8	A	America/Los_Angeles
IZG	Eastern Slopes Regional	43.99114	-70.94789	455	-5	A	America/New_York
JAC	Jackson Hole Airport	43.607334	-110.73775	6451	-7	A	America/Denver
JAN	Jackson Evers Intl	32.31117	-90.07589	346	-6	A	America/Chicago
JAX	Jacksonville Intl	30.494057	-81.68786	30	-5	A	America/New_York
JBR	Jonesboro Muni	35.831707	-90.646416	262	-6	A	America/Chicago
JCI	New Century AirCenter Airport	38.830917	-94.890305	1087	-6	A	America/Chicago
JEF	Jefferson City Memorial Airport	38.5912	-92.1561	549	-6	A	America/Chicago
JES	Jesup-Wayne County Airport	31.553888	-81.8825	107	-5	A	America/New_York
JFK	John F Kennedy Intl	40.63975	-73.77892	13	-5	A	America/New_York
JGC	Grand Canyon Heliport	35.966667	-112.13333	2500	-7	A	America/Phoenix
JHM	Kapalua	20.962936	-156.67303	256	-10	N	Pacific/Honolulu
JHW	Chautauqua County-Jamestown	42.15333	-79.25806	525	-5	A	America/New_York
JKA	Jack Edwards Airport	30.289639	-87.671776	17	-6	A	America/Chicago
JLN	Joplin Rgnl	37.151814	-94.49827	981	-6	A	America/Chicago
JMS	Jamestown Regional Airport	46.9297	-98.6782	1498	-6	A	America/Chicago
JNU	Juneau Intl	58.354973	-134.57628	21	-9	A	America/Anchorage
JOT	Regional Airport	41.517776	-88.17555	582	-6	A	America/Chicago
JRA	West 30th St. Heliport	40.7545	-74.0071	7	-5	A	America/New_York
JRB	Wall Street Heliport	40.701214	-74.009026	7	-5	A	America/New_York
JST	John Murtha Johnstown-Cambria County Airport	40.316113	-78.833885	2284	-5	A	America/New_York
JVL	Southern Wisconsin Regional Airport	42.62025	-89.04156	808	-6	A	America/Chicago
JXN	Reynolds Field	42.260555	-84.460556	1001	-5	A	America/New_York
JYL	Plantation Airpark	32.64528	-81.597115	188	-5	A	America/New_York
JYO	Leesburg Executive Airport	39.078	-77.558	389	-5	A	America/New_York
JZP	Pickens County Airport	34.453472	-84.45722	1535	-5	A	America/New_York
K03	Wainwright As	70.61338	-159.86035	35	-9	A	America/Anchorage
K27	Burrello-Mechanicville Airport	42.89313	-73.66845	195	-5	A	America/New_York
K83	Sabetha Municipal	39.5425	-95.4677	1330	-6	A	America/Chicago
KAE	Kake Seaplane Base	56.973057	-133.94556	0	-9	A	America/Anchorage
KAL	Kaltag Airport	64.3191	-158.741	187	-9	A	America/Anchorage
KBC	Birch Creek Airport	66.25671	-145.81532	450	-9	A	America/Anchorage
KBW	Chignik Bay Seaplane Base	56.295555	-158.4014	0	-9	A	America/Anchorage
KCC	Coffman Cove Seaplane Base	56.01472	-132.8339	0	-9	A	America/Anchorage
KCL	Chignik Lagoon Airport	56.31111	-158.53416	25	-9	A	America/Anchorage
KCQ	Chignik Lake Airport	56.255	-158.77528	50	-9	A	America/Anchorage
KEH	Kenmore Air Harbor Inc Seaplane Base	47.7548	-122.259	14	-8	A	America/Los_Angeles
KEK	Ekwok Airport	59.356945	-157.47112	135	-9	A	America/Anchorage
KFP	False Pass Airport	54.8475	-163.41028	20	-9	A	America/Anchorage
KGK	Koliganek Airport	59.726665	-157.25945	269	-9	A	America/Anchorage
KGX	Grayling Airport	62.894444	-160.065	99	-9	A	America/Anchorage
KKA	Koyuk Alfred Adams Airport	64.939445	-161.15416	154	-9	A	America/Anchorage
KKB	Kitoi Bay Seaplane Base	58.190834	-152.37056	0	-9	A	America/Anchorage
KKH	Kongiganak Airport	59.960835	-162.8811	30	-9	A	America/Anchorage
KLG	Kalskag Airport	61.5363	-160.341	55	-9	A	America/Anchorage
KLL	Levelock Airport	59.128056	-156.85861	39	-9	A	America/Anchorage
KLN	Larsen Bay Airport	57.535	-153.97667	87	-9	A	America/Anchorage
KLS	Kelso Longview	46.118	-122.89839	20	-8	A	America/Los_Angeles
KLW	Klawock Airport	55.579166	-133.07611	80	-9	A	America/Anchorage
KMO	Manokotak Airport	58.990276	-159.05	51	-9	A	America/Anchorage
KMY	Moser Bay Seaplane Base	57.025555	-154.14583	0	-9	A	America/Anchorage
KNW	New Stuyahok Airport	59.4499	-157.328	302	-9	A	America/Anchorage
KOA	Kona Intl At Keahole	19.738768	-156.04562	47	-10	N	Pacific/Honolulu
KOT	Kotlik Airport	63.030556	-163.53278	15	-9	A	America/Anchorage
KOY	Olga Bay Seaplane Base	57.16139	-154.22972	0	-9	A	America/Anchorage
KOZ	Ouzinkie Airport	57.922874	-152.5005	55	-9	A	America/Anchorage
KPB	Point Baker Seaplane Base	56.351944	-133.6225	0	-9	A	America/Anchorage
KPC	Port Clarence Coast Guard Station	65.2537	-166.859	10	-9	A	America/Anchorage
KPN	Kipnuk Airport	59.933056	-164.03056	11	-9	A	America/Anchorage
KPR	Port Williams Seaplane Base	58.49	-152.58223	0	-9	A	America/Anchorage
KPV	Perryville Airport	55.906666	-159.16083	29	-9	A	America/Anchorage
KPY	Port Bailey Seaplane Base	57.93	-153.04056	0	-9	A	America/Anchorage
KQA	Akutan Seaplane Base	54.1325	-165.785	0	-9	A	America/Anchorage
KSM	St Marys Airport	62.0605	-163.302	311	-9	A	America/Anchorage
KTB	Thorne Bay Seaplane Base	55.688057	-132.53667	0	-9	A	America/Anchorage
KTN	Ketchikan Intl	55.355556	-131.71375	88	-9	A	America/Anchorage
KTS	Brevig Mission Airport	65.33139	-166.46584	35	-9	A	America/Anchorage
KUK	Kasigluk Airport	60.873333	-162.52444	40	-9	A	America/Anchorage
KVC	King Cove Airport	55.1163	-162.266	155	-9	A	America/Anchorage
KVL	Kivalina Airport	67.7362	-164.563	13	-9	A	America/Anchorage
KWK	Kwigillingok Airport	59.87639	-163.16861	18	-9	A	America/Anchorage
KWN	Quinhagak Airport	59.755	-161.84528	42	-9	A	America/Anchorage
KWP	West Point Village Seaplane Base	57.77	-153.54889	0	-9	A	America/Anchorage
KWT	Kwethluk Airport	60.79028	-161.4436	30	-9	A	America/Anchorage
KYK	Karuluk Airport	57.566944	-154.45027	137	-9	A	America/Anchorage
KYU	Koyukuk Airport	64.87583	-157.73056	149	-9	A	America/Anchorage
KZB	Zachar Bay Seaplane Base	57.55	-153.75	0	-9	A	America/Anchorage
L06	Furnace Creek	36.273	-116.515	0	-8	A	America/Los_Angeles
L35	Big Bear City	34.26378	-116.856026	6725	-8	A	America/Los_Angeles
L52	Oceano County Airport	35.10147	-120.62236	14	-8	U	America/Los_Angeles
LAA	Lamar Muni	38.069695	-102.6885	3706	-7	A	America/Denver
LAF	Purude University Airport	40.412304	-86.93689	606	-5	A	America/New_York
LAL	Lakeland Linder Regional Airport	27.988916	-82.018555	142	-5	A	America/New_York
LAM	Los Alamos Airport	35.879803	-106.26942	7171	-7	A	America/Denver
LAN	Capital City	42.7787	-84.58736	861	-5	A	America/New_York
LAR	Laramie Regional Airport	41.3121	-105.675	7284	-7	A	America/Denver
LAS	Mc Carran Intl	36.080055	-115.15225	2141	-8	A	America/Los_Angeles
LAW	Lawton-Fort Sill Regional Airport	34.567715	-98.41663	1110	-6	A	America/Chicago
LAX	Los Angeles Intl	33.942535	-118.40807	126	-8	A	America/Los_Angeles
LBB	Lubbock Preston Smith Intl	33.66364	-101.82278	3282	-6	A	America/Chicago
LBE	Arnold Palmer Regional Airport	40.2759	-79.4048	1185	-5	A	America/New_York
LBF	North Platte Regional Airport Lee Bird Field	41.1262	-100.684	2776	-6	A	America/Chicago
LBL	Liberal Muni	37.044224	-100.95986	2885	-6	A	America/Chicago
LBT	Municipal Airport	34.609806	-79.059555	125	-5	A	America/New_York
LCH	Lake Charles Rgnl	30.126112	-93.223335	15	-6	A	America/Chicago
LCK	Rickenbacker Intl	39.813786	-82.92782	744	-5	A	America/New_York
LCQ	Lake City Municipal Airport	30.181944	-82.57694	201	-5	A	America/New_York
LDJ	Linden Airport	40.617447	-74.24459	23	-5	A	America/New_York
LEB	Lebanon Municipal Airport	43.6261	-72.3042	603	-5	A	America/New_York
LEW	Lewiston Maine	44.048473	-70.28351	288	-5	A	America/New_York
LEX	Blue Grass	38.0365	-84.60589	979	-5	A	America/New_York
LFI	Langley Afb	37.082882	-76.36055	11	-5	A	America/New_York
LFK	Angelina Co	31.234015	-94.75	296	-6	A	America/Chicago
LFT	Lafayette Rgnl	30.205278	-91.98761	43	-6	A	America/Chicago
LGA	La Guardia	40.777245	-73.872604	22	-5	A	America/New_York
LGB	Long Beach	33.817722	-118.15161	60	-8	A	America/Los_Angeles
LGC	LaGrange-Callaway Airport	33.00886	-85.07261	694	-5	A	America/New_York
LGU	Logan-Cache	41.791	-111.852	4457	-7	A	America/Denver
LHD	Lake Hood Seaplane Base	61.186638	-149.9654	71	-9	A	America/Anchorage
LHM	Lincoln Regional Airport Karl Harder Field	38.90917	-121.35133	121	-8	A	America/Los_Angeles
LHV	William T. Piper Mem.	41.135777	-77.4223	556	-5	A	America/New_York
LHX	La Junta Muni	38.04972	-103.50943	4238	-7	A	America/Denver
LIH	Lihue	21.975983	-159.33896	153	-10	N	Pacific/Honolulu
LIT	Adams Fld	34.729443	-92.224304	262	-6	A	America/Chicago
LIV	Livingood Airport	65.53111	-148.5411	696	-9	A	America/Anchorage
LKE	Kenmore Air Harbor Seaplane Base	47.629	-122.339	14	-8	A	America/Los_Angeles
LKK	Kulik Lake Airport	58.96591	-155.1081	1000	-9	U	America/Anchorage
LKP	Lake Placid Airport	44.264442	-73.961945	1747	-5	A	America/New_York
LMT	Klamath Falls Airport	42.1561	-121.733	4095	-8	A	America/Los_Angeles
LNA	Palm Beach Co Park	26.593	-80.08505	14	-5	A	America/New_York
LNK	Lincoln	40.85097	-96.75925	1219	-6	A	America/Chicago
LNN	Lost Nation Municipal Airport	41.68403	-81.38975	626	-5	A	America/New_York
LNR	Tri-County Regional Airport	43.211666	-90.18166	718	-6	A	America/Chicago
LNS	Lancaster Airport	40.1217	-76.2961	403	-5	A	America/New_York
LNY	Lanai	20.78561	-156.95142	1308	-10	N	Pacific/Honolulu
LOT	Lewis University Airport	41.606327	-88.083	680	-6	A	America/Chicago
LOU	Bowman Fld	38.228	-85.66372	546	-5	A	America/New_York
LOZ	London-Corbin Airport-MaGee Field	37.086887	-84.07739	1212	-5	A	America/New_York
LPC	Lompoc Airport	34.6656	-120.4675	88	-8	A	America/Los_Angeles
LPR	Lorain County Regional Airport	41.344276	-82.177635	793	-5	A	America/New_York
LPS	Lopez Island Airport	48.4839	-122.938	209	-8	A	America/Los_Angeles
LRD	Laredo Intl	27.54375	-99.461555	508	-6	A	America/Chicago
LRF	Little Rock Afb	34.916943	-92.14972	311	-6	A	America/Chicago
LRO	Mount Pleasant Regional-Faison Field	32.5387	-79.4697	12	-5	A	\N
LRU	Las Cruces Intl	32.289417	-106.921974	4456	-7	A	America/Denver
LSE	La Crosse Municipal	43.878986	-91.256714	654	-6	A	America/Chicago
LSF	Lawson Aaf	32.337322	-84.99128	232	-5	A	America/New_York
LSV	Nellis Afb	36.2362	-115.034256	1870	-8	A	America/Los_Angeles
LTS	Altus Afb	34.66707	-99.26668	1382	-6	A	America/Chicago
LUF	Luke Afb	33.535	-112.38306	1085	-7	A	America/Phoenix
LUK	Cincinnati Muni Lunken Fld	39.103333	-84.41861	483	-5	A	America/New_York
LUP	Kalaupapa Airport	21.211	-156.974	24	-10	A	Pacific/Honolulu
LUR	Cape Lisburne Lrrs	68.87513	-166.11002	12	-9	A	America/Anchorage
LVK	Livermore Municipal	37.41362	-121.49133	400	-8	A	America/Los_Angeles
LVM	Mission Field Airport	45.69939	-110.4483	4660	-7	A	America/Denver
LVS	Las Vegas Muni	35.65422	-105.14239	6877	-7	A	America/Denver
LWA	South Haven Area Regional Airport	42.351196	-86.25564	666	-5	A	America/New_York
LWB	Greenbrier Valley Airport	37.858334	-80.399445	2302	-5	U	America/New_York
LWC	Lawrence Municipal	39.009167	-95.2175	833	-6	A	America/Chicago
LWM	Lawrence Municipal Airport	42.717194	-71.12341	148	-5	A	America/New_York
LWS	Lewiston Nez Perce Co	46.3745	-117.01539	1442	-8	A	America/Los_Angeles
LWT	Lewistown Municipal Airport	47.0493	-109.467	4170	-7	A	America/Denver
LXY	Mexia - Limestone County Airport	31.641178	-96.51446	544	-6	A	America/Chicago
LYH	Lynchburg Regional Preston Glenn Field	37.3267	-79.2004	938	-5	A	America/New_York
LYU	Ely Municipal	47.824444	-91.83083	1456	-6	A	America/Chicago
LZU	Gwinnett County Airport-Briscoe Field	33.978077	-83.96238	1061	-5	A	America/New_York
M94	Desert Aire	46.4124	-119.5518	586	-8	A	America/Los_Angeles
MAE	Madera Municipal Airport	36.98861	-120.11244	255	-8	A	America/Los_Angeles
MAF	Midland Intl	31.942528	-102.20191	2871	-6	A	America/Chicago
MBL	Manistee County-Blacker Airport	44.2725	-86.24694	621	-5	A	America/New_York
MBS	Mbs Intl	43.532913	-84.07964	668	-5	A	America/New_York
MCC	Mc Clellan Afld	38.66764	-121.40061	75	-8	A	America/Los_Angeles
MCD	Mackinac Island Airport	45.864933	-84.637344	740	-5	U	America/New_York
MCE	Merced Municipal Airport	37.28472	-120.513885	156	-8	A	America/Los_Angeles
MCF	Macdill Afb	27.849339	-82.52122	14	-5	A	America/New_York
MCG	McGrath Airport	62.9529	-155.606	338	-9	A	America/Anchorage
MCI	Kansas City Intl	39.297607	-94.713905	1026	-6	A	America/Chicago
MCK	McCook Regional Airport	40.20639	-100.592224	2583	-6	A	America/Chicago
MCL	McKinley National Park Airport	63.732758	-148.91129	1720	-9	A	America/Anchorage
MCN	Middle Georgia Rgnl	32.69285	-83.64921	354	-5	A	America/New_York
MCO	Orlando Intl	28.429394	-81.30899	96	-5	A	America/New_York
MCW	Mason City Municipal	43.2247	-93.4067	1243	-6	A	America/Chicago
MDT	Harrisburg Intl	40.193493	-76.763405	310	-5	A	America/New_York
MDW	Chicago Midway Intl	41.785973	-87.75242	620	-6	A	America/Chicago
ME5	Banks Airport	44.16539	-68.42817	100	-5	A	America/New_York
MEI	Key Field	32.332623	-88.75187	297	-6	A	America/Chicago
MEM	Memphis Intl	35.042416	-89.97667	341	-6	A	America/Chicago
MER	Castle	37.38048	-120.56819	189	-8	A	America/Los_Angeles
MFD	Mansfield Lahm Regional	40.821415	-82.51664	1297	-5	A	America/New_York
MFE	Mc Allen Miller Intl	26.175833	-98.23861	107	-6	A	America/Chicago
MFI	Marshfield Municipal Airport	44.63688	-90.18932	1278	-6	A	America/Chicago
MFR	Rogue Valley Intl Medford	42.37423	-122.8735	1335	-8	A	America/Los_Angeles
MGC	Michigan City Municipal Airport	41.7033	-86.8211	500	-6	A	America/Chicago
MGE	Dobbins Arb	33.915382	-84.51632	1068	-5	A	America/New_York
MGJ	Orange County Airport	41.509987	-74.26464	364	-5	A	America/New_York
MGM	Montgomery Regional Airport	32.30064	-86.393974	221	-6	A	America/Chicago
MGR	Moultrie Municipal Airport	31.084917	-83.80325	294	-5	A	America/New_York
MGW	Morgantown Muni Walter L Bill Hart Fld	39.642906	-79.91631	1248	-5	A	America/New_York
MGY	Dayton-Wright Brothers Airport	39.588974	-84.22486	957	-5	U	America/New_York
MHK	Manhattan Reigonal	39.140972	-96.67083	1057	-6	A	America/Chicago
MHM	Minchumina Airport	63.886112	-152.30194	678	-9	A	America/Anchorage
MHR	Sacramento Mather	38.553898	-121.29759	96	-8	A	America/Los_Angeles
MHT	Manchester Regional Airport	42.932556	-71.43567	266	-5	A	America/New_York
MHV	Mojave	35.059364	-118.151855	2791	-8	A	America/Los_Angeles
MIA	Miami Intl	25.79325	-80.29056	8	-5	A	America/New_York
MIB	Minot Afb	48.415573	-101.35766	1668	-6	A	America/Chicago
MIC	Crystal Airport	45.0343	-93.2114	869	-6	A	America/Chicago
MIE	Delaware County Airport	40.242474	-85.39575	937	-5	U	America/New_York
MIV	Millville Muni	39.367805	-75.07222	85	-5	A	America/New_York
MKC	Downtown	39.1275	-94.59889	759	-6	A	America/Chicago
MKE	General Mitchell Intl	42.947224	-87.89658	723	-6	A	America/Chicago
MKG	Muskegon County Airport	43.1695	-86.2382	628	-5	A	America/New_York
MKK	Molokai	21.152885	-157.09625	454	-10	N	Pacific/Honolulu
MKL	Mc Kellar Sipes Rgnl	35.599888	-88.91561	434	-6	A	America/Chicago
MKO	Davis Fld	35.65649	-95.36665	612	-6	A	America/Chicago
MLB	Melbourne Intl	28.102753	-80.645256	33	-5	A	America/New_York
MLC	Mc Alester Rgnl	34.882404	-95.78346	770	-6	A	America/Chicago
MLD	Malad City	42.17	-112.289	4503	-7	A	America/Denver
MLI	Quad City Intl	41.44853	-90.50754	590	-6	A	America/Chicago
MLJ	Baldwin County Airport	33.154224	-83.24142	385	-5	A	America/New_York
MLL	Marshall Don Hunter Sr. Airport	61.864643	-162.02611	103	-9	A	America/Anchorage
MLS	Frank Wiley Field	46.428	-105.886	2630	-7	A	America/Denver
MLT	Millinocket Muni	45.647835	-68.68556	408	-5	A	America/New_York
MLU	Monroe Rgnl	32.510864	-92.03769	79	-6	A	America/Chicago
MLY	Manley Hot Springs Airport	64.9975	-150.64417	270	-9	A	America/Anchorage
MMH	Mammoth Yosemite Airport	37.62405	-118.83777	7128	-8	A	America/Los_Angeles
MMI	McMinn Co	35.39919	-84.56177	874	-5	N	America/New_York
MMU	Morristown Municipal Airport	40.79935	-74.41487	187	-5	A	America/New_York
MMV	Mc Minnville Muni	45.194443	-123.13594	163	-8	A	America/Los_Angeles
MNM	Menominee Marinette Twin Co	45.12665	-87.63844	625	-6	A	America/Chicago
MNT	Minto Airport	65.14361	-149.37	460	-9	A	America/Anchorage
MNZ	Manassas	38.72139	-77.51556	192	-5	A	America/New_York
MOB	Mobile Rgnl	30.69123	-88.24281	219	-6	A	America/Chicago
MOD	Modesto City Co Harry Sham	37.625816	-120.95442	97	-8	A	America/Los_Angeles
MOT	Minot Intl	48.259377	-101.280334	1716	-6	A	America/Chicago
MOU	Mountain Village Airport	62.0954	-163.682	337	-9	A	America/Anchorage
MPB	Miami Seaplane Base	25.7783	-80.1703	0	-5	A	America/New_York
MPI	MariposaYosemite	37.3039	-120.0222	2454	-8	A	America/Los_Angeles
MPV	Edward F Knapp State	44.203503	-72.562325	1165	-5	A	America/New_York
MQB	Macomb Municipal Airport	40.520084	-90.65239	707	-6	U	America/Chicago
MQI	Dare County Regional	35.5514	-75.4173	13	-5	A	America/New_York
MQT	Sawyer International Airport	46.35361	-87.39528	1221	-5	A	America/New_York
MRB	Eastern WV Regional Airport	39.2407	-77.591	554	-5	A	America/New_York
MRI	Merrill Fld	61.213543	-149.84445	137	-9	A	America/Anchorage
MRK	Marco Islands	25.995028	-81.67253	5	-5	A	America/New_York
MRN	Foothills Regional Airport	35.820232	-81.61151	1270	-5	A	America/New_York
MRY	Monterey Peninsula	36.587	-121.84294	257	-8	A	America/Los_Angeles
MSL	Northwest Alabama Regional Airport	34.7453	-87.6102	550	-6	A	America/Chicago
MSN	Dane Co Rgnl Truax Fld	43.13986	-89.33752	887	-6	A	America/Chicago
MSO	Missoula Intl	46.916306	-114.09055	3205	-7	A	America/Denver
MSP	Minneapolis St Paul Intl	44.881954	-93.22176	841	-6	A	America/Chicago
MSS	Massena Intl Richards Fld	44.935833	-74.84555	215	-5	A	America/New_York
MSY	Louis Armstrong New Orleans Intl	29.99339	-90.258026	4	-6	A	America/Chicago
MTC	Selfridge Angb	42.608334	-82.8355	580	-5	A	America/New_York
MTH	Florida Keys Marathon Airport	24.72611	-81.05139	7	-5	A	America/New_York
MTJ	Montrose Regional Airport	38.509792	-107.89424	5759	-7	A	America/Denver
MTM	Metlakatla Seaplane Base	55.13111	-131.57805	0	-9	A	America/Anchorage
MTN	Martin State	39.32567	-76.41378	22	-5	A	America/New_York
MUE	Waimea Kohala	20.001328	-155.6681	2671	-10	A	Pacific/Honolulu
MUI	Muir Aaf	40.43481	-76.56941	489	-5	A	America/New_York
MUO	Mountain Home Afb	43.043602	-115.87243	2996	-7	A	America/Denver
MVL	Morrisville Stowe State Airport	44.535	-72.614	732	-5	A	America/New_York
MVY	Martha\\\\'s Vineyard	41.391666	-70.61528	67	-5	A	America/New_York
MWA	Williamson Country Regional Airport	37.754955	-89.01109	472	-6	A	America/Chicago
MWC	Lawrence J Timmerman Airport	43.11039	-88.03442	745	-6	A	America/Chicago
MWH	Grant Co Intl	47.207706	-119.32019	1185	-8	A	America/Los_Angeles
MWL	Mineral Wells	32.781605	-98.06017	974	-6	A	America/Chicago
MWM	Windom Municipal Airport	43.913403	-95.109406	1410	-6	A	America/Chicago
MXF	Maxwell Afb	32.382942	-86.365776	171	-6	A	America/Chicago
MXY	McCarthy Airport	61.43706	-142.90308	1531	-9	U	America/Anchorage
MYF	Montgomery Field	32.4759	117.759	17	8	A	Asia/Chongqing
MYL	McCall Municipal Airport	44.88972	-116.10139	5021	-7	A	America/Denver
MYR	Myrtle Beach Intl	33.67975	-78.92833	25	-5	A	America/New_York
MYU	Mekoryuk Airport	60.3714	-166.271	48	-9	A	America/Anchorage
MYV	Yuba County Airport	39.0553	-121.3411	62	-8	A	America/Los_Angeles
MZJ	Pinal Airpark	32.509724	-111.32528	1893	-7	N	America/Phoenix
N53	Stroudsburg-Pocono Airport	41.035873	-75.16068	480	-5	A	America/New_York
N69	Stormville Airport	41.57697	-73.73235	358	-5	A	America/New_York
N87	Trenton-Robbinsville Airport	40.213943	-74.601776	118	-5	A	America/New_York
NBG	New Orleans Nas Jrb	29.825333	-90.035	3	-6	A	America/Chicago
NBU	Naval Air Station	42.090557	-87.8225	653	-6	A	America/Chicago
NCN	Chenega Bay Airport	60.07722	-147.99194	72	-9	A	America/Anchorage
NEL	Lakehurst Naes	40.033333	-74.35333	103	-5	A	America/New_York
NEW	Lakefront	30.042418	-90.02825	7	-6	A	America/Chicago
NFL	Fallon Nas	39.416584	-118.70098	3934	-8	A	America/Los_Angeles
NGF	Kaneohe Bay Mcaf	21.450453	-157.768	24	-10	A	Pacific/Honolulu
NGP	Corpus Christi NAS	27.692701	-97.290375	18	-6	A	America/Chicago
NGU	Norfolk Ns	36.937645	-76.28929	15	-5	A	America/New_York
NGZ	NAS Alameda	37.7861	-122.3186	10	-8	U	America/Los_Angeles
NHK	Patuxent River Nas	38.28598	-76.41178	39	-5	A	America/New_York
NIB	Nikolai Airport	63.010834	-154.3839	427	-9	A	America/Anchorage
NID	China Lake Naws	35.68542	-117.69204	2283	-8	A	America/Los_Angeles
NIP	Jacksonville Nas	30.235834	-81.68056	22	-5	A	America/New_York
NJK	El Centro Naf	32.829224	-115.67167	-42	-8	A	America/Los_Angeles
NKT	Cherry Point Mcas	34.90087	-76.88073	29	-5	A	America/New_York
NKX	Miramar Mcas	32.867695	-117.14175	478	-8	A	America/Los_Angeles
NLC	Lemoore Nas	36.33301	-119.95208	234	-8	A	America/Los_Angeles
NLG	Nelson Lagoon	56.0075	-161.16028	14	-9	A	America/Anchorage
NME	Nightmute Airport	60.47111	-164.70084	4	-9	A	America/Anchorage
NMM	Meridian Nas	32.552082	-88.55556	317	-6	A	America/Chicago
NNL	Nondalton Airport	59.966946	-154.85167	262	-9	A	America/Anchorage
NOW	Port Angeles Cgas	48.14148	-123.41408	13	-8	A	America/Los_Angeles
NPA	Pensacola Nas	30.352655	-87.31865	28	-6	A	America/Chicago
NPZ	Porter County Municipal Airport	41.45397	-87.00708	770	-6	A	America/Chicago
NQA	Millington Rgnl Jetport	35.356667	-89.87028	320	-6	A	America/Chicago
NQI	Kingsville Nas	27.507223	-97.80972	50	-6	A	America/Chicago
NQX	Key West Nas	24.575834	-81.68889	6	-5	A	America/New_York
NSE	Whiting Fld Nas North	30.724167	-87.02194	199	-6	A	America/Chicago
NTD	Point Mugu Nas	34.120285	-119.12094	13	-8	A	America/Los_Angeles
NTU	Oceana Nas	36.8207	-76.03354	22	-5	A	America/New_York
NUI	Nuiqsut Airport	70.21	-151.00555	38	-9	A	America/Anchorage
NUL	Nulato Airport	64.72945	-158.07417	399	-9	A	America/Anchorage
NUP	Nunapitchuk Airport	60.905834	-162.43916	12	-9	A	America/Anchorage
NUQ	Moffett Federal Afld	37.41614	-122.04914	32	-8	A	America/Los_Angeles
NUW	Whidbey Island Nas	48.351803	-122.65591	47	-8	A	America/Los_Angeles
NXP	Twentynine Palms Eaf	34.29616	-116.1622	2051	-8	A	America/Los_Angeles
NXX	Willow Grove Nas Jrb	40.199833	-75.14817	358	-5	A	America/New_York
NY9	Long Lake	43.975063	-74.42044	1629	-5	A	America/New_York
NYC	All Airports	40.71417	-74.00584	31	-5	A	America/New_York
NYG	Quantico Mcaf	38.501682	-77.305336	11	-5	A	America/New_York
NZC	Cecil Field	30.2187	-81.8767	81	-5	A	America/New_York
NZJ	El Toro	33.676132	-117.73116	383	-8	A	America/Los_Angeles
NZY	North Island Nas	32.69922	-117.21531	26	-8	A	America/Los_Angeles
O03	Morgantown Airport	40.15704	-75.87049	600	-5	A	America/New_York
O27	Oakdale Airport	37.756332	-120.80019	237	-8	A	America/Los_Angeles
OAJ	Albert J Ellis	34.829163	-77.61214	94	-5	A	America/New_York
OAK	Metropolitan Oakland Intl	37.72128	-122.22072	9	-8	A	America/Los_Angeles
OAR	Marina Muni	36.681877	-121.762344	134	-8	A	America/Los_Angeles
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: rpostgres; Owner: travis
--

COPY rpostgres.flights (year, month, day, dep_time, sched_dep_time, dep_delay, arr_time, sched_arr_time, arr_delay, carrier, flight, tailnum, origin, dest, air_time, distance, hour, minute, time_hour) FROM stdin;
2013	1	1	517	515	2	830	819	11	UA	1545	N14228	EWR	IAH	227	1400	5	15	2013-01-01 10:00:00+00
2013	1	1	533	529	4	850	830	20	UA	1714	N24211	LGA	IAH	227	1416	5	29	2013-01-01 10:00:00+00
2013	1	1	542	540	2	923	850	33	AA	1141	N619AA	JFK	MIA	160	1089	5	40	2013-01-01 10:00:00+00
2013	1	1	544	545	-1	1004	1022	-18	B6	725	N804JB	JFK	BQN	183	1576	5	45	2013-01-01 10:00:00+00
2013	1	1	554	600	-6	812	837	-25	DL	461	N668DN	LGA	ATL	116	762	6	0	2013-01-01 11:00:00+00
2013	1	1	554	558	-4	740	728	12	UA	1696	N39463	EWR	ORD	150	719	5	58	2013-01-01 10:00:00+00
2013	1	1	555	600	-5	913	854	19	B6	507	N516JB	EWR	FLL	158	1065	6	0	2013-01-01 11:00:00+00
2013	1	1	557	600	-3	709	723	-14	EV	5708	N829AS	LGA	IAD	53	229	6	0	2013-01-01 11:00:00+00
2013	1	1	557	600	-3	838	846	-8	B6	79	N593JB	JFK	MCO	140	944	6	0	2013-01-01 11:00:00+00
2013	1	1	558	600	-2	753	745	8	AA	301	N3ALAA	LGA	ORD	138	733	6	0	2013-01-01 11:00:00+00
2013	1	1	558	600	-2	849	851	-2	B6	49	N793JB	JFK	PBI	149	1028	6	0	2013-01-01 11:00:00+00
2013	1	1	558	600	-2	853	856	-3	B6	71	N657JB	JFK	TPA	158	1005	6	0	2013-01-01 11:00:00+00
2013	1	1	558	600	-2	924	917	7	UA	194	N29129	JFK	LAX	345	2475	6	0	2013-01-01 11:00:00+00
2013	1	1	558	600	-2	923	937	-14	UA	1124	N53441	EWR	SFO	361	2565	6	0	2013-01-01 11:00:00+00
2013	1	1	559	600	-1	941	910	31	AA	707	N3DUAA	LGA	DFW	257	1389	6	0	2013-01-01 11:00:00+00
2013	1	1	559	559	0	702	706	-4	B6	1806	N708JB	JFK	BOS	44	187	5	59	2013-01-01 10:00:00+00
2013	1	1	559	600	-1	854	902	-8	UA	1187	N76515	EWR	LAS	337	2227	6	0	2013-01-01 11:00:00+00
2013	1	1	600	600	0	851	858	-7	B6	371	N595JB	LGA	FLL	152	1076	6	0	2013-01-01 11:00:00+00
2013	1	1	600	600	0	837	825	12	MQ	4650	N542MQ	LGA	ATL	134	762	6	0	2013-01-01 11:00:00+00
2013	1	1	601	600	1	844	850	-6	B6	343	N644JB	EWR	PBI	147	1023	6	0	2013-01-01 11:00:00+00
2013	1	1	602	610	-8	812	820	-8	DL	1919	N971DL	LGA	MSP	170	1020	6	10	2013-01-01 11:00:00+00
2013	1	1	602	605	-3	821	805	16	MQ	4401	N730MQ	LGA	DTW	105	502	6	5	2013-01-01 11:00:00+00
2013	1	1	606	610	-4	858	910	-12	AA	1895	N633AA	EWR	MIA	152	1085	6	10	2013-01-01 11:00:00+00
2013	1	1	606	610	-4	837	845	-8	DL	1743	N3739P	JFK	ATL	128	760	6	10	2013-01-01 11:00:00+00
2013	1	1	607	607	0	858	915	-17	UA	1077	N53442	EWR	MIA	157	1085	6	7	2013-01-01 11:00:00+00
2013	1	1	608	600	8	807	735	32	MQ	3768	N9EAMQ	EWR	ORD	139	719	6	0	2013-01-01 11:00:00+00
2013	1	1	611	600	11	945	931	14	UA	303	N532UA	JFK	SFO	366	2586	6	0	2013-01-01 11:00:00+00
2013	1	1	613	610	3	925	921	4	B6	135	N635JB	JFK	RSW	175	1074	6	10	2013-01-01 11:00:00+00
2013	1	1	615	615	0	1039	1100	-21	B6	709	N794JB	JFK	SJU	182	1598	6	15	2013-01-01 11:00:00+00
2013	1	1	615	615	0	833	842	-9	DL	575	N326NB	EWR	ATL	120	746	6	15	2013-01-01 11:00:00+00
2013	1	1	622	630	-8	1017	1014	3	US	245	N807AW	EWR	PHX	342	2133	6	30	2013-01-01 11:00:00+00
2013	1	1	623	610	13	920	915	5	AA	1837	N3EMAA	LGA	MIA	153	1096	6	10	2013-01-01 11:00:00+00
2013	1	1	623	627	-4	933	932	1	UA	496	N459UA	LGA	IAH	229	1416	6	27	2013-01-01 11:00:00+00
2013	1	1	624	630	-6	909	840	29	EV	4626	N11107	EWR	MSP	190	1008	6	30	2013-01-01 11:00:00+00
2013	1	1	624	630	-6	840	830	10	MQ	4599	N518MQ	LGA	MSP	166	1020	6	30	2013-01-01 11:00:00+00
2013	1	1	627	630	-3	1018	1018	0	US	27	N535UW	JFK	PHX	330	2153	6	30	2013-01-01 11:00:00+00
2013	1	1	628	630	-2	1137	1140	-3	AA	413	N3BAAA	JFK	SJU	192	1598	6	30	2013-01-01 11:00:00+00
2013	1	1	628	630	-2	1016	947	29	UA	1665	N33289	EWR	LAX	366	2454	6	30	2013-01-01 11:00:00+00
2013	1	1	629	630	-1	824	810	14	AA	303	N3CYAA	LGA	ORD	140	733	6	30	2013-01-01 11:00:00+00
2013	1	1	629	630	-1	721	740	-19	WN	4646	N273WN	LGA	BWI	40	185	6	30	2013-01-01 11:00:00+00
2013	1	1	629	630	-1	824	833	-9	US	1019	N426US	EWR	CLT	91	529	6	30	2013-01-01 11:00:00+00
2013	1	1	632	608	24	740	728	12	EV	4144	N13553	EWR	IAD	52	212	6	8	2013-01-01 11:00:00+00
2013	1	1	635	635	0	1028	940	48	AA	711	N3GKAA	LGA	DFW	248	1389	6	35	2013-01-01 11:00:00+00
2013	1	1	637	645	-8	930	935	-5	B6	389	N709JB	LGA	MCO	144	950	6	45	2013-01-01 11:00:00+00
2013	1	1	639	640	-1	739	749	-10	B6	1002	N805JB	JFK	BOS	41	187	6	40	2013-01-01 11:00:00+00
2013	1	1	643	646	-3	922	940	-18	UA	556	N497UA	EWR	PBI	146	1023	6	46	2013-01-01 11:00:00+00
2013	1	1	643	645	-2	837	848	-11	US	926	N178US	EWR	CLT	91	529	6	45	2013-01-01 11:00:00+00
2013	1	1	644	636	8	931	940	-9	UA	1701	N75435	EWR	FLL	151	1065	6	36	2013-01-01 11:00:00+00
2013	1	1	645	647	-2	815	810	5	B6	102	N796JB	JFK	BUF	63	301	6	47	2013-01-01 11:00:00+00
2013	1	1	646	645	1	910	916	-6	UA	883	N569UA	LGA	DEN	243	1620	6	45	2013-01-01 11:00:00+00
2013	1	1	646	645	1	1023	1030	-7	UA	1496	N38727	EWR	SNA	380	2434	6	45	2013-01-01 11:00:00+00
2013	1	1	651	655	-4	936	942	-6	B6	203	N558JB	JFK	LAS	323	2248	6	55	2013-01-01 11:00:00+00
2013	1	1	652	655	-3	932	921	11	B6	117	N178JB	JFK	MSY	191	1182	6	55	2013-01-01 11:00:00+00
2013	1	1	653	700	-7	936	1009	-33	DL	1383	N327NW	LGA	PBI	149	1035	7	0	2013-01-01 12:00:00+00
2013	1	1	655	655	0	1021	1030	-9	DL	1415	N3763D	JFK	SLC	294	1990	6	55	2013-01-01 11:00:00+00
2013	1	1	655	700	-5	1037	1045	-8	DL	1865	N705TW	JFK	SFO	362	2586	7	0	2013-01-01 12:00:00+00
2013	1	1	655	700	-5	1002	1020	-18	DL	2003	N997DL	LGA	MIA	161	1096	7	0	2013-01-01 12:00:00+00
2013	1	1	656	700	-4	854	850	4	AA	305	N4WNAA	LGA	ORD	143	733	7	0	2013-01-01 12:00:00+00
2013	1	1	656	659	-3	949	959	-10	AA	1815	N5FMAA	JFK	MCO	142	944	6	59	2013-01-01 11:00:00+00
2013	1	1	656	705	-9	1007	940	27	MQ	4534	N722MQ	LGA	XNA	233	1147	7	5	2013-01-01 12:00:00+00
2013	1	1	656	700	-4	948	1011	-23	UA	1115	N24212	EWR	TPA	156	997	7	0	2013-01-01 12:00:00+00
2013	1	1	657	700	-3	959	1013	-14	DL	1879	N318NB	LGA	FLL	164	1076	7	0	2013-01-01 12:00:00+00
2013	1	1	658	700	-2	944	939	5	DL	1547	N6703D	LGA	ATL	126	762	7	0	2013-01-01 12:00:00+00
2013	1	1	658	700	-2	1027	1025	2	VX	399	N627VA	JFK	LAX	361	2475	7	0	2013-01-01 12:00:00+00
2013	1	1	659	700	-1	1008	1015	-7	AA	2279	N3EKAA	LGA	MIA	159	1096	7	0	2013-01-01 12:00:00+00
2013	1	1	659	700	-1	1008	1007	1	B6	981	N646JB	JFK	FLL	156	1069	7	0	2013-01-01 12:00:00+00
2013	1	1	659	705	-6	907	913	-6	DL	831	N998DL	LGA	DTW	105	502	7	5	2013-01-01 12:00:00+00
2013	1	1	659	700	-1	959	1008	-9	UA	960	N838UA	EWR	RSW	164	1068	7	0	2013-01-01 12:00:00+00
2013	1	1	701	700	1	1123	1154	-31	UA	1203	N77296	EWR	SJU	188	1608	7	0	2013-01-01 12:00:00+00
2013	1	1	702	700	2	1058	1014	44	B6	671	N779JB	JFK	LAX	381	2475	7	0	2013-01-01 12:00:00+00
2013	1	1	709	700	9	852	832	20	UA	1092	N26226	LGA	ORD	135	733	7	0	2013-01-01 12:00:00+00
2013	1	1	711	715	-4	1151	1206	-15	B6	715	N651JB	JFK	SJU	190	1598	7	15	2013-01-01 12:00:00+00
2013	1	1	712	715	-3	1023	1035	-12	AA	825	N3ETAA	JFK	FLL	159	1069	7	15	2013-01-01 12:00:00+00
2013	1	1	715	713	2	911	850	21	UA	544	N841UA	EWR	ORD	156	719	7	13	2013-01-01 12:00:00+00
2013	1	1	717	720	-3	850	840	10	FL	850	N978AT	LGA	MKE	134	738	7	20	2013-01-01 12:00:00+00
2013	1	1	719	721	-2	1017	1012	5	B6	987	N562JB	JFK	MCO	147	944	7	21	2013-01-01 12:00:00+00
2013	1	1	723	725	-2	1013	1017	-4	UA	962	N514UA	EWR	PBI	153	1023	7	25	2013-01-01 12:00:00+00
2013	1	1	724	730	-6	1111	1040	31	AA	715	N541AA	LGA	DFW	254	1389	7	30	2013-01-01 12:00:00+00
2013	1	1	724	725	-1	1020	1030	-10	AS	11	N594AS	EWR	SEA	338	2402	7	25	2013-01-01 12:00:00+00
2013	1	1	725	730	-5	1052	1040	12	AA	2083	N4WRAA	EWR	DFW	238	1372	7	30	2013-01-01 12:00:00+00
2013	1	1	727	730	-3	959	952	7	UA	1162	N37462	EWR	DEN	254	1605	7	30	2013-01-01 12:00:00+00
2013	1	1	728	732	-4	1041	1038	3	UA	473	N488UA	LGA	IAH	238	1416	7	32	2013-01-01 12:00:00+00
2013	1	1	729	730	-1	1049	1115	-26	VX	11	N635VA	JFK	SFO	356	2586	7	30	2013-01-01 12:00:00+00
2013	1	1	732	735	-3	857	858	-1	B6	20	N304JB	JFK	ROC	64	264	7	35	2013-01-01 12:00:00+00
2013	1	1	732	729	3	1041	1039	2	B6	1601	N563JB	LGA	RSW	167	1080	7	29	2013-01-01 12:00:00+00
2013	1	1	732	645	47	1011	941	30	UA	1111	N37456	EWR	MCO	145	937	6	45	2013-01-01 11:00:00+00
2013	1	1	733	736	-3	854	850	4	B6	44	N552JB	JFK	SYR	54	209	7	36	2013-01-01 12:00:00+00
2013	1	1	734	737	-3	1047	1113	-26	B6	643	N625JB	JFK	SFO	350	2586	7	37	2013-01-01 12:00:00+00
2013	1	1	739	745	-6	918	930	-12	AA	309	N4WPAA	LGA	ORD	137	733	7	45	2013-01-01 12:00:00+00
2013	1	1	739	739	0	1104	1038	26	UA	1479	N37408	EWR	IAH	249	1400	7	39	2013-01-01 12:00:00+00
2013	1	1	741	745	-4	1038	1036	2	B6	983	N633JB	LGA	TPA	158	1010	7	45	2013-01-01 12:00:00+00
2013	1	1	743	730	13	1107	1100	7	AA	33	N338AA	JFK	LAX	358	2475	7	30	2013-01-01 12:00:00+00
2013	1	1	743	749	-6	1043	1054	-11	B6	341	N624JB	JFK	SRQ	164	1041	7	49	2013-01-01 12:00:00+00
2013	1	1	743	730	13	1059	1056	3	DL	495	N3760C	JFK	SEA	349	2422	7	30	2013-01-01 12:00:00+00
2013	1	1	745	745	0	1135	1125	10	AA	59	N336AA	JFK	SFO	378	2586	7	45	2013-01-01 12:00:00+00
2013	1	1	746	746	0	1119	1129	-10	UA	1668	N24224	EWR	SFO	373	2565	7	46	2013-01-01 12:00:00+00
2013	1	1	749	710	39	939	850	49	MQ	3737	N508MQ	EWR	ORD	148	719	7	10	2013-01-01 12:00:00+00
2013	1	1	752	755	-3	1041	1059	-18	DL	2263	N325US	LGA	MCO	140	950	7	55	2013-01-01 12:00:00+00
2013	1	1	752	750	2	1025	1029	-4	UA	477	N511UA	LGA	DEN	249	1620	7	50	2013-01-01 12:00:00+00
2013	1	1	752	759	-7	955	959	-4	US	1733	N543UW	LGA	CLT	96	544	7	59	2013-01-01 12:00:00+00
2013	1	1	753	755	-2	1056	1110	-14	AA	2267	N3HMAA	LGA	MIA	157	1096	7	55	2013-01-01 12:00:00+00
2013	1	1	754	759	-5	1039	1041	-2	DL	2047	N935DL	LGA	ATL	126	762	7	59	2013-01-01 12:00:00+00
2013	1	1	754	755	-1	1103	1030	33	WN	733	N789SW	LGA	DEN	279	1620	7	55	2013-01-01 12:00:00+00
2013	1	1	758	800	-2	1053	1054	-1	B6	517	N645JB	EWR	MCO	142	937	8	0	2013-01-01 13:00:00+00
2013	1	1	759	800	-1	1057	1127	-30	DL	1843	N955DL	JFK	MIA	158	1089	8	0	2013-01-01 13:00:00+00
2013	1	1	800	800	0	1022	1014	8	DL	2119	N317US	LGA	MSP	171	1020	8	0	2013-01-01 13:00:00+00
2013	1	1	800	810	-10	949	955	-6	MQ	4406	N828MQ	JFK	RDU	80	427	8	10	2013-01-01 13:00:00+00
2013	1	1	801	805	-4	900	919	-19	B6	1172	N206JB	EWR	BOS	38	200	8	5	2013-01-01 13:00:00+00
2013	1	1	803	810	-7	903	925	-22	AA	1838	N3GEAA	JFK	BOS	38	187	8	10	2013-01-01 13:00:00+00
2013	1	1	803	800	3	1132	1144	-12	UA	223	N510UA	JFK	SFO	369	2586	8	0	2013-01-01 13:00:00+00
2013	1	1	804	810	-6	1103	1116	-13	DL	1959	N947DL	JFK	MCO	147	944	8	10	2013-01-01 13:00:00+00
2013	1	1	805	805	0	1015	1005	10	B6	219	N273JB	JFK	CLT	98	541	8	5	2013-01-01 13:00:00+00
2013	1	1	805	800	5	1118	1106	12	B6	3	N570JB	JFK	FLL	165	1069	8	0	2013-01-01 13:00:00+00
2013	1	1	805	815	-10	1006	1010	-4	MQ	4490	N739MQ	LGA	CMH	101	479	8	15	2013-01-01 13:00:00+00
2013	1	1	807	810	-3	1043	1043	0	DL	269	N308DE	JFK	ATL	126	760	8	10	2013-01-01 13:00:00+00
2013	1	1	809	815	-6	1043	1050	-7	EV	4388	N14542	EWR	JAX	132	820	8	15	2013-01-01 13:00:00+00
2013	1	1	810	810	0	1048	1037	11	9E	3538	N915XJ	JFK	MSP	189	1029	8	10	2013-01-01 13:00:00+00
2013	1	1	810	815	-5	1100	1128	-28	DL	2395	N349NW	LGA	PBI	149	1035	8	15	2013-01-01 13:00:00+00
2013	1	1	811	815	-4	1006	1032	-26	EV	4260	N11193	EWR	CHS	101	628	8	15	2013-01-01 13:00:00+00
2013	1	1	811	630	101	1047	830	137	MQ	4576	N531MQ	LGA	CLT	118	544	6	30	2013-01-01 11:00:00+00
2013	1	1	811	815	-4	1026	1016	10	US	675	N654AW	EWR	CLT	96	529	8	15	2013-01-01 13:00:00+00
2013	1	1	812	814	-2	1040	1017	23	EV	4537	N17108	EWR	MEM	180	946	8	14	2013-01-01 13:00:00+00
2013	1	1	813	815	-2	1103	1056	7	DL	914	N375NC	LGA	DEN	267	1620	8	15	2013-01-01 13:00:00+00
2013	1	1	814	810	4	1047	1030	17	FL	346	N977AT	LGA	ATL	132	762	8	10	2013-01-01 13:00:00+00
2013	1	1	817	810	7	1005	948	17	B6	1051	N228JB	JFK	PIT	86	340	8	10	2013-01-01 13:00:00+00
2013	1	1	820	820	0	1254	1310	-16	B6	717	N527JB	JFK	SJU	190	1598	8	20	2013-01-01 13:00:00+00
2013	1	1	820	830	-10	940	954	-14	DL	27	N324US	JFK	BOS	36	187	8	30	2013-01-01 13:00:00+00
2013	1	1	820	820	0	1249	1329	-40	DL	301	N900PC	JFK	SJU	182	1598	8	20	2013-01-01 13:00:00+00
2013	1	1	821	820	1	1153	1129	24	B6	181	N521JB	JFK	SAN	354	2446	8	20	2013-01-01 13:00:00+00
2013	1	1	821	825	-4	932	945	-13	MQ	4418	N846MQ	JFK	DCA	52	213	8	25	2013-01-01 13:00:00+00
2013	1	1	822	830	-8	1014	1016	-2	EV	4104	N12540	LGA	CLE	91	419	8	30	2013-01-01 13:00:00+00
2013	1	1	823	825	-2	1019	1024	-5	US	487	N655AW	JFK	CLT	96	541	8	25	2013-01-01 13:00:00+00
2013	1	1	823	823	0	1151	1135	16	UA	1223	N39728	EWR	DFW	250	1372	8	23	2013-01-01 13:00:00+00
2013	1	1	824	830	-6	1027	1025	2	AA	1855	N573AA	LGA	STL	169	888	8	30	2013-01-01 13:00:00+00
2013	1	1	825	827	-2	1058	1105	-7	B6	611	N292JB	JFK	JAX	130	828	8	27	2013-01-01 13:00:00+00
2013	1	1	826	715	71	1136	1045	51	AA	443	N3GVAA	JFK	MIA	160	1089	7	15	2013-01-01 12:00:00+00
2013	1	1	826	817	9	1145	1158	-13	UA	1480	N76522	EWR	SFO	357	2565	8	17	2013-01-01 13:00:00+00
2013	1	1	828	830	-2	1027	1012	15	B6	905	N274JB	JFK	ORD	160	740	8	30	2013-01-01 13:00:00+00
2013	1	1	828	823	5	1150	1143	7	UA	1506	N76528	EWR	LAX	359	2454	8	23	2013-01-01 13:00:00+00
2013	1	1	829	830	-1	1152	1200	-8	UA	443	N554UA	JFK	LAX	360	2475	8	30	2013-01-01 13:00:00+00
2013	1	1	829	830	-1	1117	1140	-23	UA	1592	N75425	EWR	MCO	145	937	8	30	2013-01-01 13:00:00+00
2013	1	1	830	830	0	1018	1015	3	AA	313	N4YCAA	LGA	ORD	137	733	8	30	2013-01-01 13:00:00+00
2013	1	1	830	835	-5	1052	1105	-13	MQ	4610	N513MQ	LGA	ATL	123	762	8	35	2013-01-01 13:00:00+00
2013	1	1	831	835	-4	1021	1039	-18	EV	4412	N13969	EWR	MYR	92	550	8	35	2013-01-01 13:00:00+00
2013	1	1	832	840	-8	1006	1030	-24	MQ	4521	N725MQ	LGA	RDU	77	431	8	40	2013-01-01 13:00:00+00
2013	1	1	833	835	-2	1134	1102	32	F9	835	N203FR	LGA	DEN	257	1620	8	35	2013-01-01 13:00:00+00
2013	1	1	835	835	0	1210	1150	20	AA	717	N3BDAA	LGA	DFW	249	1389	8	35	2013-01-01 13:00:00+00
2013	1	1	839	850	-11	1027	1035	-8	MQ	4558	N711MQ	LGA	CLE	88	419	8	50	2013-01-01 13:00:00+00
2013	1	1	840	845	-5	1311	1350	-39	AA	1357	N5FSAA	JFK	SJU	188	1598	8	45	2013-01-01 13:00:00+00
2013	1	1	840	845	-5	1053	1102	-9	DL	2304	N926DL	JFK	DTW	108	509	8	45	2013-01-01 13:00:00+00
2013	1	1	846	845	1	1138	1205	-27	B6	553	N564JB	EWR	RSW	157	1068	8	45	2013-01-01 13:00:00+00
2013	1	1	848	1835	853	1001	1950	851	MQ	3944	N942MQ	JFK	BWI	41	184	18	35	2013-01-01 23:00:00+00
2013	1	1	848	851	-3	1155	1136	19	UA	1741	N27724	EWR	JAC	275	1874	8	51	2013-01-01 13:00:00+00
2013	1	1	851	851	0	1032	1036	-4	EV	4548	N19966	EWR	RDU	75	416	8	51	2013-01-01 13:00:00+00
2013	1	1	851	859	-8	1102	1105	-3	DL	869	N361NB	EWR	DTW	106	488	8	59	2013-01-01 13:00:00+00
2013	1	1	851	840	11	1215	1206	9	UA	1626	N39297	EWR	SAN	367	2425	8	40	2013-01-01 13:00:00+00
2013	1	1	852	855	-3	1046	1020	26	WN	3848	N777QC	EWR	MDW	146	711	8	55	2013-01-01 13:00:00+00
2013	1	1	853	845	8	1147	1145	2	B6	59	N184JB	JFK	TPA	159	1005	8	45	2013-01-01 13:00:00+00
2013	1	1	855	859	-4	1143	1145	-2	DL	1747	N646DL	LGA	ATL	129	762	8	59	2013-01-01 13:00:00+00
2013	1	1	856	900	-4	1226	1220	6	AA	1	N324AA	JFK	LAX	358	2475	9	0	2013-01-01 14:00:00+00
2013	1	1	856	900	-4	1222	1232	-10	DL	2143	N970DL	LGA	MIA	158	1096	9	0	2013-01-01 14:00:00+00
2013	1	1	856	855	1	1140	1203	-23	UA	1296	N75426	EWR	PBI	150	1023	8	55	2013-01-01 13:00:00+00
2013	1	1	857	900	-3	1516	1530	-14	HA	51	N380HA	JFK	HNL	659	4983	9	0	2013-01-01 14:00:00+00
2013	1	1	857	905	-8	1107	1120	-13	DL	181	N321NB	LGA	DTW	110	502	9	5	2013-01-01 14:00:00+00
2013	1	1	857	900	-3	1124	1133	-9	DL	485	N371NB	EWR	ATL	125	746	9	0	2013-01-01 14:00:00+00
2013	1	1	857	851	6	1157	1222	-25	UA	1670	N45440	EWR	SEA	343	2402	8	51	2013-01-01 13:00:00+00
2013	1	1	858	900	-2	1102	1110	-8	MQ	4478	N737MQ	LGA	DTW	103	502	9	0	2013-01-01 14:00:00+00
2013	1	1	859	900	-1	1140	1204	-24	DL	1885	N360NB	LGA	MCO	140	950	9	0	2013-01-01 14:00:00+00
2013	1	1	859	900	-1	1223	1225	-2	VX	407	N846VA	JFK	LAX	359	2475	9	0	2013-01-01 14:00:00+00
2013	1	1	900	900	0	1211	1203	8	UA	1170	N19130	EWR	FLL	161	1065	9	0	2013-01-01 14:00:00+00
2013	1	1	902	903	-1	1048	1045	3	UA	580	N820UA	EWR	ORD	145	719	9	3	2013-01-01 14:00:00+00
2013	1	1	903	820	43	1045	955	50	MQ	4655	N532MQ	LGA	BNA	142	764	8	20	2013-01-01 13:00:00+00
2013	1	1	904	906	-2	1207	1226	-19	UA	1401	N77525	EWR	MIA	158	1085	9	6	2013-01-01 14:00:00+00
2013	1	1	905	905	0	1309	1229	40	B6	1061	N281JB	JFK	AUS	263	1521	9	5	2013-01-01 14:00:00+00
2013	1	1	906	843	23	1134	1125	9	UA	1643	N17139	EWR	DEN	246	1605	8	43	2013-01-01 13:00:00+00
2013	1	1	908	910	-2	1020	1027	-7	B6	56	N203JB	JFK	BTV	52	266	9	10	2013-01-01 14:00:00+00
2013	1	1	908	915	-7	1004	1033	-29	US	1467	N959UW	LGA	PHL	32	96	9	15	2013-01-01 14:00:00+00
2013	1	1	908	908	0	1228	1219	9	UA	1220	N12216	EWR	IAH	233	1400	9	8	2013-01-01 14:00:00+00
2013	1	1	909	810	59	1331	1315	16	AA	655	N5EXAA	JFK	STT	184	1623	8	10	2013-01-01 13:00:00+00
2013	1	1	912	900	12	1241	1220	21	AA	647	N5CRAA	JFK	MIA	166	1089	9	0	2013-01-01 14:00:00+00
2013	1	1	912	906	6	1219	1226	-7	UA	1601	N38403	EWR	MIA	159	1085	9	6	2013-01-01 14:00:00+00
2013	1	1	913	918	-5	1346	1416	-30	UA	1519	N24715	EWR	STT	189	1634	9	18	2013-01-01 14:00:00+00
2013	1	1	914	920	-6	1244	1240	4	AA	1589	N517AA	EWR	DFW	238	1372	9	20	2013-01-01 14:00:00+00
2013	1	1	914	900	14	1058	1043	15	UA	783	N810UA	EWR	CLE	85	404	9	0	2013-01-01 14:00:00+00
2013	1	1	917	920	-3	1313	1245	28	AA	721	N596AA	LGA	DFW	258	1389	9	20	2013-01-01 14:00:00+00
2013	1	1	917	915	2	1206	1211	-5	B6	41	N568JB	JFK	MCO	145	944	9	15	2013-01-01 14:00:00+00
2013	1	1	917	920	-3	1052	1108	-16	B6	1103	N216JB	JFK	RDU	80	427	9	20	2013-01-01 14:00:00+00
2013	1	1	920	905	15	1039	1025	14	B6	1305	N346JB	JFK	IAD	52	228	9	5	2013-01-01 14:00:00+00
2013	1	1	920	920	0	1152	1125	27	MQ	4582	N527MQ	LGA	CLT	92	544	9	20	2013-01-01 14:00:00+00
2013	1	1	921	900	21	1237	1227	10	DL	120	N713TW	JFK	LAX	333	2475	9	0	2013-01-01 14:00:00+00
2013	1	1	923	919	4	1026	1030	-4	B6	1004	N580JB	JFK	BOS	38	187	9	19	2013-01-01 14:00:00+00
2013	1	1	926	929	-3	1404	1421	-17	B6	215	N775JB	EWR	SJU	191	1608	9	29	2013-01-01 14:00:00+00
2013	1	1	926	922	4	1221	1219	2	B6	57	N534JB	JFK	PBI	151	1028	9	22	2013-01-01 14:00:00+00
2013	1	1	926	928	-2	1233	1220	13	UA	1597	N27733	EWR	EGE	287	1726	9	28	2013-01-01 14:00:00+00
2013	1	1	927	930	-3	1231	1257	-26	DL	1335	N951DL	LGA	RSW	166	1080	9	30	2013-01-01 14:00:00+00
2013	1	1	929	929	0	1028	1042	-14	EV	4636	N11551	EWR	DCA	43	199	9	29	2013-01-01 14:00:00+00
2013	1	1	929	925	4	1220	1150	30	WN	766	N957WN	EWR	DEN	264	1605	9	25	2013-01-01 14:00:00+00
2013	1	1	930	905	25	1218	1209	9	UA	1148	N57439	EWR	TPA	149	997	9	5	2013-01-01 14:00:00+00
2013	1	1	931	930	1	1237	1238	-1	B6	375	N508JB	LGA	FLL	161	1076	9	30	2013-01-01 14:00:00+00
2013	1	1	931	930	1	1121	1108	13	UA	255	N479UA	LGA	ORD	154	733	9	30	2013-01-01 14:00:00+00
2013	1	1	932	930	2	1219	1225	-6	VX	251	N641VA	JFK	LAS	324	2248	9	30	2013-01-01 14:00:00+00
2013	1	1	933	937	-4	1057	1102	-5	B6	4	N503JB	JFK	BUF	66	301	9	37	2013-01-01 14:00:00+00
2013	1	1	933	904	29	1252	1210	42	B6	17	N579JB	JFK	FLL	170	1069	9	4	2013-01-01 14:00:00+00
2013	1	1	933	935	-2	1120	1105	15	WN	3895	N487WN	LGA	MDW	145	725	9	35	2013-01-01 14:00:00+00
2013	1	1	936	940	-4	1235	1251	-16	DL	2137	N975DL	LGA	TPA	159	1010	9	40	2013-01-01 14:00:00+00
2013	1	1	936	945	-9	1257	1309	-12	DL	1903	N900DE	LGA	SRQ	169	1047	9	45	2013-01-01 14:00:00+00
2013	1	1	937	940	-3	1238	1235	3	B6	361	N615JB	LGA	PBI	154	1035	9	40	2013-01-01 14:00:00+00
2013	1	1	937	940	-3	1127	1120	7	WN	1807	N729SW	LGA	MKE	143	738	9	40	2013-01-01 14:00:00+00
2013	1	1	940	945	-5	1119	1130	-11	AA	319	N4WJAA	LGA	ORD	133	733	9	45	2013-01-01 14:00:00+00
2013	1	1	940	955	-15	1226	1220	6	MQ	4654	N525MQ	LGA	ATL	129	762	9	55	2013-01-01 14:00:00+00
2013	1	1	941	945	-4	1300	1258	2	B6	679	N806JB	JFK	LAX	352	2475	9	45	2013-01-01 14:00:00+00
2013	1	1	946	959	-13	1146	1202	-16	EV	4175	N15912	EWR	AVL	105	583	9	59	2013-01-01 14:00:00+00
2013	1	1	947	953	-6	1053	1110	-17	B6	600	N306JB	JFK	PWM	47	273	9	53	2013-01-01 14:00:00+00
2013	1	1	950	954	-4	1155	1142	13	EV	4681	N12567	EWR	STL	170	872	9	54	2013-01-01 14:00:00+00
2013	1	1	953	959	-6	1141	1129	12	MQ	4670	N6EAMQ	LGA	BNA	144	764	9	59	2013-01-01 14:00:00+00
2013	1	1	953	921	32	1320	1241	39	UA	222	N586UA	EWR	LAX	346	2454	9	21	2013-01-01 14:00:00+00
2013	1	1	955	1000	-5	1336	1325	11	US	75	N642AW	EWR	PHX	324	2133	10	0	2013-01-01 15:00:00+00
2013	1	1	956	1000	-4	1241	1241	0	DL	1847	N956DL	LGA	ATL	129	762	10	0	2013-01-01 15:00:00+00
2013	1	1	957	733	144	1056	853	123	UA	856	N534UA	EWR	BOS	37	200	7	33	2013-01-01 12:00:00+00
2013	1	1	959	1002	-3	1313	1319	-6	DL	2379	N965DL	LGA	FLL	151	1076	10	2	2013-01-01 15:00:00+00
2013	1	1	959	1000	-1	1151	1206	-15	US	1177	N765US	LGA	CLT	90	544	10	0	2013-01-01 15:00:00+00
2013	1	1	1003	1010	-7	1255	1320	-25	B6	503	N565JB	EWR	FLL	152	1065	10	10	2013-01-01 15:00:00+00
2013	1	1	1003	959	4	1408	1329	39	US	196	N541UW	JFK	PHX	342	2153	9	59	2013-01-01 14:00:00+00
2013	1	1	1005	1000	5	1239	1234	5	UA	1625	N81449	EWR	DEN	254	1605	10	0	2013-01-01 15:00:00+00
2013	1	1	1007	1010	-3	1147	1140	7	MQ	3795	N503MQ	EWR	ORD	131	719	10	10	2013-01-01 15:00:00+00
2013	1	1	1009	1015	-6	1219	1229	-10	DL	2319	N933DL	LGA	MSP	160	1020	10	15	2013-01-01 15:00:00+00
2013	1	1	1010	1015	-5	1204	1210	-6	US	1103	N162UW	EWR	CLT	90	529	10	15	2013-01-01 15:00:00+00
2013	1	1	1010	1015	-5	1225	1214	11	US	1441	N712US	JFK	CLT	97	541	10	15	2013-01-01 15:00:00+00
2013	1	1	1011	1001	10	1133	1128	5	EV	5736	N820AS	LGA	IAD	59	229	10	1	2013-01-01 15:00:00+00
2013	1	1	1011	1015	-4	1246	1307	-21	DL	1529	N399DA	JFK	LAS	320	2248	10	15	2013-01-01 15:00:00+00
2013	1	1	1021	1023	-2	1254	1252	2	FL	347	N942AT	LGA	ATL	129	762	10	23	2013-01-01 15:00:00+00
2013	1	1	1024	1029	-5	1140	1150	-10	EV	4709	N14905	EWR	BUF	59	282	10	29	2013-01-01 15:00:00+00
2013	1	1	1024	1030	-6	1204	1215	-11	MQ	4471	N719MQ	LGA	RDU	78	431	10	30	2013-01-01 15:00:00+00
2013	1	1	1025	1020	5	1356	1330	26	AA	731	N3FXAA	LGA	DFW	247	1389	10	20	2013-01-01 15:00:00+00
2013	1	1	1025	951	34	1258	1302	-4	UA	501	N437UA	EWR	MCO	137	937	9	51	2013-01-01 14:00:00+00
2013	1	1	1026	1030	-4	1351	1340	11	AA	19	N328AA	JFK	LAX	356	2475	10	30	2013-01-01 15:00:00+00
2013	1	1	1028	1026	2	1350	1339	11	UA	1004	N76508	LGA	IAH	237	1416	10	26	2013-01-01 15:00:00+00
2013	1	1	1029	1030	-1	1427	1355	32	AA	179	N325AA	JFK	SFO	389	2586	10	30	2013-01-01 15:00:00+00
2013	1	1	1030	1035	-5	1229	1246	-17	EV	4277	N11189	EWR	CHS	100	628	10	35	2013-01-01 15:00:00+00
2013	1	1	1031	1030	1	1353	1415	-22	VX	23	N625VA	JFK	SFO	363	2586	10	30	2013-01-01 15:00:00+00
2013	1	1	1031	1030	1	1323	1334	-11	UA	1294	N77258	EWR	FLL	157	1065	10	30	2013-01-01 15:00:00+00
2013	1	1	1032	1035	-3	1305	1250	15	EV	4180	N13955	EWR	IND	135	645	10	35	2013-01-01 15:00:00+00
2013	1	1	1033	1017	16	1130	1136	-6	UA	779	N849UA	EWR	BOS	42	200	10	17	2013-01-01 15:00:00+00
2013	1	1	1037	1030	7	1221	1210	11	AA	321	N581AA	LGA	ORD	133	733	10	30	2013-01-01 15:00:00+00
2013	1	1	1038	1030	8	1223	1202	21	UA	985	N423UA	EWR	ORD	149	719	10	30	2013-01-01 15:00:00+00
2013	1	1	1042	1040	2	1325	1326	-1	B6	31	N529JB	JFK	MCO	142	944	10	40	2013-01-01 15:00:00+00
2013	1	1	1044	1045	-1	1231	1212	19	EV	4322	N15555	EWR	MKE	151	725	10	45	2013-01-01 15:00:00+00
2013	1	1	1044	1045	-1	1352	1351	1	UA	455	N667UA	EWR	IAH	229	1400	10	45	2013-01-01 15:00:00+00
2013	1	1	1044	1041	3	1339	1350	-11	UA	1060	N76503	EWR	RSW	157	1068	10	41	2013-01-01 15:00:00+00
2013	1	1	1047	1055	-8	1359	1405	-6	AA	739	N3AVAA	LGA	DFW	230	1389	10	55	2013-01-01 15:00:00+00
2013	1	1	1047	1050	-3	1401	1410	-9	DL	1275	N3748Y	JFK	SLC	295	1990	10	50	2013-01-01 15:00:00+00
2013	1	1	1048	1050	-2	1302	1250	12	MQ	4589	N537MQ	LGA	DTW	112	502	10	50	2013-01-01 15:00:00+00
2013	1	1	1053	1050	3	1402	1358	4	B6	373	N520JB	LGA	FLL	165	1076	10	50	2013-01-01 15:00:00+00
2013	1	1	1054	1059	-5	1326	1339	-13	DL	1647	N920DE	LGA	ATL	129	762	10	59	2013-01-01 15:00:00+00
2013	1	1	1056	1059	-3	1203	1209	-6	EV	4479	N11544	EWR	PWM	51	284	10	59	2013-01-01 15:00:00+00
2013	1	1	1056	1100	-4	1407	1413	-6	DL	2185	N917DL	LGA	TPA	158	1010	11	0	2013-01-01 16:00:00+00
2013	1	1	1058	1100	-2	1210	1216	-6	US	2171	N951UW	LGA	DCA	50	214	11	0	2013-01-01 16:00:00+00
2013	1	1	1059	1100	-1	1201	1215	-14	WN	321	N505SW	LGA	BWI	43	185	11	0	2013-01-01 16:00:00+00
2013	1	1	1059	1100	-1	1210	1215	-5	MQ	3792	N509MQ	JFK	DCA	50	213	11	0	2013-01-01 16:00:00+00
2013	1	1	1059	1053	6	1342	1351	-9	UA	369	N451UA	EWR	LAS	325	2227	10	53	2013-01-01 15:00:00+00
2013	1	1	1101	1043	18	1345	1332	13	B6	545	N630JB	EWR	PBI	145	1023	10	43	2013-01-01 15:00:00+00
2013	1	1	1103	1100	3	1410	1421	-11	DL	2071	N339NW	LGA	MIA	155	1096	11	0	2013-01-01 16:00:00+00
2013	1	1	1105	1047	18	1428	1405	23	UA	688	N521UA	EWR	SFO	356	2565	10	47	2013-01-01 15:00:00+00
2013	1	1	1107	1115	-8	1305	1310	-5	MQ	4485	N730MQ	LGA	CMH	95	479	11	15	2013-01-01 16:00:00+00
2013	1	1	1109	1115	-6	1402	1425	-23	AA	2099	N3GSAA	LGA	MIA	157	1096	11	15	2013-01-01 16:00:00+00
2013	1	1	1111	1115	-4	1222	1226	-4	B6	24	N279JB	JFK	BTV	52	266	11	15	2013-01-01 16:00:00+00
2013	1	1	1112	1100	12	1440	1438	2	UA	285	N517UA	JFK	SFO	364	2586	11	0	2013-01-01 16:00:00+00
2013	1	1	1113	1115	-2	1318	1315	3	DL	1031	N320NB	LGA	DTW	104	502	11	15	2013-01-01 16:00:00+00
2013	1	1	1114	900	134	1447	1222	145	UA	1086	N76502	LGA	IAH	248	1416	9	0	2013-01-01 14:00:00+00
2013	1	1	1120	944	96	1331	1213	78	EV	4495	N16561	EWR	SAV	117	708	9	44	2013-01-01 14:00:00+00
2013	1	1	1120	1125	-5	1330	1325	5	WN	1057	N469WN	LGA	STL	176	888	11	25	2013-01-01 16:00:00+00
2013	1	1	1123	1110	13	1410	1336	34	UA	405	N587UA	LGA	DEN	256	1620	11	10	2013-01-01 16:00:00+00
2013	1	1	1124	1100	24	1435	1431	4	B6	641	N590JB	JFK	SFO	349	2586	11	0	2013-01-01 16:00:00+00
2013	1	1	1124	1125	-1	1445	1445	0	DL	1171	N376NW	LGA	RSW	169	1080	11	25	2013-01-01 16:00:00+00
2013	1	1	1125	1130	-5	1325	1332	-7	US	1085	N169UW	LGA	CLT	94	544	11	30	2013-01-01 16:00:00+00
2013	1	1	1127	1129	-2	1303	1309	-6	EV	4294	N14180	EWR	RDU	73	416	11	29	2013-01-01 16:00:00+00
2013	1	1	1127	1130	-3	1504	1448	16	UA	703	N518UA	JFK	LAX	357	2475	11	30	2013-01-01 16:00:00+00
2013	1	1	1127	1129	-2	1421	1425	-4	UA	1143	N14118	EWR	PBI	156	1023	11	29	2013-01-01 16:00:00+00
2013	1	1	1128	1129	-1	1422	1437	-15	UA	987	N496UA	EWR	TPA	156	997	11	29	2013-01-01 16:00:00+00
2013	1	1	1130	1125	5	1301	1305	-4	AA	327	N3DEAA	LGA	ORD	127	733	11	25	2013-01-01 16:00:00+00
2013	1	1	1130	1131	-1	1345	1342	3	DL	2219	N343NB	LGA	MSP	166	1020	11	31	2013-01-01 16:00:00+00
2013	1	1	1132	1135	-3	1324	1330	-6	MQ	4553	N856MQ	LGA	CLE	89	419	11	35	2013-01-01 16:00:00+00
2013	1	1	1133	1129	4	1440	1437	3	B6	133	N652JB	JFK	RSW	168	1074	11	29	2013-01-01 16:00:00+00
2013	1	1	1133	1130	3	1448	1450	-2	VX	409	N839VA	JFK	LAX	347	2475	11	30	2013-01-01 16:00:00+00
2013	1	1	1135	1140	-5	1429	1445	-16	AA	1623	N3EYAA	EWR	MIA	156	1085	11	40	2013-01-01 16:00:00+00
2013	1	1	1137	1140	-3	1445	1451	-6	DL	2175	N999DN	LGA	PBI	153	1035	11	40	2013-01-01 16:00:00+00
2013	1	1	1143	1145	-2	1512	1507	5	UA	1010	N39726	EWR	SNA	371	2434	11	45	2013-01-01 16:00:00+00
2013	1	1	1144	1145	-1	1422	1411	11	EV	4876	N695CA	EWR	ATL	126	746	11	45	2013-01-01 16:00:00+00
2013	1	1	1147	1155	-8	1335	1327	8	FL	353	N932AT	LGA	CAK	82	397	11	55	2013-01-01 16:00:00+00
2013	1	1	1150	1156	-6	1302	1314	-12	EV	4693	N21144	EWR	SYR	46	195	11	56	2013-01-01 16:00:00+00
2013	1	1	1153	1159	-6	1350	1341	9	EV	4275	N29917	EWR	CMH	95	463	11	59	2013-01-01 16:00:00+00
2013	1	1	1153	1123	30	1454	1425	29	B6	1	N552JB	JFK	FLL	167	1069	11	23	2013-01-01 16:00:00+00
2013	1	1	1153	1200	-7	1450	1529	-39	DL	863	N712TW	JFK	LAX	330	2475	12	0	2013-01-01 17:00:00+00
2013	1	1	1154	1200	-6	1253	1306	-13	B6	1174	N206JB	EWR	BOS	40	200	12	0	2013-01-01 17:00:00+00
2013	1	1	1154	1200	-6	1452	1430	22	MQ	4658	N8EGMQ	LGA	ATL	141	762	12	0	2013-01-01 17:00:00+00
2013	1	1	1155	1200	-5	1517	1510	7	AA	3	N322AA	JFK	LAX	353	2475	12	0	2013-01-01 17:00:00+00
2013	1	1	1155	1200	-5	1507	1519	-12	DL	1443	N969DL	LGA	FLL	160	1076	12	0	2013-01-01 17:00:00+00
2013	1	1	1155	1200	-5	1441	1440	1	DL	1947	N904DL	LGA	ATL	133	762	12	0	2013-01-01 17:00:00+00
2013	1	1	1155	1200	-5	1312	1315	-3	MQ	4425	N846MQ	JFK	DCA	57	213	12	0	2013-01-01 17:00:00+00
2013	1	1	1157	1158	-1	1310	1315	-5	EV	4511	N16546	EWR	ROC	50	246	11	58	2013-01-01 16:00:00+00
2013	1	1	1157	1205	-8	1342	1345	-3	MQ	4431	N723MQ	LGA	RDU	80	431	12	5	2013-01-01 17:00:00+00
2013	1	1	1157	1200	-3	1452	1456	-4	UA	1197	N13113	EWR	MCO	151	937	12	0	2013-01-01 17:00:00+00
2013	1	1	1158	1205	-7	1530	1520	10	AA	743	N426AA	LGA	DFW	248	1389	12	5	2013-01-01 17:00:00+00
2013	1	1	1158	1200	-2	1256	1300	-4	WN	1568	N783SW	EWR	BWI	38	169	12	0	2013-01-01 17:00:00+00
2013	1	1	1158	1200	-2	1338	1331	7	UA	701	N588UA	LGA	ORD	142	733	12	0	2013-01-01 17:00:00+00
2013	1	1	1200	1200	0	1408	1356	12	US	1443	N755US	JFK	CLT	102	541	12	0	2013-01-01 17:00:00+00
2013	1	1	1202	1207	-5	1318	1314	4	EV	4347	N11536	EWR	BTV	51	266	12	7	2013-01-01 17:00:00+00
2013	1	1	1202	1159	3	1645	1653	-8	UA	1663	N38403	EWR	SJU	187	1608	11	59	2013-01-01 16:00:00+00
2013	1	1	1203	1205	-2	1501	1437	24	EV	3850	N13978	EWR	ATL	142	746	12	5	2013-01-01 17:00:00+00
2013	1	1	1203	1200	3	1519	1545	-26	VX	25	N843VA	JFK	SFO	353	2586	12	0	2013-01-01 17:00:00+00
2013	1	1	1204	1200	4	1500	1448	12	B6	523	N612JB	EWR	MCO	139	937	12	0	2013-01-01 17:00:00+00
2013	1	1	1205	1200	5	1503	1505	-2	UA	1461	N39418	EWR	IAH	221	1400	12	0	2013-01-01 17:00:00+00
2013	1	1	1206	1209	-3	1325	1328	-3	EV	4216	N14168	EWR	BUF	59	282	12	9	2013-01-01 17:00:00+00
2013	1	1	1208	1158	10	1540	1502	38	B6	625	N239JB	JFK	HOU	253	1428	11	58	2013-01-01 16:00:00+00
2013	1	1	1211	1215	-4	1423	1413	10	EV	4135	N21537	EWR	CLT	102	529	12	15	2013-01-01 17:00:00+00
2013	1	1	1217	1220	-3	1414	1350	24	MQ	3697	N517MQ	EWR	ORD	143	719	12	20	2013-01-01 17:00:00+00
2013	1	1	1217	1218	-1	1525	1529	-4	UA	391	N573UA	EWR	SFO	345	2565	12	18	2013-01-01 17:00:00+00
2013	1	1	1219	1220	-1	1415	1415	0	AA	1757	N545AA	LGA	STL	161	888	12	20	2013-01-01 17:00:00+00
2013	1	1	1219	1225	-6	1451	1500	-9	DL	1715	N342NB	LGA	MSY	195	1183	12	25	2013-01-01 17:00:00+00
2013	1	1	1220	1220	0	1403	1340	23	WN	133	N254WN	EWR	MDW	142	711	12	20	2013-01-01 17:00:00+00
2013	1	1	1222	1159	23	1512	1429	43	EV	4679	N14916	EWR	JAX	131	820	11	59	2013-01-01 16:00:00+00
2013	1	1	1222	1229	-7	1520	1526	-6	B6	27	N192JB	JFK	TPA	160	1005	12	29	2013-01-01 17:00:00+00
2013	1	1	1228	1224	4	1631	1604	27	UA	1114	N38459	EWR	PHX	339	2133	12	24	2013-01-01 17:00:00+00
2013	1	1	1230	1235	-5	1440	1438	2	EV	5311	N741EV	EWR	DTW	108	488	12	35	2013-01-01 17:00:00+00
2013	1	1	1231	1238	-7	1449	1446	3	DL	1131	N920DL	LGA	DTW	108	502	12	38	2013-01-01 17:00:00+00
2013	1	1	1231	1229	2	1523	1529	-6	UA	428	N402UA	EWR	FLL	156	1065	12	29	2013-01-01 17:00:00+00
2013	1	1	1237	1245	-8	1340	1350	-10	AA	1850	N3EGAA	JFK	BOS	40	187	12	45	2013-01-01 17:00:00+00
2013	1	1	1238	1240	-2	1410	1405	5	WN	564	N297WN	LGA	MKE	137	738	12	40	2013-01-01 17:00:00+00
2013	1	1	1240	1229	11	1451	1428	23	EV	4118	N14543	EWR	DTW	114	488	12	29	2013-01-01 17:00:00+00
2013	1	1	1240	1245	-5	1554	1600	-6	AA	2253	N3BUAA	LGA	MIA	156	1096	12	45	2013-01-01 17:00:00+00
2013	1	1	1240	1235	5	1415	1415	0	MQ	4404	N828MQ	JFK	RDU	79	427	12	35	2013-01-01 17:00:00+00
2013	1	1	1241	1247	-6	1342	1355	-13	EV	4129	N36915	EWR	DCA	45	199	12	47	2013-01-01 17:00:00+00
2013	1	1	1245	1245	0	1616	1615	1	DL	2174	N711ZX	JFK	SLC	298	1990	12	45	2013-01-01 17:00:00+00
2013	1	1	1245	1249	-4	1722	1800	-38	DL	315	N670DN	JFK	SJU	188	1598	12	49	2013-01-01 17:00:00+00
2013	1	1	1246	1225	21	1424	1348	36	B6	66	N228JB	JFK	BUF	70	301	12	25	2013-01-01 17:00:00+00
2013	1	1	1248	1250	-2	1607	1607	0	UA	1280	N26210	LGA	IAH	238	1416	12	50	2013-01-01 17:00:00+00
2013	1	1	1251	1252	-1	1611	1555	16	B6	85	N657JB	JFK	FLL	173	1069	12	52	2013-01-01 17:00:00+00
2013	1	1	1252	1245	7	1624	1550	34	AA	745	N3FTAA	LGA	DFW	243	1389	12	45	2013-01-01 17:00:00+00
2013	1	1	1253	1212	41	1524	1436	48	UA	754	N576UA	EWR	DEN	252	1605	12	12	2013-01-01 17:00:00+00
2013	1	1	1255	1300	-5	1541	1537	4	DL	781	N644DL	LGA	ATL	132	762	13	0	2013-01-01 18:00:00+00
2013	1	1	1255	1255	0	1540	1535	5	WN	1251	N732SW	LGA	DEN	264	1620	12	55	2013-01-01 17:00:00+00
2013	1	1	1255	1200	55	1451	1330	81	MQ	4601	N518MQ	LGA	BNA	139	764	12	0	2013-01-01 17:00:00+00
2013	1	1	1255	1259	-4	1501	1502	-1	US	1459	N540UW	LGA	CLT	100	544	12	59	2013-01-01 17:00:00+00
2013	1	1	1255	1300	-5	1401	1409	-8	US	2128	N957UW	LGA	BOS	38	184	13	0	2013-01-01 18:00:00+00
2013	1	1	1257	1258	-1	1601	1610	-9	B6	209	N793JB	JFK	LGB	346	2465	12	58	2013-01-01 17:00:00+00
2013	1	1	1257	1300	-3	1454	1450	4	MQ	4426	N739MQ	LGA	CMH	97	479	13	0	2013-01-01 18:00:00+00
2013	1	1	1258	1308	-10	1532	1537	-5	FL	348	N717JL	LGA	ATL	128	762	13	8	2013-01-01 18:00:00+00
2013	1	1	1258	1300	-2	1459	1440	19	AA	329	N511AA	LGA	ORD	147	733	13	0	2013-01-01 18:00:00+00
2013	1	1	1301	1240	21	1633	1540	53	AA	1853	N544AA	EWR	DFW	252	1372	12	40	2013-01-01 17:00:00+00
2013	1	1	1301	1150	71	1518	1345	93	MQ	4646	N542MQ	LGA	MSP	170	1020	11	50	2013-01-01 16:00:00+00
2013	1	1	1301	1255	6	1629	1603	26	UA	765	N825UA	EWR	DFW	243	1372	12	55	2013-01-01 17:00:00+00
2013	1	1	1302	1259	3	1402	1404	-2	B6	1006	N273JB	JFK	BOS	40	187	12	59	2013-01-01 17:00:00+00
2013	1	1	1302	1300	2	1553	1601	-8	UA	1435	N78511	EWR	MIA	158	1085	13	0	2013-01-01 18:00:00+00
2013	1	1	1304	1227	37	1518	1422	56	EV	4640	N19966	EWR	DAY	107	533	12	27	2013-01-01 17:00:00+00
2013	1	1	1304	1259	5	1430	1418	12	B6	32	N346JB	JFK	ROC	65	264	12	59	2013-01-01 17:00:00+00
2013	1	1	1305	1315	-10	1523	1520	3	MQ	4564	N725MQ	LGA	DTW	102	502	13	15	2013-01-01 18:00:00+00
2013	1	1	1306	1240	26	1622	1555	27	AA	2041	N5DMAA	JFK	MIA	163	1089	12	40	2013-01-01 17:00:00+00
2013	1	1	1306	1300	6	1622	1610	12	WN	2596	N773SA	EWR	HOU	239	1411	13	0	2013-01-01 18:00:00+00
2013	1	1	1310	1300	10	1559	1554	5	B6	991	N593JB	JFK	PBI	150	1028	13	0	2013-01-01 18:00:00+00
2013	1	1	1314	1315	-1	1507	1505	2	US	1615	N177US	EWR	CLT	95	529	13	15	2013-01-01 18:00:00+00
2013	1	1	1315	1317	-2	1413	1423	-10	EV	4112	N13538	EWR	ALB	33	143	13	17	2013-01-01 18:00:00+00
2013	1	1	1316	1314	2	1412	1415	-3	EV	4340	N11551	EWR	BWI	38	169	13	14	2013-01-01 18:00:00+00
2013	1	1	1317	1325	-8	1454	1505	-11	MQ	4475	N711MQ	LGA	RDU	80	431	13	25	2013-01-01 18:00:00+00
2013	1	1	1318	1322	-4	1358	1416	-18	EV	4106	N19554	EWR	BDL	25	116	13	22	2013-01-01 18:00:00+00
2013	1	1	1320	1315	5	1602	1605	-3	B6	393	N537JB	LGA	MCO	140	950	13	15	2013-01-01 18:00:00+00
2013	1	1	1320	1320	0	1625	1636	-11	UA	1425	N58101	EWR	LAX	334	2454	13	20	2013-01-01 18:00:00+00
2013	1	1	1323	1300	23	1651	1608	43	DL	1185	N3736C	EWR	SLC	295	1969	13	0	2013-01-01 18:00:00+00
2013	1	1	1325	1330	-5	1606	1605	1	DL	2043	N318US	JFK	ATL	131	760	13	30	2013-01-01 18:00:00+00
2013	1	1	1327	1330	-3	1638	1655	-17	VX	411	N642VA	JFK	LAX	352	2475	13	30	2013-01-01 18:00:00+00
2013	1	1	1327	1329	-2	1624	1629	-5	UA	906	N847UA	EWR	FLL	157	1065	13	29	2013-01-01 18:00:00+00
2013	1	1	1330	1321	9	1613	1536	37	EV	3849	N14558	EWR	IND	149	645	13	21	2013-01-01 18:00:00+00
2013	1	1	1333	1335	-2	1608	1608	0	B6	615	N306JB	JFK	JAX	134	828	13	35	2013-01-01 18:00:00+00
2013	1	1	1336	1340	-4	1508	1500	8	EV	4665	N13988	EWR	PIT	69	319	13	40	2013-01-01 18:00:00+00
2013	1	1	1337	1220	77	1649	1531	78	B6	673	N636JB	JFK	LAX	352	2475	12	20	2013-01-01 17:00:00+00
2013	1	1	1339	1345	-6	1642	1705	-23	AA	1073	N3EMAA	LGA	MIA	161	1096	13	45	2013-01-01 18:00:00+00
2013	1	1	1339	1335	4	1654	1631	23	B6	431	N510JB	LGA	SRQ	170	1047	13	35	2013-01-01 18:00:00+00
2013	1	1	1341	1345	-4	1709	1705	4	AA	117	N339AA	JFK	LAX	362	2475	13	45	2013-01-01 18:00:00+00
2013	1	1	1342	1320	22	1617	1504	73	EV	3832	N13969	EWR	STL	194	872	13	20	2013-01-01 18:00:00+00
2013	1	1	1343	1330	13	1658	1640	18	AA	753	N3CFAA	LGA	DFW	235	1389	13	30	2013-01-01 18:00:00+00
2013	1	1	1344	1344	0	2005	1944	21	UA	15	N76065	EWR	HNL	656	4963	13	44	2013-01-01 18:00:00+00
2013	1	1	1346	1330	16	1736	1710	26	WN	2335	N900WN	EWR	PHX	334	2133	13	30	2013-01-01 18:00:00+00
2013	1	1	1350	1329	21	1504	1453	11	EV	4254	N14542	EWR	BUF	57	282	13	29	2013-01-01 18:00:00+00
2013	1	1	1350	1355	-5	1456	1510	-14	B6	602	N216JB	JFK	PWM	49	273	13	55	2013-01-01 18:00:00+00
2013	1	1	1351	1355	-4	1446	1459	-13	EV	4434	N13566	EWR	MHT	37	209	13	55	2013-01-01 18:00:00+00
2013	1	1	1353	1357	-4	1549	1525	24	EV	4171	N14105	EWR	MSN	152	799	13	57	2013-01-01 18:00:00+00
2013	1	1	1354	1356	-2	1556	1600	-4	EV	4370	N23139	EWR	CHS	102	628	13	56	2013-01-01 18:00:00+00
2013	1	1	1354	1359	-5	1452	1514	-22	DL	2068	N344NB	JFK	BOS	37	187	13	59	2013-01-01 18:00:00+00
2013	1	1	1355	1315	40	1538	1452	46	EV	4552	N13958	EWR	GSO	86	445	13	15	2013-01-01 18:00:00+00
2013	1	1	1355	1356	-1	1646	1650	-4	B6	1783	N709JB	JFK	MCO	144	944	13	56	2013-01-01 18:00:00+00
2013	1	1	1355	1350	5	1537	1515	22	WN	2162	N7704B	LGA	MDW	141	725	13	50	2013-01-01 18:00:00+00
2013	1	1	1356	1350	6	1612	1545	27	MQ	4577	N513MQ	LGA	CLT	98	544	13	50	2013-01-01 18:00:00+00
2013	1	1	1356	1259	57	1538	1438	60	UA	32	N17128	EWR	ORD	135	719	12	59	2013-01-01 17:00:00+00
2013	1	1	1356	1354	2	1537	1526	11	UA	617	N840UA	LGA	ORD	146	733	13	54	2013-01-01 18:00:00+00
2013	1	1	1356	1350	6	1659	1640	19	UA	1258	N26906	EWR	IAH	218	1400	13	50	2013-01-01 18:00:00+00
2013	1	1	1358	1350	8	1742	1715	27	US	688	N654AW	EWR	PHX	318	2133	13	50	2013-01-01 18:00:00+00
2013	1	1	1400	1250	70	1645	1502	103	EV	4869	N748EV	LGA	MEM	178	963	12	50	2013-01-01 17:00:00+00
2013	1	1	1400	1400	0	1634	1636	-2	DL	2247	N6704Z	LGA	ATL	130	762	14	0	2013-01-01 19:00:00+00
2013	1	1	1402	1323	39	1650	1526	84	EV	4516	N13123	EWR	MEM	183	946	13	23	2013-01-01 18:00:00+00
2013	1	1	1408	1411	-3	1646	1640	6	FL	349	N895AT	LGA	ATL	133	762	14	11	2013-01-01 19:00:00+00
2013	1	1	1411	1315	56	1717	1611	66	B6	505	N516JB	EWR	FLL	154	1065	13	15	2013-01-01 18:00:00+00
2013	1	1	1416	1411	5	1603	1549	14	UA	683	N456UA	EWR	ORD	136	719	14	11	2013-01-01 19:00:00+00
2013	1	1	1418	1419	-1	1726	1732	-6	UA	16	N37464	EWR	SEA	348	2402	14	19	2013-01-01 19:00:00+00
2013	1	1	1419	1420	-1	1557	1550	7	MQ	3728	N500MQ	EWR	ORD	136	719	14	20	2013-01-01 19:00:00+00
2013	1	1	1421	1422	-1	1517	1535	-18	B6	1010	N274JB	JFK	BOS	38	187	14	22	2013-01-01 19:00:00+00
2013	1	1	1421	1355	26	1735	1709	26	B6	83	N503JB	JFK	SEA	349	2422	13	55	2013-01-01 18:00:00+00
2013	1	1	1421	1430	-9	1724	1752	-28	DL	1531	N327NW	LGA	RSW	160	1080	14	30	2013-01-01 19:00:00+00
2013	1	1	1422	1410	12	1613	1555	18	MQ	4491	N737MQ	LGA	CLE	93	419	14	10	2013-01-01 19:00:00+00
2013	1	1	1422	1425	-3	1748	1759	-11	UA	257	N502UA	JFK	SFO	362	2586	14	25	2013-01-01 19:00:00+00
2013	1	1	1423	1430	-7	1535	1550	-15	EV	5710	N835AS	LGA	IAD	53	229	14	30	2013-01-01 19:00:00+00
2013	1	1	1424	1349	35	1701	1556	65	EV	4687	N15574	EWR	CVG	129	569	13	49	2013-01-01 18:00:00+00
2013	1	1	1424	1420	4	1659	1644	15	EV	4935	N678CA	EWR	ATL	132	746	14	20	2013-01-01 19:00:00+00
2013	1	1	1428	1329	59	1803	1640	83	B6	355	N635JB	JFK	BUR	371	2465	13	29	2013-01-01 18:00:00+00
2013	1	1	1430	1359	31	1718	1652	26	UA	278	N563UA	EWR	PBI	149	1023	13	59	2013-01-01 18:00:00+00
2013	1	1	1430	1430	0	1735	1744	-9	UA	997	N452UA	LGA	IAH	227	1416	14	30	2013-01-01 19:00:00+00
2013	1	1	1431	1429	2	1727	1722	5	B6	1161	N562JB	LGA	PBI	151	1035	14	29	2013-01-01 19:00:00+00
2013	1	1	1431	1440	-9	1627	1616	11	UA	601	N849UA	EWR	CLE	91	404	14	40	2013-01-01 19:00:00+00
2013	1	1	1433	1435	-2	1636	1644	-8	DL	1819	N327NB	LGA	MSP	163	1020	14	35	2013-01-01 19:00:00+00
2013	1	1	1436	1435	1	1840	1820	20	DL	1322	N722TW	JFK	SFO	375	2586	14	35	2013-01-01 19:00:00+00
2013	1	1	1439	1445	-6	1558	1613	-15	DL	1972	N319NB	JFK	DCA	56	213	14	45	2013-01-01 19:00:00+00
2013	1	1	1440	1440	0	1658	1643	15	DL	1231	N926DL	LGA	DTW	94	502	14	40	2013-01-01 19:00:00+00
2013	1	1	1442	1450	-8	1728	1755	-27	AA	1813	N5FMAA	JFK	MCO	141	944	14	50	2013-01-01 19:00:00+00
2013	1	1	1443	1444	-1	1600	1602	-2	EV	4292	N13908	EWR	IAD	51	212	14	44	2013-01-01 19:00:00+00
2013	1	1	1445	1455	-10	1635	1645	-10	AA	337	N4UCAA	LGA	ORD	147	733	14	55	2013-01-01 19:00:00+00
2013	1	1	1445	1445	0	1729	1710	19	MQ	4669	N532MQ	LGA	ATL	129	762	14	45	2013-01-01 19:00:00+00
2013	1	1	1446	1455	-9	1803	1825	-22	AA	1769	N5EWAA	JFK	MIA	161	1089	14	55	2013-01-01 19:00:00+00
2013	1	1	1448	1445	3	1651	1647	4	US	1445	N560UW	LGA	CLT	96	544	14	45	2013-01-01 19:00:00+00
2013	1	1	1449	1450	-1	1651	1640	11	MQ	4403	N853MQ	JFK	RDU	78	427	14	50	2013-01-01 19:00:00+00
2013	1	1	1451	1500	-9	1634	1636	-2	9E	4105	N8444F	JFK	IAD	57	228	15	0	2013-01-01 20:00:00+00
2013	1	1	1452	1455	-3	1637	1639	-2	9E	3295	N920XJ	JFK	BUF	68	301	14	55	2013-01-01 19:00:00+00
2013	1	1	1452	1457	-5	1753	1811	-18	B6	61	N292JB	JFK	FLL	162	1069	14	57	2013-01-01 19:00:00+00
2013	1	1	1453	1450	3	1707	1645	22	MQ	4172	N610MQ	JFK	CLE	99	425	14	50	2013-01-01 19:00:00+00
2013	1	1	1453	1500	-7	1601	1620	-19	US	2179	N951UW	LGA	DCA	51	214	15	0	2013-01-01 20:00:00+00
2013	1	1	1454	1458	-4	1554	1615	-21	EV	4390	N11544	EWR	PWM	47	284	14	58	2013-01-01 19:00:00+00
2013	1	1	1454	1500	-6	1635	1636	-1	9E	3843	N8409N	JFK	SYR	57	209	15	0	2013-01-01 20:00:00+00
2013	1	1	1454	1500	-6	1815	1837	-22	DL	1467	N702TW	JFK	LAX	340	2475	15	0	2013-01-01 20:00:00+00
2013	1	1	1455	1457	-2	1731	1730	1	B6	119	N279JB	JFK	MSY	192	1182	14	57	2013-01-01 19:00:00+00
2013	1	1	1455	1459	-4	1655	1645	10	B6	1053	N203JB	JFK	PIT	87	340	14	59	2013-01-01 19:00:00+00
2013	1	1	1455	1500	-5	1753	1810	-17	DL	1997	N997DL	LGA	PBI	152	1035	15	0	2013-01-01 20:00:00+00
2013	1	1	1456	1500	-4	1649	1632	17	UA	685	N802UA	LGA	ORD	140	733	15	0	2013-01-01 20:00:00+00
2013	1	1	1456	1455	1	1830	1813	17	UA	1134	N24212	EWR	AUS	252	1504	14	55	2013-01-01 19:00:00+00
2013	1	1	1457	1500	-3	1758	1815	-17	UA	379	N401UA	EWR	RSW	166	1068	15	0	2013-01-01 20:00:00+00
2013	1	1	1457	1500	-3	1652	1656	-4	US	720	N539UW	EWR	CLT	97	529	15	0	2013-01-01 20:00:00+00
2013	1	1	1458	1500	-2	1658	1655	3	MQ	4429	N736MQ	LGA	CMH	94	479	15	0	2013-01-01 20:00:00+00
2013	1	1	1459	1501	-2	1651	1651	0	EV	5675	N15572	EWR	CMH	96	463	15	1	2013-01-01 20:00:00+00
2013	1	1	1459	1454	5	1750	1751	-1	UA	1105	N75435	EWR	TPA	152	997	14	54	2013-01-01 19:00:00+00
2013	1	1	1500	1459	1	1809	1806	3	B6	377	N633JB	LGA	FLL	167	1076	14	59	2013-01-01 19:00:00+00
2013	1	1	1502	1500	2	1802	1806	-4	UA	456	N406UA	EWR	FLL	156	1065	15	0	2013-01-01 20:00:00+00
2013	1	1	1505	1310	115	1638	1431	127	EV	4497	N17984	EWR	RIC	63	277	13	10	2013-01-01 18:00:00+00
2013	1	1	1505	1510	-5	1654	1655	-1	MQ	4447	N734MQ	LGA	RDU	82	431	15	10	2013-01-01 20:00:00+00
2013	1	1	1506	1505	1	1838	1820	18	AA	759	N3DUAA	LGA	DFW	248	1389	15	5	2013-01-01 20:00:00+00
2013	1	1	1506	1512	-6	1723	1741	-18	UA	407	N513UA	LGA	DEN	237	1620	15	12	2013-01-01 20:00:00+00
2013	1	1	1507	1515	-8	1651	1656	-5	9E	3792	N8631E	JFK	ROC	66	264	15	15	2013-01-01 20:00:00+00
2013	1	1	1507	1510	-3	1748	1745	3	MQ	4309	N803MQ	JFK	IND	130	665	15	10	2013-01-01 20:00:00+00
2013	1	1	1508	1450	18	1813	1747	26	UA	1687	N76529	EWR	MCO	146	937	14	50	2013-01-01 19:00:00+00
2013	1	1	1510	1517	-7	1811	1811	0	B6	537	N563JB	EWR	TPA	156	997	15	17	2013-01-01 20:00:00+00
2013	1	1	1511	1500	11	1753	1742	11	DL	2347	N678DL	LGA	ATL	135	762	15	0	2013-01-01 20:00:00+00
2013	1	1	1511	1515	-4	1657	1700	-3	DL	1456	N318NB	LGA	BUF	60	292	15	15	2013-01-01 20:00:00+00
2013	1	1	1512	1518	-6	1805	1823	-18	B6	153	N645JB	JFK	MCO	142	944	15	18	2013-01-01 20:00:00+00
2013	1	1	1513	1505	8	1714	1703	11	EV	4223	N13914	EWR	CLT	102	529	15	5	2013-01-01 20:00:00+00
2013	1	1	1513	1515	-2	1705	1700	5	MQ	4333	N635MQ	JFK	PIT	79	340	15	15	2013-01-01 20:00:00+00
2013	1	1	1515	1437	38	1834	1742	52	B6	347	N178JB	JFK	SRQ	171	1041	14	37	2013-01-01 19:00:00+00
2013	1	1	1518	1516	2	1837	1832	5	UA	1699	N53442	EWR	SFO	348	2565	15	16	2013-01-01 20:00:00+00
2013	1	1	1520	1430	50	1835	1735	60	AA	883	N589AA	EWR	DFW	236	1372	14	30	2013-01-01 19:00:00+00
2013	1	1	1520	1525	-5	1643	1655	-12	MQ	3823	N509MQ	JFK	DCA	57	213	15	25	2013-01-01 20:00:00+00
2013	1	1	1520	1520	0	1817	1816	1	UA	1593	N13750	EWR	MCO	152	937	15	20	2013-01-01 20:00:00+00
2013	1	1	1521	1515	6	1830	1823	7	DL	507	N378NW	LGA	MCO	145	950	15	15	2013-01-01 20:00:00+00
2013	1	1	1522	1530	-8	1731	1725	6	MQ	4146	N902MQ	JFK	CMH	98	483	15	30	2013-01-01 20:00:00+00
2013	1	1	1522	1530	-8	1858	1855	3	UA	530	N512UA	JFK	LAX	356	2475	15	30	2013-01-01 20:00:00+00
2013	1	1	1523	1516	7	1831	1828	3	UA	1600	N18112	EWR	LAX	337	2454	15	16	2013-01-01 20:00:00+00
2013	1	1	1524	1457	27	1828	1801	27	B6	141	N504JB	JFK	PBI	156	1028	14	57	2013-01-01 19:00:00+00
2013	1	1	1525	1340	105	1831	1626	125	B6	525	N231JB	EWR	MCO	152	937	13	40	2013-01-01 18:00:00+00
2013	1	1	1525	1530	-5	1934	1805	\N	MQ	4525	N719MQ	LGA	XNA	\N	1147	15	30	2013-01-01 20:00:00+00
2013	1	1	1526	1530	-4	1714	1650	24	WN	4105	N280WN	EWR	MDW	141	711	15	30	2013-01-01 20:00:00+00
2013	1	1	1527	1530	-3	1841	1855	-14	AA	1039	N3HYAA	JFK	FLL	163	1069	15	30	2013-01-01 20:00:00+00
2013	1	1	1527	1455	32	1655	1628	27	B6	8	N607JB	JFK	BUF	66	301	14	55	2013-01-01 19:00:00+00
2013	1	1	1527	1533	-6	1836	1857	-21	B6	137	N794JB	JFK	RSW	168	1074	15	33	2013-01-01 20:00:00+00
2013	1	1	1527	1515	12	1854	1810	44	UA	1695	N69059	EWR	IAH	210	1400	15	15	2013-01-01 20:00:00+00
2013	1	1	1528	1459	29	2002	1647	\N	EV	3806	N17108	EWR	STL	\N	872	14	59	2013-01-01 19:00:00+00
2013	1	1	1528	1530	-2	1731	1725	6	AA	2223	N573AA	LGA	STL	160	888	15	30	2013-01-01 20:00:00+00
2013	1	1	1529	1457	32	1720	1634	46	UA	459	N497UA	EWR	ORD	138	719	14	57	2013-01-01 19:00:00+00
2013	1	1	1529	1530	-1	1733	1737	-4	US	1665	N738US	LGA	CLT	103	544	15	30	2013-01-01 20:00:00+00
2013	1	1	1530	1530	0	1650	1655	-5	9E	3369	N913XJ	JFK	BWI	40	184	15	30	2013-01-01 20:00:00+00
2013	1	1	1531	1453	38	1637	1603	34	EV	4372	N13975	EWR	DCA	45	199	14	53	2013-01-01 19:00:00+00
2013	1	1	1531	1459	32	1745	1658	47	EV	4572	N15912	EWR	GSP	106	594	14	59	2013-01-01 19:00:00+00
2013	1	1	1531	1520	11	1809	1750	19	UA	365	N514UA	EWR	DEN	247	1605	15	20	2013-01-01 20:00:00+00
2013	1	1	1534	1530	4	1755	1735	20	EV	4093	N17115	EWR	GRR	120	605	15	30	2013-01-01 20:00:00+00
2013	1	1	1536	1520	16	1709	1650	19	WN	2081	N226WN	LGA	MKE	133	738	15	20	2013-01-01 20:00:00+00
2013	1	1	1538	1540	-2	1827	1851	-24	DL	4	N372DA	JFK	MCO	133	944	15	40	2013-01-01 20:00:00+00
2013	1	1	1539	1530	9	1904	1910	-6	AA	85	N342AA	JFK	SFO	360	2586	15	30	2013-01-01 20:00:00+00
2013	1	1	1539	1545	-6	1853	1910	-17	AA	133	N319AA	JFK	LAX	351	2475	15	45	2013-01-01 20:00:00+00
2013	1	1	1539	1537	2	1854	1819	35	UA	1222	N14250	EWR	LAS	342	2227	15	37	2013-01-01 20:00:00+00
2013	1	1	1540	1338	122	2020	1825	115	B6	705	N570JB	JFK	SJU	193	1598	13	38	2013-01-01 18:00:00+00
2013	1	1	1542	1545	-3	1852	1913	-21	DL	1283	N3750D	JFK	SAN	342	2446	15	45	2013-01-01 20:00:00+00
2013	1	1	1543	1550	-7	1933	1925	8	DL	1773	N688DL	JFK	SLC	320	1990	15	50	2013-01-01 20:00:00+00
2013	1	1	1543	1543	0	1731	1733	-2	UA	636	N413UA	LGA	CLE	88	419	15	43	2013-01-01 20:00:00+00
2013	1	1	1546	1540	6	1753	1748	5	9E	3338	N904XJ	JFK	ORD	146	740	15	40	2013-01-01 20:00:00+00
2013	1	1	1547	1545	2	1823	1815	8	DL	1942	N994DL	EWR	ATL	129	746	15	45	2013-01-01 20:00:00+00
2013	1	1	1548	1420	88	1751	1620	91	MQ	4588	N6EAMQ	LGA	MSP	167	1020	14	20	2013-01-01 19:00:00+00
2013	1	1	1549	1445	64	1912	1656	136	EV	4181	N21197	EWR	MCI	234	1092	14	45	2013-01-01 19:00:00+00
2013	1	1	1549	1548	1	1851	1859	-8	UA	80	N54241	EWR	MIA	156	1085	15	48	2013-01-01 20:00:00+00
2013	1	1	1550	1550	0	1844	1831	13	9E	3372	N934XJ	JFK	IND	139	665	15	50	2013-01-01 20:00:00+00
2013	1	1	1552	1600	-8	1732	1720	12	EV	5709	N825AS	LGA	IAD	55	229	16	0	2013-01-01 21:00:00+00
2013	1	1	1552	1600	-8	1826	1820	6	FL	620	N997AT	LGA	ATL	132	762	16	0	2013-01-01 21:00:00+00
2013	1	1	1552	1600	-8	1749	1757	-8	9E	3459	N910XJ	JFK	BNA	150	765	16	0	2013-01-01 21:00:00+00
2013	1	1	1552	1600	-8	1933	1915	18	AA	565	N3CGAA	JFK	DFW	254	1391	16	0	2013-01-01 21:00:00+00
2013	1	1	1554	1600	-6	1701	1734	-33	9E	3331	N931XJ	JFK	BOS	41	187	16	0	2013-01-01 21:00:00+00
2013	1	1	1554	1559	-5	1857	1841	16	DL	847	N918DE	LGA	ATL	131	762	15	59	2013-01-01 20:00:00+00
2013	1	1	1554	1600	-6	1830	1820	10	MQ	3985	N606MQ	JFK	CVG	118	589	16	0	2013-01-01 21:00:00+00
2013	1	1	1556	1600	-4	1737	1739	-2	EV	5163	N761ND	LGA	PIT	69	335	16	0	2013-01-01 21:00:00+00
2013	1	1	1557	1600	-3	1910	1939	-29	DL	1508	N955DL	JFK	RSW	171	1074	16	0	2013-01-01 21:00:00+00
2013	1	1	1557	1600	-3	1746	1742	4	UA	687	N487UA	LGA	ORD	143	733	16	0	2013-01-01 21:00:00+00
2013	1	1	1558	1534	24	1808	1703	65	EV	4502	N16546	EWR	BNA	168	748	15	34	2013-01-01 20:00:00+00
2013	1	1	1558	1359	119	1718	1515	123	EV	5712	N826AS	JFK	IAD	53	228	13	59	2013-01-01 18:00:00+00
2013	1	1	1558	1600	-2	1910	1903	7	B6	509	N708JB	EWR	FLL	166	1065	16	0	2013-01-01 21:00:00+00
2013	1	1	1559	1605	-6	1844	1912	-28	DL	91	N374DA	JFK	LAS	309	2248	16	5	2013-01-01 21:00:00+00
2013	1	1	1600	1610	-10	1712	1729	-17	9E	4088	N8968E	JFK	PHL	35	94	16	10	2013-01-01 21:00:00+00
2013	1	1	1601	1601	0	1750	1735	15	UA	702	N484UA	EWR	ORD	141	719	16	1	2013-01-01 21:00:00+00
2013	1	1	1602	1605	-3	1834	1838	-4	DL	1861	N301NB	LGA	MCI	189	1107	16	5	2013-01-01 21:00:00+00
2013	1	1	1603	1547	16	1720	1708	12	EV	3272	N14168	EWR	BUF	58	282	15	47	2013-01-01 20:00:00+00
2013	1	1	1603	1550	13	1751	1739	12	B6	917	N316JB	JFK	ORD	150	740	15	50	2013-01-01 20:00:00+00
2013	1	1	1603	1600	3	1839	1830	9	WN	591	N965WN	EWR	DEN	254	1605	16	0	2013-01-01 21:00:00+00
2013	1	1	1603	1605	-2	1818	1750	28	MQ	4415	N730MQ	LGA	RDU	79	431	16	5	2013-01-01 21:00:00+00
2013	1	1	1603	1600	3	1912	1906	6	UA	367	N820UA	EWR	FLL	162	1065	16	0	2013-01-01 21:00:00+00
2013	1	1	1604	1510	54	1817	1710	67	MQ	4579	N0EGMQ	LGA	CLT	106	544	15	10	2013-01-01 20:00:00+00
2013	1	1	1605	1610	-5	1804	1800	4	AA	341	N569AA	LGA	ORD	146	733	16	10	2013-01-01 21:00:00+00
2013	1	1	1607	1555	12	1735	1715	20	B6	12	N184JB	JFK	SYR	58	209	15	55	2013-01-01 20:00:00+00
2013	1	1	1607	1443	84	1711	1553	78	UA	465	N435UA	EWR	BOS	35	200	14	43	2013-01-01 19:00:00+00
2013	1	1	1608	1535	33	2002	1850	72	AA	763	N3GKAA	LGA	DFW	249	1389	15	35	2013-01-01 20:00:00+00
2013	1	1	1608	1600	8	1953	1925	28	AA	1467	N3DYAA	LGA	MIA	171	1096	16	0	2013-01-01 21:00:00+00
2013	1	1	1608	1609	-1	1847	1910	-23	B6	157	N712JB	JFK	MCO	137	944	16	9	2013-01-01 21:00:00+00
2013	1	1	1610	1615	-5	1913	1948	-35	DL	1411	N947DL	JFK	FLL	155	1069	16	15	2013-01-01 21:00:00+00
2013	1	1	1610	1615	-5	1827	1830	-3	DL	1619	N360NB	LGA	MSP	168	1020	16	15	2013-01-01 21:00:00+00
2013	1	1	1610	1555	15	1852	1834	18	DL	1939	N362NW	LGA	DEN	235	1620	15	55	2013-01-01 20:00:00+00
2013	1	1	1611	1601	10	2010	1941	29	UA	1635	N76504	EWR	PHX	328	2133	16	1	2013-01-01 21:00:00+00
2013	1	1	1615	1602	13	1748	1728	20	EV	4406	N36915	EWR	PIT	73	319	16	2	2013-01-01 21:00:00+00
2013	1	1	1619	1625	-6	1912	1855	17	MQ	4661	N537MQ	LGA	ATL	136	762	16	25	2013-01-01 21:00:00+00
2013	1	1	1620	1620	0	1945	1922	23	UA	1178	N18119	EWR	IAH	242	1400	16	20	2013-01-01 21:00:00+00
2013	1	1	1621	1548	33	1904	1830	34	DL	95	N704X	JFK	ATL	130	760	15	48	2013-01-01 20:00:00+00
2013	1	1	1623	1620	3	2002	1959	3	US	35	N550UW	JFK	PHX	317	2153	16	20	2013-01-01 21:00:00+00
2013	1	1	1625	1550	35	2054	2050	4	AA	1635	N630AA	JFK	SJU	188	1598	15	50	2013-01-01 20:00:00+00
2013	1	1	1626	1630	-4	2007	1952	15	B6	675	N804JB	JFK	LAX	370	2475	16	30	2013-01-01 21:00:00+00
2013	1	1	1626	1630	-4	1855	1853	2	DL	702	N361NW	JFK	DTW	108	509	16	30	2013-01-01 21:00:00+00
2013	1	1	1627	1459	88	1925	1805	80	B6	63	N599JB	JFK	TPA	159	1005	14	59	2013-01-01 19:00:00+00
2013	1	1	1627	1630	-3	1940	2020	-40	VX	27	N847VA	JFK	SFO	354	2586	16	30	2013-01-01 21:00:00+00
2013	1	1	1628	1524	64	1740	1641	59	EV	4133	N14959	EWR	IAD	53	212	15	24	2013-01-01 20:00:00+00
2013	1	1	1628	1630	-2	1907	1923	-16	DL	920	N331NW	JFK	DEN	248	1626	16	30	2013-01-01 21:00:00+00
2013	1	1	1630	1548	42	1902	1755	67	EV	4352	N22909	EWR	CVG	121	569	15	48	2013-01-01 20:00:00+00
2013	1	1	1630	1636	-6	1913	1943	-30	B6	143	N534JB	JFK	PBI	147	1028	16	36	2013-01-01 21:00:00+00
2013	1	1	1631	1617	14	1740	1727	13	EV	4299	N14972	EWR	DCA	48	199	16	17	2013-01-01 21:00:00+00
2013	1	1	1631	1635	-4	1956	2000	-4	US	656	N649AW	EWR	PHX	309	2133	16	35	2013-01-01 21:00:00+00
2013	1	1	1631	1630	1	1935	1950	-15	UA	1726	N75425	EWR	SAN	346	2425	16	30	2013-01-01 21:00:00+00
2013	1	1	1632	1635	-3	1903	1840	23	WN	190	N258WN	LGA	STL	181	888	16	35	2013-01-01 21:00:00+00
2013	1	1	1632	1635	-3	1824	1810	14	MQ	3695	N507MQ	EWR	ORD	139	719	16	35	2013-01-01 21:00:00+00
2013	1	1	1634	1626	8	1913	1852	21	UA	69	N27213	EWR	DEN	247	1605	16	26	2013-01-01 21:00:00+00
2013	1	1	1635	1630	5	1830	1810	20	UA	162	N16701	EWR	CLE	84	404	16	30	2013-01-01 21:00:00+00
2013	1	1	1636	1639	-3	1747	1755	-8	B6	1176	N190JB	EWR	BOS	42	200	16	39	2013-01-01 21:00:00+00
2013	1	1	1637	1545	52	1858	1819	39	9E	3321	N604LR	JFK	MSP	173	1029	15	45	2013-01-01 20:00:00+00
2013	1	1	1639	1517	82	1815	1639	96	EV	4580	N16561	EWR	MKE	140	725	15	17	2013-01-01 20:00:00+00
2013	1	1	1640	1640	0	1859	1850	9	MQ	4540	N723MQ	LGA	DTW	106	502	16	40	2013-01-01 21:00:00+00
2013	1	1	1641	1650	-9	1746	1820	-34	AA	1790	N3BYAA	JFK	BOS	41	187	16	50	2013-01-01 21:00:00+00
2013	1	1	1642	1610	32	1944	1919	25	UA	1587	N17229	EWR	RSW	161	1068	16	10	2013-01-01 21:00:00+00
2013	1	1	1645	1639	6	1832	1816	16	EV	4336	N13538	EWR	GSO	89	445	16	39	2013-01-01 21:00:00+00
2013	1	1	1649	1639	10	1937	1911	26	EV	4705	N14960	EWR	ATL	139	746	16	39	2013-01-01 21:00:00+00
2013	1	1	1650	1615	35	2009	1913	56	B6	985	N564JB	LGA	TPA	162	1010	16	15	2013-01-01 21:00:00+00
2013	1	1	1651	1650	1	2000	2004	-4	B6	185	N665JB	JFK	SAN	349	2446	16	50	2013-01-01 21:00:00+00
2013	1	1	1652	1640	12	2030	1955	35	AA	773	N565AA	LGA	DFW	252	1389	16	40	2013-01-01 21:00:00+00
2013	1	1	1653	1700	-7	2005	2018	-13	DL	1807	N980DL	LGA	FLL	158	1076	17	0	2013-01-01 22:00:00+00
2013	1	1	1654	1644	10	1752	1753	-1	EV	4539	N27962	EWR	MHT	38	209	16	44	2013-01-01 21:00:00+00
2013	1	1	1654	1700	-6	2020	2034	-14	DL	706	N320NB	JFK	AUS	251	1521	17	0	2013-01-01 22:00:00+00
2013	1	1	1655	1621	34	1804	1724	40	EV	3260	N19554	EWR	ALB	36	143	16	21	2013-01-01 21:00:00+00
2013	1	1	1655	1700	-5	1953	1950	3	AA	575	N5DRAA	JFK	EGE	280	1747	17	0	2013-01-01 22:00:00+00
2013	1	1	1655	1700	-5	2027	2049	-22	DL	31	N713TW	JFK	SFO	357	2586	17	0	2013-01-01 22:00:00+00
2013	1	1	1655	1655	0	2025	2030	-5	VX	413	N626VA	JFK	LAX	362	2475	16	55	2013-01-01 21:00:00+00
2013	1	1	1656	1700	-4	1941	1955	-14	AA	257	N3CAAA	JFK	LAS	322	2248	17	0	2013-01-01 22:00:00+00
2013	1	1	1657	1650	7	1921	1840	41	WN	2773	N462WN	EWR	STL	181	872	16	50	2013-01-01 21:00:00+00
2013	1	1	1657	1630	27	1948	1926	22	UA	1609	N17105	EWR	MCO	148	937	16	30	2013-01-01 21:00:00+00
2013	1	1	1658	1700	-2	1808	1840	-32	MQ	4323	N688MQ	JFK	ORF	52	290	17	0	2013-01-01 22:00:00+00
2013	1	1	1701	1710	-9	2026	2015	11	AA	695	N3FUAA	JFK	AUS	247	1521	17	10	2013-01-01 22:00:00+00
2013	1	1	1701	1700	1	1856	1840	16	UA	689	N418UA	LGA	ORD	144	733	17	0	2013-01-01 22:00:00+00
2013	1	1	1702	1700	2	2044	2028	16	UA	1259	N16632	LGA	IAH	234	1416	17	0	2013-01-01 22:00:00+00
2013	1	1	1705	1705	0	2054	2010	44	AA	1905	N4WRAA	EWR	DFW	251	1372	17	5	2013-01-01 22:00:00+00
2013	1	1	1705	1710	-5	1924	1915	9	US	1447	N188US	LGA	CLT	110	544	17	10	2013-01-01 22:00:00+00
2013	1	1	1707	1705	2	1928	1940	-12	DL	2121	N3730B	EWR	ATL	121	746	17	5	2013-01-01 22:00:00+00
2013	1	1	1707	1700	7	2006	2000	6	UA	342	N543UA	EWR	LAX	334	2454	17	0	2013-01-01 22:00:00+00
2013	1	1	1708	1700	8	2037	2005	32	WN	1066	N778SW	EWR	HOU	245	1411	17	0	2013-01-01 22:00:00+00
2013	1	1	1711	1650	21	1820	1806	14	EV	4194	N15986	EWR	BTV	48	266	16	50	2013-01-01 21:00:00+00
2013	1	1	1711	1635	36	1918	1845	33	B6	1085	N228JB	JFK	CLT	112	541	16	35	2013-01-01 21:00:00+00
2013	1	1	1711	1600	71	2005	1857	68	B6	369	N579JB	LGA	PBI	149	1035	16	0	2013-01-01 21:00:00+00
2013	1	1	1712	1719	-7	1939	1958	-19	UA	509	N569UA	LGA	DEN	241	1620	17	19	2013-01-01 22:00:00+00
2013	1	1	1712	1700	12	2042	2036	6	UA	635	N485UA	EWR	SAT	242	1569	17	0	2013-01-01 22:00:00+00
2013	1	1	1713	1700	13	2006	2014	-8	B6	15	N346JB	JFK	FLL	156	1069	17	0	2013-01-01 22:00:00+00
2013	1	1	1714	1720	-6	1915	1915	0	AA	1351	N3CVAA	JFK	ORD	146	740	17	20	2013-01-01 22:00:00+00
2013	1	1	1716	1730	-14	1947	1953	-6	F9	511	N263AV	LGA	DEN	242	1620	17	30	2013-01-01 22:00:00+00
2013	1	1	1716	1545	91	2140	2039	61	B6	703	N651JB	JFK	SJU	183	1598	15	45	2013-01-01 20:00:00+00
2013	1	1	1716	1709	7	1902	1846	16	UA	1623	N19130	EWR	ORD	143	719	17	9	2013-01-01 22:00:00+00
2013	1	1	1717	1720	-3	1920	1910	10	AA	345	N539AA	LGA	ORD	141	733	17	20	2013-01-01 22:00:00+00
2013	1	1	1718	1710	8	2154	2201	-7	B6	699	N507JB	JFK	SJU	189	1598	17	10	2013-01-01 22:00:00+00
2013	1	1	1719	1720	-1	1908	1905	3	MQ	4479	N713MQ	LGA	RDU	80	431	17	20	2013-01-01 22:00:00+00
2013	1	1	1720	1725	-5	2121	2105	16	DL	513	N723TW	JFK	LAX	363	2475	17	25	2013-01-01 22:00:00+00
2013	1	1	1725	1730	-5	1929	1926	3	US	449	N680AW	EWR	CLT	104	529	17	30	2013-01-01 22:00:00+00
2013	1	1	1725	1720	5	2045	2021	24	UA	1712	N17122	EWR	IAH	235	1400	17	20	2013-01-01 22:00:00+00
2013	1	1	1726	1730	-4	2054	2050	4	AA	543	N386AA	JFK	MIA	157	1089	17	30	2013-01-01 22:00:00+00
2013	1	1	1726	1729	-3	2042	2100	-18	UA	512	N557UA	JFK	SFO	347	2586	17	29	2013-01-01 22:00:00+00
2013	1	1	1727	1725	2	2043	2040	3	AA	145	N377AA	JFK	SAN	357	2446	17	25	2013-01-01 22:00:00+00
2013	1	1	1728	1600	88	2004	1817	107	EV	3843	N13903	EWR	SDF	135	642	16	0	2013-01-01 21:00:00+00
2013	1	1	1729	1718	11	2052	2055	-3	UA	1284	N14120	EWR	SFO	360	2565	17	18	2013-01-01 22:00:00+00
2013	1	1	1730	1730	0	2013	1959	14	FL	623	N967AT	LGA	ATL	128	762	17	30	2013-01-01 22:00:00+00
2013	1	1	1730	1730	0	2126	2110	16	B6	179	N618JB	JFK	PHX	323	2153	17	30	2013-01-01 22:00:00+00
2013	1	1	1730	1729	1	2039	2058	-19	UA	1715	N77296	EWR	SEA	344	2402	17	29	2013-01-01 22:00:00+00
2013	1	1	1732	1630	62	2028	1825	123	EV	4092	N16911	EWR	DAY	119	533	16	30	2013-01-01 21:00:00+00
2013	1	1	1736	1640	56	2047	2001	46	B6	139	N329JB	JFK	RSW	176	1074	16	40	2013-01-01 21:00:00+00
2013	1	1	1738	1745	-7	2030	2042	-12	B6	547	N508JB	EWR	PBI	147	1023	17	45	2013-01-01 22:00:00+00
2013	1	1	1739	1745	-6	1956	1953	3	DL	2331	N965DL	LGA	DTW	93	502	17	45	2013-01-01 22:00:00+00
2013	1	1	1739	1740	-1	2051	2112	-21	DL	1339	N3761R	JFK	PDX	341	2454	17	40	2013-01-01 22:00:00+00
2013	1	1	1740	1630	70	2102	1954	68	DL	2139	N369NW	LGA	MIA	167	1096	16	30	2013-01-01 21:00:00+00
2013	1	1	1740	1745	-5	2158	2020	\N	MQ	4413	N739MQ	LGA	XNA	\N	1147	17	45	2013-01-01 22:00:00+00
2013	1	1	1742	1746	-4	2028	2052	-24	DL	1585	N933DL	LGA	MCO	145	950	17	46	2013-01-01 22:00:00+00
2013	1	1	1743	1615	88	1925	1819	66	9E	3651	N8515F	JFK	RDU	72	427	16	15	2013-01-01 21:00:00+00
2013	1	1	1744	1750	-6	2043	2045	-2	B6	527	N661JB	EWR	MCO	137	937	17	50	2013-01-01 22:00:00+00
2013	1	1	1744	1720	24	2052	2025	27	B6	163	N658JB	JFK	TPA	160	1005	17	20	2013-01-01 22:00:00+00
2013	1	1	1744	1745	-1	2055	2059	-4	DL	1935	N900DE	LGA	TPA	160	1010	17	45	2013-01-01 22:00:00+00
2013	1	1	1744	1745	-1	1925	1915	10	WN	128	N8324A	LGA	MDW	137	725	17	45	2013-01-01 22:00:00+00
2013	1	1	1745	1749	-4	1943	1909	34	B6	1307	N216JB	JFK	IAD	65	228	17	49	2013-01-01 22:00:00+00
2013	1	1	1750	1750	0	2109	2115	-6	UA	535	N525UA	JFK	LAX	345	2475	17	50	2013-01-01 22:00:00+00
2013	1	1	1751	1745	6	2044	2040	4	B6	9	N527JB	JFK	MCO	141	944	17	45	2013-01-01 22:00:00+00
2013	1	1	1751	1745	6	2015	1910	65	WN	3384	N764SW	EWR	MDW	148	711	17	45	2013-01-01 22:00:00+00
2013	1	1	1753	1745	8	2058	2037	21	B6	391	N630JB	LGA	MCO	144	950	17	45	2013-01-01 22:00:00+00
2013	1	1	1756	1725	31	2036	2019	17	UA	376	N523UA	EWR	MCO	140	937	17	25	2013-01-01 22:00:00+00
2013	1	1	1757	1703	54	1904	1813	51	EV	4373	N14998	EWR	DCA	45	199	17	3	2013-01-01 22:00:00+00
2013	1	1	1757	1759	-2	2027	2042	-15	DL	1047	N643DL	LGA	ATL	125	762	17	59	2013-01-01 22:00:00+00
2013	1	1	1758	1800	-2	1905	1917	-12	B6	1016	N304JB	JFK	BOS	36	187	18	0	2013-01-01 23:00:00+00
2013	1	1	1758	1800	-2	2105	2110	-5	B6	989	N663JB	JFK	FLL	152	1069	18	0	2013-01-01 23:00:00+00
2013	1	1	1758	1749	9	2020	1943	37	UA	1676	N37274	EWR	ORD	135	719	17	49	2013-01-01 22:00:00+00
2013	1	1	1759	1759	0	1957	1949	8	EV	4581	N13566	EWR	CMH	95	463	17	59	2013-01-01 22:00:00+00
2013	1	1	1800	1800	0	1945	1951	-6	B6	1111	N294JB	JFK	RDU	78	427	18	0	2013-01-01 23:00:00+00
2013	1	1	1800	1800	0	1951	1954	-3	UA	1053	N16703	EWR	CLE	83	404	18	0	2013-01-01 23:00:00+00
2013	1	1	1802	1805	-3	1930	1944	-14	DL	1006	N359NB	LGA	BUF	61	292	18	5	2013-01-01 23:00:00+00
2013	1	1	1802	1801	1	2125	2137	-12	UA	1165	N75429	EWR	LAX	340	2454	18	1	2013-01-01 23:00:00+00
2013	1	1	1803	1726	37	2011	1934	37	EV	4382	N13958	EWR	DTW	104	488	17	26	2013-01-01 22:00:00+00
2013	1	1	1803	1620	103	2008	1750	138	MQ	4622	N504MQ	LGA	BNA	154	764	16	20	2013-01-01 21:00:00+00
2013	1	1	1803	1800	3	2021	2001	20	US	373	N510UW	JFK	CLT	100	541	18	0	2013-01-01 23:00:00+00
2013	1	1	1805	1757	8	2117	2119	-2	UA	1152	N39463	EWR	PDX	336	2434	17	57	2013-01-01 22:00:00+00
2013	1	1	1806	1810	-4	2002	1945	17	MQ	4484	N711MQ	LGA	BNA	152	764	18	10	2013-01-01 23:00:00+00
2013	1	1	1807	1738	29	2251	2103	\N	UA	1228	N31412	EWR	SAN	\N	2425	17	38	2013-01-01 22:00:00+00
2013	1	1	1808	1815	-7	2111	2130	-19	AS	7	N553AS	EWR	SEA	336	2402	18	15	2013-01-01 23:00:00+00
2013	1	1	1809	1810	-1	2117	2132	-15	B6	217	N592JB	JFK	LGB	337	2465	18	10	2013-01-01 23:00:00+00
2013	1	1	1811	1759	12	2132	2118	14	UA	618	N482UA	EWR	DFW	228	1372	17	59	2013-01-01 22:00:00+00
2013	1	1	1814	1700	74	2051	1855	116	EV	4202	N19966	EWR	STL	177	872	17	0	2013-01-01 22:00:00+00
2013	1	1	1814	1815	-1	2122	2151	-29	B6	173	N569JB	JFK	SJC	334	2569	18	15	2013-01-01 23:00:00+00
2013	1	1	1815	1325	290	2120	1542	338	EV	4417	N17185	EWR	OMA	213	1134	13	25	2013-01-01 18:00:00+00
2013	1	1	1815	1805	10	1928	1920	8	WN	731	N266WN	LGA	BWI	46	185	18	5	2013-01-01 23:00:00+00
2013	1	1	1816	1805	11	2013	1955	18	MQ	4626	N8EGMQ	LGA	CMH	93	479	18	5	2013-01-01 23:00:00+00
2013	1	1	1816	1800	16	2101	2050	11	UA	638	N522UA	EWR	LAS	307	2227	18	0	2013-01-01 23:00:00+00
2013	1	1	1817	1820	-3	2008	2005	3	AA	353	N3AXAA	LGA	ORD	138	733	18	20	2013-01-01 23:00:00+00
2013	1	1	1820	1820	0	2216	2150	26	AA	119	N3FMAA	EWR	LAX	366	2454	18	20	2013-01-01 23:00:00+00
2013	1	1	1823	1830	-7	2036	2055	-19	DL	924	N337NW	JFK	MSP	158	1029	18	30	2013-01-01 23:00:00+00
2013	1	1	1824	1830	-6	2203	2205	-2	AA	269	N3ETAA	JFK	SEA	348	2422	18	30	2013-01-01 23:00:00+00
2013	1	1	1825	1829	-4	2056	2053	3	9E	3286	N906XJ	JFK	DTW	107	509	18	29	2013-01-01 23:00:00+00
2013	1	1	1825	1829	-4	2046	2032	14	US	1973	N460UW	EWR	CLT	106	529	18	29	2013-01-01 23:00:00+00
2013	1	1	1826	1810	16	2132	2130	2	AA	1611	N3DWAA	LGA	MIA	153	1096	18	10	2013-01-01 23:00:00+00
2013	1	1	1826	1830	-4	2154	2207	-13	DL	1643	N3772H	JFK	SEA	334	2422	18	30	2013-01-01 23:00:00+00
2013	1	1	1827	1829	-2	2105	2056	9	UA	1139	N39728	EWR	DEN	246	1605	18	29	2013-01-01 23:00:00+00
2013	1	1	1828	1805	23	2023	1951	32	EV	4334	N11119	LGA	CLE	80	419	18	5	2013-01-01 23:00:00+00
2013	1	1	1830	1829	1	2131	2125	6	UA	1684	N33714	EWR	PBI	152	1023	18	29	2013-01-01 23:00:00+00
2013	1	1	1832	1823	9	1948	1940	8	EV	4326	N13988	EWR	PWM	48	284	18	23	2013-01-01 23:00:00+00
2013	1	1	1832	1835	-3	2059	2103	-4	9E	3830	N8894A	JFK	CHS	106	636	18	35	2013-01-01 23:00:00+00
2013	1	1	1832	1828	4	2144	2144	0	UA	1075	N18220	EWR	SNA	342	2434	18	28	2013-01-01 23:00:00+00
2013	1	1	1834	1840	-6	2027	2020	7	MQ	3730	N517MQ	EWR	ORD	137	719	18	40	2013-01-01 23:00:00+00
2013	1	1	1834	1800	34	2014	1942	32	UA	668	N467UA	LGA	ORD	123	733	18	0	2013-01-01 23:00:00+00
2013	1	1	1836	1726	70	2107	1933	94	EV	4179	N14543	EWR	CVG	123	569	17	26	2013-01-01 22:00:00+00
2013	1	1	1840	1836	4	2022	2010	12	B6	130	N281JB	JFK	BUF	70	301	18	36	2013-01-01 23:00:00+00
2013	1	1	1840	1845	-5	2055	2030	25	MQ	4517	N725MQ	LGA	CRW	96	444	18	45	2013-01-01 23:00:00+00
2013	1	1	1840	1845	-5	2223	2226	-3	UA	389	N508UA	JFK	SFO	357	2586	18	45	2013-01-01 23:00:00+00
2013	1	1	1842	1422	260	1958	1535	263	EV	4633	N18120	EWR	BTV	46	266	14	22	2013-01-01 19:00:00+00
2013	1	1	1842	1829	13	2144	2136	8	UA	1292	N14214	EWR	FLL	149	1065	18	29	2013-01-01 23:00:00+00
2013	1	1	1843	1850	-7	2052	2050	2	AA	2019	N594AA	LGA	STL	169	888	18	50	2013-01-01 23:00:00+00
2013	1	1	1843	1845	-2	1955	2024	-29	DL	904	N344NB	JFK	BOS	34	187	18	45	2013-01-01 23:00:00+00
2013	1	1	1843	1835	8	2339	2346	-7	DL	329	N900PC	JFK	SJU	192	1598	18	35	2013-01-01 23:00:00+00
2013	1	1	1846	1745	61	2147	2055	52	AA	785	N3ESAA	LGA	DFW	223	1389	17	45	2013-01-01 22:00:00+00
2013	1	1	1846	1855	-9	2336	2355	-19	AA	1613	N5BYAA	JFK	SJU	190	1598	18	55	2013-01-01 23:00:00+00
2013	1	1	1848	1745	63	2238	2120	78	AA	177	N332AA	JFK	SFO	361	2586	17	45	2013-01-01 22:00:00+00
2013	1	1	1849	1900	-11	2131	2129	2	FL	645	N920AT	LGA	ATL	134	762	19	0	2013-01-02 00:00:00+00
2013	1	1	1850	1900	-10	2007	2016	-9	EV	5714	N835AS	JFK	IAD	55	228	19	0	2013-01-02 00:00:00+00
2013	1	1	1850	1850	0	2142	2141	1	9E	3364	N908XJ	JFK	MSY	207	1182	18	50	2013-01-01 23:00:00+00
2013	1	1	1850	1850	0	2249	2240	9	VX	29	N638VA	JFK	SFO	364	2586	18	50	2013-01-01 23:00:00+00
2013	1	1	1853	1900	-7	2004	2018	-14	US	2187	N951UW	LGA	DCA	54	214	19	0	2013-01-02 00:00:00+00
2013	1	1	1854	1830	24	2055	2015	40	MQ	4674	N518MQ	LGA	CLE	87	419	18	30	2013-01-01 23:00:00+00
2013	1	1	1855	1859	-4	2140	2145	-5	DL	947	N339NW	LGA	ATL	135	762	18	59	2013-01-01 23:00:00+00
2013	1	1	1855	1848	7	2203	2200	3	UA	1128	N36207	LGA	IAH	231	1416	18	48	2013-01-01 23:00:00+00
2013	1	1	1856	1645	131	2212	2005	127	AA	181	N323AA	JFK	LAX	336	2475	16	45	2013-01-01 21:00:00+00
2013	1	1	1856	1859	-3	2133	2155	-22	B6	155	N505JB	JFK	MCO	133	944	18	59	2013-01-01 23:00:00+00
2013	1	1	1856	1855	1	2142	2142	0	DL	951	N173DZ	JFK	ATL	132	760	18	55	2013-01-01 23:00:00+00
2013	1	1	1858	1900	-2	2034	2035	-1	WN	2944	N905WN	LGA	MKE	131	738	19	0	2013-01-02 00:00:00+00
2013	1	1	1859	1900	-1	2012	2021	-9	EV	4131	N11544	EWR	RIC	55	277	19	0	2013-01-02 00:00:00+00
2013	1	1	1859	1900	-1	2151	2238	-47	DL	1967	N329NW	JFK	MIA	150	1089	19	0	2013-01-02 00:00:00+00
2013	1	1	1900	1845	15	2212	2227	-15	B6	91	N523JB	JFK	OAK	330	2576	18	45	2013-01-01 23:00:00+00
2013	1	1	1904	1905	-1	2139	2227	-48	DL	2159	N3758Y	JFK	MCO	133	944	19	5	2013-01-02 00:00:00+00
2013	1	1	1904	1905	-1	2157	2208	-11	UA	1444	N14242	EWR	TPA	150	997	19	5	2013-01-02 00:00:00+00
2013	1	1	1905	1900	5	2311	2301	10	DL	853	N727TW	JFK	SFO	361	2586	19	0	2013-01-02 00:00:00+00
2013	1	1	1906	1915	-9	2211	2244	-33	DL	2391	N922DL	JFK	TPA	159	1005	19	15	2013-01-02 00:00:00+00
2013	1	1	1909	1912	-3	2239	2237	2	B6	87	N559JB	JFK	SLC	291	1990	19	12	2013-01-02 00:00:00+00
2013	1	1	1909	1910	-1	2212	2224	-12	DL	1629	N6710E	JFK	LAS	323	2248	19	10	2013-01-02 00:00:00+00
2013	1	1	1910	1909	1	2126	2046	40	EV	3807	N13978	EWR	BNA	159	748	19	9	2013-01-02 00:00:00+00
2013	1	1	1910	1910	0	2126	2107	19	9E	3359	N925XJ	JFK	ORD	141	740	19	10	2013-01-02 00:00:00+00
2013	1	1	1910	1855	15	2118	2103	15	US	1491	N540UW	LGA	CLT	107	544	18	55	2013-01-01 23:00:00+00
2013	1	1	1911	1910	1	2050	2055	-5	MQ	4569	N737MQ	LGA	RDU	81	431	19	10	2013-01-02 00:00:00+00
2013	1	1	1912	1915	-3	2200	2219	-19	DL	1485	N917DL	LGA	MCO	142	950	19	15	2013-01-02 00:00:00+00
2013	1	1	1912	1908	4	2242	2257	-15	UA	927	N432UA	EWR	PHX	309	2133	19	8	2013-01-02 00:00:00+00
2013	1	1	1915	1920	-5	2238	2257	-19	DL	6	N633DL	JFK	SLC	281	1990	19	20	2013-01-02 00:00:00+00
2013	1	1	1915	1904	11	2242	2246	-4	UA	1606	N76503	EWR	SFO	351	2565	19	4	2013-01-02 00:00:00+00
2013	1	1	1916	1920	-4	2053	2100	-7	AA	359	N3CUAA	LGA	ORD	136	733	19	20	2013-01-02 00:00:00+00
2013	1	1	1919	1900	19	2125	2107	18	EV	3267	N14558	EWR	CLT	105	529	19	0	2013-01-02 00:00:00+00
2013	1	1	1921	1920	1	2315	2319	-4	DL	541	N375DA	JFK	PHX	314	2153	19	20	2013-01-02 00:00:00+00
2013	1	1	1923	1837	46	2139	2045	54	EV	4125	N23139	EWR	GRR	116	605	18	37	2013-01-01 23:00:00+00
2013	1	1	1923	1859	24	2239	2234	5	B6	171	N552JB	JFK	SMF	333	2521	18	59	2013-01-01 23:00:00+00
2013	1	1	1925	1930	-5	2037	2050	-13	EV	5742	N833AS	LGA	IAD	52	229	19	30	2013-01-02 00:00:00+00
2013	1	1	1925	1900	25	2259	2238	21	DL	87	N624AG	JFK	LAX	332	2475	19	0	2013-01-02 00:00:00+00
2013	1	1	1926	1910	16	2258	2215	43	AA	2075	N4XFAA	EWR	DFW	248	1372	19	10	2013-01-02 00:00:00+00
2013	1	1	1928	1930	-2	2117	2135	-18	9E	4261	N8611A	JFK	RDU	75	427	19	30	2013-01-02 00:00:00+00
2013	1	1	1929	1920	9	3	7	-4	UA	1071	N27205	EWR	BQN	192	1585	19	20	2013-01-02 00:00:00+00
2013	1	1	1930	1745	105	2233	2112	81	DL	503	N3764D	JFK	SAN	333	2446	17	45	2013-01-01 22:00:00+00
2013	1	1	1934	1725	129	2126	1855	151	MQ	4255	N909MQ	JFK	BNA	154	765	17	25	2013-01-01 22:00:00+00
2013	1	1	1935	1930	5	2223	2143	40	EV	4085	N12157	EWR	OMA	209	1134	19	30	2013-01-02 00:00:00+00
2013	1	1	1937	1905	32	2250	2225	25	AA	21	N327AA	JFK	LAX	332	2475	19	5	2013-01-02 00:00:00+00
2013	1	1	1938	1703	155	2109	1823	166	EV	4300	N18557	EWR	RIC	68	277	17	3	2013-01-01 22:00:00+00
2013	1	1	1939	1840	59	29	2151	\N	9E	3325	N905XJ	JFK	DFW	\N	1391	18	40	2013-01-01 23:00:00+00
2013	1	1	1939	1940	-1	2238	2240	-2	AA	1787	N3EGAA	JFK	TPA	158	1005	19	40	2013-01-02 00:00:00+00
2013	1	1	1940	1905	35	2033	2021	12	UA	698	N580UA	EWR	BOS	36	200	19	5	2013-01-02 00:00:00+00
2013	1	1	1941	1940	1	2231	2241	-10	B6	381	N632JB	LGA	FLL	152	1076	19	40	2013-01-02 00:00:00+00
2013	1	1	1942	1705	157	2124	1830	174	MQ	4410	N835MQ	JFK	DCA	60	213	17	5	2013-01-01 22:00:00+00
2013	1	1	1945	1940	5	2247	2231	16	9E	3361	N913XJ	JFK	JAX	129	828	19	40	2013-01-02 00:00:00+00
2013	1	1	1946	1930	16	2148	2134	14	EV	4532	N34110	EWR	CHS	106	628	19	30	2013-01-02 00:00:00+00
2013	1	1	1949	1859	50	2237	2153	44	B6	711	N640JB	JFK	LAS	309	2248	18	59	2013-01-01 23:00:00+00
2013	1	1	1952	1930	22	2358	2207	\N	EV	4333	N11194	EWR	TUL	\N	1215	19	30	2013-01-02 00:00:00+00
2013	1	1	1952	2000	-8	2314	2325	-11	VX	415	N640VA	JFK	LAX	349	2475	20	0	2013-01-02 01:00:00+00
2013	1	1	1952	1930	22	2257	2251	6	UA	1416	N76523	EWR	SEA	342	2402	19	30	2013-01-02 00:00:00+00
2013	1	1	1955	2000	-5	2145	2151	-6	9E	3409	N920XJ	JFK	PIT	76	340	20	0	2013-01-02 01:00:00+00
2013	1	1	1957	2005	-8	2100	2126	-26	9E	4091	N8598B	JFK	BWI	41	184	20	5	2013-01-02 01:00:00+00
2013	1	1	1957	1945	12	2307	2329	-22	B6	645	N652JB	JFK	SFO	337	2586	19	45	2013-01-02 00:00:00+00
2013	1	1	1957	2000	-3	2321	2310	11	UA	299	N817UA	EWR	DFW	233	1372	20	0	2013-01-02 01:00:00+00
2013	1	1	1959	1930	29	2331	2306	25	DL	1181	N319NB	JFK	SAT	251	1587	19	30	2013-01-02 00:00:00+00
2013	1	1	1959	2000	-1	2310	2307	3	UA	1233	N76514	EWR	IAH	232	1400	20	0	2013-01-02 01:00:00+00
2013	1	1	2000	1930	30	2255	2140	75	EV	4361	N12567	EWR	TYS	138	631	19	30	2013-01-02 00:00:00+00
2013	1	1	2000	2000	0	2054	2110	-16	9E	3664	N836AY	JFK	PHL	30	94	20	0	2013-01-02 01:00:00+00
2013	1	1	2002	1955	7	2306	2310	-4	AA	1709	N3GSAA	LGA	MIA	159	1096	19	55	2013-01-02 00:00:00+00
2013	1	1	2003	2000	3	2302	2311	-9	UA	1680	N11206	EWR	MIA	154	1085	20	0	2013-01-02 01:00:00+00
2013	1	1	2006	1630	216	2230	1848	222	EV	4644	N14972	EWR	SAV	121	708	16	30	2013-01-01 21:00:00+00
2013	1	1	2006	2000	6	2132	2130	2	UA	1271	N12218	LGA	ORD	126	733	20	0	2013-01-02 01:00:00+00
2013	1	1	2008	1855	73	2223	2100	83	MQ	4649	N527MQ	LGA	MSP	163	1020	18	55	2013-01-01 23:00:00+00
2013	1	1	2008	2015	-7	2206	2210	-4	MQ	4555	N734MQ	LGA	CMH	91	479	20	15	2013-01-02 01:00:00+00
2013	1	1	2009	1808	121	2145	1942	123	EV	4440	N14143	EWR	PIT	65	319	18	8	2013-01-01 23:00:00+00
2013	1	1	2012	2016	-4	2154	2158	-4	UA	1204	N24715	EWR	CLE	77	404	20	16	2013-01-02 01:00:00+00
2013	1	1	2013	2015	-2	2120	2130	-10	AA	1762	N3BNAA	JFK	BOS	35	187	20	15	2013-01-02 01:00:00+00
2013	1	1	2015	2005	10	2149	2144	5	9E	3320	N931XJ	JFK	BUF	62	301	20	5	2013-01-02 01:00:00+00
2013	1	1	2016	1930	46	\N	2220	\N	EV	4204	N14168	EWR	OKC	\N	1325	19	30	2013-01-02 00:00:00+00
2013	1	1	2016	1940	36	2215	2125	50	MQ	3783	N509MQ	JFK	CMH	99	483	19	40	2013-01-02 00:00:00+00
2013	1	1	2017	1935	42	2223	2136	47	9E	3899	N8444F	JFK	CLE	91	425	19	35	2013-01-02 00:00:00+00
2013	1	1	2017	2015	2	2318	2321	-3	B6	47	N593JB	JFK	FLL	149	1069	20	15	2013-01-02 01:00:00+00
2013	1	1	2018	2020	-2	2314	2324	-10	UA	1299	N13718	EWR	RSW	157	1068	20	20	2013-01-02 01:00:00+00
2013	1	1	2020	2030	-10	2148	2155	-7	FL	354	N895AT	LGA	CAK	73	397	20	30	2013-01-02 01:00:00+00
2013	1	1	2021	2025	-4	2351	2341	10	B6	1069	N203JB	JFK	AUS	255	1521	20	25	2013-01-02 01:00:00+00
2013	1	1	2023	1945	38	2240	2206	34	9E	3352	N602LR	JFK	CVG	118	589	19	45	2013-01-02 00:00:00+00
2013	1	1	2024	1835	109	2328	2157	91	B6	359	N607JB	JFK	BUR	328	2465	18	35	2013-01-01 23:00:00+00
2013	1	1	2025	2030	-5	2334	2348	-14	DL	1318	N3740C	JFK	FLL	157	1069	20	30	2013-01-02 01:00:00+00
2013	1	1	2025	2028	-3	2358	2351	7	UA	1615	N76516	EWR	AUS	248	1504	20	28	2013-01-02 01:00:00+00
2013	1	1	2026	2004	22	2157	2133	24	EV	4224	N11189	EWR	MKE	130	725	20	4	2013-01-02 01:00:00+00
2013	1	1	2026	1930	56	2319	2229	50	B6	39	N558JB	JFK	PBI	150	1028	19	30	2013-01-02 00:00:00+00
2013	1	1	2026	1955	31	2205	2120	45	WN	195	N957WN	EWR	MDW	134	711	19	55	2013-01-02 00:00:00+00
2013	1	1	2030	2030	0	2132	2139	-7	EV	4660	N14203	EWR	MHT	33	209	20	30	2013-01-02 01:00:00+00
2013	1	1	2030	2045	-15	2150	2225	-35	AA	371	N545AA	LGA	ORD	126	733	20	45	2013-01-02 01:00:00+00
2013	1	1	2030	2035	-5	2354	2342	12	B6	629	N192JB	JFK	HOU	245	1428	20	35	2013-01-02 01:00:00+00
2013	1	1	2030	2030	0	2308	2258	10	B6	115	N267JB	JFK	MSY	195	1182	20	30	2013-01-02 01:00:00+00
2013	1	1	2031	2030	1	2344	2335	9	UA	834	N822UA	EWR	IAH	223	1400	20	30	2013-01-02 01:00:00+00
2013	1	1	2033	2034	-1	2134	2151	-17	UA	994	N486UA	EWR	BOS	35	200	20	34	2013-01-02 01:00:00+00
2013	1	1	2035	2030	5	2337	5	-28	UA	1482	N38268	EWR	LAX	333	2454	20	30	2013-01-02 01:00:00+00
2013	1	1	2037	2010	27	2224	2150	34	EV	4356	N15572	EWR	RDU	78	416	20	10	2013-01-02 01:00:00+00
2013	1	1	2040	2040	0	2317	2314	3	B6	619	N184JB	JFK	JAX	131	828	20	40	2013-01-02 01:00:00+00
2013	1	1	2046	2035	11	2144	2213	-29	9E	3357	N916XJ	JFK	DCA	43	213	20	35	2013-01-02 01:00:00+00
2013	1	1	2046	2050	-4	2328	2356	-28	UA	926	N414UA	EWR	MCO	136	937	20	50	2013-01-02 01:00:00+00
2013	1	1	2050	1959	51	2229	2144	45	MQ	4423	N853MQ	JFK	RDU	83	427	19	59	2013-01-02 00:00:00+00
2013	1	1	2052	2029	23	2349	2350	-1	B6	165	N536JB	JFK	PDX	331	2454	20	29	2013-01-02 01:00:00+00
2013	1	1	2052	2045	7	2357	2359	-2	B6	147	N535JB	JFK	RSW	163	1074	20	45	2013-01-02 01:00:00+00
2013	1	1	2053	2055	-2	2254	2250	4	MQ	4573	N730MQ	LGA	DTW	102	502	20	55	2013-01-02 01:00:00+00
2013	1	1	2055	2100	-5	2350	2355	-5	UA	380	N441UA	EWR	PBI	142	1023	21	0	2013-01-02 02:00:00+00
2013	1	1	2056	2004	52	2156	2112	44	EV	4170	N12540	EWR	ALB	31	143	20	4	2013-01-02 01:00:00+00
2013	1	1	2056	1944	72	2210	2109	61	EV	4692	N11536	EWR	IAD	51	212	19	44	2013-01-02 00:00:00+00
2013	1	1	2056	2100	-4	2337	2343	-6	B6	399	N510JB	LGA	MCO	140	950	21	0	2013-01-02 02:00:00+00
2013	1	1	2056	2100	-4	2240	2235	5	MQ	4507	N856MQ	LGA	RDU	77	431	21	0	2013-01-02 02:00:00+00
2013	1	1	2057	2100	-3	2237	2220	17	MQ	3744	N521MQ	EWR	ORD	133	719	21	0	2013-01-02 02:00:00+00
2013	1	1	2058	2100	-2	2342	2317	25	EV	4088	N14953	EWR	SDF	136	642	21	0	2013-01-02 02:00:00+00
2013	1	1	2058	2100	-2	2235	2230	5	WN	946	N509SW	LGA	MDW	134	725	21	0	2013-01-02 02:00:00+00
2013	1	1	2058	2100	-2	8	2359	9	UA	1241	N27724	EWR	TPA	159	997	21	0	2013-01-02 02:00:00+00
2013	1	1	2100	2100	0	2307	2250	17	MQ	4584	N0EGMQ	LGA	CLT	101	544	21	0	2013-01-02 02:00:00+00
2013	1	1	2101	2050	11	2156	2202	-6	B6	1020	N587JB	JFK	BOS	34	187	20	50	2013-01-02 01:00:00+00
2013	1	1	2102	2108	-6	146	158	-12	UA	1180	N78511	EWR	SJU	199	1608	21	8	2013-01-02 02:00:00+00
2013	1	1	2103	2110	-7	2345	17	-32	DL	1668	N3738B	JFK	LAS	309	2248	21	10	2013-01-02 02:00:00+00
2013	1	1	2107	2040	27	2354	2359	-5	B6	677	N779JB	JFK	LAX	323	2475	20	40	2013-01-02 01:00:00+00
2013	1	1	2108	2057	11	25	39	-14	UA	1517	N17245	EWR	SFO	354	2565	20	57	2013-01-02 01:00:00+00
2013	1	1	2109	2115	-6	2351	2357	-6	B6	529	N796JB	EWR	MCO	138	937	21	15	2013-01-02 02:00:00+00
2013	1	1	2110	2020	50	2340	2245	55	MQ	4662	N532MQ	LGA	ATL	127	762	20	20	2013-01-02 01:00:00+00
2013	1	1	2115	2110	5	2240	2223	17	EV	4119	N15986	EWR	RIC	65	277	21	10	2013-01-02 02:00:00+00
2013	1	1	2115	1700	255	2330	1920	250	9E	3347	N924XJ	JFK	CVG	115	589	17	0	2013-01-01 22:00:00+00
2013	1	1	2116	2110	6	2202	2212	-10	EV	4404	N15912	EWR	PVD	28	160	21	10	2013-01-02 02:00:00+00
2013	1	1	2119	1930	109	2358	2136	142	EV	4543	N13123	EWR	DSM	200	1017	19	30	2013-01-02 00:00:00+00
2013	1	1	2120	2130	-10	16	18	-2	B6	383	N603JB	LGA	FLL	160	1076	21	30	2013-01-02 02:00:00+00
2013	1	1	2121	2040	41	6	2323	43	B6	227	N307JB	EWR	MCO	143	937	20	40	2013-01-02 01:00:00+00
2013	1	1	2122	2125	-3	2312	2250	22	MQ	4660	N1EAMQ	LGA	BNA	153	764	21	25	2013-01-02 02:00:00+00
2013	1	1	2128	2135	-7	26	50	-24	AA	185	N338AA	JFK	LAX	338	2475	21	35	2013-01-02 02:00:00+00
2013	1	1	2128	2125	3	2243	2240	3	MQ	4449	N810MQ	JFK	DCA	54	213	21	25	2013-01-02 02:00:00+00
2013	1	1	2129	2120	9	2342	2351	-9	B6	97	N625JB	JFK	DEN	223	1626	21	20	2013-01-02 02:00:00+00
2013	1	1	2134	2045	49	20	2352	28	UA	1106	N27733	EWR	FLL	152	1065	20	45	2013-01-02 01:00:00+00
2013	1	1	2136	2145	-9	25	39	-14	B6	515	N198JB	EWR	FLL	154	1065	21	45	2013-01-02 02:00:00+00
2013	1	1	2140	2135	5	210	224	-14	B6	701	N284JB	JFK	SJU	189	1598	21	35	2013-01-02 02:00:00+00
2013	1	1	2157	2155	2	43	41	2	B6	43	N537JB	JFK	MCO	140	944	21	55	2013-01-02 02:00:00+00
2013	1	1	2158	2200	-2	2254	2307	-13	EV	4103	N14998	EWR	BWI	36	169	22	0	2013-01-02 03:00:00+00
2013	1	1	2205	1720	285	46	2040	246	AA	1999	N5DNAA	EWR	MIA	146	1085	17	20	2013-01-01 22:00:00+00
2013	1	1	2209	2145	24	58	37	21	B6	35	N608JB	JFK	PBI	143	1028	21	45	2013-01-02 02:00:00+00
2013	1	1	2209	2155	14	2400	2337	23	B6	1109	N216JB	JFK	RDU	86	427	21	55	2013-01-02 02:00:00+00
2013	1	1	2211	2145	26	2339	2311	28	B6	104	N228JB	JFK	BUF	64	301	21	45	2013-01-02 02:00:00+00
2013	1	1	2217	2229	-12	249	315	-26	B6	713	N547JB	JFK	SJU	191	1598	22	29	2013-01-02 03:00:00+00
2013	1	1	2217	2130	47	140	27	73	B6	21	N516JB	JFK	TPA	163	1005	21	30	2013-01-02 02:00:00+00
2013	1	1	2221	2000	141	2331	2124	127	EV	4462	N13566	EWR	BUF	56	282	20	0	2013-01-02 01:00:00+00
2013	1	1	2224	2200	24	2324	2316	8	EV	4206	N16561	EWR	PWM	47	284	22	0	2013-01-02 03:00:00+00
2013	1	1	2229	2159	30	149	100	49	B6	11	N531JB	JFK	FLL	153	1069	21	59	2013-01-02 02:00:00+00
2013	1	1	2240	2245	-5	2340	2356	-16	B6	608	N279JB	JFK	PWM	44	273	22	45	2013-01-02 03:00:00+00
2013	1	1	2250	2255	-5	2352	2359	-7	B6	1018	N521JB	JFK	BOS	37	187	22	55	2013-01-02 03:00:00+00
2013	1	1	2302	2200	62	2342	2253	49	EV	4276	N13903	EWR	BDL	24	116	22	0	2013-01-02 03:00:00+00
2013	1	1	2306	2245	21	28	5	23	B6	30	N281JB	JFK	ROC	59	264	22	45	2013-01-02 03:00:00+00
2013	1	1	2307	2245	22	32	2357	35	B6	128	N178JB	JFK	BTV	59	266	22	45	2013-01-02 03:00:00+00
2013	1	1	2310	2255	15	24	15	9	B6	112	N646JB	JFK	BUF	57	301	22	55	2013-01-02 03:00:00+00
2013	1	1	2312	2000	192	21	2110	191	EV	4312	N13958	EWR	DCA	44	199	20	0	2013-01-02 01:00:00+00
2013	1	1	2323	2200	83	22	2313	69	EV	4257	N13538	EWR	BTV	44	266	22	0	2013-01-02 03:00:00+00
2013	1	1	2326	2130	116	131	18	73	B6	199	N594JB	JFK	LAS	290	2248	21	30	2013-01-02 02:00:00+00
2013	1	1	2327	2250	37	32	2359	33	B6	22	N639JB	JFK	SYR	45	209	22	50	2013-01-02 03:00:00+00
2013	1	1	2343	1724	379	314	1938	456	EV	4321	N21197	EWR	MCI	222	1092	17	24	2013-01-01 22:00:00+00
2013	1	1	2353	2359	-6	425	445	-20	B6	739	N591JB	JFK	PSE	195	1617	23	59	2013-01-02 04:00:00+00
2013	1	1	2353	2359	-6	418	442	-24	B6	707	N794JB	JFK	SJU	185	1598	23	59	2013-01-02 04:00:00+00
2013	1	1	2356	2359	-3	425	437	-12	B6	727	N588JB	JFK	BQN	186	1576	23	59	2013-01-02 04:00:00+00
2013	1	1	\N	1630	\N	\N	1815	\N	EV	4308	N18120	EWR	RDU	\N	416	16	30	2013-01-01 21:00:00+00
2013	1	1	\N	1935	\N	\N	2240	\N	AA	791	N3EHAA	LGA	DFW	\N	1389	19	35	2013-01-02 00:00:00+00
2013	1	1	\N	1500	\N	\N	1825	\N	AA	1925	N3EVAA	LGA	MIA	\N	1096	15	0	2013-01-01 20:00:00+00
2013	1	1	\N	600	\N	\N	901	\N	B6	125	N618JB	JFK	FLL	\N	1069	6	0	2013-01-01 11:00:00+00
2013	1	2	42	2359	43	518	442	36	B6	707	N580JB	JFK	SJU	189	1598	23	59	2013-01-03 04:00:00+00
2013	1	2	126	2250	156	233	2359	154	B6	22	N636JB	JFK	SYR	49	209	22	50	2013-01-03 03:00:00+00
2013	1	2	458	500	-2	703	650	13	US	1030	N162UW	EWR	CLT	108	529	5	0	2013-01-02 10:00:00+00
2013	1	2	512	515	-3	809	819	-10	UA	1453	N76515	EWR	IAH	214	1400	5	15	2013-01-02 10:00:00+00
2013	1	2	535	540	-5	831	850	-19	AA	1141	N621AA	JFK	MIA	156	1089	5	40	2013-01-02 10:00:00+00
2013	1	2	536	529	7	840	828	12	UA	407	N493UA	LGA	IAH	231	1416	5	29	2013-01-02 10:00:00+00
2013	1	2	539	545	-6	959	1022	-23	B6	725	N624JB	JFK	BQN	184	1576	5	45	2013-01-02 10:00:00+00
2013	1	2	554	600	-6	845	901	-16	B6	125	N637JB	JFK	FLL	156	1069	6	0	2013-01-02 11:00:00+00
2013	1	2	554	600	-6	841	851	-10	B6	49	N658JB	JFK	PBI	146	1028	6	0	2013-01-02 11:00:00+00
2013	1	2	554	600	-6	909	858	11	B6	371	N805JB	LGA	FLL	159	1076	6	0	2013-01-02 11:00:00+00
2013	1	2	555	600	-5	931	910	21	AA	707	N3BEAA	LGA	DFW	255	1389	6	0	2013-01-02 11:00:00+00
2013	1	2	555	600	-5	856	856	0	B6	71	N806JB	JFK	TPA	158	1005	6	0	2013-01-02 11:00:00+00
2013	1	2	555	600	-5	750	757	-7	DL	731	N366NB	LGA	DTW	87	502	6	0	2013-01-02 11:00:00+00
2013	1	2	556	600	-4	724	723	1	EV	5708	N836AS	LGA	IAD	54	229	6	0	2013-01-02 11:00:00+00
2013	1	2	556	600	-4	837	837	0	DL	461	N618DL	LGA	ATL	128	762	6	0	2013-01-02 11:00:00+00
2013	1	2	557	605	-8	832	823	9	DL	544	N325US	LGA	CVG	117	585	6	5	2013-01-02 11:00:00+00
2013	1	2	558	600	-2	838	815	23	FL	345	N896AT	LGA	ATL	129	762	6	0	2013-01-02 11:00:00+00
2013	1	2	558	600	-2	916	931	-15	UA	303	N505UA	JFK	SFO	341	2586	6	0	2013-01-02 11:00:00+00
2013	1	2	559	601	-2	809	901	-52	UA	402	N484UA	EWR	LAS	289	2227	6	1	2013-01-02 11:00:00+00
2013	1	2	559	600	-1	906	907	-1	UA	1077	N12225	EWR	MIA	157	1085	6	0	2013-01-02 11:00:00+00
2013	1	2	600	600	0	814	749	25	EV	4334	N13914	EWR	CMH	98	463	6	0	2013-01-02 11:00:00+00
2013	1	2	600	605	-5	751	818	-27	EV	5147	N760EV	EWR	MSP	155	1008	6	5	2013-01-02 11:00:00+00
2013	1	2	600	600	0	819	815	4	9E	4171	N8946A	EWR	CVG	120	569	6	0	2013-01-02 11:00:00+00
2013	1	2	600	600	0	846	846	0	B6	79	N529JB	JFK	MCO	140	944	6	0	2013-01-02 11:00:00+00
2013	1	2	600	600	0	737	725	12	WN	3136	N8311Q	LGA	MDW	117	725	6	0	2013-01-02 11:00:00+00
2013	1	2	600	605	-5	748	805	-17	MQ	4401	N713MQ	LGA	DTW	82	502	6	5	2013-01-02 11:00:00+00
2013	1	2	600	600	0	747	735	12	UA	1280	N62631	LGA	ORD	125	733	6	0	2013-01-02 11:00:00+00
2013	1	2	602	600	2	646	659	-13	US	1833	N951UW	LGA	PHL	28	96	6	0	2013-01-02 11:00:00+00
2013	1	2	603	600	3	733	745	-12	AA	301	N3CRAA	LGA	ORD	118	733	6	0	2013-01-02 11:00:00+00
2013	1	2	603	559	4	912	916	-4	UA	1676	N17229	EWR	LAX	341	2454	5	59	2013-01-02 10:00:00+00
2013	1	2	605	600	5	851	935	-44	UA	421	N832UA	EWR	SFO	329	2565	6	0	2013-01-02 11:00:00+00
2013	1	2	606	610	-4	846	845	1	DL	1743	N387DA	JFK	ATL	129	760	6	10	2013-01-02 11:00:00+00
2013	1	2	606	610	-4	825	820	5	DL	1919	N915DE	LGA	MSP	167	1020	6	10	2013-01-02 11:00:00+00
2013	1	2	607	610	-3	859	910	-11	AA	1895	N5ELAA	EWR	MIA	151	1085	6	10	2013-01-02 11:00:00+00
2013	1	2	609	600	9	909	854	15	B6	507	N630JB	EWR	FLL	158	1065	6	0	2013-01-02 11:00:00+00
2013	1	2	610	600	10	826	807	19	EV	5310	N740EV	LGA	MEM	172	963	6	0	2013-01-02 11:00:00+00
2013	1	2	610	615	-5	854	844	10	DL	575	N304DQ	EWR	ATL	124	746	6	15	2013-01-02 11:00:00+00
2013	1	2	611	600	11	756	725	31	WN	1563	N235WN	EWR	MDW	139	711	6	0	2013-01-02 11:00:00+00
2013	1	2	612	600	12	901	850	11	B6	343	N579JB	EWR	PBI	146	1023	6	0	2013-01-02 11:00:00+00
2013	1	2	612	615	-3	1053	1100	-7	B6	709	N629JB	JFK	SJU	191	1598	6	15	2013-01-02 11:00:00+00
2013	1	2	616	600	16	1001	917	44	UA	1141	N19141	JFK	LAX	354	2475	6	0	2013-01-02 11:00:00+00
2013	1	2	617	615	2	837	817	20	US	1567	N745VJ	JFK	CLT	106	541	6	15	2013-01-02 11:00:00+00
2013	1	2	621	610	11	912	915	-3	AA	1837	N3EVAA	LGA	MIA	155	1096	6	10	2013-01-02 11:00:00+00
2013	1	2	622	630	-8	820	830	-10	MQ	4599	N6EAMQ	LGA	MSP	159	1020	6	30	2013-01-02 11:00:00+00
2013	1	2	624	600	24	908	825	43	MQ	4650	N513MQ	LGA	ATL	138	762	6	0	2013-01-02 11:00:00+00
2013	1	2	625	630	-5	833	830	3	MQ	4576	N504MQ	LGA	CLT	106	544	6	30	2013-01-02 11:00:00+00
2013	1	2	625	629	-4	935	934	1	UA	473	N461UA	LGA	IAH	230	1416	6	29	2013-01-02 11:00:00+00
2013	1	2	625	630	-5	954	946	8	UA	516	N802UA	EWR	DFW	249	1372	6	30	2013-01-02 11:00:00+00
2013	1	2	626	630	-4	850	833	17	US	1019	N445US	EWR	CLT	103	529	6	30	2013-01-02 11:00:00+00
2013	1	2	628	630	-2	935	932	3	DL	2137	N912DE	LGA	TPA	159	1010	6	30	2013-01-02 11:00:00+00
2013	1	2	628	615	13	730	715	15	WN	3641	N961WN	EWR	BWI	42	169	6	15	2013-01-02 11:00:00+00
2013	1	2	629	615	14	746	735	11	EV	4144	N15574	EWR	IAD	51	212	6	15	2013-01-02 11:00:00+00
2013	1	2	629	620	9	844	827	17	EV	4460	N11565	EWR	CVG	118	569	6	20	2013-01-02 11:00:00+00
2013	1	2	629	630	-1	1010	1014	-4	US	245	N837AW	EWR	PHX	308	2133	6	30	2013-01-02 11:00:00+00
2013	1	2	630	610	20	948	921	27	B6	135	N665JB	JFK	RSW	177	1074	6	10	2013-01-02 11:00:00+00
2013	1	2	630	635	-5	948	942	6	DL	1879	N969DL	LGA	FLL	166	1076	6	35	2013-01-02 11:00:00+00
2013	1	2	630	630	0	727	740	-13	WN	4648	N7735A	LGA	BWI	42	185	6	30	2013-01-02 11:00:00+00
2013	1	2	632	635	-3	812	812	0	EV	4150	N16987	EWR	RDU	82	416	6	35	2013-01-02 11:00:00+00
2013	1	2	632	630	2	941	940	1	UA	387	N521UA	EWR	LAX	325	2454	6	30	2013-01-02 11:00:00+00
2013	1	2	634	630	4	806	810	-4	AA	303	N3DYAA	LGA	ORD	123	733	6	30	2013-01-02 11:00:00+00
2013	1	2	636	637	-1	1012	955	17	UA	1276	N38727	EWR	AUS	248	1504	6	37	2013-01-02 11:00:00+00
2013	1	2	636	631	5	1005	1014	-9	UA	908	N406UA	EWR	PHX	299	2133	6	31	2013-01-02 11:00:00+00
2013	1	2	637	640	-3	832	809	23	EV	3829	N17108	EWR	BNA	138	748	6	40	2013-01-02 11:00:00+00
2013	1	2	637	630	7	1012	1018	-6	US	27	N545UW	JFK	PHX	312	2153	6	30	2013-01-02 11:00:00+00
2013	1	2	637	631	6	821	815	6	UA	1162	N39297	EWR	CLE	79	404	6	31	2013-01-02 11:00:00+00
2013	1	2	640	640	0	732	749	-17	B6	1002	N807JB	JFK	BOS	34	187	6	40	2013-01-02 11:00:00+00
2013	1	2	640	646	-6	926	941	-15	UA	1627	N37267	EWR	PBI	145	1023	6	46	2013-01-02 11:00:00+00
2013	1	2	641	635	6	926	917	9	EV	3831	N12996	EWR	ATL	138	746	6	35	2013-01-02 11:00:00+00
2013	1	2	641	635	6	1013	940	33	AA	711	N3CFAA	LGA	DFW	249	1389	6	35	2013-01-02 11:00:00+00
2013	1	2	641	647	-6	804	810	-6	B6	102	N766JB	JFK	BUF	60	301	6	47	2013-01-02 11:00:00+00
2013	1	2	641	645	-4	930	935	-5	B6	389	N563JB	LGA	MCO	142	950	6	45	2013-01-02 11:00:00+00
2013	1	2	642	630	12	854	841	13	US	1433	N538UW	LGA	CLT	109	544	6	30	2013-01-02 11:00:00+00
2013	1	2	647	645	2	849	916	-27	UA	320	N587UA	LGA	DEN	218	1620	6	45	2013-01-02 11:00:00+00
2013	1	2	647	646	1	738	809	-31	UA	785	N821UA	EWR	BOS	34	200	6	46	2013-01-02 11:00:00+00
2013	1	2	647	645	2	903	848	15	US	926	N565UW	EWR	CLT	102	529	6	45	2013-01-02 11:00:00+00
2013	1	2	649	655	-6	951	1030	-39	DL	1415	N374DA	JFK	SLC	274	1990	6	55	2013-01-02 11:00:00+00
2013	1	2	649	651	-2	934	946	-12	UA	392	N464UA	EWR	MCO	141	937	6	51	2013-01-02 11:00:00+00
2013	1	2	654	700	-6	946	1045	-59	DL	1865	N711ZX	JFK	SFO	323	2586	7	0	2013-01-02 12:00:00+00
2013	1	2	654	651	3	1003	955	8	UA	1701	N78285	EWR	FLL	168	1065	6	51	2013-01-02 11:00:00+00
2013	1	2	655	659	-4	955	959	-4	AA	1815	N5EUAA	JFK	MCO	144	944	6	59	2013-01-02 11:00:00+00
2013	1	2	655	655	0	929	942	-13	B6	203	N651JB	JFK	LAS	297	2248	6	55	2013-01-02 11:00:00+00
2013	1	2	655	700	-5	1031	1034	-3	DL	763	N705TW	JFK	LAX	317	2475	7	0	2013-01-02 12:00:00+00
2013	1	2	655	700	-5	1005	1009	-4	DL	1383	N378NW	LGA	PBI	162	1035	7	0	2013-01-02 12:00:00+00
2013	1	2	655	700	-5	1015	1020	-5	DL	2003	N926DL	LGA	MIA	161	1096	7	0	2013-01-02 12:00:00+00
2013	1	2	656	700	-4	1013	1007	6	B6	981	N656JB	JFK	FLL	162	1069	7	0	2013-01-02 12:00:00+00
2013	1	2	656	705	-9	1014	940	34	MQ	4534	N719MQ	LGA	XNA	233	1147	7	5	2013-01-02 12:00:00+00
2013	1	2	657	700	-3	806	809	-3	US	2163	N945UW	LGA	DCA	46	214	7	0	2013-01-02 12:00:00+00
2013	1	2	659	700	-1	959	1025	-26	VX	399	N626VA	JFK	LAX	330	2475	7	0	2013-01-02 12:00:00+00
2013	1	2	700	630	30	917	840	37	EV	4471	N17984	EWR	CLT	102	529	6	30	2013-01-02 11:00:00+00
2013	1	2	700	700	0	851	850	1	AA	305	N436AA	LGA	ORD	122	733	7	0	2013-01-02 12:00:00+00
2013	1	2	700	700	0	1017	1015	2	AA	2279	N3JJAA	LGA	MIA	163	1096	7	0	2013-01-02 12:00:00+00
2013	1	2	701	705	-4	1001	943	18	DL	1445	N339NB	LGA	MSY	193	1183	7	5	2013-01-02 12:00:00+00
2013	1	2	702	700	2	1054	1008	46	UA	756	N574UA	EWR	TPA	164	997	7	0	2013-01-02 12:00:00+00
2013	1	2	704	655	9	947	921	26	B6	117	N236JB	JFK	MSY	192	1182	6	55	2013-01-02 11:00:00+00
2013	1	2	704	705	-1	908	913	-5	DL	831	N974DL	LGA	DTW	90	502	7	5	2013-01-02 12:00:00+00
2013	1	2	704	700	4	1142	1154	-12	UA	1152	N37456	EWR	SJU	194	1608	7	0	2013-01-02 12:00:00+00
2013	1	2	705	630	35	1209	1140	29	AA	413	N3GEAA	JFK	SJU	197	1598	6	30	2013-01-02 11:00:00+00
2013	1	2	705	710	-5	827	850	-23	MQ	3737	N512MQ	EWR	ORD	115	719	7	10	2013-01-02 12:00:00+00
2013	1	2	707	715	-8	1022	1045	-23	AA	443	N3HYAA	JFK	MIA	160	1089	7	15	2013-01-02 12:00:00+00
2013	1	2	709	700	9	1006	1014	-8	B6	671	N583JB	JFK	LAX	327	2475	7	0	2013-01-02 12:00:00+00
2013	1	2	712	700	12	945	941	4	DL	1547	N541US	LGA	ATL	125	762	7	0	2013-01-02 12:00:00+00
2013	1	2	712	700	12	844	832	12	UA	1223	N76254	LGA	ORD	127	733	7	0	2013-01-02 12:00:00+00
2013	1	2	714	715	-1	1026	1035	-9	AA	825	N3BAAA	JFK	FLL	161	1069	7	15	2013-01-02 12:00:00+00
2013	1	2	715	721	-6	1013	1012	1	B6	987	N625JB	JFK	MCO	144	944	7	21	2013-01-02 12:00:00+00
2013	1	2	715	715	0	1047	1112	-25	UA	223	N517UA	JFK	SFO	341	2586	7	15	2013-01-02 12:00:00+00
2013	1	2	719	720	-1	1027	1029	-2	UA	1526	N33284	EWR	RSW	168	1068	7	20	2013-01-02 12:00:00+00
2013	1	2	720	600	80	905	735	90	MQ	3768	N520MQ	EWR	ORD	112	719	6	0	2013-01-02 11:00:00+00
2013	1	2	722	725	-3	949	1030	-41	AS	11	N592AS	EWR	SEA	314	2402	7	25	2013-01-02 12:00:00+00
2013	1	2	723	713	10	846	849	-3	UA	393	N529UA	EWR	ORD	114	719	7	13	2013-01-02 12:00:00+00
2013	1	2	724	730	-6	1039	1115	-36	VX	11	N847VA	JFK	SFO	344	2586	7	30	2013-01-02 12:00:00+00
2013	1	2	727	645	42	1024	1028	-4	UA	277	N820UA	EWR	SNA	338	2434	6	45	2013-01-02 11:00:00+00
2013	1	2	728	730	-2	1001	952	9	UA	311	N413UA	EWR	DEN	251	1605	7	30	2013-01-02 12:00:00+00
2013	1	2	729	720	9	846	840	6	FL	850	N982AT	LGA	MKE	113	738	7	20	2013-01-02 12:00:00+00
2013	1	2	729	729	0	1047	1039	8	B6	1601	N645JB	LGA	RSW	168	1080	7	29	2013-01-02 12:00:00+00
2013	1	2	729	730	-1	1011	1056	-45	DL	495	N3768	JFK	SEA	309	2422	7	30	2013-01-02 12:00:00+00
2013	1	2	730	715	15	1206	1206	0	B6	715	N559JB	JFK	SJU	187	1598	7	15	2013-01-02 12:00:00+00
2013	1	2	732	730	2	1105	1100	5	AA	33	N322AA	JFK	LAX	351	2475	7	30	2013-01-02 12:00:00+00
2013	1	2	732	736	-4	914	850	24	B6	44	N506JB	JFK	SYR	50	209	7	36	2013-01-02 12:00:00+00
2013	1	2	732	732	0	1047	1040	7	UA	1509	N73291	LGA	IAH	230	1416	7	32	2013-01-02 12:00:00+00
2013	1	2	733	735	-2	902	858	4	B6	20	N337JB	JFK	ROC	57	264	7	35	2013-01-02 12:00:00+00
2013	1	2	733	737	-4	1043	1113	-30	B6	643	N804JB	JFK	SFO	335	2586	7	37	2013-01-02 12:00:00+00
2013	1	2	734	700	34	1045	1025	20	WN	20	N485WN	EWR	HOU	235	1411	7	0	2013-01-02 12:00:00+00
2013	1	2	734	732	2	844	853	-9	UA	1199	N37408	EWR	BOS	34	200	7	32	2013-01-02 12:00:00+00
2013	1	2	737	745	-8	1042	1036	6	B6	983	N504JB	LGA	TPA	162	1010	7	45	2013-01-02 12:00:00+00
2013	1	2	738	745	-7	926	930	-4	AA	309	N528AA	LGA	ORD	121	733	7	45	2013-01-02 12:00:00+00
2013	1	2	739	745	-6	1116	1125	-9	AA	59	N325AA	JFK	SFO	353	2586	7	45	2013-01-02 12:00:00+00
2013	1	2	739	735	4	1033	1031	2	UA	1296	N19117	EWR	MCO	144	937	7	35	2013-01-02 12:00:00+00
2013	1	2	740	740	0	1025	1015	10	WN	1581	N468WN	LGA	DEN	263	1620	7	40	2013-01-02 12:00:00+00
2013	1	2	741	743	-2	932	920	12	EV	4348	N14542	EWR	GSO	94	445	7	43	2013-01-02 12:00:00+00
2013	1	2	741	740	1	1005	1019	-14	UA	328	N533UA	LGA	DEN	220	1620	7	40	2013-01-02 12:00:00+00
2013	1	2	743	745	-2	858	857	1	9E	3373	N902XJ	JFK	PHL	30	94	7	45	2013-01-02 12:00:00+00
2013	1	2	744	730	14	1017	1007	10	DL	807	N989DL	EWR	ATL	128	746	7	30	2013-01-02 12:00:00+00
2013	1	2	745	730	15	1112	1040	32	AA	715	N455AA	LGA	DFW	244	1389	7	30	2013-01-02 12:00:00+00
2013	1	2	745	746	-1	1118	1129	-11	UA	1668	N37287	EWR	SFO	350	2565	7	46	2013-01-02 12:00:00+00
2013	1	2	747	749	-2	1051	1054	-3	B6	341	N508JB	JFK	SRQ	167	1041	7	49	2013-01-02 12:00:00+00
2013	1	2	750	725	25	1048	1020	28	UA	1724	N79521	EWR	PBI	151	1023	7	25	2013-01-02 12:00:00+00
2013	1	2	751	800	-9	942	945	-3	9E	3643	N8869B	JFK	PIT	68	340	8	0	2013-01-02 13:00:00+00
2013	1	2	752	800	-8	956	959	-3	EV	4166	N11536	EWR	GSP	109	594	8	0	2013-01-02 13:00:00+00
2013	1	2	752	800	-8	912	918	-6	EV	4233	N21130	EWR	BTV	49	266	8	0	2013-01-02 13:00:00+00
2013	1	2	752	745	7	1055	1042	13	UA	251	N430UA	EWR	IAH	215	1400	7	45	2013-01-02 12:00:00+00
2013	1	2	754	635	79	900	745	75	EV	4241	N22909	EWR	DCA	46	199	6	35	2013-01-02 11:00:00+00
2013	1	2	754	755	-1	1055	1059	-4	DL	2263	N361NW	LGA	MCO	143	950	7	55	2013-01-02 12:00:00+00
2013	1	2	755	800	-5	1100	1054	6	B6	517	N703JB	EWR	MCO	146	937	8	0	2013-01-02 13:00:00+00
2013	1	2	755	800	-5	1048	1106	-18	B6	3	N509JB	JFK	FLL	155	1069	8	0	2013-01-02 13:00:00+00
2013	1	2	755	759	-4	1037	1039	-2	DL	2047	N660DL	LGA	ATL	123	762	7	59	2013-01-02 12:00:00+00
2013	1	2	757	800	-3	1058	1127	-29	DL	1843	N918DL	JFK	MIA	155	1089	8	0	2013-01-02 13:00:00+00
2013	1	2	757	759	-2	1018	959	19	US	1733	N537UW	LGA	CLT	106	544	7	59	2013-01-02 12:00:00+00
2013	1	2	758	755	3	1052	1110	-18	AA	2267	N3CNAA	LGA	MIA	160	1096	7	55	2013-01-02 12:00:00+00
2013	1	2	759	805	-6	901	919	-18	B6	1172	N309JB	EWR	BOS	38	200	8	5	2013-01-02 13:00:00+00
2013	1	2	800	810	-10	1102	1116	-14	DL	1959	N995DL	JFK	MCO	143	944	8	10	2013-01-02 13:00:00+00
2013	1	2	801	730	31	1136	1040	56	AA	2083	N487AA	EWR	DFW	241	1372	7	30	2013-01-02 12:00:00+00
2013	1	2	801	810	-9	951	955	-4	MQ	4406	N837MQ	JFK	RDU	86	427	8	10	2013-01-02 13:00:00+00
2013	1	2	804	805	-1	1039	1110	-31	UA	423	N528UA	EWR	PDX	310	2434	8	5	2013-01-02 13:00:00+00
2013	1	2	806	810	-4	1300	1315	-15	AA	655	N5FTAA	JFK	STT	193	1623	8	10	2013-01-02 13:00:00+00
2013	1	2	807	810	-3	1133	1129	4	DL	1271	N322US	JFK	FLL	170	1069	8	10	2013-01-02 13:00:00+00
2013	1	2	808	810	-2	1049	1045	4	DL	269	N971DL	JFK	ATL	124	760	8	10	2013-01-02 13:00:00+00
2013	1	2	808	815	-7	1020	1016	4	US	675	N656AW	EWR	CLT	107	529	8	15	2013-01-02 13:00:00+00
2013	1	2	809	810	-1	950	948	2	B6	1051	N304JB	JFK	PIT	71	340	8	10	2013-01-02 13:00:00+00
\.


--
-- Data for Name: planes; Type: TABLE DATA; Schema: rpostgres; Owner: travis
--

COPY rpostgres.planes (tailnum, year, type, manufacturer, model, engines, seats, speed, engine) FROM stdin;
N10156	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N102UW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N103US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N104UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N10575	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N105UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N107US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N108UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N109UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N110UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N11106	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11107	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11109	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11113	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11119	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11121	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11127	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11137	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11140	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11150	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11155	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11164	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11165	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11176	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11181	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11184	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11187	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11189	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11191	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11192	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11193	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11194	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11199	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N111US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N11206	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N112US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N113UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N114UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N11535	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11536	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11539	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11544	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11547	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11548	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11551	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11565	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N117UW	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N118US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N119US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N1200K	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1201P	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N12109	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12114	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12116	1996	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12122	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12125	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12126	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12135	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12136	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12142	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12145	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12157	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12160	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12163	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12166	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12167	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12172	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12175	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12195	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N121DE	1987	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N121UW	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N12201	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12216	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12218	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12221	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12225	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12238	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N122US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N123UW	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N124US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N12540	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12552	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12563	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12564	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12567	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12569	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N125UW	2009	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N126UW	2009	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N127UW	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N128UW	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N12900	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12921	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12922	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12924	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12957	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12967	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12996	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13110	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N13113	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N13118	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13123	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13124	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13132	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13133	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13138	1999	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N13161	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N131EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13202	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13248	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N132EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N133EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N134EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13538	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13550	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13553	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13566	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N135EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N136DL	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N136EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13716	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N13718	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N13750	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N137DL	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N137EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N138EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13903	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13908	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13913	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13914	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13949	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13955	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13956	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13958	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13964	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13965	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13968	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13969	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13970	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13975	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13978	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13979	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13988	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13989	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13992	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13994	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13995	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13997	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14102	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14105	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14106	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14107	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14115	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14116	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14117	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14118	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14120	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14121	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14125	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14143	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14148	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14153	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14158	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14162	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14168	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14171	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14173	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14174	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14177	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14179	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14180	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14186	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14188	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14198	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14203	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14204	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14214	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14219	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14228	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14230	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14231	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14237	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14242	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14250	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N143DA	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N14542	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14543	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14558	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14562	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14568	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14570	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14573	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14629	1965	Fixed wing multi engine	BOEING	737-524	2	149	\N	Turbo-fan
N146PQ	2007	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N14704	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N14731	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N147PQ	2007	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N14902	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14904	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14905	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14907	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14916	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14920	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14923	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14950	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14952	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14953	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14959	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14960	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14972	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14974	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14977	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14991	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14993	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14998	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N1501P	1990	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N150UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N151UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N152DL	1990	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N152UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N153DL	1990	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N153PQ	2007	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N153UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N154DL	1991	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N154UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N15555	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15572	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15574	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N155DL	1991	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N155UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N156DL	1991	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N156UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N15710	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N15712	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N157UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N15910	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15912	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15973	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15980	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15983	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15985	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15986	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N1602	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1603	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1604R	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1605	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N16065	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1607B	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1608	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1609	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1610D	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N16112	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N1611B	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1612T	2001	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1613B	2001	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N16147	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16149	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16151	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16170	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16178	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16183	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N161PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N161UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N16217	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N16234	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N162PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N162UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N163US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N16541	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16546	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16559	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16561	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16571	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N165US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N166PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N16701	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16703	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16709	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16713	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16732	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N167US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N168AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N16911	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16918	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16919	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16951	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16954	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16961	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16963	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16976	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16981	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16987	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16999	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N169AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N169DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N169UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N170PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N170US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17104	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17105	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17108	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17115	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17122	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17126	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17128	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17133	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17138	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17139	2000	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17146	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17159	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17169	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17185	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17196	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N171DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N171DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N171US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17229	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N17233	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N17244	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N17245	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N172DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N172DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N172US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N173AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N173DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N173US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N174AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N174DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N174DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N174US	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17560	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N175AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N175DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N175DZ	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N176AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N176DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N176DZ	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N176PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N176UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17719	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N17730	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N177DN	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N177DZ	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N177US	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N178DN	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N178DZ	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N178JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N178US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17984	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N179DN	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N179JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N179UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N180DN	1992	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N180US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N18101	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N18102	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N18112	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N18114	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N18119	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N18120	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N181DN	1992	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N181PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N181UW	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N18220	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N18223	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N18243	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N182DN	1992	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N182UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N183DN	1993	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N183JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N183UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N184AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N184DN	1993	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N184JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N184US	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N18556	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N18557	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N185DN	1995	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N185UW	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N186DN	1995	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N186PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N186US	2002	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N187DN	1996	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N187JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N187PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N187US	2002	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N188DN	1996	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N188US	2002	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N189DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N189UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N190DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N190JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N190UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N19117	1996	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N19130	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N19136	1999	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N19141	2000	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N191DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N191UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N192DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N192JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N192UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N193DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N193JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N193UW	2008	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N194DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N194UW	\N	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N19554	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N195DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N195PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N195UW	2008	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N196DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N196UW	2009	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N197DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N197JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N197PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N197UW	2009	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N198DN	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N198JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N198UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N19966	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N199DN	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N199UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N200PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N200WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N201AA	1959	Fixed wing single engine	CESSNA	150	1	2	90	Reciprocating
N201FR	2008	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N201LV	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N202AA	1980	Fixed wing multi engine	CESSNA	421C	2	8	90	Reciprocating
N202FR	2008	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N202WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N203FR	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N203JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N203WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N204FR	2004	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N204WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N205FR	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N205WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N206FR	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N206JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N206UA	1999	Fixed wing multi engine	BOEING	777-222	2	400	\N	Turbo-fan
N206WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N207FR	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N207WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N208FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N208WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N20904	2012	Fixed wing multi engine	BOEING	787-8	2	260	\N	Turbo-fan
N209FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N209WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N210FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N210WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N21108	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N21129	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21130	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21144	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21154	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21197	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N211FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N211WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N212WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N213FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N213WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N214FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N214WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N21537	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N215WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N216FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N216JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N216WR	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N21723	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N217JC	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N218FR	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N218WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N219WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N220WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N221FR	2007	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N221WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N222WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N223WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N224WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N225WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N226WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N227WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N228JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N228PQ	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N228UA	2002	Fixed wing multi engine	BOEING	777-222	2	400	\N	Turbo-fan
N228WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N22909	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N22971	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N229JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N229WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N230WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N23139	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N231JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N231WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N232PQ	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N232WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N233LV	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N234WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N235WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N236JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N236WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N23707	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N23708	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N23721	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N237WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N238JB	\N	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N238WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N239JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N239WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N240AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N240WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N24103	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N24128	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N241WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N24202	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N24211	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N24212	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N24224	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N242WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N243WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N244WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N245AY	1987	Fixed wing multi engine	BOEING	767-201	2	255	\N	Turbo-jet
N245WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N246LV	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N24702	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N24706	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N24715	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N24729	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N247JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N247WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N248WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N249JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N249WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N250WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N25134	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N251WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N252WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N253WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N254WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N255WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N256WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N25705	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N257WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N258JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N258WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N259WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N260WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26123	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N26141	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N261AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N261WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26208	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N26210	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N26215	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N26226	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N262WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N263WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N264LV	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26545	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N26549	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N265JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N265WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N266JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N266WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N267JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N267WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N268WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26906	2012	Fixed wing multi engine	BOEING	787-8	2	260	\N	Turbo-fan
N269WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N270WN	1998	Fixed wing multi engine	BOEING	737-705	2	149	\N	Turbo-fan
N27152	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N27190	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N271LV	\N	Fixed wing multi engine	BOEING	737-705	2	149	\N	Turbo-fan
N27200	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N27205	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N27213	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N27239	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N272AT	\N	Fixed wing multi engine	BOEING	777-200	2	400	\N	Turbo-jet
N272PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N272WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N273AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N273JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N273WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N27421	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N27477	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N274JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N274WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N275WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N276AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N276WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N27722	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N27724	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N27733	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N277WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N278AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N278WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N27901	2012	Fixed wing multi engine	BOEING	787-8	2	260	\N	Turbo-fan
N27962	1999	Fixed wing multi engine	EMBRAER	EMB-145	2	55	\N	Turbo-jet
N279AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N279JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N279PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N279WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N280WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N281AT	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A340-313	4	375	\N	Turbo-jet
N281JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N281WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N282WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N283JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N283WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N28457	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N28478	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N284AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N284JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N284WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N285AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N285WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N286WN	2004	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N287AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N287WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N288WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N289AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N289CT	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N290WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N29124	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N29129	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N291AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N291WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N292JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N292PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N292WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N293PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N293WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N294JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N294PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N294WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N295AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N295PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N295WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N296JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N296PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N296WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N29717	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N297PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N297WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N298JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N298PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N298WN	\N	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N29906	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N29917	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N299AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N299PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N299WN	\N	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N301DQ	\N	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N301NB	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N302AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N302DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N302NB	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N303AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N303DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N30401	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N304DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N304JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N305AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N305DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N306AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N306DQ	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N306JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N307AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N307DQ	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N307JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N308DE	\N	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N309AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N309AT	2006	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N309DE	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N309JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N309US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N310DE	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N310NW	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N31131	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N311US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N312US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N313US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N31412	2002	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N314NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N314US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N315AS	2002	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N315AT	\N	Fixed wing single engine	JOHN G HESS	AT-5	1	2	\N	4 Cycle
N315NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N315US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N316JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N316NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N316US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N317JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N317NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N317US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N317WN	1988	Fixed wing multi engine	BOEING	737-3Q8	2	149	\N	Turbo-fan
N318AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N318JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N318NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N318US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N319AA	1985	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N319AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N319NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N319US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N320AA	1985	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N320AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N320NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N320US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N321NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N321US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N322NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N322US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N323AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N323AS	2004	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N323JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N323NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N323US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N32404	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N324AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N324JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N324NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N324US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N325AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N325NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N325US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N326AT	2007	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N326NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N326US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N327AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N327NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N327NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N328AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N328JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N328NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N328NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N329AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N329JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N329NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N329NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N330AT	2007	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N330NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N330NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N33103	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N33132	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N33182	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N331NB	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N331NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N33203	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33209	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33262	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33264	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33266	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33284	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33286	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33289	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33292	\N	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33294	2005	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N332AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N332NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N332NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N333NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N333NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N334JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N334NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N334NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N335AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N335NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N335NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N336AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N336AT	2008	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N336NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N336NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N33714	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N337JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N337NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N337NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N338AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N338AT	2008	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N338NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N338NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N339AA	1988	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N339JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N339NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N339NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N340LV	1987	Fixed wing multi engine	BOEING	737-3K2	2	149	\N	Turbo-jet
N340NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N340NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N34110	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N34111	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N34131	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N34137	1999	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N341NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N341NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N34222	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N34282	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N342NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N342NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N343NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N343NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N34455	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N34460	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N344AA	1992	Fixed wing multi engine	GULFSTREAM AEROSPACE	G-IV	2	22	\N	Turbo-fan
N344NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N344NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N344SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N345NB	\N	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N345NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N345SA	1987	Fixed wing multi engine	BOEING	737-3K2	2	149	\N	Turbo-jet
N346JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N346NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N346SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N347AA	1985	Rotorcraft	SIKORSKY	S-76A	2	14	\N	Turbo-shaft
N347NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N347NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N347SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N348JB	2012	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N348NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N348NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N349NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N349NW	1996	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N349SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N350AA	1980	Fixed wing multi engine	PIPER	PA-31-350	2	8	162	Reciprocating
N350NA	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N350SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N351AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N351JB	2012	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N351NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N351NW	1997	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N35204	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N35260	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N35271	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N352AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N352NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N352NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N352SW	1990	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N353AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N353AT	2009	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N353JB	2012	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N353NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N353NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N353SW	1990	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N35407	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N354AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N354JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N354NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N354NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N354SW	1991	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N355AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N355JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N355NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N355NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N355SW	1991	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N356NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N356SW	1991	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N357AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N357NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N357NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N357SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N358AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N358JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N358NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N358NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N358SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N359AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N359NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N359NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N359SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N360AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N360NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N360NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N360SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N361AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N361NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N361NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N361SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N361VA	2013	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N36207	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N36247	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N36272	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N36280	2003	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N362AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N362NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N362NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N362SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N363AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N363NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N363NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N363SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N36444	2010	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36447	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36469	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36472	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36476	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N364AA	1973	Fixed wing multi engine	CESSNA	310Q	2	6	167	Reciprocating
N364NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N364NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N364SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N365AA	2001	Rotorcraft	AGUSTA SPA	A109E	2	8	\N	Turbo-shaft
N365NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N365NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N365SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N366AA	1991	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N366NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N366NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N366SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N367NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N367SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N368AA	1991	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N368JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N368NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N368NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N368SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N36915	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N369AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N369NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N369NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N369SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N370AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N370NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N370NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N370SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N371AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N371CA	2003	Fixed wing multi engine	BOMBARDIER INC	CL-600-2C10	2	80	\N	Turbo-fan
N371DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N371NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N371NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N371SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N37252	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37253	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37255	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37263	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37267	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37273	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37274	2002	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37277	2002	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37281	2003	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37287	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37290	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37293	2005	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37298	2005	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N372AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N372DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N372NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N372SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N3730B	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3731T	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3732J	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3733Z	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3734B	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3735D	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3736C	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3737C	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3738B	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3739P	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N373AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N373DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N373JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N373NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N373SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N37408	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N37409	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N3740C	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37413	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37419	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3741S	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37420	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37422	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37427	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3742C	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37434	2009	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37437	2009	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3743H	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3744F	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37456	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3745B	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37462	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37464	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37465	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37466	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37468	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3746H	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37470	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37471	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37474	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3747D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3748Y	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3749D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N374AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N374DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N374JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N374NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N374SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N3750D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3751B	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3752	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3753	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3754A	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3755D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3756	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3757D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
\.


--
-- Data for Name: weather; Type: TABLE DATA; Schema: rpostgres; Owner: travis
--

COPY rpostgres.weather (origin, year, month, day, hour, temp, dewp, humid, wind_dir, wind_speed, wind_gust, precip, pressure, visib, time_hour) FROM stdin;
EWR	2013	1	1	1	39.02	26.06	59.37	270	10.35702	\N	0	1012	10	2013-01-01 06:00:00+00
EWR	2013	1	1	2	39.02	26.96	61.63	250	8.05546	\N	0	1012.3	10	2013-01-01 07:00:00+00
EWR	2013	1	1	3	39.02	28.04	64.43	240	11.5078	\N	0	1012.5	10	2013-01-01 08:00:00+00
EWR	2013	1	1	4	39.92	28.04	62.21	250	12.65858	\N	0	1012.2	10	2013-01-01 09:00:00+00
EWR	2013	1	1	5	39.02	28.04	64.43	260	12.65858	\N	0	1011.9	10	2013-01-01 10:00:00+00
EWR	2013	1	1	6	37.94	28.04	67.21	240	11.5078	\N	0	1012.4	10	2013-01-01 11:00:00+00
EWR	2013	1	1	7	39.02	28.04	64.43	240	14.96014	\N	0	1012.2	10	2013-01-01 12:00:00+00
EWR	2013	1	1	8	39.92	28.04	62.21	250	10.35702	\N	0	1012.2	10	2013-01-01 13:00:00+00
EWR	2013	1	1	9	39.92	28.04	62.21	260	14.96014	\N	0	1012.7	10	2013-01-01 14:00:00+00
EWR	2013	1	1	10	41	28.04	59.65	260	13.80936	\N	0	1012.4	10	2013-01-01 15:00:00+00
EWR	2013	1	1	11	41	26.96	57.06	260	14.96014	\N	0	1011.4	10	2013-01-01 16:00:00+00
EWR	2013	1	1	13	39.2	28.4	69.67	330	16.11092	\N	0	\N	10	2013-01-01 18:00:00+00
EWR	2013	1	1	14	39.02	24.08	54.68	280	13.80936	\N	0	1010.8	10	2013-01-01 19:00:00+00
EWR	2013	1	1	15	37.94	24.08	57.04	290	9.20624	\N	0	1011.9	10	2013-01-01 20:00:00+00
EWR	2013	1	1	16	37.04	19.94	49.62	300	13.80936	20.71404	0	1012.1	10	2013-01-01 21:00:00+00
EWR	2013	1	1	17	35.96	19.04	49.83	330	11.5078	\N	0	1013.2	10	2013-01-01 22:00:00+00
EWR	2013	1	1	18	33.98	15.08	45.43	310	12.65858	25.31716	0	1014.1	10	2013-01-01 23:00:00+00
EWR	2013	1	1	19	33.08	12.92	42.84	320	10.35702	\N	0	1014.4	10	2013-01-02 00:00:00+00
EWR	2013	1	1	20	32	15.08	49.19	310	14.96014	\N	0	1015.2	10	2013-01-02 01:00:00+00
EWR	2013	1	1	21	30.02	12.92	48.48	320	18.41248	26.46794	0	1016	10	2013-01-02 02:00:00+00
EWR	2013	1	1	22	28.94	12.02	48.69	320	18.41248	25.31716	0	1016.5	10	2013-01-02 03:00:00+00
EWR	2013	1	1	23	28.04	10.94	48.15	310	16.11092	\N	0	1016.4	10	2013-01-02 04:00:00+00
EWR	2013	1	2	0	26.96	10.94	50.34	310	14.96014	25.31716	0	1016.3	10	2013-01-02 05:00:00+00
EWR	2013	1	2	1	26.06	10.94	52.25	330	12.65858	24.16638	0	1016.3	10	2013-01-02 06:00:00+00
EWR	2013	1	2	2	24.98	10.94	54.65	330	13.80936	\N	0	1017	10	2013-01-02 07:00:00+00
EWR	2013	1	2	3	24.08	8.96	51.93	320	14.96014	\N	0	1016.6	10	2013-01-02 08:00:00+00
EWR	2013	1	2	4	24.08	8.96	51.93	330	12.65858	\N	0	1016.9	10	2013-01-02 09:00:00+00
EWR	2013	1	2	5	24.08	8.96	51.93	330	6.90468	\N	0	1016.9	10	2013-01-02 10:00:00+00
EWR	2013	1	2	6	24.08	8.96	51.93	310	3.45234	\N	0	1017.2	10	2013-01-02 11:00:00+00
EWR	2013	1	2	7	24.98	10.04	52.5	300	6.90468	\N	0	1017.6	10	2013-01-02 12:00:00+00
EWR	2013	1	2	8	24.98	10.04	52.5	280	9.20624	\N	0	1018.5	10	2013-01-02 13:00:00+00
EWR	2013	1	2	9	26.96	10.04	48.36	290	11.5078	\N	0	1019	10	2013-01-02 14:00:00+00
EWR	2013	1	2	10	28.94	10.94	46.41	280	9.20624	\N	0	1018.5	10	2013-01-02 15:00:00+00
EWR	2013	1	2	11	30.92	12.02	44.92	300	14.96014	25.31716	0	1017.5	10	2013-01-02 16:00:00+00
EWR	2013	1	2	12	32	12.92	44.74	290	12.65858	23.0156	0	1017.1	10	2013-01-02 17:00:00+00
EWR	2013	1	2	13	33.98	12.92	41.33	290	16.11092	25.31716	0	1017.3	10	2013-01-02 18:00:00+00
EWR	2013	1	2	14	33.98	10.94	37.86	310	17.2617	26.46794	0	1017.8	10	2013-01-02 19:00:00+00
EWR	2013	1	2	15	33.98	12.02	39.72	310	13.80936	20.71404	0	1018.5	10	2013-01-02 20:00:00+00
EWR	2013	1	2	16	32	12.92	44.74	310	6.90468	\N	0	1018.6	10	2013-01-02 21:00:00+00
EWR	2013	1	2	17	32	12.92	44.74	290	12.65858	18.41248	0	1019.7	10	2013-01-02 22:00:00+00
EWR	2013	1	2	18	30.92	12.92	46.74	300	11.5078	\N	0	1020.3	10	2013-01-02 23:00:00+00
EWR	2013	1	2	19	30.92	14	49.01	290	6.90468	\N	0	1020.4	10	2013-01-03 00:00:00+00
EWR	2013	1	2	20	30.02	14	50.84	280	9.20624	16.11092	0	1020.6	10	2013-01-03 01:00:00+00
EWR	2013	1	2	21	30.02	14	50.84	270	5.7539	\N	0	1021.2	10	2013-01-03 02:00:00+00
EWR	2013	1	2	22	28.94	15.08	55.69	270	8.05546	\N	0	1021.7	10	2013-01-03 03:00:00+00
EWR	2013	1	2	23	28.94	15.08	55.69	280	9.20624	\N	0	1022.2	10	2013-01-03 04:00:00+00
EWR	2013	1	3	0	28.04	15.08	57.79	290	8.05546	\N	0	1021.8	10	2013-01-03 05:00:00+00
EWR	2013	1	3	1	28.04	15.08	57.79	280	10.35702	\N	0	1022.1	10	2013-01-03 06:00:00+00
EWR	2013	1	3	2	26.96	15.08	60.41	270	8.05546	\N	0	1022.3	10	2013-01-03 07:00:00+00
EWR	2013	1	3	3	26.96	15.08	60.41	280	6.90468	\N	0	1022.1	10	2013-01-03 08:00:00+00
EWR	2013	1	3	4	26.06	15.08	62.7	290	5.7539	\N	0	1021.9	10	2013-01-03 09:00:00+00
EWR	2013	1	3	5	26.06	15.08	62.7	290	5.7539	\N	0	1022	10	2013-01-03 10:00:00+00
EWR	2013	1	3	6	26.06	15.98	65.21	310	6.90468	\N	0	1022.4	10	2013-01-03 11:00:00+00
EWR	2013	1	3	7	26.06	15.98	65.21	320	5.7539	\N	0	1022.2	10	2013-01-03 12:00:00+00
EWR	2013	1	3	8	26.96	17.06	65.84	310	5.7539	\N	0	1022.4	10	2013-01-03 13:00:00+00
EWR	2013	1	3	9	28.04	17.06	62.97	290	5.7539	\N	0	1022.8	10	2013-01-03 14:00:00+00
EWR	2013	1	3	10	30.92	15.08	51.38	290	9.20624	\N	0	1022.1	10	2013-01-03 15:00:00+00
EWR	2013	1	3	11	30.92	14	49.01	\N	4.60312	\N	0	1021	10	2013-01-03 16:00:00+00
EWR	2013	1	3	12	33.08	12.92	42.84	260	8.05546	\N	0	1019.8	10	2013-01-03 17:00:00+00
EWR	2013	1	3	13	33.98	12.92	41.33	260	9.20624	\N	0	1019.1	10	2013-01-03 18:00:00+00
EWR	2013	1	3	14	33.98	12.92	41.33	240	8.05546	\N	0	1018.7	10	2013-01-03 19:00:00+00
EWR	2013	1	3	15	33.08	14	44.92	250	11.5078	\N	0	1018.8	10	2013-01-03 20:00:00+00
EWR	2013	1	3	16	32	14	46.92	270	10.35702	\N	0	1018.9	10	2013-01-03 21:00:00+00
EWR	2013	1	3	17	30.02	15.08	53.29	240	9.20624	\N	0	1019.3	10	2013-01-03 22:00:00+00
EWR	2013	1	3	18	30.92	15.08	51.38	240	10.35702	\N	0	1019.6	10	2013-01-03 23:00:00+00
EWR	2013	1	3	19	30.92	15.08	51.38	230	11.5078	\N	0	1019.6	10	2013-01-04 00:00:00+00
EWR	2013	1	3	20	30.92	15.08	51.38	240	11.5078	\N	0	1019.4	10	2013-01-04 01:00:00+00
EWR	2013	1	3	21	30.92	15.98	53.44	240	12.65858	\N	0	1019	10	2013-01-04 02:00:00+00
EWR	2013	1	3	22	28.94	17.06	60.69	230	10.35702	\N	0	1019	10	2013-01-04 03:00:00+00
EWR	2013	1	3	23	30.02	17.96	60.38	240	10.35702	\N	0	1018.4	10	2013-01-04 04:00:00+00
EWR	2013	1	4	0	30.02	17.96	60.38	240	13.80936	\N	0	1018	10	2013-01-04 05:00:00+00
EWR	2013	1	4	1	28.94	17.96	63.1	230	8.05546	\N	0	1018.1	10	2013-01-04 06:00:00+00
EWR	2013	1	4	2	30.02	19.04	63.24	240	10.35702	\N	0	1018.3	10	2013-01-04 07:00:00+00
EWR	2013	1	4	3	28.94	19.04	66.09	250	11.5078	\N	0	1018.2	10	2013-01-04 08:00:00+00
EWR	2013	1	4	4	28.94	19.94	68.68	230	6.90468	\N	0	1018.4	10	2013-01-04 09:00:00+00
EWR	2013	1	4	5	30.92	21.02	66.34	240	11.5078	\N	0	1018.4	10	2013-01-04 10:00:00+00
EWR	2013	1	4	6	33.08	21.02	60.81	230	16.11092	\N	0	1018.7	10	2013-01-04 11:00:00+00
EWR	2013	1	4	7	33.98	21.92	60.93	240	10.35702	\N	0	1018.7	10	2013-01-04 12:00:00+00
EWR	2013	1	4	8	35.06	21.92	58.37	250	13.80936	\N	0	1019	10	2013-01-04 13:00:00+00
EWR	2013	1	4	9	35.96	21.02	54.21	250	14.96014	19.56326	0	1019	10	2013-01-04 14:00:00+00
EWR	2013	1	4	10	37.04	19.04	47.75	260	16.11092	27.61872	0	1018.1	10	2013-01-04 15:00:00+00
EWR	2013	1	4	11	37.04	19.04	47.75	270	20.71404	27.61872	0	1016.9	10	2013-01-04 16:00:00+00
EWR	2013	1	4	12	39.92	19.94	44.33	260	17.2617	25.31716	0	1015.8	10	2013-01-04 17:00:00+00
EWR	2013	1	4	13	37.94	19.04	46.09	250	24.16638	31.07106	0	1015.1	10	2013-01-04 18:00:00+00
EWR	2013	1	4	14	37.94	19.94	47.89	250	21.86482	28.7695	0	1014.7	10	2013-01-04 19:00:00+00
EWR	2013	1	4	15	37.94	19.94	47.89	250	18.41248	27.61872	0	1014.6	10	2013-01-04 20:00:00+00
EWR	2013	1	4	16	37.04	19.94	49.62	250	17.2617	25.31716	0	1014.8	10	2013-01-04 21:00:00+00
EWR	2013	1	4	17	35.96	21.02	54.21	230	13.80936	\N	0	1015.2	10	2013-01-04 22:00:00+00
EWR	2013	1	4	18	35.06	21.02	56.18	230	9.20624	\N	0	1015.4	10	2013-01-04 23:00:00+00
EWR	2013	1	4	19	35.06	21.02	56.18	240	11.5078	19.56326	0	1015.5	10	2013-01-05 00:00:00+00
EWR	2013	1	4	20	35.06	19.94	53.66	250	11.5078	\N	0	1015.3	10	2013-01-05 01:00:00+00
EWR	2013	1	4	21	35.06	19.94	53.66	250	13.80936	\N	0	1015.7	10	2013-01-05 02:00:00+00
EWR	2013	1	4	22	33.98	19.04	53.91	250	11.5078	\N	0	1016.2	10	2013-01-05 03:00:00+00
EWR	2013	1	4	23	33.08	19.04	55.89	240	11.5078	\N	0	1016.6	10	2013-01-05 04:00:00+00
EWR	2013	1	5	0	33.08	17.96	53.36	260	10.35702	\N	0	1017.1	10	2013-01-05 05:00:00+00
EWR	2013	1	5	1	33.08	17.06	51.33	270	10.35702	\N	0	1017.7	10	2013-01-05 06:00:00+00
EWR	2013	1	5	2	32	17.06	53.6	280	12.65858	\N	0	1018.8	10	2013-01-05 07:00:00+00
EWR	2013	1	5	3	32	17.06	53.6	290	18.41248	23.0156	0	1019.3	10	2013-01-05 08:00:00+00
EWR	2013	1	5	4	32	17.06	53.6	260	11.5078	\N	0	1020.2	10	2013-01-05 09:00:00+00
EWR	2013	1	5	5	32	17.06	53.6	240	12.65858	\N	0	1021	10	2013-01-05 10:00:00+00
EWR	2013	1	5	6	33.08	17.96	53.36	250	10.35702	\N	0	1022.4	10	2013-01-05 11:00:00+00
EWR	2013	1	5	7	32	19.04	58.37	250	9.20624	\N	0	1023	10	2013-01-05 12:00:00+00
EWR	2013	1	5	8	35.06	19.94	53.66	240	9.20624	20.71404	0	1024.5	10	2013-01-05 13:00:00+00
EWR	2013	1	5	9	37.94	21.02	50.14	270	10.35702	\N	0	1024.8	10	2013-01-05 14:00:00+00
EWR	2013	1	5	10	41	21.02	44.51	310	10.35702	21.86482	0	1024.9	10	2013-01-05 15:00:00+00
EWR	2013	1	5	11	42.08	19.94	40.77	320	14.96014	26.46794	0	1024.6	10	2013-01-05 16:00:00+00
EWR	2013	1	5	12	42.98	19.94	39.38	310	13.80936	\N	0	1023.9	10	2013-01-05 17:00:00+00
EWR	2013	1	5	13	44.06	19.94	37.79	290	11.5078	19.56326	0	1023.6	10	2013-01-05 18:00:00+00
EWR	2013	1	5	14	44.06	19.94	37.79	310	9.20624	16.11092	0	1024	10	2013-01-05 19:00:00+00
EWR	2013	1	5	15	42.98	19.04	37.9	310	8.05546	\N	0	1024.1	10	2013-01-05 20:00:00+00
EWR	2013	1	5	16	41	19.94	42.51	310	4.60312	\N	0	1024	10	2013-01-05 21:00:00+00
EWR	2013	1	5	17	39.92	19.94	44.33	280	4.60312	\N	0	1024.7	10	2013-01-05 22:00:00+00
EWR	2013	1	5	18	39.02	21.92	49.93	240	8.05546	\N	0	1025	10	2013-01-05 23:00:00+00
EWR	2013	1	5	19	35.96	21.92	56.32	240	6.90468	\N	0	1024.8	10	2013-01-06 00:00:00+00
EWR	2013	1	5	20	33.98	21.92	60.93	240	4.60312	\N	0	1024.2	10	2013-01-06 01:00:00+00
EWR	2013	1	5	21	33.08	23	66.11	220	4.60312	\N	0	1024.1	10	2013-01-06 02:00:00+00
EWR	2013	1	5	22	33.08	23	66.11	210	4.60312	\N	0	1023.3	10	2013-01-06 03:00:00+00
EWR	2013	1	5	23	32	23	69.04	210	4.60312	\N	0	1022.8	10	2013-01-06 04:00:00+00
EWR	2013	1	6	0	33.98	23	63.77	210	5.7539	\N	0	1023.3	10	2013-01-06 05:00:00+00
EWR	2013	1	6	1	33.98	23	63.77	230	9.20624	\N	0	1023.4	10	2013-01-06 06:00:00+00
EWR	2013	1	6	2	33.98	23	63.77	200	4.60312	\N	0	1022.5	10	2013-01-06 07:00:00+00
EWR	2013	1	6	3	33.98	24.08	66.72	200	5.7539	\N	0	1021.7	10	2013-01-06 08:00:00+00
EWR	2013	1	6	4	33.08	28.04	81.5	200	8.05546	\N	0	1020.5	10	2013-01-06 09:00:00+00
EWR	2013	1	6	5	33.8	30.2	88.37	210	5.7539	\N	0	\N	6	2013-01-06 10:00:00+00
EWR	2013	1	6	6	33.98	30.92	88.42	210	5.7539	\N	0	1020.3	6	2013-01-06 11:00:00+00
EWR	2013	1	6	7	35.06	32	93.03	230	9.20624	\N	0	\N	6	2013-01-06 12:00:00+00
EWR	2013	1	6	8	35.96	32	86.59	240	8.05546	\N	0	\N	6	2013-01-06 13:00:00+00
EWR	2013	1	6	9	37.4	32	86.59	230	11.5078	\N	0	\N	8	2013-01-06 14:00:00+00
EWR	2013	1	6	10	39.92	30.92	74.98	250	11.5078	\N	0	\N	9	2013-01-06 15:00:00+00
EWR	2013	1	6	11	42.98	30.02	59.93	240	10.35702	\N	0	1017.4	10	2013-01-06 16:00:00+00
EWR	2013	1	6	12	46.04	28.94	51.03	250	10.35702	\N	0	1016.3	10	2013-01-06 17:00:00+00
EWR	2013	1	6	13	46.94	26.96	45.48	240	13.80936	19.56326	0	1015.5	10	2013-01-06 18:00:00+00
EWR	2013	1	6	14	48.02	24.98	40.22	250	14.96014	18.41248	0	1015.1	10	2013-01-06 19:00:00+00
EWR	2013	1	6	15	46.94	24.08	40.35	260	11.5078	\N	0	1015	10	2013-01-06 20:00:00+00
EWR	2013	1	6	16	44.96	26.06	47.23	260	6.90468	\N	0	1015.5	10	2013-01-06 21:00:00+00
EWR	2013	1	6	17	44.06	26.06	48.87	270	8.05546	\N	0	1016	10	2013-01-06 22:00:00+00
EWR	2013	1	6	18	44.06	24.98	46.73	250	10.35702	\N	0	1016.5	10	2013-01-06 23:00:00+00
EWR	2013	1	6	19	42.98	24.98	48.7	260	10.35702	\N	0	1016.6	10	2013-01-07 00:00:00+00
EWR	2013	1	6	20	42.98	26.06	50.94	270	10.35702	\N	0	1016.5	10	2013-01-07 01:00:00+00
EWR	2013	1	6	21	42.08	26.06	52.73	270	10.35702	\N	0	1016.7	10	2013-01-07 02:00:00+00
EWR	2013	1	6	22	41	26.96	57.06	270	6.90468	\N	0	1017.2	10	2013-01-07 03:00:00+00
EWR	2013	1	6	23	39.92	26.96	59.5	270	9.20624	\N	0	1017.6	10	2013-01-07 04:00:00+00
EWR	2013	1	7	0	39.92	26.96	59.5	260	8.05546	\N	0	1018.1	10	2013-01-07 05:00:00+00
EWR	2013	1	7	1	37.94	26.96	64.29	270	8.05546	\N	0	1018.7	10	2013-01-07 06:00:00+00
EWR	2013	1	7	2	35.96	26.96	69.51	280	6.90468	\N	0	1019.3	10	2013-01-07 07:00:00+00
EWR	2013	1	7	3	37.04	28.04	69.63	260	6.90468	\N	0	1019.8	10	2013-01-07 08:00:00+00
EWR	2013	1	7	4	35.96	28.04	72.66	280	9.20624	\N	0	1020.6	10	2013-01-07 09:00:00+00
EWR	2013	1	7	5	35.06	26.96	72.03	290	4.60312	\N	0	1021.7	10	2013-01-07 10:00:00+00
EWR	2013	1	7	6	35.96	28.04	72.66	270	6.90468	\N	0	1023.1	10	2013-01-07 11:00:00+00
EWR	2013	1	7	7	37.94	28.94	69.73	250	8.05546	\N	0	1024.1	10	2013-01-07 12:00:00+00
EWR	2013	1	7	8	39.92	28.94	64.54	280	5.7539	\N	0	1025.1	10	2013-01-07 13:00:00+00
EWR	2013	1	7	9	44.06	26.96	50.73	300	13.80936	23.0156	0	1025.9	10	2013-01-07 14:00:00+00
EWR	2013	1	7	10	44.96	24.08	43.49	320	14.96014	21.86482	0	1026.5	10	2013-01-07 15:00:00+00
EWR	2013	1	7	11	46.04	23	39.9	300	11.5078	20.71404	0	1026.6	10	2013-01-07 16:00:00+00
EWR	2013	1	7	12	46.94	21.92	36.85	300	14.96014	24.16638	0	1026.9	10	2013-01-07 17:00:00+00
EWR	2013	1	7	13	46.04	19.94	35.05	360	11.5078	\N	0	1027.1	10	2013-01-07 18:00:00+00
EWR	2013	1	7	14	46.94	19.94	33.88	290	11.5078	20.71404	0	1027.6	10	2013-01-07 19:00:00+00
EWR	2013	1	7	15	44.96	17.96	33.55	320	8.05546	\N	0	1028.4	10	2013-01-07 20:00:00+00
EWR	2013	1	7	16	42.98	17.96	36.18	330	6.90468	\N	0	1028.8	10	2013-01-07 21:00:00+00
EWR	2013	1	7	17	42.08	17.96	37.46	320	3.45234	\N	0	1029.1	10	2013-01-07 22:00:00+00
EWR	2013	1	7	18	41	19.04	40.9	310	4.60312	\N	0	1029.3	10	2013-01-07 23:00:00+00
EWR	2013	1	7	19	39.92	21.02	46.41	0	0	\N	0	1029.3	10	2013-01-08 00:00:00+00
EWR	2013	1	7	20	39.92	21.02	46.41	0	0	\N	0	1029.1	10	2013-01-08 01:00:00+00
EWR	2013	1	7	21	37.04	24.08	59.09	0	0	\N	0	1028.9	10	2013-01-08 02:00:00+00
EWR	2013	1	7	22	35.96	23	58.94	230	3.45234	\N	0	1029.3	10	2013-01-08 03:00:00+00
EWR	2013	1	7	23	32	23	69.04	210	6.90468	\N	0	1029.2	10	2013-01-08 04:00:00+00
EWR	2013	1	8	0	32	23	69.04	210	3.45234	\N	0	1029.2	10	2013-01-08 05:00:00+00
EWR	2013	1	8	1	32	24.08	72.24	210	6.90468	\N	0	1029	10	2013-01-08 06:00:00+00
EWR	2013	1	8	2	32	24.98	75	190	3.45234	\N	0	1028.7	10	2013-01-08 07:00:00+00
EWR	2013	1	8	3	30.92	26.06	81.95	190	4.60312	\N	0	1028.2	10	2013-01-08 08:00:00+00
EWR	2013	1	8	4	30.02	24.98	81.27	240	4.60312	\N	0	1028.6	10	2013-01-08 09:00:00+00
EWR	2013	1	8	5	28.94	24.08	81.8	210	4.60312	\N	0	1028.9	10	2013-01-08 10:00:00+00
EWR	2013	1	8	6	30.92	24.98	78.35	0	0	\N	0	1029.2	9	2013-01-08 11:00:00+00
EWR	2013	1	8	7	30.02	24.98	81.27	210	5.7539	\N	0	1030	8	2013-01-08 12:00:00+00
EWR	2013	1	8	8	35.06	26.96	72.03	240	6.90468	\N	0	1030.5	9	2013-01-08 13:00:00+00
EWR	2013	1	8	9	39.02	28.94	66.85	230	9.20624	\N	0	1030.3	9	2013-01-08 14:00:00+00
EWR	2013	1	8	10	44.06	28.94	55.02	220	13.80936	\N	0	1029.7	9	2013-01-08 15:00:00+00
EWR	2013	1	8	11	46.04	30.02	53.33	230	10.35702	\N	0	1028.2	10	2013-01-08 16:00:00+00
EWR	2013	1	8	12	46.94	30.02	51.55	230	14.96014	25.31716	0	1027.9	10	2013-01-08 17:00:00+00
EWR	2013	1	8	13	48.92	30.02	47.86	240	11.5078	\N	0	1027.6	10	2013-01-08 18:00:00+00
EWR	2013	1	8	14	48.92	30.02	47.86	220	11.5078	\N	0	1027.9	10	2013-01-08 19:00:00+00
EWR	2013	1	8	15	48.92	28.04	44.14	240	11.5078	\N	0	1027.7	10	2013-01-08 20:00:00+00
EWR	2013	1	8	16	46.04	28.04	49.19	230	10.35702	\N	0	1027.8	10	2013-01-08 21:00:00+00
EWR	2013	1	8	17	44.06	28.94	55.02	220	6.90468	\N	0	1028.1	10	2013-01-08 22:00:00+00
EWR	2013	1	8	18	39.92	30.92	69.96	220	8.05546	\N	0	1028.7	10	2013-01-08 23:00:00+00
EWR	2013	1	8	19	39.92	30.92	69.96	200	5.7539	\N	0	1028.7	10	2013-01-09 00:00:00+00
EWR	2013	1	8	20	39.02	30.02	69.86	210	5.7539	\N	0	1028.6	10	2013-01-09 01:00:00+00
EWR	2013	1	8	21	37.94	28.94	69.73	210	3.45234	\N	0	1028.6	10	2013-01-09 02:00:00+00
EWR	2013	1	8	22	37.94	28.94	69.73	210	4.60312	\N	0	1029.3	10	2013-01-09 03:00:00+00
EWR	2013	1	8	23	37.04	28.94	72.24	230	4.60312	\N	0	1029.2	10	2013-01-09 04:00:00+00
EWR	2013	1	9	0	35.96	28.94	75.39	0	0	\N	0	1029.1	10	2013-01-09 05:00:00+00
EWR	2013	1	9	1	33.98	28.94	81.57	0	0	\N	0	1028.7	10	2013-01-09 06:00:00+00
EWR	2013	1	9	2	35.06	28.94	78.13	0	0	\N	0	1028.5	10	2013-01-09 07:00:00+00
EWR	2013	1	9	3	35.96	30.02	78.79	0	0	\N	0	1028.4	10	2013-01-09 08:00:00+00
EWR	2013	1	9	4	35.96	28.94	75.39	0	0	\N	0	1028.2	10	2013-01-09 09:00:00+00
EWR	2013	1	9	5	35.06	28.94	78.13	0	0	\N	0	1028	9	2013-01-09 10:00:00+00
EWR	2013	1	9	6	35.06	28.94	78.13	0	0	\N	0	1028.4	9	2013-01-09 11:00:00+00
EWR	2013	1	9	7	33.98	30.02	85.24	260	4.60312	\N	0	1029	6	2013-01-09 12:00:00+00
EWR	2013	1	9	8	37.04	30.92	78.31	0	0	\N	0	1028.7	7	2013-01-09 13:00:00+00
EWR	2013	1	9	9	42.08	32	67.22	0	0	\N	0	1028.3	7	2013-01-09 14:00:00+00
EWR	2013	1	9	10	44.06	33.08	65.07	170	3.45234	\N	0	1026.4	7	2013-01-09 15:00:00+00
EWR	2013	1	9	11	46.94	33.98	60.47	230	5.7539	\N	0	1025.9	7	2013-01-09 16:00:00+00
EWR	2013	1	9	12	46.04	33.98	62.56	200	9.20624	\N	0	1024.1	9	2013-01-09 17:00:00+00
EWR	2013	1	9	13	46.94	33.98	60.47	270	8.05546	\N	0	1024.7	9	2013-01-09 18:00:00+00
EWR	2013	1	9	14	46.94	35.06	63.13	180	8.05546	\N	0	1021.1	8	2013-01-09 19:00:00+00
EWR	2013	1	9	15	48.92	37.04	63.39	210	13.80936	20.71404	0	1020.7	9	2013-01-09 20:00:00+00
EWR	2013	1	9	16	50	37.04	60.89	240	11.5078	20.71404	0	1021	10	2013-01-09 21:00:00+00
EWR	2013	1	9	17	48.92	37.04	63.39	240	12.65858	\N	0	1021.7	10	2013-01-09 22:00:00+00
EWR	2013	1	9	18	48.02	37.04	65.56	250	10.35702	\N	0	1022.1	10	2013-01-09 23:00:00+00
EWR	2013	1	9	19	46.94	37.04	68.28	260	11.5078	\N	0	1022.6	10	2013-01-10 00:00:00+00
EWR	2013	1	9	20	44.96	37.04	73.59	230	11.5078	\N	0	1022.5	10	2013-01-10 01:00:00+00
EWR	2013	1	9	21	44.06	35.96	72.98	230	12.65858	\N	0	1022.5	10	2013-01-10 02:00:00+00
EWR	2013	1	9	22	44.06	35.06	70.42	240	12.65858	\N	0	1023	10	2013-01-10 03:00:00+00
EWR	2013	1	9	23	42.98	33.08	67.81	220	8.05546	\N	0	1023.7	10	2013-01-10 04:00:00+00
EWR	2013	1	10	0	41	32	70.08	230	8.05546	\N	0	1024.6	10	2013-01-10 05:00:00+00
EWR	2013	1	10	1	39.02	30.02	69.86	210	9.20624	\N	0	1025.9	10	2013-01-10 06:00:00+00
EWR	2013	1	10	2	39.02	28.94	66.85	230	6.90468	\N	0	1026.9	10	2013-01-10 07:00:00+00
EWR	2013	1	10	3	39.92	26.96	59.5	270	5.7539	\N	0	1027.5	10	2013-01-10 08:00:00+00
EWR	2013	1	10	4	41	26.06	54.97	320	6.90468	\N	0	1028.2	10	2013-01-10 09:00:00+00
EWR	2013	1	10	5	41	26.06	54.97	300	12.65858	20.71404	0	1029	10	2013-01-10 10:00:00+00
EWR	2013	1	10	6	39.92	24.98	54.81	280	6.90468	17.2617	0	1030	10	2013-01-10 11:00:00+00
EWR	2013	1	10	7	41	24.98	52.56	330	6.90468	\N	0	1031.4	10	2013-01-10 12:00:00+00
EWR	2013	1	10	8	42.98	24.98	48.7	330	8.05546	\N	0	1032.2	10	2013-01-10 13:00:00+00
EWR	2013	1	10	9	44.96	23	41.56	320	17.2617	26.46794	0	1032.7	10	2013-01-10 14:00:00+00
EWR	2013	1	10	10	44.96	21.92	39.72	320	11.5078	\N	0	1032.8	10	2013-01-10 15:00:00+00
EWR	2013	1	10	11	46.94	21.92	36.85	330	13.80936	23.0156	0	1032	10	2013-01-10 16:00:00+00
EWR	2013	1	10	12	48.92	21.92	34.21	320	14.96014	20.71404	0	1031.3	10	2013-01-10 17:00:00+00
EWR	2013	1	10	13	50	21.92	32.86	310	12.65858	18.41248	0	1031.5	10	2013-01-10 18:00:00+00
EWR	2013	1	10	14	50	21.92	32.86	300	11.5078	19.56326	0	1031.9	10	2013-01-10 19:00:00+00
EWR	2013	1	10	15	48.92	21.02	32.93	330	10.35702	\N	0	1032.4	10	2013-01-10 20:00:00+00
EWR	2013	1	10	16	46.94	21.92	36.85	310	8.05546	\N	0	1032.8	10	2013-01-10 21:00:00+00
EWR	2013	1	10	17	46.04	21.92	38.12	320	8.05546	\N	0	1033.3	10	2013-01-10 22:00:00+00
EWR	2013	1	10	18	44.96	23	41.56	330	6.90468	\N	0	1033.8	10	2013-01-10 23:00:00+00
EWR	2013	1	10	19	44.06	23	43.02	340	4.60312	\N	0	1033.6	10	2013-01-11 00:00:00+00
EWR	2013	1	10	20	44.06	23	43.02	340	6.90468	\N	0	1034	10	2013-01-11 01:00:00+00
EWR	2013	1	10	21	41	24.98	52.56	10	8.05546	\N	0	1033.5	10	2013-01-11 02:00:00+00
EWR	2013	1	10	22	39.02	24.98	56.77	30	8.05546	\N	0	1034	10	2013-01-11 03:00:00+00
EWR	2013	1	10	23	39.92	24.08	52.79	0	0	\N	0	1034.4	10	2013-01-11 04:00:00+00
EWR	2013	1	11	0	37.94	24.98	59.22	20	4.60312	\N	0	1033.6	10	2013-01-11 05:00:00+00
EWR	2013	1	11	1	37.04	24.08	59.09	20	8.05546	\N	0	1033.2	10	2013-01-11 06:00:00+00
EWR	2013	1	11	2	35.06	24.08	63.91	30	5.7539	\N	0	1033.1	10	2013-01-11 07:00:00+00
EWR	2013	1	11	3	35.96	24.08	61.67	10	5.7539	\N	0	1032.2	10	2013-01-11 08:00:00+00
EWR	2013	1	11	4	35.96	24.08	61.67	10	6.90468	\N	0	1031.3	10	2013-01-11 09:00:00+00
EWR	2013	1	11	5	37.04	24.98	61.35	0	0	\N	0	1031.7	10	2013-01-11 10:00:00+00
EWR	2013	1	11	6	37.94	24.98	59.22	0	0	\N	0	1031.8	10	2013-01-11 11:00:00+00
EWR	2013	1	11	7	39.02	26.06	59.37	0	0	\N	0	1031.9	10	2013-01-11 12:00:00+00
EWR	2013	1	11	8	41	28.94	61.89	80	5.7539	\N	0	1031.4	10	2013-01-11 13:00:00+00
EWR	2013	1	11	9	42.08	30.92	64.35	80	5.7539	\N	0	1031.1	10	2013-01-11 14:00:00+00
EWR	2013	1	11	10	42.98	32	64.93	80	5.7539	\N	0	1029.7	10	2013-01-11 15:00:00+00
EWR	2013	1	11	11	44.06	33.08	65.07	90	5.7539	\N	0	1028.4	10	2013-01-11 16:00:00+00
EWR	2013	1	11	12	44.96	35.96	70.52	\N	4.60312	\N	0	1027.3	10	2013-01-11 17:00:00+00
EWR	2013	1	11	13	44.96	37.04	73.59	90	5.7539	\N	0	1026.6	10	2013-01-11 18:00:00+00
EWR	2013	1	11	14	44.96	37.94	76.25	80	5.7539	\N	0	1025.9	10	2013-01-11 19:00:00+00
EWR	2013	1	11	15	44.96	39.92	82.38	110	4.60312	\N	0	1024.9	10	2013-01-11 20:00:00+00
EWR	2013	1	11	16	46.4	41	82.45	90	4.60312	\N	0	\N	10	2013-01-11 21:00:00+00
EWR	2013	1	11	17	46.4	44.6	93.4	150	5.7539	\N	0.05	\N	3	2013-01-11 22:00:00+00
EWR	2013	1	11	18	46.4	44.96	95.99	130	5.7539	\N	0.06	\N	3	2013-01-11 23:00:00+00
EWR	2013	1	11	19	46.4	44.96	95.99	0	0	\N	0.19	\N	3	2013-01-12 00:00:00+00
EWR	2013	1	11	20	46.4	44.6	100	60	6.90468	\N	0.07	\N	2.5	2013-01-12 01:00:00+00
EWR	2013	1	11	21	42.98	42.98	100	20	5.7539	\N	0.09	1020.6	1	2013-01-12 02:00:00+00
EWR	2013	1	11	22	44.6	44.6	100	360	3.45234	\N	0.05	\N	1	2013-01-12 03:00:00+00
EWR	2013	1	11	23	42.98	42.98	100	10	8.05546	\N	0.02	\N	2	2013-01-12 04:00:00+00
EWR	2013	1	12	0	44.06	42.98	100	360	5.7539	\N	0.01	\N	1.5	2013-01-12 05:00:00+00
EWR	2013	1	12	1	44.06	42.98	95.95	340	9.20624	\N	0.01	1018.8	1	2013-01-12 06:00:00+00
EWR	2013	1	12	2	44.06	44.06	100	360	6.90468	\N	0.01	1019.2	1.5	2013-01-12 07:00:00+00
EWR	2013	1	12	3	44.96	44.6	100	20	9.20624	\N	0	\N	6	2013-01-12 08:00:00+00
EWR	2013	1	12	4	44.96	44.6	100	20	8.05546	\N	0	\N	6	2013-01-12 09:00:00+00
EWR	2013	1	12	5	44.96	44.6	100	360	9.20624	\N	0	\N	6	2013-01-12 10:00:00+00
EWR	2013	1	12	6	44.06	44.06	100	20	8.05546	\N	0	1019.5	6	2013-01-12 11:00:00+00
EWR	2013	1	12	7	44.96	44.06	96.63	10	10.35702	\N	0	1020.4	6	2013-01-12 12:00:00+00
EWR	2013	1	12	8	44.96	44.06	96.63	10	8.05546	\N	0	1021	7	2013-01-12 13:00:00+00
EWR	2013	1	12	9	46.04	44.06	92.75	10	6.90468	\N	0	1020.9	6	2013-01-12 14:00:00+00
EWR	2013	1	12	10	46.94	44.96	92.78	360	4.60312	\N	0	1021.1	6	2013-01-12 15:00:00+00
EWR	2013	1	12	11	48.02	44.96	89.08	40	5.7539	\N	0	1020.4	6	2013-01-12 16:00:00+00
EWR	2013	1	12	12	46.94	44.96	92.78	30	4.60312	\N	0	1020.5	6	2013-01-12 17:00:00+00
EWR	2013	1	12	13	48.02	44.96	89.08	30	3.45234	\N	0	1020.7	6	2013-01-12 18:00:00+00
EWR	2013	1	12	14	48.02	44.96	89.08	50	5.7539	\N	0	1020.3	5	2013-01-12 19:00:00+00
EWR	2013	1	12	15	48.2	44.96	92.78	40	3.45234	\N	0	\N	2.5	2013-01-12 20:00:00+00
EWR	2013	1	12	16	46.94	44.96	92.78	50	4.60312	\N	0	1021	2.5	2013-01-12 21:00:00+00
EWR	2013	1	12	17	46.94	44.96	92.78	30	6.90468	\N	0	1021.7	2.5	2013-01-12 22:00:00+00
EWR	2013	1	12	18	46.94	44.96	92.78	0	0	\N	0	1021	3	2013-01-12 23:00:00+00
EWR	2013	1	12	19	46.04	44.06	92.75	0	0	\N	0	1021.7	3	2013-01-13 00:00:00+00
EWR	2013	1	12	20	46.04	44.06	92.75	0	0	\N	0	1020.9	3	2013-01-13 01:00:00+00
EWR	2013	1	12	21	46.04	44.06	92.75	0	0	\N	0	1020.2	3	2013-01-13 02:00:00+00
EWR	2013	1	12	22	46.04	44.06	92.75	0	0	\N	0	1020.4	3	2013-01-13 03:00:00+00
EWR	2013	1	12	23	46.4	44.96	95.99	0	0	\N	0	\N	2	2013-01-13 04:00:00+00
EWR	2013	1	13	0	46.4	44.96	100	160	4.60312	\N	0	\N	0.25	2013-01-13 05:00:00+00
EWR	2013	1	13	1	44.96	44.96	100	0	0	\N	0	1020.5	0.25	2013-01-13 06:00:00+00
EWR	2013	1	13	2	44.96	44.96	100	150	4.60312	\N	0	\N	0.25	2013-01-13 07:00:00+00
EWR	2013	1	13	3	44.96	44.96	100	200	5.7539	\N	0	\N	0.25	2013-01-13 08:00:00+00
EWR	2013	1	13	4	44.6	44.6	100	210	5.7539	\N	0	\N	0.25	2013-01-13 09:00:00+00
EWR	2013	1	13	5	44.6	44.6	100	170	3.45234	\N	0	\N	0.25	2013-01-13 10:00:00+00
EWR	2013	1	13	6	44.6	44.6	100	160	4.60312	\N	0	\N	0.5	2013-01-13 11:00:00+00
EWR	2013	1	13	7	44.6	44.6	100	160	5.7539	\N	0	\N	0.25	2013-01-13 12:00:00+00
EWR	2013	1	13	8	44.06	44.06	100	0	0	\N	0	1020.9	0.12	2013-01-13 13:00:00+00
EWR	2013	1	13	9	44.06	44.06	100	0	0	\N	0	1021	0.12	2013-01-13 14:00:00+00
EWR	2013	1	13	10	44.06	44.06	100	140	4.60312	\N	0	1021.1	0.5	2013-01-13 15:00:00+00
EWR	2013	1	13	11	46.4	44.6	93.4	160	3.45234	\N	0	\N	2	2013-01-13 16:00:00+00
EWR	2013	1	13	12	46.94	44.6	93.4	\N	4.60312	\N	0	\N	3	2013-01-13 17:00:00+00
EWR	2013	1	13	13	48.02	44.96	89.08	140	3.45234	\N	0	1018.1	3	2013-01-13 18:00:00+00
EWR	2013	1	13	14	48.2	44.96	89.08	\N	4.60312	\N	0	\N	3	2013-01-13 19:00:00+00
EWR	2013	1	13	15	46.94	44.6	93.4	120	5.7539	\N	0	\N	3	2013-01-13 20:00:00+00
EWR	2013	1	13	16	46.94	44.06	89.65	0	0	\N	0	1017.5	5	2013-01-13 21:00:00+00
EWR	2013	1	13	17	48.02	44.96	89.08	0	0	\N	0	1017.5	7	2013-01-13 22:00:00+00
EWR	2013	1	13	18	48.92	44.96	86.13	0	0	\N	0	1017.2	10	2013-01-13 23:00:00+00
EWR	2013	1	13	19	48.2	46.94	96.02	0	0	\N	0	\N	2	2013-01-14 00:00:00+00
EWR	2013	1	13	20	48.2	46.94	100	120	3.45234	\N	0	\N	0.5	2013-01-14 01:00:00+00
EWR	2013	1	13	21	48.02	48.02	100	0	0	\N	0	1016.4	0.5	2013-01-14 02:00:00+00
EWR	2013	1	13	22	48.02	48.02	100	0	0	\N	0	1016.5	0.5	2013-01-14 03:00:00+00
EWR	2013	1	13	23	48.02	48.02	100	0	0	\N	0	1016.4	0.5	2013-01-14 04:00:00+00
EWR	2013	1	14	0	48.92	48.2	100	0	0	\N	0	\N	0.5	2013-01-14 05:00:00+00
EWR	2013	1	14	1	48.92	48.92	100	0	0	\N	0	1015.9	0.5	2013-01-14 06:00:00+00
EWR	2013	1	14	2	48.92	48.92	100	0	0	\N	0	1016	0.5	2013-01-14 07:00:00+00
EWR	2013	1	14	3	48.92	48.92	100	0	0	\N	0	1015.7	0.5	2013-01-14 08:00:00+00
EWR	2013	1	14	4	50	48.92	100	0	0	\N	0	\N	0.5	2013-01-14 09:00:00+00
EWR	2013	1	14	5	48.92	48.92	100	140	3.45234	\N	0	1014	0.5	2013-01-14 10:00:00+00
EWR	2013	1	14	6	51.08	51.08	100	\N	3.45234	18.41248	0	1016	0.5	2013-01-14 11:00:00+00
EWR	2013	1	14	7	51.8	51.8	100	290	6.90468	\N	0	\N	2.5	2013-01-14 12:00:00+00
EWR	2013	1	14	8	51.98	51.08	96.73	260	4.60312	\N	0	1017.7	2.5	2013-01-14 13:00:00+00
EWR	2013	1	14	9	53.6	51.98	100	250	5.7539	\N	0	\N	6	2013-01-14 14:00:00+00
EWR	2013	1	14	10	55.94	53.06	90.03	270	5.7539	\N	0	1018.6	8	2013-01-14 15:00:00+00
EWR	2013	1	14	11	57.92	50	74.86	320	11.5078	\N	0	1018.6	9	2013-01-14 16:00:00+00
EWR	2013	1	14	12	55.94	44.96	66.52	340	11.5078	\N	0	1018.3	10	2013-01-14 17:00:00+00
EWR	2013	1	14	13	57.02	44.06	61.81	320	10.35702	17.2617	0	1019	10	2013-01-14 18:00:00+00
EWR	2013	1	14	14	55.94	37.94	50.72	340	12.65858	20.71404	0	1020	10	2013-01-14 19:00:00+00
EWR	2013	1	14	15	55.04	39.02	54.67	350	13.80936	\N	0	1020.8	10	2013-01-14 20:00:00+00
EWR	2013	1	14	16	53.06	30.92	42.58	320	14.96014	27.61872	0	1021	10	2013-01-14 21:00:00+00
EWR	2013	1	14	17	51.08	30.92	45.81	330	10.35702	\N	0	1021.8	10	2013-01-14 22:00:00+00
EWR	2013	1	14	18	51.08	30.02	44.16	330	11.5078	18.41248	0	1022.4	10	2013-01-14 23:00:00+00
EWR	2013	1	14	19	48.92	28.04	44.14	320	11.5078	\N	0	1024.5	10	2013-01-15 00:00:00+00
EWR	2013	1	14	20	48.02	26.96	43.67	330	12.65858	\N	0	1024.6	10	2013-01-15 01:00:00+00
EWR	2013	1	14	21	44.06	30.92	59.64	330	17.2617	\N	0	1025.1	10	2013-01-15 02:00:00+00
EWR	2013	1	14	22	41	35.06	79.21	340	11.5078	\N	0.04	1025.5	10	2013-01-15 03:00:00+00
EWR	2013	1	14	23	41	35.96	82.09	350	8.05546	\N	0.02	1025.7	10	2013-01-15 04:00:00+00
EWR	2013	1	15	0	39.92	35.96	85.61	50	4.60312	\N	0.02	1024.8	10	2013-01-15 05:00:00+00
EWR	2013	1	15	1	37.94	35.06	89.25	30	9.20624	\N	0.03	1025.3	10	2013-01-15 06:00:00+00
EWR	2013	1	15	2	37.4	35.6	93.14	50	12.65858	\N	0.04	\N	9	2013-01-15 07:00:00+00
EWR	2013	1	15	3	37.4	35.6	93.14	50	10.35702	\N	0	\N	10	2013-01-15 08:00:00+00
EWR	2013	1	15	4	35.96	32	85.37	360	8.05546	\N	0	1024.9	10	2013-01-15 09:00:00+00
EWR	2013	1	15	5	35.96	30.92	81.72	360	10.35702	\N	0	1025.2	10	2013-01-15 10:00:00+00
EWR	2013	1	15	6	37.04	30.02	75.5	360	8.05546	\N	0	1026	10	2013-01-15 11:00:00+00
EWR	2013	1	15	7	37.04	28.04	69.63	10	9.20624	\N	0	1026.5	10	2013-01-15 12:00:00+00
EWR	2013	1	15	8	37.04	28.04	69.63	10	12.65858	\N	0	1027.4	10	2013-01-15 13:00:00+00
EWR	2013	1	15	9	37.04	26.96	66.6	10	13.80936	\N	0	1027.2	10	2013-01-15 14:00:00+00
EWR	2013	1	15	10	37.04	26.06	64.17	20	10.35702	\N	0	1027.7	10	2013-01-15 15:00:00+00
EWR	2013	1	15	11	39.02	24.98	56.77	360	11.5078	\N	0	1026.8	10	2013-01-15 16:00:00+00
EWR	2013	1	15	12	39.02	26.06	59.37	20	8.05546	\N	0	1025.4	10	2013-01-15 17:00:00+00
EWR	2013	1	15	13	39.02	24.98	56.77	330	8.05546	\N	0	1025.2	10	2013-01-15 18:00:00+00
EWR	2013	1	15	14	39.02	26.06	59.37	350	9.20624	\N	0	1024.9	10	2013-01-15 19:00:00+00
EWR	2013	1	15	15	39.02	26.06	59.37	350	9.20624	\N	0	1025.4	10	2013-01-15 20:00:00+00
EWR	2013	1	15	16	39.02	24.98	56.77	340	8.05546	\N	0	1025.5	10	2013-01-15 21:00:00+00
EWR	2013	1	15	17	39.02	26.06	59.37	360	8.05546	\N	0	1025.1	10	2013-01-15 22:00:00+00
EWR	2013	1	15	18	39.02	26.06	59.37	360	5.7539	\N	0	1025.7	10	2013-01-15 23:00:00+00
EWR	2013	1	15	19	37.94	26.06	61.94	10	4.60312	\N	0	1025	10	2013-01-16 00:00:00+00
EWR	2013	1	15	20	37.94	24.98	59.22	20	6.90468	\N	0	1025.3	10	2013-01-16 01:00:00+00
EWR	2013	1	15	21	37.94	26.96	64.29	30	5.7539	\N	0	1024.1	10	2013-01-16 02:00:00+00
EWR	2013	1	15	22	37.04	28.94	72.24	20	8.05546	\N	0	1023.7	9	2013-01-16 03:00:00+00
EWR	2013	1	15	23	35.96	30.02	78.79	20	9.20624	\N	0.02	1023.3	8	2013-01-16 04:00:00+00
EWR	2013	1	16	0	33.98	30.92	88.42	20	10.35702	\N	0.05	1023.1	6	2013-01-16 05:00:00+00
EWR	2013	1	16	1	33.08	30.92	91.66	20	12.65858	\N	0.07	1021.9	6	2013-01-16 06:00:00+00
EWR	2013	1	16	2	33.08	30.92	91.66	20	10.35702	\N	0.06	1021.6	5	2013-01-16 07:00:00+00
EWR	2013	1	16	3	33.08	32	95.75	360	11.5078	\N	0.13	1020.3	4	2013-01-16 08:00:00+00
EWR	2013	1	16	4	32	32	100	20	8.05546	\N	0.15	\N	4	2013-01-16 09:00:00+00
EWR	2013	1	16	5	32	32	100	20	5.7539	\N	0.09	1018.7	4	2013-01-16 10:00:00+00
EWR	2013	1	16	6	33.8	32	95.75	10	6.90468	\N	0.06	\N	4	2013-01-16 11:00:00+00
EWR	2013	1	16	7	33.8	32	95.75	30	8.05546	\N	0.03	\N	2	2013-01-16 12:00:00+00
EWR	2013	1	16	8	33.8	32	95.75	40	8.05546	\N	0.02	\N	3	2013-01-16 13:00:00+00
EWR	2013	1	16	9	33.98	33.08	96.46	340	6.90468	\N	0	1015.2	3	2013-01-16 14:00:00+00
EWR	2013	1	16	10	33.98	32	92.36	350	5.7539	\N	0.01	1015.5	3	2013-01-16 15:00:00+00
EWR	2013	1	16	11	33.98	33.08	96.46	330	5.7539	\N	0.02	1014.3	3	2013-01-16 16:00:00+00
EWR	2013	1	16	12	33.98	33.08	96.46	30	5.7539	\N	0	1012.2	3	2013-01-16 17:00:00+00
EWR	2013	1	16	13	35.06	33.08	92.4	70	5.7539	\N	0.01	1009	3	2013-01-16 18:00:00+00
EWR	2013	1	16	14	35.6	33.98	95.79	360	11.5078	\N	0	\N	3	2013-01-16 19:00:00+00
EWR	2013	1	16	15	35.96	33.98	93.08	\N	6.90468	\N	0	\N	6	2013-01-16 20:00:00+00
EWR	2013	1	16	16	35.06	33.98	95.79	\N	5.7539	\N	0	1012.9	6	2013-01-16 21:00:00+00
EWR	2013	1	16	17	35.96	33.98	93.08	230	8.05546	\N	0	\N	6	2013-01-16 22:00:00+00
EWR	2013	1	16	18	35.96	33.98	92.43	210	10.35702	\N	0	1012.6	7	2013-01-16 23:00:00+00
EWR	2013	1	16	19	35.96	33.98	93.08	240	12.65858	\N	0	\N	8	2013-01-17 00:00:00+00
EWR	2013	1	16	20	37.4	33.98	88.57	250	12.65858	\N	0	\N	9	2013-01-17 01:00:00+00
EWR	2013	1	16	21	37.4	33.98	88.57	250	10.35702	\N	0	\N	10	2013-01-17 02:00:00+00
EWR	2013	1	16	22	35.96	33.98	92.43	230	9.20624	\N	0	1013.1	10	2013-01-17 03:00:00+00
EWR	2013	1	16	23	37.04	33.98	88.57	250	6.90468	\N	0	1013.2	10	2013-01-17 04:00:00+00
EWR	2013	1	17	0	37.94	33.08	82.46	250	9.20624	\N	0	1013.6	10	2013-01-17 05:00:00+00
EWR	2013	1	17	1	39.02	32	75.69	250	10.35702	\N	0	1013.7	10	2013-01-17 06:00:00+00
EWR	2013	1	17	2	37.94	33.08	82.46	220	10.35702	\N	0	1014.2	10	2013-01-17 07:00:00+00
EWR	2013	1	17	3	37.94	33.08	82.46	230	9.20624	\N	0	1013.9	10	2013-01-17 08:00:00+00
EWR	2013	1	17	4	39.02	30.92	72.46	260	6.90468	\N	0	1013.5	10	2013-01-17 09:00:00+00
EWR	2013	1	17	5	39.02	30.02	69.86	270	9.20624	\N	0	1014.5	10	2013-01-17 10:00:00+00
EWR	2013	1	17	6	37.94	30.02	72.87	270	8.05546	\N	0	1015.8	10	2013-01-17 11:00:00+00
EWR	2013	1	17	7	39.02	28.04	64.43	310	9.20624	\N	0	1016.7	10	2013-01-17 12:00:00+00
EWR	2013	1	17	8	39.02	28.04	64.43	280	8.05546	\N	0	1017.9	10	2013-01-17 13:00:00+00
EWR	2013	1	17	9	42.08	28.94	59.36	270	6.90468	\N	0	1018.1	10	2013-01-17 14:00:00+00
EWR	2013	1	17	10	42.08	28.04	57.22	310	12.65858	\N	0	1018.2	10	2013-01-17 15:00:00+00
EWR	2013	1	17	11	42.98	26.96	52.87	300	11.5078	\N	0	1017.7	10	2013-01-17 16:00:00+00
EWR	2013	1	17	12	46.04	26.96	47.05	330	12.65858	\N	0	1017.5	10	2013-01-17 17:00:00+00
EWR	2013	1	17	13	44.06	26.06	48.87	300	11.5078	\N	0	1017.5	10	2013-01-17 18:00:00+00
EWR	2013	1	17	14	42.98	24.98	48.7	300	12.65858	\N	0	1017.4	10	2013-01-17 19:00:00+00
EWR	2013	1	17	15	42.98	24.98	48.7	320	8.05546	17.2617	0	1017.7	10	2013-01-17 20:00:00+00
EWR	2013	1	17	16	42.08	24.08	48.56	350	9.20624	\N	0	1018.3	10	2013-01-17 21:00:00+00
EWR	2013	1	17	17	41	24.98	52.56	360	6.90468	\N	0	1018.4	10	2013-01-17 22:00:00+00
EWR	2013	1	17	18	41	24.08	50.63	\N	3.45234	\N	0	1019	10	2013-01-17 23:00:00+00
EWR	2013	1	17	19	41	24.98	52.56	310	5.7539	\N	0	1018.8	10	2013-01-18 00:00:00+00
EWR	2013	1	17	20	39.02	23	52.26	350	11.5078	\N	0	1018	10	2013-01-18 01:00:00+00
EWR	2013	1	17	21	37.94	24.98	59.22	360	13.80936	\N	0	1017.7	10	2013-01-18 02:00:00+00
EWR	2013	1	17	22	37.04	23	56.48	360	9.20624	\N	0	1016.6	10	2013-01-18 03:00:00+00
EWR	2013	1	17	23	35.96	26.06	66.97	30	9.20624	\N	0	1016.9	10	2013-01-18 04:00:00+00
EWR	2013	1	18	0	35.06	23	61.08	40	10.35702	\N	0	1016.9	10	2013-01-18 05:00:00+00
EWR	2013	1	18	1	33.08	21.92	63.17	20	12.65858	\N	0	1018.3	10	2013-01-18 06:00:00+00
EWR	2013	1	18	2	30.92	19.04	60.97	10	12.65858	\N	0	1019.2	10	2013-01-18 07:00:00+00
EWR	2013	1	18	3	30.02	17.06	58.08	20	9.20624	\N	0	1019.2	10	2013-01-18 08:00:00+00
EWR	2013	1	18	4	30.02	17.06	58.08	360	5.7539	\N	0	1020.5	10	2013-01-18 09:00:00+00
EWR	2013	1	18	5	30.02	15.98	55.42	340	12.65858	\N	0	1022.5	10	2013-01-18 10:00:00+00
EWR	2013	1	18	6	28.94	15.08	55.69	350	12.65858	\N	0	1024.3	10	2013-01-18 11:00:00+00
EWR	2013	1	18	7	28.04	12.92	52.57	330	21.86482	32.22184	0	1026.3	10	2013-01-18 12:00:00+00
EWR	2013	1	18	8	28.04	8.06	42.32	340	16.11092	24.16638	0	1028	10	2013-01-18 13:00:00+00
EWR	2013	1	18	9	28.94	6.98	38.85	310	16.11092	26.46794	0	1030.1	10	2013-01-18 14:00:00+00
EWR	2013	1	18	10	30.02	5	33.97	330	14.96014	\N	0	1030.6	10	2013-01-18 15:00:00+00
EWR	2013	1	18	11	30.92	6.98	35.84	300	12.65858	21.86482	0	1030.6	10	2013-01-18 16:00:00+00
EWR	2013	1	18	12	30.92	5	32.75	300	10.35702	\N	0	1030.3	10	2013-01-18 17:00:00+00
EWR	2013	1	18	13	30.92	1.94	28.44	340	16.11092	24.16638	0	1030.7	10	2013-01-18 18:00:00+00
EWR	2013	1	18	14	30.92	3.02	29.9	330	9.20624	16.11092	0	1030.6	10	2013-01-18 19:00:00+00
EWR	2013	1	18	15	30.92	1.94	28.44	310	10.35702	\N	0	1030.8	10	2013-01-18 20:00:00+00
EWR	2013	1	18	16	28.94	1.94	30.82	270	10.35702	\N	0	1031.5	10	2013-01-18 21:00:00+00
EWR	2013	1	18	17	28.94	3.02	32.41	250	8.05546	\N	0	1032.2	10	2013-01-18 22:00:00+00
EWR	2013	1	18	18	26.96	5	38.5	220	5.7539	\N	0	1032.3	10	2013-01-18 23:00:00+00
EWR	2013	1	18	19	28.04	8.06	42.32	200	8.05546	\N	0	1032.3	10	2013-01-19 00:00:00+00
EWR	2013	1	18	20	28.94	8.96	42.48	180	8.05546	\N	0	1031.5	10	2013-01-19 01:00:00+00
EWR	2013	1	18	21	28.04	10.94	48.15	210	6.90468	\N	0	1031.7	10	2013-01-19 02:00:00+00
EWR	2013	1	18	22	28.94	10.94	46.41	190	8.05546	\N	0	1030.8	10	2013-01-19 03:00:00+00
EWR	2013	1	18	23	28.94	12.02	48.69	180	9.20624	\N	0	1029.4	10	2013-01-19 04:00:00+00
EWR	2013	1	19	0	28.04	12.92	52.57	190	10.35702	\N	0	1029.4	10	2013-01-19 05:00:00+00
EWR	2013	1	19	1	28.04	12.02	50.52	210	11.5078	\N	0	1029.2	10	2013-01-19 06:00:00+00
EWR	2013	1	19	2	28.94	14	53.13	200	13.80936	\N	0	1028.5	10	2013-01-19 07:00:00+00
EWR	2013	1	19	3	30.02	15.98	55.42	200	13.80936	\N	0	1027.4	10	2013-01-19 08:00:00+00
EWR	2013	1	19	4	28.94	17.06	60.69	210	9.20624	\N	0	1027.1	10	2013-01-19 09:00:00+00
EWR	2013	1	19	5	30.02	19.04	63.24	220	10.35702	\N	0	1026.5	10	2013-01-19 10:00:00+00
EWR	2013	1	19	6	30.92	21.02	66.34	210	10.35702	\N	0	1026.3	10	2013-01-19 11:00:00+00
EWR	2013	1	19	7	32	21.92	65.97	230	13.80936	\N	0	1026	10	2013-01-19 12:00:00+00
EWR	2013	1	19	8	35.06	24.08	63.91	210	18.41248	24.16638	0	1025.8	10	2013-01-19 13:00:00+00
EWR	2013	1	19	9	37.94	24.98	59.22	220	17.2617	\N	0	1025.4	10	2013-01-19 14:00:00+00
EWR	2013	1	19	10	42.98	24.98	48.7	220	23.0156	28.7695	0	1024.1	10	2013-01-19 15:00:00+00
EWR	2013	1	19	11	46.04	24.98	43.34	230	20.71404	\N	0	1022	10	2013-01-19 16:00:00+00
EWR	2013	1	19	12	48.02	24.98	40.22	220	23.0156	27.61872	0	1020.4	10	2013-01-19 17:00:00+00
EWR	2013	1	19	13	50	24.08	35.98	220	18.41248	27.61872	0	1019.4	10	2013-01-19 18:00:00+00
EWR	2013	1	19	14	51.08	23	33.04	220	19.56326	25.31716	0	1018.7	10	2013-01-19 19:00:00+00
EWR	2013	1	19	15	51.98	23	31.96	220	19.56326	25.31716	0	1018.1	10	2013-01-19 20:00:00+00
EWR	2013	1	19	16	50	26.06	39.07	200	12.65858	\N	0	1017.6	10	2013-01-19 21:00:00+00
EWR	2013	1	19	17	48.02	26.96	43.67	200	13.80936	\N	0	1017.5	10	2013-01-19 22:00:00+00
EWR	2013	1	19	18	46.94	26.96	45.48	200	14.96014	23.0156	0	1017.2	10	2013-01-19 23:00:00+00
EWR	2013	1	19	19	46.94	26.96	45.48	210	12.65858	24.16638	0	1016.9	10	2013-01-20 00:00:00+00
EWR	2013	1	19	20	44.96	26.96	49.02	210	18.41248	\N	0	1016.1	10	2013-01-20 01:00:00+00
EWR	2013	1	19	21	44.96	26.96	49.02	210	18.41248	26.46794	0	1015.3	10	2013-01-20 02:00:00+00
EWR	2013	1	19	22	44.06	28.04	53.03	220	17.2617	23.0156	0	1014.4	10	2013-01-20 03:00:00+00
EWR	2013	1	19	23	42.98	28.04	55.27	220	16.11092	25.31716	0	1013.4	10	2013-01-20 04:00:00+00
EWR	2013	1	20	0	41	28.04	59.65	200	11.5078	\N	0	1012.1	10	2013-01-20 05:00:00+00
EWR	2013	1	20	1	39.92	28.94	64.54	190	9.20624	\N	0	1011.3	10	2013-01-20 06:00:00+00
EWR	2013	1	20	2	39.02	28.94	66.85	220	10.35702	\N	0	1010.9	10	2013-01-20 07:00:00+00
EWR	2013	1	20	3	37.04	28.94	72.24	200	6.90468	\N	0	1010.1	10	2013-01-20 08:00:00+00
EWR	2013	1	20	4	39.02	28.94	66.85	180	4.60312	\N	0	1008.9	10	2013-01-20 09:00:00+00
EWR	2013	1	20	5	39.02	28.94	66.85	200	9.20624	\N	0	1008.1	10	2013-01-20 10:00:00+00
EWR	2013	1	20	6	39.02	28.94	66.85	200	8.05546	\N	0	1007.5	10	2013-01-20 11:00:00+00
EWR	2013	1	20	7	39.92	28.94	64.54	220	9.20624	\N	0	1007.3	10	2013-01-20 12:00:00+00
EWR	2013	1	20	8	44.96	28.04	51.24	230	11.5078	\N	0	1007.6	10	2013-01-20 13:00:00+00
EWR	2013	1	20	9	48.92	28.04	44.14	230	16.11092	24.16638	0	1007.5	10	2013-01-20 14:00:00+00
EWR	2013	1	20	10	53.96	28.04	36.63	240	19.56326	29.92028	0	1006.9	10	2013-01-20 15:00:00+00
EWR	2013	1	20	11	53.96	26.96	35.04	250	19.56326	41.42808	0	1006	10	2013-01-20 16:00:00+00
EWR	2013	1	20	12	55.94	24.08	28.93	260	20.71404	39.12652	0	1005.5	10	2013-01-20 17:00:00+00
EWR	2013	1	20	13	53.96	19.04	25.12	260	25.31716	34.5234	0	1006	10	2013-01-20 18:00:00+00
EWR	2013	1	20	14	53.06	14	20.87	250	26.46794	37.97574	0	1006.9	10	2013-01-20 19:00:00+00
EWR	2013	1	20	15	51.98	14	21.72	290	23.0156	31.07106	0	1008.3	10	2013-01-20 20:00:00+00
EWR	2013	1	20	16	48.02	10.94	21.98	290	21.86482	32.22184	0	1009.8	10	2013-01-20 21:00:00+00
EWR	2013	1	20	17	44.06	10.04	24.53	280	19.56326	34.5234	0	1011.5	10	2013-01-20 22:00:00+00
EWR	2013	1	20	18	42.08	12.92	30.08	290	21.86482	29.92028	0	1012.7	10	2013-01-20 23:00:00+00
EWR	2013	1	20	19	39.02	12.02	32.55	300	14.96014	23.0156	0	1014	10	2013-01-21 00:00:00+00
EWR	2013	1	20	20	37.04	14	38.38	310	17.2617	26.46794	0	1015.3	10	2013-01-21 01:00:00+00
EWR	2013	1	20	21	33.98	12.02	39.72	310	12.65858	\N	0	1015.9	10	2013-01-21 02:00:00+00
EWR	2013	1	20	22	32	10.94	40.99	310	16.11092	\N	0	1016.9	10	2013-01-21 03:00:00+00
EWR	2013	1	20	23	30.02	10.04	42.66	320	12.65858	18.41248	0	1017.6	10	2013-01-21 04:00:00+00
EWR	2013	1	21	0	28.94	8.06	40.79	310	11.5078	\N	0	1017.8	10	2013-01-21 05:00:00+00
EWR	2013	1	21	1	28.04	8.06	42.32	320	8.05546	\N	0	1018.6	10	2013-01-21 06:00:00+00
EWR	2013	1	21	2	28.04	6.98	40.31	290	8.05546	\N	0	1018.7	10	2013-01-21 07:00:00+00
EWR	2013	1	21	3	26.96	6.08	40.45	250	5.7539	\N	0	1018.8	10	2013-01-21 08:00:00+00
EWR	2013	1	21	4	26.06	6.98	43.74	240	5.7539	\N	0	1018.8	10	2013-01-21 09:00:00+00
EWR	2013	1	21	5	26.96	8.96	46.08	250	6.90468	\N	0	1018.8	10	2013-01-21 10:00:00+00
EWR	2013	1	21	6	26.06	8.96	47.82	260	6.90468	\N	0	1019	10	2013-01-21 11:00:00+00
EWR	2013	1	21	7	26.06	8.96	47.82	270	3.45234	\N	0	1019	10	2013-01-21 12:00:00+00
EWR	2013	1	21	8	26.96	8.06	44.25	260	5.7539	\N	0	1019.1	10	2013-01-21 13:00:00+00
EWR	2013	1	21	9	28.04	8.96	44.07	230	3.45234	\N	0	1019.2	10	2013-01-21 14:00:00+00
EWR	2013	1	21	10	28.94	8.96	42.48	0	0	\N	0	1018.3	10	2013-01-21 15:00:00+00
EWR	2013	1	21	11	30.02	8.96	40.65	180	6.90468	\N	0	1016.8	10	2013-01-21 16:00:00+00
EWR	2013	1	21	12	30.92	10.04	41.13	170	8.05546	\N	0	1015.2	10	2013-01-21 17:00:00+00
EWR	2013	1	21	13	32	10.04	39.38	240	9.20624	\N	0	1014.7	10	2013-01-21 18:00:00+00
EWR	2013	1	21	14	32	10.94	40.99	190	8.05546	\N	0	1014	10	2013-01-21 19:00:00+00
EWR	2013	1	21	15	30.92	12.02	44.92	200	6.90468	\N	0	1012.8	10	2013-01-21 20:00:00+00
EWR	2013	1	21	16	32	12.02	43	0	0	\N	0	1012.2	10	2013-01-21 21:00:00+00
EWR	2013	1	21	17	32	12.92	44.74	160	3.45234	\N	0	1012.3	10	2013-01-21 22:00:00+00
EWR	2013	1	21	18	32	12.92	44.74	0	0	\N	0	1011.6	10	2013-01-21 23:00:00+00
EWR	2013	1	21	19	32	14	46.92	300	8.05546	\N	0	1011.9	10	2013-01-22 00:00:00+00
EWR	2013	1	21	20	30.02	17.06	58.08	330	9.20624	\N	0	1011.8	10	2013-01-22 01:00:00+00
EWR	2013	1	21	21	30.02	15.98	55.42	260	9.20624	\N	0	1011.4	10	2013-01-22 02:00:00+00
EWR	2013	1	21	22	28.04	17.06	62.97	300	16.11092	\N	0	1010.7	10	2013-01-22 03:00:00+00
EWR	2013	1	21	23	26.96	12.92	54.95	290	12.65858	\N	0	1010.7	10	2013-01-22 04:00:00+00
EWR	2013	1	22	0	26.06	6.08	41.98	290	10.35702	19.56326	0	1010.7	10	2013-01-22 05:00:00+00
EWR	2013	1	22	1	24.98	6.98	45.74	270	13.80936	18.41248	0	1011.4	10	2013-01-22 06:00:00+00
EWR	2013	1	22	2	24.08	6.98	47.49	280	18.41248	26.46794	0	1011.8	10	2013-01-22 07:00:00+00
EWR	2013	1	22	3	23	6.98	49.69	280	16.11092	25.31716	0	1012.3	10	2013-01-22 08:00:00+00
EWR	2013	1	22	4	21.02	6.98	54.03	290	16.11092	\N	0	1013.4	10	2013-01-22 09:00:00+00
EWR	2013	1	22	5	19.94	6.08	54.3	290	14.96014	21.86482	0	1014.5	10	2013-01-22 10:00:00+00
EWR	2013	1	22	6	19.94	5	51.68	280	13.80936	\N	0	1015.4	10	2013-01-22 11:00:00+00
EWR	2013	1	22	7	19.94	6.8	57.41	280	16.11092	\N	0	\N	9	2013-01-22 12:00:00+00
EWR	2013	1	22	8	21.02	3.02	45.07	280	24.16638	29.92028	0	1017.3	10	2013-01-22 13:00:00+00
EWR	2013	1	22	9	21.02	-2.02	35.6	300	24.16638	35.67418	0	1017.6	10	2013-01-22 14:00:00+00
EWR	2013	1	22	10	21.92	-2.92	32.83	270	18.41248	28.7695	0	1017.8	10	2013-01-22 15:00:00+00
EWR	2013	1	22	11	23	-5.98	27.09	300	21.86482	32.22184	0	1017.3	10	2013-01-22 16:00:00+00
EWR	2013	1	22	12	23	-7.06	25.71	270	25.31716	33.37262	0	1016.8	10	2013-01-22 17:00:00+00
EWR	2013	1	22	13	23	-5.98	27.09	290	19.56326	26.46794	0	1016.9	10	2013-01-22 18:00:00+00
EWR	2013	1	22	14	23	-5.98	27.09	280	19.56326	27.61872	0	1017.3	10	2013-01-22 19:00:00+00
EWR	2013	1	22	15	21.02	-7.06	27.95	290	21.86482	29.92028	0	1018.1	10	2013-01-22 20:00:00+00
EWR	2013	1	22	16	19.04	-5.98	32.05	290	14.96014	26.46794	0	1019.1	10	2013-01-22 21:00:00+00
EWR	2013	1	22	17	19.04	-5.08	33.47	280	13.80936	\N	0	1020.3	10	2013-01-22 22:00:00+00
EWR	2013	1	22	18	17.96	-5.08	35.05	280	19.56326	24.16638	0	1021	10	2013-01-22 23:00:00+00
EWR	2013	1	22	19	17.06	-5.98	34.89	290	20.71404	26.46794	0	1021.7	10	2013-01-23 00:00:00+00
EWR	2013	1	22	20	15.98	-5.98	36.56	290	21.86482	27.61872	0	1022.2	10	2013-01-23 01:00:00+00
EWR	2013	1	22	21	15.98	-0.94	46.51	300	14.96014	21.86482	0	1022.7	10	2013-01-23 02:00:00+00
EWR	2013	1	22	22	15.08	-7.06	36.09	300	16.11092	23.0156	0	1023.3	10	2013-01-23 03:00:00+00
EWR	2013	1	22	23	14	-7.96	36.21	280	14.96014	21.86482	0	1023.1	10	2013-01-23 04:00:00+00
EWR	2013	1	23	0	12.92	-7.06	39.67	280	12.65858	21.86482	0	1022.9	10	2013-01-23 05:00:00+00
EWR	2013	1	23	1	12.92	-7.96	37.97	270	11.5078	\N	0	1023.3	10	2013-01-23 06:00:00+00
EWR	2013	1	23	2	12.02	-7.06	41.28	270	10.35702	18.41248	0	1023.7	10	2013-01-23 07:00:00+00
EWR	2013	1	23	3	12.02	-5.98	43.5	270	8.05546	\N	0	1023.5	10	2013-01-23 08:00:00+00
EWR	2013	1	23	4	12.02	-5.08	45.43	270	9.20624	\N	0	1023.6	10	2013-01-23 09:00:00+00
EWR	2013	1	23	5	10.94	-4	50.19	270	10.35702	\N	0	1023.8	10	2013-01-23 10:00:00+00
EWR	2013	1	23	6	10.94	-4	50.19	270	11.5078	\N	0	1024	10	2013-01-23 11:00:00+00
EWR	2013	1	23	7	12.02	-2.92	50.37	270	11.5078	\N	0	1024.2	10	2013-01-23 12:00:00+00
EWR	2013	1	23	8	14	-2.02	48.18	270	12.65858	\N	0	1024.5	10	2013-01-23 13:00:00+00
EWR	2013	1	23	9	15.98	-2.02	44.19	270	11.5078	\N	0	1024.9	10	2013-01-23 14:00:00+00
EWR	2013	1	23	10	17.96	-5.08	35.05	310	14.96014	20.71404	0	1024.4	10	2013-01-23 15:00:00+00
EWR	2013	1	23	11	19.94	-5.98	30.84	320	12.65858	17.2617	0	1023.4	10	2013-01-23 16:00:00+00
EWR	2013	1	23	12	19.94	-5.98	30.84	300	13.80936	\N	0	1022.3	10	2013-01-23 17:00:00+00
EWR	2013	1	23	13	19.94	-4	33.92	290	11.5078	\N	0	1021.8	10	2013-01-23 18:00:00+00
EWR	2013	1	23	14	19.04	-5.98	32.05	270	17.2617	21.86482	0	1021.8	10	2013-01-23 19:00:00+00
EWR	2013	1	23	15	19.04	-5.98	32.05	300	14.96014	20.71404	0	1021.9	10	2013-01-23 20:00:00+00
EWR	2013	1	23	16	17.96	-5.98	33.57	310	11.5078	\N	0	1022.1	10	2013-01-23 21:00:00+00
EWR	2013	1	23	17	17.06	-5.98	34.89	280	12.65858	\N	0	1022.7	10	2013-01-23 22:00:00+00
EWR	2013	1	23	18	17.06	-4	38.38	300	8.05546	\N	0	1023.1	10	2013-01-23 23:00:00+00
EWR	2013	1	23	19	15.98	-2.02	44.19	310	5.7539	\N	0	1023	10	2013-01-24 00:00:00+00
EWR	2013	1	23	20	15.98	-0.04	48.52	300	8.05546	\N	0	1022.7	10	2013-01-24 01:00:00+00
EWR	2013	1	23	21	15.08	-0.04	50.46	270	5.7539	\N	0	1022.9	10	2013-01-24 02:00:00+00
EWR	2013	1	23	22	15.08	-0.04	50.46	280	4.60312	\N	0	1022.9	10	2013-01-24 03:00:00+00
EWR	2013	1	23	23	15.08	1.04	53.07	280	4.60312	\N	0	1022.5	10	2013-01-24 04:00:00+00
EWR	2013	1	24	0	14	-0.04	52.9	270	4.60312	\N	0	1021.6	10	2013-01-24 05:00:00+00
EWR	2013	1	24	1	14	1.04	55.64	310	3.45234	\N	0	1021	10	2013-01-24 06:00:00+00
EWR	2013	1	24	2	12.92	1.94	60.84	310	4.60312	\N	0	1020.7	10	2013-01-24 07:00:00+00
EWR	2013	1	24	3	12.02	1.94	63.31	30	4.60312	\N	0	1020.7	10	2013-01-24 08:00:00+00
EWR	2013	1	24	4	12.92	5	70.07	20	5.7539	\N	0	1020.8	10	2013-01-24 09:00:00+00
EWR	2013	1	24	5	14	3.02	61	350	5.7539	\N	0	1021.5	10	2013-01-24 10:00:00+00
EWR	2013	1	24	6	12.92	3.02	63.97	10	9.20624	\N	0	1022.2	10	2013-01-24 11:00:00+00
EWR	2013	1	24	7	14	3.02	61	350	9.20624	\N	0	1022.7	10	2013-01-24 12:00:00+00
EWR	2013	1	24	8	17.06	1.94	50.79	350	11.5078	\N	0	1023.3	10	2013-01-24 13:00:00+00
EWR	2013	1	24	9	19.04	-0.04	42.52	350	13.80936	\N	0	1023.8	10	2013-01-24 14:00:00+00
EWR	2013	1	24	10	21.92	-5.08	29.61	310	18.41248	21.86482	0	1024.2	10	2013-01-24 15:00:00+00
EWR	2013	1	24	11	23	-9.04	23.34	320	23.0156	32.22184	0	1024	10	2013-01-24 16:00:00+00
EWR	2013	1	24	12	24.08	-7.96	23.52	310	24.16638	34.5234	0	1023.8	10	2013-01-24 17:00:00+00
EWR	2013	1	24	13	24.08	-7.06	24.57	330	28.7695	40.2773	0	1024	10	2013-01-24 18:00:00+00
EWR	2013	1	24	14	24.08	-5.98	25.89	320	25.31716	35.67418	0	1024.9	10	2013-01-24 19:00:00+00
EWR	2013	1	24	15	24.08	-5.08	27.04	310	16.11092	29.92028	0	1025.8	10	2013-01-24 20:00:00+00
EWR	2013	1	24	16	21.92	-4	31.18	320	21.86482	28.7695	0	1026.6	10	2013-01-24 21:00:00+00
EWR	2013	1	24	17	21.02	-2.92	34.11	300	17.2617	26.46794	0	1027.6	10	2013-01-24 22:00:00+00
EWR	2013	1	24	18	19.94	-4	33.92	290	18.41248	32.22184	0	1028.5	10	2013-01-24 23:00:00+00
EWR	2013	1	24	19	19.04	-2.92	37.11	300	20.71404	27.61872	0	1029	10	2013-01-25 00:00:00+00
EWR	2013	1	24	20	17.96	-2.02	40.57	290	20.71404	35.67418	0	1028.6	10	2013-01-25 01:00:00+00
EWR	2013	1	24	21	17.96	-0.94	42.69	300	12.65858	27.61872	0	1029	10	2013-01-25 02:00:00+00
EWR	2013	1	24	22	17.06	-2.02	42.17	290	17.2617	35.67418	0	1029.5	10	2013-01-25 03:00:00+00
EWR	2013	1	24	23	15.98	-2.92	42.34	290	13.80936	20.71404	0	1029.7	10	2013-01-25 04:00:00+00
EWR	2013	1	25	0	15.08	-2.92	44.04	290	16.11092	23.0156	0	1029.7	10	2013-01-25 05:00:00+00
EWR	2013	1	25	1	14	-2.92	46.17	300	12.65858	20.71404	0	1030.3	10	2013-01-25 06:00:00+00
EWR	2013	1	25	2	14	-2.02	48.18	290	16.11092	\N	0	1030.3	10	2013-01-25 07:00:00+00
EWR	2013	1	25	3	12.92	-0.94	53.17	290	12.65858	23.0156	0	1030.4	10	2013-01-25 08:00:00+00
EWR	2013	1	25	4	12.92	-0.94	53.17	260	5.7539	\N	0	1030.3	10	2013-01-25 09:00:00+00
EWR	2013	1	25	5	12.92	-0.04	55.47	280	13.80936	\N	0	1030	10	2013-01-25 10:00:00+00
EWR	2013	1	25	6	12.92	1.04	58.34	280	6.90468	\N	0	1030	10	2013-01-25 11:00:00+00
EWR	2013	1	25	7	14	1.94	58.02	\N	4.60312	\N	0	1029.5	10	2013-01-25 12:00:00+00
EWR	2013	1	25	8	15.98	3.02	55.95	300	6.90468	\N	0	1029.9	10	2013-01-25 13:00:00+00
EWR	2013	1	25	9	17.96	3.02	51.36	280	6.90468	\N	0	1030.3	10	2013-01-25 14:00:00+00
EWR	2013	1	25	10	19.94	1.94	44.88	280	5.7539	\N	0	1029.3	10	2013-01-25 15:00:00+00
EWR	2013	1	25	11	21.02	1.94	42.87	10	4.60312	\N	0	1027	10	2013-01-25 16:00:00+00
EWR	2013	1	25	12	21.92	1.94	41.26	260	4.60312	\N	0	1026.1	10	2013-01-25 17:00:00+00
EWR	2013	1	25	13	23	1.04	37.81	240	4.60312	\N	0	1024.5	10	2013-01-25 18:00:00+00
EWR	2013	1	25	14	24.08	3.02	39.62	220	6.90468	\N	0	1023.7	10	2013-01-25 19:00:00+00
EWR	2013	1	25	15	24.08	3.02	39.62	220	8.05546	\N	0	1023.2	10	2013-01-25 20:00:00+00
EWR	2013	1	25	16	23	8.06	54.61	210	8.05546	\N	0	\N	1.5	2013-01-25 21:00:00+00
EWR	2013	1	25	17	21.2	15.98	85.63	240	11.5078	\N	0.01	\N	1.5	2013-01-25 22:00:00+00
EWR	2013	1	25	18	19.4	15.98	87.64	210	5.7539	\N	0.01	\N	1.5	2013-01-25 23:00:00+00
EWR	2013	1	25	19	19.4	15.8	85.63	250	9.20624	\N	0.02	\N	2	2013-01-26 00:00:00+00
EWR	2013	1	25	20	19.94	15.8	85.63	250	8.05546	\N	0	\N	7	2013-01-26 01:00:00+00
EWR	2013	1	25	21	17.96	14	85.51	260	6.90468	\N	0	\N	9	2013-01-26 02:00:00+00
EWR	2013	1	25	22	17.96	12.92	80.29	280	6.90468	\N	0	1018.6	9	2013-01-26 03:00:00+00
EWR	2013	1	25	23	17.06	12.92	83.47	250	4.60312	\N	0	1018.4	10	2013-01-26 04:00:00+00
EWR	2013	1	26	0	15.98	12.92	87.47	280	6.90468	\N	0	1018.4	10	2013-01-26 05:00:00+00
EWR	2013	1	26	1	15.08	12.02	87.42	290	8.05546	\N	0	1018.5	10	2013-01-26 06:00:00+00
EWR	2013	1	26	2	14	10.94	87.36	280	3.45234	\N	0	1018	10	2013-01-26 07:00:00+00
EWR	2013	1	26	3	14	10.04	83.92	290	5.7539	\N	0	1017.8	10	2013-01-26 08:00:00+00
EWR	2013	1	26	4	15.98	8.96	73.34	300	9.20624	\N	0	1018.1	10	2013-01-26 09:00:00+00
EWR	2013	1	26	5	15.08	8.96	76.27	300	9.20624	\N	0	1018.9	10	2013-01-26 10:00:00+00
EWR	2013	1	26	6	15.98	8.06	70.43	300	4.60312	\N	0	1019.5	10	2013-01-26 11:00:00+00
EWR	2013	1	26	7	17.06	8.06	67.21	300	6.90468	\N	0	1020.6	10	2013-01-26 12:00:00+00
EWR	2013	1	26	8	19.04	8.06	61.72	310	10.35702	\N	0	1021	10	2013-01-26 13:00:00+00
EWR	2013	1	26	9	19.94	8.96	61.85	310	10.35702	\N	0	1021.5	10	2013-01-26 14:00:00+00
EWR	2013	1	26	10	23	10.04	57.03	290	11.5078	\N	0	1021.7	10	2013-01-26 15:00:00+00
EWR	2013	1	26	11	23	10.04	57.03	290	11.5078	18.41248	0	1021.7	10	2013-01-26 16:00:00+00
EWR	2013	1	26	12	24.08	8.96	51.93	320	9.20624	\N	0	1020.6	10	2013-01-26 17:00:00+00
EWR	2013	1	26	13	26.96	10.04	48.36	290	13.80936	24.16638	0	1020.8	10	2013-01-26 18:00:00+00
EWR	2013	1	26	14	28.04	10.04	46.26	300	11.5078	\N	0	1021	10	2013-01-26 19:00:00+00
EWR	2013	1	26	15	28.04	6.98	40.31	300	16.11092	24.16638	0	1021.5	10	2013-01-26 20:00:00+00
EWR	2013	1	26	16	26.96	6.08	40.45	300	14.96014	21.86482	0	1022.2	10	2013-01-26 21:00:00+00
EWR	2013	1	26	17	24.98	5	41.8	320	19.56326	28.7695	0	1023.7	10	2013-01-26 22:00:00+00
EWR	2013	1	26	18	24.08	5	43.4	320	14.96014	27.61872	0	1025	10	2013-01-26 23:00:00+00
EWR	2013	1	26	19	23	6.08	47.7	310	13.80936	\N	0	1025.5	10	2013-01-27 00:00:00+00
EWR	2013	1	26	20	23	6.08	47.7	320	17.2617	24.16638	0	1026.5	10	2013-01-27 01:00:00+00
EWR	2013	1	26	21	21.92	6.98	52.01	320	13.80936	\N	0	1027.5	10	2013-01-27 02:00:00+00
EWR	2013	1	26	22	21.02	6.98	54.03	320	12.65858	\N	0	1028.5	10	2013-01-27 03:00:00+00
EWR	2013	1	26	23	19.94	6.98	56.56	300	10.35702	\N	0	1028.8	10	2013-01-27 04:00:00+00
EWR	2013	1	27	0	19.04	8.06	61.72	290	8.05546	\N	0	1029.1	10	2013-01-27 05:00:00+00
EWR	2013	1	27	1	19.04	8.06	61.72	290	9.20624	\N	0	1030	10	2013-01-27 06:00:00+00
EWR	2013	1	27	2	19.04	8.96	64.28	290	8.05546	\N	0.33	1030.3	10	2013-01-27 07:00:00+00
EWR	2013	1	27	3	19.04	8.96	64.28	280	6.90468	\N	0.03	1030.3	10	2013-01-27 08:00:00+00
EWR	2013	1	27	4	19.04	8.96	64.28	260	8.05546	\N	0.05	1030.4	10	2013-01-27 09:00:00+00
EWR	2013	1	27	5	19.04	8.06	61.72	270	6.90468	\N	0.26	1031.1	10	2013-01-27 10:00:00+00
EWR	2013	1	27	6	17.06	8.06	67.21	240	4.60312	\N	0.17	1031.6	10	2013-01-27 11:00:00+00
EWR	2013	1	27	7	19.04	8.96	64.28	260	8.05546	\N	0.32	1032.4	10	2013-01-27 12:00:00+00
EWR	2013	1	27	8	21.92	10.04	59.69	270	8.05546	\N	0	1032.6	10	2013-01-27 13:00:00+00
EWR	2013	1	27	9	26.96	12.92	54.95	310	11.5078	\N	0	1033.2	10	2013-01-27 14:00:00+00
EWR	2013	1	27	10	30.02	10.04	42.66	310	12.65858	\N	0	1033.7	10	2013-01-27 15:00:00+00
EWR	2013	1	27	11	32	8.96	37.52	340	14.96014	20.71404	0	1032.6	10	2013-01-27 16:00:00+00
EWR	2013	1	27	12	33.98	10.94	37.86	300	14.96014	\N	0	1032.1	10	2013-01-27 17:00:00+00
EWR	2013	1	27	13	35.06	8.96	33.19	300	12.65858	\N	0	1031.5	10	2013-01-27 18:00:00+00
EWR	2013	1	27	14	35.96	8.06	30.76	320	11.5078	\N	0	1031.4	10	2013-01-27 19:00:00+00
EWR	2013	1	27	15	35.96	8.06	30.76	280	8.05546	\N	0	1031.6	10	2013-01-27 20:00:00+00
EWR	2013	1	27	16	33.98	8.06	33.28	310	10.35702	17.2617	0	1032.3	10	2013-01-27 21:00:00+00
EWR	2013	1	27	17	33.08	8.06	34.5	320	6.90468	\N	0	1032.5	10	2013-01-27 22:00:00+00
EWR	2013	1	27	18	32	8.06	36.03	\N	3.45234	\N	0	1033	10	2013-01-27 23:00:00+00
EWR	2013	1	27	19	32	8.06	36.03	0	0	\N	0	1032.7	10	2013-01-28 00:00:00+00
EWR	2013	1	27	20	30.92	8.96	39.19	\N	4.60312	\N	0	1032.9	10	2013-01-28 01:00:00+00
EWR	2013	1	27	21	30.02	8.96	40.65	0	0	\N	0	1032.7	10	2013-01-28 02:00:00+00
EWR	2013	1	27	22	30.02	10.04	42.66	\N	3.45234	\N	0	1032.4	10	2013-01-28 03:00:00+00
EWR	2013	1	27	23	28.04	10.04	46.26	0	0	\N	0	1032.4	10	2013-01-28 04:00:00+00
EWR	2013	1	28	0	26.96	12.02	52.81	0	0	\N	0	1032.7	10	2013-01-28 05:00:00+00
EWR	2013	1	28	1	26.06	12.92	57.04	0	0	\N	0	1032.2	10	2013-01-28 06:00:00+00
EWR	2013	1	28	2	26.06	12.92	57.04	0	0	\N	0	1031.4	10	2013-01-28 07:00:00+00
EWR	2013	1	28	3	26.96	15.98	62.83	0	0	\N	0	1030.9	10	2013-01-28 08:00:00+00
EWR	2013	1	28	4	28.04	15.08	57.79	240	3.45234	\N	0	1030.5	10	2013-01-28 09:00:00+00
EWR	2013	1	28	5	28.04	15.98	60.1	0	0	\N	0	1029.8	10	2013-01-28 10:00:00+00
EWR	2013	1	28	6	30.02	17.06	58.08	0	0	\N	0	1029.7	10	2013-01-28 11:00:00+00
EWR	2013	1	28	7	30.02	19.04	63.24	160	4.60312	\N	0	1029.6	7	2013-01-28 12:00:00+00
EWR	2013	1	28	8	30.92	19.94	63.36	190	4.60312	\N	0	1029.5	6	2013-01-28 13:00:00+00
EWR	2013	1	28	9	30.2	26.06	85	230	6.90468	\N	0	\N	2	2013-01-28 14:00:00+00
EWR	2013	1	28	10	30.92	28.4	92.92	180	8.05546	\N	0	\N	2.5	2013-01-28 15:00:00+00
EWR	2013	1	28	11	33.8	28.94	86.39	200	10.35702	\N	0	\N	2.5	2013-01-28 16:00:00+00
EWR	2013	1	28	12	33.8	30.2	88.37	170	9.20624	\N	0	\N	2.5	2013-01-28 17:00:00+00
EWR	2013	1	28	13	33.8	30.92	91.66	170	8.05546	\N	0	\N	2.5	2013-01-28 18:00:00+00
EWR	2013	1	28	14	33.8	32	95.75	170	6.90468	\N	0	\N	2	2013-01-28 19:00:00+00
EWR	2013	1	28	15	33.98	32	92.36	\N	4.60312	\N	0	1019.6	2	2013-01-28 20:00:00+00
EWR	2013	1	28	16	33.98	32	92.36	220	11.5078	19.56326	0	1018.7	2	2013-01-28 21:00:00+00
EWR	2013	1	28	17	33.98	33.08	96.46	230	11.5078	\N	0	\N	5	2013-01-28 22:00:00+00
EWR	2013	1	28	18	33.98	33.08	96.46	230	8.05546	\N	0	1018.3	5	2013-01-28 23:00:00+00
EWR	2013	1	28	19	33.98	33.08	96.46	230	6.90468	\N	0	1017.8	5	2013-01-29 00:00:00+00
EWR	2013	1	28	20	33.98	33.08	96.46	240	9.20624	\N	0	1017.2	5	2013-01-29 01:00:00+00
EWR	2013	1	28	21	35.06	33.08	92.4	240	9.20624	\N	0	1016.5	5	2013-01-29 02:00:00+00
EWR	2013	1	28	22	35.6	33.8	93.08	240	11.5078	\N	0	\N	5	2013-01-29 03:00:00+00
EWR	2013	1	28	23	35.6	33.8	93.08	230	8.05546	\N	0	\N	5	2013-01-29 04:00:00+00
EWR	2013	1	29	0	35.06	33.98	95.79	210	5.7539	\N	0	1016.2	5	2013-01-29 05:00:00+00
EWR	2013	1	29	1	35.96	33.98	92.43	240	6.90468	\N	0	1016.3	5	2013-01-29 06:00:00+00
EWR	2013	1	29	2	37.04	35.06	92.46	240	3.45234	\N	0	1016.2	7	2013-01-29 07:00:00+00
EWR	2013	1	29	3	37.04	35.96	95.82	220	6.90468	\N	0	1016.1	7	2013-01-29 08:00:00+00
EWR	2013	1	29	4	37.94	37.04	96.52	0	0	\N	0	1017.1	7	2013-01-29 09:00:00+00
EWR	2013	1	29	5	37.94	35.96	92.49	0	0	\N	0	1018.4	7	2013-01-29 10:00:00+00
EWR	2013	1	29	6	37.94	35.96	92.49	0	0	\N	0	1018.8	6	2013-01-29 11:00:00+00
EWR	2013	1	29	7	42.08	39.02	88.81	0	0	\N	0	1019.4	6	2013-01-29 12:00:00+00
EWR	2013	1	29	8	42.98	39.92	88.85	200	3.45234	\N	0	1019.6	6	2013-01-29 13:00:00+00
EWR	2013	1	29	9	48.02	42.08	79.79	0	0	\N	0	1020.1	7	2013-01-29 14:00:00+00
EWR	2013	1	29	10	51.98	39.92	63.33	10	5.7539	\N	0	1020.1	9	2013-01-29 15:00:00+00
EWR	2013	1	29	11	51.98	39.92	63.33	90	5.7539	\N	0	1019.1	10	2013-01-29 16:00:00+00
EWR	2013	1	29	12	51.08	39.02	63.22	110	8.05546	\N	0	1019.2	10	2013-01-29 17:00:00+00
EWR	2013	1	29	13	44.96	39.02	79.54	120	11.5078	\N	0	1018.9	6	2013-01-29 18:00:00+00
EWR	2013	1	29	14	44.96	39.02	79.54	\N	6.90468	\N	0	1019.4	6	2013-01-29 19:00:00+00
EWR	2013	1	29	15	46.4	39.2	75.84	120	5.7539	\N	0	\N	5	2013-01-29 20:00:00+00
EWR	2013	1	29	16	44.6	39.2	82.31	140	5.7539	\N	0	\N	4	2013-01-29 21:00:00+00
EWR	2013	1	29	17	44.6	39.92	85.25	90	6.90468	\N	0	\N	4	2013-01-29 22:00:00+00
EWR	2013	1	29	18	42.98	39.92	88.85	\N	4.60312	\N	0.04	1020.2	4	2013-01-29 23:00:00+00
EWR	2013	1	29	19	42.98	41	93.3	130	5.7539	\N	0.02	\N	4	2013-01-30 00:00:00+00
EWR	2013	1	29	20	42.98	41	93.3	0	0	\N	0	\N	4	2013-01-30 01:00:00+00
EWR	2013	1	29	21	44.6	41	92.65	0	0	\N	0	\N	4	2013-01-30 02:00:00+00
EWR	2013	1	29	22	42.98	41	92.65	0	0	\N	0	1019	3	2013-01-30 03:00:00+00
EWR	2013	1	29	23	44.06	42.08	92.69	60	4.60312	\N	0	1018.8	3	2013-01-30 04:00:00+00
EWR	2013	1	30	0	42.8	41	95.9	30	6.90468	\N	0	\N	2.5	2013-01-30 05:00:00+00
EWR	2013	1	30	1	41	39.92	95.9	30	6.90468	\N	0	1016.5	2.5	2013-01-30 06:00:00+00
EWR	2013	1	30	2	41	39.92	95.9	20	4.60312	\N	0	1015.8	2.5	2013-01-30 07:00:00+00
EWR	2013	1	30	3	41	39.92	100	20	6.90468	\N	0	\N	0.5	2013-01-30 08:00:00+00
EWR	2013	1	30	4	39.92	39.92	100	20	6.90468	\N	0	\N	0.25	2013-01-30 09:00:00+00
EWR	2013	1	30	5	39.92	39.92	100	20	4.60312	\N	0	1013.4	0.25	2013-01-30 10:00:00+00
EWR	2013	1	30	6	39.92	39.92	100	350	3.45234	\N	0	1012.4	0.25	2013-01-30 11:00:00+00
EWR	2013	1	30	7	42.08	42.08	100	0	0	\N	0	\N	0.12	2013-01-30 12:00:00+00
EWR	2013	1	30	8	44.6	44.6	100	50	4.60312	\N	0	\N	0.25	2013-01-30 13:00:00+00
EWR	2013	1	30	9	44.96	44.96	100	50	6.90468	\N	0	\N	0.25	2013-01-30 14:00:00+00
EWR	2013	1	30	10	50	46.94	100	80	5.7539	\N	0	\N	1	2013-01-30 15:00:00+00
EWR	2013	1	30	11	51.98	48.02	87.37	90	5.7539	\N	0	\N	3	2013-01-30 16:00:00+00
EWR	2013	1	30	12	55.04	50	83.08	70	3.45234	\N	0	1005.7	3	2013-01-30 17:00:00+00
EWR	2013	1	30	13	64.04	57.02	77.92	180	10.35702	\N	0	1003.9	10	2013-01-30 18:00:00+00
EWR	2013	1	30	14	64.4	57.2	80.55	180	12.65858	18.41248	0.01	\N	10	2013-01-30 19:00:00+00
EWR	2013	1	30	15	55.94	51.08	83.69	100	8.05546	\N	0	1002.8	10	2013-01-30 20:00:00+00
EWR	2013	1	30	16	59	53.06	80.64	130	9.20624	\N	0	1002.1	10	2013-01-30 21:00:00+00
EWR	2013	1	30	17	59	53.06	82.12	150	8.05546	\N	0	\N	10	2013-01-30 22:00:00+00
EWR	2013	1	30	18	60.8	53.96	93.05	160	6.90468	\N	0.02	\N	10	2013-01-30 23:00:00+00
EWR	2013	1	30	19	51.98	50	92.93	50	3.45234	\N	0	1001.1	9	2013-01-31 00:00:00+00
EWR	2013	1	30	20	51.98	51.08	96.73	0	0	\N	0	999.5	10	2013-01-31 01:00:00+00
EWR	2013	1	30	21	59	55.04	86.69	160	6.90468	\N	0	997.5	10	2013-01-31 02:00:00+00
EWR	2013	1	30	22	62.06	57.02	83.54	180	14.96014	\N	0	995.9	10	2013-01-31 03:00:00+00
EWR	2013	1	30	23	62.06	57.02	83.54	180	21.86482	33.37262	0.01	994.1	10	2013-01-31 04:00:00+00
EWR	2013	1	31	0	62.6	59	89.7	190	25.31716	36.82496	0.09	\N	6	2013-01-31 05:00:00+00
EWR	2013	1	31	1	62.06	59	93.79	190	23.0156	39.12652	0.07	\N	6	2013-01-31 06:00:00+00
EWR	2013	1	31	2	62.06	57.92	86.29	180	31.07106	47.18198	0.05	986.4	6	2013-01-31 07:00:00+00
EWR	2013	1	31	3	62.06	59	89.7	180	27.61872	44.88042	0.19	983.9	3	2013-01-31 08:00:00+00
EWR	2013	1	31	4	60.8	59	93.79	230	40.2773	58.68978	0.3	\N	6	2013-01-31 09:00:00+00
EWR	2013	1	31	5	59	55.4	87.83	220	18.41248	27.61872	0.06	\N	10	2013-01-31 10:00:00+00
EWR	2013	1	31	6	57.2	53.6	87.74	270	42.57886	55.23744	0.03	\N	10	2013-01-31 11:00:00+00
EWR	2013	1	31	7	48.2	35.6	61.52	260	31.07106	37.97574	0.01	\N	10	2013-01-31 12:00:00+00
EWR	2013	1	31	8	46.04	30.02	53.33	270	39.12652	48.33276	0	992.3	10	2013-01-31 13:00:00+00
EWR	2013	1	31	9	44.06	24.98	46.73	270	32.22184	51.7851	0	994.2	10	2013-01-31 14:00:00+00
EWR	2013	1	31	10	44.96	21.02	38.23	260	33.37262	41.42808	0	995.4	10	2013-01-31 15:00:00+00
EWR	2013	1	31	11	46.04	19.04	33.73	280	33.37262	43.72964	0	996.3	10	2013-01-31 16:00:00+00
EWR	2013	1	31	12	46.04	19.04	33.73	260	31.07106	42.57886	0	996.6	10	2013-01-31 17:00:00+00
EWR	2013	1	31	13	44.96	19.04	35.14	250	23.0156	42.57886	0	997.9	10	2013-01-31 18:00:00+00
EWR	2013	1	31	14	44.06	17.96	34.72	260	27.61872	42.57886	0	999.1	10	2013-01-31 19:00:00+00
EWR	2013	1	31	15	42.08	15.08	33.06	270	26.46794	44.88042	0	1000.4	10	2013-01-31 20:00:00+00
EWR	2013	1	31	16	39.02	17.06	40.57	270	31.07106	40.2773	0	1002.2	10	2013-01-31 21:00:00+00
EWR	2013	1	31	17	35.96	12.92	38.2	260	28.7695	43.72964	0	1004.5	10	2013-01-31 22:00:00+00
EWR	2013	1	31	18	35.06	12.92	39.58	250	24.16638	29.92028	0	1006	10	2013-01-31 23:00:00+00
EWR	2013	1	31	19	33.08	15.08	47.1	270	20.71404	31.07106	0	1006.6	10	2013-02-01 00:00:00+00
EWR	2013	1	31	20	32	19.04	58.37	250	17.2617	26.46794	0	1007.3	10	2013-02-01 01:00:00+00
EWR	2013	1	31	21	32	10.04	39.38	260	28.7695	36.82496	0	1008	10	2013-02-01 02:00:00+00
EWR	2013	1	31	22	30.92	6.98	35.84	260	27.61872	35.67418	0	1008.5	10	2013-02-01 03:00:00+00
EWR	2013	1	31	23	30.02	8.06	39.03	260	14.96014	\N	0	1008.9	10	2013-02-01 04:00:00+00
EWR	2013	2	1	0	28.94	10.94	46.41	250	19.56326	23.0156	0	1009.6	10	2013-02-01 05:00:00+00
EWR	2013	2	1	1	28.94	10.94	46.41	240	11.5078	\N	0	1009.9	10	2013-02-01 06:00:00+00
EWR	2013	2	1	2	28.04	10.94	48.15	240	9.20624	\N	0	1009.7	10	2013-02-01 07:00:00+00
EWR	2013	2	1	3	28.04	10.94	48.15	220	13.80936	\N	0	1009.6	10	2013-02-01 08:00:00+00
EWR	2013	2	1	4	28.04	10.94	48.15	230	17.2617	\N	0	1009.8	10	2013-02-01 09:00:00+00
EWR	2013	2	1	5	28.04	12.02	50.52	220	13.80936	20.71404	0	1010.4	10	2013-02-01 10:00:00+00
EWR	2013	2	1	6	28.94	12.02	48.69	260	9.20624	\N	0	1010.9	10	2013-02-01 11:00:00+00
EWR	2013	2	1	7	28.94	12.02	48.69	280	10.35702	\N	0	1010.9	10	2013-02-01 12:00:00+00
EWR	2013	2	1	8	30.02	10.94	44.41	270	10.35702	\N	0	1011.3	10	2013-02-01 13:00:00+00
EWR	2013	2	1	9	30.02	10.04	42.66	290	17.2617	23.0156	0	1012.1	10	2013-02-01 14:00:00+00
EWR	2013	2	1	10	30.02	6.98	37.17	300	17.2617	27.61872	0	1012.1	10	2013-02-01 15:00:00+00
EWR	2013	2	1	11	32	5	31.35	330	25.31716	32.22184	0	1011.8	10	2013-02-01 16:00:00+00
EWR	2013	2	1	12	30.92	5	32.75	320	18.41248	27.61872	0	1012.1	10	2013-02-01 17:00:00+00
EWR	2013	2	1	13	33.98	3.02	26.43	280	20.71404	31.07106	0	1012.8	10	2013-02-01 18:00:00+00
EWR	2013	2	1	14	33.08	1.94	26.07	300	14.96014	33.37262	0	1013.8	10	2013-02-01 19:00:00+00
EWR	2013	2	1	15	30.92	6.08	34.4	310	19.56326	\N	0	1015.4	10	2013-02-01 20:00:00+00
EWR	2013	2	1	16	30.2	14	55.12	280	26.46794	\N	0	\N	10	2013-02-01 21:00:00+00
EWR	2013	2	1	17	26.96	15.98	62.83	280	18.41248	26.46794	0	1018.6	10	2013-02-01 22:00:00+00
EWR	2013	2	1	18	26.06	15.08	62.7	260	13.80936	\N	0	1020	10	2013-02-01 23:00:00+00
EWR	2013	2	1	19	24.98	17.06	71.47	280	14.96014	\N	0	1021.1	10	2013-02-02 00:00:00+00
EWR	2013	2	1	20	24.98	14	62.55	270	14.96014	\N	0	1022	10	2013-02-02 01:00:00+00
EWR	2013	2	1	21	24.98	12.02	57.33	270	11.5078	\N	0	1022.7	10	2013-02-02 02:00:00+00
EWR	2013	2	1	22	24.08	10.04	54.51	270	12.65858	\N	0	1023.3	10	2013-02-02 03:00:00+00
EWR	2013	2	1	23	24.08	8.06	49.87	260	10.35702	\N	0	1024.2	10	2013-02-02 04:00:00+00
EWR	2013	2	2	0	23	6.98	49.69	250	11.5078	\N	0	1024.4	10	2013-02-02 05:00:00+00
EWR	2013	2	2	1	21.92	6.08	49.92	260	13.80936	\N	0	1024.8	10	2013-02-02 06:00:00+00
EWR	2013	2	2	2	21.92	6.08	49.92	260	12.65858	\N	0	1025.3	10	2013-02-02 07:00:00+00
EWR	2013	2	2	3	21.02	6.08	51.86	260	14.96014	\N	0	1025.5	10	2013-02-02 08:00:00+00
EWR	2013	2	2	4	19.94	5	51.68	260	14.96014	\N	0	1025.5	10	2013-02-02 09:00:00+00
EWR	2013	2	2	5	19.04	5	53.71	260	11.5078	\N	0	1025.3	10	2013-02-02 10:00:00+00
EWR	2013	2	2	6	19.04	5	53.71	240	8.05546	\N	0	1026	10	2013-02-02 11:00:00+00
EWR	2013	2	2	7	19.94	6.98	56.56	260	10.35702	\N	0	1026.5	10	2013-02-02 12:00:00+00
EWR	2013	2	2	8	21.02	6.08	51.86	250	10.35702	\N	0	1026.2	10	2013-02-02 13:00:00+00
EWR	2013	2	2	9	24.08	6.08	45.59	260	6.90468	\N	0	1025.7	10	2013-02-02 14:00:00+00
EWR	2013	2	2	10	26.06	6.08	41.98	\N	6.90468	\N	0	1024.8	10	2013-02-02 15:00:00+00
EWR	2013	2	2	11	28.94	3.92	33.78	230	13.80936	19.56326	0	1023.5	10	2013-02-02 16:00:00+00
EWR	2013	2	2	12	28.04	3.02	33.62	230	17.2617	\N	0	1022.5	10	2013-02-02 17:00:00+00
EWR	2013	2	2	13	30.02	3.92	32.32	220	16.11092	19.56326	0	1021.3	10	2013-02-02 18:00:00+00
EWR	2013	2	2	14	30.02	3.92	32.32	220	13.80936	\N	0	1020.5	10	2013-02-02 19:00:00+00
EWR	2013	2	2	15	28.94	3.92	33.78	240	12.65858	20.71404	0	1020	10	2013-02-02 20:00:00+00
EWR	2013	2	2	16	28.94	6.08	37.29	240	11.5078	\N	0	1019.4	10	2013-02-02 21:00:00+00
EWR	2013	2	2	17	28.04	6.98	40.31	260	10.35702	19.56326	0	1019.3	10	2013-02-02 22:00:00+00
EWR	2013	2	2	18	28.04	8.06	42.32	250	6.90468	\N	0	1019.2	10	2013-02-02 23:00:00+00
EWR	2013	2	2	19	26.96	12.02	52.81	230	10.35702	\N	0	1019.3	10	2013-02-03 00:00:00+00
EWR	2013	2	2	20	24.98	19.04	77.82	290	9.20624	\N	0	1019.4	5	2013-02-03 01:00:00+00
EWR	2013	2	2	21	24.98	19.94	80.87	280	6.90468	\N	0	1019.3	3	2013-02-03 02:00:00+00
EWR	2013	2	2	22	24.08	21.02	87.91	0	0	\N	0	1018.8	2	2013-02-03 03:00:00+00
EWR	2013	2	2	23	24.8	21.2	87.91	0	0	\N	0.01	\N	4	2013-02-03 04:00:00+00
EWR	2013	2	3	0	24.98	21.92	87.96	0	0	\N	0	\N	5	2013-02-03 05:00:00+00
EWR	2013	2	3	1	24.98	21.92	87.96	0	0	\N	0.01	1016.5	4	2013-02-03 06:00:00+00
EWR	2013	2	3	2	24.98	23	92.05	20	3.45234	\N	0	1015.7	4	2013-02-03 07:00:00+00
EWR	2013	2	3	3	24.08	21.92	91.32	20	4.60312	\N	0	1014.8	6	2013-02-03 08:00:00+00
EWR	2013	2	3	4	24.08	21.02	87.91	10	8.05546	\N	0	1014.1	6	2013-02-03 09:00:00+00
EWR	2013	2	3	5	24.98	21.02	84.67	20	6.90468	\N	0	1014.1	9	2013-02-03 10:00:00+00
EWR	2013	2	3	6	24.8	19.4	80.8	360	5.7539	\N	0	\N	10	2013-02-03 11:00:00+00
EWR	2013	2	3	7	24.08	19.94	85.85	30	6.90468	\N	0	\N	10	2013-02-03 12:00:00+00
EWR	2013	2	3	8	24.8	19.94	83.96	10	8.05546	\N	0	\N	10	2013-02-03 13:00:00+00
EWR	2013	2	3	9	26.96	21.2	79.77	350	9.20624	\N	0	\N	10	2013-02-03 14:00:00+00
EWR	2013	2	3	10	26.96	21.02	78	20	6.90468	\N	0	1013.3	10	2013-02-03 15:00:00+00
EWR	2013	2	3	11	28.04	21.02	74.61	350	8.05546	\N	0	1012	10	2013-02-03 16:00:00+00
EWR	2013	2	3	12	28.94	19.94	68.68	\N	3.45234	\N	0	1010.8	10	2013-02-03 17:00:00+00
EWR	2013	2	3	13	30.92	21.2	68.83	270	6.90468	\N	0	\N	10	2013-02-03 18:00:00+00
EWR	2013	2	3	14	32	19.04	58.37	310	8.05546	\N	0	1009.3	10	2013-02-03 19:00:00+00
EWR	2013	2	3	15	32	17.96	55.72	300	10.35702	\N	0	1009.2	10	2013-02-03 20:00:00+00
EWR	2013	2	3	16	30.92	15.98	53.44	290	9.20624	17.2617	0	1009	10	2013-02-03 21:00:00+00
EWR	2013	2	3	17	30.02	15.98	55.42	280	11.5078	\N	0	1009.3	10	2013-02-03 22:00:00+00
EWR	2013	2	3	18	28.94	17.06	60.69	260	6.90468	\N	0	1009.7	10	2013-02-03 23:00:00+00
EWR	2013	2	3	19	28.04	17.06	62.97	270	8.05546	\N	0	1009.9	10	2013-02-04 00:00:00+00
EWR	2013	2	3	20	26.96	17.06	65.84	270	5.7539	\N	0	1010.1	10	2013-02-04 01:00:00+00
EWR	2013	2	3	21	26.06	17.06	68.33	270	5.7539	\N	0	1009.9	10	2013-02-04 02:00:00+00
EWR	2013	2	3	22	26.96	17.96	68.44	230	5.7539	\N	0	1009.7	10	2013-02-04 03:00:00+00
EWR	2013	2	3	23	26.96	17.96	68.44	230	9.20624	\N	0	1009.7	10	2013-02-04 04:00:00+00
EWR	2013	2	4	0	26.96	19.04	71.69	260	10.35702	\N	0	1009.8	10	2013-02-04 05:00:00+00
EWR	2013	2	4	1	26.06	17.06	68.33	280	14.96014	\N	0	1010.2	10	2013-02-04 06:00:00+00
EWR	2013	2	4	2	26.06	12.02	54.82	290	18.41248	26.46794	0	1010.8	10	2013-02-04 07:00:00+00
EWR	2013	2	4	3	24.98	10.04	52.5	280	16.11092	20.71404	0	1011.3	10	2013-02-04 08:00:00+00
EWR	2013	2	4	4	24.08	10.04	54.51	270	16.11092	\N	0	1012.4	10	2013-02-04 09:00:00+00
EWR	2013	2	4	5	23	8.96	54.34	270	14.96014	\N	0	1013.2	10	2013-02-04 10:00:00+00
EWR	2013	2	4	6	23	8.96	54.34	260	11.5078	\N	0	1013.9	10	2013-02-04 11:00:00+00
EWR	2013	2	4	7	24.08	8.96	51.93	270	14.96014	\N	0	1014.6	10	2013-02-04 12:00:00+00
EWR	2013	2	4	8	24.98	8.96	50.02	270	17.2617	23.0156	0	1015	10	2013-02-04 13:00:00+00
EWR	2013	2	4	9	28.04	8.96	44.07	290	17.2617	25.31716	0	1015.3	10	2013-02-04 14:00:00+00
EWR	2013	2	4	10	30.02	6.98	37.17	280	18.41248	26.46794	0	1015	10	2013-02-04 15:00:00+00
EWR	2013	2	4	11	30.02	6.98	37.17	250	20.71404	28.7695	0	1014.7	10	2013-02-04 16:00:00+00
EWR	2013	2	4	12	30.92	8.06	37.63	290	20.71404	26.46794	0	1014.2	10	2013-02-04 17:00:00+00
EWR	2013	2	4	13	32	6.98	34.31	260	18.41248	32.22184	0	1013.6	10	2013-02-04 18:00:00+00
EWR	2013	2	4	14	30.92	6.08	34.4	260	14.96014	26.46794	0	1013.5	10	2013-02-04 19:00:00+00
EWR	2013	2	4	15	30.02	6.08	35.68	280	18.41248	26.46794	0	1013.7	10	2013-02-04 20:00:00+00
EWR	2013	2	4	16	28.94	6.08	37.29	260	16.11092	28.7695	0	1013.9	10	2013-02-04 21:00:00+00
EWR	2013	2	4	17	28.94	6.98	38.85	260	13.80936	17.2617	0	1014.5	10	2013-02-04 22:00:00+00
EWR	2013	2	4	18	28.04	8.06	42.32	230	8.05546	\N	0	1015.2	10	2013-02-04 23:00:00+00
EWR	2013	2	4	19	28.04	8.96	44.07	250	5.7539	\N	0	1015.2	10	2013-02-05 00:00:00+00
EWR	2013	2	4	20	24.98	10.04	52.5	210	4.60312	\N	0	1015.1	10	2013-02-05 01:00:00+00
EWR	2013	2	4	21	28.04	10.94	48.15	220	3.45234	\N	0	1015.1	10	2013-02-05 02:00:00+00
EWR	2013	2	4	22	28.04	12.02	50.52	200	3.45234	\N	0	1015.1	10	2013-02-05 03:00:00+00
EWR	2013	2	4	23	28.94	14	53.13	\N	3.45234	\N	0	1014.7	10	2013-02-05 04:00:00+00
EWR	2013	2	5	0	28.04	21.02	74.61	210	6.90468	\N	0	1014.2	10	2013-02-05 05:00:00+00
EWR	2013	2	5	1	28.04	23	81.11	0	0	\N	0	1014	9	2013-02-05 06:00:00+00
EWR	2013	2	5	2	28.04	24.08	84.87	0	0	\N	0	1013.7	9	2013-02-05 07:00:00+00
EWR	2013	2	5	3	28.04	24.08	84.87	0	0	\N	0	1013.6	6	2013-02-05 08:00:00+00
EWR	2013	2	5	4	28.04	24.98	88.12	0	0	\N	0.01	1013	7	2013-02-05 09:00:00+00
EWR	2013	2	5	5	28.94	24.98	84.93	30	3.45234	\N	0	1013.5	8	2013-02-05 10:00:00+00
EWR	2013	2	5	6	28.4	26.6	92.86	20	6.90468	\N	0	\N	4	2013-02-05 11:00:00+00
EWR	2013	2	5	7	26.96	23	84.8	10	9.20624	\N	0	1014.3	6	2013-02-05 12:00:00+00
EWR	2013	2	5	8	28.04	24.08	84.87	20	9.20624	\N	0	1014.6	6	2013-02-05 13:00:00+00
EWR	2013	2	5	9	28.94	24.8	86.18	20	9.20624	\N	0	\N	6	2013-02-05 14:00:00+00
EWR	2013	2	5	10	28.94	24.98	86.18	10	9.20624	\N	0	\N	6	2013-02-05 15:00:00+00
EWR	2013	2	5	11	30.2	24.98	81.27	360	10.35702	\N	0	\N	7	2013-02-05 16:00:00+00
EWR	2013	2	5	12	30.92	24.98	78.35	10	6.90468	\N	0	1014.1	7	2013-02-05 17:00:00+00
EWR	2013	2	5	13	30.92	26.6	86.28	40	8.05546	\N	0	\N	6	2013-02-05 18:00:00+00
EWR	2013	2	5	14	30.92	26.06	81.95	10	6.90468	\N	0	1012.9	7	2013-02-05 19:00:00+00
EWR	2013	2	5	15	30.92	26.06	81.95	50	3.45234	\N	0	1012.9	5	2013-02-05 20:00:00+00
EWR	2013	2	5	16	30.92	26.06	81.95	20	5.7539	\N	0	1012.9	5	2013-02-05 21:00:00+00
EWR	2013	2	5	17	30.92	26.06	81.95	20	5.7539	\N	0	1012.6	6	2013-02-05 22:00:00+00
EWR	2013	2	5	18	32	26.96	81.42	10	4.60312	\N	0	1013	4	2013-02-05 23:00:00+00
EWR	2013	2	5	19	30.92	28.04	88.92	10	4.60312	\N	0	1012.9	4	2013-02-06 00:00:00+00
EWR	2013	2	5	20	30.92	28.4	92.92	360	5.7539	\N	0.01	\N	3	2013-02-06 01:00:00+00
EWR	2013	2	5	21	30.92	28.94	92.26	20	4.60312	\N	0	1013	3	2013-02-06 02:00:00+00
EWR	2013	2	5	22	30.92	28.94	92.26	30	4.60312	\N	0	1013.2	3	2013-02-06 03:00:00+00
EWR	2013	2	5	23	32	30.02	92.29	0	0	\N	0	1013.3	3	2013-02-06 04:00:00+00
EWR	2013	2	6	0	32	30.02	92.29	340	4.60312	\N	0	1013.3	3	2013-02-06 05:00:00+00
EWR	2013	2	6	1	32	30.92	95.73	0	0	\N	0	1013.4	2	2013-02-06 06:00:00+00
EWR	2013	2	6	2	32	30.2	96.41	0	0	\N	0	\N	3	2013-02-06 07:00:00+00
EWR	2013	2	6	3	30.2	28.4	92.92	280	4.60312	\N	0	\N	3	2013-02-06 08:00:00+00
EWR	2013	2	6	4	30.02	28.04	92.23	260	6.90468	\N	0	1014.5	3	2013-02-06 09:00:00+00
EWR	2013	2	6	5	30.2	26.6	88.82	280	6.90468	\N	0	\N	5	2013-02-06 10:00:00+00
EWR	2013	2	6	6	30.92	26.96	85.05	260	5.7539	\N	0	1016.5	5	2013-02-06 11:00:00+00
EWR	2013	2	6	7	30.92	26.96	85.05	260	6.90468	\N	0	1017.9	4	2013-02-06 12:00:00+00
EWR	2013	2	6	8	33.08	26.06	75.11	270	10.35702	\N	0	1018.5	6	2013-02-06 13:00:00+00
EWR	2013	2	6	9	35.06	24.98	66.36	290	16.11092	\N	0	1019.3	9	2013-02-06 14:00:00+00
EWR	2013	2	6	10	37.94	24.98	59.22	280	13.80936	19.56326	0	1019.5	10	2013-02-06 15:00:00+00
EWR	2013	2	6	11	39.02	21.92	49.93	290	13.80936	21.86482	0	1019.4	10	2013-02-06 16:00:00+00
EWR	2013	2	6	12	39.02	19.94	45.91	270	17.2617	21.86482	0	1019.4	10	2013-02-06 17:00:00+00
EWR	2013	2	6	13	39.02	21.02	48.07	290	9.20624	\N	0	1019.7	10	2013-02-06 18:00:00+00
EWR	2013	2	6	14	41	17.96	39.05	290	16.11092	21.86482	0	1020.1	10	2013-02-06 19:00:00+00
EWR	2013	2	6	15	39.02	17.06	40.57	290	16.11092	24.16638	0	1020.9	10	2013-02-06 20:00:00+00
EWR	2013	2	6	16	37.94	15.08	38.84	310	14.96014	25.31716	0	1021.8	10	2013-02-06 21:00:00+00
EWR	2013	2	6	17	37.04	14	38.38	310	10.35702	18.41248	0	1023.2	10	2013-02-06 22:00:00+00
EWR	2013	2	6	18	35.96	12.92	38.2	320	11.5078	\N	0	1024.5	10	2013-02-06 23:00:00+00
EWR	2013	2	6	19	35.06	12.92	39.58	320	14.96014	\N	0	1025.5	10	2013-02-07 00:00:00+00
EWR	2013	2	6	20	33.08	10.94	39.25	340	17.2617	21.86482	0	1026.4	10	2013-02-07 01:00:00+00
EWR	2013	2	6	21	32	6.98	34.31	350	13.80936	\N	0	1026.9	10	2013-02-07 02:00:00+00
EWR	2013	2	6	22	30.92	3.92	31.16	340	13.80936	\N	0	1027.8	10	2013-02-07 03:00:00+00
EWR	2013	2	6	23	28.94	3.02	32.41	350	13.80936	\N	0	1027.9	10	2013-02-07 04:00:00+00
EWR	2013	2	7	0	28.94	3.92	33.78	340	10.35702	\N	0	1028.2	10	2013-02-07 05:00:00+00
EWR	2013	2	7	1	26.06	3.92	38.03	10	6.90468	\N	0	1028.8	10	2013-02-07 06:00:00+00
EWR	2013	2	7	2	26.06	5	39.96	350	8.05546	\N	0	1029.4	10	2013-02-07 07:00:00+00
EWR	2013	2	7	3	26.06	5	39.96	340	6.90468	\N	0	1029.5	10	2013-02-07 08:00:00+00
EWR	2013	2	7	4	24.98	6.08	43.91	340	5.7539	\N	0	1030.6	10	2013-02-07 09:00:00+00
EWR	2013	2	7	5	26.06	6.08	41.98	360	6.90468	\N	0	1030.7	10	2013-02-07 10:00:00+00
EWR	2013	2	7	6	26.06	6.98	43.74	10	4.60312	\N	0	1031.4	10	2013-02-07 11:00:00+00
EWR	2013	2	7	7	26.06	6.98	43.74	10	4.60312	\N	0	1032.6	10	2013-02-07 12:00:00+00
EWR	2013	2	7	8	28.04	6.98	40.31	360	6.90468	\N	0	1032.8	10	2013-02-07 13:00:00+00
EWR	2013	2	7	9	28.04	8.06	42.32	20	6.90468	\N	0	1032.8	10	2013-02-07 14:00:00+00
EWR	2013	2	7	10	30.02	8.06	39.03	20	10.35702	\N	0	1033.2	10	2013-02-07 15:00:00+00
EWR	2013	2	7	11	30.92	8.96	39.19	0	0	\N	0	1032.3	10	2013-02-07 16:00:00+00
EWR	2013	2	7	12	32	10.04	39.38	80	5.7539	\N	0	1031.7	10	2013-02-07 17:00:00+00
EWR	2013	2	7	13	32	8.96	37.52	70	5.7539	\N	0	1031.3	10	2013-02-07 18:00:00+00
EWR	2013	2	7	14	33.08	8.96	35.92	\N	4.60312	\N	0	1030.7	10	2013-02-07 19:00:00+00
EWR	2013	2	7	15	33.08	10.04	37.7	90	6.90468	\N	0	1030.3	10	2013-02-07 20:00:00+00
EWR	2013	2	7	16	33.08	8.06	34.5	110	5.7539	\N	0	1029.7	10	2013-02-07 21:00:00+00
EWR	2013	2	7	17	33.08	10.04	37.7	100	5.7539	\N	0	1029.9	10	2013-02-07 22:00:00+00
EWR	2013	2	7	18	32	15.98	51.15	80	6.90468	\N	0	1030.2	10	2013-02-07 23:00:00+00
EWR	2013	2	7	19	32	19.04	58.37	60	5.7539	\N	0	1030.2	10	2013-02-08 00:00:00+00
EWR	2013	2	7	20	32	19.94	60.66	60	8.05546	\N	0	1029.6	10	2013-02-08 01:00:00+00
EWR	2013	2	7	21	33.08	21.92	63.17	50	6.90468	\N	0	1029	10	2013-02-08 02:00:00+00
EWR	2013	2	7	22	33.08	21.92	63.17	40	6.90468	\N	0	1028.2	10	2013-02-08 03:00:00+00
EWR	2013	2	7	23	33.8	23	66.11	40	6.90468	\N	0	\N	10	2013-02-08 04:00:00+00
EWR	2013	2	8	0	35.06	24.98	66.36	60	6.90468	\N	0	1026.1	10	2013-02-08 05:00:00+00
EWR	2013	2	8	1	35.06	26.06	69.4	60	9.20624	17.2617	0	1025.2	10	2013-02-08 06:00:00+00
EWR	2013	2	8	2	35.06	26.06	69.4	60	10.35702	\N	0	1024.2	10	2013-02-08 07:00:00+00
EWR	2013	2	8	3	35.06	26.96	72.03	50	10.35702	21.86482	0	1022.9	10	2013-02-08 08:00:00+00
EWR	2013	2	8	4	33.98	26.06	72.45	30	9.20624	\N	0	1022.3	10	2013-02-08 09:00:00+00
EWR	2013	2	8	5	33.98	26.06	72.45	30	10.35702	\N	0	1021.5	10	2013-02-08 10:00:00+00
EWR	2013	2	8	6	33.08	28.94	84.56	30	13.80936	\N	0	1020.2	3	2013-02-08 11:00:00+00
EWR	2013	2	8	7	33.8	30.92	91.66	40	12.65858	\N	0.01	\N	3	2013-02-08 12:00:00+00
EWR	2013	2	8	8	33.98	32	92.36	30	11.5078	\N	0.02	1018.5	1	2013-02-08 13:00:00+00
EWR	2013	2	8	9	35.06	33.08	92.4	40	11.5078	\N	0.03	1016.9	1	2013-02-08 14:00:00+00
EWR	2013	2	8	10	35.6	33.8	93.08	40	16.11092	\N	0.04	\N	5	2013-02-08 15:00:00+00
EWR	2013	2	8	11	35.06	33.08	92.4	40	18.41248	27.61872	0.04	1013.3	5	2013-02-08 16:00:00+00
EWR	2013	2	8	12	35.6	33.8	93.08	40	23.0156	29.92028	0.07	\N	5	2013-02-08 17:00:00+00
EWR	2013	2	8	13	33.98	30.92	88.42	40	21.86482	32.22184	0.09	\N	5	2013-02-08 18:00:00+00
EWR	2013	2	8	14	33.98	32	92.36	30	27.61872	33.37262	0.04	\N	4	2013-02-08 19:00:00+00
EWR	2013	2	8	15	33.8	32	95.75	20	19.56326	\N	0.06	\N	2	2013-02-08 20:00:00+00
EWR	2013	2	8	16	33.8	32	95.73	20	17.2617	\N	0.08	\N	2	2013-02-08 21:00:00+00
EWR	2013	2	8	17	32	30.92	95.73	10	19.56326	\N	0.06	\N	1	2013-02-08 22:00:00+00
EWR	2013	2	8	18	32	30.2	92.97	10	21.86482	28.7695	0.02	\N	2	2013-02-08 23:00:00+00
EWR	2013	2	8	19	30.92	28.94	92.92	10	23.0156	\N	0	\N	1.5	2013-02-09 00:00:00+00
EWR	2013	2	8	20	30.92	28.04	88.92	360	21.86482	27.61872	0	1004	2.5	2013-02-09 01:00:00+00
EWR	2013	2	8	21	30.92	28.04	88.92	310	13.80936	25.31716	0.01	1005.4	2.5	2013-02-09 02:00:00+00
EWR	2013	2	8	22	30.2	28.4	95.65	330	18.41248	26.46794	0.03	\N	1.5	2013-02-09 03:00:00+00
EWR	2013	2	8	23	28.4	26.6	92.86	340	19.56326	\N	0.11	\N	0.5	2013-02-09 04:00:00+00
EWR	2013	2	9	0	28.04	26.06	92.16	360	11.5078	\N	0.13	1008.2	0.5	2013-02-09 05:00:00+00
EWR	2013	2	9	1	28.04	26.96	95.65	350	11.5078	\N	0.09	1008.4	0.5	2013-02-09 06:00:00+00
EWR	2013	2	9	2	28.94	28.94	100	350	18.41248	\N	0.2	\N	1	2013-02-09 07:00:00+00
EWR	2013	2	9	3	30.02	28.4	100	330	13.80936	\N	0.13	\N	10	2013-02-09 08:00:00+00
EWR	2013	2	9	4	30.2	26.96	88.22	320	13.80936	\N	0	\N	9	2013-02-09 09:00:00+00
EWR	2013	2	9	5	30.2	24.8	80.07	310	16.11092	24.16638	0	\N	10	2013-02-09 10:00:00+00
EWR	2013	2	9	6	30.02	23	74.81	280	10.35702	\N	0	1011.9	10	2013-02-09 11:00:00+00
EWR	2013	2	9	7	28.4	21.2	74.08	300	23.0156	\N	0	\N	10	2013-02-09 12:00:00+00
EWR	2013	2	9	8	26.96	17.96	68.44	310	18.41248	27.61872	0	1014.1	10	2013-02-09 13:00:00+00
EWR	2013	2	9	9	26.96	17.06	65.84	310	13.80936	28.7695	0	1015.2	10	2013-02-09 14:00:00+00
EWR	2013	2	9	10	28.04	15.98	60.1	310	19.56326	28.7695	0	1016.5	10	2013-02-09 15:00:00+00
EWR	2013	2	9	11	28.94	15.98	57.92	320	28.7695	35.67418	0	1016.8	10	2013-02-09 16:00:00+00
EWR	2013	2	9	12	30.92	15.08	51.38	320	19.56326	26.46794	0	1017.1	10	2013-02-09 17:00:00+00
EWR	2013	2	9	13	33.08	14	44.92	300	17.2617	23.0156	0	1017.8	10	2013-02-09 18:00:00+00
EWR	2013	2	9	14	33.08	10.04	37.7	310	25.31716	33.37262	0	1018.3	10	2013-02-09 19:00:00+00
EWR	2013	2	9	15	33.08	8.06	34.5	320	16.11092	29.92028	0	1018.9	10	2013-02-09 20:00:00+00
EWR	2013	2	9	16	30.92	10.04	41.13	300	21.86482	29.92028	0	1020.1	10	2013-02-09 21:00:00+00
EWR	2013	2	9	17	30.02	8.06	39.03	320	18.41248	26.46794	0	1021.6	10	2013-02-09 22:00:00+00
EWR	2013	2	9	18	28.04	8.06	42.32	320	10.35702	19.56326	0	1022.8	10	2013-02-09 23:00:00+00
EWR	2013	2	9	19	26.96	6.98	42.14	310	11.5078	26.46794	0	1024	10	2013-02-10 00:00:00+00
EWR	2013	2	9	20	24.98	6.98	45.74	310	12.65858	23.0156	0	1025.4	10	2013-02-10 01:00:00+00
EWR	2013	2	9	21	24.08	6.98	47.49	310	11.5078	\N	0	1026.5	10	2013-02-10 02:00:00+00
EWR	2013	2	9	22	21.92	8.06	54.61	300	9.20624	\N	0	1027	10	2013-02-10 03:00:00+00
EWR	2013	2	9	23	19.94	6.98	56.56	310	6.90468	\N	0	1027.8	10	2013-02-10 04:00:00+00
EWR	2013	2	10	0	19.94	6.98	56.56	310	11.5078	\N	0	1028.2	10	2013-02-10 05:00:00+00
EWR	2013	2	10	1	19.04	6.98	58.78	310	9.20624	\N	0	1028.4	10	2013-02-10 06:00:00+00
EWR	2013	2	10	2	19.04	6.98	58.78	310	10.35702	\N	0	1028.5	10	2013-02-10 07:00:00+00
EWR	2013	2	10	3	19.04	6.98	58.78	330	6.90468	\N	0	1028.5	10	2013-02-10 08:00:00+00
EWR	2013	2	10	4	17.06	8.06	67.21	250	4.60312	\N	0	1028.9	10	2013-02-10 09:00:00+00
EWR	2013	2	10	5	15.98	8.06	70.43	290	5.7539	\N	0	1029.7	10	2013-02-10 10:00:00+00
EWR	2013	2	10	6	15.98	6.98	67.07	350	4.60312	\N	0	1030.1	10	2013-02-10 11:00:00+00
EWR	2013	2	10	7	17.96	8.06	64.65	0	0	\N	0	1031	10	2013-02-10 12:00:00+00
EWR	2013	2	10	8	23	8.06	52.18	330	5.7539	\N	0	1031.8	10	2013-02-10 13:00:00+00
EWR	2013	2	10	9	26.06	8.96	47.82	360	3.45234	\N	0	1032.2	10	2013-02-10 14:00:00+00
EWR	2013	2	10	10	26.96	8.96	46.08	0	0	\N	0	1032.4	10	2013-02-10 15:00:00+00
EWR	2013	2	10	11	28.94	10.04	44.58	200	3.45234	\N	0	1031.8	10	2013-02-10 16:00:00+00
EWR	2013	2	10	12	32	8.96	37.52	0	0	\N	0	1030.4	10	2013-02-10 17:00:00+00
EWR	2013	2	10	13	33.98	12.92	41.33	0	0	\N	0	1029.8	10	2013-02-10 18:00:00+00
EWR	2013	2	10	14	35.06	14	41.51	210	3.45234	\N	0	1029.6	10	2013-02-10 19:00:00+00
EWR	2013	2	10	15	33.98	10.04	36.37	190	5.7539	\N	0	1029	10	2013-02-10 20:00:00+00
EWR	2013	2	10	16	33.98	10.94	37.86	190	4.60312	\N	0	1028.7	10	2013-02-10 21:00:00+00
EWR	2013	2	10	17	33.98	15.08	45.43	160	3.45234	\N	0	1029.1	10	2013-02-10 22:00:00+00
EWR	2013	2	10	18	32	17.96	55.72	170	4.60312	\N	0	1029	10	2013-02-10 23:00:00+00
EWR	2013	2	10	19	32	19.04	58.37	150	5.7539	\N	0	1028.9	10	2013-02-11 00:00:00+00
EWR	2013	2	10	20	32	19.94	60.66	0	0	\N	0	1028.5	10	2013-02-11 01:00:00+00
EWR	2013	2	10	21	30.92	21.02	66.34	160	3.45234	\N	0	1028.2	10	2013-02-11 02:00:00+00
EWR	2013	2	10	22	30.92	21.02	66.34	180	4.60312	\N	0	1027.4	10	2013-02-11 03:00:00+00
EWR	2013	2	10	23	32	21.92	65.97	170	3.45234	\N	0	1027.3	10	2013-02-11 04:00:00+00
EWR	2013	2	11	0	30.92	21.92	68.92	0	0	\N	0	1026.5	10	2013-02-11 05:00:00+00
EWR	2013	2	11	1	30.92	21.02	66.34	0	0	\N	0	1026	10	2013-02-11 06:00:00+00
EWR	2013	2	11	2	32	23	69.04	0	0	\N	0	1024.8	10	2013-02-11 07:00:00+00
EWR	2013	2	11	3	33.08	26.06	75.11	0	0	\N	0	1023.5	9	2013-02-11 08:00:00+00
EWR	2013	2	11	4	32	26.96	81.42	20	3.45234	\N	0	1022.2	10	2013-02-11 09:00:00+00
EWR	2013	2	11	5	33.98	28.94	81.57	20	3.45234	\N	0.01	1021.1	8	2013-02-11 10:00:00+00
EWR	2013	2	11	6	35.6	33.8	93.08	0	0	\N	0.06	\N	4	2013-02-11 11:00:00+00
EWR	2013	2	11	7	37.4	37.4	100	30	3.45234	\N	0.07	\N	3	2013-02-11 12:00:00+00
EWR	2013	2	11	8	37.94	37.4	100	360	8.05546	\N	0.17	\N	2	2013-02-11 13:00:00+00
EWR	2013	2	11	9	35.96	35.96	100	20	6.90468	\N	0.07	\N	1	2013-02-11 14:00:00+00
EWR	2013	2	11	10	35.96	35.96	100	30	5.7539	\N	0.02	1014.5	0.5	2013-02-11 15:00:00+00
EWR	2013	2	11	11	37.04	35.96	95.82	360	3.45234	\N	0.01	1013.4	0.5	2013-02-11 16:00:00+00
EWR	2013	2	11	12	39.02	39.02	100	0	0	\N	0.01	1011.2	0.5	2013-02-11 17:00:00+00
EWR	2013	2	11	13	39.92	39.02	96.55	0	0	\N	0	1009.6	0.5	2013-02-11 18:00:00+00
EWR	2013	2	11	14	39.02	39.02	100	220	4.60312	\N	0	1008.8	0.5	2013-02-11 19:00:00+00
EWR	2013	2	11	15	41	41	100	0	0	\N	0	1007.1	0.5	2013-02-11 20:00:00+00
EWR	2013	2	11	16	41	39.92	95.9	250	3.45234	\N	0	1006.4	0.5	2013-02-11 21:00:00+00
EWR	2013	2	11	17	42.08	41	95.92	0	0	\N	0	1005.6	0.5	2013-02-11 22:00:00+00
\.


--
-- Data for Name: airlines; Type: TABLE DATA; Schema: rpostgresql; Owner: travis
--

COPY rpostgresql.airlines (carrier, name) FROM stdin;
9E	Endeavor Air Inc.
AA	American Airlines Inc.
AS	Alaska Airlines Inc.
B6	JetBlue Airways
DL	Delta Air Lines Inc.
EV	ExpressJet Airlines Inc.
F9	Frontier Airlines Inc.
FL	AirTran Airways Corporation
HA	Hawaiian Airlines Inc.
MQ	Envoy Air
OO	SkyWest Airlines Inc.
UA	United Air Lines Inc.
US	US Airways Inc.
VX	Virgin America
WN	Southwest Airlines Co.
YV	Mesa Airlines Inc.
\.


--
-- Data for Name: airports; Type: TABLE DATA; Schema: rpostgresql; Owner: travis
--

COPY rpostgresql.airports (faa, name, lat, lon, alt, tz, dst, tzone) FROM stdin;
04G	Lansdowne Airport	41.1304722	-80.6195833	1044	-5	A	America/New_York
06A	Moton Field Municipal Airport	32.4605722	-85.6800278	264	-6	A	America/Chicago
06C	Schaumburg Regional	41.9893408	-88.1012428	801	-6	A	America/Chicago
06N	Randall Airport	41.431912	-74.3915611	523	-5	A	America/New_York
09J	Jekyll Island Airport	31.0744722	-81.4277778	11	-5	A	America/New_York
0A9	Elizabethton Municipal Airport	36.3712222	-82.1734167	1593	-5	A	America/New_York
0G6	Williams County Airport	41.4673056	-84.5067778	730	-5	A	America/New_York
0G7	Finger Lakes Regional Airport	42.8835647	-76.7812318	492	-5	A	America/New_York
0P2	Shoestring Aviation Airfield	39.7948244	-76.6471914	1000	-5	U	America/New_York
0S9	Jefferson County Intl	48.0538086	-122.8106436	108	-8	A	America/Los_Angeles
0W3	Harford County Airport	39.5668378	-76.2024028	409	-5	A	America/New_York
10C	Galt Field Airport	42.4028889	-88.3751111	875	-6	U	America/Chicago
17G	Port Bucyrus-Crawford County Airport	40.7815556	-82.9748056	1003	-5	A	America/New_York
19A	Jackson County Airport	34.1758638	-83.5615972	951	-5	U	America/New_York
1A3	Martin Campbell Field Airport	35.0158056	-84.3468333	1789	-5	A	America/New_York
1B9	Mansfield Municipal	42.0001331	-71.1967714	122	-5	A	America/New_York
1C9	Frazier Lake Airpark	54.0133333333333	-124.768333333333	152	-8	A	America/Vancouver
1CS	Clow International Airport	41.6959744	-88.1292306	670	-6	U	America/Chicago
1G3	Kent State Airport	41.1513889	-81.4151111	1134	-5	A	America/New_York
1G4	Grand Canyon West Airport	35.899904	-113.815674	4813	-7	A	America/Phoenix
1H2	Effingham Memorial Airport	39.07	-88.534	585	-6	A	America/Chicago
1OH	Fortman Airport	40.5553253	-84.3866186	885	-5	U	America/New_York
1RL	Point Roberts Airpark	48.9797222	-123.0788889	10	-8	A	America/Los_Angeles
23M	Clarke CO	32.0517	-88.4434	320	-6	A	America/Chicago
24C	Lowell City Airport	42.95392	-85.3439058	681	-5	A	America/New_York
24J	Suwannee County Airport	30.300125	-83.0246944	104	-5	A	America/New_York
25D	Forest Lake Airport	45.2477456	-92.9943853	925	-6	A	America/Chicago
29D	Grove City Airport	41.1460278	-80.16775	1371	-5	A	America/New_York
2A0	Mark Anton Airport	35.48625	-84.9310833	718	-5	A	America/New_York
2B2	Plum Island Airport	42.7953611	-70.8394444	11	-5	A	America/New_York
2G2	Jefferson County Airpark	40.3602179	-80.7008742	1196	-5	A	America/New_York
2G9	Somerset County Airport	40.0388708	-79.0149951	2275	-5	A	America/New_York
2H0	Shelby County Airport	39.410556	-88.845556	550	-6	A	America/Chicago
2J9	Quincy Municipal Airport	30.5978708	-84.557425	225	-5	A	America/New_York
369	Atmautluak Airport	60.866667	-162.273056	18	-9	A	America/Anchorage
36U	Heber City Municipal Airport	40.4818056	-111.4288056	5637	-7	A	America/Denver
38W	Lynden Airport	48.9558961	-122.4581183	106	-8	A	America/Los_Angeles
3D2	Ephraim-Gibraltar Airport	45.1354167	-87.1879444	773	-6	A	America/Chicago
3G3	Wadsworth Municipal	41.0031572	-81.7564401	974	-5	A	America/New_York
3G4	Ashland County Airport	40.9029722	-82.2556389	1206	-5	A	America/New_York
3J1	Ridgeland Airport	32.4934167	-80.99175	79	-5	A	America/New_York
3W2	Put-in-Bay Airport	41.3521	-82.497	595	-5	A	America/New_York
40J	Perry-Foley Airport	30.0692778	-83.5805833	44	-5	A	America/New_York
41N	Braceville Airport	41.2111675	-80.9692572	900	-5	A	America/New_York
47A	Cherokee County Airport	34.3122175	-84.4221556	1219	-5	A	America/New_York
49A	Gilmer County Airport	34.6282222	-84.5265833	1486	-5	A	America/New_York
49X	Chemehuevi Valley	34.528889	-114.431971	638	-8	A	America/Los_Angeles
4A4	Polk County Airport - Cornelius Moore Field	34.0186944	-85.1464722	974	-5	A	America/New_York
4A7	Clayton County Tara Field	33.389099	-84.332397	874	-5	A	America/New_York
4A9	Isbell Field Airport	34.4736944	-85.7213889	877	-6	A	America/Chicago
4B8	Robertson Field	41.6893333	-72.8646944	202	-5	A	America/New_York
4G0	Pittsburgh-Monroeville Airport	40.4526389	-79.7749167	1187	-5	A	America/New_York
4G2	Hamburg Inc Airport	42.7008925	-78.9147569	751	-5	A	America/New_York
4G4	Youngstown Elser Metro Airport	40.9617953	-80.6773264	1070	-5	A	America/New_York
4I7	Putnam County Airport	39.6335556	-86.8138056	842	-5	U	America/New_York
4U9	Dell Flight Strip	44.7357483	-112.7200133	6007	-7	A	America/Denver
52A	Madison GA Municipal Airport	33.612125	-83.4604444	694	-5	A	America/New_York
54J	DeFuniak Springs Airport	30.7311111	-86.1537778	289	-6	A	America/Chicago
55J	Fernandina Beach Municipal Airport	30.6118333	-81.4611944	16	-5	A	America/New_York
55S	Packwood	46.3625	-121.4067	1057	-8	A	America/Los_Angeles
57C	East Troy Municipal Airport	42.7971667	-88.3726111	860	-6	A	America/Chicago
5B2	Saratoga County Airport	43.050722	-73.861638	433	-5	A	America/New_York
60J	Ocean Isle Beach Airport	33.9085056	-78.4366722	32	-5	U	America/New_York
6A2	Griffin-Spalding County Airport	33.2269722	-84.2749444	958	-5	A	America/New_York
6J4	Saluda County	33.5561	-81.4768	539	-5	A	America/New_York
6K8	Tok Junction Airport	63.329444	-142.953611	1639	-9	A	America/Anchorage
6S0	Big Timber Airport	45.8063889	-109.9811111	4492	-7	A	America/Denver
6S2	Florence	43.9828168	-124.1113687	51	-8	A	America/Los_Angeles
6Y8	Welke Airport	45.721111	-85.520278	664	-5	A	America/New_York
70J	Cairo-Grady County Airport	30.8879767	-84.1547353	265	-5	A	America/New_York
70N	Spring Hill Airport	41.3473569	-75.4158972	1729	-5	A	America/New_York
7A4	Foster Field	42.4664444	-90.1693889	990	-6	A	America/Chicago
7D9	Germack Airport	41.7778322	-80.9039797	820	-5	A	America/New_York
7N7	Spitfire Aerodrome	39.7355633	-75.3977211	40	-5	A	America/New_York
8M8	Garland Airport	44.8065278	-84.2761944	1218	-5	A	America/New_York
93C	Richland Airport	43.2833575	-90.2982819	742	-6	A	America/Chicago
99N	Bamberg County Airport	33.3045278	-81.1084167	231	-5	A	America/New_York
9A1	Covington Municipal Airport	33.6323083	-83.8474472	809	-5	A	America/New_York
9A5	Barwick Lafayette Airport	34.6884792	-85.2903319	777	-5	A	America/New_York
9G1	Rock Airport	40.6035463	-79.8261189	1063	-5	A	America/New_York
A39	Phoenix Regional Airport	32.99169921875	-111.920997619629	1300	-7	A	America/Phoenix
A50	Colorado Springs East	38.87	-104.41	6145	-7	A	America/Denver
AAF	Apalachicola Regional Airport	29.7276066	-85.0274416	20	-5	A	America/New_York
AAP	Andrau Airport	29.43	-95.35	80	-6	A	America/Chicago
ABE	Lehigh Valley Intl	40.652083	-75.440806	393	-5	A	America/New_York
ABI	Abilene Rgnl	32.411319	-99.681897	1791	-6	A	America/Chicago
ABL	Ambler Airport	67.106389	-157.8575	334	-9	A	America/Anchorage
ABQ	Albuquerque International Sunport	35.0402222	-106.6091944	5355	-7	A	America/Denver
ABR	Aberdeen Regional Airport	45.4491	-98.4218	1302	-6	A	America/Chicago
ABY	Southwest Georgia Regional Airport	31.5355	-84.1945	197	-5	A	America/New_York
ACJ	Jimmy Carter Regional	32.0665	-84.1133	468	-5	A	America/New_York
ACK	Nantucket Mem	41.253053	-70.060181	48	-5	A	America/New_York
ACT	Waco Rgnl	31.611289	-97.230519	516	-6	A	America/Chicago
ACV	Arcata	40.978111	-124.108611	221	-8	A	America/Los_Angeles
ACY	Atlantic City Intl	39.457583	-74.577167	75	-5	A	America/New_York
ADK	Adak Airport	51.878	-176.646	18	-9	A	America/Anchorage
ADM	Ardmore Muni	34.300833	-97.008889	762	-6	A	America/Chicago
ADQ	Kodiak	57.749967	-152.493856	78	-9	A	America/Anchorage
ADS	Addison	32.9685594	-96.8364478	644	-6	A	America/Chicago
ADW	Andrews Afb	38.810806	-76.867028	280	-5	A	America/New_York
AET	Allakaket Airport	66.5519	-152.6222	441	-9	A	America/Anchorage
AEX	Alexandria Intl	31.3274	-92.549833	89	-6	A	America/Chicago
AFE	Kake Airport	56.961389	-133.910278	172	-9	A	America/Anchorage
AFW	Fort Worth Alliance Airport	32.987778	-97.318889	722	-6	A	America/Chicago
AGC	Allegheny County Airport	40.3544	-79.9302	1252	-5	A	America/New_York
AGN	Angoon Seaplane Base	57.503611	-134.585	0	-9	A	America/Anchorage
AGS	Augusta Rgnl At Bush Fld	33.369944	-81.9645	144	-5	A	America/New_York
AHN	Athens Ben Epps Airport	33.9486	-83.3263	808	-5	A	America/New_York
AIA	Alliance Municipal Airport	42.053333	-102.803889	3931	-7	A	America/Denver
AIK	Municipal Airport	33.6493889	-81.6850278	529	-5	A	America/New_York
AIN	Wainwright Airport	70.638056	-159.994722	41	-9	A	America/Anchorage
AIZ	Lee C Fine Memorial Airport	38.096035	-92.5494875	869	-6	A	America/Chicago
AKB	Atka Airport	52.220278	-174.206389	56	-9	A	America/Anchorage
AKC	Akron Fulton Intl	41.0375	-81.466917	1067	-5	A	America/New_York
AKI	Akiak Airport	60.902778	-161.230556	30	-9	A	America/Anchorage
AKK	Akhiok Airport	56.938611	-154.1825	44	-9	A	America/Anchorage
AKN	King Salmon	58.676778	-156.649278	68	-9	A	America/Anchorage
AKP	Anaktuvuk Pass Airport	68.1336	-151.743	2103	-9	A	America/Anchorage
ALB	Albany Intl	42.748267	-73.801692	285	-5	A	America/New_York
ALI	Alice Intl	27.740889	-98.026944	178	-6	A	America/Chicago
ALM	Alamogordo White Sands Regional Airport	32.8399	-105.991	4200	-7	A	America/Denver
ALO	Waterloo Regional Airport	42.5571	-92.4003	873	-6	A	America/Chicago
ALS	San Luis Valley Regional Airport	37.435	-105.866667	7539	-7	A	America/Denver
ALW	Walla Walla Regional Airport	46.0949	-118.288	1191	-8	A	America/Los_Angeles
ALX	Alexandria	38.806346	-77.0621	1	-5	A	America/New_York
ALZ	Alitak Seaplane Base	56.899444	-154.247778	0	-9	A	America/Anchorage
AMA	Rick Husband Amarillo Intl	35.219369	-101.705931	3607	-6	A	America/Chicago
ANB	Anniston Metro	33.588167	-85.858111	612	-6	A	America/Chicago
ANC	Ted Stevens Anchorage Intl	61.174361	-149.996361	152	-9	A	America/Anchorage
AND	Anderson Rgnl	34.494583	-82.709389	782	-5	A	America/New_York
ANI	Aniak Airport	61.5816	-159.543	88	-9	A	America/Anchorage
ANN	Annette Island	55.042436	-131.572233	119	-9	A	America/Anchorage
ANP	Lee Airport	38.942778	-76.568333	34	-5	A	America/New_York
ANQ	Tri-State Steuben County Airport	41.6396983	-85.0834933	995	-5	A	America/New_York
ANV	Anvik Airport	62.6467	-160.191	309	-9	A	America/Anchorage
AOH	Lima Allen County Airport	40.707478	-84.0270781	975	-5	A	America/New_York
AOO	Altoona Blair Co	40.296372	-78.320022	1504	-5	A	America/New_York
AOS	Amook Bay Seaplane Base	57.471389	-153.815278	0	-9	A	America/Anchorage
APA	Centennial	39.570129	-104.849294	5883	-7	A	America/Denver
APC	Napa County Airport	38.2131944	-122.2806944	35	-8	A	America/Los_Angeles
APF	Naples Muni	26.152619	-81.775294	8	-5	A	America/New_York
APG	Phillips Aaf	39.466219	-76.168808	57	-5	A	America/New_York
APN	Alpena County Regional Airport	45.0781	-83.5603	689	-5	A	America/New_York
AQC	Klawock Seaplane Base	55.554658	-133.101693	0	-9	A	America/Anchorage
ARA	Acadiana Rgnl	30.037758	-91.883896	24	-6	A	America/Chicago
ARB	Ann Arbor Municipal Airport	42.132274	-83.444418	839	-5	A	America/New_York
ARC	Arctic Village Airport	68.1147	-145.579	2092	-9	A	America/Anchorage
ART	Watertown Intl	43.991922	-76.021739	325	-5	A	America/New_York
ARV	Lakeland	45.927778	-89.730833	1629	-6	A	America/Chicago
ASE	Aspen Pitkin County Sardy Field	39.2232	-106.869	7820	-7	A	America/Denver
ASH	Boire Field Airport	42.78175	-71.5147778	199	-5	A	America/New_York
AST	Astoria Regional Airport	46.157972	-123.878694	15	-8	A	America/Los_Angeles
ATK	Atqasuk Edward Burnell Sr Memorial Airport	70.4673	-157.436	96	-9	A	America/Anchorage
ATL	Hartsfield Jackson Atlanta Intl	33.636719	-84.428067	1026	-5	A	America/New_York
ATT	Camp Mabry Austin City	30.31666	-97.7666	0	-6	A	America/Chicago
ATW	Appleton	44.257526	-88.507576	680	-6	A	America/Chicago
ATY	Watertown Regional Airport	44.914	-97.1547	1748	-6	A	America/Chicago
AUG	Augusta State	44.320647	-69.797317	352	-5	A	America/New_York
AUK	Alakanuk Airport	62.68	-164.66	10	-9	A	America/Anchorage
AUO	Auburn University Regional	32.3691	-85.2604	777	-6	A	America/Chicago
AUS	Austin Bergstrom Intl	30.194528	-97.669889	542	-6	A	America/Chicago
AUW	Wausau Downtown Airport	44.9262845	-89.6270018	1201	-6	U	America/Chicago
AVL	Asheville Regional Airport	35.436194	-82.541806	2165	-5	A	America/New_York
AVO	Executive	27.591389	-81.528889	160	-5	A	America/New_York
AVP	Wilkes Barre Scranton Intl	41.338478	-75.723403	962	-5	A	America/New_York
AVW	Marana Regional	32.409556	-111.218388	2031	-7	U	America/Phoenix
AVX	Avalon	33.405	-118.415833	1602	-8	A	America/Los_Angeles
AZA	Phoenix-Mesa Gateway	33.307833	-111.655	1382	-7	N	America/Phoenix
AZO	Kalamazoo	42.234875	-85.552058	874	-5	A	America/New_York
BAB	Beale Afb	39.136089	-121.436567	113	-8	A	America/Los_Angeles
BAD	Barksdale Afb	32.50182	-93.662674	166	-6	A	America/Chicago
BAF	Barnes Municipal	42.1579472	-72.715875	270	-5	A	America/New_York
BBX	Wings Field	40.1375	-75.265	302	-5	A	America/New_York
BCE	Bryce Canyon	37.706444	-112.145806	7590	-7	A	America/Denver
BCT	Boca Raton	26.3785	-80.107694	13	-5	A	America/New_York
BDE	Baudette Intl	48.728444	-94.612222	1086	-6	A	America/Chicago
BDL	Bradley Intl	41.938889	-72.683222	173	-5	A	America/New_York
BDR	Igor I Sikorsky Mem	41.163472	-73.126167	9	-5	A	America/New_York
BEC	Beech Factory Airport	37.6939167	-97.2149167	1409	-6	A	America/Chicago
BED	Laurence G Hanscom Fld	42.469953	-71.289031	133	-5	A	America/New_York
BEH	Southwest Michigan Regional Airport	42.1285833	-86.4285	643	-5	A	America/New_York
BET	Bethel	60.779778	-161.838	121	-9	A	America/Anchorage
BFD	Bradford Regional Airport	41.8031	-78.6401	2143	-5	A	America/New_York
BFF	Western Nebraska Regional Airport	41.874	-103.596	3967	-7	A	America/Denver
BFI	Boeing Fld King Co Intl	47.53	-122.301947	21	-8	A	America/Los_Angeles
BFL	Meadows Fld	35.433598	-119.05677	507	-8	A	America/Los_Angeles
BFM	Mobile Downtown	30.626783	-88.068092	26	-6	A	America/Chicago
BFP	Beaver Falls	40.7724722	-80.3914444	1253	-5	A	America/New_York
BFT	Beaufort	32.477411	-80.723161	37	-5	A	America/New_York
BGE	Decatur County Industrial Air Park	30.9715981	-84.6369278	141	-5	A	America/New_York
BGM	Greater Binghamton Edwin A Link Fld	42.208689	-75.979839	1636	-5	A	America/New_York
BGR	Bangor Intl	44.807444	-68.828139	192	-5	A	America/New_York
BHB	Hancock County - Bar Harbor	44.4497689	-68.3615653	83	-5	A	America/New_York
BHM	Birmingham Intl	33.562942	-86.75355	644	-6	A	America/Chicago
BID	Block Island State Airport	41.168056	-71.577778	108	-5	A	America/New_York
BIF	Biggs Aaf	31.849528	-106.380039	3948	-7	A	America/Denver
BIG	Allen Aaf	63.994547	-145.721642	1291	-9	A	America/Anchorage
BIL	Billings Logan International Airport	45.80921	-108.537654	3652	-7	A	America/Denver
BIS	Bismarck Municipal Airport	46.775842	-100.757931	1661	-6	A	America/Chicago
BIV	Tulip City Airport	42.7427778	-86.1078333	698	-5	A	America/New_York
BIX	Keesler Afb	30.410425	-88.924433	33	-6	A	America/Chicago
BJC	Rocky Mountain Metropolitan Airport	39.90888888	-105.11722222	5670	-7	A	America/Denver
BJI	Bemidji Regional Airport	47.510722	-94.934722	1391	-6	A	America/Chicago
BKC	Buckland Airport	65.981667	-161.149167	31	-9	A	America/Anchorage
BKD	Stephens Co	32.719047	-98.891	1284	-6	A	America/Chicago
BKF	Buckley Afb	39.701668	-104.75166	5662	-7	A	America/Denver
BKG	Branson LLC	36.531994	-93.200556	1302	-6	A	America/Chicago
BKH	Barking Sands Pmrf	22.022833	-159.785	23	-10	A	Pacific/Honolulu
BKL	Burke Lakefront Airport	41.5175	-81.683333	583	-5	A	America/New_York
BKW	Raleigh County Memorial Airport	37.7873	-81.1242	2504	-5	A	America/New_York
BKX	Brookings Regional Airport	44.3048	-96.8169	1648	-6	A	America/Chicago
BLD	Boulder City Municipal Airport	35.5651	-114.514	2201	-7	U	America/Phoenix
BLF	Mercer County Airport	37.2958	-81.2077	2857	-5	A	America/New_York
BLH	Blythe Airport	33.619167	-114.716889	399	-8	A	America/Los_Angeles
BLI	Bellingham Intl	48.792694	-122.537528	170	-8	A	America/Los_Angeles
BLV	Scott Afb Midamerica	38.545178	-89.835183	459	-6	A	America/Chicago
BMC	Brigham City	41.552	-112.062	4229	-7	A	America/Denver
BMG	Monroe County Airport	39.1460208	-86.6166805	846	-5	A	America/New_York
BMI	Central Illinois Rgnl	40.477111	-88.915917	871	-6	A	America/Chicago
BMT	Beaumont Municipal	30.0702044	-94.2150967	32	-6	A	America/Chicago
BMX	Big Mountain Afs	59.361247	-155.258822	663	-9	A	America/Anchorage
BNA	Nashville Intl	36.124472	-86.678194	599	-6	A	America/Chicago
BOI	Boise Air Terminal	43.564361	-116.222861	2871	-7	A	America/Denver
BOS	General Edward Lawrence Logan Intl	42.364347	-71.005181	19	-5	A	America/New_York
BOW	Bartow Municipal Airport	27.9434	-81.7834	125	-5	U	America/New_York
BPT	Southeast Texas Rgnl	29.950833	-94.020694	15	-6	A	America/Chicago
BQK	Brunswick Golden Isles Airport	31.2588	-81.4665	26	-5	A	America/New_York
BRD	Brainerd Lakes Rgnl	46.398308	-94.138078	1226	-6	U	America/Chicago
BRL	Southeast Iowa Regional Airport	40.7832	-91.1255	698	-6	A	America/Chicago
BRO	Brownsville South Padre Island Intl	25.906833	-97.425861	22	-6	A	America/Chicago
BRW	Wiley Post Will Rogers Mem	71.285446	-156.766003	44	-9	A	America/Anchorage
BSF	Bradshaw Aaf	19.760056	-155.553717	6190	-10	A	Pacific/Honolulu
BTI	Barter Island Lrrs	70.133989	-143.581867	2	-9	A	America/Anchorage
BTM	Bert Mooney Airport	45.954806	-112.497472	5550	-7	A	America/Denver
BTR	Baton Rouge Metro Ryan Fld	30.533167	-91.149639	70	-6	A	America/Chicago
BTT	Bettles	66.913944	-151.529056	644	-9	A	America/Anchorage
BTV	Burlington Intl	44.471861	-73.153278	335	-5	A	America/New_York
BUF	Buffalo Niagara Intl	42.940525	-78.732167	724	-5	A	America/New_York
BUR	Bob Hope	34.200667	-118.358667	778	-8	A	America/Los_Angeles
BUU	Municipal Airport	42.6907171	-88.3046825	780	-6	A	America/Chicago
BUY	Burlington-Alamance Regional Airport	36.0485433	-79.4748892	617	-5	A	America/New_York
BVY	Beverly Municipal Airport	42.584141	-70.9161444	107	-5	A	America/New_York
BWD	KBWD	31.7936111	-98.9565	1387	-6	A	America/Chicago
BWG	Bowling Green-Warren County Regional Airport	36.9645278	-86.4196667	547	-6	A	America/Chicago
BWI	Baltimore Washington Intl	39.175361	-76.668333	146	-5	A	America/New_York
BXK	Buckeye Municipal Airport	33.420417	-112.68618	1033	-7	U	America/Phoenix
BXS	Borrego Valley Airport	33.2590278	-116.3209722	520	-8	A	America/Los_Angeles
BYH	Arkansas Intl	35.964347	-89.943956	254	-6	A	America/Chicago
BYS	Bicycle Lake Aaf	35.280531	-116.630031	2350	-8	A	America/Los_Angeles
BYW	Blakely Island Airport	48.56025	-122.80243	0	-8	A	America/Los_Angeles
BZN	Gallatin Field	45.777643	-111.160151	4500	-7	A	America/Denver
C02	Grand Geneva Resort Airport	42.6149167	-88.3895833	835	-6	U	America/Chicago
C16	Frasca Field	40.144979	-88.200197	735	-6	A	America/Chicago
C47	Portage Municipal Airport	43.5603136	-89.4828607	825	-6	U	America/Chicago
C65	Plymouth Municipal Airport	41.3651307	-86.3002574	800	-5	A	America/New_York
C89	Sylvania Airport	42.70325	-87.9589722	785	-6	A	America/Chicago
C91	Dowagiac Municipal Airport	41.9929342	-86.1280125	748	-5	U	America/New_York
CAE	Columbia Metropolitan	33.938833	-81.119528	236	-5	A	America/New_York
CAK	Akron Canton Regional Airport	40.9160833	-81.4421944	1228	-5	A	America/New_York
CAR	Caribou Muni	46.8715	-68.017917	626	-5	A	America/New_York
CBE	Greater Cumberland Rgnl.	39.615278	-78.760556	775	-5	A	America/New_York
CBM	Columbus Afb	33.643833	-88.443833	219	-6	A	America/Chicago
CCO	Coweta County Airport	33.3115656	-84.7697554	970	-5	A	America/New_York
CCR	Buchanan Field Airport	37.9896667	-122.0568889	26	-8	A	America/Los_Angeles
CDB	Cold Bay	55.206061	-162.725436	96	-9	A	America/Anchorage
CDC	Cedar City Rgnl	37.700967	-113.098847	5622	-7	A	America/Denver
CDI	Cambridge Municipal Airport	39.9750278	-81.5775833	799	-5	U	America/New_York
CDK	CedarKey	29.1342222	-83.0504722	11	-5	A	America/New_York
CDN	Woodward Field	34.2835833	-80.5648611	302	-5	A	America/New_York
CDR	Chadron Municipal Airport	42.8375	-103.095556	3297	-7	A	America/Denver
CDS	Childress Muni	34.433781	-100.287992	1954	-6	A	America/Chicago
CDV	Merle K Mudhole Smith	60.491778	-145.477556	48	-9	A	America/Anchorage
CDW	Caldwell Essex County Airport	40.8752222	-74.2813611	172	-5	A	America/New_York
CEC	Del Norte County Airport	41.7802	-124.237	57	-8	A	America/Los_Angeles
CEF	Westover Arb Metropolitan	42.194014	-72.534783	241	-5	A	America/New_York
CEM	Central Airport	65.573889	-144.780833	937	-9	A	America/Anchorage
CEU	Clemson	34.6722222	-82.8858889	891	-5	A	America/New_York
CEW	Bob Sikes	30.778833	-86.522111	213	-6	A	America/Chicago
CEZ	Cortez Muni	37.303	-108.628056	5918	-7	A	America/Denver
CFD	Coulter Fld	30.715694	-96.331361	367	-6	A	America/Chicago
CGA	Craig Seaplane Base	55.478889	-133.147778	0	-9	A	America/Anchorage
CGC	Crystal River	28.8676111	-82.5741111	9	-5	A	America/New_York
CGF	Cuyahoga County	41.565124	-81.4863555	879	-5	A	America/New_York
CGI	Cape Girardeau Regional Airport	37.2253	-89.5708	342	-6	A	America/Chicago
CGX	Meigs Field	41.860278	-87.609722	585	-6	A	America/Chicago
CGZ	Casa Grande Municipal Airport	32.954889	-111.766832	1464	-7	U	America/Phoenix
CHA	Lovell Fld	35.035278	-85.203808	683	-5	A	America/New_York
CHI	All Airports	41.883611	-87.631667	596	-6	A	America/Chicago
CHO	Charlottesville-Albemarle	38.138639	-78.452861	639	-5	A	America/New_York
CHS	Charleston Afb Intl	32.898647	-80.040528	45	-5	A	America/New_York
CHU	Chuathbaluk Airport	61.579167	-159.215556	243	-9	A	America/Anchorage
CIC	Chico Muni	39.795383	-121.858422	238	-8	A	America/Los_Angeles
CID	Cedar Rapids	41.884694	-91.710806	869	-6	A	America/Chicago
CIK	Chalkyitsik Airport	66.645	-143.74	544	-9	A	America/Anchorage
CIL	Council Airport	64.897778	-163.703333	85	-9	A	America/Anchorage
CIU	Chippewa County International Airport	46.2508	-84.4724	800	-5	A	America/New_York
CKB	Harrison Marion Regional Airport	39.2966	-80.2281	1217	-5	A	America/New_York
CKD	Crooked Creek Airport	61.867778	-158.135	178	-9	A	America/Anchorage
CKF	Crisp County Cordele Airport	31.9888333	-83.7739167	310	-5	A	America/New_York
CKV	Clarksville-Montgomery County Regional Airport	36.621944	-87.415	550	-6	A	America/Chicago
CLC	Clear Lake Metroport	29.5569	-95.137497	35	-6	A	America/Chicago
CLD	McClellan-Palomar Airport	33.0742	-117.1648	328	-8	A	America/Los_Angeles
CLE	Cleveland Hopkins Intl	41.411689	-81.849794	791	-5	A	America/New_York
CLL	Easterwood Fld	30.588583	-96.363833	321	-6	A	America/Chicago
CLM	William R Fairchild International Airport	48.1202	-123.5	291	-8	A	America/Los_Angeles
CLS	Chehalis-Centralia	46.4062	-122.5897	177	-8	A	America/Los_Angeles
CLT	Charlotte Douglas Intl	35.214	-80.943139	748	-5	A	America/New_York
CLW	Clearwater Air Park	27.9764722	-82.7586667	70	-5	A	America/New_York
CMH	Port Columbus Intl	39.997972	-82.891889	815	-5	A	America/New_York
CMI	Champaign	40.03925	-88.278056	754	-6	A	America/Chicago
CMX	Houghton County Memorial Airport	47.1684	-88.4891	1095	-5	A	America/New_York
CNM	Cavern City Air Terminal	32.337472	-104.263278	3295	-7	A	America/Denver
CNW	Tstc Waco	31.637831	-97.074139	470	-6	A	America/Chicago
CNY	Canyonlands Field	38.755	-109.754722	4555	-7	A	America/Denver
COD	Yellowstone Rgnl	44.520194	-109.023806	5102	-7	A	America/Denver
COE	Pappy Boyington	47.7743056	-116.8195833	2320	-8	A	America/Los_Angeles
COF	Patrick Afb	28.234922	-80.610125	8	-5	A	America/New_York
COI	Merritt Island Airport	28.3416111	-80.6854722	6	-5	A	America/New_York
CON	Concord Municipal	43.20267	-71.50233	342	-5	A	America/New_York
COS	City Of Colorado Springs Muni	38.805805	-104.700778	6187	-7	A	America/Denver
COT	Cotulla Lasalle Co	28.456694	-99.220294	474	-6	A	America/Chicago
COU	Columbia Rgnl	38.818094	-92.219631	889	-6	A	America/Chicago
CPR	Natrona Co Intl	42.908	-106.464417	5347	-7	A	America/Denver
CPS	St. Louis Downtown Airport	38.5707244	-90.1562211	413	-6	U	America/Chicago
CRE	Grand Strand Airport	33.81175	-78.7239444	31	-5	A	America/New_York
CRP	Corpus Christi Intl	27.770361	-97.501222	44	-6	A	America/Chicago
CRW	Yeager	38.373147	-81.593189	981	-5	A	America/New_York
CSG	Columbus Metropolitan Airport	32.5163333	-84.9388611	397	-5	A	America/New_York
CTB	Cut Bank Muni	48.608353	-112.376144	3854	-7	A	America/Denver
CTH	Chester County G O Carlson Airport	39.9789	-75.8654	660	-5	A	America/New_York
CTJ	West Georgia Regional Airport - O V Gray Field	33.6316964	-85.1522641	1165	-5	A	America/New_York
CTY	Cross City	29.6355278	-83.10475	42	-5	A	America/New_York
CVG	Cincinnati Northern Kentucky Intl	39.048836	-84.667822	896	-5	A	America/New_York
CVN	Clovis Muni	34.425139	-103.079278	4216	-7	A	America/Denver
CVO	Corvallis Muni	44.5067	-123.2915	250	-8	A	America/Los_Angeles
CVS	Cannon Afb	34.382775	-103.322147	4295	-7	A	America/Denver
CVX	Charlevoix Municipal Airport	45.3047778	-85.2753333	669	-5	A	America/New_York
CWA	Central Wisconsin	44.772726	-89.646635	840	-6	A	America/Chicago
CWI	Clinton Municipal	41.83075	-90.3289722	708	-6	A	America/Chicago
CWT	Chatsworth Station	34.256944	-118.598889	978	-8	A	America/Los_Angeles
CXF	Coldfoot Airport	67.251389	-150.176111	1014	-9	A	America/Anchorage
CXL	Calexico Intl	32.669502	-115.51333	4	-8	A	America/Los_Angeles
CXO	Lone Star Executive	30.351833	-95.414467	245	-6	A	America/Chicago
CXY	Capital City Airport	40.2171389	-76.8513611	347	-5	A	America/New_York
CYF	Chefornak Airport	60.149167	-164.285556	40	-9	A	America/Anchorage
CYM	Chatham Seaplane Base	57.515	-134.946111	0	-9	A	America/Anchorage
CYS	Cheyenne Rgnl Jerry Olson Fld	41.155722	-104.811839	6156	-7	A	America/Denver
CYT	Yakataga Airport	60.081901	-142.493611	12	-9	A	America/Anchorage
CZF	Cape Romanzof Lrrs	61.780297	-166.038747	457	-9	A	America/Anchorage
CZG	Tri-Cities	42.0471	-76.0578	833	-5	A	America/New_York
CZN	Chisana Airport	62.071111	-142.048333	1011	-9	A	America/Anchorage
DAB	Daytona Beach Intl	29.179917	-81.058056	34	-5	A	America/New_York
DAL	Dallas Love Fld	32.847111	-96.851778	487	-6	A	America/Chicago
DAW	Skyhaven Airport	43.2840556	-70.9292778	321	-5	A	America/New_York
DAY	James M Cox Dayton Intl	39.902375	-84.219375	1009	-5	A	America/New_York
DBN	W H Barron Field	32.3388	-82.591	311	-5	A	America/New_York
DBQ	Dubuque Rgnl	42.402	-90.709472	1076	-6	A	America/Chicago
DCA	Ronald Reagan Washington Natl	38.852083	-77.037722	15	-5	A	America/New_York
DDC	Dodge City Regional Airport	37.7634	-99.9656	2594	-6	A	America/Chicago
DEC	Decatur	39.834564	-88.865689	682	-6	A	America/Chicago
DEN	Denver Intl	39.861656	-104.673178	5431	-7	A	America/Denver
DET	Coleman A Young Muni	42.409195	-83.009861	626	-5	A	America/New_York
DFW	Dallas Fort Worth Intl	32.896828	-97.037997	607	-6	A	America/Chicago
DGL	Douglas Municipal Airport	31.3426028	-109.5064544	4173	-7	N	America/Phoenix
DHB	Deer Harbor Seaplane	48.618397	-123.00596	0	-8	A	America/Los_Angeles
DHN	Dothan Rgnl	31.321339	-85.449628	401	-6	A	America/Chicago
DHT	Dalhart Muni	36.022586	-102.547278	3991	-6	A	America/Chicago
DIK	Dickinson Theodore Roosevelt Regional Airport	46.7975	-102.801944	2592	-7	A	America/Denver
DKB	De Kalb Taylor Municipal Airport	41.9338342	-88.7056864	914	-6	U	America/Chicago
DKK	Chautauqua County-Dunkirk Airport	42.4933353	-79.2720417	693	-5	A	America/New_York
DKX	Knoxville Downtown Island Airport	35.9638333	-83.8736667	833	-5	A	America/New_York
DLF	Laughlin Afb	29.359486	-100.777975	1082	-6	A	America/Chicago
DLG	Dillingham	59.044667	-158.5055	74	-9	A	America/Anchorage
DLH	Duluth Intl	46.842091	-92.193649	1428	-6	A	America/Chicago
DLL	Baraboo Wisconsin Dells Airport	43.5217843	-89.7709266	979	-6	A	America/Chicago
DMA	Davis Monthan Afb	32.166467	-110.883144	2704	-7	A	America/Phoenix
DNL	Daniel Field Airport	33.4665028	-82.0393808	423	-5	A	America/New_York
DNN	Dalton Municipal Airport	34.7229444	-84.87025	709	-5	A	America/New_York
DNV	Vermilion Regional	40.1996944	-87.5955278	696	-6	A	America/Chicago
DOV	Dover Afb	39.129539	-75.465958	28	-5	A	America/New_York
DPA	Dupage	41.907778	-88.248611	758	-6	A	America/Chicago
DQH	Douglas Municipal Airport	31.4767385	-82.8605664	257	-5	A	America/New_York
DRG	Deering Airport	66.0696	-162.766	21	-9	A	America/Anchorage
DRI	Beauregard Rgnl	30.831722	-93.339917	202	-6	A	America/Chicago
DRM	Drummond Island Airport	46.0093114	-83.7439342	668	-5	A	America/New_York
DRO	Durango La Plata Co	37.151516	-107.75377	6685	-7	A	America/Denver
DRT	Del Rio Intl	29.374208	-100.927158	1002	-6	A	America/Chicago
DSM	Des Moines Intl	41.533972	-93.663083	958	-6	A	America/Chicago
DTA	Delta Municipal Airport	39.3806386	-112.5077147	4759	-7	A	America/Denver
DTS	Destin	30.4000611	-86.4714772	23	-6	A	America/Chicago
DTW	Detroit Metro Wayne Co	42.212444	-83.353389	645	-5	A	America/New_York
DUC	Halliburton Field Airport	34.4713056	-97.9598611	1114	-6	A	America/Chicago
DUG	Bisbee Douglas Intl	31.469028	-109.603667	4154	-7	A	America/Phoenix
DUJ	DuBois Regional Airport	41.1783	-78.8987	1817	-5	A	America/New_York
DUT	Unalaska	53.900139	-166.5435	22	-9	A	America/Anchorage
DVL	Devils Lake Regional Airport	48.114444	-98.908611	1445	-6	A	America/Chicago
DVT	Deer Valley Municipal Airport	33.4117	112.457	1478	8	A	Asia/Chongqing
DWA	Yolo County Airport	38.5793889	-121.8569444	100	-8	A	America/Los_Angeles
DWH	David Wayne Hooks Field	30.063746	-95.554276	152	-6	A	America/Chicago
DWS	Orlando	28.398	-81.57	340	-5	A	America/New_York
DXR	Danbury Municipal Airport	41.3715353	-73.4821906	458	-5	A	America/New_York
DYS	Dyess Afb	32.420756	-99.8546	1789	-6	A	America/Chicago
E25	Wickenburg Municipal Airport	33.96889877	-112.7990036	2377	-7	A	America/Phoenix
E51	Bagdad Airport	34.5958528	-113.170195	4183	-7	A	America/Phoenix
E55	Ocean Ridge Airport	38.8016111	-123.5306389	940	-8	A	America/Los_Angeles
E63	Gila Bend Municipal Airport	32.960169	-112.673636	789	-7	U	America/Phoenix
E91	Chinle Municipal Airport	36.1108806	-109.5754222	5547	-7	N	America/Denver
EAA	Eagle Airport	64.778056	-141.149722	908	-9	A	America/Anchorage
EAR	Kearney Municipal Airport	40.727	-99.0068	2131	-6	A	America/Chicago
EAT	Pangborn Field	47.398	-120.206	1249	-8	A	America/Los_Angeles
EAU	Chippewa Valley Regional Airport	44.8658	-91.4843	913	-6	A	America/Chicago
ECA	Iosco County	44.311	-83.422	606	-5	A	America/New_York
ECG	Elizabeth City Cgas Rgnl	36.260581	-76.174572	12	-5	A	America/New_York
ECP	Panama City-NW Florida Bea.	30.3417	-85.7973	69	-6	A	America/Chicago
EDF	Elmendorf Afb	61.250986	-149.806503	212	-9	A	America/Anchorage
EDW	Edwards Afb	34.905417	-117.883739	2302	-8	A	America/Los_Angeles
EEK	Eek Airport	60.213611	-162.043889	15	-9	A	America/Anchorage
EEN	Dillant Hopkins Airport	72.270833	42.898333	149	-5	A	\N
EET	Shelby County Airport	33.1777778	-86.7832222	586	-6	A	America/Chicago
EFD	Ellington Fld	29.607333	-95.15875	32	-6	A	America/Chicago
EGA	Eagle County Airport	39.6427611	-106.9159347	6548	-7	U	America/Denver
EGE	Eagle Co Rgnl	39.642556	-106.917694	6540	-7	A	America/Denver
EGT	Wellington Municipal	37.39411	-97.423225	1277	-6	A	America/Chicago
EGV	Eagle River	45.932333	-89.268283	1642	-6	A	America/Chicago
EGX	Egegik Airport	58.185556	-157.375556	92	-9	A	America/Anchorage
EHM	Cape Newenham Lrrs	58.646428	-162.062778	541	-9	A	America/Anchorage
EIL	Eielson Afb	64.665667	-147.1015	548	-9	A	America/Anchorage
EKI	Elkhart Municipal	41.719444	-86.003333	778	-5	A	America/New_York
EKN	Elkins Randolph Co Jennings Randolph	38.889444	-79.857139	1987	-5	A	America/New_York
EKO	Elko Regional Airport	40.8249	-115.792	5140	-8	A	America/Los_Angeles
EKY	Bessemer	33.1876	-86.5558	700	-6	A	America/Chicago
ELD	South Arkansas Rgnl At Goodwin Fld	33.220972	-92.813278	277	-6	A	America/Chicago
ELI	Elim Airport	64.615	-162.270556	162	-9	A	America/Anchorage
ELM	Elmira Corning Rgnl	42.159889	-76.891611	954	-5	A	America/New_York
ELP	El Paso Intl	31.80725	-106.377583	3958	-7	A	America/Denver
ELV	Elfin Cove Seaplane Base	58.195278	-136.3475	0	-9	A	America/Anchorage
ELY	Ely Airport	39.299722	-114.841944	6259	-8	A	America/Los_Angeles
EMK	Emmonak Airport	62.786111	-164.490833	13	-9	A	America/Anchorage
EMP	Emporia Municipal Airport	38.3321	-96.1912	1208	-6	A	America/Chicago
ENA	Kenai Muni	60.573111	-151.245	99	-9	A	America/Anchorage
END	Vance Afb	36.339167	-97.9165	1307	-6	A	America/Chicago
ENV	Wendover	40.718694	-114.030889	4237	-7	A	America/Denver
ENW	Kenosha Regional Airport	42.5956944	-87.9278056	742	-6	A	America/Chicago
EOK	Keokuk Municipal Airport	40.4599078	-91.4285011	671	-6	A	America/Chicago
EPM	Eastport Municipal Airport	44.9101111	-67.0126944	45	-5	A	America/New_York
EQY	Monroe Reqional Airport	35.01833	-80.62001	679	-5	A	America/New_York
ERI	Erie Intl Tom Ridge Fld	42.082022	-80.176217	733	-5	A	America/New_York
ERV	Kerrville Municipal Airport	29.9766667	-99.0854722	1617	-6	A	America/Chicago
ERY	Luce County Airport	46.311199	-85.457298	869	-5	A	America/New_York
ESC	Delta County Airport	45.722778	-87.093611	609	-5	A	America/New_York
ESD	Orcas Island Airport	48.708056	-122.910556	31	-8	A	America/Los_Angeles
ESF	Esler Rgnl	31.394903	-92.295772	112	-6	A	America/Chicago
ESN	Easton-Newnam Field Airport	38.8041667	-76.069	72	-5	A	America/New_York
EUF	Weedon Field	31.5708	-85.0774	285	-6	A	America/Chicago
EUG	Mahlon Sweet Fld	44.124583	-123.211972	374	-8	A	America/Los_Angeles
EVV	Evansville Regional	38.036997	-87.532364	418	-6	A	America/Chicago
EVW	Evanston-Uinta CO Burns Fld	41.1649	-111.0208	7143	-7	A	America/Denver
EWB	New Bedford Regional Airport	41.6761	-70.9569	80	-5	A	America/New_York
EWK	Newton City-County Airport	38.0570785	-97.2752278	1533	-6	A	America/Chicago
EWN	Craven Co Rgnl	35.072972	-77.042944	18	-5	A	America/New_York
EWR	Newark Liberty Intl	40.6925	-74.168667	18	-5	A	America/New_York
EXI	Excursion Inlet Seaplane Base	58.420556	-135.449167	0	-9	A	America/Anchorage
EYW	Key West Intl	24.556111	-81.759556	3	-5	A	America/New_York
F57	Seaplane Base	28.0575	-81.7628056	140	-5	A	America/New_York
FAF	Felker Aaf	37.1325	-76.608841	12	-5	A	America/New_York
FAI	Fairbanks Intl	64.815114	-147.856267	434	-9	A	America/Anchorage
FAR	Hector International Airport	46.92065	-96.8157639	902	-6	A	America/Chicago
FAT	Fresno Yosemite Intl	36.776194	-119.71814	336	-8	A	America/Los_Angeles
FAY	Fayetteville Regional Grannis Field	34.9912	-78.8803	189	-5	A	America/New_York
FBG	Fredericksburg Amtrak Station	38.298416	-77.456875	130	-5	A	America/New_York
FBK	Ladd Aaf	64.8375	-147.614444	454	-9	A	America/Anchorage
FBR	Fort Bridger	41.236	-110.2436	7038	-7	A	America/Denver
FBS	Friday Harbor Seaplane Base	48.537222	-123.009722	0	-8	A	America/Los_Angeles
FCA	Glacier Park Intl	48.310472	-114.256	2977	-7	A	America/Denver
FCM	Flying Cloud Airport	44.4938	-93.2726	906	-6	A	America/Chicago
FCS	Butts Aaf	38.678394	-104.756581	5838	-7	A	America/Denver
FDW	Fairfield County Airport	34.315472	-81.108806	577	-5	A	America/New_York
FDY	Findlay Airport	41.0120278	-83.6686111	819	-5	U	America/New_York
FFA	First Flight Airport	36.02	-75.67	13	-5	A	America/New_York
FFC	Atlanta Regional Airport - Falcon Field	33.35725	-84.5718333	808	-5	A	America/New_York
FFO	Wright Patterson Afb	39.826111	-84.048332	823	-5	A	America/New_York
FFT	Capital City Airport	38.1819722	-84.9061389	812	-5	A	America/New_York
FFZ	Mesa Falcon Field	33.4608001708984	-111.727996826172	1394	-7	A	America/Phoenix
FHU	Sierra Vista Muni Libby Aaf	31.588472	-110.344389	4719	-7	A	America/Phoenix
FIT	Fitchburg Municipal Airport	42.5541111	-71.7589722	348	-5	A	America/New_York
FKL	Franklin	41.377874	-79.860362	1540	-5	A	America/New_York
FLD	Fond Du Lac County Airport	43.7711667	-88.4884167	808	-6	A	America/Chicago
FLG	Flagstaff Pulliam Airport	35.140318	-111.6692392	7015	-7	N	America/Phoenix
FLL	Fort Lauderdale Hollywood Intl	26.072583	-80.15275	9	-5	A	America/New_York
FLO	Florence Rgnl	34.185361	-79.723889	146	-5	A	America/New_York
FLV	Sherman Aaf	39.368332	-94.914686	772	-6	A	America/Chicago
FME	Tipton	39.085386	-76.759414	150	-5	A	America/New_York
FMH	Otis Angb	41.658439	-70.521417	131	-5	A	America/New_York
FMN	Four Corners Rgnl	36.74125	-108.229944	5506	-7	A	America/Denver
FMY	Page Fld	26.586611	-81.86325	17	-5	A	America/New_York
FNL	Fort Collins Loveland Muni	40.451828	-105.011336	5016	-7	A	America/Denver
FNR	Funter Bay Seaplane Base	58.254444	-134.897778	0	-9	A	America/Anchorage
FNT	Bishop International	42.965424	-83.743629	782	-5	A	America/New_York
FOD	Fort Dodge Rgnl	42.5512	-94.191842	1157	-6	A	America/Chicago
FOE	Forbes Fld	38.950944	-95.663611	1078	-6	A	America/Chicago
FOK	Francis S Gabreski	40.843656	-72.631789	67	-5	A	America/New_York
FRD	Friday Harbor Airport	48.521944	-123.024444	113	-8	A	America/Los_Angeles
FRI	Marshall Aaf	39.055275	-96.764453	1063	-6	A	America/Chicago
FRN	Bryant Ahp	61.266381	-149.653119	378	-9	A	America/Anchorage
FRP	St Lucie County International Airport	27.497472	-80.372638	23	-5	A	America/New_York
FSD	Sioux Falls	43.582014	-96.741914	1429	-6	A	America/Chicago
FSI	Henry Post Aaf	34.649833	-98.402167	1189	-6	A	America/Chicago
FSM	Fort Smith Rgnl	35.336583	-94.367444	469	-6	A	America/Chicago
FST	Fort Stockton Pecos Co	30.915667	-102.916139	3011	-6	A	America/Chicago
FTK	Godman Aaf	37.907058	-85.972106	756	-5	A	America/New_York
FTW	Fort Worth Meacham Intl	32.819778	-97.362444	710	-6	A	America/Chicago
FTY	Fulton County Airport Brown Field	33.7791	-84.5214	841	-5	A	America/New_York
FUL	Fullerton Municipal Airport	33.521925	-117.584722	96	-8	A	America/Los_Angeles
FWA	Fort Wayne	40.978472	-85.195139	815	-5	A	America/New_York
FXE	Fort Lauderdale Executive	26.197281	-80.170706	13	-5	A	America/New_York
FYU	Fort Yukon	66.571492	-145.250417	433	-9	A	America/Anchorage
FYV	Drake Fld	36.005094	-94.170059	1251	-6	A	America/Chicago
FZG	Fitzgerald Municipal Airport	31.6839046	-83.2709036	365	-5	A	America/New_York
FZI	Fostoria Metropolitan Airport	41.1908333	-83.3930833	752	-5	A	America/New_York
GAD	Northeast Alabama Regional Airport	33.9726489	-86.0890834	569	-6	A	America/Chicago
GAI	Montgomery County Airpark	39.1006	-77.09576	0	-5	A	America/New_York
GAL	Edward G Pitka Sr	64.736178	-156.937417	152	-9	A	America/Anchorage
GAM	Gambell Airport	63.7668	-171.733	27	-9	A	America/Anchorage
GBN	Great Bend Municipal	38.344167	-98.859167	1887	-6	A	America/Chicago
GCC	Gillette-Campbell County Airport	44.3489167	-105.5393611	4365	-7	A	America/Denver
GCK	Garden City Rgnl	37.927528	-100.724417	2891	-6	A	America/Chicago
GCN	Grand Canyon National Park Airport	35.9523611	-112.1469722	6609	-7	N	America/Phoenix
GCW	Grand Canyon West Airport	35.5925	-113.4859	4825	-7	U	America/Phoenix
GDV	Dawson Community Airport	47.138611	-104.807222	749	-7	A	America/Denver
GDW	Gladwin Zettel Memorial Airport	43.9705893	-84.47502	774	-5	A	America/New_York
GED	Sussex Co	38.689194	-75.358889	50	-5	A	America/New_York
GEG	Spokane Intl	47.619861	-117.533833	2376	-8	A	America/Los_Angeles
GEU	Glendale Municipal Airport	33.5269167	-112.2951389	1071	-7	N	America/Phoenix
GFK	Grand Forks Intl	47.949256	-97.176111	845	-6	A	America/Chicago
GFL	Floyd Bennett Memorial Airport	43.341222	-73.610305	328	-5	A	America/New_York
GGE	Georgetown County Airport	33.3114018	-79.3203139	40	-5	A	America/New_York
GGG	East Texas Rgnl	32.384014	-94.711486	365	-6	A	America/Chicago
GGW	Wokal Field Glasgow International Airport	48.2125	-106.615	2296	-7	A	America/Denver
GHG	Marshfield Municipal Airport	42.09825	-70.6721389	9	-5	A	America/New_York
GIF	Gilbert Airport	28.062778	-81.753333	145	-5	A	America/New_York
GJT	Grand Junction Regional	39.122413	-108.526735	4858	-7	A	America/Denver
GKN	Gulkana	62.154888	-145.456639	1580	-9	A	America/Anchorage
GKY	Arlington Municipal	32.6638611	-97.0942778	628	-6	A	America/Chicago
GLD	Renner Fld	39.370621	-101.698992	3656	-7	A	America/Denver
GLH	Mid Delta Regional Airport	33.4829	-90.9856	131	-6	A	America/Chicago
GLS	Scholes Intl At Galveston	29.265322	-94.860406	6	-6	A	America/Chicago
GLV	Golovin Airport	64.550556	-163.007222	59	-9	A	America/Anchorage
GNT	Grants Milan Muni	35.167286	-107.901989	6537	-7	A	America/Denver
GNU	Goodnews Airport	59.1175	-161.5775	15	-9	A	America/Anchorage
GNV	Gainesville Rgnl	29.690056	-82.271778	152	-5	A	America/New_York
GON	Groton New London	41.330056	-72.045139	9	-5	A	America/New_York
GPT	Gulfport-Biloxi	30.407278	-89.070111	28	-6	A	America/Chicago
GPZ	Grand Rapids Itasca County	47.211111	-93.509722	413	-6	A	America/Chicago
GQQ	Galion Municipal Airport	40.7533889	-82.7238056	1224	-5	A	America/New_York
GRB	Austin Straubel Intl	44.485072	-88.129589	695	-6	A	America/Chicago
GRF	Gray Aaf	47.079217	-122.580783	302	-8	A	America/Los_Angeles
GRI	Central Nebraska Regional Airport	40.9675	-98.3096	1847	-6	A	America/Chicago
GRK	Robert Gray Aaf	31.06725	-97.828917	1015	-6	A	America/Chicago
GRM	Grand Marais Cook County Airport	47.8383333	-90.3829444	1799	-6	U	America/Chicago
GRR	Gerald R Ford Intl	42.880833	-85.522806	794	-5	A	America/New_York
GSB	Seymour Johnson Afb	35.339383	-77.960589	110	-5	A	America/New_York
GSO	Piedmont Triad	36.09775	-79.937306	925	-5	A	America/New_York
GSP	Greenville-Spartanburg International	34.895556	-82.218889	964	-5	A	America/New_York
GST	Gustavus Airport	58.4253	-135.707	34	-9	A	America/Anchorage
GTB	Wheeler Sack Aaf	44.055619	-75.719458	690	-5	A	America/New_York
GTF	Great Falls Intl	47.482	-111.370689	3677	-7	A	America/Denver
GTR	Golden Triangle Regional Airport	33.450333	-88.591361	264	-6	A	America/Chicago
GTU	Georgetown Municipal Airport	30.678809	-97.6793837	790	-6	A	America/Chicago
GUC	Gunnison - Crested Butte	38.533889	-106.933056	7678	-7	A	America/Denver
GUP	Gallup Muni	35.511058	-108.789308	6472	-7	A	America/Denver
GUS	Grissom Arb	40.648094	-86.152119	812	-5	A	America/New_York
GVL	Lee Gilmer Memorial Airport	34.272627	-83.8302233	1276	-5	A	America/New_York
GVQ	Genesee County Airport	43.03175	-78.1696667	914	-5	A	America/New_York
GVT	Majors	33.067839	-96.065333	535	-6	A	America/Chicago
GWO	Greenwood Leflore	33.494328	-90.084706	162	-6	A	America/Chicago
GYY	Gary Chicago International Airport	41.6163	-87.4128	591	-6	A	America/Chicago
HBG	Hattiesburg Bobby L. Chain Municipal Airport	31.2649444	-89.2528889	151	-6	A	America/Chicago
HBR	Hobart Muni	34.991308	-99.051353	1564	-6	A	America/Chicago
HCC	Columbia County	42.2913	-73.7103	198	-5	A	America/New_York
HCR	Holy Cross Airport	62.1883	-159.775	70	-9	A	America/Anchorage
HDH	Dillingham	21.579475	-158.197281	14	-10	A	Pacific/Honolulu
HDI	Hardwick Field Airport	35.2199994	-84.832369	874	-5	A	America/New_York
HDN	Yampa Valley	40.481181	-107.21766	6602	-7	A	America/Denver
HDO	Hondo Municipal Airport	29.3591	-99.1775	930	-6	A	America/Chicago
HFD	Hartford Brainard	41.736722	-72.649444	18	-5	A	America/New_York
HGR	Hagerstown Regional Richard A Henson Field	39.7079	-77.7295	704	-5	A	America/New_York
HHH	Hilton Head	32.216	-80.752	10	-5	U	America/New_York
HHI	Wheeler Aaf	21.4835	-158.039667	837	-10	A	Pacific/Honolulu
HHR	Jack Northrop Fld Hawthorne Muni	33.922839	-118.335186	66	-8	A	America/Los_Angeles
HIB	Chisholm Hibbing	47.3866	-92.838994	1353	-6	A	America/Chicago
HIF	Hill Afb	41.123939	-111.973039	4789	-7	A	America/Denver
HII	Lake Havasu City Airport	34.5711111	-114.3582778	783	-7	N	America/Phoenix
HIO	Portland Hillsboro	45.540394	-122.949825	204	-8	A	America/Los_Angeles
HKB	Healy River Airport	63.8675	-148.968889	1263	-9	A	America/Anchorage
HKY	Hickory Rgnl	35.741147	-81.38955	1189	-5	A	America/New_York
HLG	Wheeling Ohio County Airport	40.175	-80.6463	1195	-5	A	America/New_York
HLN	Helena Rgnl	46.606806	-111.98275	3877	-7	A	America/Denver
HLR	Hood Aaf	31.138731	-97.714469	924	-6	A	America/Chicago
HMN	Holloman Afb	32.852519	-106.106525	4093	-7	A	America/Denver
HNH	Hoonah Airport	58.096111	-135.409722	19	-9	A	America/Anchorage
HNL	Honolulu Intl	21.318681	-157.922428	13	-10	N	Pacific/Honolulu
HNM	Hana	20.795636	-156.014439	78	-10	A	Pacific/Honolulu
HNS	Haines Airport	59.2438	-135.524	15	-9	A	America/Anchorage
HOB	Lea Co Rgnl	32.687528	-103.217028	3661	-7	A	America/Denver
HOM	Homer	59.645556	-151.476583	84	-9	A	America/Anchorage
HON	Huron Rgnl	44.3852	-98.228542	1289	-6	A	America/Chicago
HOP	Campbell Aaf	36.668567	-87.496183	573	-6	A	America/Chicago
HOT	Memorial Field	34.478	-93.0962	540	-6	A	America/Chicago
HOU	William P Hobby	29.645419	-95.278889	46	-6	A	America/Chicago
HPB	Hooper Bay Airport	61.5239	-166.147	7	-9	A	America/Anchorage
HPN	Westchester Co	41.066959	-73.707575	439	-5	A	America/New_York
HQM	Bowerman Field	46.9711944	-123.9365556	18	-8	A	America/Los_Angeles
HQU	McDuffie County Airport	33.5297315	-82.5169509	501	-5	A	America/New_York
HRL	Valley Intl	26.2285	-97.654389	36	-6	A	America/Chicago
HRO	Boone Co	36.261519	-93.154728	1365	-6	A	America/Chicago
HRT	Hurlburt Fld	30.427803	-86.689278	38	-6	A	America/Chicago
HSH	Henderson Executive Airport	35.972778	-115.134444	1881	-8	A	America/Los_Angeles
HSL	Huslia Airport	65.697778	-156.351389	213	-9	A	America/Anchorage
HST	Homestead Arb	25.48855	-80.383567	6	-5	A	America/New_York
HSV	Huntsville International Airport-Carl T Jones Field	34.6371944	-86.7750556	629	-6	A	America/Chicago
HTL	Roscommon Co	44.359806	-84.671112	1150	-5	A	America/New_York
HTS	Tri State Milton J Ferguson Field	38.3667	-82.558	828	-5	A	America/New_York
HUA	Redstone Aaf	34.678653	-86.684781	685	-6	A	America/Chicago
HUF	Terre Haute Intl Hulman Fld	39.451464	-87.307561	589	-5	A	America/New_York
HUL	Houlton Intl	46.123083	-67.792056	489	-5	A	America/New_York
HUS	Hughes Airport	66.039167	-154.264722	299	-9	A	America/Anchorage
HUT	Hutchinson Municipal Airport	38.0655	-97.8606	1543	-6	A	America/Chicago
HVN	Tweed-New Haven Airport	41.26375	-72.886806	14	-5	A	America/New_York
HVR	Havre City Co	48.542983	-109.762342	2590	-7	A	America/Denver
HWD	Hayward Executive Airport	37.6588888888889	-122.121666666667	52	-8	A	America/Los_Angeles
HWO	North Perry	26.001222	-80.240722	8	-5	A	America/New_York
HXD	Hilton Head Airport	32.2243611	-80.6974722	19	-5	A	America/New_York
HYA	Barnstable Muni Boardman Polando Fld	41.669336	-70.280356	55	-5	A	America/New_York
HYG	Hydaburg Seaplane Base	55.206389	-132.828333	0	-9	A	America/Anchorage
HYL	Hollis Seaplane Base	55.481667	-132.646111	0	-9	A	America/Anchorage
HYS	Hays Regional Airport	38.8422	-99.2732	1998	-6	A	America/Chicago
HZL	Hazleton Municipal	40.989167	-76.0025	1603	-5	A	America/New_York
IAB	Mc Connell Afb	37.621853	-97.268192	1371	-6	A	America/Chicago
IAD	Washington Dulles Intl	38.944533	-77.455811	313	-5	A	America/New_York
IAG	Niagara Falls Intl	43.107333	-78.946194	589	-5	A	America/New_York
IAH	George Bush Intercontinental	29.984433	-95.341442	97	-6	A	America/Chicago
IAN	Bob Baker Memorial Airport	66.975833	-160.436667	166	-9	A	America/Anchorage
ICT	Wichita Mid Continent	37.649944	-97.433056	1333	-6	A	America/Chicago
ICY	Icy Bay Airport	59.968889	-141.661667	50	-9	A	America/Anchorage
IDA	Idaho Falls Rgnl	43.514556	-112.07075	4744	-7	A	America/Denver
IDL	Idlewild Intl	40.639751	-73.778924	13	-5	A	America/New_York
IFP	Laughlin-Bullhead Intl	35.1574	-114.56	695	-7	A	America/Phoenix
IGG	Igiugig Airport	59.324	-155.902	90	-9	A	America/Anchorage
IGM	Kingman Airport	35.2595	-113.938	3449	-7	A	America/Phoenix
IGQ	Lansing Municipal	41.5349167	-87.5295278	620	-6	A	America/Chicago
IJD	Windham Airport	41.7440278	-72.1802222	246	-5	A	America/New_York
IKK	Greater Kankakee	41.071389	-87.846278	630	-6	A	America/Chicago
IKO	Nikolski Air Station	52.941667	-168.848889	77	-9	A	America/Anchorage
IKR	Kirtland Air Force Base	35.040222	-106.609194	5355	-7	A	America/Denver
IKV	Ankeny Regl Airport	41.691389	-93.566389	910	-6	A	America/Chicago
ILG	New Castle	39.678722	-75.606528	79	-5	A	America/New_York
ILI	Iliamna	59.754356	-154.910961	186	-9	A	America/Anchorage
ILM	Wilmington Intl	34.270615	-77.902569	32	-5	A	America/New_York
ILN	Wilmington Airborne Airpark	39.42792	-83.792118	1077	-5	U	America/New_York
IMM	Immokalee	26.433889	-81.401389	37	-5	A	America/New_York
IMT	Ford Airport	45.8183611	-88.1145556	1182	-6	A	America/Chicago
IND	Indianapolis Intl	39.717331	-86.294383	797	-5	A	America/New_York
INJ	Hillsboro Muni	32.083486	-97.097228	685	-6	A	America/Chicago
INK	Winkler Co	31.779628	-103.201361	2822	-6	A	America/Chicago
INL	Falls Intl	48.566186	-93.403067	1185	-6	A	America/Chicago
INS	Creech Afb	36.587183	-115.673353	3133	-8	A	America/Los_Angeles
INT	Smith Reynolds	36.133722	-80.222	969	-5	A	America/New_York
INW	Winslow-Lindbergh Regional Airport	35.0219167	-110.7225278	4941	-7	N	America/Phoenix
IOW	Iowa City Municipal Airport	41.639244	-91.546503	668	-6	A	America/Chicago
IPL	Imperial Co	32.834219	-115.578744	-54	-8	A	America/Los_Angeles
IPT	Williamsport Rgnl	41.241836	-76.921094	529	-5	A	America/New_York
IRC	Circle City Airport	65.827778	-144.076111	613	-9	A	America/Anchorage
IRK	Kirksville Regional Airport	40.0935	-92.5449	966	-6	A	America/Chicago
ISM	Kissimmee Gateway Airport	28.289806	-81.437083	82	-5	A	America/New_York
ISN	Sloulin Fld Intl	48.177939	-103.642347	1982	-6	A	America/Chicago
ISO	Kinston Regional Jetport	35.331389	-77.608889	94	-5	A	America/New_York
ISP	Long Island Mac Arthur	40.79525	-73.100222	99	-5	A	America/New_York
ISW	Alexander Field South Wood County Airport	44.3606456	-89.8381412	1021	-6	A	America/Chicago
ITH	Ithaca Tompkins Rgnl	42.491028	-76.458444	1099	-5	A	America/New_York
ITO	Hilo Intl	19.721375	-155.048469	38	-10	N	Pacific/Honolulu
IWD	Gogebic Iron County Airport	46.5274747	-90.1313967	1230	-6	U	America/Chicago
IWS	West Houston	29.818194	-95.672611	111	-6	A	America/Chicago
IYK	Inyokern Airport	35.658889	-117.829444	2455	-8	A	America/Los_Angeles
IZG	Eastern Slopes Regional	43.9911389	-70.9478889	455	-5	A	America/New_York
JAC	Jackson Hole Airport	43.607333333	-110.73775	6451	-7	A	America/Denver
JAN	Jackson Evers Intl	32.311167	-90.075889	346	-6	A	America/Chicago
JAX	Jacksonville Intl	30.494056	-81.687861	30	-5	A	America/New_York
JBR	Jonesboro Muni	35.831708	-90.646417	262	-6	A	America/Chicago
JCI	New Century AirCenter Airport	38.8309167	-94.8903056	1087	-6	A	America/Chicago
JEF	Jefferson City Memorial Airport	38.5912	-92.1561	549	-6	A	America/Chicago
JES	Jesup-Wayne County Airport	31.553889	-81.8825	107	-5	A	America/New_York
JFK	John F Kennedy Intl	40.639751	-73.778925	13	-5	A	America/New_York
JGC	Grand Canyon Heliport	35.96666666	-112.13333333	2500	-7	A	America/Phoenix
JHM	Kapalua	20.962936	-156.673031	256	-10	N	Pacific/Honolulu
JHW	Chautauqua County-Jamestown	42.153333	-79.258056	525	-5	A	America/New_York
JKA	Jack Edwards Airport	30.2896389	-87.6717778	17	-6	A	America/Chicago
JLN	Joplin Rgnl	37.151814	-94.498269	981	-6	A	America/Chicago
JMS	Jamestown Regional Airport	46.9297	-98.6782	1498	-6	A	America/Chicago
JNU	Juneau Intl	58.354972	-134.576278	21	-9	A	America/Anchorage
JOT	Regional Airport	41.517778	-88.175556	582	-6	A	America/Chicago
JRA	West 30th St. Heliport	40.7545	-74.0071	7	-5	A	America/New_York
JRB	Wall Street Heliport	40.701214	-74.009028	7	-5	A	America/New_York
JST	John Murtha Johnstown-Cambria County Airport	40.316111	-78.833889	2284	-5	A	America/New_York
JVL	Southern Wisconsin Regional Airport	42.62025	-89.0415556	808	-6	A	America/Chicago
JXN	Reynolds Field	42.260556	-84.460556	1001	-5	A	America/New_York
JYL	Plantation Airpark	32.6452778	-81.5971111	188	-5	A	America/New_York
JYO	Leesburg Executive Airport	39.078	-77.558	389	-5	A	America/New_York
JZP	Pickens County Airport	34.4534722	-84.4572222	1535	-5	A	America/New_York
K03	Wainwright As	70.613378	-159.86035	35	-9	A	America/Anchorage
K27	Burrello-Mechanicville Airport	42.893133	-73.66845	195	-5	A	America/New_York
K83	Sabetha Municipal	39.5425	-95.4677	1330	-6	A	America/Chicago
KAE	Kake Seaplane Base	56.973056	-133.945556	0	-9	A	America/Anchorage
KAL	Kaltag Airport	64.3191	-158.741	187	-9	A	America/Anchorage
KBC	Birch Creek Airport	66.256708	-145.815319	450	-9	A	America/Anchorage
KBW	Chignik Bay Seaplane Base	56.295556	-158.401398	0	-9	A	America/Anchorage
KCC	Coffman Cove Seaplane Base	56.014722	-132.833889	0	-9	A	America/Anchorage
KCL	Chignik Lagoon Airport	56.311111	-158.534167	25	-9	A	America/Anchorage
KCQ	Chignik Lake Airport	56.255	-158.775278	50	-9	A	America/Anchorage
KEH	Kenmore Air Harbor Inc Seaplane Base	47.7548	-122.259	14	-8	A	America/Los_Angeles
KEK	Ekwok Airport	59.356944	-157.471111	135	-9	A	America/Anchorage
KFP	False Pass Airport	54.8475	-163.410278	20	-9	A	America/Anchorage
KGK	Koliganek Airport	59.726667	-157.259444	269	-9	A	America/Anchorage
KGX	Grayling Airport	62.894444	-160.065	99	-9	A	America/Anchorage
KKA	Koyuk Alfred Adams Airport	64.939444	-161.154167	154	-9	A	America/Anchorage
KKB	Kitoi Bay Seaplane Base	58.190833	-152.370556	0	-9	A	America/Anchorage
KKH	Kongiganak Airport	59.960833	-162.881111	30	-9	A	America/Anchorage
KLG	Kalskag Airport	61.5363	-160.341	55	-9	A	America/Anchorage
KLL	Levelock Airport	59.128056	-156.858611	39	-9	A	America/Anchorage
KLN	Larsen Bay Airport	57.535	-153.976667	87	-9	A	America/Anchorage
KLS	Kelso Longview	46.118	-122.898389	20	-8	A	America/Los_Angeles
KLW	Klawock Airport	55.579167	-133.076111	80	-9	A	America/Anchorage
KMO	Manokotak Airport	58.990278	-159.05	51	-9	A	America/Anchorage
KMY	Moser Bay Seaplane Base	57.025556	-154.145833	0	-9	A	America/Anchorage
KNW	New Stuyahok Airport	59.4499	-157.328	302	-9	A	America/Anchorage
KOA	Kona Intl At Keahole	19.738767	-156.045631	47	-10	N	Pacific/Honolulu
KOT	Kotlik Airport	63.030556	-163.532778	15	-9	A	America/Anchorage
KOY	Olga Bay Seaplane Base	57.161389	-154.229722	0	-9	A	America/Anchorage
KOZ	Ouzinkie Airport	57.922876	-152.500511	55	-9	A	America/Anchorage
KPB	Point Baker Seaplane Base	56.351944	-133.6225	0	-9	A	America/Anchorage
KPC	Port Clarence Coast Guard Station	65.2537	-166.859	10	-9	A	America/Anchorage
KPN	Kipnuk Airport	59.933056	-164.030556	11	-9	A	America/Anchorage
KPR	Port Williams Seaplane Base	58.49	-152.582222	0	-9	A	America/Anchorage
KPV	Perryville Airport	55.906667	-159.160833	29	-9	A	America/Anchorage
KPY	Port Bailey Seaplane Base	57.93	-153.040556	0	-9	A	America/Anchorage
KQA	Akutan Seaplane Base	54.1325	-165.785	0	-9	A	America/Anchorage
KSM	St Marys Airport	62.0605	-163.302	311	-9	A	America/Anchorage
KTB	Thorne Bay Seaplane Base	55.688056	-132.536667	0	-9	A	America/Anchorage
KTN	Ketchikan Intl	55.355556	-131.71375	88	-9	A	America/Anchorage
KTS	Brevig Mission Airport	65.331389	-166.465833	35	-9	A	America/Anchorage
KUK	Kasigluk Airport	60.873333	-162.524444	40	-9	A	America/Anchorage
KVC	King Cove Airport	55.1163	-162.266	155	-9	A	America/Anchorage
KVL	Kivalina Airport	67.7362	-164.563	13	-9	A	America/Anchorage
KWK	Kwigillingok Airport	59.876389	-163.168611	18	-9	A	America/Anchorage
KWN	Quinhagak Airport	59.755	-161.845278	42	-9	A	America/Anchorage
KWP	West Point Village Seaplane Base	57.77	-153.548889	0	-9	A	America/Anchorage
KWT	Kwethluk Airport	60.790278	-161.443611	30	-9	A	America/Anchorage
KYK	Karuluk Airport	57.566944	-154.450278	137	-9	A	America/Anchorage
KYU	Koyukuk Airport	64.875833	-157.730556	149	-9	A	America/Anchorage
KZB	Zachar Bay Seaplane Base	57.55	-153.75	0	-9	A	America/Anchorage
L06	Furnace Creek	36.273	-116.515	0	-8	A	America/Los_Angeles
L35	Big Bear City	34.2637778	-116.8560278	6725	-8	A	America/Los_Angeles
L52	Oceano County Airport	35.10147222	-120.62236111	14	-8	U	America/Los_Angeles
LAA	Lamar Muni	38.069694	-102.6885	3706	-7	A	America/Denver
LAF	Purude University Airport	40.4123056	-86.9368889	606	-5	A	America/New_York
LAL	Lakeland Linder Regional Airport	27.9889167	-82.0185556	142	-5	A	America/New_York
LAM	Los Alamos Airport	35.8798019	-106.2694153	7171	-7	A	America/Denver
LAN	Capital City	42.7787	-84.587357	861	-5	A	America/New_York
LAR	Laramie Regional Airport	41.3121	-105.675	7284	-7	A	America/Denver
LAS	Mc Carran Intl	36.080056	-115.15225	2141	-8	A	America/Los_Angeles
LAW	Lawton-Fort Sill Regional Airport	34.5677144	-98.4166367	1110	-6	A	America/Chicago
LAX	Los Angeles Intl	33.942536	-118.408075	126	-8	A	America/Los_Angeles
LBB	Lubbock Preston Smith Intl	33.663639	-101.822778	3282	-6	A	America/Chicago
LBE	Arnold Palmer Regional Airport	40.2759	-79.4048	1185	-5	A	America/New_York
LBF	North Platte Regional Airport Lee Bird Field	41.1262	-100.684	2776	-6	A	America/Chicago
LBL	Liberal Muni	37.044222	-100.95986	2885	-6	A	America/Chicago
LBT	Municipal Airport	34.6098056	-79.0595556	125	-5	A	America/New_York
LCH	Lake Charles Rgnl	30.126112	-93.223335	15	-6	A	America/Chicago
LCK	Rickenbacker Intl	39.813786	-82.927822	744	-5	A	America/New_York
LCQ	Lake City Municipal Airport	30.181944	-82.576944	201	-5	A	America/New_York
LDJ	Linden Airport	40.6174472	-74.2445942	23	-5	A	America/New_York
LEB	Lebanon Municipal Airport	43.6261	-72.3042	603	-5	A	America/New_York
LEW	Lewiston Maine	44.0484728	-70.2835075	288	-5	A	America/New_York
LEX	Blue Grass	38.0365	-84.605889	979	-5	A	America/New_York
LFI	Langley Afb	37.082881	-76.360547	11	-5	A	America/New_York
LFK	Angelina Co	31.234014	-94.75	296	-6	A	America/Chicago
LFT	Lafayette Rgnl	30.205278	-91.987611	43	-6	A	America/Chicago
LGA	La Guardia	40.777245	-73.872608	22	-5	A	America/New_York
LGB	Long Beach	33.817722	-118.151611	60	-8	A	America/Los_Angeles
LGC	LaGrange-Callaway Airport	33.0088611	-85.0726111	694	-5	A	America/New_York
LGU	Logan-Cache	41.791	-111.852	4457	-7	A	America/Denver
LHD	Lake Hood Seaplane Base	61.1866382	-149.9653918	71	-9	A	America/Anchorage
LHM	Lincoln Regional Airport Karl Harder Field	38.9091667	-121.3513333	121	-8	A	America/Los_Angeles
LHV	William T. Piper Mem.	41.1357778	-77.4223056	556	-5	A	America/New_York
LHX	La Junta Muni	38.049719	-103.509431	4238	-7	A	America/Denver
LIH	Lihue	21.975983	-159.338958	153	-10	N	Pacific/Honolulu
LIT	Adams Fld	34.729444	-92.224306	262	-6	A	America/Chicago
LIV	Livingood Airport	65.531111	-148.541111	696	-9	A	America/Anchorage
LKE	Kenmore Air Harbor Seaplane Base	47.629	-122.339	14	-8	A	America/Los_Angeles
LKK	Kulik Lake Airport	58.96591	-155.108089	1000	-9	U	America/Anchorage
LKP	Lake Placid Airport	44.264444	-73.961944	1747	-5	A	America/New_York
LMT	Klamath Falls Airport	42.1561	-121.733	4095	-8	A	America/Los_Angeles
LNA	Palm Beach Co Park	26.593	-80.085056	14	-5	A	America/New_York
LNK	Lincoln	40.850971	-96.75925	1219	-6	A	America/Chicago
LNN	Lost Nation Municipal Airport	41.6840278	-81.38975	626	-5	A	America/New_York
LNR	Tri-County Regional Airport	43.211667	-90.181667	718	-6	A	America/Chicago
LNS	Lancaster Airport	40.1217	-76.2961	403	-5	A	America/New_York
LNY	Lanai	20.785611	-156.951419	1308	-10	N	Pacific/Honolulu
LOT	Lewis University Airport	41.606326	-88.083003	680	-6	A	America/Chicago
LOU	Bowman Fld	38.228	-85.663722	546	-5	A	America/New_York
LOZ	London-Corbin Airport-MaGee Field	37.0868889	-84.0773889	1212	-5	A	America/New_York
LPC	Lompoc Airport	34.6656	-120.4675	88	-8	A	America/Los_Angeles
LPR	Lorain County Regional Airport	41.3442778	-82.1776389	793	-5	A	America/New_York
LPS	Lopez Island Airport	48.4839	-122.938	209	-8	A	America/Los_Angeles
LRD	Laredo Intl	27.54375	-99.461556	508	-6	A	America/Chicago
LRF	Little Rock Afb	34.916944	-92.149722	311	-6	A	America/Chicago
LRO	Mount Pleasant Regional-Faison Field	32.5387	-79.4697	12	-5	A	\N
LRU	Las Cruces Intl	32.289417	-106.921972	4456	-7	A	America/Denver
LSE	La Crosse Municipal	43.878986	-91.256711	654	-6	A	America/Chicago
LSF	Lawson Aaf	32.337322	-84.991283	232	-5	A	America/New_York
LSV	Nellis Afb	36.236197	-115.034253	1870	-8	A	America/Los_Angeles
LTS	Altus Afb	34.667067	-99.266681	1382	-6	A	America/Chicago
LUF	Luke Afb	33.535	-112.38306	1085	-7	A	America/Phoenix
LUK	Cincinnati Muni Lunken Fld	39.103333	-84.418611	483	-5	A	America/New_York
LUP	Kalaupapa Airport	21.211	-156.974	24	-10	A	Pacific/Honolulu
LUR	Cape Lisburne Lrrs	68.875133	-166.110022	12	-9	A	America/Anchorage
LVK	Livermore Municipal	37.41362	-121.49133	400	-8	A	America/Los_Angeles
LVM	Mission Field Airport	45.6993889	-110.4483056	4660	-7	A	America/Denver
LVS	Las Vegas Muni	35.654222	-105.142389	6877	-7	A	America/Denver
LWA	South Haven Area Regional Airport	42.3511944	-86.2556389	666	-5	A	America/New_York
LWB	Greenbrier Valley Airport	37.858333	-80.399444	2302	-5	U	America/New_York
LWC	Lawrence Municipal	39.009167	-95.2175	833	-6	A	America/Chicago
LWM	Lawrence Municipal Airport	42.7171944	-71.1234167	148	-5	A	America/New_York
LWS	Lewiston Nez Perce Co	46.3745	-117.015389	1442	-8	A	America/Los_Angeles
LWT	Lewistown Municipal Airport	47.0493	-109.467	4170	-7	A	America/Denver
LXY	Mexia - Limestone County Airport	31.6411783	-96.5144594	544	-6	A	America/Chicago
LYH	Lynchburg Regional Preston Glenn Field	37.3267	-79.2004	938	-5	A	America/New_York
LYU	Ely Municipal	47.824444	-91.830833	1456	-6	A	America/Chicago
LZU	Gwinnett County Airport-Briscoe Field	33.9780761	-83.9623772	1061	-5	A	America/New_York
M94	Desert Aire	46.4124	-119.5518	586	-8	A	America/Los_Angeles
MAE	Madera Municipal Airport	36.9886111	-120.1124444	255	-8	A	America/Los_Angeles
MAF	Midland Intl	31.942528	-102.201914	2871	-6	A	America/Chicago
MBL	Manistee County-Blacker Airport	44.2725	-86.246944	621	-5	A	America/New_York
MBS	Mbs Intl	43.532913	-84.079647	668	-5	A	America/New_York
MCC	Mc Clellan Afld	38.667639	-121.400611	75	-8	A	America/Los_Angeles
MCD	Mackinac Island Airport	45.8649344	-84.637344	740	-5	U	America/New_York
MCE	Merced Municipal Airport	37.284722	-120.513889	156	-8	A	America/Los_Angeles
MCF	Macdill Afb	27.849339	-82.521214	14	-5	A	America/New_York
MCG	McGrath Airport	62.9529	-155.606	338	-9	A	America/Anchorage
MCI	Kansas City Intl	39.297606	-94.713905	1026	-6	A	America/Chicago
MCK	McCook Regional Airport	40.206389	-100.592222	2583	-6	A	America/Chicago
MCL	McKinley National Park Airport	63.732757	-148.91129	1720	-9	A	America/Anchorage
MCN	Middle Georgia Rgnl	32.69285	-83.649211	354	-5	A	America/New_York
MCO	Orlando Intl	28.429394	-81.308994	96	-5	A	America/New_York
MCW	Mason City Municipal	43.2247	-93.4067	1243	-6	A	America/Chicago
MDT	Harrisburg Intl	40.193494	-76.763403	310	-5	A	America/New_York
MDW	Chicago Midway Intl	41.785972	-87.752417	620	-6	A	America/Chicago
ME5	Banks Airport	44.1653889	-68.4281667	100	-5	A	America/New_York
MEI	Key Field	32.332624	-88.751868	297	-6	A	America/Chicago
MEM	Memphis Intl	35.042417	-89.976667	341	-6	A	America/Chicago
MER	Castle	37.380481	-120.568189	189	-8	A	America/Los_Angeles
MFD	Mansfield Lahm Regional	40.8214167	-82.5166389	1297	-5	A	America/New_York
MFE	Mc Allen Miller Intl	26.175833	-98.238611	107	-6	A	America/Chicago
MFI	Marshfield Municipal Airport	44.6368797	-90.1893267	1278	-6	A	America/Chicago
MFR	Rogue Valley Intl Medford	42.374228	-122.8735	1335	-8	A	America/Los_Angeles
MGC	Michigan City Municipal Airport	41.7033	-86.8211	500	-6	A	America/Chicago
MGE	Dobbins Arb	33.915382	-84.516319	1068	-5	A	America/New_York
MGJ	Orange County Airport	41.5099884	-74.2646444	364	-5	A	America/New_York
MGM	Montgomery Regional Airport	32.3006389	-86.3939722	221	-6	A	America/Chicago
MGR	Moultrie Municipal Airport	31.0849167	-83.80325	294	-5	A	America/New_York
MGW	Morgantown Muni Walter L Bill Hart Fld	39.642908	-79.916314	1248	-5	A	America/New_York
MGY	Dayton-Wright Brothers Airport	39.5889722	-84.2248611	957	-5	U	America/New_York
MHK	Manhattan Reigonal	39.140972	-96.670833	1057	-6	A	America/Chicago
MHM	Minchumina Airport	63.886111	-152.301944	678	-9	A	America/Anchorage
MHR	Sacramento Mather	38.553897	-121.297592	96	-8	A	America/Los_Angeles
MHT	Manchester Regional Airport	42.932556	-71.435667	266	-5	A	America/New_York
MHV	Mojave	35.059364	-118.151856	2791	-8	A	America/Los_Angeles
MIA	Miami Intl	25.79325	-80.290556	8	-5	A	America/New_York
MIB	Minot Afb	48.415572	-101.357661	1668	-6	A	America/Chicago
MIC	Crystal Airport	45.0343	-93.2114	869	-6	A	America/Chicago
MIE	Delaware County Airport	40.2424722	-85.39575	937	-5	U	America/New_York
MIV	Millville Muni	39.367806	-75.072222	85	-5	A	America/New_York
MKC	Downtown	39.1275	-94.598889	759	-6	A	America/Chicago
MKE	General Mitchell Intl	42.947222	-87.896583	723	-6	A	America/Chicago
MKG	Muskegon County Airport	43.1695	-86.2382	628	-5	A	America/New_York
MKK	Molokai	21.152886	-157.096256	454	-10	N	Pacific/Honolulu
MKL	Mc Kellar Sipes Rgnl	35.599889	-88.915611	434	-6	A	America/Chicago
MKO	Davis Fld	35.656489	-95.366656	612	-6	A	America/Chicago
MLB	Melbourne Intl	28.102753	-80.645258	33	-5	A	America/New_York
MLC	Mc Alester Rgnl	34.882403	-95.783463	770	-6	A	America/Chicago
MLD	Malad City	42.17	-112.289	4503	-7	A	America/Denver
MLI	Quad City Intl	41.448528	-90.507539	590	-6	A	America/Chicago
MLJ	Baldwin County Airport	33.154225	-83.2414139	385	-5	A	America/New_York
MLL	Marshall Don Hunter Sr. Airport	61.8646418	-162.026111	103	-9	A	America/Anchorage
MLS	Frank Wiley Field	46.428	-105.886	2630	-7	A	America/Denver
MLT	Millinocket Muni	45.647836	-68.685561	408	-5	A	America/New_York
MLU	Monroe Rgnl	32.510864	-92.037689	79	-6	A	America/Chicago
MLY	Manley Hot Springs Airport	64.9975	-150.644167	270	-9	A	America/Anchorage
MMH	Mammoth Yosemite Airport	37.624049	-118.837772	7128	-8	A	America/Los_Angeles
MMI	McMinn Co	35.39919	-84.56177	874	-5	N	America/New_York
MMU	Morristown Municipal Airport	40.79935	-74.4148747	187	-5	A	America/New_York
MMV	Mc Minnville Muni	45.194444	-123.135944	163	-8	A	America/Los_Angeles
MNM	Menominee Marinette Twin Co	45.12665	-87.638443	625	-6	A	America/Chicago
MNT	Minto Airport	65.143611	-149.37	460	-9	A	America/Anchorage
MNZ	Manassas	38.721389	-77.515556	192	-5	A	America/New_York
MOB	Mobile Rgnl	30.691231	-88.242814	219	-6	A	America/Chicago
MOD	Modesto City Co Harry Sham	37.625817	-120.954422	97	-8	A	America/Los_Angeles
MOT	Minot Intl	48.259378	-101.280333	1716	-6	A	America/Chicago
MOU	Mountain Village Airport	62.0954	-163.682	337	-9	A	America/Anchorage
MPB	Miami Seaplane Base	25.7783	-80.1703	0	-5	A	America/New_York
MPI	MariposaYosemite	37.3039	-120.0222	2454	-8	A	America/Los_Angeles
MPV	Edward F Knapp State	44.203503	-72.562328	1165	-5	A	America/New_York
MQB	Macomb Municipal Airport	40.5200833	-90.6523889	707	-6	U	America/Chicago
MQI	Dare County Regional	35.5514	-75.4173	13	-5	A	America/New_York
MQT	Sawyer International Airport	46.353611	-87.395278	1221	-5	A	America/New_York
MRB	Eastern WV Regional Airport	39.2407	-77.591	554	-5	A	America/New_York
MRI	Merrill Fld	61.213544	-149.844447	137	-9	A	America/Anchorage
MRK	Marco Islands	25.9950278	-81.6725278	5	-5	A	America/New_York
MRN	Foothills Regional Airport	35.8202336	-81.6115119	1270	-5	A	America/New_York
MRY	Monterey Peninsula	36.587	-121.842944	257	-8	A	America/Los_Angeles
MSL	Northwest Alabama Regional Airport	34.7453	-87.6102	550	-6	A	America/Chicago
MSN	Dane Co Rgnl Truax Fld	43.139858	-89.337514	887	-6	A	America/Chicago
MSO	Missoula Intl	46.916306	-114.090556	3205	-7	A	America/Denver
MSP	Minneapolis St Paul Intl	44.881956	-93.221767	841	-6	A	America/Chicago
MSS	Massena Intl Richards Fld	44.935833	-74.845547	215	-5	A	America/New_York
MSY	Louis Armstrong New Orleans Intl	29.993389	-90.258028	4	-6	A	America/Chicago
MTC	Selfridge Angb	42.608333	-82.8355	580	-5	A	America/New_York
MTH	Florida Keys Marathon Airport	24.726111	-81.051389	7	-5	A	America/New_York
MTJ	Montrose Regional Airport	38.509794	-107.894242	5759	-7	A	America/Denver
MTM	Metlakatla Seaplane Base	55.131111	-131.578056	0	-9	A	America/Anchorage
MTN	Martin State	39.3256667	-76.4137778	22	-5	A	America/New_York
MUE	Waimea Kohala	20.001328	-155.668108	2671	-10	A	Pacific/Honolulu
MUI	Muir Aaf	40.434811	-76.569411	489	-5	A	America/New_York
MUO	Mountain Home Afb	43.043603	-115.872431	2996	-7	A	America/Denver
MVL	Morrisville Stowe State Airport	44.535	-72.614	732	-5	A	America/New_York
MVY	Martha\\\\'s Vineyard	41.391667	-70.615278	67	-5	A	America/New_York
MWA	Williamson Country Regional Airport	37.7549569	-89.0110936	472	-6	A	America/Chicago
MWC	Lawrence J Timmerman Airport	43.1103889	-88.0344167	745	-6	A	America/Chicago
MWH	Grant Co Intl	47.207708	-119.32019	1185	-8	A	America/Los_Angeles
MWL	Mineral Wells	32.781606	-98.060175	974	-6	A	America/Chicago
MWM	Windom Municipal Airport	43.9134017	-95.1094083	1410	-6	A	America/Chicago
MXF	Maxwell Afb	32.382944	-86.365778	171	-6	A	America/Chicago
MXY	McCarthy Airport	61.4370608	-142.90307372	1531	-9	U	America/Anchorage
MYF	Montgomery Field	32.4759	117.759	17	8	A	Asia/Chongqing
MYL	McCall Municipal Airport	44.889722	-116.101389	5021	-7	A	America/Denver
MYR	Myrtle Beach Intl	33.67975	-78.928333	25	-5	A	America/New_York
MYU	Mekoryuk Airport	60.3714	-166.271	48	-9	A	America/Anchorage
MYV	Yuba County Airport	39.0553	-121.3411	62	-8	A	America/Los_Angeles
MZJ	Pinal Airpark	32.509722	-111.325278	1893	-7	N	America/Phoenix
N53	Stroudsburg-Pocono Airport	41.0358717	-75.1606789	480	-5	A	America/New_York
N69	Stormville Airport	41.5769708	-73.7323514	358	-5	A	America/New_York
N87	Trenton-Robbinsville Airport	40.2139444	-74.6017778	118	-5	A	America/New_York
NBG	New Orleans Nas Jrb	29.825333	-90.035	3	-6	A	America/Chicago
NBU	Naval Air Station	42.090556	-87.8225	653	-6	A	America/Chicago
NCN	Chenega Bay Airport	60.077222	-147.991944	72	-9	A	America/Anchorage
NEL	Lakehurst Naes	40.033333	-74.353333	103	-5	A	America/New_York
NEW	Lakefront	30.0424167	-90.02825	7	-6	A	America/Chicago
NFL	Fallon Nas	39.416584	-118.70098	3934	-8	A	America/Los_Angeles
NGF	Kaneohe Bay Mcaf	21.450453	-157.768	24	-10	A	Pacific/Honolulu
NGP	Corpus Christi NAS	27.692701	-97.290376	18	-6	A	America/Chicago
NGU	Norfolk Ns	36.937644	-76.289289	15	-5	A	America/New_York
NGZ	NAS Alameda	37.7861	-122.3186	10	-8	U	America/Los_Angeles
NHK	Patuxent River Nas	38.285981	-76.411781	39	-5	A	America/New_York
NIB	Nikolai Airport	63.010833	-154.383889	427	-9	A	America/Anchorage
NID	China Lake Naws	35.685422	-117.692039	2283	-8	A	America/Los_Angeles
NIP	Jacksonville Nas	30.235834	-81.680556	22	-5	A	America/New_York
NJK	El Centro Naf	32.829222	-115.671667	-42	-8	A	America/Los_Angeles
NKT	Cherry Point Mcas	34.900872	-76.880733	29	-5	A	America/New_York
NKX	Miramar Mcas	32.867694	-117.14175	478	-8	A	America/Los_Angeles
NLC	Lemoore Nas	36.333012	-119.95208	234	-8	A	America/Los_Angeles
NLG	Nelson Lagoon	56.0075	-161.160278	14	-9	A	America/Anchorage
NME	Nightmute Airport	60.471111	-164.700833	4	-9	A	America/Anchorage
NMM	Meridian Nas	32.552083	-88.555557	317	-6	A	America/Chicago
NNL	Nondalton Airport	59.966944	-154.851667	262	-9	A	America/Anchorage
NOW	Port Angeles Cgas	48.141481	-123.414075	13	-8	A	America/Los_Angeles
NPA	Pensacola Nas	30.352656	-87.318647	28	-6	A	America/Chicago
NPZ	Porter County Municipal Airport	41.4539722	-87.0070833	770	-6	A	America/Chicago
NQA	Millington Rgnl Jetport	35.356667	-89.870278	320	-6	A	America/Chicago
NQI	Kingsville Nas	27.507223	-97.809723	50	-6	A	America/Chicago
NQX	Key West Nas	24.575834	-81.688889	6	-5	A	America/New_York
NSE	Whiting Fld Nas North	30.724167	-87.021944	199	-6	A	America/Chicago
NTD	Point Mugu Nas	34.120285	-119.12094	13	-8	A	America/Los_Angeles
NTU	Oceana Nas	36.820703	-76.033542	22	-5	A	America/New_York
NUI	Nuiqsut Airport	70.21	-151.005556	38	-9	A	America/Anchorage
NUL	Nulato Airport	64.729444	-158.074167	399	-9	A	America/Anchorage
NUP	Nunapitchuk Airport	60.905833	-162.439167	12	-9	A	America/Anchorage
NUQ	Moffett Federal Afld	37.416142	-122.049139	32	-8	A	America/Los_Angeles
NUW	Whidbey Island Nas	48.351803	-122.655906	47	-8	A	America/Los_Angeles
NXP	Twentynine Palms Eaf	34.296161	-116.162203	2051	-8	A	America/Los_Angeles
NXX	Willow Grove Nas Jrb	40.199833	-75.148167	358	-5	A	America/New_York
NY9	Long Lake	43.9750617	-74.42044	1629	-5	A	America/New_York
NYC	All Airports	40.714167	-74.005833	31	-5	A	America/New_York
NYG	Quantico Mcaf	38.501683	-77.305333	11	-5	A	America/New_York
NZC	Cecil Field	30.2187	-81.8767	81	-5	A	America/New_York
NZJ	El Toro	33.676132	-117.731164	383	-8	A	America/Los_Angeles
NZY	North Island Nas	32.699219	-117.21531	26	-8	A	America/Los_Angeles
O03	Morgantown Airport	40.1570414	-75.8704892	600	-5	A	America/New_York
O27	Oakdale Airport	37.7563333	-120.8001944	237	-8	A	America/Los_Angeles
OAJ	Albert J Ellis	34.829164	-77.612139	94	-5	A	America/New_York
OAK	Metropolitan Oakland Intl	37.721278	-122.220722	9	-8	A	America/Los_Angeles
OAR	Marina Muni	36.681878	-121.762347	134	-8	A	America/Los_Angeles
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: rpostgresql; Owner: travis
--

COPY rpostgresql.flights (year, month, day, dep_time, sched_dep_time, dep_delay, arr_time, sched_arr_time, arr_delay, carrier, flight, tailnum, origin, dest, air_time, distance, hour, minute, time_hour) FROM stdin;
2013	1	1	517	515	2	830	819	11	UA	1545	N14228	EWR	IAH	227	1400	5	15	2013-01-01 05:00:00+00
2013	1	1	533	529	4	850	830	20	UA	1714	N24211	LGA	IAH	227	1416	5	29	2013-01-01 05:00:00+00
2013	1	1	542	540	2	923	850	33	AA	1141	N619AA	JFK	MIA	160	1089	5	40	2013-01-01 05:00:00+00
2013	1	1	544	545	-1	1004	1022	-18	B6	725	N804JB	JFK	BQN	183	1576	5	45	2013-01-01 05:00:00+00
2013	1	1	554	600	-6	812	837	-25	DL	461	N668DN	LGA	ATL	116	762	6	0	2013-01-01 06:00:00+00
2013	1	1	554	558	-4	740	728	12	UA	1696	N39463	EWR	ORD	150	719	5	58	2013-01-01 05:00:00+00
2013	1	1	555	600	-5	913	854	19	B6	507	N516JB	EWR	FLL	158	1065	6	0	2013-01-01 06:00:00+00
2013	1	1	557	600	-3	709	723	-14	EV	5708	N829AS	LGA	IAD	53	229	6	0	2013-01-01 06:00:00+00
2013	1	1	557	600	-3	838	846	-8	B6	79	N593JB	JFK	MCO	140	944	6	0	2013-01-01 06:00:00+00
2013	1	1	558	600	-2	753	745	8	AA	301	N3ALAA	LGA	ORD	138	733	6	0	2013-01-01 06:00:00+00
2013	1	1	558	600	-2	849	851	-2	B6	49	N793JB	JFK	PBI	149	1028	6	0	2013-01-01 06:00:00+00
2013	1	1	558	600	-2	853	856	-3	B6	71	N657JB	JFK	TPA	158	1005	6	0	2013-01-01 06:00:00+00
2013	1	1	558	600	-2	924	917	7	UA	194	N29129	JFK	LAX	345	2475	6	0	2013-01-01 06:00:00+00
2013	1	1	558	600	-2	923	937	-14	UA	1124	N53441	EWR	SFO	361	2565	6	0	2013-01-01 06:00:00+00
2013	1	1	559	600	-1	941	910	31	AA	707	N3DUAA	LGA	DFW	257	1389	6	0	2013-01-01 06:00:00+00
2013	1	1	559	559	0	702	706	-4	B6	1806	N708JB	JFK	BOS	44	187	5	59	2013-01-01 05:00:00+00
2013	1	1	559	600	-1	854	902	-8	UA	1187	N76515	EWR	LAS	337	2227	6	0	2013-01-01 06:00:00+00
2013	1	1	600	600	0	851	858	-7	B6	371	N595JB	LGA	FLL	152	1076	6	0	2013-01-01 06:00:00+00
2013	1	1	600	600	0	837	825	12	MQ	4650	N542MQ	LGA	ATL	134	762	6	0	2013-01-01 06:00:00+00
2013	1	1	601	600	1	844	850	-6	B6	343	N644JB	EWR	PBI	147	1023	6	0	2013-01-01 06:00:00+00
2013	1	1	602	610	-8	812	820	-8	DL	1919	N971DL	LGA	MSP	170	1020	6	10	2013-01-01 06:00:00+00
2013	1	1	602	605	-3	821	805	16	MQ	4401	N730MQ	LGA	DTW	105	502	6	5	2013-01-01 06:00:00+00
2013	1	1	606	610	-4	858	910	-12	AA	1895	N633AA	EWR	MIA	152	1085	6	10	2013-01-01 06:00:00+00
2013	1	1	606	610	-4	837	845	-8	DL	1743	N3739P	JFK	ATL	128	760	6	10	2013-01-01 06:00:00+00
2013	1	1	607	607	0	858	915	-17	UA	1077	N53442	EWR	MIA	157	1085	6	7	2013-01-01 06:00:00+00
2013	1	1	608	600	8	807	735	32	MQ	3768	N9EAMQ	EWR	ORD	139	719	6	0	2013-01-01 06:00:00+00
2013	1	1	611	600	11	945	931	14	UA	303	N532UA	JFK	SFO	366	2586	6	0	2013-01-01 06:00:00+00
2013	1	1	613	610	3	925	921	4	B6	135	N635JB	JFK	RSW	175	1074	6	10	2013-01-01 06:00:00+00
2013	1	1	615	615	0	1039	1100	-21	B6	709	N794JB	JFK	SJU	182	1598	6	15	2013-01-01 06:00:00+00
2013	1	1	615	615	0	833	842	-9	DL	575	N326NB	EWR	ATL	120	746	6	15	2013-01-01 06:00:00+00
2013	1	1	622	630	-8	1017	1014	3	US	245	N807AW	EWR	PHX	342	2133	6	30	2013-01-01 06:00:00+00
2013	1	1	623	610	13	920	915	5	AA	1837	N3EMAA	LGA	MIA	153	1096	6	10	2013-01-01 06:00:00+00
2013	1	1	623	627	-4	933	932	1	UA	496	N459UA	LGA	IAH	229	1416	6	27	2013-01-01 06:00:00+00
2013	1	1	624	630	-6	909	840	29	EV	4626	N11107	EWR	MSP	190	1008	6	30	2013-01-01 06:00:00+00
2013	1	1	624	630	-6	840	830	10	MQ	4599	N518MQ	LGA	MSP	166	1020	6	30	2013-01-01 06:00:00+00
2013	1	1	627	630	-3	1018	1018	0	US	27	N535UW	JFK	PHX	330	2153	6	30	2013-01-01 06:00:00+00
2013	1	1	628	630	-2	1137	1140	-3	AA	413	N3BAAA	JFK	SJU	192	1598	6	30	2013-01-01 06:00:00+00
2013	1	1	628	630	-2	1016	947	29	UA	1665	N33289	EWR	LAX	366	2454	6	30	2013-01-01 06:00:00+00
2013	1	1	629	630	-1	824	810	14	AA	303	N3CYAA	LGA	ORD	140	733	6	30	2013-01-01 06:00:00+00
2013	1	1	629	630	-1	721	740	-19	WN	4646	N273WN	LGA	BWI	40	185	6	30	2013-01-01 06:00:00+00
2013	1	1	629	630	-1	824	833	-9	US	1019	N426US	EWR	CLT	91	529	6	30	2013-01-01 06:00:00+00
2013	1	1	632	608	24	740	728	12	EV	4144	N13553	EWR	IAD	52	212	6	8	2013-01-01 06:00:00+00
2013	1	1	635	635	0	1028	940	48	AA	711	N3GKAA	LGA	DFW	248	1389	6	35	2013-01-01 06:00:00+00
2013	1	1	637	645	-8	930	935	-5	B6	389	N709JB	LGA	MCO	144	950	6	45	2013-01-01 06:00:00+00
2013	1	1	639	640	-1	739	749	-10	B6	1002	N805JB	JFK	BOS	41	187	6	40	2013-01-01 06:00:00+00
2013	1	1	643	646	-3	922	940	-18	UA	556	N497UA	EWR	PBI	146	1023	6	46	2013-01-01 06:00:00+00
2013	1	1	643	645	-2	837	848	-11	US	926	N178US	EWR	CLT	91	529	6	45	2013-01-01 06:00:00+00
2013	1	1	644	636	8	931	940	-9	UA	1701	N75435	EWR	FLL	151	1065	6	36	2013-01-01 06:00:00+00
2013	1	1	645	647	-2	815	810	5	B6	102	N796JB	JFK	BUF	63	301	6	47	2013-01-01 06:00:00+00
2013	1	1	646	645	1	910	916	-6	UA	883	N569UA	LGA	DEN	243	1620	6	45	2013-01-01 06:00:00+00
2013	1	1	646	645	1	1023	1030	-7	UA	1496	N38727	EWR	SNA	380	2434	6	45	2013-01-01 06:00:00+00
2013	1	1	651	655	-4	936	942	-6	B6	203	N558JB	JFK	LAS	323	2248	6	55	2013-01-01 06:00:00+00
2013	1	1	652	655	-3	932	921	11	B6	117	N178JB	JFK	MSY	191	1182	6	55	2013-01-01 06:00:00+00
2013	1	1	653	700	-7	936	1009	-33	DL	1383	N327NW	LGA	PBI	149	1035	7	0	2013-01-01 07:00:00+00
2013	1	1	655	655	0	1021	1030	-9	DL	1415	N3763D	JFK	SLC	294	1990	6	55	2013-01-01 06:00:00+00
2013	1	1	655	700	-5	1037	1045	-8	DL	1865	N705TW	JFK	SFO	362	2586	7	0	2013-01-01 07:00:00+00
2013	1	1	655	700	-5	1002	1020	-18	DL	2003	N997DL	LGA	MIA	161	1096	7	0	2013-01-01 07:00:00+00
2013	1	1	656	700	-4	854	850	4	AA	305	N4WNAA	LGA	ORD	143	733	7	0	2013-01-01 07:00:00+00
2013	1	1	656	659	-3	949	959	-10	AA	1815	N5FMAA	JFK	MCO	142	944	6	59	2013-01-01 06:00:00+00
2013	1	1	656	705	-9	1007	940	27	MQ	4534	N722MQ	LGA	XNA	233	1147	7	5	2013-01-01 07:00:00+00
2013	1	1	656	700	-4	948	1011	-23	UA	1115	N24212	EWR	TPA	156	997	7	0	2013-01-01 07:00:00+00
2013	1	1	657	700	-3	959	1013	-14	DL	1879	N318NB	LGA	FLL	164	1076	7	0	2013-01-01 07:00:00+00
2013	1	1	658	700	-2	944	939	5	DL	1547	N6703D	LGA	ATL	126	762	7	0	2013-01-01 07:00:00+00
2013	1	1	658	700	-2	1027	1025	2	VX	399	N627VA	JFK	LAX	361	2475	7	0	2013-01-01 07:00:00+00
2013	1	1	659	700	-1	1008	1015	-7	AA	2279	N3EKAA	LGA	MIA	159	1096	7	0	2013-01-01 07:00:00+00
2013	1	1	659	700	-1	1008	1007	1	B6	981	N646JB	JFK	FLL	156	1069	7	0	2013-01-01 07:00:00+00
2013	1	1	659	705	-6	907	913	-6	DL	831	N998DL	LGA	DTW	105	502	7	5	2013-01-01 07:00:00+00
2013	1	1	659	700	-1	959	1008	-9	UA	960	N838UA	EWR	RSW	164	1068	7	0	2013-01-01 07:00:00+00
2013	1	1	701	700	1	1123	1154	-31	UA	1203	N77296	EWR	SJU	188	1608	7	0	2013-01-01 07:00:00+00
2013	1	1	702	700	2	1058	1014	44	B6	671	N779JB	JFK	LAX	381	2475	7	0	2013-01-01 07:00:00+00
2013	1	1	709	700	9	852	832	20	UA	1092	N26226	LGA	ORD	135	733	7	0	2013-01-01 07:00:00+00
2013	1	1	711	715	-4	1151	1206	-15	B6	715	N651JB	JFK	SJU	190	1598	7	15	2013-01-01 07:00:00+00
2013	1	1	712	715	-3	1023	1035	-12	AA	825	N3ETAA	JFK	FLL	159	1069	7	15	2013-01-01 07:00:00+00
2013	1	1	715	713	2	911	850	21	UA	544	N841UA	EWR	ORD	156	719	7	13	2013-01-01 07:00:00+00
2013	1	1	717	720	-3	850	840	10	FL	850	N978AT	LGA	MKE	134	738	7	20	2013-01-01 07:00:00+00
2013	1	1	719	721	-2	1017	1012	5	B6	987	N562JB	JFK	MCO	147	944	7	21	2013-01-01 07:00:00+00
2013	1	1	723	725	-2	1013	1017	-4	UA	962	N514UA	EWR	PBI	153	1023	7	25	2013-01-01 07:00:00+00
2013	1	1	724	730	-6	1111	1040	31	AA	715	N541AA	LGA	DFW	254	1389	7	30	2013-01-01 07:00:00+00
2013	1	1	724	725	-1	1020	1030	-10	AS	11	N594AS	EWR	SEA	338	2402	7	25	2013-01-01 07:00:00+00
2013	1	1	725	730	-5	1052	1040	12	AA	2083	N4WRAA	EWR	DFW	238	1372	7	30	2013-01-01 07:00:00+00
2013	1	1	727	730	-3	959	952	7	UA	1162	N37462	EWR	DEN	254	1605	7	30	2013-01-01 07:00:00+00
2013	1	1	728	732	-4	1041	1038	3	UA	473	N488UA	LGA	IAH	238	1416	7	32	2013-01-01 07:00:00+00
2013	1	1	729	730	-1	1049	1115	-26	VX	11	N635VA	JFK	SFO	356	2586	7	30	2013-01-01 07:00:00+00
2013	1	1	732	735	-3	857	858	-1	B6	20	N304JB	JFK	ROC	64	264	7	35	2013-01-01 07:00:00+00
2013	1	1	732	729	3	1041	1039	2	B6	1601	N563JB	LGA	RSW	167	1080	7	29	2013-01-01 07:00:00+00
2013	1	1	732	645	47	1011	941	30	UA	1111	N37456	EWR	MCO	145	937	6	45	2013-01-01 06:00:00+00
2013	1	1	733	736	-3	854	850	4	B6	44	N552JB	JFK	SYR	54	209	7	36	2013-01-01 07:00:00+00
2013	1	1	734	737	-3	1047	1113	-26	B6	643	N625JB	JFK	SFO	350	2586	7	37	2013-01-01 07:00:00+00
2013	1	1	739	745	-6	918	930	-12	AA	309	N4WPAA	LGA	ORD	137	733	7	45	2013-01-01 07:00:00+00
2013	1	1	739	739	0	1104	1038	26	UA	1479	N37408	EWR	IAH	249	1400	7	39	2013-01-01 07:00:00+00
2013	1	1	741	745	-4	1038	1036	2	B6	983	N633JB	LGA	TPA	158	1010	7	45	2013-01-01 07:00:00+00
2013	1	1	743	730	13	1107	1100	7	AA	33	N338AA	JFK	LAX	358	2475	7	30	2013-01-01 07:00:00+00
2013	1	1	743	749	-6	1043	1054	-11	B6	341	N624JB	JFK	SRQ	164	1041	7	49	2013-01-01 07:00:00+00
2013	1	1	743	730	13	1059	1056	3	DL	495	N3760C	JFK	SEA	349	2422	7	30	2013-01-01 07:00:00+00
2013	1	1	745	745	0	1135	1125	10	AA	59	N336AA	JFK	SFO	378	2586	7	45	2013-01-01 07:00:00+00
2013	1	1	746	746	0	1119	1129	-10	UA	1668	N24224	EWR	SFO	373	2565	7	46	2013-01-01 07:00:00+00
2013	1	1	749	710	39	939	850	49	MQ	3737	N508MQ	EWR	ORD	148	719	7	10	2013-01-01 07:00:00+00
2013	1	1	752	755	-3	1041	1059	-18	DL	2263	N325US	LGA	MCO	140	950	7	55	2013-01-01 07:00:00+00
2013	1	1	752	750	2	1025	1029	-4	UA	477	N511UA	LGA	DEN	249	1620	7	50	2013-01-01 07:00:00+00
2013	1	1	752	759	-7	955	959	-4	US	1733	N543UW	LGA	CLT	96	544	7	59	2013-01-01 07:00:00+00
2013	1	1	753	755	-2	1056	1110	-14	AA	2267	N3HMAA	LGA	MIA	157	1096	7	55	2013-01-01 07:00:00+00
2013	1	1	754	759	-5	1039	1041	-2	DL	2047	N935DL	LGA	ATL	126	762	7	59	2013-01-01 07:00:00+00
2013	1	1	754	755	-1	1103	1030	33	WN	733	N789SW	LGA	DEN	279	1620	7	55	2013-01-01 07:00:00+00
2013	1	1	758	800	-2	1053	1054	-1	B6	517	N645JB	EWR	MCO	142	937	8	0	2013-01-01 08:00:00+00
2013	1	1	759	800	-1	1057	1127	-30	DL	1843	N955DL	JFK	MIA	158	1089	8	0	2013-01-01 08:00:00+00
2013	1	1	800	800	0	1022	1014	8	DL	2119	N317US	LGA	MSP	171	1020	8	0	2013-01-01 08:00:00+00
2013	1	1	800	810	-10	949	955	-6	MQ	4406	N828MQ	JFK	RDU	80	427	8	10	2013-01-01 08:00:00+00
2013	1	1	801	805	-4	900	919	-19	B6	1172	N206JB	EWR	BOS	38	200	8	5	2013-01-01 08:00:00+00
2013	1	1	803	810	-7	903	925	-22	AA	1838	N3GEAA	JFK	BOS	38	187	8	10	2013-01-01 08:00:00+00
2013	1	1	803	800	3	1132	1144	-12	UA	223	N510UA	JFK	SFO	369	2586	8	0	2013-01-01 08:00:00+00
2013	1	1	804	810	-6	1103	1116	-13	DL	1959	N947DL	JFK	MCO	147	944	8	10	2013-01-01 08:00:00+00
2013	1	1	805	805	0	1015	1005	10	B6	219	N273JB	JFK	CLT	98	541	8	5	2013-01-01 08:00:00+00
2013	1	1	805	800	5	1118	1106	12	B6	3	N570JB	JFK	FLL	165	1069	8	0	2013-01-01 08:00:00+00
2013	1	1	805	815	-10	1006	1010	-4	MQ	4490	N739MQ	LGA	CMH	101	479	8	15	2013-01-01 08:00:00+00
2013	1	1	807	810	-3	1043	1043	0	DL	269	N308DE	JFK	ATL	126	760	8	10	2013-01-01 08:00:00+00
2013	1	1	809	815	-6	1043	1050	-7	EV	4388	N14542	EWR	JAX	132	820	8	15	2013-01-01 08:00:00+00
2013	1	1	810	810	0	1048	1037	11	9E	3538	N915XJ	JFK	MSP	189	1029	8	10	2013-01-01 08:00:00+00
2013	1	1	810	815	-5	1100	1128	-28	DL	2395	N349NW	LGA	PBI	149	1035	8	15	2013-01-01 08:00:00+00
2013	1	1	811	815	-4	1006	1032	-26	EV	4260	N11193	EWR	CHS	101	628	8	15	2013-01-01 08:00:00+00
2013	1	1	811	630	101	1047	830	137	MQ	4576	N531MQ	LGA	CLT	118	544	6	30	2013-01-01 06:00:00+00
2013	1	1	811	815	-4	1026	1016	10	US	675	N654AW	EWR	CLT	96	529	8	15	2013-01-01 08:00:00+00
2013	1	1	812	814	-2	1040	1017	23	EV	4537	N17108	EWR	MEM	180	946	8	14	2013-01-01 08:00:00+00
2013	1	1	813	815	-2	1103	1056	7	DL	914	N375NC	LGA	DEN	267	1620	8	15	2013-01-01 08:00:00+00
2013	1	1	814	810	4	1047	1030	17	FL	346	N977AT	LGA	ATL	132	762	8	10	2013-01-01 08:00:00+00
2013	1	1	817	810	7	1005	948	17	B6	1051	N228JB	JFK	PIT	86	340	8	10	2013-01-01 08:00:00+00
2013	1	1	820	820	0	1254	1310	-16	B6	717	N527JB	JFK	SJU	190	1598	8	20	2013-01-01 08:00:00+00
2013	1	1	820	830	-10	940	954	-14	DL	27	N324US	JFK	BOS	36	187	8	30	2013-01-01 08:00:00+00
2013	1	1	820	820	0	1249	1329	-40	DL	301	N900PC	JFK	SJU	182	1598	8	20	2013-01-01 08:00:00+00
2013	1	1	821	820	1	1153	1129	24	B6	181	N521JB	JFK	SAN	354	2446	8	20	2013-01-01 08:00:00+00
2013	1	1	821	825	-4	932	945	-13	MQ	4418	N846MQ	JFK	DCA	52	213	8	25	2013-01-01 08:00:00+00
2013	1	1	822	830	-8	1014	1016	-2	EV	4104	N12540	LGA	CLE	91	419	8	30	2013-01-01 08:00:00+00
2013	1	1	823	825	-2	1019	1024	-5	US	487	N655AW	JFK	CLT	96	541	8	25	2013-01-01 08:00:00+00
2013	1	1	823	823	0	1151	1135	16	UA	1223	N39728	EWR	DFW	250	1372	8	23	2013-01-01 08:00:00+00
2013	1	1	824	830	-6	1027	1025	2	AA	1855	N573AA	LGA	STL	169	888	8	30	2013-01-01 08:00:00+00
2013	1	1	825	827	-2	1058	1105	-7	B6	611	N292JB	JFK	JAX	130	828	8	27	2013-01-01 08:00:00+00
2013	1	1	826	715	71	1136	1045	51	AA	443	N3GVAA	JFK	MIA	160	1089	7	15	2013-01-01 07:00:00+00
2013	1	1	826	817	9	1145	1158	-13	UA	1480	N76522	EWR	SFO	357	2565	8	17	2013-01-01 08:00:00+00
2013	1	1	828	830	-2	1027	1012	15	B6	905	N274JB	JFK	ORD	160	740	8	30	2013-01-01 08:00:00+00
2013	1	1	828	823	5	1150	1143	7	UA	1506	N76528	EWR	LAX	359	2454	8	23	2013-01-01 08:00:00+00
2013	1	1	829	830	-1	1152	1200	-8	UA	443	N554UA	JFK	LAX	360	2475	8	30	2013-01-01 08:00:00+00
2013	1	1	829	830	-1	1117	1140	-23	UA	1592	N75425	EWR	MCO	145	937	8	30	2013-01-01 08:00:00+00
2013	1	1	830	830	0	1018	1015	3	AA	313	N4YCAA	LGA	ORD	137	733	8	30	2013-01-01 08:00:00+00
2013	1	1	830	835	-5	1052	1105	-13	MQ	4610	N513MQ	LGA	ATL	123	762	8	35	2013-01-01 08:00:00+00
2013	1	1	831	835	-4	1021	1039	-18	EV	4412	N13969	EWR	MYR	92	550	8	35	2013-01-01 08:00:00+00
2013	1	1	832	840	-8	1006	1030	-24	MQ	4521	N725MQ	LGA	RDU	77	431	8	40	2013-01-01 08:00:00+00
2013	1	1	833	835	-2	1134	1102	32	F9	835	N203FR	LGA	DEN	257	1620	8	35	2013-01-01 08:00:00+00
2013	1	1	835	835	0	1210	1150	20	AA	717	N3BDAA	LGA	DFW	249	1389	8	35	2013-01-01 08:00:00+00
2013	1	1	839	850	-11	1027	1035	-8	MQ	4558	N711MQ	LGA	CLE	88	419	8	50	2013-01-01 08:00:00+00
2013	1	1	840	845	-5	1311	1350	-39	AA	1357	N5FSAA	JFK	SJU	188	1598	8	45	2013-01-01 08:00:00+00
2013	1	1	840	845	-5	1053	1102	-9	DL	2304	N926DL	JFK	DTW	108	509	8	45	2013-01-01 08:00:00+00
2013	1	1	846	845	1	1138	1205	-27	B6	553	N564JB	EWR	RSW	157	1068	8	45	2013-01-01 08:00:00+00
2013	1	1	848	1835	853	1001	1950	851	MQ	3944	N942MQ	JFK	BWI	41	184	18	35	2013-01-01 18:00:00+00
2013	1	1	848	851	-3	1155	1136	19	UA	1741	N27724	EWR	JAC	275	1874	8	51	2013-01-01 08:00:00+00
2013	1	1	851	851	0	1032	1036	-4	EV	4548	N19966	EWR	RDU	75	416	8	51	2013-01-01 08:00:00+00
2013	1	1	851	859	-8	1102	1105	-3	DL	869	N361NB	EWR	DTW	106	488	8	59	2013-01-01 08:00:00+00
2013	1	1	851	840	11	1215	1206	9	UA	1626	N39297	EWR	SAN	367	2425	8	40	2013-01-01 08:00:00+00
2013	1	1	852	855	-3	1046	1020	26	WN	3848	N777QC	EWR	MDW	146	711	8	55	2013-01-01 08:00:00+00
2013	1	1	853	845	8	1147	1145	2	B6	59	N184JB	JFK	TPA	159	1005	8	45	2013-01-01 08:00:00+00
2013	1	1	855	859	-4	1143	1145	-2	DL	1747	N646DL	LGA	ATL	129	762	8	59	2013-01-01 08:00:00+00
2013	1	1	856	900	-4	1226	1220	6	AA	1	N324AA	JFK	LAX	358	2475	9	0	2013-01-01 09:00:00+00
2013	1	1	856	900	-4	1222	1232	-10	DL	2143	N970DL	LGA	MIA	158	1096	9	0	2013-01-01 09:00:00+00
2013	1	1	856	855	1	1140	1203	-23	UA	1296	N75426	EWR	PBI	150	1023	8	55	2013-01-01 08:00:00+00
2013	1	1	857	900	-3	1516	1530	-14	HA	51	N380HA	JFK	HNL	659	4983	9	0	2013-01-01 09:00:00+00
2013	1	1	857	905	-8	1107	1120	-13	DL	181	N321NB	LGA	DTW	110	502	9	5	2013-01-01 09:00:00+00
2013	1	1	857	900	-3	1124	1133	-9	DL	485	N371NB	EWR	ATL	125	746	9	0	2013-01-01 09:00:00+00
2013	1	1	857	851	6	1157	1222	-25	UA	1670	N45440	EWR	SEA	343	2402	8	51	2013-01-01 08:00:00+00
2013	1	1	858	900	-2	1102	1110	-8	MQ	4478	N737MQ	LGA	DTW	103	502	9	0	2013-01-01 09:00:00+00
2013	1	1	859	900	-1	1140	1204	-24	DL	1885	N360NB	LGA	MCO	140	950	9	0	2013-01-01 09:00:00+00
2013	1	1	859	900	-1	1223	1225	-2	VX	407	N846VA	JFK	LAX	359	2475	9	0	2013-01-01 09:00:00+00
2013	1	1	900	900	0	1211	1203	8	UA	1170	N19130	EWR	FLL	161	1065	9	0	2013-01-01 09:00:00+00
2013	1	1	902	903	-1	1048	1045	3	UA	580	N820UA	EWR	ORD	145	719	9	3	2013-01-01 09:00:00+00
2013	1	1	903	820	43	1045	955	50	MQ	4655	N532MQ	LGA	BNA	142	764	8	20	2013-01-01 08:00:00+00
2013	1	1	904	906	-2	1207	1226	-19	UA	1401	N77525	EWR	MIA	158	1085	9	6	2013-01-01 09:00:00+00
2013	1	1	905	905	0	1309	1229	40	B6	1061	N281JB	JFK	AUS	263	1521	9	5	2013-01-01 09:00:00+00
2013	1	1	906	843	23	1134	1125	9	UA	1643	N17139	EWR	DEN	246	1605	8	43	2013-01-01 08:00:00+00
2013	1	1	908	910	-2	1020	1027	-7	B6	56	N203JB	JFK	BTV	52	266	9	10	2013-01-01 09:00:00+00
2013	1	1	908	915	-7	1004	1033	-29	US	1467	N959UW	LGA	PHL	32	96	9	15	2013-01-01 09:00:00+00
2013	1	1	908	908	0	1228	1219	9	UA	1220	N12216	EWR	IAH	233	1400	9	8	2013-01-01 09:00:00+00
2013	1	1	909	810	59	1331	1315	16	AA	655	N5EXAA	JFK	STT	184	1623	8	10	2013-01-01 08:00:00+00
2013	1	1	912	900	12	1241	1220	21	AA	647	N5CRAA	JFK	MIA	166	1089	9	0	2013-01-01 09:00:00+00
2013	1	1	912	906	6	1219	1226	-7	UA	1601	N38403	EWR	MIA	159	1085	9	6	2013-01-01 09:00:00+00
2013	1	1	913	918	-5	1346	1416	-30	UA	1519	N24715	EWR	STT	189	1634	9	18	2013-01-01 09:00:00+00
2013	1	1	914	920	-6	1244	1240	4	AA	1589	N517AA	EWR	DFW	238	1372	9	20	2013-01-01 09:00:00+00
2013	1	1	914	900	14	1058	1043	15	UA	783	N810UA	EWR	CLE	85	404	9	0	2013-01-01 09:00:00+00
2013	1	1	917	920	-3	1313	1245	28	AA	721	N596AA	LGA	DFW	258	1389	9	20	2013-01-01 09:00:00+00
2013	1	1	917	915	2	1206	1211	-5	B6	41	N568JB	JFK	MCO	145	944	9	15	2013-01-01 09:00:00+00
2013	1	1	917	920	-3	1052	1108	-16	B6	1103	N216JB	JFK	RDU	80	427	9	20	2013-01-01 09:00:00+00
2013	1	1	920	905	15	1039	1025	14	B6	1305	N346JB	JFK	IAD	52	228	9	5	2013-01-01 09:00:00+00
2013	1	1	920	920	0	1152	1125	27	MQ	4582	N527MQ	LGA	CLT	92	544	9	20	2013-01-01 09:00:00+00
2013	1	1	921	900	21	1237	1227	10	DL	120	N713TW	JFK	LAX	333	2475	9	0	2013-01-01 09:00:00+00
2013	1	1	923	919	4	1026	1030	-4	B6	1004	N580JB	JFK	BOS	38	187	9	19	2013-01-01 09:00:00+00
2013	1	1	926	929	-3	1404	1421	-17	B6	215	N775JB	EWR	SJU	191	1608	9	29	2013-01-01 09:00:00+00
2013	1	1	926	922	4	1221	1219	2	B6	57	N534JB	JFK	PBI	151	1028	9	22	2013-01-01 09:00:00+00
2013	1	1	926	928	-2	1233	1220	13	UA	1597	N27733	EWR	EGE	287	1726	9	28	2013-01-01 09:00:00+00
2013	1	1	927	930	-3	1231	1257	-26	DL	1335	N951DL	LGA	RSW	166	1080	9	30	2013-01-01 09:00:00+00
2013	1	1	929	929	0	1028	1042	-14	EV	4636	N11551	EWR	DCA	43	199	9	29	2013-01-01 09:00:00+00
2013	1	1	929	925	4	1220	1150	30	WN	766	N957WN	EWR	DEN	264	1605	9	25	2013-01-01 09:00:00+00
2013	1	1	930	905	25	1218	1209	9	UA	1148	N57439	EWR	TPA	149	997	9	5	2013-01-01 09:00:00+00
2013	1	1	931	930	1	1237	1238	-1	B6	375	N508JB	LGA	FLL	161	1076	9	30	2013-01-01 09:00:00+00
2013	1	1	931	930	1	1121	1108	13	UA	255	N479UA	LGA	ORD	154	733	9	30	2013-01-01 09:00:00+00
2013	1	1	932	930	2	1219	1225	-6	VX	251	N641VA	JFK	LAS	324	2248	9	30	2013-01-01 09:00:00+00
2013	1	1	933	937	-4	1057	1102	-5	B6	4	N503JB	JFK	BUF	66	301	9	37	2013-01-01 09:00:00+00
2013	1	1	933	904	29	1252	1210	42	B6	17	N579JB	JFK	FLL	170	1069	9	4	2013-01-01 09:00:00+00
2013	1	1	933	935	-2	1120	1105	15	WN	3895	N487WN	LGA	MDW	145	725	9	35	2013-01-01 09:00:00+00
2013	1	1	936	940	-4	1235	1251	-16	DL	2137	N975DL	LGA	TPA	159	1010	9	40	2013-01-01 09:00:00+00
2013	1	1	936	945	-9	1257	1309	-12	DL	1903	N900DE	LGA	SRQ	169	1047	9	45	2013-01-01 09:00:00+00
2013	1	1	937	940	-3	1238	1235	3	B6	361	N615JB	LGA	PBI	154	1035	9	40	2013-01-01 09:00:00+00
2013	1	1	937	940	-3	1127	1120	7	WN	1807	N729SW	LGA	MKE	143	738	9	40	2013-01-01 09:00:00+00
2013	1	1	940	945	-5	1119	1130	-11	AA	319	N4WJAA	LGA	ORD	133	733	9	45	2013-01-01 09:00:00+00
2013	1	1	940	955	-15	1226	1220	6	MQ	4654	N525MQ	LGA	ATL	129	762	9	55	2013-01-01 09:00:00+00
2013	1	1	941	945	-4	1300	1258	2	B6	679	N806JB	JFK	LAX	352	2475	9	45	2013-01-01 09:00:00+00
2013	1	1	946	959	-13	1146	1202	-16	EV	4175	N15912	EWR	AVL	105	583	9	59	2013-01-01 09:00:00+00
2013	1	1	947	953	-6	1053	1110	-17	B6	600	N306JB	JFK	PWM	47	273	9	53	2013-01-01 09:00:00+00
2013	1	1	950	954	-4	1155	1142	13	EV	4681	N12567	EWR	STL	170	872	9	54	2013-01-01 09:00:00+00
2013	1	1	953	959	-6	1141	1129	12	MQ	4670	N6EAMQ	LGA	BNA	144	764	9	59	2013-01-01 09:00:00+00
2013	1	1	953	921	32	1320	1241	39	UA	222	N586UA	EWR	LAX	346	2454	9	21	2013-01-01 09:00:00+00
2013	1	1	955	1000	-5	1336	1325	11	US	75	N642AW	EWR	PHX	324	2133	10	0	2013-01-01 10:00:00+00
2013	1	1	956	1000	-4	1241	1241	0	DL	1847	N956DL	LGA	ATL	129	762	10	0	2013-01-01 10:00:00+00
2013	1	1	957	733	144	1056	853	123	UA	856	N534UA	EWR	BOS	37	200	7	33	2013-01-01 07:00:00+00
2013	1	1	959	1002	-3	1313	1319	-6	DL	2379	N965DL	LGA	FLL	151	1076	10	2	2013-01-01 10:00:00+00
2013	1	1	959	1000	-1	1151	1206	-15	US	1177	N765US	LGA	CLT	90	544	10	0	2013-01-01 10:00:00+00
2013	1	1	1003	1010	-7	1255	1320	-25	B6	503	N565JB	EWR	FLL	152	1065	10	10	2013-01-01 10:00:00+00
2013	1	1	1003	959	4	1408	1329	39	US	196	N541UW	JFK	PHX	342	2153	9	59	2013-01-01 09:00:00+00
2013	1	1	1005	1000	5	1239	1234	5	UA	1625	N81449	EWR	DEN	254	1605	10	0	2013-01-01 10:00:00+00
2013	1	1	1007	1010	-3	1147	1140	7	MQ	3795	N503MQ	EWR	ORD	131	719	10	10	2013-01-01 10:00:00+00
2013	1	1	1009	1015	-6	1219	1229	-10	DL	2319	N933DL	LGA	MSP	160	1020	10	15	2013-01-01 10:00:00+00
2013	1	1	1010	1015	-5	1204	1210	-6	US	1103	N162UW	EWR	CLT	90	529	10	15	2013-01-01 10:00:00+00
2013	1	1	1010	1015	-5	1225	1214	11	US	1441	N712US	JFK	CLT	97	541	10	15	2013-01-01 10:00:00+00
2013	1	1	1011	1001	10	1133	1128	5	EV	5736	N820AS	LGA	IAD	59	229	10	1	2013-01-01 10:00:00+00
2013	1	1	1011	1015	-4	1246	1307	-21	DL	1529	N399DA	JFK	LAS	320	2248	10	15	2013-01-01 10:00:00+00
2013	1	1	1021	1023	-2	1254	1252	2	FL	347	N942AT	LGA	ATL	129	762	10	23	2013-01-01 10:00:00+00
2013	1	1	1024	1029	-5	1140	1150	-10	EV	4709	N14905	EWR	BUF	59	282	10	29	2013-01-01 10:00:00+00
2013	1	1	1024	1030	-6	1204	1215	-11	MQ	4471	N719MQ	LGA	RDU	78	431	10	30	2013-01-01 10:00:00+00
2013	1	1	1025	1020	5	1356	1330	26	AA	731	N3FXAA	LGA	DFW	247	1389	10	20	2013-01-01 10:00:00+00
2013	1	1	1025	951	34	1258	1302	-4	UA	501	N437UA	EWR	MCO	137	937	9	51	2013-01-01 09:00:00+00
2013	1	1	1026	1030	-4	1351	1340	11	AA	19	N328AA	JFK	LAX	356	2475	10	30	2013-01-01 10:00:00+00
2013	1	1	1028	1026	2	1350	1339	11	UA	1004	N76508	LGA	IAH	237	1416	10	26	2013-01-01 10:00:00+00
2013	1	1	1029	1030	-1	1427	1355	32	AA	179	N325AA	JFK	SFO	389	2586	10	30	2013-01-01 10:00:00+00
2013	1	1	1030	1035	-5	1229	1246	-17	EV	4277	N11189	EWR	CHS	100	628	10	35	2013-01-01 10:00:00+00
2013	1	1	1031	1030	1	1353	1415	-22	VX	23	N625VA	JFK	SFO	363	2586	10	30	2013-01-01 10:00:00+00
2013	1	1	1031	1030	1	1323	1334	-11	UA	1294	N77258	EWR	FLL	157	1065	10	30	2013-01-01 10:00:00+00
2013	1	1	1032	1035	-3	1305	1250	15	EV	4180	N13955	EWR	IND	135	645	10	35	2013-01-01 10:00:00+00
2013	1	1	1033	1017	16	1130	1136	-6	UA	779	N849UA	EWR	BOS	42	200	10	17	2013-01-01 10:00:00+00
2013	1	1	1037	1030	7	1221	1210	11	AA	321	N581AA	LGA	ORD	133	733	10	30	2013-01-01 10:00:00+00
2013	1	1	1038	1030	8	1223	1202	21	UA	985	N423UA	EWR	ORD	149	719	10	30	2013-01-01 10:00:00+00
2013	1	1	1042	1040	2	1325	1326	-1	B6	31	N529JB	JFK	MCO	142	944	10	40	2013-01-01 10:00:00+00
2013	1	1	1044	1045	-1	1231	1212	19	EV	4322	N15555	EWR	MKE	151	725	10	45	2013-01-01 10:00:00+00
2013	1	1	1044	1045	-1	1352	1351	1	UA	455	N667UA	EWR	IAH	229	1400	10	45	2013-01-01 10:00:00+00
2013	1	1	1044	1041	3	1339	1350	-11	UA	1060	N76503	EWR	RSW	157	1068	10	41	2013-01-01 10:00:00+00
2013	1	1	1047	1055	-8	1359	1405	-6	AA	739	N3AVAA	LGA	DFW	230	1389	10	55	2013-01-01 10:00:00+00
2013	1	1	1047	1050	-3	1401	1410	-9	DL	1275	N3748Y	JFK	SLC	295	1990	10	50	2013-01-01 10:00:00+00
2013	1	1	1048	1050	-2	1302	1250	12	MQ	4589	N537MQ	LGA	DTW	112	502	10	50	2013-01-01 10:00:00+00
2013	1	1	1053	1050	3	1402	1358	4	B6	373	N520JB	LGA	FLL	165	1076	10	50	2013-01-01 10:00:00+00
2013	1	1	1054	1059	-5	1326	1339	-13	DL	1647	N920DE	LGA	ATL	129	762	10	59	2013-01-01 10:00:00+00
2013	1	1	1056	1059	-3	1203	1209	-6	EV	4479	N11544	EWR	PWM	51	284	10	59	2013-01-01 10:00:00+00
2013	1	1	1056	1100	-4	1407	1413	-6	DL	2185	N917DL	LGA	TPA	158	1010	11	0	2013-01-01 11:00:00+00
2013	1	1	1058	1100	-2	1210	1216	-6	US	2171	N951UW	LGA	DCA	50	214	11	0	2013-01-01 11:00:00+00
2013	1	1	1059	1100	-1	1201	1215	-14	WN	321	N505SW	LGA	BWI	43	185	11	0	2013-01-01 11:00:00+00
2013	1	1	1059	1100	-1	1210	1215	-5	MQ	3792	N509MQ	JFK	DCA	50	213	11	0	2013-01-01 11:00:00+00
2013	1	1	1059	1053	6	1342	1351	-9	UA	369	N451UA	EWR	LAS	325	2227	10	53	2013-01-01 10:00:00+00
2013	1	1	1101	1043	18	1345	1332	13	B6	545	N630JB	EWR	PBI	145	1023	10	43	2013-01-01 10:00:00+00
2013	1	1	1103	1100	3	1410	1421	-11	DL	2071	N339NW	LGA	MIA	155	1096	11	0	2013-01-01 11:00:00+00
2013	1	1	1105	1047	18	1428	1405	23	UA	688	N521UA	EWR	SFO	356	2565	10	47	2013-01-01 10:00:00+00
2013	1	1	1107	1115	-8	1305	1310	-5	MQ	4485	N730MQ	LGA	CMH	95	479	11	15	2013-01-01 11:00:00+00
2013	1	1	1109	1115	-6	1402	1425	-23	AA	2099	N3GSAA	LGA	MIA	157	1096	11	15	2013-01-01 11:00:00+00
2013	1	1	1111	1115	-4	1222	1226	-4	B6	24	N279JB	JFK	BTV	52	266	11	15	2013-01-01 11:00:00+00
2013	1	1	1112	1100	12	1440	1438	2	UA	285	N517UA	JFK	SFO	364	2586	11	0	2013-01-01 11:00:00+00
2013	1	1	1113	1115	-2	1318	1315	3	DL	1031	N320NB	LGA	DTW	104	502	11	15	2013-01-01 11:00:00+00
2013	1	1	1114	900	134	1447	1222	145	UA	1086	N76502	LGA	IAH	248	1416	9	0	2013-01-01 09:00:00+00
2013	1	1	1120	944	96	1331	1213	78	EV	4495	N16561	EWR	SAV	117	708	9	44	2013-01-01 09:00:00+00
2013	1	1	1120	1125	-5	1330	1325	5	WN	1057	N469WN	LGA	STL	176	888	11	25	2013-01-01 11:00:00+00
2013	1	1	1123	1110	13	1410	1336	34	UA	405	N587UA	LGA	DEN	256	1620	11	10	2013-01-01 11:00:00+00
2013	1	1	1124	1100	24	1435	1431	4	B6	641	N590JB	JFK	SFO	349	2586	11	0	2013-01-01 11:00:00+00
2013	1	1	1124	1125	-1	1445	1445	0	DL	1171	N376NW	LGA	RSW	169	1080	11	25	2013-01-01 11:00:00+00
2013	1	1	1125	1130	-5	1325	1332	-7	US	1085	N169UW	LGA	CLT	94	544	11	30	2013-01-01 11:00:00+00
2013	1	1	1127	1129	-2	1303	1309	-6	EV	4294	N14180	EWR	RDU	73	416	11	29	2013-01-01 11:00:00+00
2013	1	1	1127	1130	-3	1504	1448	16	UA	703	N518UA	JFK	LAX	357	2475	11	30	2013-01-01 11:00:00+00
2013	1	1	1127	1129	-2	1421	1425	-4	UA	1143	N14118	EWR	PBI	156	1023	11	29	2013-01-01 11:00:00+00
2013	1	1	1128	1129	-1	1422	1437	-15	UA	987	N496UA	EWR	TPA	156	997	11	29	2013-01-01 11:00:00+00
2013	1	1	1130	1125	5	1301	1305	-4	AA	327	N3DEAA	LGA	ORD	127	733	11	25	2013-01-01 11:00:00+00
2013	1	1	1130	1131	-1	1345	1342	3	DL	2219	N343NB	LGA	MSP	166	1020	11	31	2013-01-01 11:00:00+00
2013	1	1	1132	1135	-3	1324	1330	-6	MQ	4553	N856MQ	LGA	CLE	89	419	11	35	2013-01-01 11:00:00+00
2013	1	1	1133	1129	4	1440	1437	3	B6	133	N652JB	JFK	RSW	168	1074	11	29	2013-01-01 11:00:00+00
2013	1	1	1133	1130	3	1448	1450	-2	VX	409	N839VA	JFK	LAX	347	2475	11	30	2013-01-01 11:00:00+00
2013	1	1	1135	1140	-5	1429	1445	-16	AA	1623	N3EYAA	EWR	MIA	156	1085	11	40	2013-01-01 11:00:00+00
2013	1	1	1137	1140	-3	1445	1451	-6	DL	2175	N999DN	LGA	PBI	153	1035	11	40	2013-01-01 11:00:00+00
2013	1	1	1143	1145	-2	1512	1507	5	UA	1010	N39726	EWR	SNA	371	2434	11	45	2013-01-01 11:00:00+00
2013	1	1	1144	1145	-1	1422	1411	11	EV	4876	N695CA	EWR	ATL	126	746	11	45	2013-01-01 11:00:00+00
2013	1	1	1147	1155	-8	1335	1327	8	FL	353	N932AT	LGA	CAK	82	397	11	55	2013-01-01 11:00:00+00
2013	1	1	1150	1156	-6	1302	1314	-12	EV	4693	N21144	EWR	SYR	46	195	11	56	2013-01-01 11:00:00+00
2013	1	1	1153	1159	-6	1350	1341	9	EV	4275	N29917	EWR	CMH	95	463	11	59	2013-01-01 11:00:00+00
2013	1	1	1153	1123	30	1454	1425	29	B6	1	N552JB	JFK	FLL	167	1069	11	23	2013-01-01 11:00:00+00
2013	1	1	1153	1200	-7	1450	1529	-39	DL	863	N712TW	JFK	LAX	330	2475	12	0	2013-01-01 12:00:00+00
2013	1	1	1154	1200	-6	1253	1306	-13	B6	1174	N206JB	EWR	BOS	40	200	12	0	2013-01-01 12:00:00+00
2013	1	1	1154	1200	-6	1452	1430	22	MQ	4658	N8EGMQ	LGA	ATL	141	762	12	0	2013-01-01 12:00:00+00
2013	1	1	1155	1200	-5	1517	1510	7	AA	3	N322AA	JFK	LAX	353	2475	12	0	2013-01-01 12:00:00+00
2013	1	1	1155	1200	-5	1507	1519	-12	DL	1443	N969DL	LGA	FLL	160	1076	12	0	2013-01-01 12:00:00+00
2013	1	1	1155	1200	-5	1441	1440	1	DL	1947	N904DL	LGA	ATL	133	762	12	0	2013-01-01 12:00:00+00
2013	1	1	1155	1200	-5	1312	1315	-3	MQ	4425	N846MQ	JFK	DCA	57	213	12	0	2013-01-01 12:00:00+00
2013	1	1	1157	1158	-1	1310	1315	-5	EV	4511	N16546	EWR	ROC	50	246	11	58	2013-01-01 11:00:00+00
2013	1	1	1157	1205	-8	1342	1345	-3	MQ	4431	N723MQ	LGA	RDU	80	431	12	5	2013-01-01 12:00:00+00
2013	1	1	1157	1200	-3	1452	1456	-4	UA	1197	N13113	EWR	MCO	151	937	12	0	2013-01-01 12:00:00+00
2013	1	1	1158	1205	-7	1530	1520	10	AA	743	N426AA	LGA	DFW	248	1389	12	5	2013-01-01 12:00:00+00
2013	1	1	1158	1200	-2	1256	1300	-4	WN	1568	N783SW	EWR	BWI	38	169	12	0	2013-01-01 12:00:00+00
2013	1	1	1158	1200	-2	1338	1331	7	UA	701	N588UA	LGA	ORD	142	733	12	0	2013-01-01 12:00:00+00
2013	1	1	1200	1200	0	1408	1356	12	US	1443	N755US	JFK	CLT	102	541	12	0	2013-01-01 12:00:00+00
2013	1	1	1202	1207	-5	1318	1314	4	EV	4347	N11536	EWR	BTV	51	266	12	7	2013-01-01 12:00:00+00
2013	1	1	1202	1159	3	1645	1653	-8	UA	1663	N38403	EWR	SJU	187	1608	11	59	2013-01-01 11:00:00+00
2013	1	1	1203	1205	-2	1501	1437	24	EV	3850	N13978	EWR	ATL	142	746	12	5	2013-01-01 12:00:00+00
2013	1	1	1203	1200	3	1519	1545	-26	VX	25	N843VA	JFK	SFO	353	2586	12	0	2013-01-01 12:00:00+00
2013	1	1	1204	1200	4	1500	1448	12	B6	523	N612JB	EWR	MCO	139	937	12	0	2013-01-01 12:00:00+00
2013	1	1	1205	1200	5	1503	1505	-2	UA	1461	N39418	EWR	IAH	221	1400	12	0	2013-01-01 12:00:00+00
2013	1	1	1206	1209	-3	1325	1328	-3	EV	4216	N14168	EWR	BUF	59	282	12	9	2013-01-01 12:00:00+00
2013	1	1	1208	1158	10	1540	1502	38	B6	625	N239JB	JFK	HOU	253	1428	11	58	2013-01-01 11:00:00+00
2013	1	1	1211	1215	-4	1423	1413	10	EV	4135	N21537	EWR	CLT	102	529	12	15	2013-01-01 12:00:00+00
2013	1	1	1217	1220	-3	1414	1350	24	MQ	3697	N517MQ	EWR	ORD	143	719	12	20	2013-01-01 12:00:00+00
2013	1	1	1217	1218	-1	1525	1529	-4	UA	391	N573UA	EWR	SFO	345	2565	12	18	2013-01-01 12:00:00+00
2013	1	1	1219	1220	-1	1415	1415	0	AA	1757	N545AA	LGA	STL	161	888	12	20	2013-01-01 12:00:00+00
2013	1	1	1219	1225	-6	1451	1500	-9	DL	1715	N342NB	LGA	MSY	195	1183	12	25	2013-01-01 12:00:00+00
2013	1	1	1220	1220	0	1403	1340	23	WN	133	N254WN	EWR	MDW	142	711	12	20	2013-01-01 12:00:00+00
2013	1	1	1222	1159	23	1512	1429	43	EV	4679	N14916	EWR	JAX	131	820	11	59	2013-01-01 11:00:00+00
2013	1	1	1222	1229	-7	1520	1526	-6	B6	27	N192JB	JFK	TPA	160	1005	12	29	2013-01-01 12:00:00+00
2013	1	1	1228	1224	4	1631	1604	27	UA	1114	N38459	EWR	PHX	339	2133	12	24	2013-01-01 12:00:00+00
2013	1	1	1230	1235	-5	1440	1438	2	EV	5311	N741EV	EWR	DTW	108	488	12	35	2013-01-01 12:00:00+00
2013	1	1	1231	1238	-7	1449	1446	3	DL	1131	N920DL	LGA	DTW	108	502	12	38	2013-01-01 12:00:00+00
2013	1	1	1231	1229	2	1523	1529	-6	UA	428	N402UA	EWR	FLL	156	1065	12	29	2013-01-01 12:00:00+00
2013	1	1	1237	1245	-8	1340	1350	-10	AA	1850	N3EGAA	JFK	BOS	40	187	12	45	2013-01-01 12:00:00+00
2013	1	1	1238	1240	-2	1410	1405	5	WN	564	N297WN	LGA	MKE	137	738	12	40	2013-01-01 12:00:00+00
2013	1	1	1240	1229	11	1451	1428	23	EV	4118	N14543	EWR	DTW	114	488	12	29	2013-01-01 12:00:00+00
2013	1	1	1240	1245	-5	1554	1600	-6	AA	2253	N3BUAA	LGA	MIA	156	1096	12	45	2013-01-01 12:00:00+00
2013	1	1	1240	1235	5	1415	1415	0	MQ	4404	N828MQ	JFK	RDU	79	427	12	35	2013-01-01 12:00:00+00
2013	1	1	1241	1247	-6	1342	1355	-13	EV	4129	N36915	EWR	DCA	45	199	12	47	2013-01-01 12:00:00+00
2013	1	1	1245	1245	0	1616	1615	1	DL	2174	N711ZX	JFK	SLC	298	1990	12	45	2013-01-01 12:00:00+00
2013	1	1	1245	1249	-4	1722	1800	-38	DL	315	N670DN	JFK	SJU	188	1598	12	49	2013-01-01 12:00:00+00
2013	1	1	1246	1225	21	1424	1348	36	B6	66	N228JB	JFK	BUF	70	301	12	25	2013-01-01 12:00:00+00
2013	1	1	1248	1250	-2	1607	1607	0	UA	1280	N26210	LGA	IAH	238	1416	12	50	2013-01-01 12:00:00+00
2013	1	1	1251	1252	-1	1611	1555	16	B6	85	N657JB	JFK	FLL	173	1069	12	52	2013-01-01 12:00:00+00
2013	1	1	1252	1245	7	1624	1550	34	AA	745	N3FTAA	LGA	DFW	243	1389	12	45	2013-01-01 12:00:00+00
2013	1	1	1253	1212	41	1524	1436	48	UA	754	N576UA	EWR	DEN	252	1605	12	12	2013-01-01 12:00:00+00
2013	1	1	1255	1300	-5	1541	1537	4	DL	781	N644DL	LGA	ATL	132	762	13	0	2013-01-01 13:00:00+00
2013	1	1	1255	1255	0	1540	1535	5	WN	1251	N732SW	LGA	DEN	264	1620	12	55	2013-01-01 12:00:00+00
2013	1	1	1255	1200	55	1451	1330	81	MQ	4601	N518MQ	LGA	BNA	139	764	12	0	2013-01-01 12:00:00+00
2013	1	1	1255	1259	-4	1501	1502	-1	US	1459	N540UW	LGA	CLT	100	544	12	59	2013-01-01 12:00:00+00
2013	1	1	1255	1300	-5	1401	1409	-8	US	2128	N957UW	LGA	BOS	38	184	13	0	2013-01-01 13:00:00+00
2013	1	1	1257	1258	-1	1601	1610	-9	B6	209	N793JB	JFK	LGB	346	2465	12	58	2013-01-01 12:00:00+00
2013	1	1	1257	1300	-3	1454	1450	4	MQ	4426	N739MQ	LGA	CMH	97	479	13	0	2013-01-01 13:00:00+00
2013	1	1	1258	1308	-10	1532	1537	-5	FL	348	N717JL	LGA	ATL	128	762	13	8	2013-01-01 13:00:00+00
2013	1	1	1258	1300	-2	1459	1440	19	AA	329	N511AA	LGA	ORD	147	733	13	0	2013-01-01 13:00:00+00
2013	1	1	1301	1240	21	1633	1540	53	AA	1853	N544AA	EWR	DFW	252	1372	12	40	2013-01-01 12:00:00+00
2013	1	1	1301	1150	71	1518	1345	93	MQ	4646	N542MQ	LGA	MSP	170	1020	11	50	2013-01-01 11:00:00+00
2013	1	1	1301	1255	6	1629	1603	26	UA	765	N825UA	EWR	DFW	243	1372	12	55	2013-01-01 12:00:00+00
2013	1	1	1302	1259	3	1402	1404	-2	B6	1006	N273JB	JFK	BOS	40	187	12	59	2013-01-01 12:00:00+00
2013	1	1	1302	1300	2	1553	1601	-8	UA	1435	N78511	EWR	MIA	158	1085	13	0	2013-01-01 13:00:00+00
2013	1	1	1304	1227	37	1518	1422	56	EV	4640	N19966	EWR	DAY	107	533	12	27	2013-01-01 12:00:00+00
2013	1	1	1304	1259	5	1430	1418	12	B6	32	N346JB	JFK	ROC	65	264	12	59	2013-01-01 12:00:00+00
2013	1	1	1305	1315	-10	1523	1520	3	MQ	4564	N725MQ	LGA	DTW	102	502	13	15	2013-01-01 13:00:00+00
2013	1	1	1306	1240	26	1622	1555	27	AA	2041	N5DMAA	JFK	MIA	163	1089	12	40	2013-01-01 12:00:00+00
2013	1	1	1306	1300	6	1622	1610	12	WN	2596	N773SA	EWR	HOU	239	1411	13	0	2013-01-01 13:00:00+00
2013	1	1	1310	1300	10	1559	1554	5	B6	991	N593JB	JFK	PBI	150	1028	13	0	2013-01-01 13:00:00+00
2013	1	1	1314	1315	-1	1507	1505	2	US	1615	N177US	EWR	CLT	95	529	13	15	2013-01-01 13:00:00+00
2013	1	1	1315	1317	-2	1413	1423	-10	EV	4112	N13538	EWR	ALB	33	143	13	17	2013-01-01 13:00:00+00
2013	1	1	1316	1314	2	1412	1415	-3	EV	4340	N11551	EWR	BWI	38	169	13	14	2013-01-01 13:00:00+00
2013	1	1	1317	1325	-8	1454	1505	-11	MQ	4475	N711MQ	LGA	RDU	80	431	13	25	2013-01-01 13:00:00+00
2013	1	1	1318	1322	-4	1358	1416	-18	EV	4106	N19554	EWR	BDL	25	116	13	22	2013-01-01 13:00:00+00
2013	1	1	1320	1315	5	1602	1605	-3	B6	393	N537JB	LGA	MCO	140	950	13	15	2013-01-01 13:00:00+00
2013	1	1	1320	1320	0	1625	1636	-11	UA	1425	N58101	EWR	LAX	334	2454	13	20	2013-01-01 13:00:00+00
2013	1	1	1323	1300	23	1651	1608	43	DL	1185	N3736C	EWR	SLC	295	1969	13	0	2013-01-01 13:00:00+00
2013	1	1	1325	1330	-5	1606	1605	1	DL	2043	N318US	JFK	ATL	131	760	13	30	2013-01-01 13:00:00+00
2013	1	1	1327	1330	-3	1638	1655	-17	VX	411	N642VA	JFK	LAX	352	2475	13	30	2013-01-01 13:00:00+00
2013	1	1	1327	1329	-2	1624	1629	-5	UA	906	N847UA	EWR	FLL	157	1065	13	29	2013-01-01 13:00:00+00
2013	1	1	1330	1321	9	1613	1536	37	EV	3849	N14558	EWR	IND	149	645	13	21	2013-01-01 13:00:00+00
2013	1	1	1333	1335	-2	1608	1608	0	B6	615	N306JB	JFK	JAX	134	828	13	35	2013-01-01 13:00:00+00
2013	1	1	1336	1340	-4	1508	1500	8	EV	4665	N13988	EWR	PIT	69	319	13	40	2013-01-01 13:00:00+00
2013	1	1	1337	1220	77	1649	1531	78	B6	673	N636JB	JFK	LAX	352	2475	12	20	2013-01-01 12:00:00+00
2013	1	1	1339	1345	-6	1642	1705	-23	AA	1073	N3EMAA	LGA	MIA	161	1096	13	45	2013-01-01 13:00:00+00
2013	1	1	1339	1335	4	1654	1631	23	B6	431	N510JB	LGA	SRQ	170	1047	13	35	2013-01-01 13:00:00+00
2013	1	1	1341	1345	-4	1709	1705	4	AA	117	N339AA	JFK	LAX	362	2475	13	45	2013-01-01 13:00:00+00
2013	1	1	1342	1320	22	1617	1504	73	EV	3832	N13969	EWR	STL	194	872	13	20	2013-01-01 13:00:00+00
2013	1	1	1343	1330	13	1658	1640	18	AA	753	N3CFAA	LGA	DFW	235	1389	13	30	2013-01-01 13:00:00+00
2013	1	1	1344	1344	0	2005	1944	21	UA	15	N76065	EWR	HNL	656	4963	13	44	2013-01-01 13:00:00+00
2013	1	1	1346	1330	16	1736	1710	26	WN	2335	N900WN	EWR	PHX	334	2133	13	30	2013-01-01 13:00:00+00
2013	1	1	1350	1329	21	1504	1453	11	EV	4254	N14542	EWR	BUF	57	282	13	29	2013-01-01 13:00:00+00
2013	1	1	1350	1355	-5	1456	1510	-14	B6	602	N216JB	JFK	PWM	49	273	13	55	2013-01-01 13:00:00+00
2013	1	1	1351	1355	-4	1446	1459	-13	EV	4434	N13566	EWR	MHT	37	209	13	55	2013-01-01 13:00:00+00
2013	1	1	1353	1357	-4	1549	1525	24	EV	4171	N14105	EWR	MSN	152	799	13	57	2013-01-01 13:00:00+00
2013	1	1	1354	1356	-2	1556	1600	-4	EV	4370	N23139	EWR	CHS	102	628	13	56	2013-01-01 13:00:00+00
2013	1	1	1354	1359	-5	1452	1514	-22	DL	2068	N344NB	JFK	BOS	37	187	13	59	2013-01-01 13:00:00+00
2013	1	1	1355	1315	40	1538	1452	46	EV	4552	N13958	EWR	GSO	86	445	13	15	2013-01-01 13:00:00+00
2013	1	1	1355	1356	-1	1646	1650	-4	B6	1783	N709JB	JFK	MCO	144	944	13	56	2013-01-01 13:00:00+00
2013	1	1	1355	1350	5	1537	1515	22	WN	2162	N7704B	LGA	MDW	141	725	13	50	2013-01-01 13:00:00+00
2013	1	1	1356	1350	6	1612	1545	27	MQ	4577	N513MQ	LGA	CLT	98	544	13	50	2013-01-01 13:00:00+00
2013	1	1	1356	1259	57	1538	1438	60	UA	32	N17128	EWR	ORD	135	719	12	59	2013-01-01 12:00:00+00
2013	1	1	1356	1354	2	1537	1526	11	UA	617	N840UA	LGA	ORD	146	733	13	54	2013-01-01 13:00:00+00
2013	1	1	1356	1350	6	1659	1640	19	UA	1258	N26906	EWR	IAH	218	1400	13	50	2013-01-01 13:00:00+00
2013	1	1	1358	1350	8	1742	1715	27	US	688	N654AW	EWR	PHX	318	2133	13	50	2013-01-01 13:00:00+00
2013	1	1	1400	1250	70	1645	1502	103	EV	4869	N748EV	LGA	MEM	178	963	12	50	2013-01-01 12:00:00+00
2013	1	1	1400	1400	0	1634	1636	-2	DL	2247	N6704Z	LGA	ATL	130	762	14	0	2013-01-01 14:00:00+00
2013	1	1	1402	1323	39	1650	1526	84	EV	4516	N13123	EWR	MEM	183	946	13	23	2013-01-01 13:00:00+00
2013	1	1	1408	1411	-3	1646	1640	6	FL	349	N895AT	LGA	ATL	133	762	14	11	2013-01-01 14:00:00+00
2013	1	1	1411	1315	56	1717	1611	66	B6	505	N516JB	EWR	FLL	154	1065	13	15	2013-01-01 13:00:00+00
2013	1	1	1416	1411	5	1603	1549	14	UA	683	N456UA	EWR	ORD	136	719	14	11	2013-01-01 14:00:00+00
2013	1	1	1418	1419	-1	1726	1732	-6	UA	16	N37464	EWR	SEA	348	2402	14	19	2013-01-01 14:00:00+00
2013	1	1	1419	1420	-1	1557	1550	7	MQ	3728	N500MQ	EWR	ORD	136	719	14	20	2013-01-01 14:00:00+00
2013	1	1	1421	1422	-1	1517	1535	-18	B6	1010	N274JB	JFK	BOS	38	187	14	22	2013-01-01 14:00:00+00
2013	1	1	1421	1355	26	1735	1709	26	B6	83	N503JB	JFK	SEA	349	2422	13	55	2013-01-01 13:00:00+00
2013	1	1	1421	1430	-9	1724	1752	-28	DL	1531	N327NW	LGA	RSW	160	1080	14	30	2013-01-01 14:00:00+00
2013	1	1	1422	1410	12	1613	1555	18	MQ	4491	N737MQ	LGA	CLE	93	419	14	10	2013-01-01 14:00:00+00
2013	1	1	1422	1425	-3	1748	1759	-11	UA	257	N502UA	JFK	SFO	362	2586	14	25	2013-01-01 14:00:00+00
2013	1	1	1423	1430	-7	1535	1550	-15	EV	5710	N835AS	LGA	IAD	53	229	14	30	2013-01-01 14:00:00+00
2013	1	1	1424	1349	35	1701	1556	65	EV	4687	N15574	EWR	CVG	129	569	13	49	2013-01-01 13:00:00+00
2013	1	1	1424	1420	4	1659	1644	15	EV	4935	N678CA	EWR	ATL	132	746	14	20	2013-01-01 14:00:00+00
2013	1	1	1428	1329	59	1803	1640	83	B6	355	N635JB	JFK	BUR	371	2465	13	29	2013-01-01 13:00:00+00
2013	1	1	1430	1359	31	1718	1652	26	UA	278	N563UA	EWR	PBI	149	1023	13	59	2013-01-01 13:00:00+00
2013	1	1	1430	1430	0	1735	1744	-9	UA	997	N452UA	LGA	IAH	227	1416	14	30	2013-01-01 14:00:00+00
2013	1	1	1431	1429	2	1727	1722	5	B6	1161	N562JB	LGA	PBI	151	1035	14	29	2013-01-01 14:00:00+00
2013	1	1	1431	1440	-9	1627	1616	11	UA	601	N849UA	EWR	CLE	91	404	14	40	2013-01-01 14:00:00+00
2013	1	1	1433	1435	-2	1636	1644	-8	DL	1819	N327NB	LGA	MSP	163	1020	14	35	2013-01-01 14:00:00+00
2013	1	1	1436	1435	1	1840	1820	20	DL	1322	N722TW	JFK	SFO	375	2586	14	35	2013-01-01 14:00:00+00
2013	1	1	1439	1445	-6	1558	1613	-15	DL	1972	N319NB	JFK	DCA	56	213	14	45	2013-01-01 14:00:00+00
2013	1	1	1440	1440	0	1658	1643	15	DL	1231	N926DL	LGA	DTW	94	502	14	40	2013-01-01 14:00:00+00
2013	1	1	1442	1450	-8	1728	1755	-27	AA	1813	N5FMAA	JFK	MCO	141	944	14	50	2013-01-01 14:00:00+00
2013	1	1	1443	1444	-1	1600	1602	-2	EV	4292	N13908	EWR	IAD	51	212	14	44	2013-01-01 14:00:00+00
2013	1	1	1445	1455	-10	1635	1645	-10	AA	337	N4UCAA	LGA	ORD	147	733	14	55	2013-01-01 14:00:00+00
2013	1	1	1445	1445	0	1729	1710	19	MQ	4669	N532MQ	LGA	ATL	129	762	14	45	2013-01-01 14:00:00+00
2013	1	1	1446	1455	-9	1803	1825	-22	AA	1769	N5EWAA	JFK	MIA	161	1089	14	55	2013-01-01 14:00:00+00
2013	1	1	1448	1445	3	1651	1647	4	US	1445	N560UW	LGA	CLT	96	544	14	45	2013-01-01 14:00:00+00
2013	1	1	1449	1450	-1	1651	1640	11	MQ	4403	N853MQ	JFK	RDU	78	427	14	50	2013-01-01 14:00:00+00
2013	1	1	1451	1500	-9	1634	1636	-2	9E	4105	N8444F	JFK	IAD	57	228	15	0	2013-01-01 15:00:00+00
2013	1	1	1452	1455	-3	1637	1639	-2	9E	3295	N920XJ	JFK	BUF	68	301	14	55	2013-01-01 14:00:00+00
2013	1	1	1452	1457	-5	1753	1811	-18	B6	61	N292JB	JFK	FLL	162	1069	14	57	2013-01-01 14:00:00+00
2013	1	1	1453	1450	3	1707	1645	22	MQ	4172	N610MQ	JFK	CLE	99	425	14	50	2013-01-01 14:00:00+00
2013	1	1	1453	1500	-7	1601	1620	-19	US	2179	N951UW	LGA	DCA	51	214	15	0	2013-01-01 15:00:00+00
2013	1	1	1454	1458	-4	1554	1615	-21	EV	4390	N11544	EWR	PWM	47	284	14	58	2013-01-01 14:00:00+00
2013	1	1	1454	1500	-6	1635	1636	-1	9E	3843	N8409N	JFK	SYR	57	209	15	0	2013-01-01 15:00:00+00
2013	1	1	1454	1500	-6	1815	1837	-22	DL	1467	N702TW	JFK	LAX	340	2475	15	0	2013-01-01 15:00:00+00
2013	1	1	1455	1457	-2	1731	1730	1	B6	119	N279JB	JFK	MSY	192	1182	14	57	2013-01-01 14:00:00+00
2013	1	1	1455	1459	-4	1655	1645	10	B6	1053	N203JB	JFK	PIT	87	340	14	59	2013-01-01 14:00:00+00
2013	1	1	1455	1500	-5	1753	1810	-17	DL	1997	N997DL	LGA	PBI	152	1035	15	0	2013-01-01 15:00:00+00
2013	1	1	1456	1500	-4	1649	1632	17	UA	685	N802UA	LGA	ORD	140	733	15	0	2013-01-01 15:00:00+00
2013	1	1	1456	1455	1	1830	1813	17	UA	1134	N24212	EWR	AUS	252	1504	14	55	2013-01-01 14:00:00+00
2013	1	1	1457	1500	-3	1758	1815	-17	UA	379	N401UA	EWR	RSW	166	1068	15	0	2013-01-01 15:00:00+00
2013	1	1	1457	1500	-3	1652	1656	-4	US	720	N539UW	EWR	CLT	97	529	15	0	2013-01-01 15:00:00+00
2013	1	1	1458	1500	-2	1658	1655	3	MQ	4429	N736MQ	LGA	CMH	94	479	15	0	2013-01-01 15:00:00+00
2013	1	1	1459	1501	-2	1651	1651	0	EV	5675	N15572	EWR	CMH	96	463	15	1	2013-01-01 15:00:00+00
2013	1	1	1459	1454	5	1750	1751	-1	UA	1105	N75435	EWR	TPA	152	997	14	54	2013-01-01 14:00:00+00
2013	1	1	1500	1459	1	1809	1806	3	B6	377	N633JB	LGA	FLL	167	1076	14	59	2013-01-01 14:00:00+00
2013	1	1	1502	1500	2	1802	1806	-4	UA	456	N406UA	EWR	FLL	156	1065	15	0	2013-01-01 15:00:00+00
2013	1	1	1505	1310	115	1638	1431	127	EV	4497	N17984	EWR	RIC	63	277	13	10	2013-01-01 13:00:00+00
2013	1	1	1505	1510	-5	1654	1655	-1	MQ	4447	N734MQ	LGA	RDU	82	431	15	10	2013-01-01 15:00:00+00
2013	1	1	1506	1505	1	1838	1820	18	AA	759	N3DUAA	LGA	DFW	248	1389	15	5	2013-01-01 15:00:00+00
2013	1	1	1506	1512	-6	1723	1741	-18	UA	407	N513UA	LGA	DEN	237	1620	15	12	2013-01-01 15:00:00+00
2013	1	1	1507	1515	-8	1651	1656	-5	9E	3792	N8631E	JFK	ROC	66	264	15	15	2013-01-01 15:00:00+00
2013	1	1	1507	1510	-3	1748	1745	3	MQ	4309	N803MQ	JFK	IND	130	665	15	10	2013-01-01 15:00:00+00
2013	1	1	1508	1450	18	1813	1747	26	UA	1687	N76529	EWR	MCO	146	937	14	50	2013-01-01 14:00:00+00
2013	1	1	1510	1517	-7	1811	1811	0	B6	537	N563JB	EWR	TPA	156	997	15	17	2013-01-01 15:00:00+00
2013	1	1	1511	1500	11	1753	1742	11	DL	2347	N678DL	LGA	ATL	135	762	15	0	2013-01-01 15:00:00+00
2013	1	1	1511	1515	-4	1657	1700	-3	DL	1456	N318NB	LGA	BUF	60	292	15	15	2013-01-01 15:00:00+00
2013	1	1	1512	1518	-6	1805	1823	-18	B6	153	N645JB	JFK	MCO	142	944	15	18	2013-01-01 15:00:00+00
2013	1	1	1513	1505	8	1714	1703	11	EV	4223	N13914	EWR	CLT	102	529	15	5	2013-01-01 15:00:00+00
2013	1	1	1513	1515	-2	1705	1700	5	MQ	4333	N635MQ	JFK	PIT	79	340	15	15	2013-01-01 15:00:00+00
2013	1	1	1515	1437	38	1834	1742	52	B6	347	N178JB	JFK	SRQ	171	1041	14	37	2013-01-01 14:00:00+00
2013	1	1	1518	1516	2	1837	1832	5	UA	1699	N53442	EWR	SFO	348	2565	15	16	2013-01-01 15:00:00+00
2013	1	1	1520	1430	50	1835	1735	60	AA	883	N589AA	EWR	DFW	236	1372	14	30	2013-01-01 14:00:00+00
2013	1	1	1520	1525	-5	1643	1655	-12	MQ	3823	N509MQ	JFK	DCA	57	213	15	25	2013-01-01 15:00:00+00
2013	1	1	1520	1520	0	1817	1816	1	UA	1593	N13750	EWR	MCO	152	937	15	20	2013-01-01 15:00:00+00
2013	1	1	1521	1515	6	1830	1823	7	DL	507	N378NW	LGA	MCO	145	950	15	15	2013-01-01 15:00:00+00
2013	1	1	1522	1530	-8	1731	1725	6	MQ	4146	N902MQ	JFK	CMH	98	483	15	30	2013-01-01 15:00:00+00
2013	1	1	1522	1530	-8	1858	1855	3	UA	530	N512UA	JFK	LAX	356	2475	15	30	2013-01-01 15:00:00+00
2013	1	1	1523	1516	7	1831	1828	3	UA	1600	N18112	EWR	LAX	337	2454	15	16	2013-01-01 15:00:00+00
2013	1	1	1524	1457	27	1828	1801	27	B6	141	N504JB	JFK	PBI	156	1028	14	57	2013-01-01 14:00:00+00
2013	1	1	1525	1340	105	1831	1626	125	B6	525	N231JB	EWR	MCO	152	937	13	40	2013-01-01 13:00:00+00
2013	1	1	1525	1530	-5	1934	1805	\N	MQ	4525	N719MQ	LGA	XNA	\N	1147	15	30	2013-01-01 15:00:00+00
2013	1	1	1526	1530	-4	1714	1650	24	WN	4105	N280WN	EWR	MDW	141	711	15	30	2013-01-01 15:00:00+00
2013	1	1	1527	1530	-3	1841	1855	-14	AA	1039	N3HYAA	JFK	FLL	163	1069	15	30	2013-01-01 15:00:00+00
2013	1	1	1527	1455	32	1655	1628	27	B6	8	N607JB	JFK	BUF	66	301	14	55	2013-01-01 14:00:00+00
2013	1	1	1527	1533	-6	1836	1857	-21	B6	137	N794JB	JFK	RSW	168	1074	15	33	2013-01-01 15:00:00+00
2013	1	1	1527	1515	12	1854	1810	44	UA	1695	N69059	EWR	IAH	210	1400	15	15	2013-01-01 15:00:00+00
2013	1	1	1528	1459	29	2002	1647	\N	EV	3806	N17108	EWR	STL	\N	872	14	59	2013-01-01 14:00:00+00
2013	1	1	1528	1530	-2	1731	1725	6	AA	2223	N573AA	LGA	STL	160	888	15	30	2013-01-01 15:00:00+00
2013	1	1	1529	1457	32	1720	1634	46	UA	459	N497UA	EWR	ORD	138	719	14	57	2013-01-01 14:00:00+00
2013	1	1	1529	1530	-1	1733	1737	-4	US	1665	N738US	LGA	CLT	103	544	15	30	2013-01-01 15:00:00+00
2013	1	1	1530	1530	0	1650	1655	-5	9E	3369	N913XJ	JFK	BWI	40	184	15	30	2013-01-01 15:00:00+00
2013	1	1	1531	1453	38	1637	1603	34	EV	4372	N13975	EWR	DCA	45	199	14	53	2013-01-01 14:00:00+00
2013	1	1	1531	1459	32	1745	1658	47	EV	4572	N15912	EWR	GSP	106	594	14	59	2013-01-01 14:00:00+00
2013	1	1	1531	1520	11	1809	1750	19	UA	365	N514UA	EWR	DEN	247	1605	15	20	2013-01-01 15:00:00+00
2013	1	1	1534	1530	4	1755	1735	20	EV	4093	N17115	EWR	GRR	120	605	15	30	2013-01-01 15:00:00+00
2013	1	1	1536	1520	16	1709	1650	19	WN	2081	N226WN	LGA	MKE	133	738	15	20	2013-01-01 15:00:00+00
2013	1	1	1538	1540	-2	1827	1851	-24	DL	4	N372DA	JFK	MCO	133	944	15	40	2013-01-01 15:00:00+00
2013	1	1	1539	1530	9	1904	1910	-6	AA	85	N342AA	JFK	SFO	360	2586	15	30	2013-01-01 15:00:00+00
2013	1	1	1539	1545	-6	1853	1910	-17	AA	133	N319AA	JFK	LAX	351	2475	15	45	2013-01-01 15:00:00+00
2013	1	1	1539	1537	2	1854	1819	35	UA	1222	N14250	EWR	LAS	342	2227	15	37	2013-01-01 15:00:00+00
2013	1	1	1540	1338	122	2020	1825	115	B6	705	N570JB	JFK	SJU	193	1598	13	38	2013-01-01 13:00:00+00
2013	1	1	1542	1545	-3	1852	1913	-21	DL	1283	N3750D	JFK	SAN	342	2446	15	45	2013-01-01 15:00:00+00
2013	1	1	1543	1550	-7	1933	1925	8	DL	1773	N688DL	JFK	SLC	320	1990	15	50	2013-01-01 15:00:00+00
2013	1	1	1543	1543	0	1731	1733	-2	UA	636	N413UA	LGA	CLE	88	419	15	43	2013-01-01 15:00:00+00
2013	1	1	1546	1540	6	1753	1748	5	9E	3338	N904XJ	JFK	ORD	146	740	15	40	2013-01-01 15:00:00+00
2013	1	1	1547	1545	2	1823	1815	8	DL	1942	N994DL	EWR	ATL	129	746	15	45	2013-01-01 15:00:00+00
2013	1	1	1548	1420	88	1751	1620	91	MQ	4588	N6EAMQ	LGA	MSP	167	1020	14	20	2013-01-01 14:00:00+00
2013	1	1	1549	1445	64	1912	1656	136	EV	4181	N21197	EWR	MCI	234	1092	14	45	2013-01-01 14:00:00+00
2013	1	1	1549	1548	1	1851	1859	-8	UA	80	N54241	EWR	MIA	156	1085	15	48	2013-01-01 15:00:00+00
2013	1	1	1550	1550	0	1844	1831	13	9E	3372	N934XJ	JFK	IND	139	665	15	50	2013-01-01 15:00:00+00
2013	1	1	1552	1600	-8	1732	1720	12	EV	5709	N825AS	LGA	IAD	55	229	16	0	2013-01-01 16:00:00+00
2013	1	1	1552	1600	-8	1826	1820	6	FL	620	N997AT	LGA	ATL	132	762	16	0	2013-01-01 16:00:00+00
2013	1	1	1552	1600	-8	1749	1757	-8	9E	3459	N910XJ	JFK	BNA	150	765	16	0	2013-01-01 16:00:00+00
2013	1	1	1552	1600	-8	1933	1915	18	AA	565	N3CGAA	JFK	DFW	254	1391	16	0	2013-01-01 16:00:00+00
2013	1	1	1554	1600	-6	1701	1734	-33	9E	3331	N931XJ	JFK	BOS	41	187	16	0	2013-01-01 16:00:00+00
2013	1	1	1554	1559	-5	1857	1841	16	DL	847	N918DE	LGA	ATL	131	762	15	59	2013-01-01 15:00:00+00
2013	1	1	1554	1600	-6	1830	1820	10	MQ	3985	N606MQ	JFK	CVG	118	589	16	0	2013-01-01 16:00:00+00
2013	1	1	1556	1600	-4	1737	1739	-2	EV	5163	N761ND	LGA	PIT	69	335	16	0	2013-01-01 16:00:00+00
2013	1	1	1557	1600	-3	1910	1939	-29	DL	1508	N955DL	JFK	RSW	171	1074	16	0	2013-01-01 16:00:00+00
2013	1	1	1557	1600	-3	1746	1742	4	UA	687	N487UA	LGA	ORD	143	733	16	0	2013-01-01 16:00:00+00
2013	1	1	1558	1534	24	1808	1703	65	EV	4502	N16546	EWR	BNA	168	748	15	34	2013-01-01 15:00:00+00
2013	1	1	1558	1359	119	1718	1515	123	EV	5712	N826AS	JFK	IAD	53	228	13	59	2013-01-01 13:00:00+00
2013	1	1	1558	1600	-2	1910	1903	7	B6	509	N708JB	EWR	FLL	166	1065	16	0	2013-01-01 16:00:00+00
2013	1	1	1559	1605	-6	1844	1912	-28	DL	91	N374DA	JFK	LAS	309	2248	16	5	2013-01-01 16:00:00+00
2013	1	1	1600	1610	-10	1712	1729	-17	9E	4088	N8968E	JFK	PHL	35	94	16	10	2013-01-01 16:00:00+00
2013	1	1	1601	1601	0	1750	1735	15	UA	702	N484UA	EWR	ORD	141	719	16	1	2013-01-01 16:00:00+00
2013	1	1	1602	1605	-3	1834	1838	-4	DL	1861	N301NB	LGA	MCI	189	1107	16	5	2013-01-01 16:00:00+00
2013	1	1	1603	1547	16	1720	1708	12	EV	3272	N14168	EWR	BUF	58	282	15	47	2013-01-01 15:00:00+00
2013	1	1	1603	1550	13	1751	1739	12	B6	917	N316JB	JFK	ORD	150	740	15	50	2013-01-01 15:00:00+00
2013	1	1	1603	1600	3	1839	1830	9	WN	591	N965WN	EWR	DEN	254	1605	16	0	2013-01-01 16:00:00+00
2013	1	1	1603	1605	-2	1818	1750	28	MQ	4415	N730MQ	LGA	RDU	79	431	16	5	2013-01-01 16:00:00+00
2013	1	1	1603	1600	3	1912	1906	6	UA	367	N820UA	EWR	FLL	162	1065	16	0	2013-01-01 16:00:00+00
2013	1	1	1604	1510	54	1817	1710	67	MQ	4579	N0EGMQ	LGA	CLT	106	544	15	10	2013-01-01 15:00:00+00
2013	1	1	1605	1610	-5	1804	1800	4	AA	341	N569AA	LGA	ORD	146	733	16	10	2013-01-01 16:00:00+00
2013	1	1	1607	1555	12	1735	1715	20	B6	12	N184JB	JFK	SYR	58	209	15	55	2013-01-01 15:00:00+00
2013	1	1	1607	1443	84	1711	1553	78	UA	465	N435UA	EWR	BOS	35	200	14	43	2013-01-01 14:00:00+00
2013	1	1	1608	1535	33	2002	1850	72	AA	763	N3GKAA	LGA	DFW	249	1389	15	35	2013-01-01 15:00:00+00
2013	1	1	1608	1600	8	1953	1925	28	AA	1467	N3DYAA	LGA	MIA	171	1096	16	0	2013-01-01 16:00:00+00
2013	1	1	1608	1609	-1	1847	1910	-23	B6	157	N712JB	JFK	MCO	137	944	16	9	2013-01-01 16:00:00+00
2013	1	1	1610	1615	-5	1913	1948	-35	DL	1411	N947DL	JFK	FLL	155	1069	16	15	2013-01-01 16:00:00+00
2013	1	1	1610	1615	-5	1827	1830	-3	DL	1619	N360NB	LGA	MSP	168	1020	16	15	2013-01-01 16:00:00+00
2013	1	1	1610	1555	15	1852	1834	18	DL	1939	N362NW	LGA	DEN	235	1620	15	55	2013-01-01 15:00:00+00
2013	1	1	1611	1601	10	2010	1941	29	UA	1635	N76504	EWR	PHX	328	2133	16	1	2013-01-01 16:00:00+00
2013	1	1	1615	1602	13	1748	1728	20	EV	4406	N36915	EWR	PIT	73	319	16	2	2013-01-01 16:00:00+00
2013	1	1	1619	1625	-6	1912	1855	17	MQ	4661	N537MQ	LGA	ATL	136	762	16	25	2013-01-01 16:00:00+00
2013	1	1	1620	1620	0	1945	1922	23	UA	1178	N18119	EWR	IAH	242	1400	16	20	2013-01-01 16:00:00+00
2013	1	1	1621	1548	33	1904	1830	34	DL	95	N704X	JFK	ATL	130	760	15	48	2013-01-01 15:00:00+00
2013	1	1	1623	1620	3	2002	1959	3	US	35	N550UW	JFK	PHX	317	2153	16	20	2013-01-01 16:00:00+00
2013	1	1	1625	1550	35	2054	2050	4	AA	1635	N630AA	JFK	SJU	188	1598	15	50	2013-01-01 15:00:00+00
2013	1	1	1626	1630	-4	2007	1952	15	B6	675	N804JB	JFK	LAX	370	2475	16	30	2013-01-01 16:00:00+00
2013	1	1	1626	1630	-4	1855	1853	2	DL	702	N361NW	JFK	DTW	108	509	16	30	2013-01-01 16:00:00+00
2013	1	1	1627	1459	88	1925	1805	80	B6	63	N599JB	JFK	TPA	159	1005	14	59	2013-01-01 14:00:00+00
2013	1	1	1627	1630	-3	1940	2020	-40	VX	27	N847VA	JFK	SFO	354	2586	16	30	2013-01-01 16:00:00+00
2013	1	1	1628	1524	64	1740	1641	59	EV	4133	N14959	EWR	IAD	53	212	15	24	2013-01-01 15:00:00+00
2013	1	1	1628	1630	-2	1907	1923	-16	DL	920	N331NW	JFK	DEN	248	1626	16	30	2013-01-01 16:00:00+00
2013	1	1	1630	1548	42	1902	1755	67	EV	4352	N22909	EWR	CVG	121	569	15	48	2013-01-01 15:00:00+00
2013	1	1	1630	1636	-6	1913	1943	-30	B6	143	N534JB	JFK	PBI	147	1028	16	36	2013-01-01 16:00:00+00
2013	1	1	1631	1617	14	1740	1727	13	EV	4299	N14972	EWR	DCA	48	199	16	17	2013-01-01 16:00:00+00
2013	1	1	1631	1635	-4	1956	2000	-4	US	656	N649AW	EWR	PHX	309	2133	16	35	2013-01-01 16:00:00+00
2013	1	1	1631	1630	1	1935	1950	-15	UA	1726	N75425	EWR	SAN	346	2425	16	30	2013-01-01 16:00:00+00
2013	1	1	1632	1635	-3	1903	1840	23	WN	190	N258WN	LGA	STL	181	888	16	35	2013-01-01 16:00:00+00
2013	1	1	1632	1635	-3	1824	1810	14	MQ	3695	N507MQ	EWR	ORD	139	719	16	35	2013-01-01 16:00:00+00
2013	1	1	1634	1626	8	1913	1852	21	UA	69	N27213	EWR	DEN	247	1605	16	26	2013-01-01 16:00:00+00
2013	1	1	1635	1630	5	1830	1810	20	UA	162	N16701	EWR	CLE	84	404	16	30	2013-01-01 16:00:00+00
2013	1	1	1636	1639	-3	1747	1755	-8	B6	1176	N190JB	EWR	BOS	42	200	16	39	2013-01-01 16:00:00+00
2013	1	1	1637	1545	52	1858	1819	39	9E	3321	N604LR	JFK	MSP	173	1029	15	45	2013-01-01 15:00:00+00
2013	1	1	1639	1517	82	1815	1639	96	EV	4580	N16561	EWR	MKE	140	725	15	17	2013-01-01 15:00:00+00
2013	1	1	1640	1640	0	1859	1850	9	MQ	4540	N723MQ	LGA	DTW	106	502	16	40	2013-01-01 16:00:00+00
2013	1	1	1641	1650	-9	1746	1820	-34	AA	1790	N3BYAA	JFK	BOS	41	187	16	50	2013-01-01 16:00:00+00
2013	1	1	1642	1610	32	1944	1919	25	UA	1587	N17229	EWR	RSW	161	1068	16	10	2013-01-01 16:00:00+00
2013	1	1	1645	1639	6	1832	1816	16	EV	4336	N13538	EWR	GSO	89	445	16	39	2013-01-01 16:00:00+00
2013	1	1	1649	1639	10	1937	1911	26	EV	4705	N14960	EWR	ATL	139	746	16	39	2013-01-01 16:00:00+00
2013	1	1	1650	1615	35	2009	1913	56	B6	985	N564JB	LGA	TPA	162	1010	16	15	2013-01-01 16:00:00+00
2013	1	1	1651	1650	1	2000	2004	-4	B6	185	N665JB	JFK	SAN	349	2446	16	50	2013-01-01 16:00:00+00
2013	1	1	1652	1640	12	2030	1955	35	AA	773	N565AA	LGA	DFW	252	1389	16	40	2013-01-01 16:00:00+00
2013	1	1	1653	1700	-7	2005	2018	-13	DL	1807	N980DL	LGA	FLL	158	1076	17	0	2013-01-01 17:00:00+00
2013	1	1	1654	1644	10	1752	1753	-1	EV	4539	N27962	EWR	MHT	38	209	16	44	2013-01-01 16:00:00+00
2013	1	1	1654	1700	-6	2020	2034	-14	DL	706	N320NB	JFK	AUS	251	1521	17	0	2013-01-01 17:00:00+00
2013	1	1	1655	1621	34	1804	1724	40	EV	3260	N19554	EWR	ALB	36	143	16	21	2013-01-01 16:00:00+00
2013	1	1	1655	1700	-5	1953	1950	3	AA	575	N5DRAA	JFK	EGE	280	1747	17	0	2013-01-01 17:00:00+00
2013	1	1	1655	1700	-5	2027	2049	-22	DL	31	N713TW	JFK	SFO	357	2586	17	0	2013-01-01 17:00:00+00
2013	1	1	1655	1655	0	2025	2030	-5	VX	413	N626VA	JFK	LAX	362	2475	16	55	2013-01-01 16:00:00+00
2013	1	1	1656	1700	-4	1941	1955	-14	AA	257	N3CAAA	JFK	LAS	322	2248	17	0	2013-01-01 17:00:00+00
2013	1	1	1657	1650	7	1921	1840	41	WN	2773	N462WN	EWR	STL	181	872	16	50	2013-01-01 16:00:00+00
2013	1	1	1657	1630	27	1948	1926	22	UA	1609	N17105	EWR	MCO	148	937	16	30	2013-01-01 16:00:00+00
2013	1	1	1658	1700	-2	1808	1840	-32	MQ	4323	N688MQ	JFK	ORF	52	290	17	0	2013-01-01 17:00:00+00
2013	1	1	1701	1710	-9	2026	2015	11	AA	695	N3FUAA	JFK	AUS	247	1521	17	10	2013-01-01 17:00:00+00
2013	1	1	1701	1700	1	1856	1840	16	UA	689	N418UA	LGA	ORD	144	733	17	0	2013-01-01 17:00:00+00
2013	1	1	1702	1700	2	2044	2028	16	UA	1259	N16632	LGA	IAH	234	1416	17	0	2013-01-01 17:00:00+00
2013	1	1	1705	1705	0	2054	2010	44	AA	1905	N4WRAA	EWR	DFW	251	1372	17	5	2013-01-01 17:00:00+00
2013	1	1	1705	1710	-5	1924	1915	9	US	1447	N188US	LGA	CLT	110	544	17	10	2013-01-01 17:00:00+00
2013	1	1	1707	1705	2	1928	1940	-12	DL	2121	N3730B	EWR	ATL	121	746	17	5	2013-01-01 17:00:00+00
2013	1	1	1707	1700	7	2006	2000	6	UA	342	N543UA	EWR	LAX	334	2454	17	0	2013-01-01 17:00:00+00
2013	1	1	1708	1700	8	2037	2005	32	WN	1066	N778SW	EWR	HOU	245	1411	17	0	2013-01-01 17:00:00+00
2013	1	1	1711	1650	21	1820	1806	14	EV	4194	N15986	EWR	BTV	48	266	16	50	2013-01-01 16:00:00+00
2013	1	1	1711	1635	36	1918	1845	33	B6	1085	N228JB	JFK	CLT	112	541	16	35	2013-01-01 16:00:00+00
2013	1	1	1711	1600	71	2005	1857	68	B6	369	N579JB	LGA	PBI	149	1035	16	0	2013-01-01 16:00:00+00
2013	1	1	1712	1719	-7	1939	1958	-19	UA	509	N569UA	LGA	DEN	241	1620	17	19	2013-01-01 17:00:00+00
2013	1	1	1712	1700	12	2042	2036	6	UA	635	N485UA	EWR	SAT	242	1569	17	0	2013-01-01 17:00:00+00
2013	1	1	1713	1700	13	2006	2014	-8	B6	15	N346JB	JFK	FLL	156	1069	17	0	2013-01-01 17:00:00+00
2013	1	1	1714	1720	-6	1915	1915	0	AA	1351	N3CVAA	JFK	ORD	146	740	17	20	2013-01-01 17:00:00+00
2013	1	1	1716	1730	-14	1947	1953	-6	F9	511	N263AV	LGA	DEN	242	1620	17	30	2013-01-01 17:00:00+00
2013	1	1	1716	1545	91	2140	2039	61	B6	703	N651JB	JFK	SJU	183	1598	15	45	2013-01-01 15:00:00+00
2013	1	1	1716	1709	7	1902	1846	16	UA	1623	N19130	EWR	ORD	143	719	17	9	2013-01-01 17:00:00+00
2013	1	1	1717	1720	-3	1920	1910	10	AA	345	N539AA	LGA	ORD	141	733	17	20	2013-01-01 17:00:00+00
2013	1	1	1718	1710	8	2154	2201	-7	B6	699	N507JB	JFK	SJU	189	1598	17	10	2013-01-01 17:00:00+00
2013	1	1	1719	1720	-1	1908	1905	3	MQ	4479	N713MQ	LGA	RDU	80	431	17	20	2013-01-01 17:00:00+00
2013	1	1	1720	1725	-5	2121	2105	16	DL	513	N723TW	JFK	LAX	363	2475	17	25	2013-01-01 17:00:00+00
2013	1	1	1725	1730	-5	1929	1926	3	US	449	N680AW	EWR	CLT	104	529	17	30	2013-01-01 17:00:00+00
2013	1	1	1725	1720	5	2045	2021	24	UA	1712	N17122	EWR	IAH	235	1400	17	20	2013-01-01 17:00:00+00
2013	1	1	1726	1730	-4	2054	2050	4	AA	543	N386AA	JFK	MIA	157	1089	17	30	2013-01-01 17:00:00+00
2013	1	1	1726	1729	-3	2042	2100	-18	UA	512	N557UA	JFK	SFO	347	2586	17	29	2013-01-01 17:00:00+00
2013	1	1	1727	1725	2	2043	2040	3	AA	145	N377AA	JFK	SAN	357	2446	17	25	2013-01-01 17:00:00+00
2013	1	1	1728	1600	88	2004	1817	107	EV	3843	N13903	EWR	SDF	135	642	16	0	2013-01-01 16:00:00+00
2013	1	1	1729	1718	11	2052	2055	-3	UA	1284	N14120	EWR	SFO	360	2565	17	18	2013-01-01 17:00:00+00
2013	1	1	1730	1730	0	2013	1959	14	FL	623	N967AT	LGA	ATL	128	762	17	30	2013-01-01 17:00:00+00
2013	1	1	1730	1730	0	2126	2110	16	B6	179	N618JB	JFK	PHX	323	2153	17	30	2013-01-01 17:00:00+00
2013	1	1	1730	1729	1	2039	2058	-19	UA	1715	N77296	EWR	SEA	344	2402	17	29	2013-01-01 17:00:00+00
2013	1	1	1732	1630	62	2028	1825	123	EV	4092	N16911	EWR	DAY	119	533	16	30	2013-01-01 16:00:00+00
2013	1	1	1736	1640	56	2047	2001	46	B6	139	N329JB	JFK	RSW	176	1074	16	40	2013-01-01 16:00:00+00
2013	1	1	1738	1745	-7	2030	2042	-12	B6	547	N508JB	EWR	PBI	147	1023	17	45	2013-01-01 17:00:00+00
2013	1	1	1739	1745	-6	1956	1953	3	DL	2331	N965DL	LGA	DTW	93	502	17	45	2013-01-01 17:00:00+00
2013	1	1	1739	1740	-1	2051	2112	-21	DL	1339	N3761R	JFK	PDX	341	2454	17	40	2013-01-01 17:00:00+00
2013	1	1	1740	1630	70	2102	1954	68	DL	2139	N369NW	LGA	MIA	167	1096	16	30	2013-01-01 16:00:00+00
2013	1	1	1740	1745	-5	2158	2020	\N	MQ	4413	N739MQ	LGA	XNA	\N	1147	17	45	2013-01-01 17:00:00+00
2013	1	1	1742	1746	-4	2028	2052	-24	DL	1585	N933DL	LGA	MCO	145	950	17	46	2013-01-01 17:00:00+00
2013	1	1	1743	1615	88	1925	1819	66	9E	3651	N8515F	JFK	RDU	72	427	16	15	2013-01-01 16:00:00+00
2013	1	1	1744	1750	-6	2043	2045	-2	B6	527	N661JB	EWR	MCO	137	937	17	50	2013-01-01 17:00:00+00
2013	1	1	1744	1720	24	2052	2025	27	B6	163	N658JB	JFK	TPA	160	1005	17	20	2013-01-01 17:00:00+00
2013	1	1	1744	1745	-1	2055	2059	-4	DL	1935	N900DE	LGA	TPA	160	1010	17	45	2013-01-01 17:00:00+00
2013	1	1	1744	1745	-1	1925	1915	10	WN	128	N8324A	LGA	MDW	137	725	17	45	2013-01-01 17:00:00+00
2013	1	1	1745	1749	-4	1943	1909	34	B6	1307	N216JB	JFK	IAD	65	228	17	49	2013-01-01 17:00:00+00
2013	1	1	1750	1750	0	2109	2115	-6	UA	535	N525UA	JFK	LAX	345	2475	17	50	2013-01-01 17:00:00+00
2013	1	1	1751	1745	6	2044	2040	4	B6	9	N527JB	JFK	MCO	141	944	17	45	2013-01-01 17:00:00+00
2013	1	1	1751	1745	6	2015	1910	65	WN	3384	N764SW	EWR	MDW	148	711	17	45	2013-01-01 17:00:00+00
2013	1	1	1753	1745	8	2058	2037	21	B6	391	N630JB	LGA	MCO	144	950	17	45	2013-01-01 17:00:00+00
2013	1	1	1756	1725	31	2036	2019	17	UA	376	N523UA	EWR	MCO	140	937	17	25	2013-01-01 17:00:00+00
2013	1	1	1757	1703	54	1904	1813	51	EV	4373	N14998	EWR	DCA	45	199	17	3	2013-01-01 17:00:00+00
2013	1	1	1757	1759	-2	2027	2042	-15	DL	1047	N643DL	LGA	ATL	125	762	17	59	2013-01-01 17:00:00+00
2013	1	1	1758	1800	-2	1905	1917	-12	B6	1016	N304JB	JFK	BOS	36	187	18	0	2013-01-01 18:00:00+00
2013	1	1	1758	1800	-2	2105	2110	-5	B6	989	N663JB	JFK	FLL	152	1069	18	0	2013-01-01 18:00:00+00
2013	1	1	1758	1749	9	2020	1943	37	UA	1676	N37274	EWR	ORD	135	719	17	49	2013-01-01 17:00:00+00
2013	1	1	1759	1759	0	1957	1949	8	EV	4581	N13566	EWR	CMH	95	463	17	59	2013-01-01 17:00:00+00
2013	1	1	1800	1800	0	1945	1951	-6	B6	1111	N294JB	JFK	RDU	78	427	18	0	2013-01-01 18:00:00+00
2013	1	1	1800	1800	0	1951	1954	-3	UA	1053	N16703	EWR	CLE	83	404	18	0	2013-01-01 18:00:00+00
2013	1	1	1802	1805	-3	1930	1944	-14	DL	1006	N359NB	LGA	BUF	61	292	18	5	2013-01-01 18:00:00+00
2013	1	1	1802	1801	1	2125	2137	-12	UA	1165	N75429	EWR	LAX	340	2454	18	1	2013-01-01 18:00:00+00
2013	1	1	1803	1726	37	2011	1934	37	EV	4382	N13958	EWR	DTW	104	488	17	26	2013-01-01 17:00:00+00
2013	1	1	1803	1620	103	2008	1750	138	MQ	4622	N504MQ	LGA	BNA	154	764	16	20	2013-01-01 16:00:00+00
2013	1	1	1803	1800	3	2021	2001	20	US	373	N510UW	JFK	CLT	100	541	18	0	2013-01-01 18:00:00+00
2013	1	1	1805	1757	8	2117	2119	-2	UA	1152	N39463	EWR	PDX	336	2434	17	57	2013-01-01 17:00:00+00
2013	1	1	1806	1810	-4	2002	1945	17	MQ	4484	N711MQ	LGA	BNA	152	764	18	10	2013-01-01 18:00:00+00
2013	1	1	1807	1738	29	2251	2103	\N	UA	1228	N31412	EWR	SAN	\N	2425	17	38	2013-01-01 17:00:00+00
2013	1	1	1808	1815	-7	2111	2130	-19	AS	7	N553AS	EWR	SEA	336	2402	18	15	2013-01-01 18:00:00+00
2013	1	1	1809	1810	-1	2117	2132	-15	B6	217	N592JB	JFK	LGB	337	2465	18	10	2013-01-01 18:00:00+00
2013	1	1	1811	1759	12	2132	2118	14	UA	618	N482UA	EWR	DFW	228	1372	17	59	2013-01-01 17:00:00+00
2013	1	1	1814	1700	74	2051	1855	116	EV	4202	N19966	EWR	STL	177	872	17	0	2013-01-01 17:00:00+00
2013	1	1	1814	1815	-1	2122	2151	-29	B6	173	N569JB	JFK	SJC	334	2569	18	15	2013-01-01 18:00:00+00
2013	1	1	1815	1325	290	2120	1542	338	EV	4417	N17185	EWR	OMA	213	1134	13	25	2013-01-01 13:00:00+00
2013	1	1	1815	1805	10	1928	1920	8	WN	731	N266WN	LGA	BWI	46	185	18	5	2013-01-01 18:00:00+00
2013	1	1	1816	1805	11	2013	1955	18	MQ	4626	N8EGMQ	LGA	CMH	93	479	18	5	2013-01-01 18:00:00+00
2013	1	1	1816	1800	16	2101	2050	11	UA	638	N522UA	EWR	LAS	307	2227	18	0	2013-01-01 18:00:00+00
2013	1	1	1817	1820	-3	2008	2005	3	AA	353	N3AXAA	LGA	ORD	138	733	18	20	2013-01-01 18:00:00+00
2013	1	1	1820	1820	0	2216	2150	26	AA	119	N3FMAA	EWR	LAX	366	2454	18	20	2013-01-01 18:00:00+00
2013	1	1	1823	1830	-7	2036	2055	-19	DL	924	N337NW	JFK	MSP	158	1029	18	30	2013-01-01 18:00:00+00
2013	1	1	1824	1830	-6	2203	2205	-2	AA	269	N3ETAA	JFK	SEA	348	2422	18	30	2013-01-01 18:00:00+00
2013	1	1	1825	1829	-4	2056	2053	3	9E	3286	N906XJ	JFK	DTW	107	509	18	29	2013-01-01 18:00:00+00
2013	1	1	1825	1829	-4	2046	2032	14	US	1973	N460UW	EWR	CLT	106	529	18	29	2013-01-01 18:00:00+00
2013	1	1	1826	1810	16	2132	2130	2	AA	1611	N3DWAA	LGA	MIA	153	1096	18	10	2013-01-01 18:00:00+00
2013	1	1	1826	1830	-4	2154	2207	-13	DL	1643	N3772H	JFK	SEA	334	2422	18	30	2013-01-01 18:00:00+00
2013	1	1	1827	1829	-2	2105	2056	9	UA	1139	N39728	EWR	DEN	246	1605	18	29	2013-01-01 18:00:00+00
2013	1	1	1828	1805	23	2023	1951	32	EV	4334	N11119	LGA	CLE	80	419	18	5	2013-01-01 18:00:00+00
2013	1	1	1830	1829	1	2131	2125	6	UA	1684	N33714	EWR	PBI	152	1023	18	29	2013-01-01 18:00:00+00
2013	1	1	1832	1823	9	1948	1940	8	EV	4326	N13988	EWR	PWM	48	284	18	23	2013-01-01 18:00:00+00
2013	1	1	1832	1835	-3	2059	2103	-4	9E	3830	N8894A	JFK	CHS	106	636	18	35	2013-01-01 18:00:00+00
2013	1	1	1832	1828	4	2144	2144	0	UA	1075	N18220	EWR	SNA	342	2434	18	28	2013-01-01 18:00:00+00
2013	1	1	1834	1840	-6	2027	2020	7	MQ	3730	N517MQ	EWR	ORD	137	719	18	40	2013-01-01 18:00:00+00
2013	1	1	1834	1800	34	2014	1942	32	UA	668	N467UA	LGA	ORD	123	733	18	0	2013-01-01 18:00:00+00
2013	1	1	1836	1726	70	2107	1933	94	EV	4179	N14543	EWR	CVG	123	569	17	26	2013-01-01 17:00:00+00
2013	1	1	1840	1836	4	2022	2010	12	B6	130	N281JB	JFK	BUF	70	301	18	36	2013-01-01 18:00:00+00
2013	1	1	1840	1845	-5	2055	2030	25	MQ	4517	N725MQ	LGA	CRW	96	444	18	45	2013-01-01 18:00:00+00
2013	1	1	1840	1845	-5	2223	2226	-3	UA	389	N508UA	JFK	SFO	357	2586	18	45	2013-01-01 18:00:00+00
2013	1	1	1842	1422	260	1958	1535	263	EV	4633	N18120	EWR	BTV	46	266	14	22	2013-01-01 14:00:00+00
2013	1	1	1842	1829	13	2144	2136	8	UA	1292	N14214	EWR	FLL	149	1065	18	29	2013-01-01 18:00:00+00
2013	1	1	1843	1850	-7	2052	2050	2	AA	2019	N594AA	LGA	STL	169	888	18	50	2013-01-01 18:00:00+00
2013	1	1	1843	1845	-2	1955	2024	-29	DL	904	N344NB	JFK	BOS	34	187	18	45	2013-01-01 18:00:00+00
2013	1	1	1843	1835	8	2339	2346	-7	DL	329	N900PC	JFK	SJU	192	1598	18	35	2013-01-01 18:00:00+00
2013	1	1	1846	1745	61	2147	2055	52	AA	785	N3ESAA	LGA	DFW	223	1389	17	45	2013-01-01 17:00:00+00
2013	1	1	1846	1855	-9	2336	2355	-19	AA	1613	N5BYAA	JFK	SJU	190	1598	18	55	2013-01-01 18:00:00+00
2013	1	1	1848	1745	63	2238	2120	78	AA	177	N332AA	JFK	SFO	361	2586	17	45	2013-01-01 17:00:00+00
2013	1	1	1849	1900	-11	2131	2129	2	FL	645	N920AT	LGA	ATL	134	762	19	0	2013-01-01 19:00:00+00
2013	1	1	1850	1900	-10	2007	2016	-9	EV	5714	N835AS	JFK	IAD	55	228	19	0	2013-01-01 19:00:00+00
2013	1	1	1850	1850	0	2142	2141	1	9E	3364	N908XJ	JFK	MSY	207	1182	18	50	2013-01-01 18:00:00+00
2013	1	1	1850	1850	0	2249	2240	9	VX	29	N638VA	JFK	SFO	364	2586	18	50	2013-01-01 18:00:00+00
2013	1	1	1853	1900	-7	2004	2018	-14	US	2187	N951UW	LGA	DCA	54	214	19	0	2013-01-01 19:00:00+00
2013	1	1	1854	1830	24	2055	2015	40	MQ	4674	N518MQ	LGA	CLE	87	419	18	30	2013-01-01 18:00:00+00
2013	1	1	1855	1859	-4	2140	2145	-5	DL	947	N339NW	LGA	ATL	135	762	18	59	2013-01-01 18:00:00+00
2013	1	1	1855	1848	7	2203	2200	3	UA	1128	N36207	LGA	IAH	231	1416	18	48	2013-01-01 18:00:00+00
2013	1	1	1856	1645	131	2212	2005	127	AA	181	N323AA	JFK	LAX	336	2475	16	45	2013-01-01 16:00:00+00
2013	1	1	1856	1859	-3	2133	2155	-22	B6	155	N505JB	JFK	MCO	133	944	18	59	2013-01-01 18:00:00+00
2013	1	1	1856	1855	1	2142	2142	0	DL	951	N173DZ	JFK	ATL	132	760	18	55	2013-01-01 18:00:00+00
2013	1	1	1858	1900	-2	2034	2035	-1	WN	2944	N905WN	LGA	MKE	131	738	19	0	2013-01-01 19:00:00+00
2013	1	1	1859	1900	-1	2012	2021	-9	EV	4131	N11544	EWR	RIC	55	277	19	0	2013-01-01 19:00:00+00
2013	1	1	1859	1900	-1	2151	2238	-47	DL	1967	N329NW	JFK	MIA	150	1089	19	0	2013-01-01 19:00:00+00
2013	1	1	1900	1845	15	2212	2227	-15	B6	91	N523JB	JFK	OAK	330	2576	18	45	2013-01-01 18:00:00+00
2013	1	1	1904	1905	-1	2139	2227	-48	DL	2159	N3758Y	JFK	MCO	133	944	19	5	2013-01-01 19:00:00+00
2013	1	1	1904	1905	-1	2157	2208	-11	UA	1444	N14242	EWR	TPA	150	997	19	5	2013-01-01 19:00:00+00
2013	1	1	1905	1900	5	2311	2301	10	DL	853	N727TW	JFK	SFO	361	2586	19	0	2013-01-01 19:00:00+00
2013	1	1	1906	1915	-9	2211	2244	-33	DL	2391	N922DL	JFK	TPA	159	1005	19	15	2013-01-01 19:00:00+00
2013	1	1	1909	1912	-3	2239	2237	2	B6	87	N559JB	JFK	SLC	291	1990	19	12	2013-01-01 19:00:00+00
2013	1	1	1909	1910	-1	2212	2224	-12	DL	1629	N6710E	JFK	LAS	323	2248	19	10	2013-01-01 19:00:00+00
2013	1	1	1910	1909	1	2126	2046	40	EV	3807	N13978	EWR	BNA	159	748	19	9	2013-01-01 19:00:00+00
2013	1	1	1910	1910	0	2126	2107	19	9E	3359	N925XJ	JFK	ORD	141	740	19	10	2013-01-01 19:00:00+00
2013	1	1	1910	1855	15	2118	2103	15	US	1491	N540UW	LGA	CLT	107	544	18	55	2013-01-01 18:00:00+00
2013	1	1	1911	1910	1	2050	2055	-5	MQ	4569	N737MQ	LGA	RDU	81	431	19	10	2013-01-01 19:00:00+00
2013	1	1	1912	1915	-3	2200	2219	-19	DL	1485	N917DL	LGA	MCO	142	950	19	15	2013-01-01 19:00:00+00
2013	1	1	1912	1908	4	2242	2257	-15	UA	927	N432UA	EWR	PHX	309	2133	19	8	2013-01-01 19:00:00+00
2013	1	1	1915	1920	-5	2238	2257	-19	DL	6	N633DL	JFK	SLC	281	1990	19	20	2013-01-01 19:00:00+00
2013	1	1	1915	1904	11	2242	2246	-4	UA	1606	N76503	EWR	SFO	351	2565	19	4	2013-01-01 19:00:00+00
2013	1	1	1916	1920	-4	2053	2100	-7	AA	359	N3CUAA	LGA	ORD	136	733	19	20	2013-01-01 19:00:00+00
2013	1	1	1919	1900	19	2125	2107	18	EV	3267	N14558	EWR	CLT	105	529	19	0	2013-01-01 19:00:00+00
2013	1	1	1921	1920	1	2315	2319	-4	DL	541	N375DA	JFK	PHX	314	2153	19	20	2013-01-01 19:00:00+00
2013	1	1	1923	1837	46	2139	2045	54	EV	4125	N23139	EWR	GRR	116	605	18	37	2013-01-01 18:00:00+00
2013	1	1	1923	1859	24	2239	2234	5	B6	171	N552JB	JFK	SMF	333	2521	18	59	2013-01-01 18:00:00+00
2013	1	1	1925	1930	-5	2037	2050	-13	EV	5742	N833AS	LGA	IAD	52	229	19	30	2013-01-01 19:00:00+00
2013	1	1	1925	1900	25	2259	2238	21	DL	87	N624AG	JFK	LAX	332	2475	19	0	2013-01-01 19:00:00+00
2013	1	1	1926	1910	16	2258	2215	43	AA	2075	N4XFAA	EWR	DFW	248	1372	19	10	2013-01-01 19:00:00+00
2013	1	1	1928	1930	-2	2117	2135	-18	9E	4261	N8611A	JFK	RDU	75	427	19	30	2013-01-01 19:00:00+00
2013	1	1	1929	1920	9	3	7	-4	UA	1071	N27205	EWR	BQN	192	1585	19	20	2013-01-01 19:00:00+00
2013	1	1	1930	1745	105	2233	2112	81	DL	503	N3764D	JFK	SAN	333	2446	17	45	2013-01-01 17:00:00+00
2013	1	1	1934	1725	129	2126	1855	151	MQ	4255	N909MQ	JFK	BNA	154	765	17	25	2013-01-01 17:00:00+00
2013	1	1	1935	1930	5	2223	2143	40	EV	4085	N12157	EWR	OMA	209	1134	19	30	2013-01-01 19:00:00+00
2013	1	1	1937	1905	32	2250	2225	25	AA	21	N327AA	JFK	LAX	332	2475	19	5	2013-01-01 19:00:00+00
2013	1	1	1938	1703	155	2109	1823	166	EV	4300	N18557	EWR	RIC	68	277	17	3	2013-01-01 17:00:00+00
2013	1	1	1939	1840	59	29	2151	\N	9E	3325	N905XJ	JFK	DFW	\N	1391	18	40	2013-01-01 18:00:00+00
2013	1	1	1939	1940	-1	2238	2240	-2	AA	1787	N3EGAA	JFK	TPA	158	1005	19	40	2013-01-01 19:00:00+00
2013	1	1	1940	1905	35	2033	2021	12	UA	698	N580UA	EWR	BOS	36	200	19	5	2013-01-01 19:00:00+00
2013	1	1	1941	1940	1	2231	2241	-10	B6	381	N632JB	LGA	FLL	152	1076	19	40	2013-01-01 19:00:00+00
2013	1	1	1942	1705	157	2124	1830	174	MQ	4410	N835MQ	JFK	DCA	60	213	17	5	2013-01-01 17:00:00+00
2013	1	1	1945	1940	5	2247	2231	16	9E	3361	N913XJ	JFK	JAX	129	828	19	40	2013-01-01 19:00:00+00
2013	1	1	1946	1930	16	2148	2134	14	EV	4532	N34110	EWR	CHS	106	628	19	30	2013-01-01 19:00:00+00
2013	1	1	1949	1859	50	2237	2153	44	B6	711	N640JB	JFK	LAS	309	2248	18	59	2013-01-01 18:00:00+00
2013	1	1	1952	1930	22	2358	2207	\N	EV	4333	N11194	EWR	TUL	\N	1215	19	30	2013-01-01 19:00:00+00
2013	1	1	1952	2000	-8	2314	2325	-11	VX	415	N640VA	JFK	LAX	349	2475	20	0	2013-01-01 20:00:00+00
2013	1	1	1952	1930	22	2257	2251	6	UA	1416	N76523	EWR	SEA	342	2402	19	30	2013-01-01 19:00:00+00
2013	1	1	1955	2000	-5	2145	2151	-6	9E	3409	N920XJ	JFK	PIT	76	340	20	0	2013-01-01 20:00:00+00
2013	1	1	1957	2005	-8	2100	2126	-26	9E	4091	N8598B	JFK	BWI	41	184	20	5	2013-01-01 20:00:00+00
2013	1	1	1957	1945	12	2307	2329	-22	B6	645	N652JB	JFK	SFO	337	2586	19	45	2013-01-01 19:00:00+00
2013	1	1	1957	2000	-3	2321	2310	11	UA	299	N817UA	EWR	DFW	233	1372	20	0	2013-01-01 20:00:00+00
2013	1	1	1959	1930	29	2331	2306	25	DL	1181	N319NB	JFK	SAT	251	1587	19	30	2013-01-01 19:00:00+00
2013	1	1	1959	2000	-1	2310	2307	3	UA	1233	N76514	EWR	IAH	232	1400	20	0	2013-01-01 20:00:00+00
2013	1	1	2000	1930	30	2255	2140	75	EV	4361	N12567	EWR	TYS	138	631	19	30	2013-01-01 19:00:00+00
2013	1	1	2000	2000	0	2054	2110	-16	9E	3664	N836AY	JFK	PHL	30	94	20	0	2013-01-01 20:00:00+00
2013	1	1	2002	1955	7	2306	2310	-4	AA	1709	N3GSAA	LGA	MIA	159	1096	19	55	2013-01-01 19:00:00+00
2013	1	1	2003	2000	3	2302	2311	-9	UA	1680	N11206	EWR	MIA	154	1085	20	0	2013-01-01 20:00:00+00
2013	1	1	2006	1630	216	2230	1848	222	EV	4644	N14972	EWR	SAV	121	708	16	30	2013-01-01 16:00:00+00
2013	1	1	2006	2000	6	2132	2130	2	UA	1271	N12218	LGA	ORD	126	733	20	0	2013-01-01 20:00:00+00
2013	1	1	2008	1855	73	2223	2100	83	MQ	4649	N527MQ	LGA	MSP	163	1020	18	55	2013-01-01 18:00:00+00
2013	1	1	2008	2015	-7	2206	2210	-4	MQ	4555	N734MQ	LGA	CMH	91	479	20	15	2013-01-01 20:00:00+00
2013	1	1	2009	1808	121	2145	1942	123	EV	4440	N14143	EWR	PIT	65	319	18	8	2013-01-01 18:00:00+00
2013	1	1	2012	2016	-4	2154	2158	-4	UA	1204	N24715	EWR	CLE	77	404	20	16	2013-01-01 20:00:00+00
2013	1	1	2013	2015	-2	2120	2130	-10	AA	1762	N3BNAA	JFK	BOS	35	187	20	15	2013-01-01 20:00:00+00
2013	1	1	2015	2005	10	2149	2144	5	9E	3320	N931XJ	JFK	BUF	62	301	20	5	2013-01-01 20:00:00+00
2013	1	1	2016	1930	46	\N	2220	\N	EV	4204	N14168	EWR	OKC	\N	1325	19	30	2013-01-01 19:00:00+00
2013	1	1	2016	1940	36	2215	2125	50	MQ	3783	N509MQ	JFK	CMH	99	483	19	40	2013-01-01 19:00:00+00
2013	1	1	2017	1935	42	2223	2136	47	9E	3899	N8444F	JFK	CLE	91	425	19	35	2013-01-01 19:00:00+00
2013	1	1	2017	2015	2	2318	2321	-3	B6	47	N593JB	JFK	FLL	149	1069	20	15	2013-01-01 20:00:00+00
2013	1	1	2018	2020	-2	2314	2324	-10	UA	1299	N13718	EWR	RSW	157	1068	20	20	2013-01-01 20:00:00+00
2013	1	1	2020	2030	-10	2148	2155	-7	FL	354	N895AT	LGA	CAK	73	397	20	30	2013-01-01 20:00:00+00
2013	1	1	2021	2025	-4	2351	2341	10	B6	1069	N203JB	JFK	AUS	255	1521	20	25	2013-01-01 20:00:00+00
2013	1	1	2023	1945	38	2240	2206	34	9E	3352	N602LR	JFK	CVG	118	589	19	45	2013-01-01 19:00:00+00
2013	1	1	2024	1835	109	2328	2157	91	B6	359	N607JB	JFK	BUR	328	2465	18	35	2013-01-01 18:00:00+00
2013	1	1	2025	2030	-5	2334	2348	-14	DL	1318	N3740C	JFK	FLL	157	1069	20	30	2013-01-01 20:00:00+00
2013	1	1	2025	2028	-3	2358	2351	7	UA	1615	N76516	EWR	AUS	248	1504	20	28	2013-01-01 20:00:00+00
2013	1	1	2026	2004	22	2157	2133	24	EV	4224	N11189	EWR	MKE	130	725	20	4	2013-01-01 20:00:00+00
2013	1	1	2026	1930	56	2319	2229	50	B6	39	N558JB	JFK	PBI	150	1028	19	30	2013-01-01 19:00:00+00
2013	1	1	2026	1955	31	2205	2120	45	WN	195	N957WN	EWR	MDW	134	711	19	55	2013-01-01 19:00:00+00
2013	1	1	2030	2030	0	2132	2139	-7	EV	4660	N14203	EWR	MHT	33	209	20	30	2013-01-01 20:00:00+00
2013	1	1	2030	2045	-15	2150	2225	-35	AA	371	N545AA	LGA	ORD	126	733	20	45	2013-01-01 20:00:00+00
2013	1	1	2030	2035	-5	2354	2342	12	B6	629	N192JB	JFK	HOU	245	1428	20	35	2013-01-01 20:00:00+00
2013	1	1	2030	2030	0	2308	2258	10	B6	115	N267JB	JFK	MSY	195	1182	20	30	2013-01-01 20:00:00+00
2013	1	1	2031	2030	1	2344	2335	9	UA	834	N822UA	EWR	IAH	223	1400	20	30	2013-01-01 20:00:00+00
2013	1	1	2033	2034	-1	2134	2151	-17	UA	994	N486UA	EWR	BOS	35	200	20	34	2013-01-01 20:00:00+00
2013	1	1	2035	2030	5	2337	5	-28	UA	1482	N38268	EWR	LAX	333	2454	20	30	2013-01-01 20:00:00+00
2013	1	1	2037	2010	27	2224	2150	34	EV	4356	N15572	EWR	RDU	78	416	20	10	2013-01-01 20:00:00+00
2013	1	1	2040	2040	0	2317	2314	3	B6	619	N184JB	JFK	JAX	131	828	20	40	2013-01-01 20:00:00+00
2013	1	1	2046	2035	11	2144	2213	-29	9E	3357	N916XJ	JFK	DCA	43	213	20	35	2013-01-01 20:00:00+00
2013	1	1	2046	2050	-4	2328	2356	-28	UA	926	N414UA	EWR	MCO	136	937	20	50	2013-01-01 20:00:00+00
2013	1	1	2050	1959	51	2229	2144	45	MQ	4423	N853MQ	JFK	RDU	83	427	19	59	2013-01-01 19:00:00+00
2013	1	1	2052	2029	23	2349	2350	-1	B6	165	N536JB	JFK	PDX	331	2454	20	29	2013-01-01 20:00:00+00
2013	1	1	2052	2045	7	2357	2359	-2	B6	147	N535JB	JFK	RSW	163	1074	20	45	2013-01-01 20:00:00+00
2013	1	1	2053	2055	-2	2254	2250	4	MQ	4573	N730MQ	LGA	DTW	102	502	20	55	2013-01-01 20:00:00+00
2013	1	1	2055	2100	-5	2350	2355	-5	UA	380	N441UA	EWR	PBI	142	1023	21	0	2013-01-01 21:00:00+00
2013	1	1	2056	2004	52	2156	2112	44	EV	4170	N12540	EWR	ALB	31	143	20	4	2013-01-01 20:00:00+00
2013	1	1	2056	1944	72	2210	2109	61	EV	4692	N11536	EWR	IAD	51	212	19	44	2013-01-01 19:00:00+00
2013	1	1	2056	2100	-4	2337	2343	-6	B6	399	N510JB	LGA	MCO	140	950	21	0	2013-01-01 21:00:00+00
2013	1	1	2056	2100	-4	2240	2235	5	MQ	4507	N856MQ	LGA	RDU	77	431	21	0	2013-01-01 21:00:00+00
2013	1	1	2057	2100	-3	2237	2220	17	MQ	3744	N521MQ	EWR	ORD	133	719	21	0	2013-01-01 21:00:00+00
2013	1	1	2058	2100	-2	2342	2317	25	EV	4088	N14953	EWR	SDF	136	642	21	0	2013-01-01 21:00:00+00
2013	1	1	2058	2100	-2	2235	2230	5	WN	946	N509SW	LGA	MDW	134	725	21	0	2013-01-01 21:00:00+00
2013	1	1	2058	2100	-2	8	2359	9	UA	1241	N27724	EWR	TPA	159	997	21	0	2013-01-01 21:00:00+00
2013	1	1	2100	2100	0	2307	2250	17	MQ	4584	N0EGMQ	LGA	CLT	101	544	21	0	2013-01-01 21:00:00+00
2013	1	1	2101	2050	11	2156	2202	-6	B6	1020	N587JB	JFK	BOS	34	187	20	50	2013-01-01 20:00:00+00
2013	1	1	2102	2108	-6	146	158	-12	UA	1180	N78511	EWR	SJU	199	1608	21	8	2013-01-01 21:00:00+00
2013	1	1	2103	2110	-7	2345	17	-32	DL	1668	N3738B	JFK	LAS	309	2248	21	10	2013-01-01 21:00:00+00
2013	1	1	2107	2040	27	2354	2359	-5	B6	677	N779JB	JFK	LAX	323	2475	20	40	2013-01-01 20:00:00+00
2013	1	1	2108	2057	11	25	39	-14	UA	1517	N17245	EWR	SFO	354	2565	20	57	2013-01-01 20:00:00+00
2013	1	1	2109	2115	-6	2351	2357	-6	B6	529	N796JB	EWR	MCO	138	937	21	15	2013-01-01 21:00:00+00
2013	1	1	2110	2020	50	2340	2245	55	MQ	4662	N532MQ	LGA	ATL	127	762	20	20	2013-01-01 20:00:00+00
2013	1	1	2115	2110	5	2240	2223	17	EV	4119	N15986	EWR	RIC	65	277	21	10	2013-01-01 21:00:00+00
2013	1	1	2115	1700	255	2330	1920	250	9E	3347	N924XJ	JFK	CVG	115	589	17	0	2013-01-01 17:00:00+00
2013	1	1	2116	2110	6	2202	2212	-10	EV	4404	N15912	EWR	PVD	28	160	21	10	2013-01-01 21:00:00+00
2013	1	1	2119	1930	109	2358	2136	142	EV	4543	N13123	EWR	DSM	200	1017	19	30	2013-01-01 19:00:00+00
2013	1	1	2120	2130	-10	16	18	-2	B6	383	N603JB	LGA	FLL	160	1076	21	30	2013-01-01 21:00:00+00
2013	1	1	2121	2040	41	6	2323	43	B6	227	N307JB	EWR	MCO	143	937	20	40	2013-01-01 20:00:00+00
2013	1	1	2122	2125	-3	2312	2250	22	MQ	4660	N1EAMQ	LGA	BNA	153	764	21	25	2013-01-01 21:00:00+00
2013	1	1	2128	2135	-7	26	50	-24	AA	185	N338AA	JFK	LAX	338	2475	21	35	2013-01-01 21:00:00+00
2013	1	1	2128	2125	3	2243	2240	3	MQ	4449	N810MQ	JFK	DCA	54	213	21	25	2013-01-01 21:00:00+00
2013	1	1	2129	2120	9	2342	2351	-9	B6	97	N625JB	JFK	DEN	223	1626	21	20	2013-01-01 21:00:00+00
2013	1	1	2134	2045	49	20	2352	28	UA	1106	N27733	EWR	FLL	152	1065	20	45	2013-01-01 20:00:00+00
2013	1	1	2136	2145	-9	25	39	-14	B6	515	N198JB	EWR	FLL	154	1065	21	45	2013-01-01 21:00:00+00
2013	1	1	2140	2135	5	210	224	-14	B6	701	N284JB	JFK	SJU	189	1598	21	35	2013-01-01 21:00:00+00
2013	1	1	2157	2155	2	43	41	2	B6	43	N537JB	JFK	MCO	140	944	21	55	2013-01-01 21:00:00+00
2013	1	1	2158	2200	-2	2254	2307	-13	EV	4103	N14998	EWR	BWI	36	169	22	0	2013-01-01 22:00:00+00
2013	1	1	2205	1720	285	46	2040	246	AA	1999	N5DNAA	EWR	MIA	146	1085	17	20	2013-01-01 17:00:00+00
2013	1	1	2209	2145	24	58	37	21	B6	35	N608JB	JFK	PBI	143	1028	21	45	2013-01-01 21:00:00+00
2013	1	1	2209	2155	14	2400	2337	23	B6	1109	N216JB	JFK	RDU	86	427	21	55	2013-01-01 21:00:00+00
2013	1	1	2211	2145	26	2339	2311	28	B6	104	N228JB	JFK	BUF	64	301	21	45	2013-01-01 21:00:00+00
2013	1	1	2217	2229	-12	249	315	-26	B6	713	N547JB	JFK	SJU	191	1598	22	29	2013-01-01 22:00:00+00
2013	1	1	2217	2130	47	140	27	73	B6	21	N516JB	JFK	TPA	163	1005	21	30	2013-01-01 21:00:00+00
2013	1	1	2221	2000	141	2331	2124	127	EV	4462	N13566	EWR	BUF	56	282	20	0	2013-01-01 20:00:00+00
2013	1	1	2224	2200	24	2324	2316	8	EV	4206	N16561	EWR	PWM	47	284	22	0	2013-01-01 22:00:00+00
2013	1	1	2229	2159	30	149	100	49	B6	11	N531JB	JFK	FLL	153	1069	21	59	2013-01-01 21:00:00+00
2013	1	1	2240	2245	-5	2340	2356	-16	B6	608	N279JB	JFK	PWM	44	273	22	45	2013-01-01 22:00:00+00
2013	1	1	2250	2255	-5	2352	2359	-7	B6	1018	N521JB	JFK	BOS	37	187	22	55	2013-01-01 22:00:00+00
2013	1	1	2302	2200	62	2342	2253	49	EV	4276	N13903	EWR	BDL	24	116	22	0	2013-01-01 22:00:00+00
2013	1	1	2306	2245	21	28	5	23	B6	30	N281JB	JFK	ROC	59	264	22	45	2013-01-01 22:00:00+00
2013	1	1	2307	2245	22	32	2357	35	B6	128	N178JB	JFK	BTV	59	266	22	45	2013-01-01 22:00:00+00
2013	1	1	2310	2255	15	24	15	9	B6	112	N646JB	JFK	BUF	57	301	22	55	2013-01-01 22:00:00+00
2013	1	1	2312	2000	192	21	2110	191	EV	4312	N13958	EWR	DCA	44	199	20	0	2013-01-01 20:00:00+00
2013	1	1	2323	2200	83	22	2313	69	EV	4257	N13538	EWR	BTV	44	266	22	0	2013-01-01 22:00:00+00
2013	1	1	2326	2130	116	131	18	73	B6	199	N594JB	JFK	LAS	290	2248	21	30	2013-01-01 21:00:00+00
2013	1	1	2327	2250	37	32	2359	33	B6	22	N639JB	JFK	SYR	45	209	22	50	2013-01-01 22:00:00+00
2013	1	1	2343	1724	379	314	1938	456	EV	4321	N21197	EWR	MCI	222	1092	17	24	2013-01-01 17:00:00+00
2013	1	1	2353	2359	-6	425	445	-20	B6	739	N591JB	JFK	PSE	195	1617	23	59	2013-01-01 23:00:00+00
2013	1	1	2353	2359	-6	418	442	-24	B6	707	N794JB	JFK	SJU	185	1598	23	59	2013-01-01 23:00:00+00
2013	1	1	2356	2359	-3	425	437	-12	B6	727	N588JB	JFK	BQN	186	1576	23	59	2013-01-01 23:00:00+00
2013	1	1	\N	1630	\N	\N	1815	\N	EV	4308	N18120	EWR	RDU	\N	416	16	30	2013-01-01 16:00:00+00
2013	1	1	\N	1935	\N	\N	2240	\N	AA	791	N3EHAA	LGA	DFW	\N	1389	19	35	2013-01-01 19:00:00+00
2013	1	1	\N	1500	\N	\N	1825	\N	AA	1925	N3EVAA	LGA	MIA	\N	1096	15	0	2013-01-01 15:00:00+00
2013	1	1	\N	600	\N	\N	901	\N	B6	125	N618JB	JFK	FLL	\N	1069	6	0	2013-01-01 06:00:00+00
2013	1	2	42	2359	43	518	442	36	B6	707	N580JB	JFK	SJU	189	1598	23	59	2013-01-02 23:00:00+00
2013	1	2	126	2250	156	233	2359	154	B6	22	N636JB	JFK	SYR	49	209	22	50	2013-01-02 22:00:00+00
2013	1	2	458	500	-2	703	650	13	US	1030	N162UW	EWR	CLT	108	529	5	0	2013-01-02 05:00:00+00
2013	1	2	512	515	-3	809	819	-10	UA	1453	N76515	EWR	IAH	214	1400	5	15	2013-01-02 05:00:00+00
2013	1	2	535	540	-5	831	850	-19	AA	1141	N621AA	JFK	MIA	156	1089	5	40	2013-01-02 05:00:00+00
2013	1	2	536	529	7	840	828	12	UA	407	N493UA	LGA	IAH	231	1416	5	29	2013-01-02 05:00:00+00
2013	1	2	539	545	-6	959	1022	-23	B6	725	N624JB	JFK	BQN	184	1576	5	45	2013-01-02 05:00:00+00
2013	1	2	554	600	-6	845	901	-16	B6	125	N637JB	JFK	FLL	156	1069	6	0	2013-01-02 06:00:00+00
2013	1	2	554	600	-6	841	851	-10	B6	49	N658JB	JFK	PBI	146	1028	6	0	2013-01-02 06:00:00+00
2013	1	2	554	600	-6	909	858	11	B6	371	N805JB	LGA	FLL	159	1076	6	0	2013-01-02 06:00:00+00
2013	1	2	555	600	-5	931	910	21	AA	707	N3BEAA	LGA	DFW	255	1389	6	0	2013-01-02 06:00:00+00
2013	1	2	555	600	-5	856	856	0	B6	71	N806JB	JFK	TPA	158	1005	6	0	2013-01-02 06:00:00+00
2013	1	2	555	600	-5	750	757	-7	DL	731	N366NB	LGA	DTW	87	502	6	0	2013-01-02 06:00:00+00
2013	1	2	556	600	-4	724	723	1	EV	5708	N836AS	LGA	IAD	54	229	6	0	2013-01-02 06:00:00+00
2013	1	2	556	600	-4	837	837	0	DL	461	N618DL	LGA	ATL	128	762	6	0	2013-01-02 06:00:00+00
2013	1	2	557	605	-8	832	823	9	DL	544	N325US	LGA	CVG	117	585	6	5	2013-01-02 06:00:00+00
2013	1	2	558	600	-2	838	815	23	FL	345	N896AT	LGA	ATL	129	762	6	0	2013-01-02 06:00:00+00
2013	1	2	558	600	-2	916	931	-15	UA	303	N505UA	JFK	SFO	341	2586	6	0	2013-01-02 06:00:00+00
2013	1	2	559	601	-2	809	901	-52	UA	402	N484UA	EWR	LAS	289	2227	6	1	2013-01-02 06:00:00+00
2013	1	2	559	600	-1	906	907	-1	UA	1077	N12225	EWR	MIA	157	1085	6	0	2013-01-02 06:00:00+00
2013	1	2	600	600	0	814	749	25	EV	4334	N13914	EWR	CMH	98	463	6	0	2013-01-02 06:00:00+00
2013	1	2	600	605	-5	751	818	-27	EV	5147	N760EV	EWR	MSP	155	1008	6	5	2013-01-02 06:00:00+00
2013	1	2	600	600	0	819	815	4	9E	4171	N8946A	EWR	CVG	120	569	6	0	2013-01-02 06:00:00+00
2013	1	2	600	600	0	846	846	0	B6	79	N529JB	JFK	MCO	140	944	6	0	2013-01-02 06:00:00+00
2013	1	2	600	600	0	737	725	12	WN	3136	N8311Q	LGA	MDW	117	725	6	0	2013-01-02 06:00:00+00
2013	1	2	600	605	-5	748	805	-17	MQ	4401	N713MQ	LGA	DTW	82	502	6	5	2013-01-02 06:00:00+00
2013	1	2	600	600	0	747	735	12	UA	1280	N62631	LGA	ORD	125	733	6	0	2013-01-02 06:00:00+00
2013	1	2	602	600	2	646	659	-13	US	1833	N951UW	LGA	PHL	28	96	6	0	2013-01-02 06:00:00+00
2013	1	2	603	600	3	733	745	-12	AA	301	N3CRAA	LGA	ORD	118	733	6	0	2013-01-02 06:00:00+00
2013	1	2	603	559	4	912	916	-4	UA	1676	N17229	EWR	LAX	341	2454	5	59	2013-01-02 05:00:00+00
2013	1	2	605	600	5	851	935	-44	UA	421	N832UA	EWR	SFO	329	2565	6	0	2013-01-02 06:00:00+00
2013	1	2	606	610	-4	846	845	1	DL	1743	N387DA	JFK	ATL	129	760	6	10	2013-01-02 06:00:00+00
2013	1	2	606	610	-4	825	820	5	DL	1919	N915DE	LGA	MSP	167	1020	6	10	2013-01-02 06:00:00+00
2013	1	2	607	610	-3	859	910	-11	AA	1895	N5ELAA	EWR	MIA	151	1085	6	10	2013-01-02 06:00:00+00
2013	1	2	609	600	9	909	854	15	B6	507	N630JB	EWR	FLL	158	1065	6	0	2013-01-02 06:00:00+00
2013	1	2	610	600	10	826	807	19	EV	5310	N740EV	LGA	MEM	172	963	6	0	2013-01-02 06:00:00+00
2013	1	2	610	615	-5	854	844	10	DL	575	N304DQ	EWR	ATL	124	746	6	15	2013-01-02 06:00:00+00
2013	1	2	611	600	11	756	725	31	WN	1563	N235WN	EWR	MDW	139	711	6	0	2013-01-02 06:00:00+00
2013	1	2	612	600	12	901	850	11	B6	343	N579JB	EWR	PBI	146	1023	6	0	2013-01-02 06:00:00+00
2013	1	2	612	615	-3	1053	1100	-7	B6	709	N629JB	JFK	SJU	191	1598	6	15	2013-01-02 06:00:00+00
2013	1	2	616	600	16	1001	917	44	UA	1141	N19141	JFK	LAX	354	2475	6	0	2013-01-02 06:00:00+00
2013	1	2	617	615	2	837	817	20	US	1567	N745VJ	JFK	CLT	106	541	6	15	2013-01-02 06:00:00+00
2013	1	2	621	610	11	912	915	-3	AA	1837	N3EVAA	LGA	MIA	155	1096	6	10	2013-01-02 06:00:00+00
2013	1	2	622	630	-8	820	830	-10	MQ	4599	N6EAMQ	LGA	MSP	159	1020	6	30	2013-01-02 06:00:00+00
2013	1	2	624	600	24	908	825	43	MQ	4650	N513MQ	LGA	ATL	138	762	6	0	2013-01-02 06:00:00+00
2013	1	2	625	630	-5	833	830	3	MQ	4576	N504MQ	LGA	CLT	106	544	6	30	2013-01-02 06:00:00+00
2013	1	2	625	629	-4	935	934	1	UA	473	N461UA	LGA	IAH	230	1416	6	29	2013-01-02 06:00:00+00
2013	1	2	625	630	-5	954	946	8	UA	516	N802UA	EWR	DFW	249	1372	6	30	2013-01-02 06:00:00+00
2013	1	2	626	630	-4	850	833	17	US	1019	N445US	EWR	CLT	103	529	6	30	2013-01-02 06:00:00+00
2013	1	2	628	630	-2	935	932	3	DL	2137	N912DE	LGA	TPA	159	1010	6	30	2013-01-02 06:00:00+00
2013	1	2	628	615	13	730	715	15	WN	3641	N961WN	EWR	BWI	42	169	6	15	2013-01-02 06:00:00+00
2013	1	2	629	615	14	746	735	11	EV	4144	N15574	EWR	IAD	51	212	6	15	2013-01-02 06:00:00+00
2013	1	2	629	620	9	844	827	17	EV	4460	N11565	EWR	CVG	118	569	6	20	2013-01-02 06:00:00+00
2013	1	2	629	630	-1	1010	1014	-4	US	245	N837AW	EWR	PHX	308	2133	6	30	2013-01-02 06:00:00+00
2013	1	2	630	610	20	948	921	27	B6	135	N665JB	JFK	RSW	177	1074	6	10	2013-01-02 06:00:00+00
2013	1	2	630	635	-5	948	942	6	DL	1879	N969DL	LGA	FLL	166	1076	6	35	2013-01-02 06:00:00+00
2013	1	2	630	630	0	727	740	-13	WN	4648	N7735A	LGA	BWI	42	185	6	30	2013-01-02 06:00:00+00
2013	1	2	632	635	-3	812	812	0	EV	4150	N16987	EWR	RDU	82	416	6	35	2013-01-02 06:00:00+00
2013	1	2	632	630	2	941	940	1	UA	387	N521UA	EWR	LAX	325	2454	6	30	2013-01-02 06:00:00+00
2013	1	2	634	630	4	806	810	-4	AA	303	N3DYAA	LGA	ORD	123	733	6	30	2013-01-02 06:00:00+00
2013	1	2	636	637	-1	1012	955	17	UA	1276	N38727	EWR	AUS	248	1504	6	37	2013-01-02 06:00:00+00
2013	1	2	636	631	5	1005	1014	-9	UA	908	N406UA	EWR	PHX	299	2133	6	31	2013-01-02 06:00:00+00
2013	1	2	637	640	-3	832	809	23	EV	3829	N17108	EWR	BNA	138	748	6	40	2013-01-02 06:00:00+00
2013	1	2	637	630	7	1012	1018	-6	US	27	N545UW	JFK	PHX	312	2153	6	30	2013-01-02 06:00:00+00
2013	1	2	637	631	6	821	815	6	UA	1162	N39297	EWR	CLE	79	404	6	31	2013-01-02 06:00:00+00
2013	1	2	640	640	0	732	749	-17	B6	1002	N807JB	JFK	BOS	34	187	6	40	2013-01-02 06:00:00+00
2013	1	2	640	646	-6	926	941	-15	UA	1627	N37267	EWR	PBI	145	1023	6	46	2013-01-02 06:00:00+00
2013	1	2	641	635	6	926	917	9	EV	3831	N12996	EWR	ATL	138	746	6	35	2013-01-02 06:00:00+00
2013	1	2	641	635	6	1013	940	33	AA	711	N3CFAA	LGA	DFW	249	1389	6	35	2013-01-02 06:00:00+00
2013	1	2	641	647	-6	804	810	-6	B6	102	N766JB	JFK	BUF	60	301	6	47	2013-01-02 06:00:00+00
2013	1	2	641	645	-4	930	935	-5	B6	389	N563JB	LGA	MCO	142	950	6	45	2013-01-02 06:00:00+00
2013	1	2	642	630	12	854	841	13	US	1433	N538UW	LGA	CLT	109	544	6	30	2013-01-02 06:00:00+00
2013	1	2	647	645	2	849	916	-27	UA	320	N587UA	LGA	DEN	218	1620	6	45	2013-01-02 06:00:00+00
2013	1	2	647	646	1	738	809	-31	UA	785	N821UA	EWR	BOS	34	200	6	46	2013-01-02 06:00:00+00
2013	1	2	647	645	2	903	848	15	US	926	N565UW	EWR	CLT	102	529	6	45	2013-01-02 06:00:00+00
2013	1	2	649	655	-6	951	1030	-39	DL	1415	N374DA	JFK	SLC	274	1990	6	55	2013-01-02 06:00:00+00
2013	1	2	649	651	-2	934	946	-12	UA	392	N464UA	EWR	MCO	141	937	6	51	2013-01-02 06:00:00+00
2013	1	2	654	700	-6	946	1045	-59	DL	1865	N711ZX	JFK	SFO	323	2586	7	0	2013-01-02 07:00:00+00
2013	1	2	654	651	3	1003	955	8	UA	1701	N78285	EWR	FLL	168	1065	6	51	2013-01-02 06:00:00+00
2013	1	2	655	659	-4	955	959	-4	AA	1815	N5EUAA	JFK	MCO	144	944	6	59	2013-01-02 06:00:00+00
2013	1	2	655	655	0	929	942	-13	B6	203	N651JB	JFK	LAS	297	2248	6	55	2013-01-02 06:00:00+00
2013	1	2	655	700	-5	1031	1034	-3	DL	763	N705TW	JFK	LAX	317	2475	7	0	2013-01-02 07:00:00+00
2013	1	2	655	700	-5	1005	1009	-4	DL	1383	N378NW	LGA	PBI	162	1035	7	0	2013-01-02 07:00:00+00
2013	1	2	655	700	-5	1015	1020	-5	DL	2003	N926DL	LGA	MIA	161	1096	7	0	2013-01-02 07:00:00+00
2013	1	2	656	700	-4	1013	1007	6	B6	981	N656JB	JFK	FLL	162	1069	7	0	2013-01-02 07:00:00+00
2013	1	2	656	705	-9	1014	940	34	MQ	4534	N719MQ	LGA	XNA	233	1147	7	5	2013-01-02 07:00:00+00
2013	1	2	657	700	-3	806	809	-3	US	2163	N945UW	LGA	DCA	46	214	7	0	2013-01-02 07:00:00+00
2013	1	2	659	700	-1	959	1025	-26	VX	399	N626VA	JFK	LAX	330	2475	7	0	2013-01-02 07:00:00+00
2013	1	2	700	630	30	917	840	37	EV	4471	N17984	EWR	CLT	102	529	6	30	2013-01-02 06:00:00+00
2013	1	2	700	700	0	851	850	1	AA	305	N436AA	LGA	ORD	122	733	7	0	2013-01-02 07:00:00+00
2013	1	2	700	700	0	1017	1015	2	AA	2279	N3JJAA	LGA	MIA	163	1096	7	0	2013-01-02 07:00:00+00
2013	1	2	701	705	-4	1001	943	18	DL	1445	N339NB	LGA	MSY	193	1183	7	5	2013-01-02 07:00:00+00
2013	1	2	702	700	2	1054	1008	46	UA	756	N574UA	EWR	TPA	164	997	7	0	2013-01-02 07:00:00+00
2013	1	2	704	655	9	947	921	26	B6	117	N236JB	JFK	MSY	192	1182	6	55	2013-01-02 06:00:00+00
2013	1	2	704	705	-1	908	913	-5	DL	831	N974DL	LGA	DTW	90	502	7	5	2013-01-02 07:00:00+00
2013	1	2	704	700	4	1142	1154	-12	UA	1152	N37456	EWR	SJU	194	1608	7	0	2013-01-02 07:00:00+00
2013	1	2	705	630	35	1209	1140	29	AA	413	N3GEAA	JFK	SJU	197	1598	6	30	2013-01-02 06:00:00+00
2013	1	2	705	710	-5	827	850	-23	MQ	3737	N512MQ	EWR	ORD	115	719	7	10	2013-01-02 07:00:00+00
2013	1	2	707	715	-8	1022	1045	-23	AA	443	N3HYAA	JFK	MIA	160	1089	7	15	2013-01-02 07:00:00+00
2013	1	2	709	700	9	1006	1014	-8	B6	671	N583JB	JFK	LAX	327	2475	7	0	2013-01-02 07:00:00+00
2013	1	2	712	700	12	945	941	4	DL	1547	N541US	LGA	ATL	125	762	7	0	2013-01-02 07:00:00+00
2013	1	2	712	700	12	844	832	12	UA	1223	N76254	LGA	ORD	127	733	7	0	2013-01-02 07:00:00+00
2013	1	2	714	715	-1	1026	1035	-9	AA	825	N3BAAA	JFK	FLL	161	1069	7	15	2013-01-02 07:00:00+00
2013	1	2	715	721	-6	1013	1012	1	B6	987	N625JB	JFK	MCO	144	944	7	21	2013-01-02 07:00:00+00
2013	1	2	715	715	0	1047	1112	-25	UA	223	N517UA	JFK	SFO	341	2586	7	15	2013-01-02 07:00:00+00
2013	1	2	719	720	-1	1027	1029	-2	UA	1526	N33284	EWR	RSW	168	1068	7	20	2013-01-02 07:00:00+00
2013	1	2	720	600	80	905	735	90	MQ	3768	N520MQ	EWR	ORD	112	719	6	0	2013-01-02 06:00:00+00
2013	1	2	722	725	-3	949	1030	-41	AS	11	N592AS	EWR	SEA	314	2402	7	25	2013-01-02 07:00:00+00
2013	1	2	723	713	10	846	849	-3	UA	393	N529UA	EWR	ORD	114	719	7	13	2013-01-02 07:00:00+00
2013	1	2	724	730	-6	1039	1115	-36	VX	11	N847VA	JFK	SFO	344	2586	7	30	2013-01-02 07:00:00+00
2013	1	2	727	645	42	1024	1028	-4	UA	277	N820UA	EWR	SNA	338	2434	6	45	2013-01-02 06:00:00+00
2013	1	2	728	730	-2	1001	952	9	UA	311	N413UA	EWR	DEN	251	1605	7	30	2013-01-02 07:00:00+00
2013	1	2	729	720	9	846	840	6	FL	850	N982AT	LGA	MKE	113	738	7	20	2013-01-02 07:00:00+00
2013	1	2	729	729	0	1047	1039	8	B6	1601	N645JB	LGA	RSW	168	1080	7	29	2013-01-02 07:00:00+00
2013	1	2	729	730	-1	1011	1056	-45	DL	495	N3768	JFK	SEA	309	2422	7	30	2013-01-02 07:00:00+00
2013	1	2	730	715	15	1206	1206	0	B6	715	N559JB	JFK	SJU	187	1598	7	15	2013-01-02 07:00:00+00
2013	1	2	732	730	2	1105	1100	5	AA	33	N322AA	JFK	LAX	351	2475	7	30	2013-01-02 07:00:00+00
2013	1	2	732	736	-4	914	850	24	B6	44	N506JB	JFK	SYR	50	209	7	36	2013-01-02 07:00:00+00
2013	1	2	732	732	0	1047	1040	7	UA	1509	N73291	LGA	IAH	230	1416	7	32	2013-01-02 07:00:00+00
2013	1	2	733	735	-2	902	858	4	B6	20	N337JB	JFK	ROC	57	264	7	35	2013-01-02 07:00:00+00
2013	1	2	733	737	-4	1043	1113	-30	B6	643	N804JB	JFK	SFO	335	2586	7	37	2013-01-02 07:00:00+00
2013	1	2	734	700	34	1045	1025	20	WN	20	N485WN	EWR	HOU	235	1411	7	0	2013-01-02 07:00:00+00
2013	1	2	734	732	2	844	853	-9	UA	1199	N37408	EWR	BOS	34	200	7	32	2013-01-02 07:00:00+00
2013	1	2	737	745	-8	1042	1036	6	B6	983	N504JB	LGA	TPA	162	1010	7	45	2013-01-02 07:00:00+00
2013	1	2	738	745	-7	926	930	-4	AA	309	N528AA	LGA	ORD	121	733	7	45	2013-01-02 07:00:00+00
2013	1	2	739	745	-6	1116	1125	-9	AA	59	N325AA	JFK	SFO	353	2586	7	45	2013-01-02 07:00:00+00
2013	1	2	739	735	4	1033	1031	2	UA	1296	N19117	EWR	MCO	144	937	7	35	2013-01-02 07:00:00+00
2013	1	2	740	740	0	1025	1015	10	WN	1581	N468WN	LGA	DEN	263	1620	7	40	2013-01-02 07:00:00+00
2013	1	2	741	743	-2	932	920	12	EV	4348	N14542	EWR	GSO	94	445	7	43	2013-01-02 07:00:00+00
2013	1	2	741	740	1	1005	1019	-14	UA	328	N533UA	LGA	DEN	220	1620	7	40	2013-01-02 07:00:00+00
2013	1	2	743	745	-2	858	857	1	9E	3373	N902XJ	JFK	PHL	30	94	7	45	2013-01-02 07:00:00+00
2013	1	2	744	730	14	1017	1007	10	DL	807	N989DL	EWR	ATL	128	746	7	30	2013-01-02 07:00:00+00
2013	1	2	745	730	15	1112	1040	32	AA	715	N455AA	LGA	DFW	244	1389	7	30	2013-01-02 07:00:00+00
2013	1	2	745	746	-1	1118	1129	-11	UA	1668	N37287	EWR	SFO	350	2565	7	46	2013-01-02 07:00:00+00
2013	1	2	747	749	-2	1051	1054	-3	B6	341	N508JB	JFK	SRQ	167	1041	7	49	2013-01-02 07:00:00+00
2013	1	2	750	725	25	1048	1020	28	UA	1724	N79521	EWR	PBI	151	1023	7	25	2013-01-02 07:00:00+00
2013	1	2	751	800	-9	942	945	-3	9E	3643	N8869B	JFK	PIT	68	340	8	0	2013-01-02 08:00:00+00
2013	1	2	752	800	-8	956	959	-3	EV	4166	N11536	EWR	GSP	109	594	8	0	2013-01-02 08:00:00+00
2013	1	2	752	800	-8	912	918	-6	EV	4233	N21130	EWR	BTV	49	266	8	0	2013-01-02 08:00:00+00
2013	1	2	752	745	7	1055	1042	13	UA	251	N430UA	EWR	IAH	215	1400	7	45	2013-01-02 07:00:00+00
2013	1	2	754	635	79	900	745	75	EV	4241	N22909	EWR	DCA	46	199	6	35	2013-01-02 06:00:00+00
2013	1	2	754	755	-1	1055	1059	-4	DL	2263	N361NW	LGA	MCO	143	950	7	55	2013-01-02 07:00:00+00
2013	1	2	755	800	-5	1100	1054	6	B6	517	N703JB	EWR	MCO	146	937	8	0	2013-01-02 08:00:00+00
2013	1	2	755	800	-5	1048	1106	-18	B6	3	N509JB	JFK	FLL	155	1069	8	0	2013-01-02 08:00:00+00
2013	1	2	755	759	-4	1037	1039	-2	DL	2047	N660DL	LGA	ATL	123	762	7	59	2013-01-02 07:00:00+00
2013	1	2	757	800	-3	1058	1127	-29	DL	1843	N918DL	JFK	MIA	155	1089	8	0	2013-01-02 08:00:00+00
2013	1	2	757	759	-2	1018	959	19	US	1733	N537UW	LGA	CLT	106	544	7	59	2013-01-02 07:00:00+00
2013	1	2	758	755	3	1052	1110	-18	AA	2267	N3CNAA	LGA	MIA	160	1096	7	55	2013-01-02 07:00:00+00
2013	1	2	759	805	-6	901	919	-18	B6	1172	N309JB	EWR	BOS	38	200	8	5	2013-01-02 08:00:00+00
2013	1	2	800	810	-10	1102	1116	-14	DL	1959	N995DL	JFK	MCO	143	944	8	10	2013-01-02 08:00:00+00
2013	1	2	801	730	31	1136	1040	56	AA	2083	N487AA	EWR	DFW	241	1372	7	30	2013-01-02 07:00:00+00
2013	1	2	801	810	-9	951	955	-4	MQ	4406	N837MQ	JFK	RDU	86	427	8	10	2013-01-02 08:00:00+00
2013	1	2	804	805	-1	1039	1110	-31	UA	423	N528UA	EWR	PDX	310	2434	8	5	2013-01-02 08:00:00+00
2013	1	2	806	810	-4	1300	1315	-15	AA	655	N5FTAA	JFK	STT	193	1623	8	10	2013-01-02 08:00:00+00
2013	1	2	807	810	-3	1133	1129	4	DL	1271	N322US	JFK	FLL	170	1069	8	10	2013-01-02 08:00:00+00
2013	1	2	808	810	-2	1049	1045	4	DL	269	N971DL	JFK	ATL	124	760	8	10	2013-01-02 08:00:00+00
2013	1	2	808	815	-7	1020	1016	4	US	675	N656AW	EWR	CLT	107	529	8	15	2013-01-02 08:00:00+00
2013	1	2	809	810	-1	950	948	2	B6	1051	N304JB	JFK	PIT	71	340	8	10	2013-01-02 08:00:00+00
\.


--
-- Data for Name: planes; Type: TABLE DATA; Schema: rpostgresql; Owner: travis
--

COPY rpostgresql.planes (tailnum, year, type, manufacturer, model, engines, seats, speed, engine) FROM stdin;
N10156	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N102UW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N103US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N104UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N10575	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N105UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N107US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N108UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N109UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N110UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N11106	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11107	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11109	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11113	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11119	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11121	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11127	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11137	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11140	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11150	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11155	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11164	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11165	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11176	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11181	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11184	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11187	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11189	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11191	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11192	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11193	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11194	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N11199	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N111US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N11206	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N112US	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N113UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N114UW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N11535	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11536	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11539	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11544	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11547	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11548	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11551	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N11565	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N117UW	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N118US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N119US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N1200K	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1201P	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N12109	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12114	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12116	1996	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12122	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12125	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N12126	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12135	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12136	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12142	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12145	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12157	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12160	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12163	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12166	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12167	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12172	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12175	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12195	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N121DE	1987	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N121UW	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N12201	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N12216	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12218	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12221	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12225	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N12238	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N122US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N123UW	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N124US	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N12540	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12552	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12563	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12564	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12567	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12569	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N125UW	2009	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N126UW	2009	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N127UW	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N128UW	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N12900	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12921	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12922	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12924	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12957	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12967	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N12996	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13110	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N13113	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N13118	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13123	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13124	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13132	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13133	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13138	1999	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N13161	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N131EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13202	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N13248	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N132EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N133EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N134EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13538	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13550	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13553	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13566	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N135EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N136DL	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N136EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13716	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N13718	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N13750	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N137DL	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N137EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N138EV	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N13903	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13908	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13913	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13914	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13949	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13955	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13956	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13958	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13964	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13965	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13968	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13969	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13970	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13975	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13978	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13979	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13988	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13989	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13992	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13994	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13995	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N13997	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14102	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14105	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14106	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14107	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14115	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14116	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14117	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14118	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14120	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14121	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N14125	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14143	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14148	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14153	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14158	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14162	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14168	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14171	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14173	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14174	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14177	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14179	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14180	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14186	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14188	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14198	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14203	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14204	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N14214	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14219	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14228	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14230	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14231	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14237	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14242	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N14250	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N143DA	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N14542	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14543	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14558	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14562	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14568	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14570	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14573	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14629	1965	Fixed wing multi engine	BOEING	737-524	2	149	\N	Turbo-fan
N146PQ	2007	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N14704	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N14731	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N147PQ	2007	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N14902	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14904	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14905	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14907	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14916	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14920	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14923	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14950	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14952	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14953	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14959	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14960	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14972	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14974	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14977	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14991	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14993	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N14998	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N1501P	1990	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N150UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N151UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N152DL	1990	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N152UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N153DL	1990	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N153PQ	2007	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N153UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N154DL	1991	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N154UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N15555	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15572	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15574	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N155DL	1991	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N155UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N156DL	1991	Fixed wing multi engine	BOEING	767-3P6	2	290	\N	Turbo-fan
N156UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N15710	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N15712	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N157UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N15910	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15912	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15973	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15980	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15983	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15985	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N15986	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N1602	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1603	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1604R	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1605	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N16065	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1607B	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1608	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1609	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1610D	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N16112	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N1611B	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1612T	2001	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N1613B	2001	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N16147	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16149	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16151	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16170	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16178	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N16183	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N161PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N161UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N16217	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N16234	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N162PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N162UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N163US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N16541	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16546	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16559	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16561	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16571	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N165US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N166PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N16701	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16703	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16709	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16713	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N16732	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N167US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N168AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N16911	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16918	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16919	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16951	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16954	1998	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16961	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16963	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16976	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16981	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16987	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N16999	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N169AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N169DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N169UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N170PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N170US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17104	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17105	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17108	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17115	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17122	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17126	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17128	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17133	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17138	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17139	2000	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N17146	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17159	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17169	2004	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17185	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N17196	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N171DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N171DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N171US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17229	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N17233	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N17244	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N17245	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N172DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N172DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N172US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N173AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N173DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N173US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N174AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N174DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N174DZ	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N174US	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17560	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N175AT	2004	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N175DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N175DZ	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N176AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N176DN	1990	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N176DZ	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N176PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N176UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17719	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N17730	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N177DN	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N177DZ	1999	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N177US	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N178DN	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N178DZ	2000	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N178JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N178US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N17984	2000	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N179DN	1991	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N179JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N179UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N180DN	1992	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N180US	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N18101	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N18102	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N18112	1995	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N18114	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N18119	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N18120	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N181DN	1992	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N181PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N181UW	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N18220	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N18223	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N18243	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N182DN	1992	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N182UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N183DN	1993	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N183JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N183UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N184AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N184DN	1993	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N184JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N184US	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N18556	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N18557	\N	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N185DN	1995	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N185UW	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N186DN	1995	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N186PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N186US	2002	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N187DN	1996	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N187JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N187PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N187US	2002	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N188DN	1996	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N188US	2002	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N189DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N189UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N190DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N190JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N190UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N19117	1996	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N19130	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N19136	1999	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N19141	2000	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N191DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N191UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N192DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N192JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N192UW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A321-211	2	199	\N	Turbo-jet
N193DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N193JB	2005	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N193UW	2008	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N194DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N194UW	\N	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N19554	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N195DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N195PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N195UW	2008	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N196DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N196UW	2009	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N197DN	1997	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N197JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N197PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N197UW	2009	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N198DN	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N198JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N198UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N19966	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N199DN	1998	Fixed wing multi engine	BOEING	767-332	2	330	\N	Turbo-fan
N199UW	2013	Fixed wing multi engine	AIRBUS	A321-211	2	199	\N	Turbo-fan
N200PQ	2008	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N200WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N201AA	1959	Fixed wing single engine	CESSNA	150	1	2	90	Reciprocating
N201FR	2008	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N201LV	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N202AA	1980	Fixed wing multi engine	CESSNA	421C	2	8	90	Reciprocating
N202FR	2008	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N202WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N203FR	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N203JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N203WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N204FR	2004	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N204WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N205FR	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N205WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N206FR	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N206JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N206UA	1999	Fixed wing multi engine	BOEING	777-222	2	400	\N	Turbo-fan
N206WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N207FR	2010	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N207WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N208FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N208WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N20904	2012	Fixed wing multi engine	BOEING	787-8	2	260	\N	Turbo-fan
N209FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N209WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N210FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N210WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N21108	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N21129	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21130	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21144	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21154	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N21197	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N211FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N211WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N212WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N213FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N213WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N214FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N214WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N21537	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N215WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N216FR	2011	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N216JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N216WR	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N21723	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N217JC	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N218FR	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-214	2	182	\N	Turbo-fan
N218WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N219WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N220WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N221FR	2007	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N221WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N222WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N223WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N224WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N225WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N226WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N227WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N228JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N228PQ	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N228UA	2002	Fixed wing multi engine	BOEING	777-222	2	400	\N	Turbo-fan
N228WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N22909	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N22971	1999	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N229JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N229WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N230WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N23139	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N231JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N231WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N232PQ	2009	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N232WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N233LV	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N234WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N235WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N236JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N236WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N23707	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N23708	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N23721	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N237WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N238JB	\N	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N238WN	2005	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N239JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N239WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N240AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N240WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N24103	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N24128	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N241WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N24202	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N24211	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N24212	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N24224	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N242WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N243WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N244WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N245AY	1987	Fixed wing multi engine	BOEING	767-201	2	255	\N	Turbo-jet
N245WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N246LV	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N24702	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N24706	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N24715	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N24729	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N247JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N247WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N248WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N249JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N249WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N250WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N25134	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N251WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N252WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N253WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N254WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N255WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N256WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N25705	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N257WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N258JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N258WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N259WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N260WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26123	1997	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N26141	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N261AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N261WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26208	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N26210	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N26215	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N26226	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N262WN	2006	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N263WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N264LV	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26545	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N26549	2002	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N265JB	2006	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N265WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N266JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N266WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N267JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N267WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N268WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N26906	2012	Fixed wing multi engine	BOEING	787-8	2	260	\N	Turbo-fan
N269WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N270WN	1998	Fixed wing multi engine	BOEING	737-705	2	149	\N	Turbo-fan
N27152	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N27190	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N271LV	\N	Fixed wing multi engine	BOEING	737-705	2	149	\N	Turbo-fan
N27200	2006	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N27205	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N27213	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N27239	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N272AT	\N	Fixed wing multi engine	BOEING	777-200	2	400	\N	Turbo-jet
N272PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N272WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N273AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N273JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N273WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N27421	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N27477	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N274JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N274WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N275WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N276AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N276WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N27722	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N27724	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N27733	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N277WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N278AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N278WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N27901	2012	Fixed wing multi engine	BOEING	787-8	2	260	\N	Turbo-fan
N27962	1999	Fixed wing multi engine	EMBRAER	EMB-145	2	55	\N	Turbo-jet
N279AT	2005	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N279JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N279PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N279WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N280WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N281AT	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A340-313	4	375	\N	Turbo-jet
N281JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N281WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N282WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N283JB	2007	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N283WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N28457	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N28478	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N284AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N284JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N284WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N285AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N285WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N286WN	2004	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N287AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N287WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N288WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N289AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N289CT	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N290WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N29124	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N29129	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N291AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N291WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N292JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N292PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N292WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N293PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N293WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N294JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N294PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N294WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N295AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N295PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N295WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N296JB	2008	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N296PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N296WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N29717	1999	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N297PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N297WN	2007	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N298JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N298PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N298WN	\N	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N29906	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N29917	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N299AT	2006	Fixed wing multi engine	BOEING	737-76N	2	149	\N	Turbo-fan
N299PQ	2013	Fixed wing multi engine	BOMBARDIER INC	CL-600-2D24	2	95	\N	Turbo-fan
N299WN	\N	Fixed wing multi engine	BOEING	737-7H4	2	140	\N	Turbo-fan
N301DQ	\N	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N301NB	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N302AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N302DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N302NB	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N303AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N303DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N30401	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N304DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N304JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N305AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N305DQ	2008	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N306AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N306DQ	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N306JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N307AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N307DQ	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N307JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N308DE	\N	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N309AS	2001	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N309AT	2006	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N309DE	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N309JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N309US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N310DE	2009	Fixed wing multi engine	BOEING	737-732	2	149	\N	Turbo-fan
N310NW	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N31131	2003	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N311US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N312US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N313US	1990	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N31412	2002	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N314NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N314US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N315AS	2002	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N315AT	\N	Fixed wing single engine	JOHN G HESS	AT-5	1	2	\N	4 Cycle
N315NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N315US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N316JB	2009	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N316NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N316US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N317JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N317NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N317US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N317WN	1988	Fixed wing multi engine	BOEING	737-3Q8	2	149	\N	Turbo-fan
N318AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N318JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N318NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N318US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N319AA	1985	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N319AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N319NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N319US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N320AA	1985	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N320AS	2003	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N320NB	2000	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N320US	1991	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N321NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N321US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N322NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N322US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N323AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N323AS	2004	Fixed wing multi engine	BOEING	737-990	2	149	\N	Turbo-jet
N323JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N323NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N323US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N32404	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N324AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N324JB	2010	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N324NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N324US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N325AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N325NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N325US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N326AT	2007	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N326NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N326US	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N327AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N327NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N327NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N328AA	1986	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N328JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N328NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N328NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N329AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N329JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N329NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N329NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N330AT	2007	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N330NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N330NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N33103	1994	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N33132	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N33182	2005	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N331NB	\N	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N331NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N33203	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33209	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33262	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33264	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33266	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33284	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33286	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33289	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33292	\N	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N33294	2005	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N332AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N332NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N332NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N333NB	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N333NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-211	2	182	\N	Turbo-jet
N334JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N334NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N334NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N335AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N335NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N335NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N336AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N336AT	2008	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N336NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N336NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N33714	1998	Fixed wing multi engine	BOEING	737-724	2	149	\N	Turbo-jet
N337JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N337NB	2002	Fixed wing multi engine	AIRBUS INDUSTRIE	A319-114	2	145	\N	Turbo-fan
N337NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N338AA	1987	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N338AT	2008	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N338NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N338NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N339AA	1988	Fixed wing multi engine	BOEING	767-223	2	255	\N	Turbo-fan
N339JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N339NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N339NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N340LV	1987	Fixed wing multi engine	BOEING	737-3K2	2	149	\N	Turbo-jet
N340NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N340NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N34110	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N34111	2002	Fixed wing multi engine	EMBRAER	EMB-145XR	2	55	\N	Turbo-fan
N34131	1998	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N34137	1999	Fixed wing multi engine	BOEING	757-224	2	178	\N	Turbo-jet
N341NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N341NW	1992	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N34222	1998	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N34282	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N342NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N342NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N343NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N343NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N34455	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N34460	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N344AA	1992	Fixed wing multi engine	GULFSTREAM AEROSPACE	G-IV	2	22	\N	Turbo-fan
N344NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N344NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N344SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N345NB	\N	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N345NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N345SA	1987	Fixed wing multi engine	BOEING	737-3K2	2	149	\N	Turbo-jet
N346JB	2011	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N346NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N346SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N347AA	1985	Rotorcraft	SIKORSKY	S-76A	2	14	\N	Turbo-shaft
N347NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N347NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N347SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N348JB	2012	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N348NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N348NW	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N349NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N349NW	1996	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N349SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N350AA	1980	Fixed wing multi engine	PIPER	PA-31-350	2	8	162	Reciprocating
N350NA	1993	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N350SW	1989	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N351AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N351JB	2012	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N351NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N351NW	1997	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N35204	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N35260	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N35271	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N352AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N352NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N352NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N352SW	1990	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N353AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N353AT	2009	Fixed wing multi engine	BOEING	737-7BD	2	149	\N	Turbo-fan
N353JB	2012	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N353NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N353NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N353SW	1990	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N35407	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N354AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N354JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N354NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N354NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N354SW	1991	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N355AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N355JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N355NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N355NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N355SW	1991	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N356NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N356SW	1991	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N357AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N357NB	2002	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N357NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N357SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N358AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N358JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N358NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N358NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N358SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N359AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N359NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N359NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N359SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N360AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N360NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N360NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N360SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N361AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N361NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N361NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N361SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N361VA	2013	Fixed wing multi engine	AIRBUS	A320-214	2	182	\N	Turbo-fan
N36207	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N36247	1999	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N36272	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N36280	2003	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N362AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N362NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N362NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N362SW	1992	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N363AA	1988	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N363NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N363NW	1998	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N363SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N36444	2010	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36447	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36469	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36472	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N36476	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N364AA	1973	Fixed wing multi engine	CESSNA	310Q	2	6	167	Reciprocating
N364NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N364NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N364SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N365AA	2001	Rotorcraft	AGUSTA SPA	A109E	2	8	\N	Turbo-shaft
N365NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N365NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N365SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N366AA	1991	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N366NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N366NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N366SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N367NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N367SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N368AA	1991	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N368JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N368NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N368NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N368SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N36915	2001	Fixed wing multi engine	EMBRAER	EMB-145LR	2	55	\N	Turbo-fan
N369AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N369NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N369NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N369SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N370AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N370NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N370NW	1999	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N370SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N371AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N371CA	2003	Fixed wing multi engine	BOMBARDIER INC	CL-600-2C10	2	80	\N	Turbo-fan
N371DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N371NB	2003	Fixed wing multi engine	AIRBUS	A319-114	2	145	\N	Turbo-fan
N371NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N371SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N37252	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37253	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37255	2000	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37263	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37267	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37273	2001	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37274	2002	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37277	2002	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37281	2003	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37287	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37290	2004	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37293	2005	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N37298	2005	Fixed wing multi engine	BOEING	737-824	2	149	\N	Turbo-fan
N372AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N372DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N372NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N372SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N3730B	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3731T	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3732J	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3733Z	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3734B	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3735D	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3736C	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3737C	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3738B	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3739P	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N373AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N373DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N373JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N373NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N373SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N37408	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N37409	2001	Fixed wing multi engine	BOEING	737-924	2	191	\N	Turbo-fan
N3740C	2000	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37413	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37419	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3741S	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37420	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37422	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37427	2008	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3742C	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37434	2009	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37437	2009	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3743H	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3744F	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37456	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3745B	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37462	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37464	2012	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37465	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37466	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37468	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3746H	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N37470	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37471	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N37474	2013	Fixed wing multi engine	BOEING	737-924ER	2	191	\N	Turbo-fan
N3747D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3748Y	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3749D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N374AA	1992	Fixed wing multi engine	BOEING	767-323	2	330	\N	Turbo-fan
N374DA	1998	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N374JB	2013	Fixed wing multi engine	EMBRAER	ERJ 190-100 IGW	2	20	\N	Turbo-fan
N374NW	2001	Fixed wing multi engine	AIRBUS INDUSTRIE	A320-212	2	182	\N	Turbo-fan
N374SW	1993	Fixed wing multi engine	BOEING	737-3H4	2	149	\N	Turbo-fan
N3750D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3751B	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3752	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3753	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3754A	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3755D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3756	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
N3757D	2001	Fixed wing multi engine	BOEING	737-832	2	189	\N	Turbo-jet
\.


--
-- Data for Name: weather; Type: TABLE DATA; Schema: rpostgresql; Owner: travis
--

COPY rpostgresql.weather (origin, year, month, day, hour, temp, dewp, humid, wind_dir, wind_speed, wind_gust, precip, pressure, visib, time_hour) FROM stdin;
EWR	2013	1	1	1	39.02	26.06	59.37	270	10.35702	\N	0	1012	10	2013-01-01 01:00:00+00
EWR	2013	1	1	2	39.02	26.96	61.63	250	8.05546	\N	0	1012.3	10	2013-01-01 02:00:00+00
EWR	2013	1	1	3	39.02	28.04	64.43	240	11.5078	\N	0	1012.5	10	2013-01-01 03:00:00+00
EWR	2013	1	1	4	39.92	28.04	62.21	250	12.65858	\N	0	1012.2	10	2013-01-01 04:00:00+00
EWR	2013	1	1	5	39.02	28.04	64.43	260	12.65858	\N	0	1011.9	10	2013-01-01 05:00:00+00
EWR	2013	1	1	6	37.94	28.04	67.21	240	11.5078	\N	0	1012.4	10	2013-01-01 06:00:00+00
EWR	2013	1	1	7	39.02	28.04	64.43	240	14.96014	\N	0	1012.2	10	2013-01-01 07:00:00+00
EWR	2013	1	1	8	39.92	28.04	62.21	250	10.35702	\N	0	1012.2	10	2013-01-01 08:00:00+00
EWR	2013	1	1	9	39.92	28.04	62.21	260	14.96014	\N	0	1012.7	10	2013-01-01 09:00:00+00
EWR	2013	1	1	10	41	28.04	59.65	260	13.80936	\N	0	1012.4	10	2013-01-01 10:00:00+00
EWR	2013	1	1	11	41	26.96	57.06	260	14.96014	\N	0	1011.4	10	2013-01-01 11:00:00+00
EWR	2013	1	1	13	39.2	28.4	69.67	330	16.11092	\N	0	\N	10	2013-01-01 13:00:00+00
EWR	2013	1	1	14	39.02	24.08	54.68	280	13.80936	\N	0	1010.8	10	2013-01-01 14:00:00+00
EWR	2013	1	1	15	37.94	24.08	57.04	290	9.20624	\N	0	1011.9	10	2013-01-01 15:00:00+00
EWR	2013	1	1	16	37.04	19.94	49.62	300	13.80936	20.71404	0	1012.1	10	2013-01-01 16:00:00+00
EWR	2013	1	1	17	35.96	19.04	49.83	330	11.5078	\N	0	1013.2	10	2013-01-01 17:00:00+00
EWR	2013	1	1	18	33.98	15.08	45.43	310	12.65858	25.31716	0	1014.1	10	2013-01-01 18:00:00+00
EWR	2013	1	1	19	33.08	12.92	42.84	320	10.35702	\N	0	1014.4	10	2013-01-01 19:00:00+00
EWR	2013	1	1	20	32	15.08	49.19	310	14.96014	\N	0	1015.2	10	2013-01-01 20:00:00+00
EWR	2013	1	1	21	30.02	12.92	48.48	320	18.41248	26.46794	0	1016	10	2013-01-01 21:00:00+00
EWR	2013	1	1	22	28.94	12.02	48.69	320	18.41248	25.31716	0	1016.5	10	2013-01-01 22:00:00+00
EWR	2013	1	1	23	28.04	10.94	48.15	310	16.11092	\N	0	1016.4	10	2013-01-01 23:00:00+00
EWR	2013	1	2	0	26.96	10.94	50.34	310	14.96014	25.31716	0	1016.3	10	2013-01-02 00:00:00+00
EWR	2013	1	2	1	26.06	10.94	52.25	330	12.65858	24.16638	0	1016.3	10	2013-01-02 01:00:00+00
EWR	2013	1	2	2	24.98	10.94	54.65	330	13.80936	\N	0	1017	10	2013-01-02 02:00:00+00
EWR	2013	1	2	3	24.08	8.96	51.93	320	14.96014	\N	0	1016.6	10	2013-01-02 03:00:00+00
EWR	2013	1	2	4	24.08	8.96	51.93	330	12.65858	\N	0	1016.9	10	2013-01-02 04:00:00+00
EWR	2013	1	2	5	24.08	8.96	51.93	330	6.90468	\N	0	1016.9	10	2013-01-02 05:00:00+00
EWR	2013	1	2	6	24.08	8.96	51.93	310	3.45234	\N	0	1017.2	10	2013-01-02 06:00:00+00
EWR	2013	1	2	7	24.98	10.04	52.5	300	6.90468	\N	0	1017.6	10	2013-01-02 07:00:00+00
EWR	2013	1	2	8	24.98	10.04	52.5	280	9.20624	\N	0	1018.5	10	2013-01-02 08:00:00+00
EWR	2013	1	2	9	26.96	10.04	48.36	290	11.5078	\N	0	1019	10	2013-01-02 09:00:00+00
EWR	2013	1	2	10	28.94	10.94	46.41	280	9.20624	\N	0	1018.5	10	2013-01-02 10:00:00+00
EWR	2013	1	2	11	30.92	12.02	44.92	300	14.96014	25.31716	0	1017.5	10	2013-01-02 11:00:00+00
EWR	2013	1	2	12	32	12.92	44.74	290	12.65858	23.0156	0	1017.1	10	2013-01-02 12:00:00+00
EWR	2013	1	2	13	33.98	12.92	41.33	290	16.11092	25.31716	0	1017.3	10	2013-01-02 13:00:00+00
EWR	2013	1	2	14	33.98	10.94	37.86	310	17.2617	26.46794	0	1017.8	10	2013-01-02 14:00:00+00
EWR	2013	1	2	15	33.98	12.02	39.72	310	13.80936	20.71404	0	1018.5	10	2013-01-02 15:00:00+00
EWR	2013	1	2	16	32	12.92	44.74	310	6.90468	\N	0	1018.6	10	2013-01-02 16:00:00+00
EWR	2013	1	2	17	32	12.92	44.74	290	12.65858	18.41248	0	1019.7	10	2013-01-02 17:00:00+00
EWR	2013	1	2	18	30.92	12.92	46.74	300	11.5078	\N	0	1020.3	10	2013-01-02 18:00:00+00
EWR	2013	1	2	19	30.92	14	49.01	290	6.90468	\N	0	1020.4	10	2013-01-02 19:00:00+00
EWR	2013	1	2	20	30.02	14	50.84	280	9.20624	16.11092	0	1020.6	10	2013-01-02 20:00:00+00
EWR	2013	1	2	21	30.02	14	50.84	270	5.7539	\N	0	1021.2	10	2013-01-02 21:00:00+00
EWR	2013	1	2	22	28.94	15.08	55.69	270	8.05546	\N	0	1021.7	10	2013-01-02 22:00:00+00
EWR	2013	1	2	23	28.94	15.08	55.69	280	9.20624	\N	0	1022.2	10	2013-01-02 23:00:00+00
EWR	2013	1	3	0	28.04	15.08	57.79	290	8.05546	\N	0	1021.8	10	2013-01-03 00:00:00+00
EWR	2013	1	3	1	28.04	15.08	57.79	280	10.35702	\N	0	1022.1	10	2013-01-03 01:00:00+00
EWR	2013	1	3	2	26.96	15.08	60.41	270	8.05546	\N	0	1022.3	10	2013-01-03 02:00:00+00
EWR	2013	1	3	3	26.96	15.08	60.41	280	6.90468	\N	0	1022.1	10	2013-01-03 03:00:00+00
EWR	2013	1	3	4	26.06	15.08	62.7	290	5.7539	\N	0	1021.9	10	2013-01-03 04:00:00+00
EWR	2013	1	3	5	26.06	15.08	62.7	290	5.7539	\N	0	1022	10	2013-01-03 05:00:00+00
EWR	2013	1	3	6	26.06	15.98	65.21	310	6.90468	\N	0	1022.4	10	2013-01-03 06:00:00+00
EWR	2013	1	3	7	26.06	15.98	65.21	320	5.7539	\N	0	1022.2	10	2013-01-03 07:00:00+00
EWR	2013	1	3	8	26.96	17.06	65.84	310	5.7539	\N	0	1022.4	10	2013-01-03 08:00:00+00
EWR	2013	1	3	9	28.04	17.06	62.97	290	5.7539	\N	0	1022.8	10	2013-01-03 09:00:00+00
EWR	2013	1	3	10	30.92	15.08	51.38	290	9.20624	\N	0	1022.1	10	2013-01-03 10:00:00+00
EWR	2013	1	3	11	30.92	14	49.01	\N	4.60312	\N	0	1021	10	2013-01-03 11:00:00+00
EWR	2013	1	3	12	33.08	12.92	42.84	260	8.05546	\N	0	1019.8	10	2013-01-03 12:00:00+00
EWR	2013	1	3	13	33.98	12.92	41.33	260	9.20624	\N	0	1019.1	10	2013-01-03 13:00:00+00
EWR	2013	1	3	14	33.98	12.92	41.33	240	8.05546	\N	0	1018.7	10	2013-01-03 14:00:00+00
EWR	2013	1	3	15	33.08	14	44.92	250	11.5078	\N	0	1018.8	10	2013-01-03 15:00:00+00
EWR	2013	1	3	16	32	14	46.92	270	10.35702	\N	0	1018.9	10	2013-01-03 16:00:00+00
EWR	2013	1	3	17	30.02	15.08	53.29	240	9.20624	\N	0	1019.3	10	2013-01-03 17:00:00+00
EWR	2013	1	3	18	30.92	15.08	51.38	240	10.35702	\N	0	1019.6	10	2013-01-03 18:00:00+00
EWR	2013	1	3	19	30.92	15.08	51.38	230	11.5078	\N	0	1019.6	10	2013-01-03 19:00:00+00
EWR	2013	1	3	20	30.92	15.08	51.38	240	11.5078	\N	0	1019.4	10	2013-01-03 20:00:00+00
EWR	2013	1	3	21	30.92	15.98	53.44	240	12.65858	\N	0	1019	10	2013-01-03 21:00:00+00
EWR	2013	1	3	22	28.94	17.06	60.69	230	10.35702	\N	0	1019	10	2013-01-03 22:00:00+00
EWR	2013	1	3	23	30.02	17.96	60.38	240	10.35702	\N	0	1018.4	10	2013-01-03 23:00:00+00
EWR	2013	1	4	0	30.02	17.96	60.38	240	13.80936	\N	0	1018	10	2013-01-04 00:00:00+00
EWR	2013	1	4	1	28.94	17.96	63.1	230	8.05546	\N	0	1018.1	10	2013-01-04 01:00:00+00
EWR	2013	1	4	2	30.02	19.04	63.24	240	10.35702	\N	0	1018.3	10	2013-01-04 02:00:00+00
EWR	2013	1	4	3	28.94	19.04	66.09	250	11.5078	\N	0	1018.2	10	2013-01-04 03:00:00+00
EWR	2013	1	4	4	28.94	19.94	68.68	230	6.90468	\N	0	1018.4	10	2013-01-04 04:00:00+00
EWR	2013	1	4	5	30.92	21.02	66.34	240	11.5078	\N	0	1018.4	10	2013-01-04 05:00:00+00
EWR	2013	1	4	6	33.08	21.02	60.81	230	16.11092	\N	0	1018.7	10	2013-01-04 06:00:00+00
EWR	2013	1	4	7	33.98	21.92	60.93	240	10.35702	\N	0	1018.7	10	2013-01-04 07:00:00+00
EWR	2013	1	4	8	35.06	21.92	58.37	250	13.80936	\N	0	1019	10	2013-01-04 08:00:00+00
EWR	2013	1	4	9	35.96	21.02	54.21	250	14.96014	19.56326	0	1019	10	2013-01-04 09:00:00+00
EWR	2013	1	4	10	37.04	19.04	47.75	260	16.11092	27.61872	0	1018.1	10	2013-01-04 10:00:00+00
EWR	2013	1	4	11	37.04	19.04	47.75	270	20.71404	27.61872	0	1016.9	10	2013-01-04 11:00:00+00
EWR	2013	1	4	12	39.92	19.94	44.33	260	17.2617	25.31716	0	1015.8	10	2013-01-04 12:00:00+00
EWR	2013	1	4	13	37.94	19.04	46.09	250	24.16638	31.07106	0	1015.1	10	2013-01-04 13:00:00+00
EWR	2013	1	4	14	37.94	19.94	47.89	250	21.86482	28.7695	0	1014.7	10	2013-01-04 14:00:00+00
EWR	2013	1	4	15	37.94	19.94	47.89	250	18.41248	27.61872	0	1014.6	10	2013-01-04 15:00:00+00
EWR	2013	1	4	16	37.04	19.94	49.62	250	17.2617	25.31716	0	1014.8	10	2013-01-04 16:00:00+00
EWR	2013	1	4	17	35.96	21.02	54.21	230	13.80936	\N	0	1015.2	10	2013-01-04 17:00:00+00
EWR	2013	1	4	18	35.06	21.02	56.18	230	9.20624	\N	0	1015.4	10	2013-01-04 18:00:00+00
EWR	2013	1	4	19	35.06	21.02	56.18	240	11.5078	19.56326	0	1015.5	10	2013-01-04 19:00:00+00
EWR	2013	1	4	20	35.06	19.94	53.66	250	11.5078	\N	0	1015.3	10	2013-01-04 20:00:00+00
EWR	2013	1	4	21	35.06	19.94	53.66	250	13.80936	\N	0	1015.7	10	2013-01-04 21:00:00+00
EWR	2013	1	4	22	33.98	19.04	53.91	250	11.5078	\N	0	1016.2	10	2013-01-04 22:00:00+00
EWR	2013	1	4	23	33.08	19.04	55.89	240	11.5078	\N	0	1016.6	10	2013-01-04 23:00:00+00
EWR	2013	1	5	0	33.08	17.96	53.36	260	10.35702	\N	0	1017.1	10	2013-01-05 00:00:00+00
EWR	2013	1	5	1	33.08	17.06	51.33	270	10.35702	\N	0	1017.7	10	2013-01-05 01:00:00+00
EWR	2013	1	5	2	32	17.06	53.6	280	12.65858	\N	0	1018.8	10	2013-01-05 02:00:00+00
EWR	2013	1	5	3	32	17.06	53.6	290	18.41248	23.0156	0	1019.3	10	2013-01-05 03:00:00+00
EWR	2013	1	5	4	32	17.06	53.6	260	11.5078	\N	0	1020.2	10	2013-01-05 04:00:00+00
EWR	2013	1	5	5	32	17.06	53.6	240	12.65858	\N	0	1021	10	2013-01-05 05:00:00+00
EWR	2013	1	5	6	33.08	17.96	53.36	250	10.35702	\N	0	1022.4	10	2013-01-05 06:00:00+00
EWR	2013	1	5	7	32	19.04	58.37	250	9.20624	\N	0	1023	10	2013-01-05 07:00:00+00
EWR	2013	1	5	8	35.06	19.94	53.66	240	9.20624	20.71404	0	1024.5	10	2013-01-05 08:00:00+00
EWR	2013	1	5	9	37.94	21.02	50.14	270	10.35702	\N	0	1024.8	10	2013-01-05 09:00:00+00
EWR	2013	1	5	10	41	21.02	44.51	310	10.35702	21.86482	0	1024.9	10	2013-01-05 10:00:00+00
EWR	2013	1	5	11	42.08	19.94	40.77	320	14.96014	26.46794	0	1024.6	10	2013-01-05 11:00:00+00
EWR	2013	1	5	12	42.98	19.94	39.38	310	13.80936	\N	0	1023.9	10	2013-01-05 12:00:00+00
EWR	2013	1	5	13	44.06	19.94	37.79	290	11.5078	19.56326	0	1023.6	10	2013-01-05 13:00:00+00
EWR	2013	1	5	14	44.06	19.94	37.79	310	9.20624	16.11092	0	1024	10	2013-01-05 14:00:00+00
EWR	2013	1	5	15	42.98	19.04	37.9	310	8.05546	\N	0	1024.1	10	2013-01-05 15:00:00+00
EWR	2013	1	5	16	41	19.94	42.51	310	4.60312	\N	0	1024	10	2013-01-05 16:00:00+00
EWR	2013	1	5	17	39.92	19.94	44.33	280	4.60312	\N	0	1024.7	10	2013-01-05 17:00:00+00
EWR	2013	1	5	18	39.02	21.92	49.93	240	8.05546	\N	0	1025	10	2013-01-05 18:00:00+00
EWR	2013	1	5	19	35.96	21.92	56.32	240	6.90468	\N	0	1024.8	10	2013-01-05 19:00:00+00
EWR	2013	1	5	20	33.98	21.92	60.93	240	4.60312	\N	0	1024.2	10	2013-01-05 20:00:00+00
EWR	2013	1	5	21	33.08	23	66.11	220	4.60312	\N	0	1024.1	10	2013-01-05 21:00:00+00
EWR	2013	1	5	22	33.08	23	66.11	210	4.60312	\N	0	1023.3	10	2013-01-05 22:00:00+00
EWR	2013	1	5	23	32	23	69.04	210	4.60312	\N	0	1022.8	10	2013-01-05 23:00:00+00
EWR	2013	1	6	0	33.98	23	63.77	210	5.7539	\N	0	1023.3	10	2013-01-06 00:00:00+00
EWR	2013	1	6	1	33.98	23	63.77	230	9.20624	\N	0	1023.4	10	2013-01-06 01:00:00+00
EWR	2013	1	6	2	33.98	23	63.77	200	4.60312	\N	0	1022.5	10	2013-01-06 02:00:00+00
EWR	2013	1	6	3	33.98	24.08	66.72	200	5.7539	\N	0	1021.7	10	2013-01-06 03:00:00+00
EWR	2013	1	6	4	33.08	28.04	81.5	200	8.05546	\N	0	1020.5	10	2013-01-06 04:00:00+00
EWR	2013	1	6	5	33.8	30.2	88.37	210	5.7539	\N	0	\N	6	2013-01-06 05:00:00+00
EWR	2013	1	6	6	33.98	30.92	88.42	210	5.7539	\N	0	1020.3	6	2013-01-06 06:00:00+00
EWR	2013	1	6	7	35.06	32	93.03	230	9.20624	\N	0	\N	6	2013-01-06 07:00:00+00
EWR	2013	1	6	8	35.96	32	86.59	240	8.05546	\N	0	\N	6	2013-01-06 08:00:00+00
EWR	2013	1	6	9	37.4	32	86.59	230	11.5078	\N	0	\N	8	2013-01-06 09:00:00+00
EWR	2013	1	6	10	39.92	30.92	74.98	250	11.5078	\N	0	\N	9	2013-01-06 10:00:00+00
EWR	2013	1	6	11	42.98	30.02	59.93	240	10.35702	\N	0	1017.4	10	2013-01-06 11:00:00+00
EWR	2013	1	6	12	46.04	28.94	51.03	250	10.35702	\N	0	1016.3	10	2013-01-06 12:00:00+00
EWR	2013	1	6	13	46.94	26.96	45.48	240	13.80936	19.56326	0	1015.5	10	2013-01-06 13:00:00+00
EWR	2013	1	6	14	48.02	24.98	40.22	250	14.96014	18.41248	0	1015.1	10	2013-01-06 14:00:00+00
EWR	2013	1	6	15	46.94	24.08	40.35	260	11.5078	\N	0	1015	10	2013-01-06 15:00:00+00
EWR	2013	1	6	16	44.96	26.06	47.23	260	6.90468	\N	0	1015.5	10	2013-01-06 16:00:00+00
EWR	2013	1	6	17	44.06	26.06	48.87	270	8.05546	\N	0	1016	10	2013-01-06 17:00:00+00
EWR	2013	1	6	18	44.06	24.98	46.73	250	10.35702	\N	0	1016.5	10	2013-01-06 18:00:00+00
EWR	2013	1	6	19	42.98	24.98	48.7	260	10.35702	\N	0	1016.6	10	2013-01-06 19:00:00+00
EWR	2013	1	6	20	42.98	26.06	50.94	270	10.35702	\N	0	1016.5	10	2013-01-06 20:00:00+00
EWR	2013	1	6	21	42.08	26.06	52.73	270	10.35702	\N	0	1016.7	10	2013-01-06 21:00:00+00
EWR	2013	1	6	22	41	26.96	57.06	270	6.90468	\N	0	1017.2	10	2013-01-06 22:00:00+00
EWR	2013	1	6	23	39.92	26.96	59.5	270	9.20624	\N	0	1017.6	10	2013-01-06 23:00:00+00
EWR	2013	1	7	0	39.92	26.96	59.5	260	8.05546	\N	0	1018.1	10	2013-01-07 00:00:00+00
EWR	2013	1	7	1	37.94	26.96	64.29	270	8.05546	\N	0	1018.7	10	2013-01-07 01:00:00+00
EWR	2013	1	7	2	35.96	26.96	69.51	280	6.90468	\N	0	1019.3	10	2013-01-07 02:00:00+00
EWR	2013	1	7	3	37.04	28.04	69.63	260	6.90468	\N	0	1019.8	10	2013-01-07 03:00:00+00
EWR	2013	1	7	4	35.96	28.04	72.66	280	9.20624	\N	0	1020.6	10	2013-01-07 04:00:00+00
EWR	2013	1	7	5	35.06	26.96	72.03	290	4.60312	\N	0	1021.7	10	2013-01-07 05:00:00+00
EWR	2013	1	7	6	35.96	28.04	72.66	270	6.90468	\N	0	1023.1	10	2013-01-07 06:00:00+00
EWR	2013	1	7	7	37.94	28.94	69.73	250	8.05546	\N	0	1024.1	10	2013-01-07 07:00:00+00
EWR	2013	1	7	8	39.92	28.94	64.54	280	5.7539	\N	0	1025.1	10	2013-01-07 08:00:00+00
EWR	2013	1	7	9	44.06	26.96	50.73	300	13.80936	23.0156	0	1025.9	10	2013-01-07 09:00:00+00
EWR	2013	1	7	10	44.96	24.08	43.49	320	14.96014	21.86482	0	1026.5	10	2013-01-07 10:00:00+00
EWR	2013	1	7	11	46.04	23	39.9	300	11.5078	20.71404	0	1026.6	10	2013-01-07 11:00:00+00
EWR	2013	1	7	12	46.94	21.92	36.85	300	14.96014	24.16638	0	1026.9	10	2013-01-07 12:00:00+00
EWR	2013	1	7	13	46.04	19.94	35.05	360	11.5078	\N	0	1027.1	10	2013-01-07 13:00:00+00
EWR	2013	1	7	14	46.94	19.94	33.88	290	11.5078	20.71404	0	1027.6	10	2013-01-07 14:00:00+00
EWR	2013	1	7	15	44.96	17.96	33.55	320	8.05546	\N	0	1028.4	10	2013-01-07 15:00:00+00
EWR	2013	1	7	16	42.98	17.96	36.18	330	6.90468	\N	0	1028.8	10	2013-01-07 16:00:00+00
EWR	2013	1	7	17	42.08	17.96	37.46	320	3.45234	\N	0	1029.1	10	2013-01-07 17:00:00+00
EWR	2013	1	7	18	41	19.04	40.9	310	4.60312	\N	0	1029.3	10	2013-01-07 18:00:00+00
EWR	2013	1	7	19	39.92	21.02	46.41	0	0	\N	0	1029.3	10	2013-01-07 19:00:00+00
EWR	2013	1	7	20	39.92	21.02	46.41	0	0	\N	0	1029.1	10	2013-01-07 20:00:00+00
EWR	2013	1	7	21	37.04	24.08	59.09	0	0	\N	0	1028.9	10	2013-01-07 21:00:00+00
EWR	2013	1	7	22	35.96	23	58.94	230	3.45234	\N	0	1029.3	10	2013-01-07 22:00:00+00
EWR	2013	1	7	23	32	23	69.04	210	6.90468	\N	0	1029.2	10	2013-01-07 23:00:00+00
EWR	2013	1	8	0	32	23	69.04	210	3.45234	\N	0	1029.2	10	2013-01-08 00:00:00+00
EWR	2013	1	8	1	32	24.08	72.24	210	6.90468	\N	0	1029	10	2013-01-08 01:00:00+00
EWR	2013	1	8	2	32	24.98	75	190	3.45234	\N	0	1028.7	10	2013-01-08 02:00:00+00
EWR	2013	1	8	3	30.92	26.06	81.95	190	4.60312	\N	0	1028.2	10	2013-01-08 03:00:00+00
EWR	2013	1	8	4	30.02	24.98	81.27	240	4.60312	\N	0	1028.6	10	2013-01-08 04:00:00+00
EWR	2013	1	8	5	28.94	24.08	81.8	210	4.60312	\N	0	1028.9	10	2013-01-08 05:00:00+00
EWR	2013	1	8	6	30.92	24.98	78.35	0	0	\N	0	1029.2	9	2013-01-08 06:00:00+00
EWR	2013	1	8	7	30.02	24.98	81.27	210	5.7539	\N	0	1030	8	2013-01-08 07:00:00+00
EWR	2013	1	8	8	35.06	26.96	72.03	240	6.90468	\N	0	1030.5	9	2013-01-08 08:00:00+00
EWR	2013	1	8	9	39.02	28.94	66.85	230	9.20624	\N	0	1030.3	9	2013-01-08 09:00:00+00
EWR	2013	1	8	10	44.06	28.94	55.02	220	13.80936	\N	0	1029.7	9	2013-01-08 10:00:00+00
EWR	2013	1	8	11	46.04	30.02	53.33	230	10.35702	\N	0	1028.2	10	2013-01-08 11:00:00+00
EWR	2013	1	8	12	46.94	30.02	51.55	230	14.96014	25.31716	0	1027.9	10	2013-01-08 12:00:00+00
EWR	2013	1	8	13	48.92	30.02	47.86	240	11.5078	\N	0	1027.6	10	2013-01-08 13:00:00+00
EWR	2013	1	8	14	48.92	30.02	47.86	220	11.5078	\N	0	1027.9	10	2013-01-08 14:00:00+00
EWR	2013	1	8	15	48.92	28.04	44.14	240	11.5078	\N	0	1027.7	10	2013-01-08 15:00:00+00
EWR	2013	1	8	16	46.04	28.04	49.19	230	10.35702	\N	0	1027.8	10	2013-01-08 16:00:00+00
EWR	2013	1	8	17	44.06	28.94	55.02	220	6.90468	\N	0	1028.1	10	2013-01-08 17:00:00+00
EWR	2013	1	8	18	39.92	30.92	69.96	220	8.05546	\N	0	1028.7	10	2013-01-08 18:00:00+00
EWR	2013	1	8	19	39.92	30.92	69.96	200	5.7539	\N	0	1028.7	10	2013-01-08 19:00:00+00
EWR	2013	1	8	20	39.02	30.02	69.86	210	5.7539	\N	0	1028.6	10	2013-01-08 20:00:00+00
EWR	2013	1	8	21	37.94	28.94	69.73	210	3.45234	\N	0	1028.6	10	2013-01-08 21:00:00+00
EWR	2013	1	8	22	37.94	28.94	69.73	210	4.60312	\N	0	1029.3	10	2013-01-08 22:00:00+00
EWR	2013	1	8	23	37.04	28.94	72.24	230	4.60312	\N	0	1029.2	10	2013-01-08 23:00:00+00
EWR	2013	1	9	0	35.96	28.94	75.39	0	0	\N	0	1029.1	10	2013-01-09 00:00:00+00
EWR	2013	1	9	1	33.98	28.94	81.57	0	0	\N	0	1028.7	10	2013-01-09 01:00:00+00
EWR	2013	1	9	2	35.06	28.94	78.13	0	0	\N	0	1028.5	10	2013-01-09 02:00:00+00
EWR	2013	1	9	3	35.96	30.02	78.79	0	0	\N	0	1028.4	10	2013-01-09 03:00:00+00
EWR	2013	1	9	4	35.96	28.94	75.39	0	0	\N	0	1028.2	10	2013-01-09 04:00:00+00
EWR	2013	1	9	5	35.06	28.94	78.13	0	0	\N	0	1028	9	2013-01-09 05:00:00+00
EWR	2013	1	9	6	35.06	28.94	78.13	0	0	\N	0	1028.4	9	2013-01-09 06:00:00+00
EWR	2013	1	9	7	33.98	30.02	85.24	260	4.60312	\N	0	1029	6	2013-01-09 07:00:00+00
EWR	2013	1	9	8	37.04	30.92	78.31	0	0	\N	0	1028.7	7	2013-01-09 08:00:00+00
EWR	2013	1	9	9	42.08	32	67.22	0	0	\N	0	1028.3	7	2013-01-09 09:00:00+00
EWR	2013	1	9	10	44.06	33.08	65.07	170	3.45234	\N	0	1026.4	7	2013-01-09 10:00:00+00
EWR	2013	1	9	11	46.94	33.98	60.47	230	5.7539	\N	0	1025.9	7	2013-01-09 11:00:00+00
EWR	2013	1	9	12	46.04	33.98	62.56	200	9.20624	\N	0	1024.1	9	2013-01-09 12:00:00+00
EWR	2013	1	9	13	46.94	33.98	60.47	270	8.05546	\N	0	1024.7	9	2013-01-09 13:00:00+00
EWR	2013	1	9	14	46.94	35.06	63.13	180	8.05546	\N	0	1021.1	8	2013-01-09 14:00:00+00
EWR	2013	1	9	15	48.92	37.04	63.39	210	13.80936	20.71404	0	1020.7	9	2013-01-09 15:00:00+00
EWR	2013	1	9	16	50	37.04	60.89	240	11.5078	20.71404	0	1021	10	2013-01-09 16:00:00+00
EWR	2013	1	9	17	48.92	37.04	63.39	240	12.65858	\N	0	1021.7	10	2013-01-09 17:00:00+00
EWR	2013	1	9	18	48.02	37.04	65.56	250	10.35702	\N	0	1022.1	10	2013-01-09 18:00:00+00
EWR	2013	1	9	19	46.94	37.04	68.28	260	11.5078	\N	0	1022.6	10	2013-01-09 19:00:00+00
EWR	2013	1	9	20	44.96	37.04	73.59	230	11.5078	\N	0	1022.5	10	2013-01-09 20:00:00+00
EWR	2013	1	9	21	44.06	35.96	72.98	230	12.65858	\N	0	1022.5	10	2013-01-09 21:00:00+00
EWR	2013	1	9	22	44.06	35.06	70.42	240	12.65858	\N	0	1023	10	2013-01-09 22:00:00+00
EWR	2013	1	9	23	42.98	33.08	67.81	220	8.05546	\N	0	1023.7	10	2013-01-09 23:00:00+00
EWR	2013	1	10	0	41	32	70.08	230	8.05546	\N	0	1024.6	10	2013-01-10 00:00:00+00
EWR	2013	1	10	1	39.02	30.02	69.86	210	9.20624	\N	0	1025.9	10	2013-01-10 01:00:00+00
EWR	2013	1	10	2	39.02	28.94	66.85	230	6.90468	\N	0	1026.9	10	2013-01-10 02:00:00+00
EWR	2013	1	10	3	39.92	26.96	59.5	270	5.7539	\N	0	1027.5	10	2013-01-10 03:00:00+00
EWR	2013	1	10	4	41	26.06	54.97	320	6.90468	\N	0	1028.2	10	2013-01-10 04:00:00+00
EWR	2013	1	10	5	41	26.06	54.97	300	12.65858	20.71404	0	1029	10	2013-01-10 05:00:00+00
EWR	2013	1	10	6	39.92	24.98	54.81	280	6.90468	17.2617	0	1030	10	2013-01-10 06:00:00+00
EWR	2013	1	10	7	41	24.98	52.56	330	6.90468	\N	0	1031.4	10	2013-01-10 07:00:00+00
EWR	2013	1	10	8	42.98	24.98	48.7	330	8.05546	\N	0	1032.2	10	2013-01-10 08:00:00+00
EWR	2013	1	10	9	44.96	23	41.56	320	17.2617	26.46794	0	1032.7	10	2013-01-10 09:00:00+00
EWR	2013	1	10	10	44.96	21.92	39.72	320	11.5078	\N	0	1032.8	10	2013-01-10 10:00:00+00
EWR	2013	1	10	11	46.94	21.92	36.85	330	13.80936	23.0156	0	1032	10	2013-01-10 11:00:00+00
EWR	2013	1	10	12	48.92	21.92	34.21	320	14.96014	20.71404	0	1031.3	10	2013-01-10 12:00:00+00
EWR	2013	1	10	13	50	21.92	32.86	310	12.65858	18.41248	0	1031.5	10	2013-01-10 13:00:00+00
EWR	2013	1	10	14	50	21.92	32.86	300	11.5078	19.56326	0	1031.9	10	2013-01-10 14:00:00+00
EWR	2013	1	10	15	48.92	21.02	32.93	330	10.35702	\N	0	1032.4	10	2013-01-10 15:00:00+00
EWR	2013	1	10	16	46.94	21.92	36.85	310	8.05546	\N	0	1032.8	10	2013-01-10 16:00:00+00
EWR	2013	1	10	17	46.04	21.92	38.12	320	8.05546	\N	0	1033.3	10	2013-01-10 17:00:00+00
EWR	2013	1	10	18	44.96	23	41.56	330	6.90468	\N	0	1033.8	10	2013-01-10 18:00:00+00
EWR	2013	1	10	19	44.06	23	43.02	340	4.60312	\N	0	1033.6	10	2013-01-10 19:00:00+00
EWR	2013	1	10	20	44.06	23	43.02	340	6.90468	\N	0	1034	10	2013-01-10 20:00:00+00
EWR	2013	1	10	21	41	24.98	52.56	10	8.05546	\N	0	1033.5	10	2013-01-10 21:00:00+00
EWR	2013	1	10	22	39.02	24.98	56.77	30	8.05546	\N	0	1034	10	2013-01-10 22:00:00+00
EWR	2013	1	10	23	39.92	24.08	52.79	0	0	\N	0	1034.4	10	2013-01-10 23:00:00+00
EWR	2013	1	11	0	37.94	24.98	59.22	20	4.60312	\N	0	1033.6	10	2013-01-11 00:00:00+00
EWR	2013	1	11	1	37.04	24.08	59.09	20	8.05546	\N	0	1033.2	10	2013-01-11 01:00:00+00
EWR	2013	1	11	2	35.06	24.08	63.91	30	5.7539	\N	0	1033.1	10	2013-01-11 02:00:00+00
EWR	2013	1	11	3	35.96	24.08	61.67	10	5.7539	\N	0	1032.2	10	2013-01-11 03:00:00+00
EWR	2013	1	11	4	35.96	24.08	61.67	10	6.90468	\N	0	1031.3	10	2013-01-11 04:00:00+00
EWR	2013	1	11	5	37.04	24.98	61.35	0	0	\N	0	1031.7	10	2013-01-11 05:00:00+00
EWR	2013	1	11	6	37.94	24.98	59.22	0	0	\N	0	1031.8	10	2013-01-11 06:00:00+00
EWR	2013	1	11	7	39.02	26.06	59.37	0	0	\N	0	1031.9	10	2013-01-11 07:00:00+00
EWR	2013	1	11	8	41	28.94	61.89	80	5.7539	\N	0	1031.4	10	2013-01-11 08:00:00+00
EWR	2013	1	11	9	42.08	30.92	64.35	80	5.7539	\N	0	1031.1	10	2013-01-11 09:00:00+00
EWR	2013	1	11	10	42.98	32	64.93	80	5.7539	\N	0	1029.7	10	2013-01-11 10:00:00+00
EWR	2013	1	11	11	44.06	33.08	65.07	90	5.7539	\N	0	1028.4	10	2013-01-11 11:00:00+00
EWR	2013	1	11	12	44.96	35.96	70.52	\N	4.60312	\N	0	1027.3	10	2013-01-11 12:00:00+00
EWR	2013	1	11	13	44.96	37.04	73.59	90	5.7539	\N	0	1026.6	10	2013-01-11 13:00:00+00
EWR	2013	1	11	14	44.96	37.94	76.25	80	5.7539	\N	0	1025.9	10	2013-01-11 14:00:00+00
EWR	2013	1	11	15	44.96	39.92	82.38	110	4.60312	\N	0	1024.9	10	2013-01-11 15:00:00+00
EWR	2013	1	11	16	46.4	41	82.45	90	4.60312	\N	0	\N	10	2013-01-11 16:00:00+00
EWR	2013	1	11	17	46.4	44.6	93.4	150	5.7539	\N	0.05	\N	3	2013-01-11 17:00:00+00
EWR	2013	1	11	18	46.4	44.96	95.99	130	5.7539	\N	0.06	\N	3	2013-01-11 18:00:00+00
EWR	2013	1	11	19	46.4	44.96	95.99	0	0	\N	0.19	\N	3	2013-01-11 19:00:00+00
EWR	2013	1	11	20	46.4	44.6	100	60	6.90468	\N	0.07	\N	2.5	2013-01-11 20:00:00+00
EWR	2013	1	11	21	42.98	42.98	100	20	5.7539	\N	0.09	1020.6	1	2013-01-11 21:00:00+00
EWR	2013	1	11	22	44.6	44.6	100	360	3.45234	\N	0.05	\N	1	2013-01-11 22:00:00+00
EWR	2013	1	11	23	42.98	42.98	100	10	8.05546	\N	0.02	\N	2	2013-01-11 23:00:00+00
EWR	2013	1	12	0	44.06	42.98	100	360	5.7539	\N	0.01	\N	1.5	2013-01-12 00:00:00+00
EWR	2013	1	12	1	44.06	42.98	95.95	340	9.20624	\N	0.01	1018.8	1	2013-01-12 01:00:00+00
EWR	2013	1	12	2	44.06	44.06	100	360	6.90468	\N	0.01	1019.2	1.5	2013-01-12 02:00:00+00
EWR	2013	1	12	3	44.96	44.6	100	20	9.20624	\N	0	\N	6	2013-01-12 03:00:00+00
EWR	2013	1	12	4	44.96	44.6	100	20	8.05546	\N	0	\N	6	2013-01-12 04:00:00+00
EWR	2013	1	12	5	44.96	44.6	100	360	9.20624	\N	0	\N	6	2013-01-12 05:00:00+00
EWR	2013	1	12	6	44.06	44.06	100	20	8.05546	\N	0	1019.5	6	2013-01-12 06:00:00+00
EWR	2013	1	12	7	44.96	44.06	96.63	10	10.35702	\N	0	1020.4	6	2013-01-12 07:00:00+00
EWR	2013	1	12	8	44.96	44.06	96.63	10	8.05546	\N	0	1021	7	2013-01-12 08:00:00+00
EWR	2013	1	12	9	46.04	44.06	92.75	10	6.90468	\N	0	1020.9	6	2013-01-12 09:00:00+00
EWR	2013	1	12	10	46.94	44.96	92.78	360	4.60312	\N	0	1021.1	6	2013-01-12 10:00:00+00
EWR	2013	1	12	11	48.02	44.96	89.08	40	5.7539	\N	0	1020.4	6	2013-01-12 11:00:00+00
EWR	2013	1	12	12	46.94	44.96	92.78	30	4.60312	\N	0	1020.5	6	2013-01-12 12:00:00+00
EWR	2013	1	12	13	48.02	44.96	89.08	30	3.45234	\N	0	1020.7	6	2013-01-12 13:00:00+00
EWR	2013	1	12	14	48.02	44.96	89.08	50	5.7539	\N	0	1020.3	5	2013-01-12 14:00:00+00
EWR	2013	1	12	15	48.2	44.96	92.78	40	3.45234	\N	0	\N	2.5	2013-01-12 15:00:00+00
EWR	2013	1	12	16	46.94	44.96	92.78	50	4.60312	\N	0	1021	2.5	2013-01-12 16:00:00+00
EWR	2013	1	12	17	46.94	44.96	92.78	30	6.90468	\N	0	1021.7	2.5	2013-01-12 17:00:00+00
EWR	2013	1	12	18	46.94	44.96	92.78	0	0	\N	0	1021	3	2013-01-12 18:00:00+00
EWR	2013	1	12	19	46.04	44.06	92.75	0	0	\N	0	1021.7	3	2013-01-12 19:00:00+00
EWR	2013	1	12	20	46.04	44.06	92.75	0	0	\N	0	1020.9	3	2013-01-12 20:00:00+00
EWR	2013	1	12	21	46.04	44.06	92.75	0	0	\N	0	1020.2	3	2013-01-12 21:00:00+00
EWR	2013	1	12	22	46.04	44.06	92.75	0	0	\N	0	1020.4	3	2013-01-12 22:00:00+00
EWR	2013	1	12	23	46.4	44.96	95.99	0	0	\N	0	\N	2	2013-01-12 23:00:00+00
EWR	2013	1	13	0	46.4	44.96	100	160	4.60312	\N	0	\N	0.25	2013-01-13 00:00:00+00
EWR	2013	1	13	1	44.96	44.96	100	0	0	\N	0	1020.5	0.25	2013-01-13 01:00:00+00
EWR	2013	1	13	2	44.96	44.96	100	150	4.60312	\N	0	\N	0.25	2013-01-13 02:00:00+00
EWR	2013	1	13	3	44.96	44.96	100	200	5.7539	\N	0	\N	0.25	2013-01-13 03:00:00+00
EWR	2013	1	13	4	44.6	44.6	100	210	5.7539	\N	0	\N	0.25	2013-01-13 04:00:00+00
EWR	2013	1	13	5	44.6	44.6	100	170	3.45234	\N	0	\N	0.25	2013-01-13 05:00:00+00
EWR	2013	1	13	6	44.6	44.6	100	160	4.60312	\N	0	\N	0.5	2013-01-13 06:00:00+00
EWR	2013	1	13	7	44.6	44.6	100	160	5.7539	\N	0	\N	0.25	2013-01-13 07:00:00+00
EWR	2013	1	13	8	44.06	44.06	100	0	0	\N	0	1020.9	0.12	2013-01-13 08:00:00+00
EWR	2013	1	13	9	44.06	44.06	100	0	0	\N	0	1021	0.12	2013-01-13 09:00:00+00
EWR	2013	1	13	10	44.06	44.06	100	140	4.60312	\N	0	1021.1	0.5	2013-01-13 10:00:00+00
EWR	2013	1	13	11	46.4	44.6	93.4	160	3.45234	\N	0	\N	2	2013-01-13 11:00:00+00
EWR	2013	1	13	12	46.94	44.6	93.4	\N	4.60312	\N	0	\N	3	2013-01-13 12:00:00+00
EWR	2013	1	13	13	48.02	44.96	89.08	140	3.45234	\N	0	1018.1	3	2013-01-13 13:00:00+00
EWR	2013	1	13	14	48.2	44.96	89.08	\N	4.60312	\N	0	\N	3	2013-01-13 14:00:00+00
EWR	2013	1	13	15	46.94	44.6	93.4	120	5.7539	\N	0	\N	3	2013-01-13 15:00:00+00
EWR	2013	1	13	16	46.94	44.06	89.65	0	0	\N	0	1017.5	5	2013-01-13 16:00:00+00
EWR	2013	1	13	17	48.02	44.96	89.08	0	0	\N	0	1017.5	7	2013-01-13 17:00:00+00
EWR	2013	1	13	18	48.92	44.96	86.13	0	0	\N	0	1017.2	10	2013-01-13 18:00:00+00
EWR	2013	1	13	19	48.2	46.94	96.02	0	0	\N	0	\N	2	2013-01-13 19:00:00+00
EWR	2013	1	13	20	48.2	46.94	100	120	3.45234	\N	0	\N	0.5	2013-01-13 20:00:00+00
EWR	2013	1	13	21	48.02	48.02	100	0	0	\N	0	1016.4	0.5	2013-01-13 21:00:00+00
EWR	2013	1	13	22	48.02	48.02	100	0	0	\N	0	1016.5	0.5	2013-01-13 22:00:00+00
EWR	2013	1	13	23	48.02	48.02	100	0	0	\N	0	1016.4	0.5	2013-01-13 23:00:00+00
EWR	2013	1	14	0	48.92	48.2	100	0	0	\N	0	\N	0.5	2013-01-14 00:00:00+00
EWR	2013	1	14	1	48.92	48.92	100	0	0	\N	0	1015.9	0.5	2013-01-14 01:00:00+00
EWR	2013	1	14	2	48.92	48.92	100	0	0	\N	0	1016	0.5	2013-01-14 02:00:00+00
EWR	2013	1	14	3	48.92	48.92	100	0	0	\N	0	1015.7	0.5	2013-01-14 03:00:00+00
EWR	2013	1	14	4	50	48.92	100	0	0	\N	0	\N	0.5	2013-01-14 04:00:00+00
EWR	2013	1	14	5	48.92	48.92	100	140	3.45234	\N	0	1014	0.5	2013-01-14 05:00:00+00
EWR	2013	1	14	6	51.08	51.08	100	\N	3.45234	18.41248	0	1016	0.5	2013-01-14 06:00:00+00
EWR	2013	1	14	7	51.8	51.8	100	290	6.90468	\N	0	\N	2.5	2013-01-14 07:00:00+00
EWR	2013	1	14	8	51.98	51.08	96.73	260	4.60312	\N	0	1017.7	2.5	2013-01-14 08:00:00+00
EWR	2013	1	14	9	53.6	51.98	100	250	5.7539	\N	0	\N	6	2013-01-14 09:00:00+00
EWR	2013	1	14	10	55.94	53.06	90.03	270	5.7539	\N	0	1018.6	8	2013-01-14 10:00:00+00
EWR	2013	1	14	11	57.92	50	74.86	320	11.5078	\N	0	1018.6	9	2013-01-14 11:00:00+00
EWR	2013	1	14	12	55.94	44.96	66.52	340	11.5078	\N	0	1018.3	10	2013-01-14 12:00:00+00
EWR	2013	1	14	13	57.02	44.06	61.81	320	10.35702	17.2617	0	1019	10	2013-01-14 13:00:00+00
EWR	2013	1	14	14	55.94	37.94	50.72	340	12.65858	20.71404	0	1020	10	2013-01-14 14:00:00+00
EWR	2013	1	14	15	55.04	39.02	54.67	350	13.80936	\N	0	1020.8	10	2013-01-14 15:00:00+00
EWR	2013	1	14	16	53.06	30.92	42.58	320	14.96014	27.61872	0	1021	10	2013-01-14 16:00:00+00
EWR	2013	1	14	17	51.08	30.92	45.81	330	10.35702	\N	0	1021.8	10	2013-01-14 17:00:00+00
EWR	2013	1	14	18	51.08	30.02	44.16	330	11.5078	18.41248	0	1022.4	10	2013-01-14 18:00:00+00
EWR	2013	1	14	19	48.92	28.04	44.14	320	11.5078	\N	0	1024.5	10	2013-01-14 19:00:00+00
EWR	2013	1	14	20	48.02	26.96	43.67	330	12.65858	\N	0	1024.6	10	2013-01-14 20:00:00+00
EWR	2013	1	14	21	44.06	30.92	59.64	330	17.2617	\N	0	1025.1	10	2013-01-14 21:00:00+00
EWR	2013	1	14	22	41	35.06	79.21	340	11.5078	\N	0.04	1025.5	10	2013-01-14 22:00:00+00
EWR	2013	1	14	23	41	35.96	82.09	350	8.05546	\N	0.02	1025.7	10	2013-01-14 23:00:00+00
EWR	2013	1	15	0	39.92	35.96	85.61	50	4.60312	\N	0.02	1024.8	10	2013-01-15 00:00:00+00
EWR	2013	1	15	1	37.94	35.06	89.25	30	9.20624	\N	0.03	1025.3	10	2013-01-15 01:00:00+00
EWR	2013	1	15	2	37.4	35.6	93.14	50	12.65858	\N	0.04	\N	9	2013-01-15 02:00:00+00
EWR	2013	1	15	3	37.4	35.6	93.14	50	10.35702	\N	0	\N	10	2013-01-15 03:00:00+00
EWR	2013	1	15	4	35.96	32	85.37	360	8.05546	\N	0	1024.9	10	2013-01-15 04:00:00+00
EWR	2013	1	15	5	35.96	30.92	81.72	360	10.35702	\N	0	1025.2	10	2013-01-15 05:00:00+00
EWR	2013	1	15	6	37.04	30.02	75.5	360	8.05546	\N	0	1026	10	2013-01-15 06:00:00+00
EWR	2013	1	15	7	37.04	28.04	69.63	10	9.20624	\N	0	1026.5	10	2013-01-15 07:00:00+00
EWR	2013	1	15	8	37.04	28.04	69.63	10	12.65858	\N	0	1027.4	10	2013-01-15 08:00:00+00
EWR	2013	1	15	9	37.04	26.96	66.6	10	13.80936	\N	0	1027.2	10	2013-01-15 09:00:00+00
EWR	2013	1	15	10	37.04	26.06	64.17	20	10.35702	\N	0	1027.7	10	2013-01-15 10:00:00+00
EWR	2013	1	15	11	39.02	24.98	56.77	360	11.5078	\N	0	1026.8	10	2013-01-15 11:00:00+00
EWR	2013	1	15	12	39.02	26.06	59.37	20	8.05546	\N	0	1025.4	10	2013-01-15 12:00:00+00
EWR	2013	1	15	13	39.02	24.98	56.77	330	8.05546	\N	0	1025.2	10	2013-01-15 13:00:00+00
EWR	2013	1	15	14	39.02	26.06	59.37	350	9.20624	\N	0	1024.9	10	2013-01-15 14:00:00+00
EWR	2013	1	15	15	39.02	26.06	59.37	350	9.20624	\N	0	1025.4	10	2013-01-15 15:00:00+00
EWR	2013	1	15	16	39.02	24.98	56.77	340	8.05546	\N	0	1025.5	10	2013-01-15 16:00:00+00
EWR	2013	1	15	17	39.02	26.06	59.37	360	8.05546	\N	0	1025.1	10	2013-01-15 17:00:00+00
EWR	2013	1	15	18	39.02	26.06	59.37	360	5.7539	\N	0	1025.7	10	2013-01-15 18:00:00+00
EWR	2013	1	15	19	37.94	26.06	61.94	10	4.60312	\N	0	1025	10	2013-01-15 19:00:00+00
EWR	2013	1	15	20	37.94	24.98	59.22	20	6.90468	\N	0	1025.3	10	2013-01-15 20:00:00+00
EWR	2013	1	15	21	37.94	26.96	64.29	30	5.7539	\N	0	1024.1	10	2013-01-15 21:00:00+00
EWR	2013	1	15	22	37.04	28.94	72.24	20	8.05546	\N	0	1023.7	9	2013-01-15 22:00:00+00
EWR	2013	1	15	23	35.96	30.02	78.79	20	9.20624	\N	0.02	1023.3	8	2013-01-15 23:00:00+00
EWR	2013	1	16	0	33.98	30.92	88.42	20	10.35702	\N	0.05	1023.1	6	2013-01-16 00:00:00+00
EWR	2013	1	16	1	33.08	30.92	91.66	20	12.65858	\N	0.07	1021.9	6	2013-01-16 01:00:00+00
EWR	2013	1	16	2	33.08	30.92	91.66	20	10.35702	\N	0.06	1021.6	5	2013-01-16 02:00:00+00
EWR	2013	1	16	3	33.08	32	95.75	360	11.5078	\N	0.13	1020.3	4	2013-01-16 03:00:00+00
EWR	2013	1	16	4	32	32	100	20	8.05546	\N	0.15	\N	4	2013-01-16 04:00:00+00
EWR	2013	1	16	5	32	32	100	20	5.7539	\N	0.09	1018.7	4	2013-01-16 05:00:00+00
EWR	2013	1	16	6	33.8	32	95.75	10	6.90468	\N	0.06	\N	4	2013-01-16 06:00:00+00
EWR	2013	1	16	7	33.8	32	95.75	30	8.05546	\N	0.03	\N	2	2013-01-16 07:00:00+00
EWR	2013	1	16	8	33.8	32	95.75	40	8.05546	\N	0.02	\N	3	2013-01-16 08:00:00+00
EWR	2013	1	16	9	33.98	33.08	96.46	340	6.90468	\N	0	1015.2	3	2013-01-16 09:00:00+00
EWR	2013	1	16	10	33.98	32	92.36	350	5.7539	\N	0.01	1015.5	3	2013-01-16 10:00:00+00
EWR	2013	1	16	11	33.98	33.08	96.46	330	5.7539	\N	0.02	1014.3	3	2013-01-16 11:00:00+00
EWR	2013	1	16	12	33.98	33.08	96.46	30	5.7539	\N	0	1012.2	3	2013-01-16 12:00:00+00
EWR	2013	1	16	13	35.06	33.08	92.4	70	5.7539	\N	0.01	1009	3	2013-01-16 13:00:00+00
EWR	2013	1	16	14	35.6	33.98	95.79	360	11.5078	\N	0	\N	3	2013-01-16 14:00:00+00
EWR	2013	1	16	15	35.96	33.98	93.08	\N	6.90468	\N	0	\N	6	2013-01-16 15:00:00+00
EWR	2013	1	16	16	35.06	33.98	95.79	\N	5.7539	\N	0	1012.9	6	2013-01-16 16:00:00+00
EWR	2013	1	16	17	35.96	33.98	93.08	230	8.05546	\N	0	\N	6	2013-01-16 17:00:00+00
EWR	2013	1	16	18	35.96	33.98	92.43	210	10.35702	\N	0	1012.6	7	2013-01-16 18:00:00+00
EWR	2013	1	16	19	35.96	33.98	93.08	240	12.65858	\N	0	\N	8	2013-01-16 19:00:00+00
EWR	2013	1	16	20	37.4	33.98	88.57	250	12.65858	\N	0	\N	9	2013-01-16 20:00:00+00
EWR	2013	1	16	21	37.4	33.98	88.57	250	10.35702	\N	0	\N	10	2013-01-16 21:00:00+00
EWR	2013	1	16	22	35.96	33.98	92.43	230	9.20624	\N	0	1013.1	10	2013-01-16 22:00:00+00
EWR	2013	1	16	23	37.04	33.98	88.57	250	6.90468	\N	0	1013.2	10	2013-01-16 23:00:00+00
EWR	2013	1	17	0	37.94	33.08	82.46	250	9.20624	\N	0	1013.6	10	2013-01-17 00:00:00+00
EWR	2013	1	17	1	39.02	32	75.69	250	10.35702	\N	0	1013.7	10	2013-01-17 01:00:00+00
EWR	2013	1	17	2	37.94	33.08	82.46	220	10.35702	\N	0	1014.2	10	2013-01-17 02:00:00+00
EWR	2013	1	17	3	37.94	33.08	82.46	230	9.20624	\N	0	1013.9	10	2013-01-17 03:00:00+00
EWR	2013	1	17	4	39.02	30.92	72.46	260	6.90468	\N	0	1013.5	10	2013-01-17 04:00:00+00
EWR	2013	1	17	5	39.02	30.02	69.86	270	9.20624	\N	0	1014.5	10	2013-01-17 05:00:00+00
EWR	2013	1	17	6	37.94	30.02	72.87	270	8.05546	\N	0	1015.8	10	2013-01-17 06:00:00+00
EWR	2013	1	17	7	39.02	28.04	64.43	310	9.20624	\N	0	1016.7	10	2013-01-17 07:00:00+00
EWR	2013	1	17	8	39.02	28.04	64.43	280	8.05546	\N	0	1017.9	10	2013-01-17 08:00:00+00
EWR	2013	1	17	9	42.08	28.94	59.36	270	6.90468	\N	0	1018.1	10	2013-01-17 09:00:00+00
EWR	2013	1	17	10	42.08	28.04	57.22	310	12.65858	\N	0	1018.2	10	2013-01-17 10:00:00+00
EWR	2013	1	17	11	42.98	26.96	52.87	300	11.5078	\N	0	1017.7	10	2013-01-17 11:00:00+00
EWR	2013	1	17	12	46.04	26.96	47.05	330	12.65858	\N	0	1017.5	10	2013-01-17 12:00:00+00
EWR	2013	1	17	13	44.06	26.06	48.87	300	11.5078	\N	0	1017.5	10	2013-01-17 13:00:00+00
EWR	2013	1	17	14	42.98	24.98	48.7	300	12.65858	\N	0	1017.4	10	2013-01-17 14:00:00+00
EWR	2013	1	17	15	42.98	24.98	48.7	320	8.05546	17.2617	0	1017.7	10	2013-01-17 15:00:00+00
EWR	2013	1	17	16	42.08	24.08	48.56	350	9.20624	\N	0	1018.3	10	2013-01-17 16:00:00+00
EWR	2013	1	17	17	41	24.98	52.56	360	6.90468	\N	0	1018.4	10	2013-01-17 17:00:00+00
EWR	2013	1	17	18	41	24.08	50.63	\N	3.45234	\N	0	1019	10	2013-01-17 18:00:00+00
EWR	2013	1	17	19	41	24.98	52.56	310	5.7539	\N	0	1018.8	10	2013-01-17 19:00:00+00
EWR	2013	1	17	20	39.02	23	52.26	350	11.5078	\N	0	1018	10	2013-01-17 20:00:00+00
EWR	2013	1	17	21	37.94	24.98	59.22	360	13.80936	\N	0	1017.7	10	2013-01-17 21:00:00+00
EWR	2013	1	17	22	37.04	23	56.48	360	9.20624	\N	0	1016.6	10	2013-01-17 22:00:00+00
EWR	2013	1	17	23	35.96	26.06	66.97	30	9.20624	\N	0	1016.9	10	2013-01-17 23:00:00+00
EWR	2013	1	18	0	35.06	23	61.08	40	10.35702	\N	0	1016.9	10	2013-01-18 00:00:00+00
EWR	2013	1	18	1	33.08	21.92	63.17	20	12.65858	\N	0	1018.3	10	2013-01-18 01:00:00+00
EWR	2013	1	18	2	30.92	19.04	60.97	10	12.65858	\N	0	1019.2	10	2013-01-18 02:00:00+00
EWR	2013	1	18	3	30.02	17.06	58.08	20	9.20624	\N	0	1019.2	10	2013-01-18 03:00:00+00
EWR	2013	1	18	4	30.02	17.06	58.08	360	5.7539	\N	0	1020.5	10	2013-01-18 04:00:00+00
EWR	2013	1	18	5	30.02	15.98	55.42	340	12.65858	\N	0	1022.5	10	2013-01-18 05:00:00+00
EWR	2013	1	18	6	28.94	15.08	55.69	350	12.65858	\N	0	1024.3	10	2013-01-18 06:00:00+00
EWR	2013	1	18	7	28.04	12.92	52.57	330	21.86482	32.22184	0	1026.3	10	2013-01-18 07:00:00+00
EWR	2013	1	18	8	28.04	8.06	42.32	340	16.11092	24.16638	0	1028	10	2013-01-18 08:00:00+00
EWR	2013	1	18	9	28.94	6.98	38.85	310	16.11092	26.46794	0	1030.1	10	2013-01-18 09:00:00+00
EWR	2013	1	18	10	30.02	5	33.97	330	14.96014	\N	0	1030.6	10	2013-01-18 10:00:00+00
EWR	2013	1	18	11	30.92	6.98	35.84	300	12.65858	21.86482	0	1030.6	10	2013-01-18 11:00:00+00
EWR	2013	1	18	12	30.92	5	32.75	300	10.35702	\N	0	1030.3	10	2013-01-18 12:00:00+00
EWR	2013	1	18	13	30.92	1.94	28.44	340	16.11092	24.16638	0	1030.7	10	2013-01-18 13:00:00+00
EWR	2013	1	18	14	30.92	3.02	29.9	330	9.20624	16.11092	0	1030.6	10	2013-01-18 14:00:00+00
EWR	2013	1	18	15	30.92	1.94	28.44	310	10.35702	\N	0	1030.8	10	2013-01-18 15:00:00+00
EWR	2013	1	18	16	28.94	1.94	30.82	270	10.35702	\N	0	1031.5	10	2013-01-18 16:00:00+00
EWR	2013	1	18	17	28.94	3.02	32.41	250	8.05546	\N	0	1032.2	10	2013-01-18 17:00:00+00
EWR	2013	1	18	18	26.96	5	38.5	220	5.7539	\N	0	1032.3	10	2013-01-18 18:00:00+00
EWR	2013	1	18	19	28.04	8.06	42.32	200	8.05546	\N	0	1032.3	10	2013-01-18 19:00:00+00
EWR	2013	1	18	20	28.94	8.96	42.48	180	8.05546	\N	0	1031.5	10	2013-01-18 20:00:00+00
EWR	2013	1	18	21	28.04	10.94	48.15	210	6.90468	\N	0	1031.7	10	2013-01-18 21:00:00+00
EWR	2013	1	18	22	28.94	10.94	46.41	190	8.05546	\N	0	1030.8	10	2013-01-18 22:00:00+00
EWR	2013	1	18	23	28.94	12.02	48.69	180	9.20624	\N	0	1029.4	10	2013-01-18 23:00:00+00
EWR	2013	1	19	0	28.04	12.92	52.57	190	10.35702	\N	0	1029.4	10	2013-01-19 00:00:00+00
EWR	2013	1	19	1	28.04	12.02	50.52	210	11.5078	\N	0	1029.2	10	2013-01-19 01:00:00+00
EWR	2013	1	19	2	28.94	14	53.13	200	13.80936	\N	0	1028.5	10	2013-01-19 02:00:00+00
EWR	2013	1	19	3	30.02	15.98	55.42	200	13.80936	\N	0	1027.4	10	2013-01-19 03:00:00+00
EWR	2013	1	19	4	28.94	17.06	60.69	210	9.20624	\N	0	1027.1	10	2013-01-19 04:00:00+00
EWR	2013	1	19	5	30.02	19.04	63.24	220	10.35702	\N	0	1026.5	10	2013-01-19 05:00:00+00
EWR	2013	1	19	6	30.92	21.02	66.34	210	10.35702	\N	0	1026.3	10	2013-01-19 06:00:00+00
EWR	2013	1	19	7	32	21.92	65.97	230	13.80936	\N	0	1026	10	2013-01-19 07:00:00+00
EWR	2013	1	19	8	35.06	24.08	63.91	210	18.41248	24.16638	0	1025.8	10	2013-01-19 08:00:00+00
EWR	2013	1	19	9	37.94	24.98	59.22	220	17.2617	\N	0	1025.4	10	2013-01-19 09:00:00+00
EWR	2013	1	19	10	42.98	24.98	48.7	220	23.0156	28.7695	0	1024.1	10	2013-01-19 10:00:00+00
EWR	2013	1	19	11	46.04	24.98	43.34	230	20.71404	\N	0	1022	10	2013-01-19 11:00:00+00
EWR	2013	1	19	12	48.02	24.98	40.22	220	23.0156	27.61872	0	1020.4	10	2013-01-19 12:00:00+00
EWR	2013	1	19	13	50	24.08	35.98	220	18.41248	27.61872	0	1019.4	10	2013-01-19 13:00:00+00
EWR	2013	1	19	14	51.08	23	33.04	220	19.56326	25.31716	0	1018.7	10	2013-01-19 14:00:00+00
EWR	2013	1	19	15	51.98	23	31.96	220	19.56326	25.31716	0	1018.1	10	2013-01-19 15:00:00+00
EWR	2013	1	19	16	50	26.06	39.07	200	12.65858	\N	0	1017.6	10	2013-01-19 16:00:00+00
EWR	2013	1	19	17	48.02	26.96	43.67	200	13.80936	\N	0	1017.5	10	2013-01-19 17:00:00+00
EWR	2013	1	19	18	46.94	26.96	45.48	200	14.96014	23.0156	0	1017.2	10	2013-01-19 18:00:00+00
EWR	2013	1	19	19	46.94	26.96	45.48	210	12.65858	24.16638	0	1016.9	10	2013-01-19 19:00:00+00
EWR	2013	1	19	20	44.96	26.96	49.02	210	18.41248	\N	0	1016.1	10	2013-01-19 20:00:00+00
EWR	2013	1	19	21	44.96	26.96	49.02	210	18.41248	26.46794	0	1015.3	10	2013-01-19 21:00:00+00
EWR	2013	1	19	22	44.06	28.04	53.03	220	17.2617	23.0156	0	1014.4	10	2013-01-19 22:00:00+00
EWR	2013	1	19	23	42.98	28.04	55.27	220	16.11092	25.31716	0	1013.4	10	2013-01-19 23:00:00+00
EWR	2013	1	20	0	41	28.04	59.65	200	11.5078	\N	0	1012.1	10	2013-01-20 00:00:00+00
EWR	2013	1	20	1	39.92	28.94	64.54	190	9.20624	\N	0	1011.3	10	2013-01-20 01:00:00+00
EWR	2013	1	20	2	39.02	28.94	66.85	220	10.35702	\N	0	1010.9	10	2013-01-20 02:00:00+00
EWR	2013	1	20	3	37.04	28.94	72.24	200	6.90468	\N	0	1010.1	10	2013-01-20 03:00:00+00
EWR	2013	1	20	4	39.02	28.94	66.85	180	4.60312	\N	0	1008.9	10	2013-01-20 04:00:00+00
EWR	2013	1	20	5	39.02	28.94	66.85	200	9.20624	\N	0	1008.1	10	2013-01-20 05:00:00+00
EWR	2013	1	20	6	39.02	28.94	66.85	200	8.05546	\N	0	1007.5	10	2013-01-20 06:00:00+00
EWR	2013	1	20	7	39.92	28.94	64.54	220	9.20624	\N	0	1007.3	10	2013-01-20 07:00:00+00
EWR	2013	1	20	8	44.96	28.04	51.24	230	11.5078	\N	0	1007.6	10	2013-01-20 08:00:00+00
EWR	2013	1	20	9	48.92	28.04	44.14	230	16.11092	24.16638	0	1007.5	10	2013-01-20 09:00:00+00
EWR	2013	1	20	10	53.96	28.04	36.63	240	19.56326	29.92028	0	1006.9	10	2013-01-20 10:00:00+00
EWR	2013	1	20	11	53.96	26.96	35.04	250	19.56326	41.42808	0	1006	10	2013-01-20 11:00:00+00
EWR	2013	1	20	12	55.94	24.08	28.93	260	20.71404	39.12652	0	1005.5	10	2013-01-20 12:00:00+00
EWR	2013	1	20	13	53.96	19.04	25.12	260	25.31716	34.5234	0	1006	10	2013-01-20 13:00:00+00
EWR	2013	1	20	14	53.06	14	20.87	250	26.46794	37.97574	0	1006.9	10	2013-01-20 14:00:00+00
EWR	2013	1	20	15	51.98	14	21.72	290	23.0156	31.07106	0	1008.3	10	2013-01-20 15:00:00+00
EWR	2013	1	20	16	48.02	10.94	21.98	290	21.86482	32.22184	0	1009.8	10	2013-01-20 16:00:00+00
EWR	2013	1	20	17	44.06	10.04	24.53	280	19.56326	34.5234	0	1011.5	10	2013-01-20 17:00:00+00
EWR	2013	1	20	18	42.08	12.92	30.08	290	21.86482	29.92028	0	1012.7	10	2013-01-20 18:00:00+00
EWR	2013	1	20	19	39.02	12.02	32.55	300	14.96014	23.0156	0	1014	10	2013-01-20 19:00:00+00
EWR	2013	1	20	20	37.04	14	38.38	310	17.2617	26.46794	0	1015.3	10	2013-01-20 20:00:00+00
EWR	2013	1	20	21	33.98	12.02	39.72	310	12.65858	\N	0	1015.9	10	2013-01-20 21:00:00+00
EWR	2013	1	20	22	32	10.94	40.99	310	16.11092	\N	0	1016.9	10	2013-01-20 22:00:00+00
EWR	2013	1	20	23	30.02	10.04	42.66	320	12.65858	18.41248	0	1017.6	10	2013-01-20 23:00:00+00
EWR	2013	1	21	0	28.94	8.06	40.79	310	11.5078	\N	0	1017.8	10	2013-01-21 00:00:00+00
EWR	2013	1	21	1	28.04	8.06	42.32	320	8.05546	\N	0	1018.6	10	2013-01-21 01:00:00+00
EWR	2013	1	21	2	28.04	6.98	40.31	290	8.05546	\N	0	1018.7	10	2013-01-21 02:00:00+00
EWR	2013	1	21	3	26.96	6.08	40.45	250	5.7539	\N	0	1018.8	10	2013-01-21 03:00:00+00
EWR	2013	1	21	4	26.06	6.98	43.74	240	5.7539	\N	0	1018.8	10	2013-01-21 04:00:00+00
EWR	2013	1	21	5	26.96	8.96	46.08	250	6.90468	\N	0	1018.8	10	2013-01-21 05:00:00+00
EWR	2013	1	21	6	26.06	8.96	47.82	260	6.90468	\N	0	1019	10	2013-01-21 06:00:00+00
EWR	2013	1	21	7	26.06	8.96	47.82	270	3.45234	\N	0	1019	10	2013-01-21 07:00:00+00
EWR	2013	1	21	8	26.96	8.06	44.25	260	5.7539	\N	0	1019.1	10	2013-01-21 08:00:00+00
EWR	2013	1	21	9	28.04	8.96	44.07	230	3.45234	\N	0	1019.2	10	2013-01-21 09:00:00+00
EWR	2013	1	21	10	28.94	8.96	42.48	0	0	\N	0	1018.3	10	2013-01-21 10:00:00+00
EWR	2013	1	21	11	30.02	8.96	40.65	180	6.90468	\N	0	1016.8	10	2013-01-21 11:00:00+00
EWR	2013	1	21	12	30.92	10.04	41.13	170	8.05546	\N	0	1015.2	10	2013-01-21 12:00:00+00
EWR	2013	1	21	13	32	10.04	39.38	240	9.20624	\N	0	1014.7	10	2013-01-21 13:00:00+00
EWR	2013	1	21	14	32	10.94	40.99	190	8.05546	\N	0	1014	10	2013-01-21 14:00:00+00
EWR	2013	1	21	15	30.92	12.02	44.92	200	6.90468	\N	0	1012.8	10	2013-01-21 15:00:00+00
EWR	2013	1	21	16	32	12.02	43	0	0	\N	0	1012.2	10	2013-01-21 16:00:00+00
EWR	2013	1	21	17	32	12.92	44.74	160	3.45234	\N	0	1012.3	10	2013-01-21 17:00:00+00
EWR	2013	1	21	18	32	12.92	44.74	0	0	\N	0	1011.6	10	2013-01-21 18:00:00+00
EWR	2013	1	21	19	32	14	46.92	300	8.05546	\N	0	1011.9	10	2013-01-21 19:00:00+00
EWR	2013	1	21	20	30.02	17.06	58.08	330	9.20624	\N	0	1011.8	10	2013-01-21 20:00:00+00
EWR	2013	1	21	21	30.02	15.98	55.42	260	9.20624	\N	0	1011.4	10	2013-01-21 21:00:00+00
EWR	2013	1	21	22	28.04	17.06	62.97	300	16.11092	\N	0	1010.7	10	2013-01-21 22:00:00+00
EWR	2013	1	21	23	26.96	12.92	54.95	290	12.65858	\N	0	1010.7	10	2013-01-21 23:00:00+00
EWR	2013	1	22	0	26.06	6.08	41.98	290	10.35702	19.56326	0	1010.7	10	2013-01-22 00:00:00+00
EWR	2013	1	22	1	24.98	6.98	45.74	270	13.80936	18.41248	0	1011.4	10	2013-01-22 01:00:00+00
EWR	2013	1	22	2	24.08	6.98	47.49	280	18.41248	26.46794	0	1011.8	10	2013-01-22 02:00:00+00
EWR	2013	1	22	3	23	6.98	49.69	280	16.11092	25.31716	0	1012.3	10	2013-01-22 03:00:00+00
EWR	2013	1	22	4	21.02	6.98	54.03	290	16.11092	\N	0	1013.4	10	2013-01-22 04:00:00+00
EWR	2013	1	22	5	19.94	6.08	54.3	290	14.96014	21.86482	0	1014.5	10	2013-01-22 05:00:00+00
EWR	2013	1	22	6	19.94	5	51.68	280	13.80936	\N	0	1015.4	10	2013-01-22 06:00:00+00
EWR	2013	1	22	7	19.94	6.8	57.41	280	16.11092	\N	0	\N	9	2013-01-22 07:00:00+00
EWR	2013	1	22	8	21.02	3.02	45.07	280	24.16638	29.92028	0	1017.3	10	2013-01-22 08:00:00+00
EWR	2013	1	22	9	21.02	-2.02	35.6	300	24.16638	35.67418	0	1017.6	10	2013-01-22 09:00:00+00
EWR	2013	1	22	10	21.92	-2.92	32.83	270	18.41248	28.7695	0	1017.8	10	2013-01-22 10:00:00+00
EWR	2013	1	22	11	23	-5.98	27.09	300	21.86482	32.22184	0	1017.3	10	2013-01-22 11:00:00+00
EWR	2013	1	22	12	23	-7.06	25.71	270	25.31716	33.37262	0	1016.8	10	2013-01-22 12:00:00+00
EWR	2013	1	22	13	23	-5.98	27.09	290	19.56326	26.46794	0	1016.9	10	2013-01-22 13:00:00+00
EWR	2013	1	22	14	23	-5.98	27.09	280	19.56326	27.61872	0	1017.3	10	2013-01-22 14:00:00+00
EWR	2013	1	22	15	21.02	-7.06	27.95	290	21.86482	29.92028	0	1018.1	10	2013-01-22 15:00:00+00
EWR	2013	1	22	16	19.04	-5.98	32.05	290	14.96014	26.46794	0	1019.1	10	2013-01-22 16:00:00+00
EWR	2013	1	22	17	19.04	-5.08	33.47	280	13.80936	\N	0	1020.3	10	2013-01-22 17:00:00+00
EWR	2013	1	22	18	17.96	-5.08	35.05	280	19.56326	24.16638	0	1021	10	2013-01-22 18:00:00+00
EWR	2013	1	22	19	17.06	-5.98	34.89	290	20.71404	26.46794	0	1021.7	10	2013-01-22 19:00:00+00
EWR	2013	1	22	20	15.98	-5.98	36.56	290	21.86482	27.61872	0	1022.2	10	2013-01-22 20:00:00+00
EWR	2013	1	22	21	15.98	-0.94	46.51	300	14.96014	21.86482	0	1022.7	10	2013-01-22 21:00:00+00
EWR	2013	1	22	22	15.08	-7.06	36.09	300	16.11092	23.0156	0	1023.3	10	2013-01-22 22:00:00+00
EWR	2013	1	22	23	14	-7.96	36.21	280	14.96014	21.86482	0	1023.1	10	2013-01-22 23:00:00+00
EWR	2013	1	23	0	12.92	-7.06	39.67	280	12.65858	21.86482	0	1022.9	10	2013-01-23 00:00:00+00
EWR	2013	1	23	1	12.92	-7.96	37.97	270	11.5078	\N	0	1023.3	10	2013-01-23 01:00:00+00
EWR	2013	1	23	2	12.02	-7.06	41.28	270	10.35702	18.41248	0	1023.7	10	2013-01-23 02:00:00+00
EWR	2013	1	23	3	12.02	-5.98	43.5	270	8.05546	\N	0	1023.5	10	2013-01-23 03:00:00+00
EWR	2013	1	23	4	12.02	-5.08	45.43	270	9.20624	\N	0	1023.6	10	2013-01-23 04:00:00+00
EWR	2013	1	23	5	10.94	-4	50.19	270	10.35702	\N	0	1023.8	10	2013-01-23 05:00:00+00
EWR	2013	1	23	6	10.94	-4	50.19	270	11.5078	\N	0	1024	10	2013-01-23 06:00:00+00
EWR	2013	1	23	7	12.02	-2.92	50.37	270	11.5078	\N	0	1024.2	10	2013-01-23 07:00:00+00
EWR	2013	1	23	8	14	-2.02	48.18	270	12.65858	\N	0	1024.5	10	2013-01-23 08:00:00+00
EWR	2013	1	23	9	15.98	-2.02	44.19	270	11.5078	\N	0	1024.9	10	2013-01-23 09:00:00+00
EWR	2013	1	23	10	17.96	-5.08	35.05	310	14.96014	20.71404	0	1024.4	10	2013-01-23 10:00:00+00
EWR	2013	1	23	11	19.94	-5.98	30.84	320	12.65858	17.2617	0	1023.4	10	2013-01-23 11:00:00+00
EWR	2013	1	23	12	19.94	-5.98	30.84	300	13.80936	\N	0	1022.3	10	2013-01-23 12:00:00+00
EWR	2013	1	23	13	19.94	-4	33.92	290	11.5078	\N	0	1021.8	10	2013-01-23 13:00:00+00
EWR	2013	1	23	14	19.04	-5.98	32.05	270	17.2617	21.86482	0	1021.8	10	2013-01-23 14:00:00+00
EWR	2013	1	23	15	19.04	-5.98	32.05	300	14.96014	20.71404	0	1021.9	10	2013-01-23 15:00:00+00
EWR	2013	1	23	16	17.96	-5.98	33.57	310	11.5078	\N	0	1022.1	10	2013-01-23 16:00:00+00
EWR	2013	1	23	17	17.06	-5.98	34.89	280	12.65858	\N	0	1022.7	10	2013-01-23 17:00:00+00
EWR	2013	1	23	18	17.06	-4	38.38	300	8.05546	\N	0	1023.1	10	2013-01-23 18:00:00+00
EWR	2013	1	23	19	15.98	-2.02	44.19	310	5.7539	\N	0	1023	10	2013-01-23 19:00:00+00
EWR	2013	1	23	20	15.98	-0.04	48.52	300	8.05546	\N	0	1022.7	10	2013-01-23 20:00:00+00
EWR	2013	1	23	21	15.08	-0.04	50.46	270	5.7539	\N	0	1022.9	10	2013-01-23 21:00:00+00
EWR	2013	1	23	22	15.08	-0.04	50.46	280	4.60312	\N	0	1022.9	10	2013-01-23 22:00:00+00
EWR	2013	1	23	23	15.08	1.04	53.07	280	4.60312	\N	0	1022.5	10	2013-01-23 23:00:00+00
EWR	2013	1	24	0	14	-0.04	52.9	270	4.60312	\N	0	1021.6	10	2013-01-24 00:00:00+00
EWR	2013	1	24	1	14	1.04	55.64	310	3.45234	\N	0	1021	10	2013-01-24 01:00:00+00
EWR	2013	1	24	2	12.92	1.94	60.84	310	4.60312	\N	0	1020.7	10	2013-01-24 02:00:00+00
EWR	2013	1	24	3	12.02	1.94	63.31	30	4.60312	\N	0	1020.7	10	2013-01-24 03:00:00+00
EWR	2013	1	24	4	12.92	5	70.07	20	5.7539	\N	0	1020.8	10	2013-01-24 04:00:00+00
EWR	2013	1	24	5	14	3.02	61	350	5.7539	\N	0	1021.5	10	2013-01-24 05:00:00+00
EWR	2013	1	24	6	12.92	3.02	63.97	10	9.20624	\N	0	1022.2	10	2013-01-24 06:00:00+00
EWR	2013	1	24	7	14	3.02	61	350	9.20624	\N	0	1022.7	10	2013-01-24 07:00:00+00
EWR	2013	1	24	8	17.06	1.94	50.79	350	11.5078	\N	0	1023.3	10	2013-01-24 08:00:00+00
EWR	2013	1	24	9	19.04	-0.04	42.52	350	13.80936	\N	0	1023.8	10	2013-01-24 09:00:00+00
EWR	2013	1	24	10	21.92	-5.08	29.61	310	18.41248	21.86482	0	1024.2	10	2013-01-24 10:00:00+00
EWR	2013	1	24	11	23	-9.04	23.34	320	23.0156	32.22184	0	1024	10	2013-01-24 11:00:00+00
EWR	2013	1	24	12	24.08	-7.96	23.52	310	24.16638	34.5234	0	1023.8	10	2013-01-24 12:00:00+00
EWR	2013	1	24	13	24.08	-7.06	24.57	330	28.7695	40.2773	0	1024	10	2013-01-24 13:00:00+00
EWR	2013	1	24	14	24.08	-5.98	25.89	320	25.31716	35.67418	0	1024.9	10	2013-01-24 14:00:00+00
EWR	2013	1	24	15	24.08	-5.08	27.04	310	16.11092	29.92028	0	1025.8	10	2013-01-24 15:00:00+00
EWR	2013	1	24	16	21.92	-4	31.18	320	21.86482	28.7695	0	1026.6	10	2013-01-24 16:00:00+00
EWR	2013	1	24	17	21.02	-2.92	34.11	300	17.2617	26.46794	0	1027.6	10	2013-01-24 17:00:00+00
EWR	2013	1	24	18	19.94	-4	33.92	290	18.41248	32.22184	0	1028.5	10	2013-01-24 18:00:00+00
EWR	2013	1	24	19	19.04	-2.92	37.11	300	20.71404	27.61872	0	1029	10	2013-01-24 19:00:00+00
EWR	2013	1	24	20	17.96	-2.02	40.57	290	20.71404	35.67418	0	1028.6	10	2013-01-24 20:00:00+00
EWR	2013	1	24	21	17.96	-0.94	42.69	300	12.65858	27.61872	0	1029	10	2013-01-24 21:00:00+00
EWR	2013	1	24	22	17.06	-2.02	42.17	290	17.2617	35.67418	0	1029.5	10	2013-01-24 22:00:00+00
EWR	2013	1	24	23	15.98	-2.92	42.34	290	13.80936	20.71404	0	1029.7	10	2013-01-24 23:00:00+00
EWR	2013	1	25	0	15.08	-2.92	44.04	290	16.11092	23.0156	0	1029.7	10	2013-01-25 00:00:00+00
EWR	2013	1	25	1	14	-2.92	46.17	300	12.65858	20.71404	0	1030.3	10	2013-01-25 01:00:00+00
EWR	2013	1	25	2	14	-2.02	48.18	290	16.11092	\N	0	1030.3	10	2013-01-25 02:00:00+00
EWR	2013	1	25	3	12.92	-0.94	53.17	290	12.65858	23.0156	0	1030.4	10	2013-01-25 03:00:00+00
EWR	2013	1	25	4	12.92	-0.94	53.17	260	5.7539	\N	0	1030.3	10	2013-01-25 04:00:00+00
EWR	2013	1	25	5	12.92	-0.04	55.47	280	13.80936	\N	0	1030	10	2013-01-25 05:00:00+00
EWR	2013	1	25	6	12.92	1.04	58.34	280	6.90468	\N	0	1030	10	2013-01-25 06:00:00+00
EWR	2013	1	25	7	14	1.94	58.02	\N	4.60312	\N	0	1029.5	10	2013-01-25 07:00:00+00
EWR	2013	1	25	8	15.98	3.02	55.95	300	6.90468	\N	0	1029.9	10	2013-01-25 08:00:00+00
EWR	2013	1	25	9	17.96	3.02	51.36	280	6.90468	\N	0	1030.3	10	2013-01-25 09:00:00+00
EWR	2013	1	25	10	19.94	1.94	44.88	280	5.7539	\N	0	1029.3	10	2013-01-25 10:00:00+00
EWR	2013	1	25	11	21.02	1.94	42.87	10	4.60312	\N	0	1027	10	2013-01-25 11:00:00+00
EWR	2013	1	25	12	21.92	1.94	41.26	260	4.60312	\N	0	1026.1	10	2013-01-25 12:00:00+00
EWR	2013	1	25	13	23	1.04	37.81	240	4.60312	\N	0	1024.5	10	2013-01-25 13:00:00+00
EWR	2013	1	25	14	24.08	3.02	39.62	220	6.90468	\N	0	1023.7	10	2013-01-25 14:00:00+00
EWR	2013	1	25	15	24.08	3.02	39.62	220	8.05546	\N	0	1023.2	10	2013-01-25 15:00:00+00
EWR	2013	1	25	16	23	8.06	54.61	210	8.05546	\N	0	\N	1.5	2013-01-25 16:00:00+00
EWR	2013	1	25	17	21.2	15.98	85.63	240	11.5078	\N	0.01	\N	1.5	2013-01-25 17:00:00+00
EWR	2013	1	25	18	19.4	15.98	87.64	210	5.7539	\N	0.01	\N	1.5	2013-01-25 18:00:00+00
EWR	2013	1	25	19	19.4	15.8	85.63	250	9.20624	\N	0.02	\N	2	2013-01-25 19:00:00+00
EWR	2013	1	25	20	19.94	15.8	85.63	250	8.05546	\N	0	\N	7	2013-01-25 20:00:00+00
EWR	2013	1	25	21	17.96	14	85.51	260	6.90468	\N	0	\N	9	2013-01-25 21:00:00+00
EWR	2013	1	25	22	17.96	12.92	80.29	280	6.90468	\N	0	1018.6	9	2013-01-25 22:00:00+00
EWR	2013	1	25	23	17.06	12.92	83.47	250	4.60312	\N	0	1018.4	10	2013-01-25 23:00:00+00
EWR	2013	1	26	0	15.98	12.92	87.47	280	6.90468	\N	0	1018.4	10	2013-01-26 00:00:00+00
EWR	2013	1	26	1	15.08	12.02	87.42	290	8.05546	\N	0	1018.5	10	2013-01-26 01:00:00+00
EWR	2013	1	26	2	14	10.94	87.36	280	3.45234	\N	0	1018	10	2013-01-26 02:00:00+00
EWR	2013	1	26	3	14	10.04	83.92	290	5.7539	\N	0	1017.8	10	2013-01-26 03:00:00+00
EWR	2013	1	26	4	15.98	8.96	73.34	300	9.20624	\N	0	1018.1	10	2013-01-26 04:00:00+00
EWR	2013	1	26	5	15.08	8.96	76.27	300	9.20624	\N	0	1018.9	10	2013-01-26 05:00:00+00
EWR	2013	1	26	6	15.98	8.06	70.43	300	4.60312	\N	0	1019.5	10	2013-01-26 06:00:00+00
EWR	2013	1	26	7	17.06	8.06	67.21	300	6.90468	\N	0	1020.6	10	2013-01-26 07:00:00+00
EWR	2013	1	26	8	19.04	8.06	61.72	310	10.35702	\N	0	1021	10	2013-01-26 08:00:00+00
EWR	2013	1	26	9	19.94	8.96	61.85	310	10.35702	\N	0	1021.5	10	2013-01-26 09:00:00+00
EWR	2013	1	26	10	23	10.04	57.03	290	11.5078	\N	0	1021.7	10	2013-01-26 10:00:00+00
EWR	2013	1	26	11	23	10.04	57.03	290	11.5078	18.41248	0	1021.7	10	2013-01-26 11:00:00+00
EWR	2013	1	26	12	24.08	8.96	51.93	320	9.20624	\N	0	1020.6	10	2013-01-26 12:00:00+00
EWR	2013	1	26	13	26.96	10.04	48.36	290	13.80936	24.16638	0	1020.8	10	2013-01-26 13:00:00+00
EWR	2013	1	26	14	28.04	10.04	46.26	300	11.5078	\N	0	1021	10	2013-01-26 14:00:00+00
EWR	2013	1	26	15	28.04	6.98	40.31	300	16.11092	24.16638	0	1021.5	10	2013-01-26 15:00:00+00
EWR	2013	1	26	16	26.96	6.08	40.45	300	14.96014	21.86482	0	1022.2	10	2013-01-26 16:00:00+00
EWR	2013	1	26	17	24.98	5	41.8	320	19.56326	28.7695	0	1023.7	10	2013-01-26 17:00:00+00
EWR	2013	1	26	18	24.08	5	43.4	320	14.96014	27.61872	0	1025	10	2013-01-26 18:00:00+00
EWR	2013	1	26	19	23	6.08	47.7	310	13.80936	\N	0	1025.5	10	2013-01-26 19:00:00+00
EWR	2013	1	26	20	23	6.08	47.7	320	17.2617	24.16638	0	1026.5	10	2013-01-26 20:00:00+00
EWR	2013	1	26	21	21.92	6.98	52.01	320	13.80936	\N	0	1027.5	10	2013-01-26 21:00:00+00
EWR	2013	1	26	22	21.02	6.98	54.03	320	12.65858	\N	0	1028.5	10	2013-01-26 22:00:00+00
EWR	2013	1	26	23	19.94	6.98	56.56	300	10.35702	\N	0	1028.8	10	2013-01-26 23:00:00+00
EWR	2013	1	27	0	19.04	8.06	61.72	290	8.05546	\N	0	1029.1	10	2013-01-27 00:00:00+00
EWR	2013	1	27	1	19.04	8.06	61.72	290	9.20624	\N	0	1030	10	2013-01-27 01:00:00+00
EWR	2013	1	27	2	19.04	8.96	64.28	290	8.05546	\N	0.33	1030.3	10	2013-01-27 02:00:00+00
EWR	2013	1	27	3	19.04	8.96	64.28	280	6.90468	\N	0.03	1030.3	10	2013-01-27 03:00:00+00
EWR	2013	1	27	4	19.04	8.96	64.28	260	8.05546	\N	0.05	1030.4	10	2013-01-27 04:00:00+00
EWR	2013	1	27	5	19.04	8.06	61.72	270	6.90468	\N	0.26	1031.1	10	2013-01-27 05:00:00+00
EWR	2013	1	27	6	17.06	8.06	67.21	240	4.60312	\N	0.17	1031.6	10	2013-01-27 06:00:00+00
EWR	2013	1	27	7	19.04	8.96	64.28	260	8.05546	\N	0.32	1032.4	10	2013-01-27 07:00:00+00
EWR	2013	1	27	8	21.92	10.04	59.69	270	8.05546	\N	0	1032.6	10	2013-01-27 08:00:00+00
EWR	2013	1	27	9	26.96	12.92	54.95	310	11.5078	\N	0	1033.2	10	2013-01-27 09:00:00+00
EWR	2013	1	27	10	30.02	10.04	42.66	310	12.65858	\N	0	1033.7	10	2013-01-27 10:00:00+00
EWR	2013	1	27	11	32	8.96	37.52	340	14.96014	20.71404	0	1032.6	10	2013-01-27 11:00:00+00
EWR	2013	1	27	12	33.98	10.94	37.86	300	14.96014	\N	0	1032.1	10	2013-01-27 12:00:00+00
EWR	2013	1	27	13	35.06	8.96	33.19	300	12.65858	\N	0	1031.5	10	2013-01-27 13:00:00+00
EWR	2013	1	27	14	35.96	8.06	30.76	320	11.5078	\N	0	1031.4	10	2013-01-27 14:00:00+00
EWR	2013	1	27	15	35.96	8.06	30.76	280	8.05546	\N	0	1031.6	10	2013-01-27 15:00:00+00
EWR	2013	1	27	16	33.98	8.06	33.28	310	10.35702	17.2617	0	1032.3	10	2013-01-27 16:00:00+00
EWR	2013	1	27	17	33.08	8.06	34.5	320	6.90468	\N	0	1032.5	10	2013-01-27 17:00:00+00
EWR	2013	1	27	18	32	8.06	36.03	\N	3.45234	\N	0	1033	10	2013-01-27 18:00:00+00
EWR	2013	1	27	19	32	8.06	36.03	0	0	\N	0	1032.7	10	2013-01-27 19:00:00+00
EWR	2013	1	27	20	30.92	8.96	39.19	\N	4.60312	\N	0	1032.9	10	2013-01-27 20:00:00+00
EWR	2013	1	27	21	30.02	8.96	40.65	0	0	\N	0	1032.7	10	2013-01-27 21:00:00+00
EWR	2013	1	27	22	30.02	10.04	42.66	\N	3.45234	\N	0	1032.4	10	2013-01-27 22:00:00+00
EWR	2013	1	27	23	28.04	10.04	46.26	0	0	\N	0	1032.4	10	2013-01-27 23:00:00+00
EWR	2013	1	28	0	26.96	12.02	52.81	0	0	\N	0	1032.7	10	2013-01-28 00:00:00+00
EWR	2013	1	28	1	26.06	12.92	57.04	0	0	\N	0	1032.2	10	2013-01-28 01:00:00+00
EWR	2013	1	28	2	26.06	12.92	57.04	0	0	\N	0	1031.4	10	2013-01-28 02:00:00+00
EWR	2013	1	28	3	26.96	15.98	62.83	0	0	\N	0	1030.9	10	2013-01-28 03:00:00+00
EWR	2013	1	28	4	28.04	15.08	57.79	240	3.45234	\N	0	1030.5	10	2013-01-28 04:00:00+00
EWR	2013	1	28	5	28.04	15.98	60.1	0	0	\N	0	1029.8	10	2013-01-28 05:00:00+00
EWR	2013	1	28	6	30.02	17.06	58.08	0	0	\N	0	1029.7	10	2013-01-28 06:00:00+00
EWR	2013	1	28	7	30.02	19.04	63.24	160	4.60312	\N	0	1029.6	7	2013-01-28 07:00:00+00
EWR	2013	1	28	8	30.92	19.94	63.36	190	4.60312	\N	0	1029.5	6	2013-01-28 08:00:00+00
EWR	2013	1	28	9	30.2	26.06	85	230	6.90468	\N	0	\N	2	2013-01-28 09:00:00+00
EWR	2013	1	28	10	30.92	28.4	92.92	180	8.05546	\N	0	\N	2.5	2013-01-28 10:00:00+00
EWR	2013	1	28	11	33.8	28.94	86.39	200	10.35702	\N	0	\N	2.5	2013-01-28 11:00:00+00
EWR	2013	1	28	12	33.8	30.2	88.37	170	9.20624	\N	0	\N	2.5	2013-01-28 12:00:00+00
EWR	2013	1	28	13	33.8	30.92	91.66	170	8.05546	\N	0	\N	2.5	2013-01-28 13:00:00+00
EWR	2013	1	28	14	33.8	32	95.75	170	6.90468	\N	0	\N	2	2013-01-28 14:00:00+00
EWR	2013	1	28	15	33.98	32	92.36	\N	4.60312	\N	0	1019.6	2	2013-01-28 15:00:00+00
EWR	2013	1	28	16	33.98	32	92.36	220	11.5078	19.56326	0	1018.7	2	2013-01-28 16:00:00+00
EWR	2013	1	28	17	33.98	33.08	96.46	230	11.5078	\N	0	\N	5	2013-01-28 17:00:00+00
EWR	2013	1	28	18	33.98	33.08	96.46	230	8.05546	\N	0	1018.3	5	2013-01-28 18:00:00+00
EWR	2013	1	28	19	33.98	33.08	96.46	230	6.90468	\N	0	1017.8	5	2013-01-28 19:00:00+00
EWR	2013	1	28	20	33.98	33.08	96.46	240	9.20624	\N	0	1017.2	5	2013-01-28 20:00:00+00
EWR	2013	1	28	21	35.06	33.08	92.4	240	9.20624	\N	0	1016.5	5	2013-01-28 21:00:00+00
EWR	2013	1	28	22	35.6	33.8	93.08	240	11.5078	\N	0	\N	5	2013-01-28 22:00:00+00
EWR	2013	1	28	23	35.6	33.8	93.08	230	8.05546	\N	0	\N	5	2013-01-28 23:00:00+00
EWR	2013	1	29	0	35.06	33.98	95.79	210	5.7539	\N	0	1016.2	5	2013-01-29 00:00:00+00
EWR	2013	1	29	1	35.96	33.98	92.43	240	6.90468	\N	0	1016.3	5	2013-01-29 01:00:00+00
EWR	2013	1	29	2	37.04	35.06	92.46	240	3.45234	\N	0	1016.2	7	2013-01-29 02:00:00+00
EWR	2013	1	29	3	37.04	35.96	95.82	220	6.90468	\N	0	1016.1	7	2013-01-29 03:00:00+00
EWR	2013	1	29	4	37.94	37.04	96.52	0	0	\N	0	1017.1	7	2013-01-29 04:00:00+00
EWR	2013	1	29	5	37.94	35.96	92.49	0	0	\N	0	1018.4	7	2013-01-29 05:00:00+00
EWR	2013	1	29	6	37.94	35.96	92.49	0	0	\N	0	1018.8	6	2013-01-29 06:00:00+00
EWR	2013	1	29	7	42.08	39.02	88.81	0	0	\N	0	1019.4	6	2013-01-29 07:00:00+00
EWR	2013	1	29	8	42.98	39.92	88.85	200	3.45234	\N	0	1019.6	6	2013-01-29 08:00:00+00
EWR	2013	1	29	9	48.02	42.08	79.79	0	0	\N	0	1020.1	7	2013-01-29 09:00:00+00
EWR	2013	1	29	10	51.98	39.92	63.33	10	5.7539	\N	0	1020.1	9	2013-01-29 10:00:00+00
EWR	2013	1	29	11	51.98	39.92	63.33	90	5.7539	\N	0	1019.1	10	2013-01-29 11:00:00+00
EWR	2013	1	29	12	51.08	39.02	63.22	110	8.05546	\N	0	1019.2	10	2013-01-29 12:00:00+00
EWR	2013	1	29	13	44.96	39.02	79.54	120	11.5078	\N	0	1018.9	6	2013-01-29 13:00:00+00
EWR	2013	1	29	14	44.96	39.02	79.54	\N	6.90468	\N	0	1019.4	6	2013-01-29 14:00:00+00
EWR	2013	1	29	15	46.4	39.2	75.84	120	5.7539	\N	0	\N	5	2013-01-29 15:00:00+00
EWR	2013	1	29	16	44.6	39.2	82.31	140	5.7539	\N	0	\N	4	2013-01-29 16:00:00+00
EWR	2013	1	29	17	44.6	39.92	85.25	90	6.90468	\N	0	\N	4	2013-01-29 17:00:00+00
EWR	2013	1	29	18	42.98	39.92	88.85	\N	4.60312	\N	0.04	1020.2	4	2013-01-29 18:00:00+00
EWR	2013	1	29	19	42.98	41	93.3	130	5.7539	\N	0.02	\N	4	2013-01-29 19:00:00+00
EWR	2013	1	29	20	42.98	41	93.3	0	0	\N	0	\N	4	2013-01-29 20:00:00+00
EWR	2013	1	29	21	44.6	41	92.65	0	0	\N	0	\N	4	2013-01-29 21:00:00+00
EWR	2013	1	29	22	42.98	41	92.65	0	0	\N	0	1019	3	2013-01-29 22:00:00+00
EWR	2013	1	29	23	44.06	42.08	92.69	60	4.60312	\N	0	1018.8	3	2013-01-29 23:00:00+00
EWR	2013	1	30	0	42.8	41	95.9	30	6.90468	\N	0	\N	2.5	2013-01-30 00:00:00+00
EWR	2013	1	30	1	41	39.92	95.9	30	6.90468	\N	0	1016.5	2.5	2013-01-30 01:00:00+00
EWR	2013	1	30	2	41	39.92	95.9	20	4.60312	\N	0	1015.8	2.5	2013-01-30 02:00:00+00
EWR	2013	1	30	3	41	39.92	100	20	6.90468	\N	0	\N	0.5	2013-01-30 03:00:00+00
EWR	2013	1	30	4	39.92	39.92	100	20	6.90468	\N	0	\N	0.25	2013-01-30 04:00:00+00
EWR	2013	1	30	5	39.92	39.92	100	20	4.60312	\N	0	1013.4	0.25	2013-01-30 05:00:00+00
EWR	2013	1	30	6	39.92	39.92	100	350	3.45234	\N	0	1012.4	0.25	2013-01-30 06:00:00+00
EWR	2013	1	30	7	42.08	42.08	100	0	0	\N	0	\N	0.12	2013-01-30 07:00:00+00
EWR	2013	1	30	8	44.6	44.6	100	50	4.60312	\N	0	\N	0.25	2013-01-30 08:00:00+00
EWR	2013	1	30	9	44.96	44.96	100	50	6.90468	\N	0	\N	0.25	2013-01-30 09:00:00+00
EWR	2013	1	30	10	50	46.94	100	80	5.7539	\N	0	\N	1	2013-01-30 10:00:00+00
EWR	2013	1	30	11	51.98	48.02	87.37	90	5.7539	\N	0	\N	3	2013-01-30 11:00:00+00
EWR	2013	1	30	12	55.04	50	83.08	70	3.45234	\N	0	1005.7	3	2013-01-30 12:00:00+00
EWR	2013	1	30	13	64.04	57.02	77.92	180	10.35702	\N	0	1003.9	10	2013-01-30 13:00:00+00
EWR	2013	1	30	14	64.4	57.2	80.55	180	12.65858	18.41248	0.01	\N	10	2013-01-30 14:00:00+00
EWR	2013	1	30	15	55.94	51.08	83.69	100	8.05546	\N	0	1002.8	10	2013-01-30 15:00:00+00
EWR	2013	1	30	16	59	53.06	80.64	130	9.20624	\N	0	1002.1	10	2013-01-30 16:00:00+00
EWR	2013	1	30	17	59	53.06	82.12	150	8.05546	\N	0	\N	10	2013-01-30 17:00:00+00
EWR	2013	1	30	18	60.8	53.96	93.05	160	6.90468	\N	0.02	\N	10	2013-01-30 18:00:00+00
EWR	2013	1	30	19	51.98	50	92.93	50	3.45234	\N	0	1001.1	9	2013-01-30 19:00:00+00
EWR	2013	1	30	20	51.98	51.08	96.73	0	0	\N	0	999.5	10	2013-01-30 20:00:00+00
EWR	2013	1	30	21	59	55.04	86.69	160	6.90468	\N	0	997.5	10	2013-01-30 21:00:00+00
EWR	2013	1	30	22	62.06	57.02	83.54	180	14.96014	\N	0	995.9	10	2013-01-30 22:00:00+00
EWR	2013	1	30	23	62.06	57.02	83.54	180	21.86482	33.37262	0.01	994.1	10	2013-01-30 23:00:00+00
EWR	2013	1	31	0	62.6	59	89.7	190	25.31716	36.82496	0.09	\N	6	2013-01-31 00:00:00+00
EWR	2013	1	31	1	62.06	59	93.79	190	23.0156	39.12652	0.07	\N	6	2013-01-31 01:00:00+00
EWR	2013	1	31	2	62.06	57.92	86.29	180	31.07106	47.18198	0.05	986.4	6	2013-01-31 02:00:00+00
EWR	2013	1	31	3	62.06	59	89.7	180	27.61872	44.88042	0.19	983.9	3	2013-01-31 03:00:00+00
EWR	2013	1	31	4	60.8	59	93.79	230	40.2773	58.68978	0.3	\N	6	2013-01-31 04:00:00+00
EWR	2013	1	31	5	59	55.4	87.83	220	18.41248	27.61872	0.06	\N	10	2013-01-31 05:00:00+00
EWR	2013	1	31	6	57.2	53.6	87.74	270	42.57886	55.23744	0.03	\N	10	2013-01-31 06:00:00+00
EWR	2013	1	31	7	48.2	35.6	61.52	260	31.07106	37.97574	0.01	\N	10	2013-01-31 07:00:00+00
EWR	2013	1	31	8	46.04	30.02	53.33	270	39.12652	48.33276	0	992.3	10	2013-01-31 08:00:00+00
EWR	2013	1	31	9	44.06	24.98	46.73	270	32.22184	51.7851	0	994.2	10	2013-01-31 09:00:00+00
EWR	2013	1	31	10	44.96	21.02	38.23	260	33.37262	41.42808	0	995.4	10	2013-01-31 10:00:00+00
EWR	2013	1	31	11	46.04	19.04	33.73	280	33.37262	43.72964	0	996.3	10	2013-01-31 11:00:00+00
EWR	2013	1	31	12	46.04	19.04	33.73	260	31.07106	42.57886	0	996.6	10	2013-01-31 12:00:00+00
EWR	2013	1	31	13	44.96	19.04	35.14	250	23.0156	42.57886	0	997.9	10	2013-01-31 13:00:00+00
EWR	2013	1	31	14	44.06	17.96	34.72	260	27.61872	42.57886	0	999.1	10	2013-01-31 14:00:00+00
EWR	2013	1	31	15	42.08	15.08	33.06	270	26.46794	44.88042	0	1000.4	10	2013-01-31 15:00:00+00
EWR	2013	1	31	16	39.02	17.06	40.57	270	31.07106	40.2773	0	1002.2	10	2013-01-31 16:00:00+00
EWR	2013	1	31	17	35.96	12.92	38.2	260	28.7695	43.72964	0	1004.5	10	2013-01-31 17:00:00+00
EWR	2013	1	31	18	35.06	12.92	39.58	250	24.16638	29.92028	0	1006	10	2013-01-31 18:00:00+00
EWR	2013	1	31	19	33.08	15.08	47.1	270	20.71404	31.07106	0	1006.6	10	2013-01-31 19:00:00+00
EWR	2013	1	31	20	32	19.04	58.37	250	17.2617	26.46794	0	1007.3	10	2013-01-31 20:00:00+00
EWR	2013	1	31	21	32	10.04	39.38	260	28.7695	36.82496	0	1008	10	2013-01-31 21:00:00+00
EWR	2013	1	31	22	30.92	6.98	35.84	260	27.61872	35.67418	0	1008.5	10	2013-01-31 22:00:00+00
EWR	2013	1	31	23	30.02	8.06	39.03	260	14.96014	\N	0	1008.9	10	2013-01-31 23:00:00+00
EWR	2013	2	1	0	28.94	10.94	46.41	250	19.56326	23.0156	0	1009.6	10	2013-02-01 00:00:00+00
EWR	2013	2	1	1	28.94	10.94	46.41	240	11.5078	\N	0	1009.9	10	2013-02-01 01:00:00+00
EWR	2013	2	1	2	28.04	10.94	48.15	240	9.20624	\N	0	1009.7	10	2013-02-01 02:00:00+00
EWR	2013	2	1	3	28.04	10.94	48.15	220	13.80936	\N	0	1009.6	10	2013-02-01 03:00:00+00
EWR	2013	2	1	4	28.04	10.94	48.15	230	17.2617	\N	0	1009.8	10	2013-02-01 04:00:00+00
EWR	2013	2	1	5	28.04	12.02	50.52	220	13.80936	20.71404	0	1010.4	10	2013-02-01 05:00:00+00
EWR	2013	2	1	6	28.94	12.02	48.69	260	9.20624	\N	0	1010.9	10	2013-02-01 06:00:00+00
EWR	2013	2	1	7	28.94	12.02	48.69	280	10.35702	\N	0	1010.9	10	2013-02-01 07:00:00+00
EWR	2013	2	1	8	30.02	10.94	44.41	270	10.35702	\N	0	1011.3	10	2013-02-01 08:00:00+00
EWR	2013	2	1	9	30.02	10.04	42.66	290	17.2617	23.0156	0	1012.1	10	2013-02-01 09:00:00+00
EWR	2013	2	1	10	30.02	6.98	37.17	300	17.2617	27.61872	0	1012.1	10	2013-02-01 10:00:00+00
EWR	2013	2	1	11	32	5	31.35	330	25.31716	32.22184	0	1011.8	10	2013-02-01 11:00:00+00
EWR	2013	2	1	12	30.92	5	32.75	320	18.41248	27.61872	0	1012.1	10	2013-02-01 12:00:00+00
EWR	2013	2	1	13	33.98	3.02	26.43	280	20.71404	31.07106	0	1012.8	10	2013-02-01 13:00:00+00
EWR	2013	2	1	14	33.08	1.94	26.07	300	14.96014	33.37262	0	1013.8	10	2013-02-01 14:00:00+00
EWR	2013	2	1	15	30.92	6.08	34.4	310	19.56326	\N	0	1015.4	10	2013-02-01 15:00:00+00
EWR	2013	2	1	16	30.2	14	55.12	280	26.46794	\N	0	\N	10	2013-02-01 16:00:00+00
EWR	2013	2	1	17	26.96	15.98	62.83	280	18.41248	26.46794	0	1018.6	10	2013-02-01 17:00:00+00
EWR	2013	2	1	18	26.06	15.08	62.7	260	13.80936	\N	0	1020	10	2013-02-01 18:00:00+00
EWR	2013	2	1	19	24.98	17.06	71.47	280	14.96014	\N	0	1021.1	10	2013-02-01 19:00:00+00
EWR	2013	2	1	20	24.98	14	62.55	270	14.96014	\N	0	1022	10	2013-02-01 20:00:00+00
EWR	2013	2	1	21	24.98	12.02	57.33	270	11.5078	\N	0	1022.7	10	2013-02-01 21:00:00+00
EWR	2013	2	1	22	24.08	10.04	54.51	270	12.65858	\N	0	1023.3	10	2013-02-01 22:00:00+00
EWR	2013	2	1	23	24.08	8.06	49.87	260	10.35702	\N	0	1024.2	10	2013-02-01 23:00:00+00
EWR	2013	2	2	0	23	6.98	49.69	250	11.5078	\N	0	1024.4	10	2013-02-02 00:00:00+00
EWR	2013	2	2	1	21.92	6.08	49.92	260	13.80936	\N	0	1024.8	10	2013-02-02 01:00:00+00
EWR	2013	2	2	2	21.92	6.08	49.92	260	12.65858	\N	0	1025.3	10	2013-02-02 02:00:00+00
EWR	2013	2	2	3	21.02	6.08	51.86	260	14.96014	\N	0	1025.5	10	2013-02-02 03:00:00+00
EWR	2013	2	2	4	19.94	5	51.68	260	14.96014	\N	0	1025.5	10	2013-02-02 04:00:00+00
EWR	2013	2	2	5	19.04	5	53.71	260	11.5078	\N	0	1025.3	10	2013-02-02 05:00:00+00
EWR	2013	2	2	6	19.04	5	53.71	240	8.05546	\N	0	1026	10	2013-02-02 06:00:00+00
EWR	2013	2	2	7	19.94	6.98	56.56	260	10.35702	\N	0	1026.5	10	2013-02-02 07:00:00+00
EWR	2013	2	2	8	21.02	6.08	51.86	250	10.35702	\N	0	1026.2	10	2013-02-02 08:00:00+00
EWR	2013	2	2	9	24.08	6.08	45.59	260	6.90468	\N	0	1025.7	10	2013-02-02 09:00:00+00
EWR	2013	2	2	10	26.06	6.08	41.98	\N	6.90468	\N	0	1024.8	10	2013-02-02 10:00:00+00
EWR	2013	2	2	11	28.94	3.92	33.78	230	13.80936	19.56326	0	1023.5	10	2013-02-02 11:00:00+00
EWR	2013	2	2	12	28.04	3.02	33.62	230	17.2617	\N	0	1022.5	10	2013-02-02 12:00:00+00
EWR	2013	2	2	13	30.02	3.92	32.32	220	16.11092	19.56326	0	1021.3	10	2013-02-02 13:00:00+00
EWR	2013	2	2	14	30.02	3.92	32.32	220	13.80936	\N	0	1020.5	10	2013-02-02 14:00:00+00
EWR	2013	2	2	15	28.94	3.92	33.78	240	12.65858	20.71404	0	1020	10	2013-02-02 15:00:00+00
EWR	2013	2	2	16	28.94	6.08	37.29	240	11.5078	\N	0	1019.4	10	2013-02-02 16:00:00+00
EWR	2013	2	2	17	28.04	6.98	40.31	260	10.35702	19.56326	0	1019.3	10	2013-02-02 17:00:00+00
EWR	2013	2	2	18	28.04	8.06	42.32	250	6.90468	\N	0	1019.2	10	2013-02-02 18:00:00+00
EWR	2013	2	2	19	26.96	12.02	52.81	230	10.35702	\N	0	1019.3	10	2013-02-02 19:00:00+00
EWR	2013	2	2	20	24.98	19.04	77.82	290	9.20624	\N	0	1019.4	5	2013-02-02 20:00:00+00
EWR	2013	2	2	21	24.98	19.94	80.87	280	6.90468	\N	0	1019.3	3	2013-02-02 21:00:00+00
EWR	2013	2	2	22	24.08	21.02	87.91	0	0	\N	0	1018.8	2	2013-02-02 22:00:00+00
EWR	2013	2	2	23	24.8	21.2	87.91	0	0	\N	0.01	\N	4	2013-02-02 23:00:00+00
EWR	2013	2	3	0	24.98	21.92	87.96	0	0	\N	0	\N	5	2013-02-03 00:00:00+00
EWR	2013	2	3	1	24.98	21.92	87.96	0	0	\N	0.01	1016.5	4	2013-02-03 01:00:00+00
EWR	2013	2	3	2	24.98	23	92.05	20	3.45234	\N	0	1015.7	4	2013-02-03 02:00:00+00
EWR	2013	2	3	3	24.08	21.92	91.32	20	4.60312	\N	0	1014.8	6	2013-02-03 03:00:00+00
EWR	2013	2	3	4	24.08	21.02	87.91	10	8.05546	\N	0	1014.1	6	2013-02-03 04:00:00+00
EWR	2013	2	3	5	24.98	21.02	84.67	20	6.90468	\N	0	1014.1	9	2013-02-03 05:00:00+00
EWR	2013	2	3	6	24.8	19.4	80.8	360	5.7539	\N	0	\N	10	2013-02-03 06:00:00+00
EWR	2013	2	3	7	24.08	19.94	85.85	30	6.90468	\N	0	\N	10	2013-02-03 07:00:00+00
EWR	2013	2	3	8	24.8	19.94	83.96	10	8.05546	\N	0	\N	10	2013-02-03 08:00:00+00
EWR	2013	2	3	9	26.96	21.2	79.77	350	9.20624	\N	0	\N	10	2013-02-03 09:00:00+00
EWR	2013	2	3	10	26.96	21.02	78	20	6.90468	\N	0	1013.3	10	2013-02-03 10:00:00+00
EWR	2013	2	3	11	28.04	21.02	74.61	350	8.05546	\N	0	1012	10	2013-02-03 11:00:00+00
EWR	2013	2	3	12	28.94	19.94	68.68	\N	3.45234	\N	0	1010.8	10	2013-02-03 12:00:00+00
EWR	2013	2	3	13	30.92	21.2	68.83	270	6.90468	\N	0	\N	10	2013-02-03 13:00:00+00
EWR	2013	2	3	14	32	19.04	58.37	310	8.05546	\N	0	1009.3	10	2013-02-03 14:00:00+00
EWR	2013	2	3	15	32	17.96	55.72	300	10.35702	\N	0	1009.2	10	2013-02-03 15:00:00+00
EWR	2013	2	3	16	30.92	15.98	53.44	290	9.20624	17.2617	0	1009	10	2013-02-03 16:00:00+00
EWR	2013	2	3	17	30.02	15.98	55.42	280	11.5078	\N	0	1009.3	10	2013-02-03 17:00:00+00
EWR	2013	2	3	18	28.94	17.06	60.69	260	6.90468	\N	0	1009.7	10	2013-02-03 18:00:00+00
EWR	2013	2	3	19	28.04	17.06	62.97	270	8.05546	\N	0	1009.9	10	2013-02-03 19:00:00+00
EWR	2013	2	3	20	26.96	17.06	65.84	270	5.7539	\N	0	1010.1	10	2013-02-03 20:00:00+00
EWR	2013	2	3	21	26.06	17.06	68.33	270	5.7539	\N	0	1009.9	10	2013-02-03 21:00:00+00
EWR	2013	2	3	22	26.96	17.96	68.44	230	5.7539	\N	0	1009.7	10	2013-02-03 22:00:00+00
EWR	2013	2	3	23	26.96	17.96	68.44	230	9.20624	\N	0	1009.7	10	2013-02-03 23:00:00+00
EWR	2013	2	4	0	26.96	19.04	71.69	260	10.35702	\N	0	1009.8	10	2013-02-04 00:00:00+00
EWR	2013	2	4	1	26.06	17.06	68.33	280	14.96014	\N	0	1010.2	10	2013-02-04 01:00:00+00
EWR	2013	2	4	2	26.06	12.02	54.82	290	18.41248	26.46794	0	1010.8	10	2013-02-04 02:00:00+00
EWR	2013	2	4	3	24.98	10.04	52.5	280	16.11092	20.71404	0	1011.3	10	2013-02-04 03:00:00+00
EWR	2013	2	4	4	24.08	10.04	54.51	270	16.11092	\N	0	1012.4	10	2013-02-04 04:00:00+00
EWR	2013	2	4	5	23	8.96	54.34	270	14.96014	\N	0	1013.2	10	2013-02-04 05:00:00+00
EWR	2013	2	4	6	23	8.96	54.34	260	11.5078	\N	0	1013.9	10	2013-02-04 06:00:00+00
EWR	2013	2	4	7	24.08	8.96	51.93	270	14.96014	\N	0	1014.6	10	2013-02-04 07:00:00+00
EWR	2013	2	4	8	24.98	8.96	50.02	270	17.2617	23.0156	0	1015	10	2013-02-04 08:00:00+00
EWR	2013	2	4	9	28.04	8.96	44.07	290	17.2617	25.31716	0	1015.3	10	2013-02-04 09:00:00+00
EWR	2013	2	4	10	30.02	6.98	37.17	280	18.41248	26.46794	0	1015	10	2013-02-04 10:00:00+00
EWR	2013	2	4	11	30.02	6.98	37.17	250	20.71404	28.7695	0	1014.7	10	2013-02-04 11:00:00+00
EWR	2013	2	4	12	30.92	8.06	37.63	290	20.71404	26.46794	0	1014.2	10	2013-02-04 12:00:00+00
EWR	2013	2	4	13	32	6.98	34.31	260	18.41248	32.22184	0	1013.6	10	2013-02-04 13:00:00+00
EWR	2013	2	4	14	30.92	6.08	34.4	260	14.96014	26.46794	0	1013.5	10	2013-02-04 14:00:00+00
EWR	2013	2	4	15	30.02	6.08	35.68	280	18.41248	26.46794	0	1013.7	10	2013-02-04 15:00:00+00
EWR	2013	2	4	16	28.94	6.08	37.29	260	16.11092	28.7695	0	1013.9	10	2013-02-04 16:00:00+00
EWR	2013	2	4	17	28.94	6.98	38.85	260	13.80936	17.2617	0	1014.5	10	2013-02-04 17:00:00+00
EWR	2013	2	4	18	28.04	8.06	42.32	230	8.05546	\N	0	1015.2	10	2013-02-04 18:00:00+00
EWR	2013	2	4	19	28.04	8.96	44.07	250	5.7539	\N	0	1015.2	10	2013-02-04 19:00:00+00
EWR	2013	2	4	20	24.98	10.04	52.5	210	4.60312	\N	0	1015.1	10	2013-02-04 20:00:00+00
EWR	2013	2	4	21	28.04	10.94	48.15	220	3.45234	\N	0	1015.1	10	2013-02-04 21:00:00+00
EWR	2013	2	4	22	28.04	12.02	50.52	200	3.45234	\N	0	1015.1	10	2013-02-04 22:00:00+00
EWR	2013	2	4	23	28.94	14	53.13	\N	3.45234	\N	0	1014.7	10	2013-02-04 23:00:00+00
EWR	2013	2	5	0	28.04	21.02	74.61	210	6.90468	\N	0	1014.2	10	2013-02-05 00:00:00+00
EWR	2013	2	5	1	28.04	23	81.11	0	0	\N	0	1014	9	2013-02-05 01:00:00+00
EWR	2013	2	5	2	28.04	24.08	84.87	0	0	\N	0	1013.7	9	2013-02-05 02:00:00+00
EWR	2013	2	5	3	28.04	24.08	84.87	0	0	\N	0	1013.6	6	2013-02-05 03:00:00+00
EWR	2013	2	5	4	28.04	24.98	88.12	0	0	\N	0.01	1013	7	2013-02-05 04:00:00+00
EWR	2013	2	5	5	28.94	24.98	84.93	30	3.45234	\N	0	1013.5	8	2013-02-05 05:00:00+00
EWR	2013	2	5	6	28.4	26.6	92.86	20	6.90468	\N	0	\N	4	2013-02-05 06:00:00+00
EWR	2013	2	5	7	26.96	23	84.8	10	9.20624	\N	0	1014.3	6	2013-02-05 07:00:00+00
EWR	2013	2	5	8	28.04	24.08	84.87	20	9.20624	\N	0	1014.6	6	2013-02-05 08:00:00+00
EWR	2013	2	5	9	28.94	24.8	86.18	20	9.20624	\N	0	\N	6	2013-02-05 09:00:00+00
EWR	2013	2	5	10	28.94	24.98	86.18	10	9.20624	\N	0	\N	6	2013-02-05 10:00:00+00
EWR	2013	2	5	11	30.2	24.98	81.27	360	10.35702	\N	0	\N	7	2013-02-05 11:00:00+00
EWR	2013	2	5	12	30.92	24.98	78.35	10	6.90468	\N	0	1014.1	7	2013-02-05 12:00:00+00
EWR	2013	2	5	13	30.92	26.6	86.28	40	8.05546	\N	0	\N	6	2013-02-05 13:00:00+00
EWR	2013	2	5	14	30.92	26.06	81.95	10	6.90468	\N	0	1012.9	7	2013-02-05 14:00:00+00
EWR	2013	2	5	15	30.92	26.06	81.95	50	3.45234	\N	0	1012.9	5	2013-02-05 15:00:00+00
EWR	2013	2	5	16	30.92	26.06	81.95	20	5.7539	\N	0	1012.9	5	2013-02-05 16:00:00+00
EWR	2013	2	5	17	30.92	26.06	81.95	20	5.7539	\N	0	1012.6	6	2013-02-05 17:00:00+00
EWR	2013	2	5	18	32	26.96	81.42	10	4.60312	\N	0	1013	4	2013-02-05 18:00:00+00
EWR	2013	2	5	19	30.92	28.04	88.92	10	4.60312	\N	0	1012.9	4	2013-02-05 19:00:00+00
EWR	2013	2	5	20	30.92	28.4	92.92	360	5.7539	\N	0.01	\N	3	2013-02-05 20:00:00+00
EWR	2013	2	5	21	30.92	28.94	92.26	20	4.60312	\N	0	1013	3	2013-02-05 21:00:00+00
EWR	2013	2	5	22	30.92	28.94	92.26	30	4.60312	\N	0	1013.2	3	2013-02-05 22:00:00+00
EWR	2013	2	5	23	32	30.02	92.29	0	0	\N	0	1013.3	3	2013-02-05 23:00:00+00
EWR	2013	2	6	0	32	30.02	92.29	340	4.60312	\N	0	1013.3	3	2013-02-06 00:00:00+00
EWR	2013	2	6	1	32	30.92	95.73	0	0	\N	0	1013.4	2	2013-02-06 01:00:00+00
EWR	2013	2	6	2	32	30.2	96.41	0	0	\N	0	\N	3	2013-02-06 02:00:00+00
EWR	2013	2	6	3	30.2	28.4	92.92	280	4.60312	\N	0	\N	3	2013-02-06 03:00:00+00
EWR	2013	2	6	4	30.02	28.04	92.23	260	6.90468	\N	0	1014.5	3	2013-02-06 04:00:00+00
EWR	2013	2	6	5	30.2	26.6	88.82	280	6.90468	\N	0	\N	5	2013-02-06 05:00:00+00
EWR	2013	2	6	6	30.92	26.96	85.05	260	5.7539	\N	0	1016.5	5	2013-02-06 06:00:00+00
EWR	2013	2	6	7	30.92	26.96	85.05	260	6.90468	\N	0	1017.9	4	2013-02-06 07:00:00+00
EWR	2013	2	6	8	33.08	26.06	75.11	270	10.35702	\N	0	1018.5	6	2013-02-06 08:00:00+00
EWR	2013	2	6	9	35.06	24.98	66.36	290	16.11092	\N	0	1019.3	9	2013-02-06 09:00:00+00
EWR	2013	2	6	10	37.94	24.98	59.22	280	13.80936	19.56326	0	1019.5	10	2013-02-06 10:00:00+00
EWR	2013	2	6	11	39.02	21.92	49.93	290	13.80936	21.86482	0	1019.4	10	2013-02-06 11:00:00+00
EWR	2013	2	6	12	39.02	19.94	45.91	270	17.2617	21.86482	0	1019.4	10	2013-02-06 12:00:00+00
EWR	2013	2	6	13	39.02	21.02	48.07	290	9.20624	\N	0	1019.7	10	2013-02-06 13:00:00+00
EWR	2013	2	6	14	41	17.96	39.05	290	16.11092	21.86482	0	1020.1	10	2013-02-06 14:00:00+00
EWR	2013	2	6	15	39.02	17.06	40.57	290	16.11092	24.16638	0	1020.9	10	2013-02-06 15:00:00+00
EWR	2013	2	6	16	37.94	15.08	38.84	310	14.96014	25.31716	0	1021.8	10	2013-02-06 16:00:00+00
EWR	2013	2	6	17	37.04	14	38.38	310	10.35702	18.41248	0	1023.2	10	2013-02-06 17:00:00+00
EWR	2013	2	6	18	35.96	12.92	38.2	320	11.5078	\N	0	1024.5	10	2013-02-06 18:00:00+00
EWR	2013	2	6	19	35.06	12.92	39.58	320	14.96014	\N	0	1025.5	10	2013-02-06 19:00:00+00
EWR	2013	2	6	20	33.08	10.94	39.25	340	17.2617	21.86482	0	1026.4	10	2013-02-06 20:00:00+00
EWR	2013	2	6	21	32	6.98	34.31	350	13.80936	\N	0	1026.9	10	2013-02-06 21:00:00+00
EWR	2013	2	6	22	30.92	3.92	31.16	340	13.80936	\N	0	1027.8	10	2013-02-06 22:00:00+00
EWR	2013	2	6	23	28.94	3.02	32.41	350	13.80936	\N	0	1027.9	10	2013-02-06 23:00:00+00
EWR	2013	2	7	0	28.94	3.92	33.78	340	10.35702	\N	0	1028.2	10	2013-02-07 00:00:00+00
EWR	2013	2	7	1	26.06	3.92	38.03	10	6.90468	\N	0	1028.8	10	2013-02-07 01:00:00+00
EWR	2013	2	7	2	26.06	5	39.96	350	8.05546	\N	0	1029.4	10	2013-02-07 02:00:00+00
EWR	2013	2	7	3	26.06	5	39.96	340	6.90468	\N	0	1029.5	10	2013-02-07 03:00:00+00
EWR	2013	2	7	4	24.98	6.08	43.91	340	5.7539	\N	0	1030.6	10	2013-02-07 04:00:00+00
EWR	2013	2	7	5	26.06	6.08	41.98	360	6.90468	\N	0	1030.7	10	2013-02-07 05:00:00+00
EWR	2013	2	7	6	26.06	6.98	43.74	10	4.60312	\N	0	1031.4	10	2013-02-07 06:00:00+00
EWR	2013	2	7	7	26.06	6.98	43.74	10	4.60312	\N	0	1032.6	10	2013-02-07 07:00:00+00
EWR	2013	2	7	8	28.04	6.98	40.31	360	6.90468	\N	0	1032.8	10	2013-02-07 08:00:00+00
EWR	2013	2	7	9	28.04	8.06	42.32	20	6.90468	\N	0	1032.8	10	2013-02-07 09:00:00+00
EWR	2013	2	7	10	30.02	8.06	39.03	20	10.35702	\N	0	1033.2	10	2013-02-07 10:00:00+00
EWR	2013	2	7	11	30.92	8.96	39.19	0	0	\N	0	1032.3	10	2013-02-07 11:00:00+00
EWR	2013	2	7	12	32	10.04	39.38	80	5.7539	\N	0	1031.7	10	2013-02-07 12:00:00+00
EWR	2013	2	7	13	32	8.96	37.52	70	5.7539	\N	0	1031.3	10	2013-02-07 13:00:00+00
EWR	2013	2	7	14	33.08	8.96	35.92	\N	4.60312	\N	0	1030.7	10	2013-02-07 14:00:00+00
EWR	2013	2	7	15	33.08	10.04	37.7	90	6.90468	\N	0	1030.3	10	2013-02-07 15:00:00+00
EWR	2013	2	7	16	33.08	8.06	34.5	110	5.7539	\N	0	1029.7	10	2013-02-07 16:00:00+00
EWR	2013	2	7	17	33.08	10.04	37.7	100	5.7539	\N	0	1029.9	10	2013-02-07 17:00:00+00
EWR	2013	2	7	18	32	15.98	51.15	80	6.90468	\N	0	1030.2	10	2013-02-07 18:00:00+00
EWR	2013	2	7	19	32	19.04	58.37	60	5.7539	\N	0	1030.2	10	2013-02-07 19:00:00+00
EWR	2013	2	7	20	32	19.94	60.66	60	8.05546	\N	0	1029.6	10	2013-02-07 20:00:00+00
EWR	2013	2	7	21	33.08	21.92	63.17	50	6.90468	\N	0	1029	10	2013-02-07 21:00:00+00
EWR	2013	2	7	22	33.08	21.92	63.17	40	6.90468	\N	0	1028.2	10	2013-02-07 22:00:00+00
EWR	2013	2	7	23	33.8	23	66.11	40	6.90468	\N	0	\N	10	2013-02-07 23:00:00+00
EWR	2013	2	8	0	35.06	24.98	66.36	60	6.90468	\N	0	1026.1	10	2013-02-08 00:00:00+00
EWR	2013	2	8	1	35.06	26.06	69.4	60	9.20624	17.2617	0	1025.2	10	2013-02-08 01:00:00+00
EWR	2013	2	8	2	35.06	26.06	69.4	60	10.35702	\N	0	1024.2	10	2013-02-08 02:00:00+00
EWR	2013	2	8	3	35.06	26.96	72.03	50	10.35702	21.86482	0	1022.9	10	2013-02-08 03:00:00+00
EWR	2013	2	8	4	33.98	26.06	72.45	30	9.20624	\N	0	1022.3	10	2013-02-08 04:00:00+00
EWR	2013	2	8	5	33.98	26.06	72.45	30	10.35702	\N	0	1021.5	10	2013-02-08 05:00:00+00
EWR	2013	2	8	6	33.08	28.94	84.56	30	13.80936	\N	0	1020.2	3	2013-02-08 06:00:00+00
EWR	2013	2	8	7	33.8	30.92	91.66	40	12.65858	\N	0.01	\N	3	2013-02-08 07:00:00+00
EWR	2013	2	8	8	33.98	32	92.36	30	11.5078	\N	0.02	1018.5	1	2013-02-08 08:00:00+00
EWR	2013	2	8	9	35.06	33.08	92.4	40	11.5078	\N	0.03	1016.9	1	2013-02-08 09:00:00+00
EWR	2013	2	8	10	35.6	33.8	93.08	40	16.11092	\N	0.04	\N	5	2013-02-08 10:00:00+00
EWR	2013	2	8	11	35.06	33.08	92.4	40	18.41248	27.61872	0.04	1013.3	5	2013-02-08 11:00:00+00
EWR	2013	2	8	12	35.6	33.8	93.08	40	23.0156	29.92028	0.07	\N	5	2013-02-08 12:00:00+00
EWR	2013	2	8	13	33.98	30.92	88.42	40	21.86482	32.22184	0.09	\N	5	2013-02-08 13:00:00+00
EWR	2013	2	8	14	33.98	32	92.36	30	27.61872	33.37262	0.04	\N	4	2013-02-08 14:00:00+00
EWR	2013	2	8	15	33.8	32	95.75	20	19.56326	\N	0.06	\N	2	2013-02-08 15:00:00+00
EWR	2013	2	8	16	33.8	32	95.73	20	17.2617	\N	0.08	\N	2	2013-02-08 16:00:00+00
EWR	2013	2	8	17	32	30.92	95.73	10	19.56326	\N	0.06	\N	1	2013-02-08 17:00:00+00
EWR	2013	2	8	18	32	30.2	92.97	10	21.86482	28.7695	0.02	\N	2	2013-02-08 18:00:00+00
EWR	2013	2	8	19	30.92	28.94	92.92	10	23.0156	\N	0	\N	1.5	2013-02-08 19:00:00+00
EWR	2013	2	8	20	30.92	28.04	88.92	360	21.86482	27.61872	0	1004	2.5	2013-02-08 20:00:00+00
EWR	2013	2	8	21	30.92	28.04	88.92	310	13.80936	25.31716	0.01	1005.4	2.5	2013-02-08 21:00:00+00
EWR	2013	2	8	22	30.2	28.4	95.65	330	18.41248	26.46794	0.03	\N	1.5	2013-02-08 22:00:00+00
EWR	2013	2	8	23	28.4	26.6	92.86	340	19.56326	\N	0.11	\N	0.5	2013-02-08 23:00:00+00
EWR	2013	2	9	0	28.04	26.06	92.16	360	11.5078	\N	0.13	1008.2	0.5	2013-02-09 00:00:00+00
EWR	2013	2	9	1	28.04	26.96	95.65	350	11.5078	\N	0.09	1008.4	0.5	2013-02-09 01:00:00+00
EWR	2013	2	9	2	28.94	28.94	100	350	18.41248	\N	0.2	\N	1	2013-02-09 02:00:00+00
EWR	2013	2	9	3	30.02	28.4	100	330	13.80936	\N	0.13	\N	10	2013-02-09 03:00:00+00
EWR	2013	2	9	4	30.2	26.96	88.22	320	13.80936	\N	0	\N	9	2013-02-09 04:00:00+00
EWR	2013	2	9	5	30.2	24.8	80.07	310	16.11092	24.16638	0	\N	10	2013-02-09 05:00:00+00
EWR	2013	2	9	6	30.02	23	74.81	280	10.35702	\N	0	1011.9	10	2013-02-09 06:00:00+00
EWR	2013	2	9	7	28.4	21.2	74.08	300	23.0156	\N	0	\N	10	2013-02-09 07:00:00+00
EWR	2013	2	9	8	26.96	17.96	68.44	310	18.41248	27.61872	0	1014.1	10	2013-02-09 08:00:00+00
EWR	2013	2	9	9	26.96	17.06	65.84	310	13.80936	28.7695	0	1015.2	10	2013-02-09 09:00:00+00
EWR	2013	2	9	10	28.04	15.98	60.1	310	19.56326	28.7695	0	1016.5	10	2013-02-09 10:00:00+00
EWR	2013	2	9	11	28.94	15.98	57.92	320	28.7695	35.67418	0	1016.8	10	2013-02-09 11:00:00+00
EWR	2013	2	9	12	30.92	15.08	51.38	320	19.56326	26.46794	0	1017.1	10	2013-02-09 12:00:00+00
EWR	2013	2	9	13	33.08	14	44.92	300	17.2617	23.0156	0	1017.8	10	2013-02-09 13:00:00+00
EWR	2013	2	9	14	33.08	10.04	37.7	310	25.31716	33.37262	0	1018.3	10	2013-02-09 14:00:00+00
EWR	2013	2	9	15	33.08	8.06	34.5	320	16.11092	29.92028	0	1018.9	10	2013-02-09 15:00:00+00
EWR	2013	2	9	16	30.92	10.04	41.13	300	21.86482	29.92028	0	1020.1	10	2013-02-09 16:00:00+00
EWR	2013	2	9	17	30.02	8.06	39.03	320	18.41248	26.46794	0	1021.6	10	2013-02-09 17:00:00+00
EWR	2013	2	9	18	28.04	8.06	42.32	320	10.35702	19.56326	0	1022.8	10	2013-02-09 18:00:00+00
EWR	2013	2	9	19	26.96	6.98	42.14	310	11.5078	26.46794	0	1024	10	2013-02-09 19:00:00+00
EWR	2013	2	9	20	24.98	6.98	45.74	310	12.65858	23.0156	0	1025.4	10	2013-02-09 20:00:00+00
EWR	2013	2	9	21	24.08	6.98	47.49	310	11.5078	\N	0	1026.5	10	2013-02-09 21:00:00+00
EWR	2013	2	9	22	21.92	8.06	54.61	300	9.20624	\N	0	1027	10	2013-02-09 22:00:00+00
EWR	2013	2	9	23	19.94	6.98	56.56	310	6.90468	\N	0	1027.8	10	2013-02-09 23:00:00+00
EWR	2013	2	10	0	19.94	6.98	56.56	310	11.5078	\N	0	1028.2	10	2013-02-10 00:00:00+00
EWR	2013	2	10	1	19.04	6.98	58.78	310	9.20624	\N	0	1028.4	10	2013-02-10 01:00:00+00
EWR	2013	2	10	2	19.04	6.98	58.78	310	10.35702	\N	0	1028.5	10	2013-02-10 02:00:00+00
EWR	2013	2	10	3	19.04	6.98	58.78	330	6.90468	\N	0	1028.5	10	2013-02-10 03:00:00+00
EWR	2013	2	10	4	17.06	8.06	67.21	250	4.60312	\N	0	1028.9	10	2013-02-10 04:00:00+00
EWR	2013	2	10	5	15.98	8.06	70.43	290	5.7539	\N	0	1029.7	10	2013-02-10 05:00:00+00
EWR	2013	2	10	6	15.98	6.98	67.07	350	4.60312	\N	0	1030.1	10	2013-02-10 06:00:00+00
EWR	2013	2	10	7	17.96	8.06	64.65	0	0	\N	0	1031	10	2013-02-10 07:00:00+00
EWR	2013	2	10	8	23	8.06	52.18	330	5.7539	\N	0	1031.8	10	2013-02-10 08:00:00+00
EWR	2013	2	10	9	26.06	8.96	47.82	360	3.45234	\N	0	1032.2	10	2013-02-10 09:00:00+00
EWR	2013	2	10	10	26.96	8.96	46.08	0	0	\N	0	1032.4	10	2013-02-10 10:00:00+00
EWR	2013	2	10	11	28.94	10.04	44.58	200	3.45234	\N	0	1031.8	10	2013-02-10 11:00:00+00
EWR	2013	2	10	12	32	8.96	37.52	0	0	\N	0	1030.4	10	2013-02-10 12:00:00+00
EWR	2013	2	10	13	33.98	12.92	41.33	0	0	\N	0	1029.8	10	2013-02-10 13:00:00+00
EWR	2013	2	10	14	35.06	14	41.51	210	3.45234	\N	0	1029.6	10	2013-02-10 14:00:00+00
EWR	2013	2	10	15	33.98	10.04	36.37	190	5.7539	\N	0	1029	10	2013-02-10 15:00:00+00
EWR	2013	2	10	16	33.98	10.94	37.86	190	4.60312	\N	0	1028.7	10	2013-02-10 16:00:00+00
EWR	2013	2	10	17	33.98	15.08	45.43	160	3.45234	\N	0	1029.1	10	2013-02-10 17:00:00+00
EWR	2013	2	10	18	32	17.96	55.72	170	4.60312	\N	0	1029	10	2013-02-10 18:00:00+00
EWR	2013	2	10	19	32	19.04	58.37	150	5.7539	\N	0	1028.9	10	2013-02-10 19:00:00+00
EWR	2013	2	10	20	32	19.94	60.66	0	0	\N	0	1028.5	10	2013-02-10 20:00:00+00
EWR	2013	2	10	21	30.92	21.02	66.34	160	3.45234	\N	0	1028.2	10	2013-02-10 21:00:00+00
EWR	2013	2	10	22	30.92	21.02	66.34	180	4.60312	\N	0	1027.4	10	2013-02-10 22:00:00+00
EWR	2013	2	10	23	32	21.92	65.97	170	3.45234	\N	0	1027.3	10	2013-02-10 23:00:00+00
EWR	2013	2	11	0	30.92	21.92	68.92	0	0	\N	0	1026.5	10	2013-02-11 00:00:00+00
EWR	2013	2	11	1	30.92	21.02	66.34	0	0	\N	0	1026	10	2013-02-11 01:00:00+00
EWR	2013	2	11	2	32	23	69.04	0	0	\N	0	1024.8	10	2013-02-11 02:00:00+00
EWR	2013	2	11	3	33.08	26.06	75.11	0	0	\N	0	1023.5	9	2013-02-11 03:00:00+00
EWR	2013	2	11	4	32	26.96	81.42	20	3.45234	\N	0	1022.2	10	2013-02-11 04:00:00+00
EWR	2013	2	11	5	33.98	28.94	81.57	20	3.45234	\N	0.01	1021.1	8	2013-02-11 05:00:00+00
EWR	2013	2	11	6	35.6	33.8	93.08	0	0	\N	0.06	\N	4	2013-02-11 06:00:00+00
EWR	2013	2	11	7	37.4	37.4	100	30	3.45234	\N	0.07	\N	3	2013-02-11 07:00:00+00
EWR	2013	2	11	8	37.94	37.4	100	360	8.05546	\N	0.17	\N	2	2013-02-11 08:00:00+00
EWR	2013	2	11	9	35.96	35.96	100	20	6.90468	\N	0.07	\N	1	2013-02-11 09:00:00+00
EWR	2013	2	11	10	35.96	35.96	100	30	5.7539	\N	0.02	1014.5	0.5	2013-02-11 10:00:00+00
EWR	2013	2	11	11	37.04	35.96	95.82	360	3.45234	\N	0.01	1013.4	0.5	2013-02-11 11:00:00+00
EWR	2013	2	11	12	39.02	39.02	100	0	0	\N	0.01	1011.2	0.5	2013-02-11 12:00:00+00
EWR	2013	2	11	13	39.92	39.02	96.55	0	0	\N	0	1009.6	0.5	2013-02-11 13:00:00+00
EWR	2013	2	11	14	39.02	39.02	100	220	4.60312	\N	0	1008.8	0.5	2013-02-11 14:00:00+00
EWR	2013	2	11	15	41	41	100	0	0	\N	0	1007.1	0.5	2013-02-11 15:00:00+00
EWR	2013	2	11	16	41	39.92	95.9	250	3.45234	\N	0	1006.4	0.5	2013-02-11 16:00:00+00
EWR	2013	2	11	17	42.08	41	95.92	0	0	\N	0	1005.6	0.5	2013-02-11 17:00:00+00
\.


--
-- PostgreSQL database dump complete
--

