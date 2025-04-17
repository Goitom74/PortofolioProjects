select first_name, last_name
from employee_demographics
Union
select first_name, last_name
from employee_salary;

-- Union the same as union distinct


select first_name, last_name, 'old' as label
from employee_demographics
where age > 50
Union
select first_name, last_name, 'Highly paid employee' as label
from employee_salary
where salary > 70000
;


select first_name, last_name, 'old man' as label
from employee_demographics
where age > 40 AND gender = 'male'
Union
select first_name, last_name, 'old lady' as label
from employee_demographics
where age > 40 AND gender = 'female'
Union
select first_name, last_name, 'Highly paid employee' as label
from employee_salary
where salary > 70000
order by first_name, last_name
;



