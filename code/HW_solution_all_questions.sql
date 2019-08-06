-- 0. create table and import data from csv files
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

--------------------------------------
--------------------------------------
-- 1. List the following details of each employee: 
-- employee number, last name, first name, 
-- gender, and salary.

drop view if exists salary_list;

CREATE VIEW salary_list AS
select emp.emp_no, 
       emp.first_name, 
	   emp.last_name, 
	   emp.gender,
	   sal.salary
from employee as emp
join salaries as sal
on emp.emp_no = sal.emp_no;


--------------------------------------
--------------------------------------
-- 2. List of employees that were hired in 1986

select emp_no, 
       first_name, 
	   last_name, 
	   hire_date
from employee
where hire_date like '%' || '1986' || '%'
;

--------------------------------------
--------------------------------------
-- 3. List the manager of each department with the 
-- following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

select mgr.dept_no as "department number",
       dept.dept_name as "department name",
       mgr.emp_no  as "mgr''s employee number", 
	   emp.last_name as "mgr''s last name",
	   emp.first_name as "mgr''s first name",
	   mgr.from_date as "mgr''s start date",
	   mgr.to_date as "mgr''s end date"
from dept_manager as mgr
join department as dept
on mgr.dept_no = dept.dept_no
join employee as emp
on mgr.emp_no = emp.emp_no
;


--------------------------------------
--------------------------------------
-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

select dept_emp.emp_no as "Employee number", 
       emp.first_name as "Employee''s first name", 
	   emp.last_name as "Employee''s last name",
       --dept_emp.dept_no, 
       dept.dept_name as "Employee department"
from dept_emp
join department as dept
on dept_emp.dept_no = dept.dept_no
join employee as emp
on dept_emp.emp_no = emp.emp_no
;



--------------------------------------
--------------------------------------
--  5. List all employees whose first name is 
-- "Hercules" and last names begin with "B."

select first_name, last_name
from employee
where first_name = 'Hercules' and last_name like 'B%';

--------------------------------------
--------------------------------------
-- 6. List all employees in the Sales , 
-- including their employee number, last name, 
-- first name, and department name.

select emp.emp_no as "Employee number",
       emp.last_name  as "Employee''s last name",
	   emp.first_name as "Employee''s first name",      
	   dept.dept_name as "Dept name"
	   
from employee as emp
join dept_emp 
on emp.emp_no = dept_emp.emp_no
join department as dept
on dept_emp.dept_no = dept.dept_no
where dept.dept_name = 'Sales' 
;

--------------------------------------
--------------------------------------
-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, 
-- first name, and department name.

select emp.emp_no as "Employee number",
       emp.last_name  as "Employee''s last name",
	   emp.first_name as "Employee''s first name",      
	   dept.dept_name as "Dept name"
	   
from employee as emp
join dept_emp 
on emp.emp_no = dept_emp.emp_no
join department as dept
on dept_emp.dept_no = dept.dept_no
where dept.dept_name = 'Sales' or  dept.dept_name ='Development'
;


--------------------------------------
--------------------------------------
-- 8. In descending order, 
-- list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

select
  last_name,
  count(last_name) as "name frequency"
from
  employee
group by
  last_name
order by 
  "name frequency" desc
  ;