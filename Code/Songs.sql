DROP TABLE IF EXISTS viral_2024;
DROP TABLE IF EXISTS viral_2025;

-- create tables
CREATE TABLE viral_2024 (
   rank INTEGER,
   uri TEXT,
   artist_names TEXT,
   track_name TEXT,
   source TEXT,
   peak_rank INTEGER,
   previous_rank INTEGER,
   days_on_chart INTEGER
);

CREATE TABLE viral_2025 (
   rank INTEGER,
   uri TEXT,
   artist_names TEXT,
   track_name TEXT,
   source TEXT,
   peak_rank INTEGER,
   previous_rank INTEGER,
   days_on_chart INTEGER
);

--import files as created tables
.mode csv
.import Datasets/viral-global-daily-2024-10-31.csv viral_2024
.import Datasets/viral-global-daily-2025-10-31.csv viral_2025

-- remove headers from being considered data
DELETE FROM viral_2024 WHERE track_name = 'track_name';
DELETE FROM viral_2025 WHERE track_name = 'track_name';

-- show first five datapoints from each table
PRAGMA table_info(viral_2024);
SELECT * FROM viral_2024 LIMIT 5;
SELECT * FROM viral_2025 LIMIT 5;

-- query
SELECT track_name, artist_names, days_on_chart, '2024' as year
FROM viral_2024
WHERE days_on_chart > 100

UNION ALL

SELECT track_name, artist_names, days_on_chart, '2025' as year
FROM viral_2025
WHERE days_on_chart > 100

ORDER BY days_on_chart DESC
LIMIT 5;