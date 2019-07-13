--
--WHEN STARTED FIRST, YOU CAN NOT DROP THE TABLES!!! SO PLEASE SKIP THE DROP'S!
--OTHERWISE, IF YOU START THE WHOLE SCRIPT, PRESS "Ignore all".
--
--DROP all the constraints for a fully restartable script.--------------------------------------------------------------
--
--DROP all FOREIGN KEYS--
ALTER TABLE mov_act DROP CONSTRAINT mov_act_fk2;
ALTER TABLE mov_act DROP CONSTRAINT mov_act_fk1;
ALTER TABLE mov_gen DROP CONSTRAINT mov_gen_fk2;
ALTER TABLE mov_gen DROP CONSTRAINT mov_gen_fk1;
ALTER TABLE movie_grosses DROP CONSTRAINT movies_grosses_fk1;
ALTER TABLE movies DROP CONSTRAINT movies_fk2 ;
ALTER TABLE movies DROP CONSTRAINT movies_fk1 ;
ALTER TABLE prodCompany DROP CONSTRAINT prodCompany_fk1 ;
ALTER TABLE actor DROP CONSTRAINT actor_fk1;

--DROP all PRIMARY KEYS--
ALTER TABLE mov_act DROP CONSTRAINT mov_act_pk;
ALTER TABLE mov_gen DROP CONSTRAINT mov_gen_pk;
ALTER TABLE movie_grosses DROP CONSTRAINT  movie_gross_pk ;
ALTER TABLE movies DROP CONSTRAINT movies_pk;
ALTER TABLE prodCompany DROP CONSTRAINT prodCompany_pk ;
ALTER TABLE director DROP CONSTRAINT director_pk;
ALTER TABLE actor DROP CONSTRAINT actor_pk ;
ALTER TABLE genre DROP CONSTRAINT genre_pk ;
ALTER TABLE movieRole DROP CONSTRAINT role_pk;
ALTER TABLE address DROP CONSTRAINT address_pk ;

--DROP all tables-------------------------------------------------------------------------------------------------------
--After dropping the constrains we can drop the TABLES in the right order, in terms of their dependencies.--
DROP TABLE mov_act;
DROP TABLE mov_gen;
DROP TABLE movie_grosses;
DROP TABLE movies;
DROP TABLE prodCompany;
DROP TABLE director;
DROP TABLE actor;
DROP TABLE genre;
DROP TABLE movieRole;
DROP TABLE address;

--CREATE all TABLES needed, in the right order in terms of their dependencies-------------------------------------------

CREATE TABLE address
(
    address_id INTEGER,
    postCode   CHAR(5) NOT NULL,
    street     VARCHAR(40) NOT NULL,
    city   VARCHAR(40) NOT NULL,
    country    VARCHAR(40) NOT NULL
);

CREATE TABLE movieRole
(
    role_id   INTEGER,
    role_name VARCHAR(40) NOT NULL
);

CREATE TABLE genre
(
    genre_id   INTEGER,
    genre_name VARCHAR(40) NOT NULL
);

CREATE TABLE actor
(
    actor_socSecNum      CHAR(15) ,
    actor_name     VARCHAR(40) NOT NULL,
    actor_birthday DATE,
    a_role_id      INTEGER NOT NULL
);

CREATE TABLE director
(
    dir_socSecNum    CHAR(15),
    dir_name     VARCHAR(40) NOT NULL,
    dir_birthday DATE
);

CREATE TABLE prodCompany
(
    comp_id INTEGER,
    comp_name   VARCHAR(40) NOT NULL,
    p_address_id INTEGER NOT NULL
);

CREATE TABLE movies
(
    movie_id INTEGER,
    title    VARCHAR(40) NOT NULL,
    m_comp_id INTEGER NOT NULL,
    m_dir_id CHAR(15) NOT NULL,
    plot_outline VARCHAR(500),
    release_date DATE
);

CREATE TABLE movie_grosses
(
    grosses_id INTEGER,
    g_movie_id INTEGER NOT NULL ,
    grossDate DATE NOT NULL,
    movie_theater NUMBER(15,2) NOT NULL
);

CREATE TABLE mov_gen
(
    mov_gen_id INTEGER,
    mg_movie_id INTEGER NOT NULL,
    mg_genre_id INTEGER NOT NULL,
    UNIQUE (mg_movie_id, mg_genre_id)

);

CREATE TABLE mov_act
(
    mov_act_id INTEGER,
    ma_movie_id INTEGER NOT NULL,
    ma_actor_id CHAR(15) NOT NULL,
    UNIQUE (ma_movie_id, ma_actor_id)
);


--ADD the CONSTRAINS to the tables which are needed for their dependencies----------------------------------------------
--ADD PRIMARY KEY CONSTRAINTS
ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY (address_id);
ALTER TABLE movieRole ADD CONSTRAINT role_pk PRIMARY KEY (role_id);
ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY (genre_id);
ALTER TABLE actor ADD CONSTRAINT actor_pk PRIMARY KEY (actor_socSecNum);
ALTER TABLE director ADD CONSTRAINT director_pk PRIMARY KEY (dir_socSecNum);
ALTER TABLE prodCompany ADD CONSTRAINT prodCompany_pk PRIMARY KEY (comp_id);
ALTER TABLE movies ADD CONSTRAINT movies_pk PRIMARY KEY (movie_id);
ALTER TABLE movie_grosses ADD CONSTRAINT  movie_gross_pk PRIMARY KEY (grosses_id);
ALTER TABLE mov_gen ADD CONSTRAINT mov_gen_pk PRIMARY KEY (mov_gen_id);
ALTER TABLE mov_act ADD CONSTRAINT mov_act_pk PRIMARY KEY (mov_act_id);

--ADD FOREIGN KEY CONSTRAINTS
ALTER TABLE actor ADD CONSTRAINT actor_fk1 FOREIGN KEY (a_role_id) REFERENCES movieRole (role_id);
ALTER TABLE prodCompany ADD CONSTRAINT prodCompany_fk1 FOREIGN KEY (p_address_id) REFERENCES address (address_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk1 FOREIGN KEY (m_comp_id) REFERENCES  prodCompany (comp_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk2 FOREIGN KEY (m_dir_id) REFERENCES   director (dir_socSecNum);
ALTER TABLE movie_grosses ADD CONSTRAINT movies_grosses_fk1 FOREIGN KEY (g_movie_id) REFERENCES movies (movie_id);
ALTER TABLE mov_gen ADD CONSTRAINT mov_gen_fk1 FOREIGN KEY (mg_movie_id) REFERENCES movies (movie_id);
ALTER TABLE mov_gen ADD CONSTRAINT mov_gen_fk2 FOREIGN KEY (mg_genre_id) REFERENCES genre (genre_id);
ALTER TABLE mov_act ADD CONSTRAINT mov_act_fk1 FOREIGN KEY (ma_movie_id) REFERENCES movies (movie_id);
ALTER TABLE mov_act ADD CONSTRAINT mov_act_fk2 FOREIGN KEY (ma_actor_id) REFERENCES actor (actor_socSecNum);


--INSERTS for all the tables in the right order (in terms of their dependencies) ---------------------------------------

-- Address inserts

INSERT INTO address (address_id, postCode, street, city, country)VALUES (1,13629,'Langestraße 24','Berlin','Germany');
INSERT INTO address (address_id, postCode, street, city, country)VALUES (2,91522,'New York Street 56','New York','USA');
INSERT INTO address (address_id, postCode, street, city, country)VALUES (3,90187,'Saas Street 31','Los Angeles','USA');
INSERT INTO address (address_id, postCode, street, city, country)VALUES (4,92364,'Old Town Road 42','Dublin','Ireland');


-- Role insert

INSERT INTO movieRole (role_id, role_name) VALUES  (1, 'Bames Jond');
INSERT INTO movieRole (role_id, role_name) VALUES (2, 'Gong Suko');
INSERT INTO movieRole (role_id, role_name) VALUES (3, 'Patrick Start');
INSERT INTO movieRole (role_id, role_name) VALUES (4, 'Anton aus Tirol');


-- Genre inserts

DROP SEQUENCE genre_incrementId;
CREATE SEQUENCE genre_incrementId
    MINVALUE 0
    START WITH 1;
CREATE OR REPLACE TRIGGER genre_incrementId_trigger
    BEFORE INSERT
    ON genre
    FOR EACH ROW
BEGIN
    SELECT genre_incrementId.nextval
    INTO :new.genre_id
    FROM DUAL;
END;

INSERT INTO genre (genre_id, genre_name) VALUES (0,'Action');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Drama');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Adventure');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Thriller');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Music');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Fantasy');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Science-Fiction');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Horror');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Western');


-- Actor insert

INSERT INTO actor (actor_socSecNum, actor_name, actor_birthday, a_role_id) VALUES ('65 051195 S 003', 'Debastian Subiel', to_date('05.11.1995', 'DD.MM.YYYY'), 2);
INSERT INTO actor (actor_socSecNum, actor_name, actor_birthday, a_role_id) VALUES ('18 200492 L 402', 'Heon Leinrich', to_date('20.04.1992', 'DD.MM.YYYY'), 4);
INSERT INTO actor (actor_socSecNum, actor_name, actor_birthday, a_role_id) VALUES ('33 021070 H 753', 'Marta Higgins', to_date('02.10.1970', 'DD.MM.YYYY'), 1);
INSERT INTO actor (actor_socSecNum, actor_name, actor_birthday, a_role_id) VALUES ('20 060659 J 697', 'Isabelle Freljord', to_date('06.06.1959', 'DD.MM.YYYY'), 3);


-- Director inserts

INSERT INTO director (dir_socSecNum, dir_name, dir_birthday) VALUES ('25 240660 M 367', 'Steven Spielberg', to_date('24.06.1960', 'DD.MM.YYYY'));
INSERT INTO director (dir_socSecNum, dir_name, dir_birthday) VALUES ('10 120387 F 477', 'Tom Fischer', to_date('12.03.1987', 'DD.MM.YYYY'));
INSERT INTO director (dir_socSecNum, dir_name, dir_birthday) VALUES ('15 010779 J 367', 'Mark Jones', to_date('01.07.1979', 'DD.MM.YYYY'));
INSERT INTO director (dir_socSecNum, dir_name, dir_birthday) VALUES ('24 171219 H 127', 'Vai Hu', to_date('24.12.1993', 'DD.MM.YYYY'));


-- ProdCompany inserts

INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (1, 'The Dalt Wisney Company', 2);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (2, 'Warner Sis.', 4);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (3, 'Parodont Pictures', 3);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (4, '21st Century Fox', 1);


-- Movies inserts

INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, plot_outline, release_date)
VALUES (1,'Bames Jond, 700 Silver Ear',1,'25 240660 M 367','The Queen was threatened and Jond has to save her in a great thrilling adventure! ',TO_DATE('12.05.1987','DD.MM.YYYY'));
INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, plot_outline, release_date)
VALUES (2,'Bragon Doll the Movie',2,'10 120387 F 477','Son Goku wants to bekome the king of the pirates! Can he do it?',TO_DATE('23.08.2013','DD.MM.YYYY'));
INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, plot_outline, release_date)
VALUES (3,'Adventure in the mountains',3,'15 010779 J 367','Anton had a beautiful life in the mountains, but suddenly everything changed!',TO_DATE('08.04.2015','DD.MM.YYYY'));
INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, plot_outline, release_date)
VALUES (4,'Patrick Starts darkest stories',4,'24 171219 H 127',NULL,TO_DATE('23.10.2019','DD.MM.YYYY'));
INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, plot_outline, release_date)
VALUES (5,'The One and Only Movie',1,'15 010779 J 367',NULL,NULL);


-- MovieGrosses inserts
-- Trigger that checks whether a movie that has not been published yet, but has been previously added to the database, has been assigned a positive "grosses-value"
CREATE OR REPLACE TRIGGER prevent_future_grosses
    BEFORE INSERT OR UPDATE ON movie_grosses
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
DECLARE
    relDate DATE;
    refId INT;
    invalid_grosses exception;
    PRAGMA EXCEPTION_INIT(invalid_grosses, -20550);
BEGIN
    SELECT m.release_date INTO relDate FROM movies m WHERE :NEW.g_movie_id = m.movie_id;
    SELECT m.movie_id INTO refId FROM movies m WHERE :NEW.g_movie_id = m.movie_id;
    IF (relDate > SYSDATE OR relDate IS NULL) AND :NEW.g_movie_id = refId AND :NEW.movie_theater > 0 THEN
        RAISE_APPLICATION_ERROR(-20550, 'Grosses for a movie entered which has not been published yet!');
    END IF;
END;

-- Inserts into 'grosses_id' will be counted up with the trigger
DROP SEQUENCE grosses_incrementId;
CREATE SEQUENCE grosses_incrementId
    MINVALUE 0
    START WITH 1;
CREATE OR REPLACE TRIGGER grosses_incrementId_trigger
    BEFORE INSERT
    ON movie_grosses
    FOR EACH ROW
BEGIN
    SELECT grosses_incrementId.nextval
    INTO :NEW.grosses_id
    FROM DUAL;
END;

INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 1, TO_DATE('12.05.1987','DD.MM.YYYY'),10648270.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 1, TO_DATE('13.05.1987','DD.MM.YYYY'),23046879.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 1, TO_DATE('14.05.1987','DD.MM.YYYY'),31164579.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 1, TO_DATE('15.05.1987','DD.MM.YYYY'),30134687.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 1, TO_DATE('16.05.1987','DD.MM.YYYY'),29637540.00);


INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 2, TO_DATE('23.08.2013','DD.MM.YYYY'),1046978.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 2, TO_DATE('24.08.2013','DD.MM.YYYY'),2405367.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 2, TO_DATE('25.08.2013','DD.MM.YYYY'),4603161.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 2, TO_DATE('26.08.2013','DD.MM.YYYY'),4401349.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 2, TO_DATE('27.08.2013','DD.MM.YYYY'),5000134.00);


INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 3, TO_DATE('08.04.2015','DD.MM.YYYY'),6064371.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 3, TO_DATE('09.04.2015','DD.MM.YYYY'),8643077.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 3, TO_DATE('10.04.2015','DD.MM.YYYY'),9640225.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 3, TO_DATE('11.04.2015','DD.MM.YYYY'),11376660.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 3, TO_DATE('12.04.2015','DD.MM.YYYY'),9613664.00);

--mov_gen inserts

--Inserts into 'mov_gen_id' will be counted up with the trigger
DROP SEQUENCE mov_gen_incrementId;
CREATE SEQUENCE mov_gen_incrementId
    MINVALUE 0
    START WITH 1;
CREATE OR REPLACE TRIGGER mov_gen_incrementId_trigger
    BEFORE INSERT
    ON mov_gen
    FOR EACH ROW
BEGIN
    SELECT mov_gen_incrementId.nextval
    INTO :new.mov_gen_id
    FROM DUAL;
END;

INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 1, 3);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 1, 2);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 1, 5);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 3, 7);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 3, 6);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 4, 3);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 4, 8);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 4, 1);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 5, 4);


-- mov_act inserts

-- Inserts into 'mov_act ' will be counted up with the trigger
DROP SEQUENCE mov_act_incrementId;
CREATE SEQUENCE mov_act_incrementId
    MINVALUE 0
    START WITH 1;
CREATE OR REPLACE TRIGGER mov_act_incrementId_trigger
    BEFORE INSERT
    ON mov_act
    FOR EACH ROW
BEGIN
    SELECT mov_act_incrementId.nextval
    INTO :new.mov_act_id
    FROM DUAL;
END;


INSERT INTO mov_act (mov_act_id, ma_movie_id, ma_actor_id) VALUES (0, 1, '65 051195 S 003');
INSERT INTO mov_act (mov_act_id, ma_movie_id, ma_actor_id) VALUES (0, 1, '18 200492 L 402');
INSERT INTO mov_act (mov_act_id, ma_movie_id, ma_actor_id) VALUES (0, 2, '65 051195 S 003');
INSERT INTO mov_act (mov_act_id, ma_movie_id, ma_actor_id) VALUES (0, 2, '33 021070 H 753');
INSERT INTO mov_act (mov_act_id, ma_movie_id, ma_actor_id) VALUES (0, 2, '20 060659 J 697');
INSERT INTO mov_act (mov_act_id, ma_movie_id, ma_actor_id) VALUES (0, 3, '20 060659 J 697');
INSERT INTO mov_act (mov_act_id, ma_movie_id, ma_actor_id) VALUES (0, 4, '18 200492 L 402');
INSERT INTO mov_act (mov_act_id, ma_movie_id, ma_actor_id) VALUES (0, 5, '33 021070 H 753');

COMMIT;

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--SELECT commands ------------------------------------------------------------------------------------------------------
--SELECT everything in movies--
SELECT * FROM movies;
--SELECT movie title and the referenced actors--
SELECT m.title, a.actor_name FROM movies m , actor a, mov_act ma WHERE m.movie_id = ma.ma_movie_id AND ma.ma_actor_id = a.actor_socSecNum;
--SELECT movies which were released before a specific date--
SELECT m.title, release_date FROM movies m WHERE release_date < to_date('23.03.2015', 'DD.MM.YYYY');

--Use sum, count functions in addition with GROUP BY and ordered descending--
--SELECT movies with the sum of the total income--
SELECT m.title, sum(g.movie_theater) AS Sum_Of_Grosses FROM movies m, movie_grosses g WHERE m.movie_id = g.g_movie_id GROUP BY m.title ORDER BY Sum_Of_Grosses DESC;
--SELECT number of genres for each movie
SELECT m.title, COUNT(*) AS Number_of_genres FROM movies m, genre g, mov_gen mg WHERE m.movie_id = mg.mg_movie_id AND mg.mg_genre_id = g.genre_id GROUP BY m.title ORDER BY Number_of_genres DESC;

--LEFT OUTER JOIN to check whether a movie has no assigned genre
SELECT * FROM movies m LEFT OUTER JOIN mov_gen mg ON m.movie_id = mg.mg_movie_id WHERE mov_gen_id IS NULL;


--UPDATE commands-------------------------------------------------------------------------------------------------------
--UPDATE the plot outline of a specific movie--
UPDATE movies SET plot_outline = 'A bunch of scary stories told by your favourite character' WHERE movie_id = 4;
--Change(UPDATE) the genre names of two specific genres--
UPDATE genre SET genre_name = 'Adventure' WHERE genre_id = 4;
UPDATE genre SET genre_name = 'Thriller' WHERE genre_id = 3;
--UPDATE the release date of a specific movie--
UPDATE movies SET release_date = to_date('23.12.2018', 'DD.MM.YYYY') WHERE movie_id = 1;
--UPDATE movie_grosses by adding grosses to all entries of a specific movie
UPDATE movie_grosses SET movie_theater =+ 10000.00 WHERE g_movie_id = 1;

COMMIT;

--Trigger-tests---------------------------------------------------------------------------------------------------------
--IncrementId-TRIGGER tests--
SELECT * FROM genre WHERE genre_id = 5;
SELECT * FROM mov_act WHERE mov_act_id = 3;
SELECT * FROM mov_gen WHERE mov_gen_id = 1;
SELECT * FROM movie_grosses WHERE grosses_id = 15;

--Test of Trigger: "prevent_future_grosses"
INSERT INTO movie_grosses(grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 5, SYSDATE, 66754.00);

