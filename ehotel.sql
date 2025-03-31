--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-30 19:28:46

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
-- TOC entry 5 (class 2615 OID 19970)
-- Name: relational_schema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA relational_schema;


ALTER SCHEMA relational_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 236 (class 1259 OID 20194)
-- Name: archive; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.archive (
    archive_id bigint NOT NULL,
    start_date date NOT NULL,
    room_num integer NOT NULL,
    hotel_id integer NOT NULL,
    chain_id integer NOT NULL
);


ALTER TABLE relational_schema.archive OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 20193)
-- Name: archive_archive_id_seq; Type: SEQUENCE; Schema: relational_schema; Owner: postgres
--

ALTER TABLE relational_schema.archive ALTER COLUMN archive_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME relational_schema.archive_archive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 19974)
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
-- TOC entry 219 (class 1259 OID 19979)
-- Name: chain_address; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_address (
    chain_id integer NOT NULL,
    c_address character varying NOT NULL
);


ALTER TABLE relational_schema.chain_address OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 19984)
-- Name: chain_email; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_email (
    chain_id integer NOT NULL,
    c_email character varying NOT NULL
);


ALTER TABLE relational_schema.chain_email OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19989)
-- Name: chain_number; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_number (
    chain_id integer NOT NULL,
    c_phone_number bigint NOT NULL
);


ALTER TABLE relational_schema.chain_number OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 19992)
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
-- TOC entry 223 (class 1259 OID 19997)
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
-- TOC entry 224 (class 1259 OID 20002)
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
-- TOC entry 225 (class 1259 OID 20012)
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
-- TOC entry 226 (class 1259 OID 20017)
-- Name: hotel_chain; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_chain (
    chain_id integer NOT NULL,
    chain_name character varying,
    num_of_hotel integer
);


ALTER TABLE relational_schema.hotel_chain OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20022)
-- Name: hotel_email; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_email (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_email character varying NOT NULL
);


ALTER TABLE relational_schema.hotel_email OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 20027)
-- Name: hotel_phone; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_phone (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_phone_number bigint NOT NULL
);


ALTER TABLE relational_schema.hotel_phone OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 20030)
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
-- TOC entry 230 (class 1259 OID 20035)
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
-- TOC entry 231 (class 1259 OID 20040)
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
-- TOC entry 232 (class 1259 OID 20045)
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
-- TOC entry 233 (class 1259 OID 20050)
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
-- TOC entry 234 (class 1259 OID 20055)
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
-- TOC entry 4980 (class 0 OID 20194)
-- Dependencies: 236
-- Data for Name: archive; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4962 (class 0 OID 19974)
-- Dependencies: 218
-- Data for Name: booking; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.booking (booking_start_date, booking_end_date, room_num, customer_id, hotel_id, chain_id) VALUES ('2025-03-30', '2025-04-02', 5, 'szhen025@uottawa.ca', 11111, 23456);


--
-- TOC entry 4963 (class 0 OID 19979)
-- Dependencies: 219
-- Data for Name: chain_address; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.chain_address (chain_id, c_address) VALUES (12345, 'Toronto');
INSERT INTO relational_schema.chain_address (chain_id, c_address) VALUES (23456, 'Ottawa');
INSERT INTO relational_schema.chain_address (chain_id, c_address) VALUES (34567, 'Hamilton');
INSERT INTO relational_schema.chain_address (chain_id, c_address) VALUES (45678, 'Kingston');
INSERT INTO relational_schema.chain_address (chain_id, c_address) VALUES (56789, 'Windsor');


--
-- TOC entry 4964 (class 0 OID 19984)
-- Dependencies: 220
-- Data for Name: chain_email; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.chain_email (chain_id, c_email) VALUES (12345, 'miltoninfo@milton');
INSERT INTO relational_schema.chain_email (chain_id, c_email) VALUES (23456, 'larriottinfo@larriott');
INSERT INTO relational_schema.chain_email (chain_id, c_email) VALUES (34567, 'skyeinfo@skye');
INSERT INTO relational_schema.chain_email (chain_id, c_email) VALUES (45678, 'ascoinfo@asco');
INSERT INTO relational_schema.chain_email (chain_id, c_email) VALUES (56789, 'starinfo@star');


--
-- TOC entry 4965 (class 0 OID 19989)
-- Dependencies: 221
-- Data for Name: chain_number; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.chain_number (chain_id, c_phone_number) VALUES (56789, 9078956789);
INSERT INTO relational_schema.chain_number (chain_id, c_phone_number) VALUES (12345, 5269312345);
INSERT INTO relational_schema.chain_number (chain_id, c_phone_number) VALUES (23456, 3779723456);
INSERT INTO relational_schema.chain_number (chain_id, c_phone_number) VALUES (34567, 7298934567);
INSERT INTO relational_schema.chain_number (chain_id, c_phone_number) VALUES (45678, 1717045678);


--
-- TOC entry 4966 (class 0 OID 19992)
-- Dependencies: 222
-- Data for Name: customer; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.customer (customer_id, registration_date, first_name, last_name, id_type, address, password) VALUES ('hi@gmail.com', 'Sun Mar 30 12:36:05 EDT 2025', 'sona', 'jio', 'Driver''s License', 'yu', 'hi');
INSERT INTO relational_schema.customer (customer_id, registration_date, first_name, last_name, id_type, address, password) VALUES ('szhen025@uottawa.ca', 'Sun Mar 30 13:04:55 EDT 2025', 'Sophia', 'Zheng', 'Driver''s License', '323 Somerset St E.', 'hi');
INSERT INTO relational_schema.customer (customer_id, registration_date, first_name, last_name, id_type, address, password) VALUES ('hi@outlook.com', 'Sun Mar 30 13:12:17 EDT 2025', 'hi', 'hi', 'SIN', 'hi', 'hi');
INSERT INTO relational_schema.customer (customer_id, registration_date, first_name, last_name, id_type, address, password) VALUES ('hi2email.com', 'Sun Mar 30 13:13:28 EDT 2025', 'hi', 'hi', 'Driver''s License', 'hi', 'hi');


--
-- TOC entry 4967 (class 0 OID 19997)
-- Dependencies: 223
-- Data for Name: employee; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.employee (employee_ssn, first_name, last_name, address, "position", hotel_id, chain_id, password) VALUES (123, 'john', 'smith', '123 street', 'emp', 11111, 12345, 'pass');


--
-- TOC entry 4968 (class 0 OID 20002)
-- Dependencies: 224
-- Data for Name: has; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4969 (class 0 OID 20012)
-- Dependencies: 225
-- Data for Name: hotel; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (11111, 12345, 'Kanata', 'Milton', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (33333, 56789, 'River Bend', 'Star co.', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (44444, 45678, 'Gardiners', 'Asco', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (99999, 56789, 'River Bend', 'Star co.', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (66666, 56789, 'Stoneybrook', 'Star co.', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (77777, 45678, 'Westwoods', 'Asco', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (44444, 12345, 'Orleans', 'Milton', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (33333, 34567, 'Richmond', 'Skye Hotels', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (66666, 34567, 'North Vancouver', 'Skye Hotels', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (10111, 45678, 'Alwington', 'Asco', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (99999, 23456, 'Etobicoke', 'Larriott', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (66666, 23456, 'Markham', 'Larriott', 1, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (11111, 45678, 'Alwington', 'Asco', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (22222, 23456, 'Mississauga', 'Larriott', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (77777, 12345, 'Stittsville', 'Milton', 2, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (33333, 23456, 'Markham', 'Larriott', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (11111, 56789, 'Byron', 'Star co.', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (22222, 34567, 'Surrey', 'Skye Hotels', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (44444, 56789, 'Summerside', 'Star co.', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (66666, 45678, 'Inner Harbour', 'Asco', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (77777, 34567, 'Richmond', 'Skye Hotels', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (11000, 56789, 'Blackfriars', 'Star co.', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (44444, 23456, 'Vaughan', 'Larriott', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (88888, 45678, 'Polson Park', 'Asco', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (88888, 23456, 'Brampton', 'Larriott', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (77777, 56789, 'Byron', 'Star co.', 2, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (88888, 56789, 'Bostwick', 'Star co.', 2, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (22222, 45678, 'Inner Harbour', 'Asco', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (55555, 34567, 'West Vancouver', 'Skye Hotels', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (33333, 45678, 'Hillendale', 'Asco', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (11111, 34567, 'Burnaby', 'Skye Hotels', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (55555, 12345, 'Barrhaven', 'Milton', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (22222, 12345, 'Barrhaven', 'Milton', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (33333, 12345, 'South Keys', 'Milton', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (55555, 56789, 'Oakridge', 'Star co.', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (22222, 56789, 'Lambeth', 'Star co.', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (11111, 23456, 'Scarborough', 'Larriott', 2, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (10111, 56789, 'Summerside', 'Star co.', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (77777, 23456, 'York', 'Larriott', 2, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (88888, 12345, 'Gloucester', 'Milton', 3, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (55555, 23456, 'Scarborough', 'Larriott', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (88888, 34567, 'Burnaby', 'Skye Hotels', 5, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (99999, 45678, 'Reddendale', 'Asco', 4, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (44444, 34567, 'Surrey', 'Skye Hotels', 2, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (55555, 45678, 'Glenburnie', 'Asco', 2, 5);
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, name, rating, num_of_room) VALUES (66666, 12345, 'Orleans', 'Milton', 5, 5);


--
-- TOC entry 4970 (class 0 OID 20017)
-- Dependencies: 226
-- Data for Name: hotel_chain; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (12345, 'Milton', 8);
INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (23456, 'Larriott', 9);
INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (34567, 'Skye Hotels', 8);
INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (45678, 'Asco', 10);
INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (56789, 'Star co.', 11);


--
-- TOC entry 4971 (class 0 OID 20022)
-- Dependencies: 227
-- Data for Name: hotel_email; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 10111, 'hotel10@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 10111, 'hotel10@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 11000, 'hotel11@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (12345, 11111, 'hotel1@milton');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (23456, 11111, 'hotel1@larriott');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (34567, 11111, 'hotel1@skye');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 11111, 'hotel1@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 11111, 'hotel1@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (12345, 22222, 'hotel2@milton');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (23456, 22222, 'hotel2@larriott');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (34567, 22222, 'hotel2@skye');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 22222, 'hotel2@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 22222, 'hotel2@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (12345, 33333, 'hotel3@milton');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (23456, 33333, 'hotel3@larriott');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (34567, 33333, 'hotel3@skye');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 33333, 'hotel3@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 33333, 'hotel3@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (12345, 44444, 'hotel4@milton');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (23456, 44444, 'hotel4@larriott');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (34567, 44444, 'hotel4@skye');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 44444, 'hotel4@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 44444, 'hotel4@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (12345, 55555, 'hotel5@milton');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (23456, 55555, 'hotel5@larriott');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (34567, 55555, 'hotel5@skye');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 55555, 'hotel5@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 55555, 'hotel5@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (12345, 66666, 'hotel6@milton');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (23456, 66666, 'hotel6@larriott');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (34567, 66666, 'hotel6@skye');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 66666, 'hotel6@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 66666, 'hotel6@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (12345, 77777, 'hotel7@milton');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (23456, 77777, 'hotel7@larriott');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (34567, 77777, 'hotel7@skye');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 77777, 'hotel7@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 77777, 'hotel7@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (12345, 88888, 'hotel8@milton');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (23456, 88888, 'hotel8@larriott');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (34567, 88888, 'hotel8@skye');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 88888, 'hotel8@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 88888, 'hotel8@star');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (23456, 99999, 'hotel9@larriott');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (45678, 99999, 'hotel9@asco');
INSERT INTO relational_schema.hotel_email (chain_id, hotel_id, h_email) VALUES (56789, 99999, 'hotel9@star');


--
-- TOC entry 4972 (class 0 OID 20027)
-- Dependencies: 228
-- Data for Name: hotel_phone; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 10111, 1010102794);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 10111, 1010101821);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 11000, 1100116936);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (12345, 11111, 1122331528);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (23456, 11111, 1122331027);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (34567, 11111, 1122336460);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 11111, 1122335459);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 11111, 1122331359);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (12345, 22222, 2233445668);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (23456, 22222, 2233442924);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (34567, 22222, 2233445460);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 22222, 2233442976);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 22222, 2233446521);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (12345, 33333, 3344553853);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (23456, 33333, 3344553524);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (34567, 33333, 3344555940);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 33333, 3344553182);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 33333, 3344552077);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (12345, 44444, 4455663752);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (23456, 44444, 4455661448);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (34567, 44444, 4455669127);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 44444, 4455662079);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 44444, 4455663155);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (12345, 55555, 5566776738);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (23456, 55555, 5566771081);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (34567, 55555, 5566775253);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 55555, 5566774945);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 55555, 5566776720);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (12345, 66666, 6677884802);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (23456, 66666, 6677889427);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (34567, 66666, 6677886682);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 66666, 6677887697);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 66666, 6677886420);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (12345, 77777, 7788995365);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (23456, 77777, 7788991421);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (34567, 77777, 7788991942);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 77777, 7788994220);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 77777, 7788992024);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (12345, 88888, 8899003013);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (23456, 88888, 8899003125);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (34567, 88888, 8899007554);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 88888, 8899009919);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 88888, 8899003378);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (23456, 99999, 9900114652);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (45678, 99999, 9900119780);
INSERT INTO relational_schema.hotel_phone (chain_id, hotel_id, h_phone_number) VALUES (56789, 99999, 9900115471);


--
-- TOC entry 4973 (class 0 OID 20030)
-- Dependencies: 229
-- Data for Name: manager; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4974 (class 0 OID 20035)
-- Dependencies: 230
-- Data for Name: payment; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4975 (class 0 OID 20040)
-- Dependencies: 231
-- Data for Name: renting; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4976 (class 0 OID 20045)
-- Dependencies: 232
-- Data for Name: room; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', true, 'presidential suite', 1200, 44444, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', true, 'suite', 395, 44444, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', true, 'deluxe room', 170, 44444, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', false, 'double room', 115, 44444, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', false, 'single room', 70, 44444, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 50, 55555, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', false, 'double room', 100, 55555, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', false, 'deluxe room', 150, 55555, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', false, 'family room', 200, 55555, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'suite', 375, 55555, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 50, 33333, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 100, 33333, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'family room', 205, 33333, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'deluxe room', 155, 33333, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'suite', 375, 33333, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'none', true, 'family room', 200, 77777, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'single room', 50, 66666, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'deluxe room', 150, 99999, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 50, 77777, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 50, 44444, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'single room', 50, 99999, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', false, 'double room', 100, 10111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', true, 'suite', 375, 44444, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'family room', 200, 33333, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'deluxe room', 150, 22222, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'family room', 200, 99999, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', false, 'double room', 100, 99999, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', true, 'deluxe room', 150, 88888, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'single room', 50, 77777, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 95, 77777, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', false, 'deluxe room', 150, 77777, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', true, 'family room', 195, 77777, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', false, 'suite', 375, 77777, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 45, 66666, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', false, 'double room', 105, 66666, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', true, 'deluxe room', 150, 66666, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'family room', 200, 66666, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'suite', 375, 66666, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'single room', 65, 77777, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', false, 'double room', 115, 77777, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', true, 'deluxe room', 165, 77777, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'family room', 215, 77777, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'suite', 1105, 77777, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', true, 'suite', 330, 55555, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'family room', 160, 55555, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', false, 'deluxe room', 110, 55555, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', false, 'double room', 65, 55555, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'none', false, 'single room', 25, 55555, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', false, 'double room', 100, 11000, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 45, 99999, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', false, 'double room', 95, 99999, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', true, 'family room', 195, 99999, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', false, 'suite', 370, 99999, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 60, 33333, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', false, 'double room', 110, 33333, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'deluxe room', 160, 33333, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 385, 33333, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'presidential suite', 1100, 33333, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 50, 66666, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 100, 66666, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', false, 'deluxe room', 150, 66666, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'family room', 210, 66666, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', false, 'suite', 380, 66666, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 45, 10111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 95, 10111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', false, 'deluxe room', 150, 10111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', true, 'family room', 200, 10111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'suite', 375, 10111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 60, 88888, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', true, 'deluxe room', 160, 88888, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'family room', 215, 88888, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'suite', 385, 88888, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'presidential suite', 1100, 88888, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 30, 44444, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 80, 44444, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', false, 'deluxe room', 130, 44444, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'family room', 180, 44444, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'suite', 355, 44444, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'suite', 370, 22222, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', true, 'family room', 200, 22222, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', false, 'deluxe room', 150, 22222, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', false, 'double room', 100, 22222, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', false, 'single room', 50, 22222, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'single room', 65, 11111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 115, 11111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'family room', 210, 11111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 390, 11111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', false, 'presidential suite', 1110, 11111, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', true, 'suite', 995, 22222, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'family room', 195, 22222, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', false, 'deluxe room', 145, 22222, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', false, 'double room', 95, 22222, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', false, 'single room', 45, 22222, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', true, 'suite', 380, 11111, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', true, 'family room', 205, 11111, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', false, 'deluxe room', 155, 11111, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', false, 'double room', 105, 11111, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'none', false, 'single room', 55, 11111, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'single room', 60, 88888, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 110, 88888, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'deluxe room', 160, 88888, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', true, 'family room', 210, 88888, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'presidential suite', 1100, 88888, 34567);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'deluxe room', 150, 33333, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'single room', 50, 22222, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'single room', 50, 55555, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'family room', 200, 22222, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'family room', 200, 55555, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'none', true, 'family room', 200, 44444, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', false, 'double room', 100, 33333, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', true, 'presidential suite', 1000, 22222, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'single room', 50, 10111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'suite', 375, 55555, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', false, 'double room', 100, 55555, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'single room', 50, 11000, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', true, 'presidential suite', 1000, 11111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 375, 11000, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 50, 11111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'none', true, 'family room', 200, 11111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', true, 'presidential suite', 1000, 10111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 375, 99999, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'family room', 200, 88888, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', true, 'deluxe room', 150, 77777, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'single room', 50, 88888, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', false, 'double room', 100, 22222, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'family room', 200, 10111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', false, 'double room', 100, 66666, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', true, 'suite', 375, 77777, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', true, 'deluxe room', 150, 11111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 100, 44444, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'deluxe room', 150, 66666, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'deluxe room', 150, 11000, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 100, 77777, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'presidential suite', 1000, 66666, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'presidential suite', 1000, 33333, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', false, 'double room', 100, 88888, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'suite', 375, 88888, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'family room', 200, 11000, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'family room', 200, 66666, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', true, 'deluxe room', 150, 44444, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'single room', 50, 33333, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', false, 'double room', 100, 11111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', true, 'deluxe room', 150, 55555, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'deluxe room', 150, 10111, 56789);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'single room', 50, 11111, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'single room', 60, 11111, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 50, 22222, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'single room', 50, 22222, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'double room', 110, 33333, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'double room', 100, 44444, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'double room', 100, 44444, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'double room', 80, 55555, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'double room', 80, 55555, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'double room', 100, 66666, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'double room', 110, 66666, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'double room', 110, 77777, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'double room', 100, 77777, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'double room', 100, 88888, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'mountain', false, 'double room', 100, 88888, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'sea', false, 'double room', 110, 99999, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', true, 'deluxe room', 130, 11111, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', false, 'deluxe', 130, 11111, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', true, 'deluxe room', 150, 22222, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', true, 'deluxe room', 130, 22222, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', true, 'deluxe room', 160, 33333, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', true, 'deluxe room', 160, 33333, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', true, 'deluxe room', 160, 44444, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', true, 'deluxe room', 130, 44444, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', true, 'deluxe room', 160, 55555, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', true, 'deluxe room', 160, 55555, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', true, 'deluxe room', 130, 66666, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', true, 'deluxe room', 150, 66666, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'sea', true, 'deluxe room', 150, 77777, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', true, 'deluxe room', 130, 77777, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', true, 'deluxe room', 130, 88888, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'none', true, 'deluxe room', 150, 88888, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (2, 'mountain', true, 'deluxe room', 160, 99999, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', true, 'deluxe room', 150, 11111, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', true, 'deluxe room', 160, 11111, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', true, 'deluxe room', 150, 22222, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', true, 'deluxe room', 150, 22222, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', true, 'family room', 180, 33333, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'family room', 180, 33333, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'family room', 200, 44444, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'family room', 200, 44444, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', false, 'family room', 180, 55555, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'none', false, 'family room', 180, 55555, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', false, 'family room', 200, 66666, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', false, 'family room', 200, 66666, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'family room', 210, 77777, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'family room', 210, 77777, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', true, 'family room', 210, 88888, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', true, 'family room', 210, 88888, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'mountain', true, 'family room', 210, 99999, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (3, 'sea', false, 'deluxe room', 150, 99999, 45678);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'family room', 210, 11111, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'family room', 210, 11111, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 355, 22222, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 355, 22222, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'suite', 355, 33333, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 355, 33333, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 375, 44444, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (1, 'none', false, 'double room', 110, 33333, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 375, 44444, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'suite', 375, 55555, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 385, 55555, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'mountain', true, 'suite', 375, 66666, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 375, 66666, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 385, 77777, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'sea', true, 'suite', 375, 77777, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', false, 'single room', 30, 88888, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', false, 'single room', 30, 88888, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (4, 'none', false, 'single  room', 30, 99999, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'none', false, 'double room', 100, 11111, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', false, 'double room', 110, 11111, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'none', false, 'double room', 80, 22222, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'none', false, 'double room', 80, 22222, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', false, 'single room', 60, 33333, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', false, 'single room', 60, 33333, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'presidential suite', 990, 44444, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'presidential suite', 990, 44444, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'presidential suite', 990, 55555, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'presidential suite', 990, 55555, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'presidential suite', 990, 66666, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'mountain', true, 'presidential suite', 990, 66666, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'presidential suite', 1000, 77777, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'presidential suite', 1000, 77777, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'presidential suite', 1000, 88888, 12345);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'presidential suite', 1000, 88888, 23456);
INSERT INTO relational_schema.room (room_num, view, extendable, capacity, price, hotel_id, chain_id) VALUES (5, 'sea', true, 'presidential suite', 1100, 99999, 23456);


--
-- TOC entry 4977 (class 0 OID 20050)
-- Dependencies: 233
-- Data for Name: room_amenity; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4978 (class 0 OID 20055)
-- Dependencies: 234
-- Data for Name: room_damage; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 235
-- Name: archive_archive_id_seq; Type: SEQUENCE SET; Schema: relational_schema; Owner: postgres
--

SELECT pg_catalog.setval('relational_schema.archive_archive_id_seq', 1, false);


--
-- TOC entry 4799 (class 2606 OID 20198)
-- Name: archive archive_pkey; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.archive
    ADD CONSTRAINT archive_pkey PRIMARY KEY (archive_id);


--
-- TOC entry 4765 (class 2606 OID 20063)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_start_date, room_num, hotel_id, chain_id);


--
-- TOC entry 4767 (class 2606 OID 20065)
-- Name: chain_address c_address; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT c_address PRIMARY KEY (c_address, chain_id);


--
-- TOC entry 4769 (class 2606 OID 20067)
-- Name: chain_email c_email; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT c_email PRIMARY KEY (c_email, chain_id);


--
-- TOC entry 4771 (class 2606 OID 20069)
-- Name: chain_number c_phone_number; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT c_phone_number PRIMARY KEY (c_phone_number, chain_id);


--
-- TOC entry 4781 (class 2606 OID 20071)
-- Name: hotel_chain chain_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_chain
    ADD CONSTRAINT chain_id PRIMARY KEY (chain_id);


--
-- TOC entry 4773 (class 2606 OID 20073)
-- Name: customer customer_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.customer
    ADD CONSTRAINT customer_id PRIMARY KEY (customer_id);


--
-- TOC entry 4775 (class 2606 OID 20075)
-- Name: employee employee_ssn; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_ssn PRIMARY KEY (employee_ssn);


--
-- TOC entry 4783 (class 2606 OID 20077)
-- Name: hotel_email h_email_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT h_email_pk PRIMARY KEY (h_email, chain_id, hotel_id);


--
-- TOC entry 4785 (class 2606 OID 20079)
-- Name: hotel_phone h_phone_number_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT h_phone_number_pk PRIMARY KEY (h_phone_number, chain_id, hotel_id);


--
-- TOC entry 4777 (class 2606 OID 20081)
-- Name: has has_pkey; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_pkey PRIMARY KEY (booking_start_date, room_num, hotel_id, chain_id);


--
-- TOC entry 4779 (class 2606 OID 20085)
-- Name: hotel hotel_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_pk PRIMARY KEY (hotel_id, chain_id);


--
-- TOC entry 4787 (class 2606 OID 20087)
-- Name: manager manager_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.manager
    ADD CONSTRAINT manager_pk PRIMARY KEY (ssn, hotel_id, chain_id);


--
-- TOC entry 4789 (class 2606 OID 20089)
-- Name: payment payment_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_pk PRIMARY KEY (card_number);


--
-- TOC entry 4791 (class 2606 OID 20091)
-- Name: renting renting_pkey; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_pkey PRIMARY KEY (start_date, room_num, hotel_id, chain_id);


--
-- TOC entry 4795 (class 2606 OID 20093)
-- Name: room_amenity room_amenity_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room_amenity
    ADD CONSTRAINT room_amenity_pk PRIMARY KEY (hotel_id, chain_id, room_num, amenity);


--
-- TOC entry 4797 (class 2606 OID 20095)
-- Name: room_damage room_damage_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room_damage
    ADD CONSTRAINT room_damage_pk PRIMARY KEY (room_num, chain_id, hotel_id, damage);


--
-- TOC entry 4793 (class 2606 OID 20097)
-- Name: room room_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_pk PRIMARY KEY (room_num, chain_id, hotel_id);


--
-- TOC entry 4800 (class 2606 OID 20098)
-- Name: booking booking_customer_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4801 (class 2606 OID 20103)
-- Name: booking booking_room_num_hotel_id_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);


--
-- TOC entry 4802 (class 2606 OID 20108)
-- Name: chain_address chain_address_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT chain_address_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4803 (class 2606 OID 20113)
-- Name: chain_email chain_email_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT chain_email_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4804 (class 2606 OID 20118)
-- Name: chain_number chain_number_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT chain_number_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4805 (class 2606 OID 20123)
-- Name: employee employee_hotel_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);


--
-- TOC entry 4806 (class 2606 OID 20128)
-- Name: has has_card_number_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_card_number_fkey FOREIGN KEY (card_number) REFERENCES relational_schema.payment(card_number);


--
-- TOC entry 4807 (class 2606 OID 20133)
-- Name: has has_customer_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4808 (class 2606 OID 20138)
-- Name: has has_room_num_hotel_id_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.has
    ADD CONSTRAINT has_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);


--
-- TOC entry 4809 (class 2606 OID 20143)
-- Name: hotel hotel_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_chain_id_fkey FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4810 (class 2606 OID 20148)
-- Name: hotel_email hotel_email_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- TOC entry 4811 (class 2606 OID 20153)
-- Name: hotel_phone hotel_phone_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- TOC entry 4812 (class 2606 OID 20158)
-- Name: payment payment_customer_customer_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.payment
    ADD CONSTRAINT payment_customer_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4813 (class 2606 OID 20163)
-- Name: renting renting_customer_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4814 (class 2606 OID 20168)
-- Name: renting renting_employee_ssn_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_employee_ssn_fkey FOREIGN KEY (employee_ssn) REFERENCES relational_schema.employee(employee_ssn);


--
-- TOC entry 4815 (class 2606 OID 20173)
-- Name: renting renting_room_num_hotel_id_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_room_num_hotel_id_chain_id_fkey FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);


--
-- TOC entry 4816 (class 2606 OID 20178)
-- Name: room room_hotel_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-03-30 19:28:46

--
-- PostgreSQL database dump complete
--

