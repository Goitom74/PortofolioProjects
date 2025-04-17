-- Limit and Aliasing

select *
from employee_demographics
order by age desc
limit 3;


select *
from employee_demographics
order by age desc
limit 3, 1;

-- Aliasing

select gender, avg(age) AS avg_age
from employee_demographics
group by gender
Having avg(age) > 40;
