-- LIMIT

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 5, 2 -- (5) = Start from, (2) = How many rows to take
;

-- Aliasing (AS)

SELECT gender, AVG(age) avg_age -- AS still work even without write 'AS' in query
FROM employee_demographics
GROUP BY gender
HAVING avg_age < 40
;