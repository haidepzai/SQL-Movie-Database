ALTER TABLE mov_act DROP CONSTRAINT movAct_fk2;
ALTER TABLE mov_act DROP CONSTRAINT movAct_fk1;
ALTER TABLE mov_gen DROP CONSTRAINT movGen_fk2;
ALTER TABLE mov_gen DROP CONSTRAINT movGen_fk1;
ALTER TABLE mov_dir DROP CONSTRAINT movDir_fk2;
ALTER TABLE mov_dir DROP CONSTRAINT movDir_fk1;
ALTER TABLE actor DROP CONSTRAINT actor_fk2;
ALTER TABLE actor DROP CONSTRAINT actor_fk1;
ALTER TABLE movies DROP CONSTRAINT movies_fk5;
ALTER TABLE movies DROP CONSTRAINT movies_fk4;
ALTER TABLE movies DROP CONSTRAINT movies_fk3 ;
ALTER TABLE movies DROP CONSTRAINT movies_fk2 ;
ALTER TABLE movies DROP CONSTRAINT movies_fk1 ;
ALTER TABLE prodCompany DROP CONSTRAINT prodCompany_fk1 ;

ALTER TABLE mov_act DROP CONSTRAINT movAct_pk;
ALTER TABLE mov_gen DROP CONSTRAINT movGen_pk;
ALTER TABLE mov_dir DROP CONSTRAINT movDir_pk;
ALTER TABLE movies DROP CONSTRAINT movies_pk;
ALTER TABLE movie_grosses DROP CONSTRAINT  movie_gross_pk ;
ALTER TABLE prodCompany DROP CONSTRAINT prodCompany_pk ;
ALTER TABLE genre DROP CONSTRAINT genre_pk ;
ALTER TABLE address DROP CONSTRAINT address_pk ;
ALTER TABLE quote DROP CONSTRAINT quote_pk ;
ALTER TABLE role DROP CONSTRAINT role_pk;
ALTER TABLE actor DROP CONSTRAINT actor_pk ;
ALTER TABLE director DROP CONSTRAINT director_pk;

DROP TABLE mov_act;
DROP TABLE mov_gen;
DROP TABLE mov_dir;
DROP TABLE movie_grosses;
DROP TABLE movies;
DROP TABLE prodCompany;
DROP TABLE role;
DROP TABLE quote;
DROP TABLE actor;
DROP TABLE genre;
DROP TABLE director;
DROP TABLE address;


CREATE TABLE director
(
    dir_name     VARCHAR(40) NOT NULL,
    dir_birthday DATE,
    dir_socSecNum    VARCHAR(20)
);
CREATE TABLE role
(
    role_id   INTEGER,
    role_name VARCHAR(40) NOT NULL
);
CREATE TABLE quote
(
    quote_id     INTEGER,
    quote_phrase VARCHAR(200) NOT NULL
);

CREATE TABLE address
(
    address_id INTEGER,
    postCode   VARCHAR(10) NOT NULL,
    street     VARCHAR(40) NOT NULL,
    test_location   VARCHAR(40) NOT NULL,
    country    VARCHAR(40) NOT NULL
);
CREATE TABLE genre
(
    genre_id   INTEGER,
    genre_name VARCHAR(40)
);
CREATE TABLE prodCompany
(
    comp_id INTEGER,
    comp_name   VARCHAR(40),
    p_address_id INTEGER NOT NULL
);
CREATE TABLE movie_grosses(
    grosses_id INTEGER,
    g_movie_id INTEGER,
    grossDate DATE NOT NULL,
    movie_theater NUMBER(15,2),
);
CREATE TABLE movies
(
    movie_id INTEGER,
    title    VARCHAR(40) NOT NULL,
    m_comp_id INTEGER NOT NULL,
    m_dir_id VARCHAR(40) NOT NULL,
    m_genre_id INTEGER NOT NULL,
    plot_outline VARCHAR(500),
    release_date DATE
);

CREATE TABLE actor
(
  actor_name     VARCHAR(40) NOT NULL,
  actor_birthday DATE,
  actor_socSecNum      VARCHAR(20) ,
  a_movie_id INTEGER NOT NULL,
  a_role_id      INTEGER     NOT NULL
);

CREATE TABLE mov_dir
(
    movDir_id INTEGER,
    md_movie_id INTEGER NOT NULL,
    md_dir_id VARCHAR(40) NOT NULL
);

CREATE TABLE mov_gen
(
    movGen_id INTEGER,
    mg_movie_id INTEGER NOT NULL,
    mg_genre_id INTEGER NOT NULL


);

CREATE TABLE mov_act
(
    movAct_id INTEGER,
    ma_movie_id INTEGER NOT NULL,
    ma_actor_id VARCHAR(20) NOT NULL
);


ALTER TABLE director ADD CONSTRAINT director_pk PRIMARY KEY (dir_socSecNum);
ALTER TABLE actor ADD CONSTRAINT actor_pk PRIMARY KEY (actor_socSecNum);
ALTER TABLE role ADD CONSTRAINT role_pk PRIMARY KEY (role_id);
ALTER TABLE quote ADD CONSTRAINT quote_pk PRIMARY KEY (quote_id);
ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY (address_id);
ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY (genre_id);
ALTER TABLE prodCompany ADD CONSTRAINT prodCompany_pk PRIMARY KEY (comp_id);
ALTER TABLE movie_grosses ADD CONSTRAINT  movie_gross_pk PRIMARY KEY (grosses_id);
ALTER TABLE movies ADD CONSTRAINT movie_pk PRIMARY KEY (movie_id);
ALTER TABLE mov_dir ADD CONSTRAINT movDir_pk PRIMARY KEY (movDir_id);
ALTER TABLE mov_gen ADD CONSTRAINT movGen_pk PRIMARY KEY (movGen_id);
ALTER TABLE mov_act ADD CONSTRAINT movAct_pk PRIMARY KEY (movAct_id);

ALTER TABLE prodCompany ADD CONSTRAINT prodCompany_fk1 FOREIGN KEY (p_address_id) REFERENCES address (address_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk1 FOREIGN KEY (m_comp_id) REFERENCES  prodCompany (comp_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk2 FOREIGN KEY (m_dir_id) REFERENCES   director (dir_socSecNum);
ALTER TABLE movies ADD CONSTRAINT movies_fk3 FOREIGN KEY (m_genre_id) REFERENCES  genre (genre_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk4 FOREIGN KEY (m_actor_id) REFERENCES  actor(actor_socSecNum);
ALTER TABLE movies ADD CONSTRAINT movies_fk5 FOREIGN KEY (m_grosses_id) REFERENCES movie_grosses(grosses_id);
ALTER TABLE actor ADD CONSTRAINT actor_fk1 FOREIGN KEY (a_role_id) REFERENCES role (role_id);
ALTER TABLE actor ADD CONSTRAINT actor_fk2 FOREIGN KEY (a_movie_id) REFERENCES movies (movie_id);
ALTER TABLE mov_dir ADD CONSTRAINT movDir_fk1 FOREIGN KEY (md_movie_id) REFERENCES movies (movie_id);
ALTER TABLE mov_dir ADD CONSTRAINT movDir_fk2 FOREIGN KEY (md_dir_id) REFERENCES director (dir_socSecNum);
ALTER TABLE mov_gen ADD CONSTRAINT movGen_fk1 FOREIGN KEY (mg_movie_id) REFERENCES movies (movie_id);
ALTER TABLE mov_gen ADD CONSTRAINT movGen_fk2 FOREIGN KEY (mg_genre_id) REFERENCES genre (genre_id);
ALTER TABLE mov_act ADD CONSTRAINT movAct_fk1 FOREIGN KEY (ma_movie_id) REFERENCES movies (movie_id);
ALTER TABLE mov_act ADD CONSTRAINT movAct_fk2 FOREIGN KEY (ma_actor_id) REFERENCES actor (actor_socSecNum);


COMMIT;

