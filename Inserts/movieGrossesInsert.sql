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


INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES 
	(0, 4, TO_DATE('23.06.2017','DD.MM.YYYY'),40669735.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES 
	(0, 4, TO_DATE('24.06.2019','DD.MM.YYYY'),62330015.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES 
	(0, 4, TO_DATE('25.06.2019','DD.MM.YYYY'),69663240.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES 
	(0, 4, TO_DATE('26.06.2019','DD.MM.YYYY'),73897888.00);
INSERT INTO movie_grosses (grosses_id, g_movie_id, grossDate, movie_theater) VALUES 
	(0, 4, TO_DATE('27.06.2019','DD.MM.YYYY'),59605210.00);
	
COMMIT;