INSERT INTO role (role_id, role_name) VALUES  (1, 'Bames Jond');
INSERT INTO role (role_id, role_name) VALUES (2, 'Gong Suko');
INSERT INTO role (role_id, role_name) VALUES (3, 'Patrick Start');
INSERT INTO role (role_id, role_name) VALUES (4, 'Anton aus Tirol');

INSERT INTO quote (quote_id, quote_phrase) VALUES (1, '"Summer is coming..."');
INSERT INTO quote (quote_id, quote_phrase) VALUES (2, '"I am your mother."');
INSERT INTO quote (quote_id, quote_phrase) VALUES (3, '"Hello. My name is Debastian Subiel. You killed my father. Prepare to die."');
INSERT INTO quote (quote_id, quote_phrase) VALUES (4, '"To infinity and beyond!"');
INSERT INTO quote (quote_id, quote_phrase) VALUES (5, '"The greatest trick the sandman ever pulled was convincing the world he did not exist."');


INSERT INTO address (address_id, postCode, street, test_location, country) VALUES (1,13629,'Langestraße 24','Berlin','Germany');
INSERT INTO address (address_id, postCode, street, test_location, country) VALUES (2,91522,'New York Street 56','New York','USA');
INSERT INTO address (address_id, postCode, street, test_location, country) VALUES (3,90187,'Saas Street 31','Los Angeles','USA');
INSERT INTO address (address_id, postCode, street, test_location, country) VALUES (4,92364,'Old Town Road 42','Dublin','Ireland');

INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (1, 'The Dalt Wisney Company', 2);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (2, 'Warner Sis.', 4);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (3, 'Parodont Pictures', 3);
INSERT INTO prodCompany (comp_id, comp_name, p_address_id) VALUES (4, '21st Century Fox', 1);


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

INSERT INTO genre (genre_id, genre_name) VALUES (1,'Action');
INSERT INTO genre (genre_id, genre_name) VALUES (2,'Drama');
INSERT INTO genre (genre_id, genre_name) VALUES (3,'Abenteuerfilm');
INSERT INTO genre (genre_id, genre_name) VALUES (4,'Thriller');
INSERT INTO genre (genre_id, genre_name) VALUES (5,'Musik');
INSERT INTO genre (genre_id, genre_name) VALUES (6,'Fantasy');
INSERT INTO genre (genre_id, genre_name) VALUES (7,'Science-Fiction');
INSERT INTO genre (genre_id, genre_name) VALUES (8,'Horror');
INSERT INTO genre (genre_id, genre_name) VALUES (9,'Western');

INSERT INTO director (dir_name, dir_birthday, dir_socSecNum) VALUES ('Steven Spielberg', to_date('24.06.1960', 'DD.MM.YYYY'), '25 240660 M 367');
INSERT INTO director (dir_name, dir_birthday, dir_socSecNum) VALUES ('Tom Fischer', to_date('12.03.1987', 'DD.MM.YYYY'), '10 120387 F 477');
INSERT INTO director (dir_name, dir_birthday, dir_socSecNum) VALUES ('Mark Jones', to_date('01.07.1979', 'DD.MM.YYYY'), '25 010779 J 367');
INSERT INTO director (dir_name, dir_birthday, dir_socSecNum) VALUES ('Vai Hu', to_date('24.12.1993', 'DD.MM.YYYY'), '25 24121993 H 127');


INSERT INTO actor (actor_name, actor_birthday, actor_socSecNum, a_role_id) VALUES ('Debastian Subiel', to_date('05.11.1995', 'DD.MM.YYYY'), '65 051195 S 003', 1);
INSERT INTO actor (actor_name, actor_birthday, actor_socSecNum, a_role_id) VALUES ('Heon Leinrich', to_date('20.04.1992', 'DD.MM.YYYY'), '18 200492 L 402', 4);
INSERT INTO actor (actor_name, actor_birthday, actor_socSecNum, a_role_id) VALUES ('Marta Higgins', to_date('02.10.1970', 'DD.MM.YYYY'), '65 021070 H 753', 3);
INSERT INTO actor (actor_name, actor_birthday, actor_socSecNum, a_role_id) VALUES ('Isabelle Freljord', to_date('06.06.1959', 'DD.MM.YYYY'), '65 060659 J 697', 2);


INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, m_genre_id, m_actor_id, m_grosses_id, plot_outline, release_date)
VALUES (1,'Bames Jond, 700 Silver Ear',1,'25 240660 M 367',4,'65 051195 S 003',1,'The Queen was threatened and Jond has to save her in a great thrilling adventure! ',TO_DATE('12.05.1987','DD:MM:YYYY'));
INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, m_genre_id, m_actor_id, m_grosses_id, plot_outline, release_date)
VALUES (2,'Bragon Doll the Movie',2,'25 24121993 H 127',1,'65 060659 J 697',2,'Son Goku wants to bekome the king of the pirates! Can he do it?',TO_DATE('23.08.2013','DD:MM:YYYY'));
INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, m_genre_id, m_actor_id, m_grosses_id, plot_outline, release_date)
VALUES (3,'Adventure in the mountains',3,'25 010779 J 367',2,'18 200492 L 402',3,'Anton had a beautiful life in the mountains, but suddenly everything changed!',TO_DATE('08.04.2015','DD:MM:YYYY'));
INSERT INTO movies (movie_id, title, m_comp_id, m_dir_id, m_genre_id, m_actor_id, m_grosses_id, plot_outline, release_date)
VALUES (4,'Patrick Starts darkest stories',4,'10 120387 F 477',8,'65 021070 H 753',2,'A bunch of scary stories told by your favourite character',TO_DATE('23.06.2017','DD:MM:YYYY'));
COMMIT ;