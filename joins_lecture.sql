USE codeup_test_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(35) NOT NULL UNIQUE,
    email VARCHAR(65) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    album_id INT UNSIGNED,
    PRIMARY KEY (id),
    CONSTRAINT users_albums_id_fk FOREIGN KEY (album_id) REFERENCES albums (id)
);

USE employees;

# selecting data from two tables, and joining them
# whenever theres a match from emp_no from employees, and emp_no from salaries, it'll join
SELECT employees.last_name AS name, salaries.salary AS salary FROM employees JOIN
    salaries ON employees.emp_no = salaries.emp_no;