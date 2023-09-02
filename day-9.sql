-- Group By
--  foreach group we can apply agg. functions like : COUNT(), MAX(),MIN(), SUM() etc

-- GROUP BY eleminates duplicates values from the result set

get count of all movies group by movie_language

SELECT * FROM movies --53
-- Group by must Needs PRIMARY KEY if result set contains it
SELECT movie_lang, Count(movie_lang) FROM movies GROUP BY movie_lang -- 53

-- get avg. movie_len group by movie_language
SELECT movie_lang, avg(movie_length) from movies GROUP BY movie_lang ORDER BY movie_lang

-- get sum of total movie length per age certificate

SELECT * FROM movies --53
SELECT age_certificate, SUM(movie_length) FROM movies GROUP BY age_certificate


-- get maximum and minimum movie_length group by movie language
SELECT MAX(movie_length), MIN(movie_length) FROM movies;


SELECT movie_lang, MAX(movie_length) as maximum , MIN(movie_length) as minimum FROM movies GROUP BY movie_lang;


-- can we use group by with out agg. function
SELECT movie_name FROM movies group by movie_name

-- can we use col1 , agg. function col without specifying col1 in group by clause
-- NO : we have to use group by clause

SELECT movie_lang, MAX(movie_length) FROM movies -- red flag means not working

SELECT movie_lang, MAX(movie_length) FROM movies GROUP BY movie_lang

SELECT movie_lang, movie_name, MAX(movie_length) FROM movies GROUP BY movie_lang, movie_name

-- get avg. movie_length group by movie language and age certification
SELECT age_certificate, movie_lang, AVG(movie_length) FROM movies GROUP BY  movie_lang,age_certificate ORDER BY movie_lang, 3 desc


-- FILTER records with group by
-- column used with order by must apper in group by statement
SELECT * FROM movies;

SELECT movie_lang, age_certificate, AVG(movie_length) FROM movies WHERE movie_length > 100 GROUP BY movie_lang,age_certificate ORDER BY movie_length, 3 desc -- not working , movie_length must appear with group by

SELECT movie_lang, age_certificate, AVG(movie_length) FROM movies WHERE movie_length > 100 GROUP BY movie_lang,age_certificate,movie_length,release_date ORDER BY movie_length, release_date -- working


-- get avg. movie_length group by movie age_certificate where ag_certificate = 'PG'
SELECT age_certificate, AVG(movie_length) FROM movies where age_certificate = 'PG' GROUP BY age_certificate 

-- How many directors are there per each nationality
SELECT nationality, Count(nationality) FROM directors GROUP BY nationality order by 2 desc

-- get total sum movie_length for each age_certificate 	and movie_language combination
SELECT age_certificate, movie_lang, SUM(movie_length) FROM movies GROUP BY age_certificate, movie_lang ORDER BY 3 DESC
-- Can we do group by on agg. function col: NO
SELECT Count(movie_lang) FROM movies Group by Count(movie_lang) -- aggregate functions are not allowed in GROUP BY

-- order by execution 
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> DISTINCT -> ORDER BY -> LIMIT

-- How to filter records on agg. functions -> Solution is using Having clause

-- in order to search/filter from a group or agg. only
--  aggregate functions are not allowed in WHERE i.e, why use HAVING clause
-- we cannot use the column aliases in HAVING clause, as HAVING clause is evaluated before the SELECT clause

-- get list of movie language where total length of the movies is greater than 200

SELECT 
movie_lang
FROM movies
group by movie_lang
HAVING SUM(movie_length) > 200

-- get list of directors where their SUM of total movie_length > 200
SELECT * FROM directors

SELECT 
d.first_name || ' '|| d.last_name,
SUM(m.movie_length)
FROM movies m join directors d on m.director_id = d.director_id
GROUP BY d.first_name || ' '|| d.last_name, d.director_id
HAVING SUM(m.movie_length) > 200
ORDER BY d.director_id

-- Can we use Column Alias with HAVING clause : NO
SELECT
movie_length "ml"
FROM
movies
HAVING ml > 200 --ERROR: column "ml" does not exist

-- get the movie_lang where their total sum of movie_length > 200
SELECT
movie_lang,
SUM(movie_length)
FROM
movies
GROUP BY movie_lang
HAVING SUM(movie_length) > 200
ORDER BY 2 desc


-- coalesce (handling null values with group by)
CREATE TABLE handlingNull(
	srno SERIAL PRIMARY KEY,
	name varchar(10),
	dept varchar(10)
)
INSERT INTO handlingNull (name, dept) values ('Tarun', 'IT'),(null, 'CEO'),('Sumesh',null)

SELECT * FROM handlingNull;

SELECT 
coalesce(dept, 'No Department'),
coalesce(name, 'unknown')
FROM
handlingNull;