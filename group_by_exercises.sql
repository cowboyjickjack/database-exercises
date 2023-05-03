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

# AS = Aliases
# Changes the header of the row to clean it up
SELECT COUNT(first_name) AS Quantity, gender FROM employees WHERE
                                                       first_name = 'Irena' OR
                                                       first_name = 'Vidya' OR
                                                       first_name = 'Maya' GROUP BY gender;
