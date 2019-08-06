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
