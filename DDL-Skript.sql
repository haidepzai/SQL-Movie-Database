--- Movie-database ---

-- DROP CONSTRAINTS --

ALTER TABLE mov_gen DROP CONSTRAINT mov_gen_fk2;
ALTER TABLE mov_gen DROP CONSTRAINT mov_gen_fk1;
ALTER TABLE movieRole DROP CONSTRAINT movieRole_fk2;
ALTER TABLE movieRole DROP CONSTRAINT movieRole_fk1;
ALTER TABLE movie_grosses DROP CONSTRAINT movies_grosses_fk1;
ALTER TABLE movies DROP CONSTRAINT movies_fk2 ;
ALTER TABLE movies DROP CONSTRAINT movies_fk1 ;
ALTER TABLE prodCompany DROP CONSTRAINT prodCompany_fk1 ;

ALTER TABLE mov_gen DROP CONSTRAINT mov_gen_unique;
ALTER TABLE movieRole DROP CONSTRAINT movieRole_unique;

ALTER TABLE mov_gen DROP CONSTRAINT mov_gen_pk;
ALTER TABLE movieRole DROP CONSTRAINT movieRole_pk;
ALTER TABLE movie_grosses DROP CONSTRAINT  movie_gross_pk ;
ALTER TABLE movies DROP CONSTRAINT movies_pk;
ALTER TABLE prodCompany DROP CONSTRAINT prodCompany_pk ;
ALTER TABLE director DROP CONSTRAINT director_pk;
ALTER TABLE actor DROP CONSTRAINT actor_pk ;
ALTER TABLE genre DROP CONSTRAINT genre_pk ;
ALTER TABLE address DROP CONSTRAINT address_pk ;


-- DROP TABLES --

DROP TABLE mov_gen;
DROP TABLE movieRole;
DROP TABLE movie_grosses;
DROP TABLE movies;
DROP TABLE prodCompany;
DROP TABLE director;
DROP TABLE actor;
DROP TABLE genre;
DROP TABLE address;


-- CREATE TABLES --

CREATE TABLE address
(
    address_id INTEGER,
    postCode   CHAR(5) NOT NULL,
    street     VARCHAR(40) NOT NULL,
    city   VARCHAR(40) NOT NULL,
    country    VARCHAR(40) NOT NULL
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
    actor_birthday DATE
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

CREATE TABLE movieRole
(
    role_id   INTEGER,
    role_name VARCHAR(40) NOT NULL,
    mR_actor_id CHAR(15) NOT NULL,
    mR_movie_id INTEGER NOT NULL

);

CREATE TABLE mov_gen
(
    mov_gen_id INTEGER,
    mg_movie_id INTEGER NOT NULL,
    mg_genre_id INTEGER NOT NULL
);


-- ADD CONSTRAINTS --

ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY (address_id);
ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY (genre_id);
ALTER TABLE actor ADD CONSTRAINT actor_pk PRIMARY KEY (actor_socSecNum);
ALTER TABLE director ADD CONSTRAINT director_pk PRIMARY KEY (dir_socSecNum);
ALTER TABLE prodCompany ADD CONSTRAINT prodCompany_pk PRIMARY KEY (comp_id);
ALTER TABLE movies ADD CONSTRAINT movies_pk PRIMARY KEY (movie_id);
ALTER TABLE movie_grosses ADD CONSTRAINT  movie_gross_pk PRIMARY KEY (grosses_id);
ALTER TABLE movieRole ADD CONSTRAINT movieRole_pk PRIMARY KEY (role_id);
ALTER TABLE mov_gen ADD CONSTRAINT mov_gen_pk PRIMARY KEY (mov_gen_id);

ALTER TABLE mov_gen ADD CONSTRAINT mov_gen_unique UNIQUE (mg_movie_id, mg_genre_id);
ALTER TABLE movieRole ADD CONSTRAINT movieRole_unique UNIQUE (mR_actor_id, mR_movie_id);

ALTER TABLE prodCompany ADD CONSTRAINT prodCompany_fk1 FOREIGN KEY (p_address_id) REFERENCES address (address_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk1 FOREIGN KEY (m_comp_id) REFERENCES  prodCompany (comp_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk2 FOREIGN KEY (m_dir_id) REFERENCES   director (dir_socSecNum);
ALTER TABLE movie_grosses ADD CONSTRAINT movies_grosses_fk1 FOREIGN KEY (g_movie_id) REFERENCES movies (movie_id);
ALTER TABLE movieRole ADD CONSTRAINT movieRole_fk2 FOREIGN KEY (mR_movie_id) REFERENCES movies (movie_id);
ALTER TABLE movieRole ADD CONSTRAINT movieRole_fk1 FOREIGN KEY (mR_actor_id) REFERENCES actor (actor_socSecNum);
ALTER TABLE mov_gen ADD CONSTRAINT mov_gen_fk1 FOREIGN KEY (mg_movie_id) REFERENCES movies (movie_id);
ALTER TABLE mov_gen ADD CONSTRAINT mov_gen_fk2 FOREIGN KEY (mg_genre_id) REFERENCES genre (genre_id);


-- INSERTs --

INSERT INTO address (address_id, postCode, street, city, country) VALUES (1,13629,'Langestraße 24','Berlin','Germany');
INSERT INTO address (address_id, postCode, street, city, country) VALUES (2,91522,'New York Street 56','New York','USA');
INSERT INTO address (address_id, postCode, street, city, country) VALUES (3,90187,'Saas Street 31','Los Angeles','USA');
INSERT INTO address (address_id, postCode, street, city, country) VALUES (4,92364,'Old Town Road 42','Dublin','Ireland');


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


INSERT INTO actor (actor_socSecNum, actor_name, actor_birthday) VALUES ('65 051195 S 003', 'Debastian Subiel', to_date('05.11.1995', 'DD.MM.YYYY'));
INSERT INTO actor (actor_socSecNum, actor_name, actor_birthday) VALUES ('18 200492 L 402', 'Heon Leinrich', to_date('20.04.1992', 'DD.MM.YYYY'));
INSERT INTO actor (actor_socSecNum, actor_name, actor_birthday) VALUES ('33 021070 H 753', 'Marta Higgins', to_date('02.10.1970', 'DD.MM.YYYY'));
INSERT INTO actor (actor_socSecNum, actor_name, actor_birthday) VALUES ('20 060659 J 697', 'Isabelle Freljord', to_date('06.06.1959', 'DD.MM.YYYY'));


INSERT INTO director (dir_socSecNum, dir_name, dir_birthday) VALUES ('25 240660 M 367', 'Steven Spielberg', to_date('24.06.1960', 'DD.MM.YYYY'));
INSERT INTO director (dir_socSecNum, dir_name, dir_birthday) VALUES ('10 120387 F 477', 'Tom Fischer', to_date('12.03.1987', 'DD.MM.YYYY'));
INSERT INTO director (dir_socSecNum, dir_name, dir_birthday) VALUES ('15 010779 J 367', 'Mark Jones', to_date('01.07.1979', 'DD.MM.YYYY'));
INSERT INTO director (dir_socSecNum, dir_name, dir_birthday) VALUES ('24 171219 H 127', 'Vai Hu', to_date('24.12.1993', 'DD.MM.YYYY'));


INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (1, 'The Dalt Wisney Company', 2);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (2, 'Warner Sis.', 4);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (3, 'Parodont Pictures', 3);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (4, '21st Century Fox', 1);


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


DROP SEQUENCE movieRole_incrementId;
CREATE SEQUENCE movieRole_incrementId
    MINVALUE 0
    START WITH 1;
CREATE OR REPLACE TRIGGER movieRole_incrementId_trigger
    BEFORE INSERT
    ON movieRole
    FOR EACH ROW
BEGIN
    SELECT movieRole_incrementId.nextval
    INTO :new.role_id
    FROM DUAL;
END;

INSERT INTO movieRole (role_id, role_name, mR_actor_id, mR_movie_id) VALUES  (0, 'Bames Jond', '65 051195 S 003', 1);
INSERT INTO movieRole (role_id, role_name, mR_actor_id, mR_movie_id) VALUES (0, 'Queen', '33 021070 H 753', 1);
INSERT INTO movieRole (role_id, role_name, mR_actor_id, mR_movie_id) VALUES (0, 'Gong Suko', '33 021070 H 753', 2);
INSERT INTO movieRole (role_id, role_name, mR_actor_id, mR_movie_id) VALUES (0, 'Anton aus Tirol', '18 200492 L 402' , 3);
INSERT INTO movieRole (role_id, role_name, mR_actor_id, mR_movie_id) VALUES (0, 'Patrick Start', '65 051195 S 003', 4);
INSERT INTO movieRole (role_id, role_name, mR_actor_id, mR_movie_id) VALUES (0, 'Sandy', '20 060659 J 697', 4);
INSERT INTO movieRole (role_id, role_name, mR_actor_id, mR_movie_id) VALUES (0, 'Gary', '33 021070 H 753', 4);
INSERT INTO movieRole (role_id, role_name, mR_actor_id, mR_movie_id) VALUES (0, 'Der Echte', '18 200492 L 402', 5);


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
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 2, 7);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 3, 6);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 3, 3);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 4, 8);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 4, 1);
INSERT INTO mov_gen (mov_gen_id, mg_movie_id, mg_genre_id) VALUES (0, 5, 4);


COMMIT;