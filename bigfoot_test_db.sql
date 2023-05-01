USE bigfoot_test_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(35) NOT NULL,
    email VARCHAR(65) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
);