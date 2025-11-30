-- Drop tables if they exist
DROP TABLE IF EXISTS artist1;
DROP TABLE IF EXISTS artist2;

-- Create tables
CREATE TABLE artist1 (
  id INTEGER,
  name TEXT,
  years INTEGER,
  genre TEXT,
  nationality TEXT,
  bio TEXT,
  wikipedia TEXT,
  paintings INTEGER
);

CREATE TABLE artist2 (
    Artist_ID INTEGER,
    Name TEXT,
    Nationality TEXT,
    Gender TEXT,
    Birth_Year INTEGER,
    Death_Year INTEGER
);

PRAGMA table_info(artist1);
PRAGMA table_info(artist2);

.mode csv
.import --skip 1 ../Datasets/artists.csv artist1
.import --skip 1 ../Datasets/artists_one.csv artist2

-- Verify import
SELECT * FROM artist1 LIMIT 5;
SELECT * FROM artist2 LIMIT 5;

SELECT 
    a1.name,
    a1.genre,
    a1.nationality,
    a1.paintings as total_paintings,
    a2.Gender,
    a2.Birth_Year,
    a2.Death_Year,
    (a2.Death_Year - a2.Birth_Year) as years_lived
FROM artist1 a1
INNER JOIN artist2 a2
    ON a1.name = a2.Name
WHERE a1.paintings > 100
    AND a1.genre IS NOT NULL
ORDER BY a1.paintings DESC
LIMIT 5;