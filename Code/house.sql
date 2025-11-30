-- Drop tables if they exist
DROP TABLE IF EXISTS house1;
DROP TABLE IF EXISTS house2;

-- Create tables
CREATE TABLE house1 (
   date DATE,
   price INTEGER,
   bedrooms INTEGER,
   bathrooms INTEGER,
   sqft_living INTEGER,
   sqft_lot INTEGER,
   floors INTEGER,
   waterfront INTEGER,
   view INTEGER,
   condition INTEGER,
   sqft_above INTEGER,
   sqft_basement INTEGER,
   yr_built INTEGER,
   yr_renovated INTEGER,
   street TEXT,
   city TEXT,
   statezip TEXT,
   country TEXT
);

CREATE TABLE house2 (
   City TEXT,
   Price INTEGER,
   Address TEXT,
   Number_Beds INTEGER,
   Number_Baths INTEGER,
   Province TEXT,
   Population INTEGER,
   Latitude REAL,
   Longitude REAL,
   Median_Family_Income INTEGER
);

-- Show table structure (attributes/columns)
PRAGMA table_info(house1);
PRAGMA table_info(house2);

-- Import data (skip header rows)
.mode csv
.import --skip 1 ../Datasets/USA_Housing_Dataset.csv house1
.import --skip 1 ../Datasets/CanadianHouseListings.csv house2

-- Verify import
SELECT * FROM house1 LIMIT 5;
SELECT * FROM house2 LIMIT 5;

-- Problem 1
SELECT city, price, bedrooms, bathrooms, sqft_living, 'USA' as country
FROM house1
WHERE price > 500000

UNION ALL

SELECT City, Price, Number_Beds, Number_Baths, NULL as sqft_living, 'Canada' as country
FROM house2
WHERE Price > 500000

ORDER BY price DESC
LIMIT 5;