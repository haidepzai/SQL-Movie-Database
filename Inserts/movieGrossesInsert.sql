
DROP SEQUENCE movie_grosses_add1;
CREATE SEQUENCE movie_grosses_add1
  MINVALUE 0
  START WITH 1;
CREATE OR REPLACE TRIGGER add1_trigger
  BEFORE INSERT
  ON movie_grosses
  FOR EACH ROW
  BEGIN
    SELECT movie_grosses_add1.nextval
      INTO :new.grosses_id
    FROM DUAL;
END;
INSERT INTO movie_grosses (grosses_id, startDate, blueRay, movie_theater) VALUES (0,TO_DATE('23.05.2018','DD:MM:YYYY'),1200000,45000000);
INSERT INTO movie_grosses (grosses_id, startDate, blueRay, movie_theater) VALUES (0,TO_DATE('04.09.2017','DD:MM:YYYY'),1200000,45000000);
INSERT INTO movie_grosses (grosses_id, startDate, blueRay, movie_theater) VALUES (0,TO_DATE('23.05.2018','DD:MM:YYYY'),1200000,45000000);
INSERT INTO movie_grosses (grosses_id, startDate, blueRay, movie_theater) VALUES (0,TO_DATE('23.05.2018','DD:MM:YYYY'),1200000,45000000);
COMMIT;