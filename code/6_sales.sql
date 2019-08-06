-- 6. List all employees in the Sales  
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