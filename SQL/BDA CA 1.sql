## Table are already imported trough CSV data set 
CREATE DATABASE Ireflix;
USE Ireflix;
-- ●	Identify and implement relationships between tables using Primary Keys (PKs)
--  and Foreign Keys (FKs) to maintain data integrity.
-- Create relationship by Inner join using table movies3 and movies_year
-- primary key is Movie_ID in Movie3 Table and also a FK in movies_year Table
SELECT m.movie_ID,
m.title,
m.genre,
m.protagonist_actor_name,
m.protagonist_actor_surname,
mi.movies_year
FROM movies_year As mi
INNER JOIN movies3 AS m ON mi.movie_ID= m.movie_ID;

-- Create relationship by using left join ,  
-- using table movies3, movies_year and useractivitymovies
-- In this query - primary key is Movie_ID and movies_yeat in Movie3 Table and 
-- also a FK in movies_year Table and useractivitymovies Table
SELECT m.movie_ID,
m.title,
m.genre,
m.protagonist_actor_name,
m.protagonist_actor_surname,
mi.movies_year,
mu.username
FROM movies3 As m
LEFT JOIN movies_year AS mi ON m.movie_ID= mi.movie_ID
LEFT JOIN useractivitymovies AS mu ON m.genre= mu.genre;

-- Create relationship by using right join, using table series2 and useractivityseries
SELECT s.series_ID,
s.title,
s.genre,
si.Username
FROM useractivityseries As si
Right JOIN series2 AS s ON si.series_ID= s.series_ID;

-- -- Create relationship by using Right join, sing table series2 , user 1 and useractivityseries  
SELECT s.series_ID,
s.title,
si.genre,
su.Username
FROM series2 As s
Right JOIN useractivityseries AS si ON s.series_ID= si.series_ID
Right JOIN users As su ON si.Username= su.Username;

-- ●	Modify the database to include year details for movies 
-- and series in the appropriate tables, using synthetic data.
-- movies_year column in movies_yeartable which can be jopin together using inner jpinh 
-- Inner Join is already presented from line 6 to line 13 above.
-- We can also Alter the orignal table by creating new column in this and update that column
ALTER TABLE movies3 ADD column movies_year YEAR;
UPDATE movies3 m
JOIN movies_year mi
ON m.movie_ID = mi.movie_ID
SET m.movies_year= mi.movies_year;
-- to remove error in update column of 1175 take help form chat gpt 
SET SQL_SAFE_UPDATES = 0;

-- update series2 table bring year from series_year table
ALTER TABLE series2 ADD column Series_year Year;
UPDATE series2 AS s
JOIN series_year As si
ON s.series_ID= si.series_ID
SET s.series_year= si.series_year;
-- RUN Table serie2 
SELECT*FROM series2;

-- ●	Choose a well-known actor who has played leading roles in multiple movies,
-- determine how many movies they appeared in,
 -- and retrieve a list of actors who were protagonists in movies but not in series.
SELECT DISTINCT 
protagonist_actor_name,
protagonist_actor_surname
FROM movies3 
WHERE (protagonist_actor_name, protagonist_actor_surname) NOT IN(
SELECT 
protagonist_actor_name, 
protagonist_actor_surname FROM series2
);

-- ●	Write three additional queries based on your understanding,
-- using WHERE, GROUP BY, and HAVING clauses.
-- Group By
SELECT series_ID, COUNT(*) AS ID_Count
FROM series2
GROUP BY series_ID;

SELECT genre, COUNT(*) AS genre_count
FROM movies3
GROUP BY genre;

-- WHERE # where is use to filter the data . in this query we are filtering movie data with 
-- movies that published in 2019 and later.
SELECT movie_ID, title, genre, movies_year
FROM movies3
WHERE movies_year >= 2019;

SELECT Username, series_ID, genre
FROM useractivityseries
WHERE genre = 'Animation';

-- HAVING
SELECT duration, COUNT(*) AS max_duration
FROM movies3
GROUP BY duration
HAVING COUNT(*) > 10;

SELECT genre, COUNT(*) AS total_series
FROM series2
GROUP BY genre
HAVING Count(*) >20;

  










