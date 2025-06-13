CREATE DATABASE MOVIESDATA;
Use MOVIESDATA;
CREATE TABLE MOVIESTABLE(
movie_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255),
release_year YEAR NOT NULL,
genre VARCHAR(100) NOT NULL,
language VARCHAR(100) DEFAULT 'Telugu',
duration_minutes INT NOT NULL,
rating DECIMAL(3,1),
director_id INT,
FOREIGN KEY(director_id) REFERENCES DIRECTORS(director_id)
);

CREATE TABLE DIRECTORS(
director_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255),
dod DATE,
nationality VARCHAR(100),
awards TEXT
);


CREATE TABLE Heros(
actor_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255),
dod DATE,
gender VARCHAR(100),
nationality VARCHAR(100),
debut_year YEAR
);

CREATE TABLE Movie_Cast (
  movie_id INT,
  actor_id INT,
  role_name VARCHAR(255),
  screen_time_minutes INT,
  FOREIGN KEY(movie_id) REFERENCES MOVIESTABLE(movie_id),
  FOREIGN KEY(actor_id) REFERENCES HEROS(actor_id),
  PRIMARY KEY(movie_id, actor_id)
);

CREATE TABLE Box_Office(
movie_id INT,
budget BIGINT,
box_office_collection BIGINT,
domestic_collection BIGINT,
international_collection BIGINT,
FOREIGN KEY (movie_id) REFERENCES MOVIESTABLE(movie_id),
PRIMARY KEY(movie_id)
);

INSERT INTO DIRECTORS(name, dod, nationality, awards) VALUES
('S.S. Rajamouli', '1973-10-10', 'Indian', 'Padma Shri, Nandi Award'),
('Trivikram Srinivas', '1971-11-07', 'Indian', 'Nandi Award, SIIMA Award'), 
('Puri Jagannadh', '1966-09-28', 'Indian', 'Nandi Award, Filmfare Award'),
('Sukumar', '1970-01-11', 'Indian', 'Filmfare Award, Nandi Award'), 
('V. V. Vinayak', '1974-10-09', 'Indian', 'Nandi Award'),
('Koratala Siva', '1975-06-15', 'Indian', NULL), 
('Boyapati Srinu', '1971-04-01', 'Indian', 'Nandi Award'),
('Harish Shankar', '1982-03-31', 'Indian', NULL), 
('Srinu Vaitla', '1972-09-24', 'Indian', NULL),
('Gautham Vasudev Menon', '1973-02-25', 'Indian', 'Nandi Award');

INSERT INTO MoviesTable (title, release_year, genre, duration_minutes, rating, director_id) VALUES
('Baahubali: The Beginning', 2015, 'Action', 159, 8.1, 1),
('Ala Vaikunthapurramuloo', 2020, 'Drama', 165, 7.8, 2),
('Pokiri', 2006, 'Action', 155, 7.9, 3),
('Rangasthalam', 2018, 'Drama', 179, 8.4, 4),
('Tagore', 2003, 'Action', 180, 7.5, 5),
('Bharat Ane Nenu', 2018, 'Political', 173, 7.7, 6),
('Sarrainodu', 2016, 'Action', 160, 6.8, 7),
('Gabbar Singh', 2012, 'Action', 152, 7.2, 8),
('Dookudu', 2011, 'Comedy', 175, 7.5, 9),
('Yennai Arindhaal', 2015, 'Action', 176, 7.3, 10);

INSERT INTO Heros (name, dod, gender, nationality, debut_year) VALUES
('Prabhas', '1979-10-23', 'M', 'Indian', 2002),
('Allu Arjun', '1983-04-08', 'M', 'Indian', 2003),
('Mahesh Babu', '1975-08-09', 'M', 'Indian', 1999),
('Ram Charan', '1985-03-27', 'M', 'Indian', 2007),
('Chiranjeevi', '1955-08-22', 'M', 'Indian', 1978),
('Jr. NTR', '1983-05-20', 'M', 'Indian', 2001),
('Pawan Kalyan', '1971-09-02', 'M', 'Indian', 1996),
('Nagarjuna', '1959-08-29', 'M', 'Indian', 1986),
('Nani', '1984-02-24', 'M', 'Indian', 2008),
('Samantha Ruth Prabhu', '1987-04-28', 'F', 'Indian', 2010);

INSERT INTO Movie_Cast (movie_id, actor_id, role_name, screen_time_minutes) VALUES
(1, 1, 'Shivudu', 120),
(2, 2, 'Bantu', 140),
(3, 3, 'Pandu', 130),
(4, 4, 'Chitti Babu', 150),
(5, 5, 'Tagore', 160),
(6, 6, 'Bharat', 145),
(7, 2, 'Gana', 135),
(8, 7, 'Gabbar Singh', 125),
(9, 3, 'Ajay', 150),
(10, 9, 'Sathyadev', 160);

INSERT INTO Box_Office (movie_id, budget, box_office_collection, domestic_collection, international_collection) VALUES
(1, 1800000000, 6000000000, 4500000000, 1500000000),
(2, 100000000, 2700000000, 2100000000, 600000000),
(3, 120000000, 660000000, 500000000, 150000000),
(4, 150000000, 3650000000, 2800000000, 850000000),
(5, 200000000, 300000000, 250000000, 50000000), 
(6, 120000000, 2250000000, 1800000000, 450000000), 
(7,70000000, 1270000000, 1000000000, 270000000),
(8,50000000, 1500000000, 1200000000, 300000000),
(9, 35000000, 1000000000, 800000000, 200000000),
(10, 55000000, 850000000, 700000000, 150000000);

SELECT * FROM box_office;

SELECT budget, box_office_collection from Box_Office;

select title, release_year from moviestable;

select * from moviestable;

create table books(book_id int primary key auto_increment, title varchar(255), author_name varchar(100), genre tinytext, price double, published_year Year, in_stock boolean);

Insert into books (title, author_name, genre, price, published_year, in_stock) values ('Selfless Dad', 'Ganesh','Emotional', 10000, 2025,true);

Insert into books (title, author_name, genre, price, published_year, in_stock) values ('RealQUEEN IS MOM', 'A.G','Emotional & Dramatic', 1000000, 2023, false);

select title, published_year from books;

select * from books;


-- CONSTRAINTS
-- To specify rules for data in a table

-- 1. NOT NULL :- ensures column does not conatins null values
-- Syntax:- Col_Name Data_Type NOT NULL;

create table Employees(
employee_id int primary key,
name varchar(100) not null,
salary decimal(10,2)
);

INSERT INTO EMPLOYEES VALUES (1201, 'Ganesh', 100000);

SELECT * FROM Employees;

CREATE TABLE Users(
User_id int PRIMARY KEY,
User_Name VARCHAR(100) UNIQUE
);

INSERT INTO USERS VALUES (100, 'GANESH'), (200, 'ADDAGIRI');

SELECT * FROM USERS;

CREATE TABLE Orders(
Order_id INT PRIMARY KEY,
Order_date DATE DEFAULT '2025-06-06'
);

INSERT INTO ORDERS VALUES (100, '2025-10-06');

INSERT INTO ORDERS(Order_id) VALUES (200);

SELECT * FROM ORDERS; -- HERE IT CONSUMES DEFAULT VALUES INSERTED IN THE TABLE.

-- CHECK: ENSURES THAT ALL VALUES IN A COULMN SATISFY A SPECIFIC CONDITION. IT IS USED TO LIMIT THE RANGE OF VALUES THAT CAN INSERTED INTO A CLOUMN
CREATE TABLE PRODUCTS(
Product_id int PRIMARY KEY,
Price INT,
Quantity INT CHECK(Quantity >= 0)
);

INSERT INTO PRODUCTS VALUES(100, 1000, 2);

INSERT INTO PRODUCTS VALUES(100, 1000, -1); -- THIS IS NOT POSSIBLE BEACUSE VIOLATION OCCURS DUE TO THE CHECK CONSTRAINT

-- WHERE : IT IS USED TO FILTER THE RECORDS IN A QUERY BASED ON A SPECIFIC CONDITIONS.

SELECT * FROM MOVIESTABLE WHERE release_year = 2011;

SELECT * FROM MOVIESTABLE WHERE release_year >= 2011;

-- USING OPERATORS WITH WHERE(ARITHEMATIC, COMPARISION, LOGICAL, BITWISE)
-- Profit/Loss: to ensures this retrived as box_Office_Collection - budget

-- ARITHEMATIC OPERATIONS:

SELECT Movie_id, box_office_collection - budget AS Profit_Loss FROM box_office;

-- Doubling the Budget

SELECT Movie_id, budget, budget * 2 AS DOUBLEDBUDGET FROM box_office;

-- COMPARISION OPERATION (=, !=, <=, >=, <, >)

SELECT * FROM HEROS;

SELECT * FROM HEROS WHERE debut_year > 2000;

SELECT * FROM MOVIESTABLE;

-- LOGICAL OPERATORS:
SELECT title, release_year FROM MOVIESTABLE WHERE LANGUAGE = 'TELUGU' AND RELEASE_YEAR = 2015;

SELECT title, release_year FROM MOVIESTABLE WHERE LANGUAGE = 'TELUGU' or RELEASE_YEAR = 2012;

Insert into MoviesTable (title, release_year, genre, duration_minutes, rating, director_id) VALUES 
('Dabang', 2012, 'Action', '140', 9.0,11);

Insert into MoviesTable (title, release_year, genre, LANGUAGE, duration_minutes, rating, director_id) VALUES 
('Dabang', 2012, 'Action', 'MALAYALAM','140', 9.0,11);

Insert into Directors (name, dod, nationality, awards) VALUES ('Aamir Khan', '2025-06-06', 'Indian', 'Sima');

SELECT * FROM MOVIESTABLE WHERE LANGUAGE = 'TELUGU' OR RELEASE_YEAR = 2012; 

SELECT * FROM MOVIESTABLE WHERE NOT LANGUAGE = 'TELUGU';

SELECT * FROM MOVIESTABLE WHERE LANGUAGE IN ('TELUGU' , ' hINDI');

SELECT * FROM MOVIESTABLE WHERE LANGUAGE NOT IN ('TELUGU');

-- The difference between in and = here is that, in the in domain we can give multiple values inside the parameter

SELECT * FROM MOVIESTABLE;

-- LIKE IN MYSQL IS USED TO REPRESENT ZERO, ONE, TWO OR MULTIPLE CHARACTERS

SELECT * FROM MOVIESTABLE WHERE TITLE LIKE 'baahu%';

SELECT * FROM HEROS;

SELECT * FROM HEROS WHERE NAME LIKE '%ra%'; -- means infront of r, charcters should be anything and after that characters should be anything here by the way.

SELECT * FROM MOVIESTABLE WHERE TITLE LIKE 'PO_IR_'; -- UNDERSCORE IS JUST LIKE A PLACEHOLDER USED TO GET THE THAT SPECIFIED VALUE WHEN REQUIRED WE KEEP PLACE HOLDER AT THAT TIME

-- NOTE:-
-- % REPRESENTS MORE THAN SINGLE CHARACTER
-- _ REPRESENTS TO ONE AND ONLY SINGLE CHARACTER

-- ORDER BY IS USED TO RETRIEVE THE DATA IN EITHER ASCENDING ORDER OR DESCENDING ORDER i.e., SORTING TO BE SAY EXACTLY
SELECT TITLE, RELEASE_YEAR FROM MOVIESTABLE ORDER BY RELEASE_YEAR ASC;

-- LIMIT - IT IS USED TO GET UPTO HOW MANY VALUES WE NEED TO RETRIEVE
SELECT NAME, DOD FROM HEROS LIMIT 4;

-- AGGREGATE FUNCTIONS:
-- COUNT(*)
SELECT COUNT(*) FROM MOVIESTABLE;

-- MAX()
SELECT MAX(BUDGET) FROM BOX_OFFICE;

-- MIN()
SELECT MIN(BUDGET) FROM BOX_OFFICE;

-- SUM()
SELECT SUM(BOX_OFFICE_COLLECTION) FROM BOX_OFFICE;

-- AVERAGE()
SELECT AVG(RATING) FROM MOVIESTABLE;

INSERT INTO MoviesTable (movie_id, title, language, release_year) VALUES
(11, 'Example Movie 11', 'English', 2022),
(12, 'Example Movie 12', 'Hindi', 2023);

INSERT INTO Box_Office (movie_id, budget, box_office_collection, domestic_collection, international_collection) VALUES
(11, 1800000000, 50000000, 470000, 150000),(12, 9000000, 50000, 4800000, 350000);

select LANGUAGE, SUM(BOX_OFFICE_COLLECTION) AS TOTAL_COLLECTION
FROM MOVIESTABLE m
JOIN BOX_OFFICE b 
ON m.movie_id = b.movie_id group by LANGUAGE;

-- Step 1: Add movies first
INSERT INTO MoviesTable (title, release_year, genre, duration_minutes, rating, director_id) VALUES
('Example Movie 19',  2022, 'Bromance', 190, 8.5, 19),
('Example Movie 20',  2023, 'Action', 150, 9.5, 20);

-- Step 2: Then add Box Office details
INSERT INTO Box_Office (movie_id, budget, box_office_collection, domestic_collection, international_collection) VALUES
(19, 1800000000, 6000000000, 4500000000, 1500000000),
(20, 9000000, 50000, 4800000, 350000);

-- GROUP BY CLAUSE:
-- It groups rows that have same values in specified columns into summary rows, like 'total', 'avearge', 'count' etc. it is often used with aggregate functions.
-- Here in this example it groups the language rows as a single specified value to encompasses to give the total collection of movies in that particular telugu language.


SELECT m.language, SUM(b.box_office_Collection) AS total_collection FROM MoviesTable AS m JOIN Box_Office as b ON m.movie_id = b.movie_id group by m.language;

INSERT INTO Box_Office (movie_id, budget, box_office_collection, domestic_collection, international_collection) VALUES
(14, 18000, 66780, 4512300, 1567000),
(15, 9000, 6785900, 21567800, 6680000);

SELECT * FROM BOX_OFFICE;


-- HAVING CLAUSE:-
-- Having class is used to filter the groups created by the Group-By clause, it is similar to the WHERE Clause but it is used with aggregate functions.
SELECT m.language as Native, SUM(b.box_office_collection) as NativeCollection from MOVIESTABLE as m JOIN 
box_office as b ON m.movie_id = b.movie_id group by m.language having SUM(b.box_office_collection) >= 50000;
-- it really works wells with the group by clause along with the aggregate functions.

-- ORDER OF MENTIONING SQL CLAUSES:
-- SELECT
-- FROM
-- JOIN
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
-- LIMIT

SELECT
  m.title,
  SUM(b.box_office_collection) AS total_gross
FROM MoviesTable m
JOIN Box_Office b ON m.movie_id = b.movie_id
WHERE
  m.language = 'Telugu'
  AND b.budget > 20000000
GROUP BY
  m.title
ORDER BY
  total_gross DESC
LIMIT 5;

select m.title, sum(b.box_office_collection) as total 
from MOviesTable m JOIN Box_Office b On m.movie_id = b.movie_id
WHERE 
m.language = 'Telugu' AND b.budget > 2000000
Group by m.title
Order by total DESC
limit 5;

-- CRUD Operations:-
-- Create
-- Read
-- Update
-- Delete

-- Update is used to modify the existing records
-- Syntax:- Update table_name SET colum1 = value1, column2 = value2 WHERE Condition;
UPDATE MoviesTable SET rating = 9.0 WHERE title = 'RRR'; -- gives error because no record is been there here in this database.

SELECT * FROM MOVIESTABLE;

-- SQL_SAFE_UPADTES IS THE THING USED TO ALLOW TO UPDATE RECORDS IN THE EXISTING COLUMNS IN THE DATABASE, UNTIL OR UNLESS WITH THIS WE CAN'T ABLE TO INITIALISE THIS. 
SET SQL_SAFE_UPDATES = 0;
-- to turn on the safe mode we use this query ofcourse.
SET SQL_SAFE_UPDATES = 1;

UPDATE MoviesTable
SET rating = 9.0
WHERE title = 'Pokiri';

-- DELETE :- USED TO REMOVE THE EXISTING RECORDS
delete from MoviesTable Where title = 'Pokiri';

CREATE TABLE Dummy(
name VARCHAR(10)
);

INSERT INTO DUMMY VALUES ('DUMMY');
SELECT * FROM DUMMY;

DELETE FROM DUMMY WHERE NAME = 'DUMMY';

SELECT * FROM DUMMY; -- THIS ENSURES TO REMOVE THE RECORD FROM EXISTED DATA AS RECORDS.

-- CASCADING FOR FOREIGN KEYS:-
-- ON DELETE CASCADE:
-- Automatically deletes all rows in the child table references to the deleted row in the parent table


CREATE DATABASE Devara;
use devara;

CREATE TABLE MOVIES(
movie_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255),
release_year YEAR ,
genre VARCHAR(100) ,
language VARCHAR(100) DEFAULT 'Telugu',
duration_minutes INT,
rating DECIMAL(3,1)
);

CREATE TABLE Box_Office(
box_Office_ID int primary key auto_increment,
movie_id INT,
budget BIGINT,
box_office_collection BIGINT,
FOREIGN KEY (movie_id) REFERENCES MOVIES(movie_id)
ON DELETE CASCADE
);

INSERT INTO MOVIES (title, release_year, genre, language, duration_minutes, rating) VALUES
('RRR', 2022, 'Action', 'Telugu', 182, 8.8),
('Baahubali: The Beginning', 2015, 'Epic', 'Telugu', 159, 8.0),
('Baahubali: The Conclusion', 2017, 'Epic', 'Telugu', 167, 8.2),
('Pushpa: The Rise', 2021, 'Action', 'Telugu', 179, 7.6),
('Arjun Reddy', 2017, 'Romantic Drama', 'Telugu', 186, 8.1),
('Eega', 2012, 'Fantasy', 'Telugu', 145, 7.7),
('Sita Ramam', 2022, 'Romance', 'Telugu', 163, 8.5),
('Jersey', 2019, 'Sports Drama', 'Telugu', 157, 8.6),
('Ala Vaikunthapurramuloo', 2020, 'Family Drama', 'Telugu', 165, 7.4),
('Mahanati', 2018, 'Biographical', 'Telugu', 177, 8.5);


SELECT * FROM MOVIES;

INSERT INTO Box_Office (movie_id, budget, box_office_collection) VALUES
(1, 550000000, 1200000000),   -- RRR
(2, 180000000, 650000000),    -- Baahubali: The Beginning
(3, 250000000, 1700000000),   -- Baahubali: The Conclusion
(4, 200000000, 370000000),    -- Pushpa: The Rise
(5, 50000000, 510000000),     -- Arjun Reddy
(6, 26000000, 130000000),     -- Eega
(7, 30000000, 105000000),     -- Sita Ramam
(8, 28000000, 48000000),      -- Jersey
(9, 100000000, 280000000),    -- Ala Vaikunthapurramuloo
(10, 25000000, 85000000);     -- Mahanati

SELECT * FROM BOX_OFFICE;

DELETE FROM BOX_OFFICE WHERE movie_id = 1;

SELECT * FROM BOX_OFFICE;

-- ON UPDATE :- Ensures Automatically updates all rows in the child table when referred row in the parent table is updated
CREATE DATABASE PUSHPA; 
USE PUSHPA;

set sql_safe_updates = 0;
UPDATE MOVIES SET MOVIE_ID = 143 WHERE TITLE = 'EEGA'; -- Throws error because cannot delete or update a parent row due to the referentaial action exceeded.
CREATE TABLE MOVIES(
movie_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255),
release_year YEAR ,
genre VARCHAR(100) ,
language VARCHAR(100) DEFAULT 'Telugu',
duration_minutes INT,
rating DECIMAL(3,1)
);

CREATE TABLE Box_Office(
box_Office_ID int primary key auto_increment,
movie_id INT,
budget BIGINT,
box_office_collection BIGINT,
FOREIGN KEY (movie_id) REFERENCES MOVIES(movie_id)
ON UPDATE CASCADE
);

INSERT INTO MOVIES (title, release_year, genre, language, duration_minutes, rating) VALUES
('RRR', 2022, 'Action', 'Telugu', 182, 8.8),
('Baahubali: The Beginning', 2015, 'Epic', 'Telugu', 159, 8.0),
('Baahubali: The Conclusion', 2017, 'Epic', 'Telugu', 167, 8.2),
('Pushpa: The Rise', 2021, 'Action', 'Telugu', 179, 7.6),
('Arjun Reddy', 2017, 'Romantic Drama', 'Telugu', 186, 8.1),
('Eega', 2012, 'Fantasy', 'Telugu', 145, 7.7),
('Sita Ramam', 2022, 'Romance', 'Telugu', 163, 8.5),
('Jersey', 2019, 'Sports Drama', 'Telugu', 157, 8.6),
('Ala Vaikunthapurramuloo', 2020, 'Family Drama', 'Telugu', 165, 7.4),
('Mahanati', 2018, 'Biographical', 'Telugu', 177, 8.5);


SELECT * FROM MOVIES;

INSERT INTO Box_Office (movie_id, budget, box_office_collection) VALUES
(1, 550000000, 1200000000),   -- RRR
(2, 180000000, 650000000),    -- Baahubali: The Beginning
(3, 250000000, 1700000000),   -- Baahubali: The Conclusion
(4, 200000000, 370000000),    -- Pushpa: The Rise
(5, 50000000, 510000000),     -- Arjun Reddy
(6, 26000000, 130000000),     -- Eega
(7, 30000000, 105000000),     -- Sita Ramam
(8, 28000000, 48000000),      -- Jersey
(9, 100000000, 280000000),    -- Ala Vaikunthapurramuloo
(10, 25000000, 85000000);     -- Mahanati

UPDATE Movies SET title = 'RR' WHERE movie_id  = 1; 
UPDATE Movies SET MOVIE_ID  = 143 WHERE movie_id  = 1; 

SELECT * FROM MOVIES;

SELECT * FROM BOX_OFFICE; -- WHATEVER THE VALUE CHANGED IN THE PARENT QUERY IS ALSO RESEMBLES TO BE CHANGED IN THE CHILD QUERY DUE THE REFERENTIAL ACTION CALLED ON UPDATE CASCADE

-- SET NULL:- ENSURES THAT THE ROW OR A RECORD USUALLY DELETED OR UPDATED IN THE PARENT TABLE THEN THE FOREIGN KEY IN THE CHILD TABLE IS SET TO NULL VALUE
 
-- SET DEFAULT:- ENSURES THAT THE ROW OR A RECORD USUALLY DELETED OR UPDATED IN THE PARENT TABLE THEN THE FOREIGN KEY IN THE CHILD TABLE IS SET TO DEFAULT VALUE

-- NO ACTION:- THE DEFAULT BEHAVIOUR WHERE NO ACTION IS TAKEN ON THE CHILD TABLE WHEN THE PARENT TABLE IS UPDATED OR DELETED

-- RESTRICT:- PREVENTS THE DELETE OR UPDATE OPERATION ON THE PARENT TABLE IF THERE ARE RELATED ROWS IN THE CHILD TABLE.

-- ALTER COMMANDS:-
ALTER TABLE MOVIES ADD DIRECTO_ID INT; -- IT IS USED TO ADD NEW COLUMN IN THE DATABASE TABLE

SELECT *  FROM MOVIES;

UPDATE MOVIES SET DIRECTO_ID = 1 WHERE TITLE = 'SITA RAMAM';

-- MODIFY IS USED TO CHANGE THE DATA-TYPE OF EXISTING COLUMN OR RECORD ACCORDINGLY
ALTER TABLE MOVIES MODIFY RATING DECIMAL(4,2);

-- DROP IS USED TO REMOVE THE EXISTING RECORDS IN THE DATABASE
ALTER TABLE MOVIES DROP COLUMN DIRECTO_ID; 
DROP TABLE BOX_OFFICE;
SELECT * FROM BOX_OFFICE; -- GIVES ERROR DUE TO DOESN'T EXISTS HERE IN THE PUSHPA DATABASE

RENAME TABLE MOVIES TO FILMS; -- TRANSFROMS THE  NAME OF TABLE MOVIES AS FILMS BY USING THIS COMMAND
SELECT * FROM FILMS;

 TRUNCATE TABLE FILMS; -- ENSURES TO REMOVE THE TOTAL EXISTED DATA IN THE TABLE WITHOUT LOSING THE CANDITATURE OF THE TABLE NAME EXISTS IN THE DATABASE
 
 SELECT * FROM FILMS; -- ALL RECORDS DELETEED BUT TABLE REMAINS SAME.
 
CREATE DATABASE JOINS_INTRODUCTION;
USE JOINS_INTRODUCTION;

CREATE TABLE MOVIES(
movie_id INT,
title VARCHAR(255),
director_id INT
);

CREATE TABLE DIRECTORS(
director_id INT,
name VARCHAR(100)
);

INSERT INTO MOVIES VALUES(1,'RRR', 101), (2, 'PUSHPA', 102), (3, 'KGF', 103);

INSERT INTO DIRECTORS VALUES(101, ' S.S RAJAMOULI'), (102, 'SUKUMAR'), (104, 'PRASHANTH NEEL');

SELECT * FROM MOVIES;
SELECT * FROM DIRECTORS;

-- INNER JOIN IS THE TERM IS USED TO ENCOMPASS THE RECORDS OF TWO TABLES WHEN THERE IS ANY ONE MATCHING RECORD/ COLUMN IN THE EXISTING TABLES OF PARTICULAR DATBASE 
SELECT * FROM Movies m INNER JOIN DIRECTORS d
ON m.director_id = d.director_id;

-- OUTER JOINS:- LEFT JOIN, RIGHT JOIN, FULL JOIN, 
-- CROSS JOIN, SLEF JOIN

SELECT m.title AS FILM_NAME, d.name AS CAST_LEAD FROM MOVIES AS M JOIN DIRECTORS AS D ON m.director_id = d.director_id; 

-- LEFT JOIN:- RETURNS ALL ROWS FROM THE LEFT TABLE AND THE MATCHED ROWS FROM THE RIGHT TABLE, IF THERE IS NO MATCH NULL VALUES ARE RETURNED FOR COLUMNS FROM THE RIGHT TABLE THEN IT GIVES NULL VALUES.
SELECT m.title as Title, d.name as Name FROM Movies m LEFT JOIN DIRECTORS D ON m.director_id = d.director_id; 

-- RIGHT JOIN:- RETURNS ALL ROWS OF RIGHT TABLE AND THE MATCHED ROWS FROM THE LEFT TABLE, IF THERE IS NO MATECHED VALUES ARE REFTURNED FOR NULL IN THE LEFT TABLE WITH NULL VALUES
SELECT * FROM Movies m RIGHT JOIN DIRECTORS D ON m.director_id = d.director_id;

-- CROSS JOIN:- IT RETURNS THE CARTESIAN PRODUCT OF TWO TABLES, MEANING IT RETURNS ALL POSSIBLE COMBINITIONS OF ROWS. THIS TYPE OF JOIN IS RARELY USED BECAUSE IT CAN PRODUCE LARGE NO. OF VALUES
SELECT * FROM Movies CROSS JOIN Directors;

-- SELF JOIN:- IT IS A JOIN OF A TABLE WITH ITSELF. THIS IS USEFUL FOR COMPARING ROWS WITHIN THE SAME TABLE.
SELECT a.title as Movie1, b.title as Movie2, a.release_year FROM Movies a, Movies b WHERE a.release_year = b.release_year AND a.movie_id < b.movie_id;
-- Baahubali: The Beginning, Yennai Arindhaal, 2015
-- # Movie1, Movie2, release_year
-- 'Rangasthalam', 'Bharat Ane Nenu', 2018

USE Movies; 


-- UNIOIN: UNION IS USED TO COMBINE THE RESULT-SET OF TWO OR MORE SELECT STATEMENTS IN A SINGLE COLUMN.
SELECT title as FILMNAME FROM MOVIES
UNION 
SELECT DIRECTOR_ID as ID FROM DIRECTORS;

-- SUBQUERIES:- 
-- IN SIMPLE WORDS SUB-QUERY MEANS A QUERY IN A QUERY IS CALLED SUB-QUERY.
USE Movies; 
SELECT * from Movies;
-- Database Name Used Here is :- DEVARA
SELECT * FROM BOX_OFFICE;

-- SUBQUERY IN THE CLAUSE:-

SELECT BUDGET FROM BOX_OFFICE WHERE BUDGET > (SELECT AVG(BUDGET) FROM BOX_OFFICE); -- SUB QUERY

SELECT AVG(BUDGET) FROM BOX_OFFICE; -- THIS QUERY IS PLACED AS SUB-QUERY IN THE ABOVE QUERY.

-- SUBQUERY IN THE SELECT CLAUSE :- IN THE SELECT CLAUSE STATEMENT WE USED TO CONSIDER THE SELECT STATEMENT IN THE SELECT DOMAIN BEFORE GOING AHEAD TO THE FROM CLAUSE.
SELECT title, (SELECT name FROM Directors WHERE Directors.director_id = Movies.movie_id) AS director_name FROM Movies;

-- SUBQUERY IN THE FROM CLAUSE:-
-- AVERAGE BUDGET OF MOVIES TO THE YEARLY BUDGET OF MOVIES
SELECT release_year, AVG(budget) AS AVERAGE_BUDGET
FROM(SELECT release_year, budget FROM MOVIES) AS YEARLY_BUDGETS
GROUP BY release_year;

-- SUBQUERY IN THE HAVING CLAUSE:-
-- FIND GENRES THAT HAVE AN AVERAGE MOVIE RATING HIGHER THAN OVERALL MOVIE RATING
SELECT genre, AVG(rating) AS avg_genre_rating
FROM Movies
GROUP BY GENRE
HAVING AVG(rating) > (SELECT AVG(rating) FROM Movies);

-- genre, avg_genre_rating
-- 'Drama', '8.10000'
-- 'Political', '7.70000'





