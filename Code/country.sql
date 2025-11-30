-- Drop tables if they exist
DROP TABLE IF EXISTS country1;
DROP TABLE IF EXISTS country2;

-- Create tables
CREATE TABLE country1 (
  Rank INTEGER,
  Country TEXT,
  Country_Code TEXT,
  Gold INTEGER,
  Silver INTEGER,
  Bronze INTEGER,
  Total INTEGER
);

CREATE TABLE country2 (
    Country TEXT,
    Population_2023 INTEGER,
    Population_2024 INTEGER,
    Area_km2 TEXT,
    Density_km2 REAL,
    Growth_Rate REAL,
    World_Percentage REAL,
    World_Rank INTEGER
);

-- Show table structure (attributes/columns)
PRAGMA table_info(country1);
PRAGMA table_info(country2);

-- Import data (skip header rows)
.mode csv
.import --skip 1 ../Datasets/olympics2024.csv country1
.import --skip 1 ../Datasets/World_Population_by_country_2024.csv country2

-- Verify import
SELECT * FROM country1 LIMIT 5;
SELECT * FROM country2 LIMIT 5;

-- Problem 2
SELECT 
    c1.Country,
    c1.Total as Total_Medals,
    c1.Gold,
    c2.Population_2024,
    c2.Area_km2,
    (c1.Total * 1000000.0 / c2.Population_2024) as Medals_Per_Million
FROM country1 c1
INNER JOIN country2 c2
    ON c1.Country = c2.Country
WHERE c1.Total > 30
ORDER BY Medals_Per_Million DESC
LIMIT 5;