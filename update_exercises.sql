USE codeup_test_db;

SELECT * FROM albums;

SELECT * FROM albums WHERE release_date < 1980;

SELECT * FROM albums WHERE artist = 'Michael Jackson';

UPDATE albums
SET sales = (sales * 10);

SELECT * FROM albums;

UPDATE albums
SET release_date = release_date - 100
WHERE release_date < 1980;

SELECT * FROM albums;

UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';

SELECT * FROM albums;

DELETE FROM albums WHERE genre = 'Disco';

SELECT * FROM albums;

