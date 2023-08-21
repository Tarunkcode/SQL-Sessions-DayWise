-- create a table enter values if there is already that value reside then do noting else insert it


CREATE TABLE UniqueOnly(
	val_no SERIAL PRIMARY KEY,
	valu varchar(20) NOT NULL
)
truncate table UniqueOnly restart IDENTITY

CREATE OR REPLACE FUNCTION InsertOnlyUnique (p1 varchar) RETURNS INT AS 
$$
SELECT (
CASE (select EXISTS (SELECT * FROM UniqueOnly WHERE valu = 'Tarun' ))
	WHEN 'FALSE' THEN 1
	ELSE 0
END
) AS "result"

$$
LANGUAGE SQL;
	
SELECT * FROM UniqueOnly
SELECT InsertOnlyUnique('vaidya')

---------------------------------------------------------------------------------------------------------------
--(1).  UPPER LOWER AND INITCAP
	
--(2). 
--LEFT( string , n) -- returns the first n character of string
-- RIGHT( string , n) -- returns the last n character of string

-- get initaials for all director name

SELECT * FROM directors

SELECT LEFT(first_name, 1) as "initials",
COUNT(*) AS "total_initials"
FROM directors
GROUP BY 1
ORDER BY 1


-- get first 6 characters from all movies
SELECT movie_name, LEFT(movie_name, 6) FROM movies

SELECT movie_name, RIGHT(movie_name, 6) FROM movies

SELECT LEFT('amazing tarun!', 2) -- am
SELECT LEFT('amazing tarun!', -2) -- "amazing taru"

SELECT RIGHT('amazing tarun!', -2); -- "azing tarun!"

-- Find all the directors where name ends with "on"

SELECT first_name ||' '|| last_name FROM directors where last_name LIKE '%on';
-- or
SELECT first_name ||' '|| last_name FROM directors where RIGHT(last_name, 2) = 'on';


-- (3). REVERSE(string)

SELECT REVERSE('TARUN');

-- (4). SPLIT_PART( string, delimeter, position)
SELECT SPLIT_PART('1,2,3', ',', 2)

SELECT SPLIT_PART('a|b|c|d', '|', 3)

SELECT SPLIT_PART('TARUN KUMAR', ' ', 2)

-- get release_year of all movies

SELECT movie_name, SPLIT_PART(release_date :: TEXT, '-', 1) AS "release_year" FROM movies

-- (5).  TRIM(), BTRIM() , LTRIM() , RTRIM()

TRIM([LEADING | TRAILING | BOTH] [characters] FROM string)

SELECT LTRIM('TARUN', 'T') --"ARUN"

SELECT LTRIM('TARUN', 'TA') --"RUN"

SELECT LTRIM('TARUN', 'R') --"TARUN"
SELECT RTRIM('TARUN', 'N') --"TARU"
SELECT RTRIM('TARUN', 'R') --"TARUN"
SELECT BTRIM('sirTARUNsir', 'sir') -- "TARUN" & [characters] are case sensitive

SELECT TRIM(LEADING 'RUNTA' FROM 'TARUN IS PERFECT CANDIDATE AS A DEVELOPER') -- REMOVES ONLY "TARUN" FROM START

SELECT TRIM(TRAILING 'TAR' FROM 'TARUN IS PERFECT CANDIDATE AS A DEVELOPER') -- REMOVES ONLY "R" FROM LAST i.e, DEVELOPER

SELECT TRIM(TRAILING 'ERP' FROM 'TARUN IS PERFECT CANDIDATE AS A DEVELOPER') -- REMOVES ONLY "PER" FROM LAST i.e, DEVELOPER

SELECT TRIM(BOTH 'RUNTAERP' FROM 'TARUN IS PERFECT CANDIDATE AS A DEVELOPER') -- REMOVES "TARUN" FROM start and "PER" FROM end

-- applications
-- removing leading zeroes from a number

SELECT LTRIM(00074:: TEXT, '0')


-- (6). LPAD(string, n, [filling_characters]) & RPAD(string, n, [filling_characters]) where n is the padding length

SELECT LPAD('TARUN',2) -- "TA"
SELECT LPAD('DATABASE',15, '*') -- "*******DATABASE"
SELECT LPAD('papaya_is_greate_food',3) -- "pap"


SELECT LPAD('1111',6, 'A') -- "AA1111"
SELECT LPAD('1111',6) -- "  1111"

SELECT RPAD('1111',6, 'A') -- "1111AA"
SELECT RPAD('1111',6) -- "1111  "


SELECT RPAD('TARUN',2) -- "TA"
SELECT RPAD('DATABASE',15, '*') -- "DATABASE*******"
SELECT RPAD('papaya_is_greate_food') -- "pap"

-- lets draw a quick chart on movies total revenues
SELECT
	mv.movie_name,
	r.revenues_domestic,
	LPAD('*', CAST(TRUNC(r.revenues_domestic / 10) AS INT), '*') chart
FROM
movies mv
JOIN movies_revenues r
ON mv.movie_id = r.movie_id
ORDER BY 3
NULLS LAST

-- (7). LENGTH (string), char_length()
SELECT * FROM directors
-- get total length of all directors full_name
SELECT
director_id,
CONCAT(first_name,' ' ,last_name) full_name,
LENGTH(CONCAT(first_name,' ' ,last_name)),
char_length(CONCAT(first_name,' ' ,last_name))
FROM directors
ORDER BY 3

-- (8). POSITION(substring) -> (integer)return the location of substring in a string, case sensitive, 
--able to run ANSI SQL QUERIES & SCRIPTS
SELECT POSITION('amazing' in 'amazing means tarun') -- 1
SELECT POSITION('arun' in 'amazing means tarun') -- 16
SELECT POSITION('nalytics' in 'KClickAnalytics') -- 8
SELECT POSITION('A' in 'KClickAnalytics') -- 7
SELECT POSITION('is' in 'This is a computer') -- 3 ("This" holds "is")

-- (9).
-- STRPOS( <string>, <substring> ) -- works same as POSITION() do. NOT able to run ANSI SQL QUERIES & SCRIPTS

SELECT STRPOS('amazing means tarun','amazing') -- 1
SELECT STRPOS('amazing means tarun','arun' ) -- 16
SELECT STRPOS('KClickAnalytics','nalytics' ) -- 8
SELECT STRPOS('KClickAnalytics','A') -- 7
SELECT STRPOS('This is a computer', 'is') -- 3 ("This" holds "is")

-- (10). SUBSTRING(string[from start_position][for length])
SELECT SUBSTRING('what a wonderful world' from 7 for 3) -- wo
SELECT SUBSTRING('what a wonderful world', 7, 3) -- wo
SELECT SUBSTRING('what a wonderful world' for 3) -- "wha"
SELECT SUBSTRING('what a wonderful world',1, 3) -- "wha"

SELECT SUBSTRING('what a wonderful world', 3) -- "at a wonderful world"


-- (11). REPEAT(str, [no. of times to repeat]) -- repeats a substring to a specified no. of times
SELECT REPEAT('a', 10) --"aaaaaaaaaa"
SELECT REPEAT('TARUN ', 4) -- "TARUN TARUN TARUN TARUN "

-- (12). REPLACE(string, from_substr, to_substr) , if from_substr is not present in string then it returns string as it is with no change


SELECT REPLACE('abc XYZ', 'X', '1') -- "abc 1YZ"
SELECT REPLACE('what a wonderful world', 'a wonderful', 'an amazing') -- "what an amazing world"
SELECT REPLACE('1123432223', '2', 'x') --"11x343xxx3"

-- (13). COUNT()
--  COUNT with DISTINCT() -> COUNT(DISTINCT(columnname))
SELECT Count(movie_lang) FROM movies -- 53
SELECT Count(DISTINCT(movie_lang)) FROM movies -- 8

SELECT COUNT(*) FROM movies -- 53
SELECT COUNT(1) FROM movies -- 53

-- note : 
-- The SQL COUNT(*) returns counts of all the rows, including NULLs

-- COUNT(1) returns counts all the rows, including NULLs

-- COUNT(column_name) counts all the rows but does not consider NULL in the specified column.

-- (14). SUM(columnname)
SELECT * FROM movies_revenues
-- get total domestic_revenue
SELECT SUM(revenues_domestic) AS "SUM" FROM movies_revenues -- 5719.50
-- get total domestic_revenue where domestic revenue > 200
SELECT SUM(revenues_domestic) AS "SUM" FROM movies_revenues WHERE revenues_domestic > 200 -- 3425.60

-- get total movie length of all english movies
SELECT SUM(movie_length) AS "Sum of english movies" FROM movies WHERE movie_lang = 'English' -- 4824

-- SUM with DISTINCT -> SUM(DISTINCT(columnname)) -- ignores duplicates value in SUM for a column
SELECT SUM(DISTINCT(revenues_domestic)) AS "SUM" FROM movies_revenues -- 5708.40

-- get the difference of domestic revenues total with DISTINCT or without DISTINCT 
SELECT revenues_domestic FROM movies_revenues GROUP BY revenues_domestic HAVING count(revenues_domestic) > 1 -- 11.10

-- (15). MIN(columnname) & MAX(columnname)
-- get the longest & smallest length movie in movies table
SELECT MAX(movie_length) FROM movies -- 168
SELECT MIN(movie_length) FROM movies -- 87

-- get MIN & MAX of movie_length for only in english based movies
SELECT MAX(movie_length) from movies WHERE movie_lang = 'English' -- 168
SELECT MAX(release_date) from movies WHERE movie_lang = 'English' -- "2017-11-10"

SELECT MIN(movie_length) from movies WHERE movie_lang = 'English' -- 87
SELECT MIN(release_date) from movies WHERE movie_lang = 'English' -- "1939-08-25"
 
SELECT * FROM movies WHERE movie_lang = 'English'

SELECT MIN(movie_name) from movies WHERE movie_lang = 'English' --"A Clockwork Orange"
SELECT MAX(movie_name) from movies WHERE movie_lang = 'English' --"Watchmen"

-- (16). GREATEST(list) & LEAST(list)
	
SELECT GREATEST(203,3 ,43,203.1) -- 203.1
SELECT GREATEST('A','B','C', 'D') -- D

SELECT LEAST('A','B','C', 'D') --A
SELECT LEAST(203,3 ,43,203.1) -- 3


	
-- find the greatest and least revenues per each movie
SELECT * FROM movies_revenues
SELECT * FROM movies

SELECT 
m.movie_name,
r.revenues_domestic,
r.revenues_international,
GREATEST(r.revenues_domestic, r.revenues_international) as "Greatest",
LEAST(r.revenues_domestic, r.revenues_international) as "Least"
FROM movies "m"
join movies_revenues "r"
on m.movie_id = r.movie_id 


-- MAX() vs GREATEST()
-- MAX accepts one argument but GREATEST() accepts multiple arguments, 
-- if you try to pass only one argument in GREATEST method it gives error

-- (17). AVG()
SELECT AVG(DISTINCT(movie_length)) FROM movies WHERE movie_lang = 'Chinese' --121.8
-- get avg. & sum of movie_length for only english based movies
	SELECT AVG(DISTINCT(movie_length)), SUM(movie_length) FROM movies WHERE movie_lang = 'English' --121.8



-- Auxillary : Combining columns with MATHS Operators
-- +, -, /, *, %
SELECT 
movie_id,
revenues_domestic,
revenues_international,
(revenues_domestic + revenues_international) as "Total Revenues"
FROM
movies_revenues
WHERE (revenues_domestic + revenues_international) IS NOT NULL
ORDER BY 4 DESC NULLS LAST