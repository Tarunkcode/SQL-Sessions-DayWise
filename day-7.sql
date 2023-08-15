-- NOT NULL
-- UNIQUE
-- DEFAULT
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK

--UNIQUE
CREATE TABLE products(
	prod_id SERIAL PRIMARY KEY ,
	prod_code varchar(10),
	prod_name text,
	UNIQUE (prod_code, prod_name)
)

ALTER TABLE products 
ADD CONSTRAINT unique_prod_code UNIQUE (prod_code, prod_name)

INSERT INTO products (prod_code, prod_name) VALUES ('org', 'oranges')
INSERT INTO products (prod_code, prod_name) VALUES ('apl', 'apple'), ('ban', 'banana'),('pap', 'papaya')

SELECT * FROM products

INSERT INTO products (prod_code, prod_name) VALUES ('org1', 'oranges') --succefully inserted

INSERT INTO products (prod_code, prod_name) VALUES ('org', 'oranges1') -- successfully inserted

-- DEFAULT
CREATE TABLE employee (
	emp_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(15) NOT NULL,
	last_name VARCHAR(30),
	is_enable CHAR DEFAULT 'Y'  CHECK( is_enable IN ('Y', 'N'))
	
)
SELECT * FROM employee

INSERT INTO employee (first_name) VALUES ('tarun')

ALTER TABLE employee
ALTER COLUMN is_enable SET DEFAULT 'N'

INSERT INTO employee (first_name, last_name, is_enable) VALUES ('prabhat', 'kaushik', null ) --inserted

INSERT INTO employee (first_name, last_name) VALUES ('deepanshu', 'goswami') --inserted

INSERT INTO employee (first_name, last_name, is_enable) VALUES ('prabhat', 'kaushik', 'V' ) -- not inserted

ALTER TABLE employee 
--ALTER COLUMN is_enable DROP DEFAULT
 DROP CONSTRAINT employee_is_enable_check

INSERT INTO employee (first_name, last_name, is_enable) VALUES ('prabhat', 'kaushik', 'V' ) -- now inserted


-- PRIMARY KEY
-- tablename_pkey

CREATE TABLE t_grades (
	course_id VARCHAR(100) NOT NULL,
	stu_id VARCHAR(100) NOT NULL,
	grade int NOT NULL
)

SELECT * FROM t_grades

INSERT INTO t_grades (course_id, stu_id, grade) VALUES 
('MATH', 'S1', 50),
('CHEMISTRY', 'S1', 50),
('ENGLISH', 'S2', 70),
('PHYSICS', 'S1', 80)


ALTER TABLE t_grades
ADD CONSTRAINT t_grades_pkey PRIMARY KEY (course_id, stu_id)


ALTER TABLE t_grades 
DROP CONSTRAINT t_grades_pkey


DROP TABLE t_grades


CREATE TABLE t_grades (
	course_id VARCHAR(100) NOT NULL,
	stu_id VARCHAR(100) NOT NULL,
	grade int NOT NULL,
 	CONSTRAINT t_grades_pkey PRIMARY KEY (course_id, stu_id)
	
)

INSERT INTO t_grades (course_id, stu_id, grade) VALUES 
('MATH', 'S1', 50),
('CHEMISTRY', 'S1', 50),
('ENGLISH', 'S2', 70),
('PHYSICS', 'S1', 80)


INSERT INTO t_grades (course_id, stu_id, grade) VALUES 
('MATH', 'S1', 50) -- violets primary key constraints

INSERT INTO t_grades (course_id, stu_id, grade) VALUES 
('MATH', 'S3', 50) -- inserted


-- FOREIGN KEY

-- child table that references the primary key of foreign table 
-- first table that has the reference to the primary key of second table is called foreign key

CREATE TABLE t_products (
	product_id INT PRIMARY KEY,
 	product_name VARCHAR(100) NOT NULL,
	supplier_id INT  NOT NULL 
)

CREATE TABLE t_supplier(
	supplier_id INT PRIMARY KEY,
	supplier_name varchar(100) NOT NULL
)

INSERT INTO t_supplier (supplier_id, supplier_name ) VALUES (1, 'Anil'),(2, 'Sanjeev'),(3, 'Amit'),(4, 'Kallan')
INSERT INTO t_products (product_id, product_name, supplier_id) VALUES (1, 'SOFTWARES', 3),(2, 'LAPTOPS', 4),(3, 'STATIONARY', 4),(4, 'ELECTRICITY', 2),(5, 'INFRASTRUCTURE', 2)



SELECT * FROM t_supplier -- foreign table / child table

SELECT * FROM t_products -- parent table


ALTER TABLE t_products 
ADD FOREIGN KEY (supplier_id) REFERENCES t_supplier(supplier_id)


SELECT * FROM t_products

INSERT INTO t_products (product_id, product_name, supplier_id) VALUES (6, 'SOAP' ,5) -- foreign key violation

UPDATE t_products 
SET supplier_id = 1  WHERE product_id =1 

UPDATE t_products 
SET supplier_id = 10  WHERE product_id =1 -- violets foreign key constraints

delete from t_products Where product_id =1 -- successfully deleted
-- but in foreign table
delete from t_supplier WHERE supplier_id = 4 -- violates foreign key constraints 

update t_supplier 
set supplier_name = 'Mimansa' WHERE supplier_id = 1 -- succefully updated


SELECT * FROM t_supplier
--foreign key violation 5 is not present in the supplier or child /foreign table
--the value in the parent column must appear or present with values with a foreign column. 
--If the value is not present in foreign table it will show an error message.
-- insert (in parent table) , update (parent table) and delete (foreign table) operations effects after foreign key constraints

-- DROP FOREIGN KEY CONSTRAINTS
ALTER TABLE t_products
DROP CONSTRAINT t_products_supplier_id_fkey

-- or
ALTER TABLE t_products
DROP CONSTRAINT supplier_id

-- check CONSTRAINT
-- {table}_{column}_check

CREATE TABLE staff(
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(30),
	birth_date DATE CHECK (birth_date > '1900-01-01'),
	joined_date DATE CHECK(joined_date > birth_date),
	salary NUMERIC CHECK (salary > 0)
)

SELECT * FROM staff

INSERT INTO staff (first_name, last_name , birth_date, joined_date, salary) VALUES 
('Tarun', 'Kumar', '1998-10-21', '2022-02-11', 240000)



-- DEFINE CHECK CONSTRAINT FOR EXISTING TABLE

CREATE TABLE price(
	price_id SERIAL PRIMARY KEY,
	product_id INT NOT NULL,
	price NUMERIC NOT NULL,
	discount NUMERIC NOT NULL,
	valid_from DATE NOT NULL
)

ALTER TABLE price
RENAME to prices

SELECT * FROM prices

-- ADD CONSTRAINT to EXISTING TABLE  

ALTER TABLE prices 
ADD CONSTRAINT price_check
CHECK(
	price > 0
	AND discount >= 0
	AND price > discount
)


-- RANAME CONSTRAINT
ALTER TABLE prices
RENAME CONSTRAINT price_check
to prices_chk

-- DROP CONSTRAINT
ALTER TABLE prices 
DROP CONSTRAINT prices_chk