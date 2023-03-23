CREATE TABLE employee_project(
    employee_project_id integer PRIMARY KEY,
    employee_id integer NOT NULL,
    project text NOT NULL
);

CREATE TABLE positions(
    position text PRIMARY KEY,
    department text NOT NULL
);

CREATE TABLE employees(
    employee_id integer PRIMARY KEY,
    employee text NOT NULL,
    supervisor text,
    travel_required boolean,
    position text
);

INSERT INTO employee_project
(employee_project_id, employee_id, project)
Values(1, 1, 'Marketing optimization'),
(2,	1,	'Demand forecasting'),
(3,	2,	'Automation of processes'),
(4,	3,	'Demand forecasting'),
(5,	4,	'Budget planning'),
(6,	5,	'Hiring employees'),
(7,	6,	'Budget planning'),
(8,	7,	'Infrastructure development'),
(9,	8,	'Automation of processes'),
(10, 9,	'Data visualization'),
(11, 9,	'Data analysis'),
(12, 10, 'Sales optimization');

INSERT INTO positions
(position, department)
Values('Senior Data Analyst', 'IT'),
('Engineer', 'Tech'),
('Data Analyst', 'IT'),
('Manager',	'Finance'),
('Business partners',	'HR'),
('Account manager',	'Finance'),
('Data engineer',	'IT'),
('Project manager',	'IT');

INSERT INTO employees
(employee_id, employee, supervisor, travel_required, position)
VALUES(1,	'MICHAEL J. ANDERSON',	'NICOLE  GRAY',	1, 'Senior Data Analyst'),
(2,	'SCOTT G. ADAMS',	'CLARKE  HAMBLEY',	0,	'Engineer'),
(3,	'JAMES B. BARNS',	'MICHAEL J. ANDERSON',	0,	'Data Analyst'),
(4,	'PAUL R. BROWN',	'MARGARET C. LEPAGE',	0,	'Manager'),
(5,	'JESSICA R. CURRIER',	'CATHERINE  LEWIS',	1,	'Business partners'),
(6,	'KRIS J. EIMICKE',	'MARGARET C. LEPAGE',	1,	'Account manager'),
(7,	'STEVEN E. COPE',	'CATHERINE  LEWIS',	0,	'Data engineer'),
(8,	'REBECCA  GREENFIELD',	'CLARKE  HAMBLEY',	1,	'Engineer'),
(9,	'ANDREA L FRAVERT',	'MICHAEL J. ANDERSON',	0,	'Data Analyst'),
(10, 'MATTHEW J. FOSTER',	'MICHAEL J. ANDERSON',	0,	'Project manager');

