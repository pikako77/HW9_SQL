-- List of employees that were hired in 1986

select emp_no, 
       first_name, 
	   last_name, 
	   hire_date
from employee
where hire_date like '%' || '1986' || '%'