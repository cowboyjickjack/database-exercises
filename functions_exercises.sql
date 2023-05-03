USE employees;

SELECT first_name, last_name, gender FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
  AND gender = 'M'
ORDER BY last_name, first_name;

SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE first_name LIKE 'E%' ORDER BY emp_no DESC;

SELECT first_name, last_name FROM employees
WHERE last_name LIKE '%Q%'
  AND last_name NOT LIKE '%QU%';

SELECT first_name, last_name FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

SELECT first_name, last_name FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E';

SELECT first_name, last_name, birth_date FROM employees WHERE year(birth_date) BETWEEN 1900 AND 2000
                                                    AND month(birth_date) = 12
                                                    AND day(birth_date) = 25;

SELECT first_name, last_name, birth_date, hire_date, DATEDIFF(NOW(), hire_date)/365 FROM employees WHERE year(birth_date) BETWEEN 1900 AND 2000
                                                          AND month(birth_date) = 12
                                                          AND day(birth_date) = 25 AND year(hire_date) between 1990 AND 2000
                                                        ORDER BY birth_date, hire_date DESC;

