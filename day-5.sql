SHOW search_path

SET search_path = '$user', public

CREATE TABLE movies (
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(100) NOT NULL,
	movie_length INT,
	movie_lang VARCHAR(20),
	age_certificate VARCHAR(10),
	release_date DATE,
	director_id INT REFERENCES directors (director_id) -- directors_id as FOREIGN KEY for movies table 
);
-- ---------------------------------------------------
--  Records of 'movies' database > table : movies
-- ---------------------------------------------------
INSERT INTO movies (movie_name,movie_length,movie_lang,release_date,age_certificate,director_id) VALUES
('A Clockwork Orange','112','English','1972-02-02','18','13'),
('Apocalypse Now','168','English','1979-08-15','15','9'),
('Battle Royale ','111','Japanese','2001-01-04','18','10'),
('Blade Runner ','121','English','1982-06-25','15','27'),
('Chungking Express','113','Chinese','1996-08-03','15','35'),
('City of God','145','Portuguese','2003-01-17','18','20'),
('City of Men','140','Portuguese','2008-02-29','15','22'),
('Cold Fish','108','Japanese','2010-09-12','18','30'),
('Crouching Tiger Hidden Dragon','139','Chinese','2000-07-06','12','15'),
('Eyes Wide Shut','130','English','1999-07-16','18','13'),
('Forrest Gump','119','English','1994-07-06','PG','36'),
('Gladiator','165','English','2000-05-05','15','27'),
('Gone with the Wind','123','English','1939-12-15','PG','8'),
('Goodfellas','148','English','1990-09-19','15','26'),
('Grand Budapest Hotel','117','English','2014-07-03','PG','3'),
('House of Flying Daggers','134','Chinese','2004-03-12','12','37'),
('In the Mood for Love','124','Chinese','2001-02-02','12','35'),
('Jaws','134','English','1975-06-20','12','31'),
('Leon','123','English','1994-11-18','15','5'),
('Let the Right One In','128','Swedish','2008-10-24','15','1'),
('Life of Brian','126','English','1979-08-17','15','12'),
('Life of Pi','129','English','2012-11-21','PG','15'),
('Mary Poppins','87','English','1964-08-29','U','32'),
('Never Let Me Go','117','English','2010-09-15','15','25'),
('Oldboy','130','Korean','2005-03-25','18','23'),
('Pans Labyrinth','98','Spanish','2006-12-29','PG','7'),
('Ponyo','107','Japanese','2009-08-14','U','21'),
('Pulp Fiction','136','English','1994-10-14','15','33'),
('Raging Bull','132','English','1980-11-14','18','26'),
('Rushmore','104','English','1998-11-12','12','3'),
('Spider-Man','118','English','2002-05-03','PG','24'),
('Spider-Man 2','115','English','2004-06-30','PG','24'),
('Spider-Man 3','112','English','2007-05-04','PG','24'),
('Spirited Away','120','Japanese','2001-06-19','U','21'),
('Star Wars: A New Hope','123','English','1977-05-25','PG','17'),
('Star Wars: Empire Strikes Back','150','English','1980-05-21','PG','17'),
('Star Wars: Return of the Jedi','139','English','1983-05-25','PG','17'),
('Submarine','115','English','2011-06-03','15','4'),
('Taxi Driver','117','English','1976-02-7','15','26'),
('The Darjeeling Limited','119','English','2007-09-29','PG','3'),
('The Fifth Element','149','English','1997-05-09','12','5'),
('The Lives of Others','165','German','2007-02-09','15','11'),
('The Shining','126','English','1980-05-23','18','13'),
('The Sound of Music','91','English','1965-03-02','U','34'),
('The Wizard of Oz','120','English','1939-08-25','U','8'),
('There Will Be Blood','168','English','2007-12-26','15','2'),
('Three Billboards Outside Ebbing, Missouri ','134','English','2017-11-10','15','18'),
('Titanic','143','English','1997-12-19','12','6'),
('Top Gun','121','English','1986-05-16','12','28'),
('Toy Story','95','English','1995-11-22','U','14'),
('V for Vendetta','140','English','2006-03-17','12','19'),
('Watchmen','138','English','2009-03-06','12','29'),
('Way of the Dragon ','99','Chinese','1972-06-01','12','16');

SELECT * FROM movies;

-- TYPE CONVERSION
SELECT * FROM movies WHERE movie_id = integer '1'
SELECT CAST('2023-08-11 12:03' as TIME)
SELECT CAST('2023-08-11' as DATE)
SELECT CAST('2023-AUG-11' as DATE)
SELECT CAST('2023-08-11 12:03' as TIMESTAMP)

SELECT CAST ('T' as Boolean)
SELECT CAST ('t' as Boolean)
SELECT CAST (0 as Boolean)
SELECT CAST ('1' as Boolean)
SELECT CAST ('TRUE' as Boolean)
SELECT CAST ('TrUe' as Boolean)
SELECT CAST ('false' as Boolean)

SELECT CAST ('14.2747493' as double precision)

SELECT 
'10' :: INTEGER ,
'2023-08-17 12:02' :: TIMESTAMP,
'2023-08-18' :: DATE,
'2025-10-20 12:00:01' :: TIMESTAMPTZ,
'2025-10-20 12:00:01.467' :: TIMESTAMPTZ

-- duration in string to interval
SELECT 
'15 minutes' :: interval,
'15 minute' :: interval,
'15 min' :: interval,
'10 hrs' :: interval,
'10 hour' :: interval,
'10 hours' :: interval,
'1 day' :: interval,
'1 days' :: interval,
'5 mon' :: interval,
'5 month' :: interval,
'5 months' :: interval,
'6 yrs':: interval,
'6 year' :: interval,
'6 years' :: interval



-- FACTORIAL()
SELECT factorial(CAST('5' as bigInt))  AS "result";
SELECT factorial(3) -- only for integers

-- ROUND()
SELECT ROUND(272.385, 2) as "result"; --implicit
SELECT 
ROUND(CAST('10.2742999999' AS NUMERIC), 4) as "result" -- explicit

-- SUBSTR(),( cast as text)
SELECT 
SUBSTR('734.343', 2) as "implicit_text", -- prints: "34.343"
SUBSTR(CAST('823.324732' as TEXT), 3) as "explicit_text" -- print "3.324732"


-- Question : CAST target to convert into ?
-- Ans : 
-- 1. Boolean
-- 2. Character (char, varchar, text)
-- 3. Numeric (integer, floating pt. num.)
-- 4. array
-- 5. json
-- 6. uuid
-- 7. hstore
-- 8. Temporal type (date, time , timestamp, interval) 
-- 9. Special type (n/w address, geometric data)


----------------------------------------------------Part 2 (Type conversion on Table Data)-----------------------------------------------------------

CREATE TABLE ratings(
  rating_id SERIAL PRIMARY KEY,
  rating VARCHAR(1) NOT NULL
)

INSERT INTO ratings (rating ) VALUES 
('A'),
('B'),
('C'),
('D'),
('1'),
('2'),
('2'),
('4')

SELECT * FROM ratings

-- convert rating into integer into all rows

SELECT 
 rating_id,(
 	SELECT 
 	 	CASE
	 	WHEN rating ~ E'^\\d+$' THEN CAST(rating as Integer)
	 	ELSE
	 	0
	 	end
	 	from ratings t2
     	WHERE t2.rating_id = t1.rating_id
 	) as "rating"
 FROM 
  ratings t1

-- TO_CHAR(), timstamp, interval, integer, double_precision, numeric value
-- convert an Integer to string

SELECT TO_CHAR(
637292,
	'99,9999'
)

SELECT TO_CHAR(
637292,
	'99,99999'
)

SELECT TO_CHAR(
	7868435,
	'000,000000'
) --" 007,868435"

SELECT TO_CHAR(
	release_date, 'DD-mm-YYYY'
	
) from movies

SELECT TO_CHAR(
	release_date, 'Dy-mon-YYYY'
	
) from movies

SELECT 
TO_CHAR(TIMESTAMP '2023-08-14 10:30:59', 'HH24:MI:SS') as "formatted date"
,TO_CHAR(TIMESTAMP '2023-08-14  15:30:59', 'HH12:MI:SS') as "formatted date"

-- adding currency symbol domestic_revenue 

CREATE TABLE movies_revenues(
	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies (movie_id),
	revenues_domestic NUMERIC (10, 2),
	revenues_international NUMERIC (10,2)
)
-- ---------------------------------------------------------
--  Records of 'movies' database > table : movies_revenues
-- ---------------------------------------------------------
INSERT INTO movies_revenues (revenue_id,movie_id,revenues_domestic,revenues_international) VALUES
('1','45','22.2','1.3'),
('2','13','199.4','201.2'),
('3','23','102.1',NULL),
('4','44','158.7',NULL),
('6','1','27.1',NULL),
('7','53',NULL,NULL),
('17','18','260.3','210.9'),
('9','39','28.1',NULL),
('5','35','461.2','314.2'),
('13','2','83.4',NULL),
('15','21','19.6',NULL),
('8','36','290.3','247.8'),
('11','43','44.1',NULL),
('12','29','23.1',NULL),
('14','4','33.3',NULL),
('10','37','309.1','166.2'),
('16','49','180.1','177.3'),
('18','14','46.6',NULL),
('21','11','330.3','348.1'),
('20','28','107.9','106.2'),
('19','19',NULL,NULL),
('23','50','192.1','182.4'),
('22','5',NULL,NULL),
('27','41','64.1','200.3'),
('24','48','659.2','1528.1'),
('25','30','16.9',NULL),
('26','10','55.7','106.3'),
('30','12','188.2','273.4'),
('28','9','128.1','85.1'),
('29','3',NULL,NULL),
('32','17','2.9','10.2'),
('31','34','11.1','265.4'),
('33','31','404.1','418.1'),
('37','6','8.2','23.5'),
('35','16','11.1','82.5'),
('36','32','374.1','410.4'),
('34','25','1.1','13.8'),
('38','51','71.2','62.5'),
('40','26','37.8','46.4'),
('48','42','11.3','66.1'),
('39','33','337','554'),
('51','40','11.9','23.2'),
('41','46','39.9','35.8'),
('42','7','0.3','2.2'),
('49','20','2.1','9.1'),
('45','52','107.5','77.5'),
('44','27','15.1','186.7'),
('47','8',NULL,NULL),
('46','24','2.4','7.1'),
('43','38','0.5','0.4'),
('50','22','124.9','484.1'),
('52','15','59.3','115.5'),
('53','47','54.5','104.7');


SELECT 
* 
FROM movies_revenues


SELECT movie_id,
revenues_domestic,
TO_CHAR(revenues_domestic, '9999D9'),
TO_CHAR(revenues_domestic, '00000D00')

FROM
movies_revenues


-- TO_NUMBER()

SELECT 
TO_NUMBER(
	'1303.49',
	'9999.99'
),TO_NUMBER(
	'1303.49',
	'99999.999'
),TO_NUMBER(
	'1303.734',
	'99999.'
)


SELECT TO_NUMBER(
	'10,625.78-',
	'99G999D99S'
)

SELECT TO_NUMBER(
	'$ 1,420.64',
	'L9G999D99'
)

SELECT TO_NUMBER(
'1,234,567.89',
	'9G999g999D99'
)


SELECT TO_NUMBER(
	'$ 1,987,299.64',
	'L9G999g999D99'
)

-- TO_DATE(), string -> date

SELECT
TO_DATE('20230918', 'YYYYMMDD'), 
TO_DATE('231202', 'YYMMDD')


SELECT
TO_DATE(release_date :: varchar, 'YYYY-MM-DD') 
from movies

SELECT TO_DATE('Aug 07, 2023', 'Mon DD, YYYY')



-- TO_TIMESTAMP()

SELECT 
TO_TIMESTAMP(
	'2023-08-14 10:23:23',
	'YYYY-MM-DD HH24:MI:SSSS'
)

SELECT TO_TIMESTAMP(
	'2023, Aug',
	'YYYY, Mon'
)

SELECT TO_DATE(
	'2023, Aug',
	'YYYY, Mon'
)

SELECT
to_timestamp(
	'2023-08  -14 13:8:00',
	'yyyy-MM-dd HH24:MI:SS'
)
