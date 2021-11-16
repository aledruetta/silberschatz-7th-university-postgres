DROP TABLE IF EXISTS public.department;
CREATE TABLE public.department (
	dept_name varchar(20),
	building varchar(15),
	budget numeric(12,2),
	PRIMARY KEY (dept_name)
);

INSERT INTO public.department VALUES 
	(	'Biology',	'Watson',	90000.00	),
	(	'Comp. Sci.',	'Taylor',	100000.00	),
	(	'Elec. Eng.',	'Taylor',	85000.00	),
	(	'Finance',	'Painter',	120000.00	),
	(	'History',	'Painter',	50000.00	),
	(	'Music',	'Packard',	80000.00	),
	(	'Physics',	'Watson',	70000.00	);

DROP TABLE IF EXISTS public.course;
CREATE TABLE public.course (
	course_id varchar(7),
	title varchar(50),
	dept_name varchar(20),
	credits numeric(2,0),
	PRIMARY KEY (course_id),
	FOREIGN KEY (dept_name) REFERENCES public.department
);

INSERT INTO public.course VALUES 
	(	'BIO-101',	'Intro. to Biology',		'Biology',	4	),
	(	'BIO-301',	'Genetics',			'Biology',	4	),
	(	'BIO-399',	'Computational Biology',	'Biology',	3	),
	(	'CS-101',	'Intro. to Computer Science',	'Comp. Sci.',	4	),
	(	'CS-190',	'Game Design',			'Comp. Sci.',	4	),
	(	'CS-315',	'Robotics',			'Comp. Sci.',	3	),
	(	'CS-319',	'Image Processing',		'Comp. Sci.',	3	),
	(	'CS-347',	'Database System Concepts',	'Comp. Sci.',	3	),
	(	'EE-181',	'Intro. to Digital Systems',	'Comp. Sci.',	3	),
	(	'FIN-201',	'Investment Banking',		'Finance',	3	),
	(	'HIS-351',	'World History',		'History',	3	),
	(	'MU-199',	'Music Video Production',	'Music',	3	),
	(	'PHY-101',	'Physical Principles',		'Physics',	4	);

DROP TABLE IF EXISTS public.prereq;
CREATE TABLE public.prereq (
	course_id varchar(7),
	prereq_id varchar(7),
	PRIMARY KEY (course_id,prereq_id),
	FOREIGN KEY (course_id) REFERENCES public.course,
	FOREIGN KEY (prereq_id) REFERENCES public.course (course_id)
);

INSERT INTO public.prereq VALUES
	(	'BIO-301',	'BIO-101'	),
	(	'BIO-399',	'BIO-101'	),
	(	'CS-190',	'CS-101'	), 
	(	'CS-315',	'CS-101'	),
	(	'CS-319',	'CS-101'	),
	(	'CS-347',	'CS-101'	),
	(	'EE-181',	'PHY-101'	);

DROP TABLE IF EXISTS public.instructor;
CREATE TABLE public.instructor (
	ID varchar(5),
	name varchar(20) NOT NULL,
	dept_name varchar(20),
	salary numeric(8,2),
	PRIMARY KEY (ID),
	FOREIGN KEY (dept_name) references public.department
);

INSERT INTO public.instructor VALUES 
	(	'10101',	'Srinivasan',	'Comp. Sci.',	65000.00	),
	(	'12121',	'Wu',		'Finance',	90000.00	),
	(	'15151',	'Mozart',	'Music',	40000.00	),
	(	'22222',	'Einstein',	'Physics',	95000.00	),
	(	'32343',	'El Said',	'History',	60000.00	),
	(	'33456',	'Gold',		'Physics',	87000.00	),
	(	'45565',	'Katz',		'Comp. Sci.',	75000.00	),
	(	'58583',	'Califieri',	'History',	62000.00	),
	(	'76543',	'Singh',	'Finance',	80000.00	),
	(	'76766',	'Crick',	'Biology',	72000.00	),
	(	'83821',	'Brandt',	'Comp. Sci.',	92000.00	),
	(	'98345',	'Kim',		'Elec. Eng.',	80000.00	);


DROP TABLE IF EXISTS public.section;
CREATE TABLE public.section (
	course_id varchar(8),
	sec_id varchar(8),
	semester varchar(6),
	year numeric(4,0),
	building varchar(15),
	room_number varchar(7),
	time_slot_id varchar(4),
	PRIMARY KEY (course_id,sec_id,semester,year),
	FOREIGN KEY (course_id) REFERENCES public.course
);

INSERT INTO public.section VALUES 
	(	'BIO-101',	'1',	'Summer',	2017,	'Painter',	'514',	'B'	),
	(	'BIO-301',	'1',	'Summer',	2018,	'Painter',	'514',	'A'	),
	(	'CS-101',	'1',	'Fall',		2017,	'Packard',	'101',	'H'	),
	(	'CS-101',	'1',	'Spring',	2018,	'Packard',	'101',	'F'	),
	(	'CS-190',	'1',	'Spring',	2017,	'Taylor',	'3128',	'E'	),
	(	'CS-190',	'2',	'Spring',	2017,	'Taylor',	'3128',	'A'	),
	(	'CS-315',	'1',	'Spring',	2018,	'Watson',	'120',	'D'	),
	(	'CS-319',	'1',	'Spring',	2018,	'Watson',	'100',	'B'	),
	(	'CS-319',	'2',	'Spring',	2018,	'Taylor',	'3128',	'C'	),
	(	'CS-347',	'1',	'Fall',		2017,	'Taylor',	'3128',	'A'	),
	(	'EE-181',	'1',	'Spring',	2017,	'Taylor',	'3128',	'C'	),
	(	'FIN-201',	'1',	'Spring',	2018,	'Packard',	'101',	'B'	),
	(	'HIS-351',	'1',	'Spring',	2018,	'Painter',	'514',	'C'	),
	(	'MU-199',	'1',	'Spring',	2018,	'Packard',	'101',	'D'	),
	(	'PHY-101',	'1',	'Fall',		2017,	'Watson',	'100',	'A'	);


DROP TABLE IF EXISTS public.teaches;
CREATE TABLE public.teaches (
	ID varchar(5),
	course_id varchar(8),
	sec_id varchar(8),
	semester varchar(6),
	year numeric(4,0),
	PRIMARY KEY (ID,course_id,sec_id,semester,year),
	FOREIGN KEY (course_id,sec_id,semester,year) REFERENCES public.section,
	FOREIGN KEY (ID) REFERENCES public.instructor
);

INSERT INTO public.teaches VALUES 
	(	'10101',	'CS-101',	'1',	'Fall',		2017	),
	(	'10101',	'CS-315',	'1',	'Spring',	2018	),
	(	'10101',	'CS-347',	'1',	'Fall',		2017	),
	(	'12121',	'FIN-201',	'1',	'Spring',	2018	),
	(	'15151',	'MU-199',	'1',	'Spring',	2018	),
	(	'22222',	'PHY-101',	'1',	'Fall',		2017	),
	(	'32343',	'HIS-351',	'1',	'Spring',	2018	),
	(	'45565',	'CS-101',	'1',	'Spring',	2018	),
	(	'45565',	'CS-319',	'1',	'Spring',	2018	),
	(	'76766',	'BIO-101',	'1',	'Summer',	2017	),
	(	'76766',	'BIO-301',	'1',	'Summer',	2018	),
	(	'83821',	'CS-190',	'1',	'Spring',	2017	),
	(	'83821',	'CS-190',	'2',	'Spring',	2017	),
	(	'83821',	'CS-319',	'2',	'Spring',	2018	),
	(	'98345',	'EE-181',	'1',	'Spring',	2017	);


