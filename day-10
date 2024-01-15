-- CREATE a no. series from 1 to 10.

With num AS (SELECT * FROM generate_series(1, 10) AS Id) SELECT * FROM num;

-- List of all movies with director_id == 1

SELECT * FROM movies

With movie_name AS (SELECT * FROM movies WHERE director_id = 1) SELECT * FROM movie_name;

-- List of all long movies with movie_length is 120 hrs or more

SELECT * FROM movies;

-- > 120hrs as long
-- < 100hrs as short
-- < 120 hrs as medium
With long_movies AS 
(
	SELECT movie_name , movie_length,
	(Case 
		WHEN  movie_length > 120 THEN 'long'
		WHEN  movie_length > 100 and movie_length <= 120 THEN 'medium'
		ELSE 'short'
	END) as m_len_status FROM movies
) SELECT * FROM long_movies WHERE long_movies.m_len_status = 'long';

-- Calculate total_revenues for each directors SELECT director's name and their revenue


SELECT * FROM movies;
SELECT * FROM directors;
SELECT * FROM movies_revenues;

With cte_total_revenue AS (
	SELECT d.director_id ,
	SUM(r.revenues_domestic+ r.revenues_international) as "total_revenues"
	FROM directors d 
	Inner Join movies m on d.director_id = m.director_id 
	Inner Join movies_revenues r on r.movie_id = m.movie_id
	Group By d.director_id
	Order by d.director_id
) SELECT CONCAT(dir.first_name, ' ', dir.last_name) as "director_name" ,ctr.* FROM cte_total_revenue ctr
INNER JOIN directors dir on dir.director_id = ctr.director_id  

-- from articles_table whenever remove any article their log is maintained using CTE

CREATE table article (id SERIAL PRIMARY KEY, name VARCHAR(100));

INSERT INTO article(name) VALUES ('Knife'), ('Grinder'),('Spoon'),('Plate'), ('Cup');

CREATE TABLE deleted_article AS
SELECT * FROM article;

With cte_deleted_article AS (
	DELETE from article WHERE id = 1
	RETURNING *
) INSERT INTO deleted_article SELECT * FROM cte_deleted_article;

-- check :
SELECT * FROM deleted_article


-- move all data from article to a newly created table article_new and drop old table using cte

CREATE table article_new AS SELECT * FROM article limit 0;

SELECT * FROM article_new;


WITH cte_article_new AS (
	SELECT * FROM article
) INSERT INTO article_new SELECT * FROM cte_article_new; drop table article;


-- Recursive CTE : to work on heirarchical data

--create a time series with recursive cte
WITH RECURSIVE series (list_num) AS (
	SELECT 10
	UNION ALL
	SELECT list_num + 5 From series Where list_num + 5 <= 50
)SELECT list_num From SERIES;



CREATE TABLE items (
	pk SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	parent INT
)

INSERT INTO items (name , parent) VALUES ('vegetables', 0),('fruits', 0),('apple', 2),('banana', 2);



SELECT * FROM items

-- show data in parent child relationship
tree level | name
-----------------
          1| vegetables
		  1| fruits
		  2| fruits -> apple
		  2| fruits -> banana
		  

WITH RECURSIVE cte_tree AS (
	SELECT 
	    name, pk, 1 AS tree_level
	FROM items
	WHERE parent = 0
	
	UNION ALL
	
	SELECT 
	tt.name || ' -> ' || ct.name,
	ct.pk,
	tt.tree_level + 1
	FROM items ct
	Inner JOIN cte_tree tt ON tt.pk = ct.parent
)
  SELECT tree_level , name FROM cte_tree
  ORDER BY tree_level
















