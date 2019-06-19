DROP TABLE director;
DROP TABLE role;
DROP TABLE quote;
DROP TABLE actor;
DROP TABLE address;
DROP TABLE genre;
DROP TABLE prodCompany;
DROP TABLE movie_database;
DROP TABLE movie_grosses;

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
    location   VARCHAR(40) NOT NULL,
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
CREATE TABLE movie_database
(
    movie_id INTEGER,
    title    VARCHAR(40) NOT NULL,
    m_comp_id INTEGER NOT NULL,
    m_dir_id INTEGER NOT NULL,
    m_genre_id INTEGER NOT NULL,
    m_actor_id INTEGER NOT NULL,
    plot_outline VARCHAR(500)

);

ALTER TABLE director ADD CONSTRAINT director_pk PRIMARY KEY (dir_socSecNum);
ALTER TABLE actor ADD CONSTRAINT actor_pk PRIMARY KEY (actor_socSecNum);
ALTER TABLE role ADD CONSTRAINT role_pk PRIMARY KEY (role_id);
ALTER TABLE quote ADD CONSTRAINT quote_pk PRIMARY KEY (quote_id);
ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY (address_id);
ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY (genre_id);
ALTER TABLE prodCompany ADD CONSTRAINT prodCompany_pk PRIMARY KEY (comp_id);
ALTER TABLE movie_grosses ADD CONSTRAINT  movie_gross_pk PRIMARY KEY (grosses_id);

COMMIT;


