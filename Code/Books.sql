DROP TABLE IF EXISTS books1;
DROP TABLE IF EXISTS books2;

-- create tables
CREATE TABLE books1 (
   bookID INTEGER,
   title TEXT,
   authors TEXT,
   average_rating REAL,
   isbn INTEGER,
   isbn13 INTEGER,
   language_code TEXT,
   num_pages INTEGER,
   ratings_count INTEGER,
   text_reviews_count INTEGER,
   publication_date DATE,
   publisher TEXT
);

CREATE TABLE books2 (
   Name TEXT,
   Author TEXT,
   User_Rating REAL,
   Reviews INTEGER,
   Price INTEGER,
   Year DATE,
   Genre TEXT
);

--import files as created tables
.mode csv
.import ../Datasets/bookstable.csv books1
.import ../Datasets/bestsellers.csv books2

DELETE FROM books1 WHERE title = 'title';
DELETE FROM books2 WHERE Name = 'Name';

-- show first five datapoints from each table
PRAGMA table_info(books1);
PRAGMA table_info(books2);
SELECT * FROM books1 LIMIT 5;
SELECT * FROM books2 LIMIT 5;

-- query
SELECT title, authors, average_rating, publication_date, 'Books Table' as source
FROM books1
WHERE average_rating > 4.5

UNION ALL

SELECT Name as title, Author as authors, User_Rating as average_rating, Year as publication_date, 'Best Sellers' as source
FROM books2
WHERE User_Rating > 4.5

ORDER BY average_rating DESC
LIMIT 5;