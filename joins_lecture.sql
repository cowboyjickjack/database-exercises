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

INSERT INTO users (username, email, password, album_id)
VALUES
    ('john_doe', 'john_doe@example.com', 'password123', 1),
    ('jane_smith', 'jane_smith@example.com', 'password456', 2),
    ('sam_jones', 'sam_jones@example.com', 'password789', 3),
    ('joe_brown', 'joe_brown@example.com', 'password1234', 4),
    ('mary_white', 'mary_white@example.com', 'password5678', 5),
    ('david_kim', 'david_kim@example.com', 'password9012', 6),
    ('lisa_green', 'lisa_green@example.com', 'password3456', 7),
    ('steve_taylor', 'steve_taylor@example.com', 'password7890', 8),
    ('amy_harris', 'amy_harris@example.com', 'password12345', 9),
    ('jack_smith', 'jack_smith@example.com', 'password67890', 10),
    ('katie_lee', 'katie_lee@example.com', 'password123456', 11),
    ('mike_johnson', 'mike_johnson@example.com', 'password789012', 12),
    ('sara_davis', 'sara_davis@example.com', 'password345678', 13),
    ('chris_wilson', 'chris_wilson@example.com', 'password901234', 14),
    ('jessica_lee', 'jessica_lee@example.com', 'password567890', 15);


USE employees;

# BASIC JOIN (AKA INNER JOIN)
# selecting data from two tables, and joining them
# whenever theres a match from emp_no from employees, and emp_no from salaries, it'll join
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS name, salaries.salary AS salary FROM employees JOIN
    salaries ON employees.emp_no = salaries.emp_no;

# LEFT JOIN
# (will give results when there's no match in the table, but useful for finding when something HASN'T happened
# OR when there is no value)

USE codeup_test_db;

DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

INSERT roles (name) VALUES ('admin');
INSERT roles (name) VALUES ('author');
INSERT roles (name) VALUES ('reviewer');
INSERT roles (name) VALUES ('commenter');

ALTER TABLE users ADD COLUMN role_id INT UNSIGNED;
ALTER TABLE users ADD CONSTRAINT fk_users_role_id FOREIGN KEY (role_id) REFERENCES roles(id);

UPDATE users SET role_id = 1 WHERE id = 1;
UPDATE users SET role_id = 2 WHERE id = 3;
UPDATE users SET role_id = 3 WHERE id = 5;
UPDATE users SET role_id = 4 WHERE id = 7;
UPDATE users SET role_id = 1 WHERE id = 9;
UPDATE users SET role_id = 2 WHERE id = 11;
UPDATE users SET role_id = 3 WHERE id = 13;
UPDATE users SET role_id = 4 WHERE id = 15;

INSERT INTO roles (name) VALUES ('bot');

SELECT users.username, roles.name FROM users JOIN roles ON users.role_id = roles.id;

SELECT users.username, roles.name FROM users LEFT JOIN roles ON users.role_id = roles.id;

CREATE TABLE users_albums (
                      user_id INT NOT NULL,
                      album_id INT UNSIGNED NOT NULL,
                      CONSTRAINT users_albums_user_id_fk FOREIGN KEY (user_id) REFERENCES users (id),
                      CONSTRAINT users_albums_album_id_fk FOREIGN KEY (album_id) REFERENCES albums (id)
);

TRUNCATE users_albums;

INSERT INTO users_albums (user_id, album_id)
SELECT u.id, a.id
FROM users u
         CROSS JOIN albums a
WHERE RAND() < 5/(SELECT COUNT(*) FROM albums)
GROUP BY u.id, a.id
HAVING COUNT(*) < 5 OR RAND() < 0.5;

SELECT users.username, albums.name FROM users JOIN users_albums ON users.id = users_albums.user_id JOIN albums on users_albums.album_id = albums.id;

USE employees;

SELECT CONCAT(first_name, ' ', last_name), salary
FROM salaries s JOIN dept_emp de ON s.emp_no = de.emp_no
                JOIN departments d on de.dept_no = d.dept_no
                JOIN employees e on de.emp_no = e.emp_no
WHERE d.dept_name = 'Research'
  AND s.to_date = '9999-01-01'
ORDER BY salary DESC;