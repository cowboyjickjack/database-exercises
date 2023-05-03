USE employees;

SELECT first_name, last_name, gender FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
  AND gender = 'M';

SELECT first_name, last_name FROM employees WHERE first_name LIKE 'E%';

SELECT first_name, last_name FROM employees
WHERE last_name LIKE '%Q%'
  AND last_name NOT LIKE '%QU%';

SELECT first_name, last_name FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E';

# FUNCTIONS

SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE first_name = 'Maya';

SELECT DAYOFMONTH(hire_date) FROM employees WHERE first_name = 'Maya';

SELECT DATEDIFF(NOW(), hire_date)/365 FROM employees LIMIT 50;

SELECT MINUTE(NOW());
SELECT SECOND(NOW());

# Group By and Aggregate Functions

# Group By will combine duplicates into one value for each group
# It will consolidate rows based on a common column (similar to DISTINCT)
# Must use with something you're selecting. If it's not part of the Group By and non-aggregated, it will show an error

SELECT last_name FROM employees GROUP BY last_name;

# shows how many values are in the first name column (how many first names there are)
SELECT COUNT(first_name) FROM employees;

# gives a count of how many ppl have each last name
SELECT last_name, COUNT(first_name) FROM employees GROUP BY last_name ORDER BY last_name;

# shows how many males vs females
SELECT gender, COUNT(first_name) FROM employees GROUP BY gender;

# how old each employee was when hired, but MIN shows youngest person ever hired
SELECT MIN(DATEDIFF(hire_date, birth_date)) / 365 FROM employees;
# oldest person ever hired
SELECT MAX(DATEDIFF(hire_date, birth_date)) / 365 FROM employees;

SELECT AVG(DATEDIFF(hire_date, birth_date)) / 365 FROM employees;