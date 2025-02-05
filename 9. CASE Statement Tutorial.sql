-- CASE Statement

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Remaja'
    WHEN age BETWEEN 31 AND 50 THEN 'Dewasa'
    WHEN age > 50 THEN 'Lansia'
END label
FROM employee_demographics
;


-- Pay Increase and Bonus (Study Case)
-- < 50000 = 5%
-- > 50000 = 7%
-- Departement 'Finance' = 10% Bonus

SELECT *
FROM parks_departments;

SELECT first_name, last_name, salary, dept_id,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)
END new_salary,
CASE
	WHEN dept_id = 6 THEN salary + (salary * 0.1)
END salary_bonus
FROM employee_salary
;