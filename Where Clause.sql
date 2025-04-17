-- WHERE Clause
Select * 
from employee_salary
where last_name = 'Perkins'
;

Select *
from employee_salary
where salary > 45000
;

Select *
from employee_demographics
where gender = 'Female'
;

Select *
from employee_demographics
where birth_date > '1977-01-01'
;

-- AND OR NOT -- LOGICAL OPERATORS

Select *
from employee_demographics
where BIRTH_DATE > '1977-01-01'
AND gender ='Male'
;

Select *
from employee_demographics
where BIRTH_DATE > '1977-01-01'
OR gender ='Male'
;

-- LIKE statement
-- % and _
Select *
from employee_demographics
where first_name LIKE 'Jer%'
;
Select *
from employee_demographics
where first_name LIKE 'a%'
;

Select *
from employee_demographics
where first_name LIKE 'a__'
;

Select *
from employee_demographics
where first_name LIKE 'a___%'
;

Select *
from employee_demographics
where birth_date LIKE '1977%'
;











