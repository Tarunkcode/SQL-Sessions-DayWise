show search_path
create schema modify
set search_path = '$user', modify
-- modify table structures

--CREATE DATABASE my_data; 
--using psql 
ALTER DATABASE mydata RENAME TO my_data

CREATE TABLE persons(
	person_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) not null,
	last_name VARCHAR(20) NOT NULL
)

-- 1. add column age -> INT NOT NULL
ALTER TABLE persons
ADD COLUMN age INT NOT NULL

SELECT * FROM persons
-- 2. add column nationality -> VARCHAR(20) NOT NULL + email -> VARCHAR(100) with UNIQUE constraints
ALTER TABLE persons
ADD COLUMN nationality VARCHAR(20) NOT NULL,
ADD COLUMN email VARCHAR(100) UNIQUE
INSERT INTO persons (first_name, last_name, age, nationality, email) VALUES ('Tarun', 'Kumar', 24, 'Indian', 'mark_am20@yahoo.com')

INSERT INTO persons (first_name, last_name, age, nationality, email) VALUES ('Pankaj', '', 24, 'Indian', 'mark_am20@yahoo.com') -- UNIQUE key constraints violets

SELECT * FROM persons;
-- 3. change table name to users
ALTER TABLE persons RENAME TO users
SELECT * FROM users
-- 4. RENAME column(age  to  person_age)
ALTER TABLE users
RENAME COLUMN age TO "person''s_age"
-- 5. change column datatype(person_age) (*)

ALTER TABLE users
ALTER COLUMN "person''s_age" TYPE VARCHAR(2)

-- 6. DROP column (person_age)
SELECT * FROM users

ALTER TABLE users 
DROP COLUMN "person''s_age"
-- 7. SET DEFAULT VALUE of column (add a is_enable column with defaul value 'Y' of VARCHAR(1))
ALTER TABLE users
ADD COLUMN is_enabel VARCHAR(1) DEFAULT 'Y'
-- 8. INSERT first row of persons

SELECT * from users
INSERT INTO users (first_name, last_name, nationality, email) VALUES ('Malhotra ji', 'KISHAN', 'Indian', 'malhotra@yahoo.com') -- UNIQUE key constraints violets




-- adding constraints to table

CREATE TABLE web_links(
	link_id SERIAL PRIMARY KEY, 
	link_url VARCHAR(255) NOT NULL,
	link_target VARCHAR(20)
)

SELECT * from web_links


-- 1. insert fisrt row in web_links ('www.google.com', '_blank')
INSERT INTO web_links (link_target, link_url) VALUES ('_blank', 'www.google.com')
SELECT * from web_links
-- 2. add UNIQUE constraint with name unique_web_url on link_url
-- NOT NULL
-- CHECK
-- UNIQUE
-- PRIMARY KEY
-- FOREIGN KEY

ALTER TABLE web_links
ADD CONSTRAINT unique_web_url UNIQUE(link_url);

CREATE TABLE test(
    phone_number VARCHAR(12) NOT NULL,
    CONSTRAINT unique_phone_num UNIQUE (phone_number)
)	
INSERT INTO test (phone_number) VALUES ('9347459343')

INSERT INTO test (phone_number) VALUES ('9347459343') -- violets unique key constraints

SELECT * FROM test

-- 3. set column to set only defined allowed/acceptable values (is_enable with SET {Y, N}) -> TRY to INSERT/UPDATE value from without allowed One's
SELECT * FROM web_links

ALTER TABLE web_links
ADD COLUMN is_enable Varchar(1),
ADD CHECK (is_enable IN ('Y', 'N'));


INSERT into web_links (link_url,is_enable) VALUES ('amazon.com','Y')
INSERT into web_links (link_url,is_enable) VALUES ('amazon.com','Q') -- violates check constraint "web_links_is_enable_check"