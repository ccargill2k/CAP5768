-- Drop tables if they exist
DROP TABLE IF EXISTS vgame1;
DROP TABLE IF EXISTS vgame2;

-- Create first video games table
CREATE TABLE vgame1 (
    app_ID INTEGER,
    title TEXT,
    date_release DATE,
    win TEXT,
    mac TEXT,
    linux TEXT,
    rating TEXT,
    positive_ratio INTEGER,
    user_reviews INTEGER,
    price_final REAL,
    price_original REAL,
    discount REAL,
    steam_deck TEXT
);

-- Create second video games table
CREATE TABLE vgame2 (
    Title TEXT,
    Original_Price REAL,
    Discounted_Price REAL,
    Release_Date DATE,
    Link TEXT,
    Game_Description TEXT,
    Recent_Reviews_Summary TEXT,
    All_Reviews_Summary TEXT,
    Recent_Reviews_Number TEXT,
    All_Reviews_Number TEXT,
    Developer TEXT,
    Publisher TEXT,
    Supported_Languages TEXT,
    Popular_Tags TEXT,
    Game_Features TEXT,
    Minimum_Requirements TEXT
);

-- Show table structure (attributes/columns)
PRAGMA table_info(vgame1);
PRAGMA table_info(vgame2);

-- Import data (skip header rows)
.mode csv
.import --skip 1 ../Datasets/gamesfile.csv vgame1
.import --skip 1 ../Datasets/merged_game_data.csv vgame2

-- Verify import
SELECT * FROM vgame1 LIMIT 5;
SELECT * FROM vgame2 LIMIT 5;

-- Problem 2: JOIN query (find games in BOTH datasets with enriched info)
SELECT 
    v1.title,
    v1.rating as steam_rating,
    v2.All_Reviews_Summary as popular_rating,
    v1.price_final,
    v2.Developer,
    v2.Publisher,
    v1.win,
    v1.mac,
    v1.linux
FROM vgame1 v1
INNER JOIN vgame2 v2
    ON v1.title = v2.Title
WHERE v1.rating LIKE '%Positive%'
    AND v2.Developer IS NOT NULL
LIMIT 5;