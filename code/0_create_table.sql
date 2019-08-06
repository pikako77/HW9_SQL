-- Import department
DROP TABLE IF EXISTS department;

CREATE TABLE department (
  dept_no character varying(4) NOT NULL,
  dept_name character varying(20) NOT NULL
  );
  
SELECT * FROM department;

-------------------------------
-- Import dept_emp
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no character varying(4) NOT NULL,
  from_date character varying(10) NOT NULL,
  to_date character varying(10) NOT NULL	
  );
  
SELECT * FROM dept_emp;

-- check if all data are in table
SELECT count(*) FROM dept_emp;

-------------------------------
-- Import dept_manager
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
  dept_no character varying(4) NOT NULL,
  emp_no integer NOT NULL,
  from_date character varying(10) NOT NULL,
  to_date character varying(10) NOT NULL	
  );
  
SELECT * FROM dept_manager;

-------------------------------
-- Import employee
DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
  emp_no integer NOT NULL,
  birth_date character varying(10) NOT NULL,
  first_name character varying(40) NOT NULL,
  last_name character varying(40) NOT NULL,
  gender character varying(1) NOT NULL,
  hire_date character varying(10) NOT NULL
  );
  
SELECT * FROM employee;
SELECT count(*) FROM employee;

-------------------------------
-- Import employee
DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
  emp_no integer NOT NULL,
  birth_date character varying(10) NOT NULL,
  first_name character varying(40) NOT NULL,
  last_name character varying(40) NOT NULL,
  gender character varying(1) NOT NULL,
  hire_date character varying(10) NOT NULL
  );
  
SELECT * FROM employee;
SELECT count(*) FROM employee;

-------------------------------
-- Import salary
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT null,
  from_date date,
  to_date date
  );
  
SELECT * FROM salaries;
SELECT count(*) FROM salaries;

-------------------------------
-- Import title
DROP TABLE IF EXISTS title;

CREATE TABLE title (
  emp_no integer NOT NULL,
  title character varying(30) NOT NULL,
  from_date date,
  to_date date
  );
  
SELECT * FROM title;
SELECT count(*) FROM title;