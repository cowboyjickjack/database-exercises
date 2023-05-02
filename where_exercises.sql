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