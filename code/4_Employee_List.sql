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
