-- Create departments table 
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments 
						 
-- Create Employees table 
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY, 
	emp_title VARCHAR NOT NULL,
	birth_date DATE NOT NULL, 
	first_name VARCHAR, 
	last_name VARCHAR, 
	sex VARCHAR, 
	hire_date DATE
);

select count(*) from employees

-- Create Department Manager table 
CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (dept_no, emp_no)
);

select * from dept_manager

--Create Department Employee Table 
CREATE TABLE dept_emp3 (
	emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

select * from dept_emp3

--Create Titles Table 
CREATE TABLE titles (
	title_id VARCHAR NOT NULL, 
	title VARCHAR,
	PRIMARY KEY (title_id)
);

select * from titles 

--Create Salaries Tabe
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT
);

select * from salaries 

-- 1
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e 
INNER JOIN salaries AS s 
ON e.emp_no = s.emp_no;

-- 2
SELECT first_name, last_name, hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date)= '1986';

--3
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.emp_no, e.last_name, e.first_name
FROM departments AS d
INNER JOIN dept_manager AS dm
ON dm.dept_no = d.dept_no
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no;

--4 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees AS e
INNER JOIN dept_emp3 AS de
ON e.emp_no = de.emp_no 
INNER JOIN departments AS d
ON de.dept_no = d.dept_no

--5 
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'

--6 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp3 AS de
ON e.emp_no = de.emp_no 
INNER JOIN departments AS d
ON de.dept_no = d.dept_no 
WHERE d.dept_name = 'Sales' 

--7 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp3 AS de
ON e.emp_no = de.emp_no 
INNER JOIN departments AS d
ON de.dept_no = d.dept_no 
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

--8
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

