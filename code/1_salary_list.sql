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

select count * from salary_list;
select count(*) from salary_list;