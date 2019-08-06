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
