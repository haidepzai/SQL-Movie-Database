-- SELECTs --

SELECT * FROM movies;

SELECT m.title, a.actor_name, mR.role_name FROM movies m, actor a, movieRole mR WHERE m.movie_id = mR.mR_movie_id AND mR.mR_actor_id = a.actor_socSecNum;

SELECT m.title, release_date FROM movies m WHERE release_date < to_date('23.03.2015', 'DD.MM.YYYY');

SELECT m.title, sum(g.movie_theater) AS Sum_Of_Grosses FROM movies m, movie_grosses g WHERE m.movie_id = g.g_movie_id GROUP BY m.title ORDER BY Sum_Of_Grosses DESC;

SELECT m.title, COUNT(*) AS Number_of_genres FROM movies m, genre g, mov_gen mg WHERE m.movie_id = mg.mg_movie_id AND mg.mg_genre_id = g.genre_id GROUP BY m.title ORDER BY Number_of_genres DESC;

SELECT m.title, m.release_date, mg.grossDate, mg.movie_theater FROM movies m LEFT OUTER JOIN movie_grosses mg ON m.movie_id = mg.g_movie_id;


--UPDATEs --

UPDATE movies SET plot_outline = 'A bunch of scary stories told by your favourite character' WHERE movie_id = 4;

UPDATE genre SET genre_name = 'Adventure' WHERE genre_id = 4;
UPDATE genre SET genre_name = 'Thriller' WHERE genre_id = 3;

UPDATE movies SET release_date = to_date('23.12.2018', 'DD.MM.YYYY') WHERE movie_id = 1;

UPDATE movie_grosses SET movie_theater =+ 10000.00 WHERE g_movie_id = 1;


COMMIT;


-- TRIGGER-tests --

-- IncrementId-TRIGGER --

SELECT * FROM movie_grosses WHERE grosses_id = 3;
SELECT * FROM movie_grosses WHERE grosses_id = 4;
SELECT * FROM movie_grosses WHERE grosses_id = 5;


-- TRIGGER: "prevent_future_grosses" --

INSERT INTO movie_grosses(grosses_id, g_movie_id, grossDate, movie_theater) VALUES
(0, 5, SYSDATE, 66754.00);



