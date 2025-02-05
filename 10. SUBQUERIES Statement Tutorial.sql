-- SUBQUERIES

SELECT *
FROM employee_salary
;

SELECT *
FROM employee_demographics
WHERE employee_id IN
	(SELECT employee_id
		FROM employee_salary
        WHERE dept_id = 1)
;

SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary) average_salary
FROM employee_salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

SELECT gender, AVG(max_age), AVG(min_age), AVG(count_age)
FROM
(SELECT gender, 
AVG(age) avg_age, 
MAX(age) max_age, 
MIN(age) min_age, 
COUNT(age) count_age
FROM employee_demographics
GROUP BY gender) agg_table
GROUP BY gender
;