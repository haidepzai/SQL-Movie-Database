DROP TABLE movies;
DROP TABLE prodCompany;
DROP TABLE role;
DROP TABLE quote;
DROP TABLE actor;
DROP TABLE genre;
DROP TABLE movie_grosses;
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
CREATE TABLE actor
(
    actor_name     VARCHAR(40) NOT NULL,
    actor_birthday DATE,
    actor_socSecNum      VARCHAR(20) ,
    a_role_id      INTEGER     NOT NULL
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
    startDate DATE NOT NULL,
    blueRay FLOAT,
    movie_theater FLOAT
);
CREATE TABLE movies
(
    movie_id INTEGER,
    title    VARCHAR(40) NOT NULL,
    m_comp_id INTEGER NOT NULL,
    m_dir_id VARCHAR(40) NOT NULL,
    m_genre_id INTEGER NOT NULL,
    m_actor_id VARCHAR(40) NOT NULL,
    m_grosses_id INTEGER NOT NULL,
    plot_outline VARCHAR(500),
    release_date DATE
);
ALTER TABLE director ADD CONSTRAINT director_pk PRIMARY KEY (dir_socSecNum);
ALTER TABLE actor ADD CONSTRAINT actor_pk PRIMARY KEY (actor_socSecNum);
ALTER TABLE role ADD CONSTRAINT role_pk PRIMARY KEY (role_id);
ALTER TABLE quote ADD CONSTRAINT quote_pk PRIMARY KEY (quote_id);
ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY (address_id);
ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY (genre_id);
ALTER TABLE prodCompany ADD CONSTRAINT prodCompany_pk PRIMARY KEY (comp_id);
ALTER TABLE movie_grosses ADD CONSTRAINT  movie_gross_pk PRIMARY KEY (grosses_id);

ALTER TABLE prodCompany ADD CONSTRAINT prodCompany_fk1 FOREIGN KEY (p_address_id) REFERENCES address (address_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk1 FOREIGN KEY (m_comp_id) REFERENCES  prodCompany (comp_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk2 FOREIGN KEY (m_dir_id) REFERENCES   director (dir_socSecNum);
ALTER TABLE movies ADD CONSTRAINT movies_fk3 FOREIGN KEY (m_genre_id) REFERENCES  genre (genre_id);
ALTER TABLE movies ADD CONSTRAINT movies_fk4 FOREIGN KEY (m_actor_id) REFERENCES  actor(actor_socSecNum);
ALTER TABLE movies ADD CONSTRAINT movies_fk5 FOREIGN KEY (m_grosses_id) REFERENCES movie_grosses(grosses_id);
ALTER TABLE actor ADD CONSTRAINT actor_fk1 FOREIGN KEY (a_role_id) REFERENCES role (role_id);

ALTER TABLE movies ADD CONSTRAINT unique_movieID_compID UNIQUE (movie_id, m_comp_id);


COMMIT;

