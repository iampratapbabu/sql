show databases;
use book_db;
show tables;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


USE book_db;
SELECT * FROM books;
SELECT CONCAT('hello','-','world');
USE book_db;
SELECT CONCAT(author_fname,' ',author_lname) FROM books;
SELECT CONCAT_WS('----',author_fname,author_lname) FROM books;
SELECT SUBSTRING('HELLO WORLD',1,4);
SELECT SUBSTRING('HELLO WORLD',7);
SELECT SUBSTRING('HELLO WORLD',-2);
SELECT SUBSTRING(title,1,10) AS 'SHORT TITLE' FROM books;
SELECT CONCAT(SUBSTRING(title,1,10),'...') AS 'short title' FROM books;
SELECT REPLACE('hello world','hello','78');
SELECT REPLACE('helloO','o','*'); /*case sensitive*/
SELECT REPLACE("cheese milk butter",' ',' and ');
SELECT REPLACE(title,'e','3') FROM books;
SELECT REVERSE("hello world");
SELECT CHAR_LENGTH('HELLO WORLD');
SELECT CONCAT
(author_lname, ' is ',CHAR_LENGTH(author_lname),' character in length' )
FROM books;
SELECT UPPER('Hello world');
SELECT LOWER('HEllo world');

SHOW DATABASES;
USE book_db;
select database();
SHOW TABLES;
SELECT * FROM books;
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
SELECT * FROM books;
SELECT author_lname FROM books;
SELECT DISTINCT author_lname FROM books;
SELECT released_year FROM books;
SELECT DISTINCT released_year FROM books;
SELECT DISTINCT CONCAT(author_fname,author_lname) FROM books;
SELECT DISTINCT author_fname,author_lname FROM books;
SELECT title FROM books ORDER BY title;
SELECT title FROM books ORDER BY title DESC;
SELECT released_year FROM books ORDER BY released_year;
SELECT title,pages FROM books ORDER BY released_year;
SELECT title,author_fname,author_lname FROM books ORDER BY 2;
-- 2 INDICATES AUTHOR_FNAME IF 1 WAS WRITTEN THEN IT WAS TITLE
SELECT author_fname,author_lname FROM books ORDER BY author_lname,author_fname;
SELECT title FROM books LIMIT 10;
SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 5;
SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 0,5;
SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 1,1;
SELECT title,released_year FROM books ORDER BY released_year DESC LIMIT 10,1;
-- 10,1 11TH BOOK OUTPUT DEGA IS WAY SE EXACT JIS NUMBER KA CHAHTE HAIN
-- LIKE 2ND 4TH IS WAY SE NIKAL SKTE HAIN
SELECT title,author_fname FROM books WHERE author_fname LIKE '%da%';
SELECT title,author_fname FROM books WHERE author_fname LIKE 'da%';
SELECT title,author_fname FROM books WHERE title LIKE '%the%';
SELECT title,stock_quantity FROM books;
SELECT title,stock_quantity FROM books WHERE stock_quantity LIKE '____';
-- 4 baar underscore means usse match krega jisme char character hoga
-- if 2 baar underscore means 2 char se match krega
SELECT title,stock_quantity FROM books WHERE stock_quantity LIKE '__';
SELECT title FROM books WHERE title LIKE '%\%%';
-- \ escape character used to seach % aur diff sign
SELECT title FROM books WHERE title LIKE '%\_%';

SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname,author_lname) FROM books;
SELECT COUNT(*) FROM books WHERE title LIKE '%\_%';
SELECT author_fname,author_lname FROM books;
SELECT author_fname,author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT MIN(pages) FROM books;
SELECT MAX(pages) FROM books;
SELECT MAX(pages), title FROM books;

SELECT * FROM books
WHERE pages = (SELECT MIN(pages) FROM books);
SELECT * FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT * FROM books ORDER BY pages LIMIT 1;
SELECT * FROM books ORDER BY pages DESC LIMIT 1;
SELECT * FROM books;

SELECT title,pages FROM books WHERE pages= (SELECT MIN(pages) FROM books);
SELECT author_fname,author_lname,MAX(pages) FROM books GROUP BY author_lname,author_fname;

SELECT SUM(pages) FROM books;
SELECT SUM(released_year) FROM books;
SELECT author_lname,author_fname,SUM(pages) FROM books GROUP BY author_lname,author_fname;

SELECT AVG(released_year) FROM books;
SELECT AVG(pages) FROM books;
SELECT title,AVG(stock_quantity) FROM books GROUP BY released_year;
SELECT author_fname,author_lname ,AVG(pages) FROM books GROUP BY author_lname,author_fname;

CREATE TABLE item(price DECIMAL(5,2));
INSERT INTO item(price) VALUES(7);
INSERT INTO item(price) VALUES(78465468);
INSERT INTO item(price) VALUES(864.6565);
INSERT INTO item(price) VALUES(865.56);
SELECT * FROM item;



