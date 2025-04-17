Select first_name, length(first_name)
from employee_demographics
order by 2;

Select first_name, upper(first_name)
from employee_demographics;


Select first_name, lower(first_name)
from employee_demographics;

-- substring

select first_name,
left (first_name,4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) AS birth_month
from employee_demographics;

-- Replace
select first_name, replace(first_name, 'a', 'z')
from employee_demographics;

-- Locate
select first_name, locate('An', first_name)
from employee_demographics;

-- CONCAT
select first_name, last_name,
concat(first_name,' ',last_name) AS full_name
from employee_demographics;



