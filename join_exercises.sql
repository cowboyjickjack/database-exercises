USE join_test_db;

CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
             ('bob', 'bob@example.com', 1),
             ('joe', 'joe@example.com', 2),
             ('sally', 'sally@example.com', 3),
             ('adam', 'adam@example.com', 3),
             ('jane', 'jane@example.com', null),
             ('mike', 'mike@example.com', null);

# INNER JOIN

SELECT users.name AS user, roles.name AS role
    FROM users
    JOIN roles ON users.role_id = roles.id;

# LEFT JOIN

SELECT users.name AS user_name, roles.name AS role_name
FROM users
     LEFT JOIN roles ON users.role_id = roles.id;

# RIGHT JOIN

SELECT users.name AS user_name, roles.name AS role_name
FROM users
     RIGHT JOIN roles ON users.role_id = roles.id;

# EXERCISE TWO

USE employees;

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
    FROM departments d
        JOIN dept_manager dm on d.dept_no = dm.dept_no
        JOIN employees e on e.emp_no = dm.emp_no
        WHERE to_date LIKE '9%'
        ORDER BY dept_name;

# Find the name of all departments currently managed by women
SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM departments d
         JOIN dept_manager dm on d.dept_no = dm.dept_no
         JOIN employees e on e.emp_no = dm.emp_no
            WHERE to_date LIKE '9%'
            AND gender = 'F'
            ORDER BY dept_name;

# Find the current titles of employees currently working in the customer service dept
SELECT title, COUNT(title) AS Total FROM titles t
    JOIN dept_emp de on t.emp_no = de.emp_no
    JOIN departments d on d.dept_no = de.dept_no
    WHERE dept_name = 'Customer Service'
    AND t.to_date LIKE '9%'
    AND de.to_date LIKE '9%'
    GROUP BY title;

# Find the current salary of all current managers
SELECT dept_name AS 'Department Name',
       CONCAT(first_name, ' ', last_name) AS 'Department Manager',
       salary AS Salary
    FROM departments d
    JOIN dept_manager dm on d.dept_no = dm.dept_no # join departments to departments manager
    JOIN employees e on e.emp_no = dm.emp_no # join employees to department manager
    JOIN salaries s on e.emp_no = s.emp_no # join employees to salaries
    WHERE s.to_date LIKE '9%'
    AND dm.to_date LIKE '9%'
    ORDER BY dept_name;

# BONUS: Find the names of all current employees, their department names, and their current manager names.