Select gender
from employee_demographics
group by gender;
Select gender
from employee_demographics
group by gender;


Select occupation, salary
from employee_salary
group by occupation, salary;


Select gender, avg(age), MAX(age), MIN(age), Count(age)
from employee_demographics
group by gender;


Select *
from employee_demographics
order by first_name;


Select *
from employee_demographics
order by first_name DESC;


Select *
from employee_demographics
order by first_name ASC;

Select *
from employee_demographics
order by gender, age DESC;