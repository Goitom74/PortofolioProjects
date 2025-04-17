-- Case statements

select first_name,
last_name,
age,
Case
when age <= 35 then 'young'
when age between 36 and 59 then 'old'
when age >= 60 then 'retired'
end as age_bracket
from employee_demographics;

-- Pay increase and Bonus
-- <50000 = 5%
-- >50000 = 7%
-- Finance = 10% bonus

Select first_name, last_name, salary,
Case

when salary < 50000 then salary*1.05
when salary > 50000 then salary*1.07
end as new_salary,

Case

when dept_id = 6 then salary*0.10
end as bonus
from employee_salary;
