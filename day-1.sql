SET search_path to postgres, tn

create table sale_order(
    sale_id Serial  primary Key,
	item_code varchar(50),
	item_name varchar(50) Not Null,
	order_date varchar(150),
	del_date date,
	exp_date date
)

SET search_path to postgres, public
-- Select * from Customers


-- INSERT into customers (first_name ) values ('Jatin') returning * from customers



SELECT * from pg_catalog.pg_database

SELECT * from pg_catalog.pg_tables  Where schemaname = 'public'

SELECT * from current_catalog

SELECT current_database();
SELECT version()
SELECT column_name from information_schema.columns where table_schema ='public' and table_name ='customers'


Show Search_path;

-- SET search_path to tn, public
SET search_path to tn

ALTER DATABASE Training SET search_path TO postgres;

SELECT * from Customers

SELECT * from pg_catalog.pg_database

-- show the definition of a table in a schema

--SELECT your_db_column_name from "your_db_schema_name"."your_db_tabel_name";


SELECT customer_id, first_name from public.customers;

SHOW search_path

SET search_path to '$user', public

-- SET search_path TO mydb,public;
SET search_path to postgres

select * from customers;

--create a login --> admin
create login


-- Role Specification
 
select CURRENT_USER

select SESSION_USER

select CURRENT_ROLE

SELECT schema_name , schema_owner from information_schema.schemata 

--Alternatively to find available schemas use,

SELECT nspname from pg_catalog.pg_namespace

SELECT d.datname as "Name",
pg_catalog.pg_get_userbyid(d.datdba) as "Owner"
FROM pg_catalog.pg_database d
WHERE d.datname = 'Training'
ORDER BY 1;



-- show tables 
-- 1. using query
SELECT
    table_schema || '.' || table_name as show_tables
FROM
    information_schema.tables
WHERE
    table_type = 'BASE TABLE'
AND
    table_schema NOT IN ('pg_catalog', 'information_schema');

-- 2. using function
create or replace function show_tables() returns SETOF text 
as $$
SELECT
    table_schema || '.' || table_name as show_tables
FROM
    information_schema.tables
WHERE
    table_type = 'BASE TABLE'
AND
    table_schema NOT IN ('pg_catalog', 'information_schema');
$$
language sql; 
select show_tables()


-- desc sale_order table
-- 1. using query
select column_name, data_type, character_maximum_length
 from INFORMATION_SCHEMA.COLUMNS where table_name ='sale_order';

-- 2. using functions
create or replace function describe_table(tbl_name text) returns table(column_name   
varchar, data_type varchar,character_maximum_length int) as $$
select column_name, data_type, character_maximum_length
from INFORMATION_SCHEMA.COLUMNS where table_name = $1;
$$
language 'sql';


select  *  from describe_table('sale_order');


-- // change the owner of db
SELECT * from pg_catalog.pg_database

CREATE DATABASE "Training"
    WITH
    OWNER = "Tarun"
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "Training"
    IS 'Running Test Cases';
	
	
GRANT ALL PRIVILEGES ON DATABASE "Training" to postgres;

ALTER DATABASE "Training" OWNER TO postgres

ALTER DATABASE "Training" OWNER TO postgres

-- ALTER SCHEMA name RENAME TO new_name
-- ALTER SCHEMA name OWNER TO { new_owner | CURRENT_ROLE | CURRENT_USER | SESSION_USER }


-- // we have 
CREATE SCHEMA IF NOT EXISTS tn
    AUTHORIZATION "Tarun";
	
ALTER Schema tn RENAME TO tn_sessions 
ALTER SCHEMA tn_sessions Owner to postgres

-- // result
CREATE SCHEMA IF NOT EXISTS tn_sessions
    AUTHORIZATION postgres;