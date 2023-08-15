-- USER DEFINED DATA TYPES

-- CREATE DOMAIN name AS data_type constraints

-- 1.
CREATE DOMAIN addr VARCHAR(100) NOT NULL

CREATE TABLE locations (
	address addr
)

INSERT INTO locations (address) values ('118 Prem Nagar')

SELECT * FROM locations

-- 2.
CREATE DOMAIN idx INT 
CHECK (VALUE > 100 AND VALUE < 1000)

ALTER TABLE locations 
Add COLUMN loc_id idx
select * from locations

insert into locations (loc_id, address ) values (101, '123 london')

-- 3.
CREATE DOMAIN varchar_not_null_no_space VARCHAR NOT NULL CHECK(VALUE NOT LIKE '% %') 

ALTER TABLE locations 
ADD COLUMN password varchar_not_null_no_space DEFAULT 'un-specified' 
select * from locations

INSERT INTO locations (password, address, loc_id) values ('', '555 loc no where', 102)


INSERT INTO locations (password, address, loc_id) values ('uma', '717 pitampura', 103)
select * from locations

ALTER TABLE locations
RENAME column password  to building

-- 4.

CREATE DOMAIN positive_numeric NUMERIC NOT NULL CHECK (VALUE > 0)




-- 5.
-- DROP DOMAIN indian_postal_codes CASCADE

CREATE DOMAIN indian_postal_codes as text
CHECK( VALUE ~'^\d{5}$' OR VALUE ~'^\D{5}-\d{4}$')

ALTER TABLE locations 
Add Column PinCodes indian_postal_codes 


INSERT INTO locations 
(loc_id, address, Building, pincodes ) values (104, 'No where Planet', 'Galvin', '10000')

SELECT * FROM locations

-- 6.
ALTER TABLE locations
DROP COLUMN clients_email

DROP DOMAIN verified_email CASCADE


CREATE DOMAIN verified_email as text
CHECK (VALUE ~'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')


ALTER TABLE locations
ADD COLUMN  clients_email verified_email

SELECT * FROM locations

INSERT INTO locations 
(loc_id, address, Building,pincodes,clients_email ) values (105, 'pluto', 'meet', '10001', 'test@nomial.com')

DELETE FROM locations where loc_id = 105 or loc_id = 106

INSERT INTO locations 
(loc_id, address, Building,pincodes,clients_email ) values (106, 'venus', 'alienX', '10003', 'tesa')


SELECT * FROM locations



-- CREATE ENUM types or dictionary (set of values)

CREATE DOMAIN valid_colors varchar(20)
CHECK (VALUE IN ('orange', 'white', 'green'))

CREATE TABLE colors (
	id SERIAL,
	color valid_colors
)
SELECT * FROM colors

INSERT INTO colors (color) VALUES('white')
INSERT INTO colors (color) VALUES('pink')
INSERT INTO colors (color) VALUES('green')


SELECT * FROM colors

CREATE DOMAIN user_status text
CHECK (VALUE IN ('temp', 'enable', 'disable'))




CREATE TABLE user_check(
	id idx ,
  	status user_status
)

SELECT * FROM user_check



INSERT INTO user_check (id, status) VALUES (101,'enable'), (102,'disable')

INSERT INTO user_check (id, status) VALUES (103,'buffer')

SELECT * FROM user_check

-- GET ALL DOMAIN IN A SCHEMA

SELECT * FROM pg_catalog.pg_type

SELECT * FROM pg_catalog.pg_namespace 

SELECT 
	typname
	FROM pg_catalog.pg_type
	JOIN pg_catalog.pg_namespace
	on pg_namespace.oid = pg_type.typnamespace
	WHERE
	typtype = 'd' and nspname ='public'
	


-- composite data types
-- list of fields name with corresponding data type used in a table as column, used in functions or procedures can return multiple values

--1.  create an address composite datatype

CREATE TYPE address AS (
	city varchar(20),
	country varchar(20),
	pincode text
)


CREATE TABLE companies(
	comp_id SERIAL PRIMARY KEY,
	comp_add address
)

INSERT INTO companies (comp_add ) VALUES (ROW('DELHI', 'INDIA', '110094'))

INSERT INTO companies (comp_add ) VALUES (ROW('NEW YORK', 'US', '134985'))

select * FROM companies

select (comp_add).city, (comp_add).pincode from companies

-- 2.

CREATE TYPE inventory_item AS (
	product_name varchar(200),
	supplier_id int,
	price numeric
)
create table inventory(
	inventory_id SERIAL PRIMARY KEY,
	item inventory_item
)


select * from inventory
truncate table inventory restart identity

INSERT INTO inventory (item) VALUES (ROW ('paper', 1, 50.55)) ,(ROW('magnet', 2, 73))

select (item).product_name from inventory WHERE (item).price >55


-- 3.
CREATE TYPE currency AS ENUM (
	'USD', 'EUR', 'GBP'
)

SELECT 'USD':: currency

ALTER TYPE currency ADD VALUE 'CHF' AFTER 'EUR'

create table stocks (
	stock_id SERIAL PRIMARY KEY,
	stock_currency currency
)

INSERT INTO stocks (stock_currency) values ('RUP')

INSERT INTO stocks (stock_currency) values ('CHF')

INSERT INTO stocks (stock_currency) values ('USD')


SELECT * FROM stocks

-- drop enum type
create type sample as enum (
'123','ABVP'
)
DROP type sample 
DROP TYPE currency cascade


-- ALTER AN ENUM TYPE
-- 1. rename 
CREATE TYPE myaddress AS(
	city varchar(30),
	country varchar(20)
)
ALTER  TYPE myaddress RENAME TO self_address 
-- 2. chnage owner
CREATE ROLE tarun
ALTER TYPE self_address owner to tarun
-- 3.change schema
CREATE SCHEMA goal
ALTER TYPE self_address set schema goal 

set search_path = goal
-- 4.add new attribute

CREATE TYPE plastic_bags AS(
   logo varchar(20)
)
ALTER TYPE goal.plastic_bags
Add Attribute print_date DATE

CREATE TABLE plastic(
	item_id SERIAL PRIMARY KEY,
	item_name plastic_bags 
)

ALTER TYPE goal.plastic_bags
ADD ATTRIBUTE used_where varchar(50)

INSERT INTO plastic (item_name) VALUES (ROW('zara', TO_DATE('2023-08-14' , 'YYYY/MM/DD')))

SELECT * FROM plastic

UPDATE plastic 
set item_name = Row('H&M',CAST('2023-08-15'as DATE), 'CGI NOIDA')  where item_id= 1 

SELECT * FROM plastic

-- 5. rename value of enum dt

CREATE TYPE color AS ENUM ('red' ,  'orange', 'purple')

ALTER TYPE color RENAME VALUE 'red' to 'pink'

-- 6. get list of all enum values

SELECT enum_range(NULL::color)

-- 7. add new value to enum dt [BEFORE | AFTER]
ALTER TYPE color 
ADD VALUE  'green' before 'pink'



CREATE TYPE status_enum as ENUM ('queued', 'waiting', 'running', 'done' )


CREATE TABLE job
(
	job_id serial primary key,
	job_status status_enum
)

INSERT INTO job (job_status) VALUES ('queued');

INSERT INTO job (job_status) VALUES ('running');

INSERT INTO job (job_status) VALUES ('done');

INSERT INTO job (job_status) VALUES ('waiting');


ALTER TABLE job
RENAME COLUMN job_status to status

SELECT * FROM job

ALTER TABLE job 
ALTER COLUMN status TYPE status_enum using status :: text :: status_enum -- casting our enum value as text


-- ENUM has default values
CREATE TYPE status as enum ('pending', 'approved', 'declined');

create TABLE cron_jobs (
  cron_job_id INT,
	status status default 'pending'
)

insert into cron_jobs (cron_job_id) values (1)

SELECT * FROM cron_jobs

-- How to create type if not exists using pl/pgsql

DO
	$$
		BEGIN
			IF NOT EXISTS (SELECT * FROM pg_type typ
						  	INNER JOIN pg_namespace nsp
						   	ON nsp.oid = typ.typnamespace
						   WHERE nsp.nspname = current_schema()
						   AND typ.typname = 'ai'
						  ) THEN
				
				CREATE TYPE ai
							AS (a text,
							   	i integer
							   );
				
			END IF;
	
		END;
	$$
LANGUAGE plpgsql