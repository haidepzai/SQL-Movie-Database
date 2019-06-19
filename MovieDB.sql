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
    dir_id       INTEGER,
    dir_name     VARCHAR(40) NOT NULL,
    dir_birthday DATE,
    socSecNum    VARCHAR(20) NOT NULL
);
CREATE TABLE role
(
    role_id   INTEGER,
    role_name VARCHAR(40) NOT NULL
);
CREATE TABLE quote
(
    quote_id     INTEGER,
    quote_phrase VARCHAR(200)
);
CREATE TABLE actor
(
    actor_name     VARCHAR(40) NOT NULL,
    actor_birthday DATE,
    socSecNum      VARCHAR(20) NOT NULL,
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




