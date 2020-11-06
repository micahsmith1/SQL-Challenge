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