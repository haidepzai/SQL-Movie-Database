DROP SEQUENCE genre_add1;
CREATE SEQUENCE genre_add1
    MINVALUE 0
    START WITH 1;
CREATE OR REPLACE TRIGGER genre_id_add1_trigger
    BEFORE INSERT
    ON genre
    FOR EACH ROW
BEGIN
    SELECT genre_add1.nextval
    INTO :new.genre_id
    FROM DUAL;
END;


INSERT INTO genre (genre_id, genre_name) VALUES (0,'Action');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Drama');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Abenteuerfilm');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Thriller');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Musik');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Fantasy');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Science-Fiction');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Horror');
INSERT INTO genre (genre_id, genre_name) VALUES (0,'Western');