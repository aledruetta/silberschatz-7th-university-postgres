--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Ubuntu 14.1-2.pgdg20.04+1)
-- Dumped by pg_dump version 14.1 (Ubuntu 14.1-2.pgdg20.04+1)

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
-- Name: advisor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advisor (
    s_id character varying(5) NOT NULL,
    i_id character varying(5)
);


ALTER TABLE public.advisor OWNER TO postgres;

--
-- Name: classroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classroom (
    building character varying(15) NOT NULL,
    room_number character varying(7) NOT NULL,
    capacity numeric(4,0)
);


ALTER TABLE public.classroom OWNER TO postgres;

--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id character varying(8) NOT NULL,
    title character varying(50),
    dept_name character varying(20),
    credits numeric(2,0),
    CONSTRAINT course_credits_check CHECK ((credits > (0)::numeric))
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    dept_name character varying(20) NOT NULL,
    building character varying(15),
    budget numeric(12,2),
    CONSTRAINT department_budget_check CHECK ((budget > (0)::numeric))
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    id character varying(5) NOT NULL,
    name character varying(20) NOT NULL,
    dept_name character varying(20),
    salary numeric(8,2),
    CONSTRAINT instructor_salary_check CHECK ((salary > (29000)::numeric))
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- Name: prereq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prereq (
    course_id character varying(8) NOT NULL,
    prereq_id character varying(8) NOT NULL
);


ALTER TABLE public.prereq OWNER TO postgres;

--
-- Name: section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.section (
    course_id character varying(8) NOT NULL,
    sec_id character varying(8) NOT NULL,
    semester character varying(6) NOT NULL,
    year numeric(4,0) NOT NULL,
    building character varying(15),
    room_number character varying(7),
    time_slot_id character varying(4),
    CONSTRAINT section_semester_check CHECK (((semester)::text = ANY ((ARRAY['Fall'::character varying, 'Winter'::character varying, 'Spring'::character varying, 'Summer'::character varying])::text[]))),
    CONSTRAINT section_year_check CHECK (((year > (1701)::numeric) AND (year < (2100)::numeric)))
);


ALTER TABLE public.section OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id character varying(5) NOT NULL,
    name character varying(20) NOT NULL,
    dept_name character varying(20),
    tot_cred numeric(3,0),
    CONSTRAINT student_tot_cred_check CHECK ((tot_cred >= (0)::numeric))
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: takes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.takes (
    id character varying(5) NOT NULL,
    course_id character varying(8) NOT NULL,
    sec_id character varying(8) NOT NULL,
    semester character varying(6) NOT NULL,
    year numeric(4,0) NOT NULL,
    grade character varying(2)
);


ALTER TABLE public.takes OWNER TO postgres;

--
-- Name: teaches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teaches (
    id character varying(5) NOT NULL,
    course_id character varying(8) NOT NULL,
    sec_id character varying(8) NOT NULL,
    semester character varying(6) NOT NULL,
    year numeric(4,0) NOT NULL
);


ALTER TABLE public.teaches OWNER TO postgres;

--
-- Name: time_slot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_slot (
    time_slot_id character varying(4) NOT NULL,
    day character varying(1) NOT NULL,
    start_hr numeric(2,0) NOT NULL,
    start_min numeric(2,0) NOT NULL,
    end_hr numeric(2,0),
    end_min numeric(2,0),
    CONSTRAINT time_slot_end_hr_check CHECK (((end_hr >= (0)::numeric) AND (end_hr < (24)::numeric))),
    CONSTRAINT time_slot_end_min_check CHECK (((end_min >= (0)::numeric) AND (end_min < (60)::numeric))),
    CONSTRAINT time_slot_start_hr_check CHECK (((start_hr >= (0)::numeric) AND (start_hr < (24)::numeric))),
    CONSTRAINT time_slot_start_min_check CHECK (((start_min >= (0)::numeric) AND (start_min < (60)::numeric)))
);


ALTER TABLE public.time_slot OWNER TO postgres;

--
-- Data for Name: advisor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advisor (s_id, i_id) FROM stdin;
00128	45565
12345	10101
23121	76543
44553	22222
45678	22222
76543	45565
76653	98345
98765	98345
98988	76766
\.


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
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, title, dept_name, credits) FROM stdin;
BIO-101	Intro. to Biology	Biology	4
BIO-301	Genetics	Biology	4
BIO-399	Computational Biology	Biology	3
CS-101	Intro. to Computer Science	Comp. Sci.	4
CS-190	Game Design	Comp. Sci.	4
CS-315	Robotics	Comp. Sci.	3
CS-319	Image Processing	Comp. Sci.	3
CS-347	Database System Concepts	Comp. Sci.	3
EE-181	Intro. to Digital Systems	Elec. Eng.	3
FIN-201	Investment Banking	Finance	3
HIS-351	World History	History	3
MU-199	Music Video Production	Music	3
PHY-101	Physical Principles	Physics	4
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
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (id, name, dept_name, salary) FROM stdin;
10101	Srinivasan	Comp. Sci.	65000.00
12121	Wu	Finance	90000.00
15151	Mozart	Music	40000.00
22222	Einstein	Physics	95000.00
32343	El Said	History	60000.00
33456	Gold	Physics	87000.00
45565	Katz	Comp. Sci.	75000.00
58583	Califieri	History	62000.00
76543	Singh	Finance	80000.00
76766	Crick	Biology	72000.00
83821	Brandt	Comp. Sci.	92000.00
98345	Kim	Elec. Eng.	80000.00
\.


--
-- Data for Name: prereq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prereq (course_id, prereq_id) FROM stdin;
BIO-301	BIO-101
BIO-399	BIO-101
CS-190	CS-101
CS-315	CS-101
CS-319	CS-101
CS-347	CS-101
EE-181	PHY-101
\.


--
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.section (course_id, sec_id, semester, year, building, room_number, time_slot_id) FROM stdin;
BIO-101	1	Summer	2017	Painter	514	B
BIO-301	1	Summer	2018	Painter	514	A
CS-101	1	Fall	2017	Packard	101	H
CS-101	1	Spring	2018	Packard	101	F
CS-190	1	Spring	2017	Taylor	3128	E
CS-190	2	Spring	2017	Taylor	3128	A
CS-315	1	Spring	2018	Watson	120	D
CS-319	1	Spring	2018	Watson	100	B
CS-319	2	Spring	2018	Taylor	3128	C
CS-347	1	Fall	2017	Taylor	3128	A
EE-181	1	Spring	2017	Taylor	3128	C
FIN-201	1	Spring	2018	Packard	101	B
HIS-351	1	Spring	2018	Painter	514	C
MU-199	1	Spring	2018	Packard	101	D
PHY-101	1	Fall	2017	Watson	100	A
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, name, dept_name, tot_cred) FROM stdin;
00128	Zhang	Comp. Sci.	102
12345	Shankar	Comp. Sci.	32
19991	Brandt	History	80
23121	Chavez	Finance	110
44553	Peltier	Physics	56
45678	Levy	Physics	46
54321	Williams	Comp. Sci.	54
55739	Sanchez	Music	38
70557	Snow	Physics	0
76543	Brown	Comp. Sci.	58
76653	Aoi	Elec. Eng.	60
98765	Bourikas	Elec. Eng.	98
98988	Tanaka	Biology	120
\.


--
-- Data for Name: takes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.takes (id, course_id, sec_id, semester, year, grade) FROM stdin;
00128	CS-101	1	Fall	2017	A
00128	CS-347	1	Fall	2017	A-
12345	CS-101	1	Fall	2017	C
12345	CS-190	2	Spring	2017	A
12345	CS-315	1	Spring	2018	A
12345	CS-347	1	Fall	2017	A
19991	HIS-351	1	Spring	2018	B
23121	FIN-201	1	Spring	2018	C+
44553	PHY-101	1	Fall	2017	B-
45678	CS-101	1	Fall	2017	F
45678	CS-101	1	Spring	2018	B+
45678	CS-319	1	Spring	2018	B
54321	CS-101	1	Fall	2017	A-
54321	CS-190	2	Spring	2017	B+
55739	MU-199	1	Spring	2018	A-
76543	CS-101	1	Fall	2017	A
76543	CS-319	2	Spring	2018	A
76653	EE-181	1	Spring	2017	C
98765	CS-101	1	Fall	2017	C-
98765	CS-315	1	Spring	2018	B
98988	BIO-101	1	Summer	2017	A
98988	BIO-301	1	Summer	2018	\N
\.


--
-- Data for Name: teaches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teaches (id, course_id, sec_id, semester, year) FROM stdin;
10101	CS-101	1	Fall	2017
10101	CS-315	1	Spring	2018
10101	CS-347	1	Fall	2017
12121	FIN-201	1	Spring	2018
15151	MU-199	1	Spring	2018
22222	PHY-101	1	Fall	2017
32343	HIS-351	1	Spring	2018
45565	CS-101	1	Spring	2018
45565	CS-319	1	Spring	2018
76766	BIO-101	1	Summer	2017
76766	BIO-301	1	Summer	2018
83821	CS-190	1	Spring	2017
83821	CS-190	2	Spring	2017
83821	CS-319	2	Spring	2018
98345	EE-181	1	Spring	2017
\.


--
-- Data for Name: time_slot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_slot (time_slot_id, day, start_hr, start_min, end_hr, end_min) FROM stdin;
A	M	8	0	8	50
A	W	8	0	8	50
A	F	8	0	8	50
B	M	9	0	9	50
B	W	9	0	9	50
B	F	9	0	9	50
C	M	11	0	11	50
C	W	11	0	11	50
C	F	11	0	11	50
D	M	13	0	13	50
D	W	13	0	13	50
D	F	13	0	13	50
E	T	10	30	11	45
E	R	10	30	11	45
F	T	14	30	15	45
F	R	14	30	15	45
G	M	16	0	16	50
G	W	16	0	16	50
G	F	16	0	16	50
H	W	10	0	12	30
\.


--
-- Name: advisor advisor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisor
    ADD CONSTRAINT advisor_pkey PRIMARY KEY (s_id);


--
-- Name: classroom classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (building, room_number);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_name);


--
-- Name: instructor instructor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_pkey PRIMARY KEY (id);


--
-- Name: prereq prereq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prereq
    ADD CONSTRAINT prereq_pkey PRIMARY KEY (course_id, prereq_id);


--
-- Name: section section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (course_id, sec_id, semester, year);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: takes takes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.takes
    ADD CONSTRAINT takes_pkey PRIMARY KEY (id, course_id, sec_id, semester, year);


--
-- Name: teaches teaches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_pkey PRIMARY KEY (id, course_id, sec_id, semester, year);


--
-- Name: time_slot time_slot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_slot
    ADD CONSTRAINT time_slot_pkey PRIMARY KEY (time_slot_id, day, start_hr, start_min);


--
-- Name: advisor advisor_i_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisor
    ADD CONSTRAINT advisor_i_id_fkey FOREIGN KEY (i_id) REFERENCES public.instructor(id) ON DELETE SET NULL;


--
-- Name: advisor advisor_s_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advisor
    ADD CONSTRAINT advisor_s_id_fkey FOREIGN KEY (s_id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: course course_dept_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_dept_name_fkey FOREIGN KEY (dept_name) REFERENCES public.department(dept_name) ON DELETE SET NULL;


--
-- Name: instructor instructor_dept_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor_dept_name_fkey FOREIGN KEY (dept_name) REFERENCES public.department(dept_name) ON DELETE SET NULL;


--
-- Name: prereq prereq_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prereq
    ADD CONSTRAINT prereq_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id) ON DELETE CASCADE;


--
-- Name: prereq prereq_prereq_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prereq
    ADD CONSTRAINT prereq_prereq_id_fkey FOREIGN KEY (prereq_id) REFERENCES public.course(course_id);


--
-- Name: section section_building_room_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_building_room_number_fkey FOREIGN KEY (building, room_number) REFERENCES public.classroom(building, room_number) ON DELETE SET NULL;


--
-- Name: section section_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id) ON DELETE CASCADE;


--
-- Name: student student_dept_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_dept_name_fkey FOREIGN KEY (dept_name) REFERENCES public.department(dept_name) ON DELETE SET NULL;


--
-- Name: takes takes_course_id_sec_id_semester_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.takes
    ADD CONSTRAINT takes_course_id_sec_id_semester_year_fkey FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES public.section(course_id, sec_id, semester, year) ON DELETE CASCADE;


--
-- Name: takes takes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.takes
    ADD CONSTRAINT takes_id_fkey FOREIGN KEY (id) REFERENCES public.student(id) ON DELETE CASCADE;


--
-- Name: teaches teaches_course_id_sec_id_semester_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_course_id_sec_id_semester_year_fkey FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES public.section(course_id, sec_id, semester, year) ON DELETE CASCADE;


--
-- Name: teaches teaches_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teaches
    ADD CONSTRAINT teaches_id_fkey FOREIGN KEY (id) REFERENCES public.instructor(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

