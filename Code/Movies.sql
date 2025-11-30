-- Drop tables if they exist
DROP TABLE IF EXISTS christmas_movies;
DROP TABLE IF EXISTS imdb_top_1000;

-- Create first movies table
CREATE TABLE movies1 (
    title TEXT,
    rating TEXT,
    runtime TEXT,
    imdb_rating TEXT,
    meta_score TEXT,
    genre TEXT,
    release_year TEXT,
    description TEXT,
    director TEXT,
    stars TEXT,
    votes TEXT,
    gross TEXT,
    img_src TEXT,
    type TEXT
);

-- Create second movies table
CREATE TABLE movies2 (
    Poster_Link TEXT,
    Series_Title TEXT,
    Released_Year TEXT,
    Certificate TEXT,
    Runtime TEXT,
    Genre TEXT,
    IMDB_Rating TEXT,
    Overview TEXT,
    Meta_score TEXT,
    Director TEXT,
    Star1 TEXT,
    Star2 TEXT,
    Star3 TEXT,
    Star4 TEXT,
    No_of_Votes TEXT,
    Gross TEXT
);

-- Import data (adjust filenames to match yours)
.mode csv
.import --skip 1 ../Datasets/christmas_movies.csv movies1
.import --skip 1 ../Datasets/imdb_top_1000.csv movies2

-- Verify import
SELECT * FROM movies1 LIMIT 5;
SELECT * FROM movies2 LIMIT 5;

-- Problem 2: JOIN (find movies in BOTH datasets)
SELECT 
    m1.title,
    m1.director,
    m1.imdb_rating as rating_christmas,
    m2.IMDB_Rating as rating_imdb,
    m1.genre as genre_christmas,
    m2.Genre as genre_imdb
FROM movies1 m1
INNER JOIN movies2 m2
    ON m1.title = m2.Series_Title
    AND m1.director = m2.Director
WHERE CAST(m1.imdb_rating AS REAL) > 7.0
LIMIT 5;