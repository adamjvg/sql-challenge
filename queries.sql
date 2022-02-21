-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- left join salary and employee table
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
left join salaries as s
	on e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date 
	between '1986/1/1' 
	and '1986/12/31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- join manager by department number and manager employee number by manager
select d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from departments as d
left join manager as m
	on d.dept_no = m.dept_no
left join employees as e
	on m.emp_no = e.emp_no;

-- join dept_employees to departments on dept_no to get dept_names, then join -- employees to dept_employees on emp_no to get names
select e.emp_no, e.last_name, e.first_name, d.dept_name
from dept_employees as de
left join departments as d
	on de.dept_no = d.dept_no
left join employees as e
	on de.emp_no = e.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex
from employees as e
where e.first_name = 'Hercules' 
	and e.last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- join on employee number and department number. 
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from employees as e
left join dept_employees as de on 
	e.emp_no = de.emp_no
left join departments as d on 
	de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Join on employee numbeer and department number
select e.emp_no, e.last_name, e.first_name, d.dept_name 
from employees as e
left join dept_employees as de on 
	e.emp_no = de.emp_no
left join departments as d on 
	de.dept_no = d.dept_no
where d.dept_name = 'Sales' 
	or d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*)
as "frequency_of_last_names"
from employees
group by last_name
order by "frequency_of_last_names" desc;
