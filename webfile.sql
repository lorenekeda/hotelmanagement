--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.4 (Homebrew)

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
-- Name: relational_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA relational_schema;


ALTER SCHEMA relational_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: archive; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.archive (
    archive_id integer NOT NULL
);


ALTER TABLE relational_schema.archive OWNER TO postgres;

--
-- Name: booking; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.booking (
    booking_start_date character varying NOT NULL,
    booking_end_date character varying,
    room_num integer,
    customer_id character varying,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);


ALTER TABLE relational_schema.booking OWNER TO postgres;

--
-- Name: chain_address; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_address (
    chain_id integer NOT NULL,
    c_address character varying NOT NULL
);


ALTER TABLE relational_schema.chain_address OWNER TO postgres;

--
-- Name: chain_email; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_email (
    chain_id integer NOT NULL,
    c_email character varying NOT NULL
);


ALTER TABLE relational_schema.chain_email OWNER TO postgres;

--
-- Name: chain_number; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_number (
    chain_id integer NOT NULL,
    c_phone_number integer NOT NULL
);


ALTER TABLE relational_schema.chain_number OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.customer (
    customer_id character varying NOT NULL,
    registration_date character varying,
    first_name character varying,
    last_name character varying,
    id_type character varying,
    address character varying
);


ALTER TABLE relational_schema.customer OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.employee (
    employee_ssn integer NOT NULL,
    first_name character varying,
    last_name character varying,
    address character varying,
    "position" character varying,
    hotel_id integer,
    chain_id integer
);


ALTER TABLE relational_schema.employee OWNER TO postgres;

--
-- Name: holds; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.holds (
    archive_id integer NOT NULL,
    renting_start_date character varying NOT NULL,
    booking_start_date character varying NOT NULL
);


ALTER TABLE relational_schema.holds OWNER TO postgres;

--
-- Name: hotel; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel (
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL,
    address character varying,
    email character varying,
    name character varying,
    rating integer,
    phone_number integer,
    num_of_room character varying
);


ALTER TABLE relational_schema.hotel OWNER TO postgres;

--
-- Name: hotel_address; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_address (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_address character varying NOT NULL
);


ALTER TABLE relational_schema.hotel_address OWNER TO postgres;

--
-- Name: hotel_chain; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_chain (
    chain_id integer NOT NULL,
    chain_name character varying,
    num_of_hotel integer
);


ALTER TABLE relational_schema.hotel_chain OWNER TO postgres;

--
-- Name: hotel_email; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_email (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_email character varying NOT NULL
);


ALTER TABLE relational_schema.hotel_email OWNER TO postgres;

--
-- Name: hotel_phone; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_phone (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_phone_number integer NOT NULL
);


ALTER TABLE relational_schema.hotel_phone OWNER TO postgres;

--
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
-- Name: renting; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.renting (
    start_date character varying NOT NULL,
    end_date character varying,
    room_num integer,
    customer_id character varying,
    employee_ssn integer,
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL
);


ALTER TABLE relational_schema.renting OWNER TO postgres;

--
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
-- Data for Name: archive; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.archive (archive_id) FROM stdin;
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.booking (booking_start_date, booking_end_date, room_num, customer_id, hotel_id, chain_id) FROM stdin;
\.


--
-- Data for Name: chain_address; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.chain_address (chain_id, c_address) FROM stdin;
\.


--
-- Data for Name: chain_email; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.chain_email (chain_id, c_email) FROM stdin;
\.


--
-- Data for Name: chain_number; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.chain_number (chain_id, c_phone_number) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.customer (customer_id, registration_date, first_name, last_name, id_type, address) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.employee (employee_ssn, first_name, last_name, address, "position", hotel_id, chain_id) FROM stdin;
\.


--
-- Data for Name: holds; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.holds (archive_id, renting_start_date, booking_start_date) FROM stdin;
\.


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) FROM stdin;
11111	12345	Kanata	hotel1@milton	Milton	4	112233	5
33333	56789	River Bend	hotel3@star	Star co.	4	334455	5
44444	45678	Gardiners	hotel4@asco	Asco	5	445566	5
99999	56789	River Bend	hotel9@star	Star co.	5	990011	5
66666	56789	Stoneybrook	hotel6@star	Star co.	5	667788	5
77777	45678	Westwoods	hotel7@asco	Asco	4	778899	5
44444	12345	Orleans	hotel4@milton	Milton	3	445566	5
33333	34567	Richmond	hotel3@skye	Skye Hotels	5	334455	5
66666	34567	North Vancouver	hotel6@skye	Skye Hotels	4	667788	5
10111	45678	Alwington	hotel10@asco	Asco	3	101010	5
99999	23456	Etobicoke	hotel9@larriott	Larriott	5	990011	5
66666	23456	Markham	hotel6@larriott	Larriott	1	667788	5
11111	45678	Alwington	hotel1@asco	Asco	5	112233	5
22222	23456	Mississauga	hotel2@larriott	Larriott	4	223344	5
77777	12345	Stittsville	hotel7@milton	Milton	2	778899	5
33333	23456	Markham	hotel3@larriott	Larriott	5	334455	5
11111	56789	Byron	hotel1@star	Star co.	3	112233	5
22222	34567	Surrey	hotel2@skye	Skye Hotels	4	223344	5
44444	56789	Summerside	hotel4@star	Star co.	4	445566	5
66666	45678	Inner Harbour	hotel6@asco	Asco	4	667788	5
77777	34567	Richmond	hotel7@skye	Skye Hotels	5	778899	5
11000	56789	Blackfriars	hotel11@star	Star co.	4	110011	5
44444	23456	Vaughan	hotel4@larriott	Larriott	3	445566	5
88888	45678	Polson Park	hotel8@asco	Asco	5	889900	5
88888	23456	Brampton	hotel8@larriott	Larriott	4	889900	5
77777	56789	Byron	hotel7@star	Star co.	2	778899	5
88888	56789	Bostwick	hotel8@star	Star co.	2	889900	5
22222	45678	Inner Harbour	hotel2@asco	Asco	3	223344	5
55555	34567	West Vancouver	hotel5@skye	Skye Hotels	3	556677	5
33333	45678	Hillendale	hotel3@asco	Asco	3	334455	5
11111	34567	Burnaby	hotel1@skye	Skye Hotels	3	112233	5
55555	12345	Barrhaven	hotel5@milton	Milton	4	556677	5
22222	12345	Barrhaven	hotel2@milton	Milton	5	223344	5
33333	12345	South Keys	hotel3@milton	Milton	3	334455	5
55555	56789	Oakridge	hotel5@star	Star co.	3	556677	5
22222	56789	Lambeth	hotel2@star	Star co.	5	223344	5
11111	23456	Scarborough	hotel1@larriott	Larriott	2	112233	5
10111	56789	Summerside	hotel10@star	Star co.	3	101010	5
77777	23456	York	hotel7@larriott	Larriott	2	778899	5
88888	12345	Gloucester	hotel8@milton	Milton	3	889900	5
55555	23456	Scarborough	hotel5@larriott	Larriott	4	556677	5
88888	34567	Burnaby	hotel8@skye	Skye Hotels	5	889900	5
99999	45678	Reddendale	hotel9@asco	Asco	4	990011	5
44444	34567	Surrey	hotel4@skye	Skye Hotels	2	445566	5
55555	45678	Glenburnie	hotel5@asco	Asco	2	556677	5
66666	12345	Orleans	hotel6@milton	Milton	5	667788	5
\.


--
-- Data for Name: hotel_address; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.hotel_address (chain_id, hotel_id, h_address) FROM stdin;
\.


--
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
-- Data for Name: hotel_email; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.hotel_email (chain_id, hotel_id, h_email) FROM stdin;
\.


--
-- Data for Name: hotel_phone; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) FROM stdin;
\.


--
-- Data for Name: manager; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.manager (ssn, "position", hotel_id, chain_id, first_name, last_name, address) FROM stdin;
\.


--
-- Data for Name: renting; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.renting (start_date, end_date, room_num, customer_id, employee_ssn, chain_id, hotel_id) FROM stdin;
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) FROM stdin;
1	\N	\N	\N	\N	11111	12345
2	\N	\N	\N	\N	11111	12345
3	\N	\N	\N	\N	11111	12345
4	\N	\N	\N	\N	11111	12345
5	\N	\N	\N	\N	11111	12345
1	\N	\N	\N	\N	88888	12345
2	\N	\N	\N	\N	88888	12345
3	\N	\N	\N	\N	88888	12345
4	\N	\N	\N	\N	88888	12345
5	\N	\N	\N	\N	88888	12345
1	\N	\N	\N	\N	44444	45678
2	\N	\N	\N	\N	44444	45678
3	\N	\N	\N	\N	44444	45678
4	\N	\N	\N	\N	44444	45678
5	\N	\N	\N	\N	44444	45678
1	\N	\N	\N	\N	55555	12345
2	\N	\N	\N	\N	55555	12345
3	\N	\N	\N	\N	55555	12345
4	\N	\N	\N	\N	55555	12345
5	\N	\N	\N	\N	55555	12345
1	\N	\N	\N	\N	33333	12345
2	\N	\N	\N	\N	33333	12345
3	\N	\N	\N	\N	33333	12345
4	\N	\N	\N	\N	33333	12345
5	\N	\N	\N	\N	33333	12345
1	\N	\N	\N	\N	55555	34567
2	\N	\N	\N	\N	55555	34567
3	\N	\N	\N	\N	55555	34567
4	\N	\N	\N	\N	55555	34567
5	\N	\N	\N	\N	55555	34567
1	\N	\N	\N	\N	66666	12345
2	\N	\N	\N	\N	66666	12345
3	\N	\N	\N	\N	66666	12345
4	\N	\N	\N	\N	66666	12345
5	\N	\N	\N	\N	66666	12345
1	\N	\N	\N	\N	33333	45678
2	\N	\N	\N	\N	33333	45678
3	\N	\N	\N	\N	33333	45678
4	\N	\N	\N	\N	33333	45678
5	\N	\N	\N	\N	33333	45678
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
1	\N	\N	\N	\N	77777	45678
2	\N	\N	\N	\N	77777	45678
3	\N	\N	\N	\N	77777	45678
4	\N	\N	\N	\N	77777	45678
5	\N	\N	\N	\N	77777	45678
1	\N	\N	\N	\N	66666	45678
2	\N	\N	\N	\N	66666	45678
3	\N	\N	\N	\N	66666	45678
4	\N	\N	\N	\N	66666	45678
5	\N	\N	\N	\N	66666	45678
1	\N	\N	\N	\N	44444	12345
2	\N	\N	\N	\N	44444	12345
3	\N	\N	\N	\N	44444	12345
4	\N	\N	\N	\N	44444	12345
5	\N	\N	\N	\N	44444	12345
1	\N	\N	\N	\N	55555	23456
2	\N	\N	\N	\N	55555	23456
3	\N	\N	\N	\N	55555	23456
4	\N	\N	\N	\N	55555	23456
5	\N	\N	\N	\N	55555	23456
1	\N	\N	\N	\N	77777	34567
2	\N	\N	\N	\N	77777	34567
3	\N	\N	\N	\N	77777	34567
4	\N	\N	\N	\N	77777	34567
5	\N	\N	\N	\N	77777	34567
1	\N	\N	\N	\N	55555	45678
2	\N	\N	\N	\N	55555	45678
3	\N	\N	\N	\N	55555	45678
4	\N	\N	\N	\N	55555	45678
5	\N	\N	\N	\N	55555	45678
1	\N	\N	\N	\N	44444	23456
2	\N	\N	\N	\N	44444	23456
3	\N	\N	\N	\N	44444	23456
4	\N	\N	\N	\N	44444	23456
5	\N	\N	\N	\N	44444	23456
2	sea	f	double room	100	11000	56789
1	\N	\N	\N	\N	99999	45678
2	\N	\N	\N	\N	99999	45678
3	\N	\N	\N	\N	99999	45678
4	\N	\N	\N	\N	99999	45678
5	\N	\N	\N	\N	99999	45678
1	\N	\N	\N	\N	88888	23456
2	\N	\N	\N	\N	88888	23456
3	\N	\N	\N	\N	88888	23456
4	\N	\N	\N	\N	88888	23456
5	\N	\N	\N	\N	88888	23456
1	\N	\N	\N	\N	33333	34567
2	\N	\N	\N	\N	33333	34567
3	\N	\N	\N	\N	33333	34567
4	\N	\N	\N	\N	33333	34567
5	\N	\N	\N	\N	33333	34567
1	\N	\N	\N	\N	66666	34567
2	\N	\N	\N	\N	66666	34567
3	\N	\N	\N	\N	66666	34567
4	\N	\N	\N	\N	66666	34567
5	\N	\N	\N	\N	66666	34567
1	\N	\N	\N	\N	10111	45678
2	\N	\N	\N	\N	10111	45678
3	\N	\N	\N	\N	10111	45678
4	\N	\N	\N	\N	10111	45678
5	\N	\N	\N	\N	10111	45678
1	\N	\N	\N	\N	88888	45678
2	\N	\N	\N	\N	88888	45678
3	\N	\N	\N	\N	88888	45678
4	\N	\N	\N	\N	88888	45678
5	\N	\N	\N	\N	88888	45678
1	\N	\N	\N	\N	99999	23456
2	\N	\N	\N	\N	99999	23456
3	\N	\N	\N	\N	99999	23456
4	\N	\N	\N	\N	99999	23456
5	\N	\N	\N	\N	99999	23456
1	\N	\N	\N	\N	44444	34567
2	\N	\N	\N	\N	44444	34567
3	\N	\N	\N	\N	44444	34567
4	\N	\N	\N	\N	44444	34567
5	\N	\N	\N	\N	44444	34567
1	\N	\N	\N	\N	66666	23456
2	\N	\N	\N	\N	66666	23456
3	\N	\N	\N	\N	66666	23456
4	\N	\N	\N	\N	66666	23456
5	\N	\N	\N	\N	66666	23456
1	\N	\N	\N	\N	22222	45678
2	\N	\N	\N	\N	22222	45678
3	\N	\N	\N	\N	22222	45678
4	\N	\N	\N	\N	22222	45678
5	\N	\N	\N	\N	22222	45678
1	\N	\N	\N	\N	11111	45678
2	\N	\N	\N	\N	11111	45678
3	\N	\N	\N	\N	11111	45678
4	\N	\N	\N	\N	11111	45678
5	\N	\N	\N	\N	11111	45678
1	\N	\N	\N	\N	22222	23456
2	\N	\N	\N	\N	22222	23456
3	\N	\N	\N	\N	22222	23456
4	\N	\N	\N	\N	22222	23456
5	\N	\N	\N	\N	22222	23456
1	\N	\N	\N	\N	77777	12345
2	\N	\N	\N	\N	77777	12345
3	\N	\N	\N	\N	77777	12345
4	\N	\N	\N	\N	77777	12345
5	\N	\N	\N	\N	77777	12345
1	\N	\N	\N	\N	22222	34567
2	\N	\N	\N	\N	22222	34567
3	\N	\N	\N	\N	22222	34567
4	\N	\N	\N	\N	22222	34567
5	\N	\N	\N	\N	22222	34567
1	\N	\N	\N	\N	11111	34567
2	\N	\N	\N	\N	11111	34567
3	\N	\N	\N	\N	11111	34567
4	\N	\N	\N	\N	11111	34567
5	\N	\N	\N	\N	11111	34567
1	\N	\N	\N	\N	77777	23456
2	\N	\N	\N	\N	77777	23456
3	\N	\N	\N	\N	77777	23456
4	\N	\N	\N	\N	77777	23456
5	\N	\N	\N	\N	77777	23456
1	\N	\N	\N	\N	22222	12345
2	\N	\N	\N	\N	22222	12345
3	\N	\N	\N	\N	22222	12345
4	\N	\N	\N	\N	22222	12345
5	\N	\N	\N	\N	22222	12345
1	\N	\N	\N	\N	11111	23456
2	\N	\N	\N	\N	11111	23456
3	\N	\N	\N	\N	11111	23456
4	\N	\N	\N	\N	11111	23456
5	\N	\N	\N	\N	11111	23456
1	\N	\N	\N	\N	88888	34567
2	\N	\N	\N	\N	88888	34567
3	\N	\N	\N	\N	88888	34567
4	\N	\N	\N	\N	88888	34567
5	\N	\N	\N	\N	88888	34567
1	\N	\N	\N	\N	33333	23456
2	\N	\N	\N	\N	33333	23456
3	\N	\N	\N	\N	33333	23456
4	\N	\N	\N	\N	33333	23456
5	\N	\N	\N	\N	33333	23456
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
\.


--
-- Data for Name: room_amenity; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.room_amenity (room_num, hotel_id, chain_id, amenity) FROM stdin;
\.


--
-- Data for Name: room_damage; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

COPY relational_schema.room_damage (room_num, hotel_id, chain_id, damage) FROM stdin;
\.


--
-- Name: archive archive_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.archive
    ADD CONSTRAINT archive_id PRIMARY KEY (archive_id);


--
-- Name: booking booking_start_date; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_start_date PRIMARY KEY (booking_start_date, hotel_id, chain_id);


--
-- Name: chain_address c_address; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT c_address PRIMARY KEY (c_address, chain_id);


--
-- Name: chain_email c_email; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT c_email PRIMARY KEY (c_email, chain_id);


--
-- Name: chain_number c_phone_number; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT c_phone_number PRIMARY KEY (c_phone_number, chain_id);


--
-- Name: hotel_chain chain_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_chain
    ADD CONSTRAINT chain_id PRIMARY KEY (chain_id);


--
-- Name: customer customer_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.customer
    ADD CONSTRAINT customer_id PRIMARY KEY (customer_id);


--
-- Name: employee employee_ssn; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_ssn PRIMARY KEY (employee_ssn);


--
-- Name: hotel_address h_address_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_address
    ADD CONSTRAINT h_address_pk PRIMARY KEY (h_address, chain_id, hotel_id);


--
-- Name: hotel_email h_email_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT h_email_pk PRIMARY KEY (h_email, chain_id, hotel_id);


--
-- Name: hotel_phone h_phone_number_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT h_phone_number_pk PRIMARY KEY (h_phone_number, chain_id, hotel_id);


--
-- Name: holds holds_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.holds
    ADD CONSTRAINT holds_pk PRIMARY KEY (booking_start_date, renting_start_date, archive_id);


--
-- Name: hotel hotel_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_pk PRIMARY KEY (hotel_id, chain_id);


--
-- Name: manager manager_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.manager
    ADD CONSTRAINT manager_pk PRIMARY KEY (ssn, hotel_id, chain_id);


--
-- Name: renting renting_start_date; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_start_date PRIMARY KEY (start_date, hotel_id, chain_id);


--
-- Name: room_amenity room_amenity_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room_amenity
    ADD CONSTRAINT room_amenity_pk PRIMARY KEY (hotel_id, chain_id, room_num, amenity);


--
-- Name: room_damage room_damage_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room_damage
    ADD CONSTRAINT room_damage_pk PRIMARY KEY (room_num, chain_id, hotel_id, damage);


--
-- Name: room room_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_pk PRIMARY KEY (room_num, chain_id, hotel_id);


--
-- Name: booking booking_customer_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- Name: booking booking_room_chain_id_hotel_id_room_num_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_room_chain_id_hotel_id_room_num_fk FOREIGN KEY (chain_id, hotel_id, room_num) REFERENCES relational_schema.room(chain_id, hotel_id, room_num);


--
-- Name: chain_address chain_address_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT chain_address_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- Name: chain_email chain_email_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT chain_email_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- Name: chain_number chain_number_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT chain_number_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- Name: employee employee_hotel_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);


--
-- Name: hotel_address hotel_address_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_address
    ADD CONSTRAINT hotel_address_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- Name: hotel hotel_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_chain_id_fkey FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- Name: hotel_email hotel_email_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- Name: hotel_phone hotel_phone_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- Name: renting renting_customer_customer_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_customer_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- Name: renting renting_employee_employee_ssn_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_employee_employee_ssn_fk FOREIGN KEY (employee_ssn) REFERENCES relational_schema.employee(employee_ssn);


--
-- Name: renting renting_room_room_num_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_room_room_num_hotel_id_chain_id_fk FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);


--
-- Name: room room_hotel_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

