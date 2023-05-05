USE bigfoot_test_db;

CREATE TABLE quotes (
    id INT NOT NULL AUTO_INCREMENT,
    content VARCHAR(250),
    author VARCHAR(100),
    PRIMARY KEY (id)
);

INSERT INTO quotes (content, author) VALUES
    ('To be, or not to be: that is the question.', 'William Shakespeare'),
    ('All the world\'s a stage, and all the men and women merely players.', 'William Shakespeare'),
    ('It\'s a crazy world, full of sinners and saints. Criminals and cops. Friends and foes.', 'Dr. Dre'),
    ('My crown is in my heart, not on my head; not decked with diamonds and Indian stones, nor to be seen: my crown is called content.', 'William Shakespeare'),
    ('I never sleep, cause sleep is the cousin of death.', 'Nas'),
    ('The valiant never taste of death but once.', 'William Shakespeare'),
    ('We can\'t change the world until we change ourselves.', 'Biggie Smalls'),
    ('Love looks not with the eyes, but with the mind, and therefore is winged Cupid painted blind.', 'William Shakespeare'),
    ('If you don\'t stand for something, you will fall for anything.', 'Malcolm X'),
    ('What\'s done is done.', 'William Shakespeare'),
    ('Lately I\'ve been hard to reach. I\'ve been too long on my own.', 'Dr. Dre');

CREATE TABLE authors (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(75) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO authors (name) VALUES
    ('William Shakespeare'),
    ('Dr. Dre'),
    ('Nas'),
    ('Biggie Smalls'),
    ('Malcolm X');

