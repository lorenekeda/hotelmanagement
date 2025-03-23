--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-03-23 00:21:47

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
-- TOC entry 5 (class 2615 OID 32823)
-- Name: relational_schema; Type: SCHEMA; Schema: -; Owner: postgres
--
DROP SCHEMA IF EXISTS relational_schema CASCADE;
CREATE SCHEMA relational_schema;


ALTER SCHEMA relational_schema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 32824)
-- Name: archive; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.archive (
    archive_id integer NOT NULL
);


ALTER TABLE relational_schema.archive OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32827)
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
-- TOC entry 220 (class 1259 OID 32832)
-- Name: chain_address; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_address (
    chain_id integer NOT NULL,
    c_address character varying NOT NULL
);


ALTER TABLE relational_schema.chain_address OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32837)
-- Name: chain_email; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_email (
    chain_id integer NOT NULL,
    c_email character varying NOT NULL
);


ALTER TABLE relational_schema.chain_email OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32842)
-- Name: chain_number; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.chain_number (
    chain_id integer NOT NULL,
    c_phone_number integer NOT NULL
);


ALTER TABLE relational_schema.chain_number OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32845)
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
-- TOC entry 224 (class 1259 OID 32850)
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
-- TOC entry 225 (class 1259 OID 32855)
-- Name: holds; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.holds (
    archive_id integer NOT NULL,
    renting_start_date character varying NOT NULL,
    booking_start_date character varying NOT NULL
);


ALTER TABLE relational_schema.holds OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 32860)
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
-- TOC entry 227 (class 1259 OID 32865)
-- Name: hotel_address; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_address (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_address character varying NOT NULL
);


ALTER TABLE relational_schema.hotel_address OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 32870)
-- Name: hotel_chain; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_chain (
    chain_id integer NOT NULL,
    chain_name character varying,
    num_of_hotel integer
);


ALTER TABLE relational_schema.hotel_chain OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32875)
-- Name: hotel_email; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_email (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_email character varying NOT NULL
);


ALTER TABLE relational_schema.hotel_email OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 32880)
-- Name: hotel_phone; Type: TABLE; Schema: relational_schema; Owner: postgres
--

CREATE TABLE relational_schema.hotel_phone (
    chain_id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_phone_number integer NOT NULL
);


ALTER TABLE relational_schema.hotel_phone OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 32883)
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
-- TOC entry 232 (class 1259 OID 32888)
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
-- TOC entry 233 (class 1259 OID 32893)
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
-- TOC entry 234 (class 1259 OID 32898)
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
-- TOC entry 235 (class 1259 OID 32903)
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
-- TOC entry 4958 (class 0 OID 32824)
-- Dependencies: 218
-- Data for Name: archive; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4959 (class 0 OID 32827)
-- Dependencies: 219
-- Data for Name: booking; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4960 (class 0 OID 32832)
-- Dependencies: 220
-- Data for Name: chain_address; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4961 (class 0 OID 32837)
-- Dependencies: 221
-- Data for Name: chain_email; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4962 (class 0 OID 32842)
-- Dependencies: 222
-- Data for Name: chain_number; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4963 (class 0 OID 32845)
-- Dependencies: 223
-- Data for Name: customer; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4964 (class 0 OID 32850)
-- Dependencies: 224
-- Data for Name: employee; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4965 (class 0 OID 32855)
-- Dependencies: 225
-- Data for Name: holds; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4966 (class 0 OID 32860)
-- Dependencies: 226
-- Data for Name: hotel; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (11111, 12345, 'Kanata', 'hotel1@milton', 'Milton', 4, 112233, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (33333, 56789, 'River Bend', 'hotel3@star', 'Star co.', 4, 334455, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (44444, 45678, 'Gardiners', 'hotel4@asco', 'Asco', 5, 445566, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (99999, 56789, 'River Bend', 'hotel9@star', 'Star co.', 5, 990011, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (66666, 56789, 'Stoneybrook', 'hotel6@star', 'Star co.', 5, 667788, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (77777, 45678, 'Westwoods', 'hotel7@asco', 'Asco', 4, 778899, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (44444, 12345, 'Orleans', 'hotel4@milton', 'Milton', 3, 445566, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (33333, 34567, 'Richmond', 'hotel3@skye', 'Skye Hotels', 5, 334455, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (66666, 34567, 'North Vancouver', 'hotel6@skye', 'Skye Hotels', 4, 667788, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (10111, 45678, 'Alwington', 'hotel10@asco', 'Asco', 3, 101010, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (99999, 23456, 'Etobicoke', 'hotel9@larriott', 'Larriott', 5, 990011, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (66666, 23456, 'Markham', 'hotel6@larriott', 'Larriott', 1, 667788, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (11111, 45678, 'Alwington', 'hotel1@asco', 'Asco', 5, 112233, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (22222, 23456, 'Mississauga', 'hotel2@larriott', 'Larriott', 4, 223344, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (77777, 12345, 'Stittsville', 'hotel7@milton', 'Milton', 2, 778899, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (33333, 23456, 'Markham', 'hotel3@larriott', 'Larriott', 5, 334455, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (11111, 56789, 'Byron', 'hotel1@star', 'Star co.', 3, 112233, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (22222, 34567, 'Surrey', 'hotel2@skye', 'Skye Hotels', 4, 223344, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (44444, 56789, 'Summerside', 'hotel4@star', 'Star co.', 4, 445566, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (66666, 45678, 'Inner Harbour', 'hotel6@asco', 'Asco', 4, 667788, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (77777, 34567, 'Richmond', 'hotel7@skye', 'Skye Hotels', 5, 778899, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (11000, 56789, 'Blackfriars', 'hotel11@star', 'Star co.', 4, 110011, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (44444, 23456, 'Vaughan', 'hotel4@larriott', 'Larriott', 3, 445566, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (88888, 45678, 'Polson Park', 'hotel8@asco', 'Asco', 5, 889900, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (88888, 23456, 'Brampton', 'hotel8@larriott', 'Larriott', 4, 889900, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (77777, 56789, 'Byron', 'hotel7@star', 'Star co.', 2, 778899, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (88888, 56789, 'Bostwick', 'hotel8@star', 'Star co.', 2, 889900, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (22222, 45678, 'Inner Harbour', 'hotel2@asco', 'Asco', 3, 223344, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (55555, 34567, 'West Vancouver', 'hotel5@skye', 'Skye Hotels', 3, 556677, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (33333, 45678, 'Hillendale', 'hotel3@asco', 'Asco', 3, 334455, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (11111, 34567, 'Burnaby', 'hotel1@skye', 'Skye Hotels', 3, 112233, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (55555, 12345, 'Barrhaven', 'hotel5@milton', 'Milton', 4, 556677, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (22222, 12345, 'Barrhaven', 'hotel2@milton', 'Milton', 5, 223344, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (33333, 12345, 'South Keys', 'hotel3@milton', 'Milton', 3, 334455, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (55555, 56789, 'Oakridge', 'hotel5@star', 'Star co.', 3, 556677, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (22222, 56789, 'Lambeth', 'hotel2@star', 'Star co.', 5, 223344, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (11111, 23456, 'Scarborough', 'hotel1@larriott', 'Larriott', 2, 112233, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (10111, 56789, 'Summerside', 'hotel10@star', 'Star co.', 3, 101010, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (77777, 23456, 'York', 'hotel7@larriott', 'Larriott', 2, 778899, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (88888, 12345, 'Gloucester', 'hotel8@milton', 'Milton', 3, 889900, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (55555, 23456, 'Scarborough', 'hotel5@larriott', 'Larriott', 4, 556677, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (88888, 34567, 'Burnaby', 'hotel8@skye', 'Skye Hotels', 5, 889900, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (99999, 45678, 'Reddendale', 'hotel9@asco', 'Asco', 4, 990011, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (44444, 34567, 'Surrey', 'hotel4@skye', 'Skye Hotels', 2, 445566, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (55555, 45678, 'Glenburnie', 'hotel5@asco', 'Asco', 2, 556677, '5');
INSERT INTO relational_schema.hotel (hotel_id, chain_id, address, email, name, rating, phone_number, num_of_room) VALUES (66666, 12345, 'Orleans', 'hotel6@milton', 'Milton', 5, 667788, '5');


--
-- TOC entry 4967 (class 0 OID 32865)
-- Dependencies: 227
-- Data for Name: hotel_address; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4968 (class 0 OID 32870)
-- Dependencies: 228
-- Data for Name: hotel_chain; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--

INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (12345, 'Milton', 8);
INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (23456, 'Larriott', 9);
INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (34567, 'Skye Hotels', 8);
INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (45678, 'Asco', 10);
INSERT INTO relational_schema.hotel_chain (chain_id, chain_name, num_of_hotel) VALUES (56789, 'Star co.', 11);


--
-- TOC entry 4969 (class 0 OID 32875)
-- Dependencies: 229
-- Data for Name: hotel_email; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4970 (class 0 OID 32880)
-- Dependencies: 230
-- Data for Name: hotel_phone; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4971 (class 0 OID 32883)
-- Dependencies: 231
-- Data for Name: manager; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4972 (class 0 OID 32888)
-- Dependencies: 232
-- Data for Name: renting; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4973 (class 0 OID 32893)
-- Dependencies: 233
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
-- TOC entry 4974 (class 0 OID 32898)
-- Dependencies: 234
-- Data for Name: room_amenity; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4975 (class 0 OID 32903)
-- Dependencies: 235
-- Data for Name: room_damage; Type: TABLE DATA; Schema: relational_schema; Owner: postgres
--



--
-- TOC entry 4764 (class 2606 OID 32909)
-- Name: archive archive_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.archive
    ADD CONSTRAINT archive_id PRIMARY KEY (archive_id);


--
-- TOC entry 4766 (class 2606 OID 32911)
-- Name: booking booking_start_date; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_start_date PRIMARY KEY (booking_start_date, hotel_id, chain_id);


--
-- TOC entry 4768 (class 2606 OID 32913)
-- Name: chain_address c_address; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT c_address PRIMARY KEY (c_address, chain_id);


--
-- TOC entry 4770 (class 2606 OID 32915)
-- Name: chain_email c_email; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT c_email PRIMARY KEY (c_email, chain_id);


--
-- TOC entry 4772 (class 2606 OID 32917)
-- Name: chain_number c_phone_number; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT c_phone_number PRIMARY KEY (c_phone_number, chain_id);


--
-- TOC entry 4784 (class 2606 OID 32919)
-- Name: hotel_chain chain_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_chain
    ADD CONSTRAINT chain_id PRIMARY KEY (chain_id);


--
-- TOC entry 4774 (class 2606 OID 32921)
-- Name: customer customer_id; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.customer
    ADD CONSTRAINT customer_id PRIMARY KEY (customer_id);


--
-- TOC entry 4776 (class 2606 OID 32923)
-- Name: employee employee_ssn; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_ssn PRIMARY KEY (employee_ssn);


--
-- TOC entry 4782 (class 2606 OID 32925)
-- Name: hotel_address h_address_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_address
    ADD CONSTRAINT h_address_pk PRIMARY KEY (h_address, chain_id, hotel_id);


--
-- TOC entry 4786 (class 2606 OID 32927)
-- Name: hotel_email h_email_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT h_email_pk PRIMARY KEY (h_email, chain_id, hotel_id);


--
-- TOC entry 4788 (class 2606 OID 32929)
-- Name: hotel_phone h_phone_number_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT h_phone_number_pk PRIMARY KEY (h_phone_number, chain_id, hotel_id);


--
-- TOC entry 4778 (class 2606 OID 32931)
-- Name: holds holds_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.holds
    ADD CONSTRAINT holds_pk PRIMARY KEY (booking_start_date, renting_start_date, archive_id);


--
-- TOC entry 4780 (class 2606 OID 32933)
-- Name: hotel hotel_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_pk PRIMARY KEY (hotel_id, chain_id);


--
-- TOC entry 4790 (class 2606 OID 32935)
-- Name: manager manager_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.manager
    ADD CONSTRAINT manager_pk PRIMARY KEY (ssn, hotel_id, chain_id);


--
-- TOC entry 4792 (class 2606 OID 32937)
-- Name: renting renting_start_date; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_start_date PRIMARY KEY (start_date, hotel_id, chain_id);


--
-- TOC entry 4796 (class 2606 OID 32939)
-- Name: room_amenity room_amenity_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room_amenity
    ADD CONSTRAINT room_amenity_pk PRIMARY KEY (hotel_id, chain_id, room_num, amenity);


--
-- TOC entry 4798 (class 2606 OID 32941)
-- Name: room_damage room_damage_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room_damage
    ADD CONSTRAINT room_damage_pk PRIMARY KEY (room_num, chain_id, hotel_id, damage);


--
-- TOC entry 4794 (class 2606 OID 32943)
-- Name: room room_pk; Type: CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_pk PRIMARY KEY (room_num, chain_id, hotel_id);


--
-- TOC entry 4799 (class 2606 OID 32944)
-- Name: booking booking_customer_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4800 (class 2606 OID 32949)
-- Name: booking booking_room_chain_id_hotel_id_room_num_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.booking
    ADD CONSTRAINT booking_room_chain_id_hotel_id_room_num_fk FOREIGN KEY (chain_id, hotel_id, room_num) REFERENCES relational_schema.room(chain_id, hotel_id, room_num);


--
-- TOC entry 4801 (class 2606 OID 32954)
-- Name: chain_address chain_address_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_address
    ADD CONSTRAINT chain_address_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4802 (class 2606 OID 32959)
-- Name: chain_email chain_email_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_email
    ADD CONSTRAINT chain_email_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4803 (class 2606 OID 32964)
-- Name: chain_number chain_number_hotel_chain_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.chain_number
    ADD CONSTRAINT chain_number_hotel_chain_chain_id_fk FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4804 (class 2606 OID 32969)
-- Name: employee employee_hotel_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.employee
    ADD CONSTRAINT employee_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);


--
-- TOC entry 4806 (class 2606 OID 32974)
-- Name: hotel_address hotel_address_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_address
    ADD CONSTRAINT hotel_address_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- TOC entry 4805 (class 2606 OID 32979)
-- Name: hotel hotel_chain_id_fkey; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel
    ADD CONSTRAINT hotel_chain_id_fkey FOREIGN KEY (chain_id) REFERENCES relational_schema.hotel_chain(chain_id);


--
-- TOC entry 4807 (class 2606 OID 32984)
-- Name: hotel_email hotel_email_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_email
    ADD CONSTRAINT hotel_email_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- TOC entry 4808 (class 2606 OID 32989)
-- Name: hotel_phone hotel_phone_hotel_chain_id_hotel_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.hotel_phone
    ADD CONSTRAINT hotel_phone_hotel_chain_id_hotel_id_fk FOREIGN KEY (chain_id, hotel_id) REFERENCES relational_schema.hotel(chain_id, hotel_id);


--
-- TOC entry 4809 (class 2606 OID 32994)
-- Name: renting renting_customer_customer_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_customer_customer_id_fk FOREIGN KEY (customer_id) REFERENCES relational_schema.customer(customer_id);


--
-- TOC entry 4810 (class 2606 OID 32999)
-- Name: renting renting_employee_employee_ssn_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_employee_employee_ssn_fk FOREIGN KEY (employee_ssn) REFERENCES relational_schema.employee(employee_ssn);


--
-- TOC entry 4811 (class 2606 OID 33004)
-- Name: renting renting_room_room_num_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.renting
    ADD CONSTRAINT renting_room_room_num_hotel_id_chain_id_fk FOREIGN KEY (room_num, hotel_id, chain_id) REFERENCES relational_schema.room(room_num, hotel_id, chain_id);


--
-- TOC entry 4812 (class 2606 OID 33009)
-- Name: room room_hotel_hotel_id_chain_id_fk; Type: FK CONSTRAINT; Schema: relational_schema; Owner: postgres
--

ALTER TABLE ONLY relational_schema.room
    ADD CONSTRAINT room_hotel_hotel_id_chain_id_fk FOREIGN KEY (hotel_id, chain_id) REFERENCES relational_schema.hotel(hotel_id, chain_id);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-03-23 00:21:47

--
-- PostgreSQL database dump complete
--

