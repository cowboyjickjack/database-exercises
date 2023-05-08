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

# Adding column, then the foreign key after
ALTER TABLE quotes
    ADD COLUMN author_id INT NOT NULL;

UPDATE quotes
SET author_id = (
    SELECT id
    FROM authors
    WHERE authors.name = quotes.author);

ALTER TABLE quotes DROP COLUMN author;

# NOW we can add our constraint
ALTER TABLE quotes
    ADD CONSTRAINT quotes_author_id_fk
        FOREIGN KEY (author_id)
            REFERENCES authors (id);

CREATE TABLE topics (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    topic VARCHAR(60) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO topics (topic) VALUES
    ('Life and death'),
    ('The world as a stage'),
    ('Good and evil'),
    ('Contentment and materialism'),
    ('Sleep and death'),
    ('Courage and bravery'),
    ('Personal responsibility'),
    ('Love and perception'),
    ('Standing up for oneself'),
    ('Moving on and accepting the past'),
    ('Solitude and isolation');

CREATE TABLE quotes_topics (
       quote_id INT NOT NULL,
       topic_id INT NOT NULL,
       CONSTRAINT quotes_topics_quote_id_fk FOREIGN KEY (quote_id) REFERENCES quotes(id),
       CONSTRAINT quotes_topics_topic_id_fk FOREIGN KEY (topic_id) references topics(id)
);

INSERT INTO quotes_topics (quote_id, topic_id)
VALUES
    (1, 1), (1, 3), (1, 9),
    (2, 2), (2, 7), (2, 11),
    (3, 2), (3, 3), (3, 5),
    (4, 1), (4, 4), (4, 8),
    (5, 1), (5, 5), (5, 6),
    (6, 3), (6, 5), (6, 6),
    (7, 3), (7, 6), (7, 9),
    (8, 1), (8, 4), (8, 8),
    (9, 3), (9, 6), (9, 9),
    (10, 2), (10, 4), (10, 10),
    (11, 5), (11, 8), (11, 11);

SELECT content, to