USE employees;

DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;

USE codeup_test_db;

SHOW INDEXES FROM albums;

ALTER TABLE albums DROP INDEX unique_artist_and_name;

SHOW INDEXES FROM albums;

ALTER  TABLE albums ADD UNIQUE unique_artist_and_name (artist, name);

SHOW INDEXES FROM albums;