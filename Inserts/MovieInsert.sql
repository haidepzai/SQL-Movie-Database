DROP SEQUENCE movieID_add1;
CREATE SEQUENCE movieID_add1
  MINVALUE 0
  START WITH 1;
CREATE OR REPLACE TRIGGER movieID_add1_trigger
  BEFORE INSERT
  ON movieID_add1
  FOR EACH ROW
BEGIN
  SELECT movie_grosses_add1.nextval
         INTO :new.grosses_id
  FROM DUAL;
END;
INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, m_genre_id, m_actor_id, m_grosses_id, plot_outline, release_date)
VALUES (0,'Bames Jond, 700 Silver Ear',4,1,2,4,2,'Ja lel ey',TO_DATE('12.05.1987','DD:MM:YYYY'));
COMMIT ;
