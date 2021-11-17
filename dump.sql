--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Ubuntu 14.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.1 (Ubuntu 14.1-1.pgdg20.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: classroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classroom (
    building character varying(15) NOT NULL,
    room_number character varying(7) NOT NULL,
    capacity numeric(4,0) DEFAULT NULL::numeric
);


ALTER TABLE public.classroom OWNER TO postgres;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    dept_name character varying(20) NOT NULL,
    building character varying(15) DEFAULT NULL::character varying,
    budget numeric(12,2) DEFAULT NULL::numeric
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: time_slot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slot (
    time_slot_id character varying(4) NOT NULL,
    day character varying(1) NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone
);


ALTER TABLE public.time_slot OWNER TO postgres;

--
-- Data for Name: classroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classroom (building, room_number, capacity) FROM stdin;
Packard	101	500
Painter	514	10
Taylor	3128	70
Watson	100	30
Watson	120	50
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (dept_name, building, budget) FROM stdin;
Biology	Watson	90000.00
Comp. Sci.	Taylor	100000.00
Elec. Eng.	Taylor	85000.00
Finance	Painter	120000.00
History	Painter	50000.00
Music	Packard	80000.00
Physics	Watson	70000.00
\.


--
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slot (time_slot_id, day, start_time, end_time) FROM stdin;
A	F	08:00:00	08:50:00
A	M	08:00:00	08:50:00
A	W	08:00:00	08:50:00
B	F	09:00:00	09:50:00
B	M	09:00:00	09:50:00
B	W	09:00:00	09:50:00
C	F	11:00:00	11:50:00
C	M	11:00:00	11:50:00
C	W	11:00:00	11:50:00
D	F	13:00:00	13:50:00
D	M	13:00:00	13:50:00
D	W	13:00:00	13:50:00
E	R	10:30:00	11:45:00
E	T	10:30:00	11:45:00
F	R	14:30:00	15:45:00
F	T	14:30:00	15:45:00
G	F	16:00:00	16:50:00
G	M	16:00:00	16:50:00
G	W	16:00:00	16:50:00
H	W	10:00:00	12:30:00
\.


--
-- Name: classroom classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (building, room_number);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_name);


--
-- Name: time_slot time_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slot
    ADD CONSTRAINT time_slot_pkey PRIMARY KEY (time_slot_id, day, start_time);


--
-- PostgreSQL database dump complete
--

