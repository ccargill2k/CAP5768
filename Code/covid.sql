-- Drop tables if they exist
DROP TABLE IF EXISTS covid1;
DROP TABLE IF EXISTS covid2;

-- Create first baseball table
CREATE TABLE covid1 (
   Country TEXT,
   Total_Cases INTEGER,
   Total_Deaths INTEGER,
   Total_Recovered INTEGER,
   Active_Cases INTEGER,
   Total_Cases_Per_Million INTEGER,
   Deaths_Per_Million INTEGER,
   Total_Tests INTEGER,
   Tests_Per_Million INTEGER,
   Population INTEGER
);

-- Create second baseball table
CREATE TABLE covid2 (
   Country Text,
   Cases_Last_7_Days INTEGER,
   Cases_Preceding_7_Days INTEGER,
   Weekly_Case_Percentage_Change INTEGER,
   Cases_Last_7_Days_Per_Million INTEGER,
   Deaths_Last_7_Days INTEGER,
   Deaths_Preceding_7_Days INTEGER,
   Weekly_Death_Percentage_Change INTEGER,
   Deaths_Last_7_Days_Per_Million INTEGER,
   Population INTEGER
);

-- Show table structure (attributes/columns)
PRAGMA table_info(covid1);
PRAGMA table_info(covid2);

-- Import data (skip header rows)
.mode csv
.import --skip 1 ../Datasets/covid_north_america.csv covid1
.import --skip 1 ../Datasets/covid_europe_weekly_trend.csv covid2

-- Verify import
SELECT * FROM covid1 LIMIT 5;
SELECT * FROM covid2 LIMIT 5;

-- Problem 1
SELECT 
    Country,
    Total_Cases as Cases, 
    Total_Deaths as Deaths,
    Population,
    'Caribbean/Americas' as Region
FROM covid1
WHERE Total_Cases > 5000000

UNION ALL

SELECT 
    Country,
    Cases_Last_7_Days as Cases,
    Deaths_Last_7_Days as Deaths,
    Population,
    'Europe' as Region
FROM covid2
WHERE Cases_Last_7_Days > 10

ORDER BY Cases DESC
LIMIT 5;