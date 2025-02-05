-- Group By

SELECT *
FROM employee_demographics
;

SELECT gender, MAX(age), MIN(age), AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT occupation, MAX(salary), MIN(salary), AVG(salary)
FROM employee_salary
GROUP BY occupation
;

-- ORDER BY
-- ASC (Low to High (A-Z/0-9))

SELECT *
FROM employee_demographics
ORDER BY gender, age ASC
;

-- DESC (High to Low (Z-A/9-0))

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
;