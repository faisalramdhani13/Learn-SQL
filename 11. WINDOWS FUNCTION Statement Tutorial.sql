-- WINDOWS FUNCTIONS (SIMILAR LIKE GROUP BY)

-- GROUP BY
SELECT gender, AVG(salary) avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- WINDOWS FUNCTION
SELECT dem.first_name, dem.last_name, CONCAT(dem.first_name,' ', dem.last_name) full_name, gender, 
AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name, dem.last_name, CONCAT(dem.first_name,' ', dem.last_name) full_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) row_num,
RANK () OVER(PARTITION BY gender ORDER BY salary DESC) rank_number
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;