USE employees;

SELECT DISTINCT title FROM titles;

SELECT COUNT(last_name), last_name FROM employees WHERE
                                                last_name LIKE '%E' AND
                                                last_name LIKE 'E%' GROUP BY last_name
                                                                    ORDER BY last_name;

SELECT COUNT(last_name), last_name FROM employees WHERE
                                    last_name LIKE '%q%' AND
                                    last_name NOT LIKE '%qu%' GROUP BY last_name
                                                              ORDER BY last_name;

# Update your query for 'Irena', 'Vidya', or 'Maya'.
# Use count(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT COUNT(first_name), gender FROM employees WHERE
                                                       first_name = 'Irena' OR
                                                       first_name = 'Vidya' OR
                                                       first_name = 'Maya' GROUP BY gender;
