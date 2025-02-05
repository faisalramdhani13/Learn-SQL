-- STRING FUNCTIONS

-- LENGTH
SELECT LENGTH('Mohammad Faisal Ramdhani')
;

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2
;

-- UPPER and LOWER
SELECT UPPER('Mohammad Faisal Ramdhani');
SELECT LOWER('MOHAMMAD FAISAL RAMDHANI');

SELECT first_name, UPPER(first_name)
FROM employee_demographics
;

-- TRIM
SELECT ('Mohammad Faisal Ramdhani');
SELECT TRIM('              Mohammad Faisal Ramdhani            ');
SELECT LTRIM('              Mohammad Faisal Ramdhani            ');
SELECT RTRIM('              Mohammad Faisal Ramdhani            ');

-- LEFT, RIGHT, SUB STRING
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
LEFT(birth_date, 4) year,
SUBSTRING(birth_date, 6, 2) month,
RIGHT(birth_date, 2) date
FROM employee_demographics
;

-- REPLACE
SELECT first_name, REPLACE(first_name, 'A', 'z')
FROM employee_demographics
ORDER BY first_name
;

-- LOCATE
SELECT LOCATE('a', 'Faisal');

SELECT first_name, LOCATE('an', first_name)
FROM employee_demographics
;

-- CONCATENATION
SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) full_name
FROM employee_demographics
;