CREATE DATABASE movies
    WITH
    OWNER = "Tarun"
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE actors (
	actor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150) NOT NULL,
	gender CHAR(1),
	date_of_birth DATE,
	add_date DATE,
	update_date DATE
);

-- ---------------------------------------------------
--  Records of 'movies' database > table : actors
-- ---------------------------------------------------
INSERT INTO actors (first_name,last_name,gender,date_of_birth) VALUES
('Malin','Akerman','F','1978-05-12'),
('Tim','Allen','M','1953-06-13'),
('Julie','Andrews','F','1935-10-01'),
('Ivana','Baquero','F','1994-06-11'),
('Lorraine','Bracco','F','1954-10-02'),
('Alice','Braga','F','1983-04-15'),
('Marlon','Brando','M','1924-04-03'),
('Adrien','Brody','M','1973-04-14'),
('Peter','Carlberg','M','1950-12-08'),
('Gemma','Chan','F','1982-11-29'),
('Chen','Chang','M','1976-10-14'),
('Graham','Chapman','M','1941-01-08'),
('Pei-pei','Cheng','F','1946-12-04'),
('Maggie ','Cheung','F','1964-09-20'),
('Min-sik','Choi','M','1962-05-30'),
('Yun-fat','Chow','M','1955-05-18'),
('John','Cleese','M','1939-10-27'),
('Paddy','Considine','M','1973-09-05'),
('Abbie','Cornish','F','1982-08-07'),
('Brian','Cox','M','1946-06-01'),
('Scatman','Crothers','M','1910-05-23'),
('Russell','Crowe','M','1964-04-07'),
('Tom','Cruise','M','1962-07-03'),
('Darlan','Cunha','M','1988-07-26'),
('Willem','Dafoe','M','1955-07-22'),
('Paul','Dano','M','1984-06-19'),
('Daniel','Day-Lewis','M','1957-04-29'),
('Robert','De Niro','M','1943-08-17'),
(null,'Denden','M','1950-01-23'),
('Leonardo','DiCaprio','M','1974-11-11'),
('Peter','Dinklage','M','1969-06-11'),
('Hiroki','Doi','M','1999-08-10'),
('Kirsten','Dunst','F','1982-04-30'),
('Shelley','Duvall','F','1949-07-07'),
('Ralph','Fiennes','M','1962-12-22'),
('Leandro','Firmino','M','1978-06-23'),
('Carrie','Fisher','F','1956-10-21'),
('Harrison','Ford','M','1942-07-13'),
('Jodie','Foster','F','1962-11-19'),
('James','Franco','M','1978-04-19'),
('Dillon','Freasier','M','1996-03-06'),
('Tatsuya','Fujiwara','M','1982-05-15'),
('Mitsuru','Fukikoshi','M','1965-02-17'),
('Clark','Gable','M','1901-02-01'),
('Mason','Gamble','M','1986-01-16'),
('Xian','Gao','M',null),
('Andrew','Garfield','M','1983-08-20'),
('Judy','Garland','F','1922-06-10'),
('Martina','Gedeck','F','1961-09-14'),
('Jeff','Goldblum','M','1952-10-22'),
('Carla','Gugino','F','1971-08-29'),
('Alec','Guiness','M','1914-04-02'),
('Jackey','Haley','M','1961-07-14'),
('Mark','Hamill','M','1951-09-25'),
('Tom','Hanks','M','1956-07-09'),
('Daryl','Hannah','F','1958-12-03'),
('Woody','Harrelson','M','1961-07-23'),
('Rutger','Hauer','M','1944-01-23'),
('Sally','Hawkins','F','1976-04-27'),
('Kare','Hedebrant','M','1995-06-28'),
('Rumi','Hiiragi','F','1987-08-01'),
('Ian','Holm','M','1931-09-12'),
('Dennis','Hopper','M','1936-05-17'),
('Eric','Idle','M','1943-03-29'),
('Miyu','Irino','M','1988-02-19'),
('Samuel','Jackson','M','1948-12-21'),
('Terry','Jones','M','1942-02-01'),
('Milla','Jovovich','F','1975-12-17'),
('Megumi','Kagurazaka','F','1981-09-28'),
('Takeshi','Kaneshiro','M','1973-10-11'),
('Hei-Jung','Kang','F','1982-01-04'),
('Irfan','Khan','M','1967-01-07'),
('Nicole','Kidman','F','1967-06-20'),
('Val','Kilmer','M','1959-12-31'),
('Takeshi','Kitano','M','1947-01-18'),
('Keira','Knightley','F','1985-03-26'),
('Sebastian','Koch','M','1962-05-31'),
('Asuka','Kurosawa','F','1971-12-22'),
('Andy','Lau','M','1961-09-27'),
('Jude','Law','M','1972-12-29'),
('Lina','Leandersson','F','1995-09-27'),
('Bruce','Lee','M','1940-11-27'),
('Vivien','Leigh','F','1913-11-05'),
('Tony','Leung','M','1962-06-27'),
('Ray','Liotta','M','1954-12-18'),
('Danny','Lloyd','M','1972-10-13'),
('Sihung','Lung','M','1930-01-01'),
('Aki','Maeda','F','1985-07-11'),
('Tobey','Maguire','M','1975-06-27'),
('Francis','McDormand','F','1957-06-23'),
('Malcolm','McDowell','M','1943-06-13'),
('Alfred','Molina','M','1953-05-24'),
('Cathy','Moriarty','F','1960-11-29'),
('Ulrich','Muhe','M','1953-06-20'),
('Carey','Mulligan','F','1985-05-28'),
('Bill','Murray','M','1950-09-21'),
('Mari','Natsuki','F','1952-05-02'),
('Jack','Nicholson','M','1937-04-22'),
('Connie','Nielsen','F','1965-07-03'),
('Ika','Nord','F','1960-04-29'),
('Chuck','Norris','M','1940-03-10'),
('Edward','Norton','M','1969-08-18'),
('Gary','Oldman','M','1958-03-21'),
('Yasmin','Paige','F','1991-06-24'),
('Michael','Palin','M','1943-05-05'),
('Rebecca','Pan','F','1931-12-29'),
('Joe','Pesci','M','1943-02-09'),
('Joaquin','Phoenix','M','1974-10-28'),
('Natilie','Portman','F','1981-06-09'),
('Per','Ragnar','M','1941-05-29'),
('Oliver','Reed','M','1938-02-13'),
('Jean','Reno','M','1948-07-30'),
('Tony','Revolori','M','1996-04-28'),
('Craig','Roberts','M','1991-01-21'),
('Sam','Rockwell','M','1968-11-05'),
('Alexandre','Rodrigues','M','1983-05-21'),
('Saoirse','Ronan','F','1994-04-12'),
('Roy','Scheider','M','1932-11-10'),
('Jason','Schwartzmann','M','1980-06-26'),
('Suraj','Sharma','M','1993-03-21'),
('Martin','Sheen','M','1940-08-03'),
('Douglas','Silva','M','1988-09-27'),
('Dandan','Song','F','1961-08-25'),
('Rafe','Spall','M','1983-03-10'),
('Tilda','Swinton','F','1960-11-05'),
('George','Tokoro','M','1955-01-26'),
('Noah','Taylor','M','1969-09-04'),
('Uma','Thurman','F','1970-04-29'),
('John','Travolta','M','1954-02-18'),
('Chris','Tucker','M','1971-08-31'),
('Dick','Van Dyke','M','1925-12-13'),
('Hugo','Weaving','M','1960-04-04'),
('Olivia','Williams','F','1968-07-26'),
('Mykelti','Williamson','M','1957-03-04'),
('Bruce','Willis','M','1955-03-19'),
('Luke','Wilson','M','1971-09-21'),
('Owen','Wilson','M','1968-11-18'),
('Patrick','Wilson','M','1973-07-03'),
('Kate','Winslet','F','1975-10-05'),
('Faye','Wong','F','1969-08-08'),
('Robin','Wright','F','1966-04-08'),
('Michelle','Yeoh','F','1962-08-06'),
('Ji-tae','Yoo','M','1976-04-13'),
('Jin-seo','Yoon','F','1983-08-05'),
('Sean','Young','F','1959-11-20'),
('Billy','Zane','M','1966-02-24'),
('Ziyi','Zhang','F','1979-02-09');


SELECT * from actors

CREATE TABLE directors (
	director_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150) NOT NULL,
	date_of_birth DATE,
	nationality VARCHAR(20),
	add_date DATE,
	update_date DATE
);

-- SELECT * FROM directors;

-- ---------------------------------------------------
--  Records of 'movies' database > table : directors
-- ---------------------------------------------------
INSERT INTO directors (first_name,last_name,date_of_birth,nationality) VALUES
('Tomas','Alfredson','1965-04-01','Swedish'),
('Paul','Anderson','1970-06-26','American'),
('Wes','Anderson','1969-05-01','American'),
('Richard','Ayoade','1977-06-12','British'),
('Luc','Besson','1959-03-18','French'),
('James','Cameron','1954-08-16','American'),
('Guillermo','del Toro','1964-10-09','Mexican'),
('Victor','Fleming','1889-02-23','American'),
('Francis','Ford Coppola','1939-04-07','American'),
('Kinji','Fukasaku','1930-07-03','Japanese'),
('Florian ','Henckel von Donnersmarck','1973-05-02','German'),
('Terry','Jones','1942-02-01','British'),
('Stanley','Kubrick','1928-07-26','American'),
('John','Lasseter','1957-01-12','American'),
('Ang','Lee','1954-10-23','Chinese'),
('Bruce','Lee','1940-11-27','Chinese'),
('George','Lucas','1944-05-14','American'),
('Martin','McDonagh','1970-03-26','British'),
('James','McTeigue','1967-12-29','Australian'),
('Fernando','Meirelles','1955-11-09','Brazilian'),
('Hayao ','Miyazaki','1941-01-05','Japanese'),
('Paulo','Morelli','1966-03-10','Brazilian'),
('Chan-wook','Park','1963-08-23','South Korean'),
('Sam','Raimi','1959-10-23','American'),
('Mark','Romanek','1959-09-18','American'),
('Martin','Scorsese','1942-11-17','American'),
('Ridley','Scott','1937-11-30','British'),
('Tony','Scott','1944-06-21','British'),
('Zack','Snyder','1966-03-01','American'),
('Sion','Sono','1961-12-18','Japanese'),
('Steven','Spielberg','1946-12-18','American'),
('Robert','Stevenson','1905-03-31','British'),
('Quentin','Tarantino','1963-03-27','American'),
('Robert','Wise','1914-09-10','American'),
('Kar Wai','Wong','1958-07-17','Chinese'),
('Robert','Zemeckis','1952-05-14','American'),
('Yimou','Zhang','1950-04-02','Chinese');