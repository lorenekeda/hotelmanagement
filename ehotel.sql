--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-31 12:47:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 33662)
-- Name: relational_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA relational_schema;


ALTER SCHEMA relational_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 33663)
-- Name: archive; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.archive (
    archive_id integer NOT NULL
);


ALTER TABLE relational_schema.archive OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33666)
-- Name: booking; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.booking (
    booking_start_date date NOT NULL,
    booking_end_date date,
    room_num integer NOT NULL,
    customer_id character varying,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);


ALTER TABLE relational_schema.booking OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33671)
-- Name: chain_address; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_address (
    chain_id integer NOT NULL,
    c_address character varying NOT NULL
);


ALTER TABLE relational_schema.chain_address OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33676)
-- Name: chain_email; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_email (
    chain_id integer NOT NULL,
    c_email character varying NOT NULL
);


ALTER TABLE relational_schema.chain_email OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33681)
-- Name: chain_number; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_number (
    chain_id integer NOT NULL,
    c_phone_number bigint NOT NULL
);


ALTER TABLE relational_schema.chain_number OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33684)
-- Name: customer; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.customer (
    customer_id character varying NOT NULL,
    registration_date character varying,
    first_name character varying,
    last_name character varying,
    id_type character varying,
    address character varying,
    password character varying
);


ALTER TABLE relational_schema.customer OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 33689)
-- Name: employee; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.employee (
    employee_ssn integer NOT NULL,
    first_name character varying,
    last_name character varying,
    address character varying,
    "position" character varying,
    hotel_id integer,
    chain_id integer,
    password character varying
);


ALTER TABLE relational_schema.employee OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33694)
-- Name: has; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.has (
    booking_start_date date NOT NULL,
    room_num integer NOT NULL,
    customer_id character varying,
    card_number integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);


ALTER TABLE relational_schema.has OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 33699)
-- Name: holds; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.holds (
    archive_id integer NOT NULL,
    renting_start_date character varying NOT NULL,
    booking_start_date character varying NOT NULL
);


ALTER TABLE relational_schema.holds OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33704)
-- Name: hotel; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel (
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    address character varying,
    name character varying,
    rating integer,
    num_of_room integer
);


ALTER TABLE relational_schema.hotel OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 33709)
-- Name: hotel_chain; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_chain (
    chain_id integer NOT NULL,
    chain_name character varying,
    num_of_hotel integer
);


ALTER TABLE relational_schema.hotel_chain OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 33714)
-- Name: hotel_email; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_email (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_email character varying NOT NULL
);


ALTER TABLE relational_schema.hotel_email OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 33719)
-- Name: hotel_phone; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_phone (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_phone_number bigint NOT NULL
);


ALTER TABLE relational_schema.hotel_phone OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 33888)
-- Name: hotel_room_capacity; Type: VIEW; Schema: relational_schema; Owner: postgres
--

CREATE VIEW relational_schema.hotel_room_capacity AS
 SELECT hotel_id,
    sum(num_of_room) AS total_rooms
   FROM relational_schema.hotel
  GROUP BY hotel_id;


ALTER VIEW relational_schema.hotel_room_capacity OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 33722)
-- Name: manager; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.manager (
    ssn integer NOT NULL,
    "position" character varying,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    address character varying
);


ALTER TABLE relational_schema.manager OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 33727)
-- Name: payment; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.payment (
    card_number integer NOT NULL,
    cvv integer,
    expiry_date character varying,
    customer_id character varying
);


ALTER TABLE relational_schema.payment OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 33732)
-- Name: renting; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.renting (
    start_date date NOT NULL,
    end_date date,
    room_num integer NOT NULL,
    customer_id character varying,
    employee_ssn integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);


ALTER TABLE relational_schema.renting OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 33737)
-- Name: room; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.room (
    room_num integer NOT NULL,
    view character varying,
    extendable boolean,
    capacity character varying,
    price integer,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);


ALTER TABLE relational_schema.room OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 33742)
-- Name: room_amenity; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.room_amenity (
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    amenity character varying NOT NULL
);


ALTER TABLE relational_schema.room_amenity OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 33747)
-- Name: room_damage; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.room_damage (
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    damage character varying NOT NULL
);


ALTER TABLE relational_schema.room_damage OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 33884)
-- Name: rooms_per_area; Type: VIEW; Schema: relational_schema; Owner: postgres
--

CREATE VIEW relational_schema.rooms_per_area AS
 SELECT address,
    sum(num_of_room) AS num_of_rooms
   FROM relational_schema.hotel
  GROUP BY address;


ALTER VIEW relational_schema.rooms_per_area OWNER TO postgres;

--
-- TOC entry 4977 (class 0 OID 33663)
-- Dependencies: 218
-- Data for Name: archive; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.archive (archive_id) FROM stdin;
\.


--
-- TOC entry 4978 (class 0 OID 33666)
-- Dependencies: 219
-- Data for Name: booking; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.booking (booking_start_date, booking_end_date, room_num, customer_id, hotel_id, chain_id) FROM stdin;
2025-03-30	2025-04-02	5	szhen025@uottawa.ca	11111	23456
\.


--
-- TOC entry 4979 (class 0 OID 33671)
-- Dependencies: 220
-- Data for Name: chain_address; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.chain_address (chain_id, c_address) FROM stdin;
12345	Toronto
23456	Ottawa
34567	Hamilton
45678	Kingston
56789	Windsor
\.


--
-- TOC entry 4980 (class 0 OID 33676)
-- Dependencies: 221
-- Data for Name: chain_email; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.chain_email (chain_id, c_email) FROM stdin;
12345	miltoninfo@milton
23456	larriottinfo@larriott
34567	skyeinfo@skye
45678	ascoinfo@asco
56789	starinfo@star
\.


--
-- TOC entry 4981 (class 0 OID 33681)
-- Dependencies: 222
-- Data for Name: chain_number; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.chain_number (chain_id, c_phone_number) FROM stdin;
56789	9078956789
12345	5269312345
23456	3779723456
34567	7298934567
45678	1717045678
\.


--
-- TOC entry 4982 (class 0 OID 33684)
-- Dependencies: 223
-- Data for Name: customer; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.customer (customer_id, registration_date, first_name, last_name, id_type, address, password) FROM stdin;
hi@gmail.com	Sun Mar 30 12:36:05 EDT 2025	sona	jio	Driver's License	yu	hi
szhen025@uottawa.ca	Sun Mar 30 13:04:55 EDT 2025	Sophia	Zheng	Driver's License	323 Somerset St E.	hi
hi@outlook.com	Sun Mar 30 13:12:17 EDT 2025	hi	hi	SIN	hi	hi
hi2email.com	Sun Mar 30 13:13:28 EDT 2025	hi	hi	Driver's License	hi	hi
\.


--
-- TOC entry 4983 (class 0 OID 33689)
-- Dependencies: 224
-- Data for Name: employee; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.employee (employee_ssn, first_name, last_name, address, "position", hotel_id, chain_id, password) FROM stdin;
123	john	smith	123 street	emp	11111	12345	pass
456	sally	smith	234 street	manager	11111	12345	pass2
\.


--
-- TOC entry 4984 (class 0 OID 33694)
-- Dependencies: 225
-- Data for Name: has; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.has (booking_start_date, room_num, customer_id, card_number, hotel_id, chain_id) FROM stdin;
\.


--
-- TOC entry 4985 (class 0 OID 33699)
-- Dependencies: 226
-- Data for Name: holds; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.holds (archive_id, renting_start_date, booking_start_date) FROM stdin;
\.


--
-- TOC entry 4986 (class 0 OID 33704)
-- Dependencies: 227
-- Data for Name: hotel; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) FROM stdin;
11111	12345	Kanata	Milton	4	5
33333	56789	River Bend	Star co.	4	5
44444	45678	Gardiners	Asco	5	5
99999	56789	River Bend	Star co.	5	5
66666	56789	Stoneybrook	Star co.	5	5
77777	45678	Westwoods	Asco	4	5
44444	12345	Orleans	Milton	3	5
33333	34567	Richmond	Skye Hotels	5	5
66666	34567	North Vancouver	Skye Hotels	4	5
10111	45678	Alwington	Asco	3	5
99999	23456	Etobicoke	Larriott	5	5
66666	23456	Markham	Larriott	1	5
11111	45678	Alwington	Asco	5	5
22222	23456	Mississauga	Larriott	4	5
77777	12345	Stittsville	Milton	2	5
33333	23456	Markham	Larriott	5	5
11111	56789	Byron	Star co.	3	5
22222	34567	Surrey	Skye Hotels	4	5
44444	56789	Summerside	Star co.	4	5
66666	45678	Inner Harbour	Asco	4	5
77777	34567	Richmond	Skye Hotels	5	5
11000	56789	Blackfriars	Star co.	4	5
44444	23456	Vaughan	Larriott	3	5
88888	45678	Polson Park	Asco	5	5
88888	23456	Brampton	Larriott	4	5
77777	56789	Byron	Star co.	2	5
88888	56789	Bostwick	Star co.	2	5
22222	45678	Inner Harbour	Asco	3	5
55555	34567	West Vancouver	Skye Hotels	3	5
33333	45678	Hillendale	Asco	3	5
11111	34567	Burnaby	Skye Hotels	3	5
55555	12345	Barrhaven	Milton	4	5
22222	12345	Barrhaven	Milton	5	5
33333	12345	South Keys	Milton	5	5
55555	56789	Oakridge	Star co.	5	5
22222	56789	Lambeth	Star co.	5	5
11111	23456	Scarborough	Larriott	2	5
10111	56789	Summerside	Star co.	3	5
77777	23456	York	Larriott	2	5
88888	12345	Gloucester	Milton	3	5
55555	23456	Scarborough	Larriott	4	5
88888	34567	Burnaby	Skye Hotels	5	5
99999	45678	Reddendale	Asco	4	5
44444	34567	Surrey	Skye Hotels	2	5
55555	45678	Glenburnie	Asco	2	5
66666	12345	Orleans	Milton	5	5
\.


--
-- TOC entry 4987 (class 0 OID 33709)
-- Dependencies: 228
-- Data for Name: hotel_chain; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) FROM stdin;
12345	Milton	8
23456	Larriott	9
34567	Skye Hotels	8
45678	Asco	10
56789	Star co.	11
\.


--
-- TOC entry 4988 (class 0 OID 33714)
-- Dependencies: 229
-- Data for Name: hotel_email; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.hotel_email (chain_id, hotel_id, h_email) FROM stdin;
45678	10111	hotel10@asco
56789	10111	hotel10@star
56789	11000	hotel11@star
12345	11111	hotel1@milton
23456	11111	hotel1@larriott
34567	11111	hotel1@skye
45678	11111	hotel1@asco
56789	11111	hotel1@star
12345	22222	hotel2@milton
23456	22222	hotel2@larriott
34567	22222	hotel2@skye
45678	22222	hotel2@asco
56789	22222	hotel2@star
12345	33333	hotel3@milton
23456	33333	hotel3@larriott
34567	33333	hotel3@skye
45678	33333	hotel3@asco
56789	33333	hotel3@star
12345	44444	hotel4@milton
23456	44444	hotel4@larriott
34567	44444	hotel4@skye
45678	44444	hotel4@asco
56789	44444	hotel4@star
12345	55555	hotel5@milton
23456	55555	hotel5@larriott
34567	55555	hotel5@skye
45678	55555	hotel5@asco
56789	55555	hotel5@star
12345	66666	hotel6@milton
23456	66666	hotel6@larriott
34567	66666	hotel6@skye
45678	66666	hotel6@asco
56789	66666	hotel6@star
12345	77777	hotel7@milton
23456	77777	hotel7@larriott
34567	77777	hotel7@skye
45678	77777	hotel7@asco
56789	77777	hotel7@star
12345	88888	hotel8@milton
23456	88888	hotel8@larriott
34567	88888	hotel8@skye
45678	88888	hotel8@asco
56789	88888	hotel8@star
23456	99999	hotel9@larriott
45678	99999	hotel9@asco
56789	99999	hotel9@star
\.


--
-- TOC entry 4989 (class 0 OID 33719)
-- Dependencies: 230
-- Data for Name: hotel_phone; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) FROM stdin;
45678	10111	1010102794
56789	10111	1010101821
56789	11000	1100116936
12345	11111	1122331528
23456	11111	1122331027
34567	11111	1122336460
45678	11111	1122335459
56789	11111	1122331359
12345	22222	2233445668
23456	22222	2233442924
34567	22222	2233445460
45678	22222	2233442976
56789	22222	2233446521
12345	33333	3344553853
23456	33333	3344553524
34567	33333	3344555940
45678	33333	3344553182
56789	33333	3344552077
12345	44444	4455663752
23456	44444	4455661448
34567	44444	4455669127
45678	44444	4455662079
56789	44444	4455663155
12345	55555	5566776738
23456	55555	5566771081
34567	55555	5566775253
45678	55555	5566774945
56789	55555	5566776720
12345	66666	6677884802
23456	66666	6677889427
34567	66666	6677886682
45678	66666	6677887697
56789	66666	6677886420
12345	77777	7788995365
23456	77777	7788991421
34567	77777	7788991942
45678	77777	7788994220
56789	77777	7788992024
12345	88888	8899003013
23456	88888	8899003125
34567	88888	8899007554
45678	88888	8899009919
56789	88888	8899003378
23456	99999	9900114652
45678	99999	9900119780
56789	99999	9900115471
\.


--
-- TOC entry 4990 (class 0 OID 33722)
-- Dependencies: 231
-- Data for Name: manager; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.manager (ssn, "position", hotel_id, chain_id, first_name, last_name, address) FROM stdin;
\.


--
-- TOC entry 4991 (class 0 OID 33727)
-- Dependencies: 232
-- Data for Name: payment; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.payment (card_number, cvv, expiry_date, customer_id) FROM stdin;
\.


--
-- TOC entry 4992 (class 0 OID 33732)
-- Dependencies: 233
-- Data for Name: renting; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.renting (start_date, end_date, room_num, customer_id, employee_ssn, hotel_id, chain_id) FROM stdin;
\.


--
-- TOC entry 4993 (class 0 OID 33737)
-- Dependencies: 234
-- Data for Name: room; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) FROM stdin;
1	sea	t	presidential suite	1200	44444	45678
2	mountain	t	suite	395	44444	45678
3	mountain	t	deluxe room	170	44444	45678
4	mountain	f	double room	115	44444	45678
5	mountain	f	single room	70	44444	45678
1	none	f	single room	50	55555	34567
2	sea	f	double room	100	55555	34567
3	sea	f	deluxe room	150	55555	34567
4	mountain	f	family room	200	55555	34567
5	mountain	t	suite	375	55555	34567
1	none	f	single room	50	33333	45678
2	none	f	double room	100	33333	45678
3	sea	t	family room	205	33333	45678
4	sea	t	deluxe room	155	33333	45678
5	sea	t	suite	375	33333	45678
5	none	t	family room	200	77777	56789
1	sea	f	single room	50	66666	56789
3	sea	t	deluxe room	150	99999	56789
1	none	f	single room	50	77777	56789
1	none	f	single room	50	44444	56789
1	sea	f	single room	50	99999	56789
2	mountain	f	double room	100	10111	56789
4	none	t	suite	375	44444	56789
5	sea	t	family room	200	33333	56789
4	mountain	t	deluxe room	150	22222	56789
5	sea	t	family room	200	99999	56789
2	sea	f	double room	100	99999	56789
3	mountain	t	deluxe room	150	88888	56789
1	mountain	f	single room	50	77777	45678
2	none	f	double room	95	77777	45678
3	mountain	f	deluxe room	150	77777	45678
4	none	t	family room	195	77777	45678
5	mountain	f	suite	375	77777	45678
1	none	f	single room	45	66666	45678
2	sea	f	double room	105	66666	45678
3	none	t	deluxe room	150	66666	45678
4	sea	t	family room	200	66666	45678
5	sea	t	suite	375	66666	45678
1	mountain	f	single room	65	77777	34567
2	mountain	f	double room	115	77777	34567
3	mountain	t	deluxe room	165	77777	34567
4	mountain	t	family room	215	77777	34567
5	mountain	t	suite	1105	77777	34567
1	sea	t	suite	330	55555	45678
2	none	f	family room	160	55555	45678
3	none	f	deluxe room	110	55555	45678
4	none	f	double room	65	55555	45678
5	none	f	single room	25	55555	45678
2	sea	f	double room	100	11000	56789
1	none	f	single room	45	99999	45678
2	sea	f	double room	95	99999	45678
4	none	t	family room	195	99999	45678
5	sea	f	suite	370	99999	45678
1	none	f	single room	60	33333	34567
2	sea	f	double room	110	33333	34567
3	sea	t	deluxe room	160	33333	34567
4	sea	t	suite	385	33333	34567
5	mountain	t	presidential suite	1100	33333	34567
1	none	f	single room	50	66666	34567
2	none	f	double room	100	66666	34567
3	none	f	deluxe room	150	66666	34567
4	sea	t	family room	210	66666	34567
5	sea	f	suite	380	66666	34567
1	none	f	single room	45	10111	45678
2	none	f	double room	95	10111	45678
3	sea	f	deluxe room	150	10111	45678
4	none	t	family room	200	10111	45678
5	sea	t	suite	375	10111	45678
1	none	f	single room	60	88888	45678
2	sea	t	deluxe room	160	88888	45678
3	sea	t	family room	215	88888	45678
4	mountain	t	suite	385	88888	45678
5	mountain	t	presidential suite	1100	88888	45678
1	none	f	single room	30	44444	34567
2	none	f	double room	80	44444	34567
3	none	f	deluxe room	130	44444	34567
4	sea	t	family room	180	44444	34567
5	sea	t	suite	355	44444	34567
1	mountain	f	suite	370	22222	45678
2	none	t	family room	200	22222	45678
3	mountain	f	deluxe room	150	22222	45678
4	none	f	double room	100	22222	45678
5	mountain	f	single room	50	22222	45678
1	sea	f	single room	65	11111	45678
2	none	f	double room	115	11111	45678
3	sea	t	family room	210	11111	45678
4	sea	t	suite	390	11111	45678
5	mountain	f	presidential suite	1110	11111	45678
1	mountain	t	suite	995	22222	34567
2	none	f	family room	195	22222	34567
3	mountain	f	deluxe room	145	22222	34567
4	none	f	double room	95	22222	34567
5	mountain	f	single room	45	22222	34567
1	sea	t	suite	380	11111	34567
2	sea	t	family room	205	11111	34567
3	sea	f	deluxe room	155	11111	34567
4	none	f	double room	105	11111	34567
5	none	f	single room	55	11111	34567
1	sea	f	single room	60	88888	34567
2	none	f	double room	110	88888	34567
3	sea	t	deluxe room	160	88888	34567
4	none	t	family room	210	88888	34567
5	sea	t	presidential suite	1100	88888	34567
4	sea	t	deluxe room	150	33333	56789
1	mountain	f	single room	50	22222	56789
1	mountain	f	single room	50	55555	56789
5	mountain	t	family room	200	22222	56789
5	mountain	t	family room	200	55555	56789
5	none	t	family room	200	44444	56789
2	sea	f	double room	100	33333	56789
3	mountain	t	presidential suite	1000	22222	56789
1	mountain	f	single room	50	10111	56789
4	mountain	t	suite	375	55555	56789
2	mountain	f	double room	100	55555	56789
1	sea	f	single room	50	11000	56789
3	none	t	presidential suite	1000	11111	56789
4	sea	t	suite	375	11000	56789
1	none	f	single room	50	11111	56789
5	none	t	family room	200	11111	56789
3	mountain	t	presidential suite	1000	10111	56789
4	sea	t	suite	375	99999	56789
5	mountain	t	family room	200	88888	56789
3	none	t	deluxe room	150	77777	56789
1	mountain	f	single room	50	88888	56789
2	mountain	f	double room	100	22222	56789
5	mountain	t	family room	200	10111	56789
2	sea	f	double room	100	66666	56789
4	none	t	suite	375	77777	56789
4	none	t	deluxe room	150	11111	56789
2	none	f	double room	100	44444	56789
4	sea	t	deluxe room	150	66666	56789
3	sea	t	deluxe room	150	11000	56789
2	none	f	double room	100	77777	56789
3	sea	t	presidential suite	1000	66666	56789
3	sea	t	presidential suite	1000	33333	56789
2	mountain	f	double room	100	88888	56789
4	mountain	t	suite	375	88888	56789
5	sea	t	family room	200	11000	56789
5	sea	t	family room	200	66666	56789
3	none	t	deluxe room	150	44444	56789
1	sea	f	single room	50	33333	56789
2	none	f	double room	100	11111	56789
3	mountain	t	deluxe room	150	55555	56789
4	mountain	t	deluxe room	150	10111	56789
1	mountain	f	single room	50	11111	12345
1	sea	f	single room	60	11111	23456
1	none	f	single room	50	22222	12345
1	none	f	single room	50	22222	23456
1	none	f	double room	110	33333	12345
1	mountain	f	double room	100	44444	12345
1	sea	f	double room	100	44444	23456
1	none	f	double room	80	55555	12345
1	none	f	double room	80	55555	23456
1	none	f	double room	100	66666	12345
1	none	f	double room	110	66666	23456
1	none	f	double room	110	77777	12345
1	mountain	f	double room	100	77777	23456
1	sea	f	double room	100	88888	12345
1	mountain	f	double room	100	88888	23456
1	sea	f	double room	110	99999	23456
2	sea	t	deluxe room	130	11111	12345
2	mountain	f	deluxe	130	11111	23456
2	mountain	t	deluxe room	150	22222	12345
2	mountain	t	deluxe room	130	22222	23456
2	mountain	t	deluxe room	160	33333	12345
2	sea	t	deluxe room	160	33333	23456
2	mountain	t	deluxe room	160	44444	12345
2	sea	t	deluxe room	130	44444	23456
2	mountain	t	deluxe room	160	55555	12345
2	sea	t	deluxe room	160	55555	23456
2	sea	t	deluxe room	130	66666	12345
2	mountain	t	deluxe room	150	66666	23456
2	sea	t	deluxe room	150	77777	12345
2	mountain	t	deluxe room	130	77777	23456
2	none	t	deluxe room	130	88888	12345
2	none	t	deluxe room	150	88888	23456
2	mountain	t	deluxe room	160	99999	23456
3	none	t	deluxe room	150	11111	12345
3	none	t	deluxe room	160	11111	23456
3	none	t	deluxe room	150	22222	12345
3	none	t	deluxe room	150	22222	23456
3	mountain	t	family room	180	33333	12345
3	sea	t	family room	180	33333	23456
3	sea	t	family room	200	44444	12345
3	sea	t	family room	200	44444	23456
3	none	f	family room	180	55555	12345
3	none	f	family room	180	55555	23456
3	mountain	f	family room	200	66666	12345
3	mountain	f	family room	200	66666	23456
3	sea	t	family room	210	77777	12345
3	sea	t	family room	210	77777	23456
3	sea	t	family room	210	88888	12345
3	mountain	t	family room	210	88888	23456
3	mountain	t	family room	210	99999	23456
3	sea	f	deluxe room	150	99999	45678
4	mountain	t	family room	210	11111	12345
4	sea	t	family room	210	11111	23456
4	sea	t	suite	355	22222	12345
4	sea	t	suite	355	22222	23456
4	mountain	t	suite	355	33333	12345
4	sea	t	suite	355	33333	23456
4	sea	t	suite	375	44444	12345
1	none	f	double room	110	33333	23456
4	sea	t	suite	375	44444	23456
4	mountain	t	suite	375	55555	12345
4	sea	t	suite	385	55555	23456
4	mountain	t	suite	375	66666	12345
4	sea	t	suite	375	66666	23456
4	sea	t	suite	385	77777	12345
4	sea	t	suite	375	77777	23456
4	none	f	single room	30	88888	12345
4	none	f	single room	30	88888	23456
4	none	f	single  room	30	99999	23456
5	none	f	double room	100	11111	12345
5	sea	f	double room	110	11111	23456
5	none	f	double room	80	22222	12345
5	none	f	double room	80	22222	23456
5	mountain	f	single room	60	33333	12345
5	mountain	f	single room	60	33333	23456
5	mountain	t	presidential suite	990	44444	12345
5	sea	t	presidential suite	990	44444	23456
5	sea	t	presidential suite	990	55555	12345
5	sea	t	presidential suite	990	55555	23456
5	mountain	t	presidential suite	990	66666	12345
5	mountain	t	presidential suite	990	66666	23456
5	sea	t	presidential suite	1000	77777	12345
5	sea	t	presidential suite	1000	77777	23456
5	sea	t	presidential suite	1000	88888	12345
5	sea	t	presidential suite	1000	88888	23456
5	sea	t	presidential suite	1100	99999	23456
\.


--
-- TOC entry 4994 (class 0 OID 33742)
-- Dependencies: 235
-- Data for Name: room_amenity; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.room_amenity (room_num, hotel_id, chain_id, amenity) FROM stdin;
\.


--
-- TOC entry 4995 (class 0 OID 33747)
-- Dependencies: 236
-- Data for Name: room_damage; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.room_damage (room_num, hotel_id, chain_id, damage) FROM stdin;
\.


--
-- TOC entry 4776 (class 2606 OID 33753)
-- Name: archive archive_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.archive
    ADD CONSTRAINT archive_id PRIMARY KEY (archive_id);


--
-- TOC entry 4778 (class 2606 OID 33755)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_start_date, room_num, hotel_id, chain_id);


--
-- TOC entry 4780 (class 2606 OID 33757)
-- Name: chain_address c_address; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT c_address PRIMARY KEY (c_address, chain_id);


--
-- TOC entry 4782 (class 2606 OID 33759)
-- Name: chain_email c_email; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT c_email PRIMARY KEY (c_email, chain_id);


--
-- TOC entry 4784 (class 2606 OID 33761)
-- Name: chain_number c_phone_number; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT c_phone_number PRIMARY KEY (c_phone_number, chain_id);


--
-- TOC entry 4796 (class 2606 OID 33763)
-- Name: hotel_chain chain_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_chain
    ADD CONSTRAINT chain_id PRIMARY KEY (chain_id);


--
-- TOC entry 4786 (class 2606 OID 33765)
-- Name: customer customer_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.customer
    ADD CONSTRAINT customer_id PRIMARY KEY (customer_id);


--
-- TOC entry 4788 (class 2606 OID 33767)
-- Name: employee employee_ssn; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_ssn PRIMARY KEY (employee_ssn);


--
-- TOC entry 4798 (class 2606 OID 33769)
-- Name: hotel_email h_email_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT h_email_pk PRIMARY KEY (h_email, chain_id, hotel_id);


--
-- TOC entry 4800 (class 2606 OID 33771)
-- Name: hotel_phone h_phone_number_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT h_phone_number_pk PRIMARY KEY (h_phone_number, chain_id, hotel_id);


--
-- TOC entry 4790 (class 2606 OID 33773)
-- Name: has has_pkey; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_pkey PRIMARY KEY (booking_start_date, room_num, hotel_id, chain_id);


--
-- TOC entry 4792 (class 2606 OID 33775)
-- Name: holds holds_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.holds
    ADD CONSTRAINT holds_pk PRIMARY KEY (booking_start_date, renting_start_date, archive_id);


--
-- TOC entry 4794 (class 2606 OID 33777)
-- Name: hotel hotel_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_pk PRIMARY KEY (hotel_id, chain_id);


--
-- TOC entry 4802 (class 2606 OID 33779)
-- Name: manager manager_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.manager
    ADD CONSTRAINT manager_pk PRIMARY KEY (ssn, hotel_id, chain_id);


--
-- TOC entry 4804 (class 2606 OID 33781)
-- Name: payment payment_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (card_number);


--
-- TOC entry 4806 (class 2606 OID 33783)
-- Name: renting renting_pkey; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_pkey PRIMARY KEY (start_date, room_num, hotel_id, chain_id);


--
-- TOC entry 4810 (class 2606 OID 33785)
-- Name: room_amenity room_amenity_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room_amenity
    ADD CONSTRAINT room_amenity_pk PRIMARY KEY (hotel_id, chain_id, room_num, amenity);


--
-- TOC entry 4812 (class 2606 OID 33787)
-- Name: room_damage room_damage_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room_damage
    ADD CONSTRAINT room_damage_pk PRIMARY KEY (room_num, chain_id, hotel_id, damage);


--
-- TOC entry 4808 (class 2606 OID 33789)
-- Name: room room_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_pk PRIMARY KEY (room_num, chain_id, hotel_id);


--
-- TOC entry 4813 (class 2606 OID 33790)
-- Name: booking booking_customer_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4814 (class 2606 OID 33795)
-- Name: booking booking_room_num_hotel_id_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);


--
-- TOC entry 4815 (class 2606 OID 33800)
-- Name: chain_address chain_address_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT chain_address_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4816 (class 2606 OID 33805)
-- Name: chain_email chain_email_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT chain_email_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4817 (class 2606 OID 33810)
-- Name: chain_number chain_number_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT chain_number_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4818 (class 2606 OID 33815)
-- Name: employee employee_hotel_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);


--
-- TOC entry 4819 (class 2606 OID 33820)
-- Name: has has_card_number_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_card_number_fkey FOREIGN KEY (card_number) REFERENCES relational_schema.payment(card_number);


--
-- TOC entry 4820 (class 2606 OID 33825)
-- Name: has has_customer_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4821 (class 2606 OID 33830)
-- Name: has has_room_num_hotel_id_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);


--
-- TOC entry 4822 (class 2606 OID 33835)
-- Name: hotel hotel_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_chain_id_fkey FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4823 (class 2606 OID 33840)
-- Name: hotel_email hotel_email_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- TOC entry 4824 (class 2606 OID 33845)
-- Name: hotel_phone hotel_phone_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- TOC entry 4825 (class 2606 OID 33850)
-- Name: payment payment_customer_customer_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_customer_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4826 (class 2606 OID 33855)
-- Name: renting renting_customer_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4827 (class 2606 OID 33860)
-- Name: renting renting_employee_ssn_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_employee_ssn_fkey FOREIGN KEY (employee_ssn) REFERENCES relational_schema.employee(employee_ssn);


--
-- TOC entry 4828 (class 2606 OID 33865)
-- Name: renting renting_room_num_hotel_id_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);


--
-- TOC entry 4829 (class 2606 OID 33870)
-- Name: room room_hotel_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-03-31 12:47:32

--
-- PostgreSQL database dump complete
--

