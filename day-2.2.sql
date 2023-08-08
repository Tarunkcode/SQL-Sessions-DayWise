-- UPSERT
CREATE TABLE t_tags
(
    t_id SERIAL PRIMARY KEY,
    t_name text UNIQUE,
    upsert_date timestamp DEFAULT now()
)
SELECT * from t_tags

INSERT INTO t_tags (t_name) VALUES ('mobile'),('computer'),('tablet') ON CONFLICT(t_name) DO NOTHING;

INSERT INTO t_tags (t_name) VALUES ('mobile') ON CONFLICT(t_name) DO UPDATE SET t_name = EXCLUDED.t_name, upsert_date = NOW();

INSERT INTO t_tags (t_name) VALUES ('computer') ON CONFLICT(t_name) DO UPDATE SET t_name = EXCLUDED.t_name || '!', upsert_date = NOW();




CREATE TABLE customers
(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email_id VARCHAR(150),
    age integer
)
INSERT INTO customers (first_name, last_name ) VALUES ('Tarun', 'kumar'), ('Hemant', 'Thakur'),('Lakhan', 'Prasad'),('Prashant', 'Kashyap')

SELECT * from customers
SELECT first_name || ' ' || last_name "full_name" from customers
CREATE TABLE cbp_stu
(
    stu_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    age integer,
    body_temp numeric(5,2),
    weight numeric(4,2) NOT NULL
)
truncate table customers RESTART IDENTITY
INSERT INTO cbp_stu (name , age, body_temp, weight) values ('Tarun''k', 24, 98.6, 50.555)

INSERT INTO cbp_stu (name , age, body_temp, weight) values ('Shubham''''k', 24, 98.6, 50.555)

SELECT * from cbp_stu

