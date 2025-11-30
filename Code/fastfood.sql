-- Drop tables if they exist
DROP TABLE IF EXISTS food1;
DROP TABLE IF EXISTS food2;

-- Create tables
CREATE TABLE food1 (
  ID INTEGER,
  address ADDRESS,
  categories TEXT,
  city TEXT,
  country TEXT,
  latitude REAL,
  longitude REAL,
  name TEXT,
  postalCode INTEGER,
  province TEXT,
  websites TEXT
);

CREATE TABLE food2 (
    Fast_Food_Chains TEXT,
    Sales_Millions INTEGER,
    AVG_Sales_Thousands INTEGER,
    Franchised_Stores INTEGER,
    Company_Stores INTEGER,
    Total_Units_2021 INTEGER,
    Total_Change_Units_From_2020 INTEGER
);

-- Show table structure (attributes/columns)
PRAGMA table_info(food1);
PRAGMA table_info(food2);

-- Import data (skip header rows)
.mode csv
.import --skip 1 ../Datasets/Fast_Food_Restaurants_US.csv food1
.import --skip 1 ../Datasets/Top_50_Fast_Food_Chains_in_USA.csv food2

-- Verify import
SELECT * FROM food1 LIMIT 5;
SELECT * FROM food2 LIMIT 5;

-- Problem 2
SELECT 
    f1.name as chain,
    COUNT(*) as locations_in_dataset,
    f1.province,
    f2.Sales_Millions as total_us_locations,
    f2.AVG_Sales_Thousands,
    f2.Franchised_Stores
FROM food1 f1
INNER JOIN food2 f2
    ON f1.name = f2.Fast_Food_Chains
WHERE f1.country = 'US'
GROUP BY f1.name, f1.province, f2.Sales_Millions, f2.AVG_Sales_Thousands, f2.Franchised_Stores
LIMIT 5;