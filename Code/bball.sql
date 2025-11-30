-- Drop tables if they exist
DROP TABLE IF EXISTS bball1;
DROP TABLE IF EXISTS bball2;

-- Create first baseball table
CREATE TABLE bball1 (
    PLAYER TEXT,
    YRS INTEGER,
    G INTEGER,
    AB INTEGER,
    R INTEGER,
    H INTEGER,
    "2B" INTEGER,
    "3B" INTEGER,
    HR INTEGER,
    RBI INTEGER,
    BB INTEGER,
    SO INTEGER,
    SB INTEGER,
    CS INTEGER,
    BA REAL,
    HOF INTEGER
);

-- Create second baseball table
CREATE TABLE bball2 (
    Player_name TEXT,
    position TEXT,
    Games INTEGER,
    At_bat INTEGER,
    Runs INTEGER,
    Hits INTEGER,
    Double_2B INTEGER,
    third_base INTEGER,
    home_run INTEGER,
    run_batted_in INTEGER,
    a_walk INTEGER,
    Strikeouts INTEGER,
    stolen_base INTEGER,
    Caught_Stealing INTEGER,
    AVG REAL,
    On_base_Percentage REAL,
    Slugging_Percentage REAL,
    On_base_Plus_Slugging REAL
);

-- Show table structure (attributes/columns)
PRAGMA table_info(bball1);
PRAGMA table_info(bball2);

-- Import data (skip header rows)
.mode csv
.import --skip 1 ../Datasets/500hits.csv bball1
.import --skip 1 ../Datasets/baseball_hitting.csv bball2

-- Verify import
SELECT * FROM bball1 LIMIT 5;
SELECT * FROM bball2 LIMIT 5;

-- Problem 1: UNION ALL query (with explicit type casting)
SELECT 
    CAST(PLAYER as TEXT) as player_name, 
    CAST(BA as REAL) as batting_avg, 
    CAST(HR as INTEGER) as home_runs, 
    CAST(RBI as INTEGER) as runs_batted_in, 
    'Historic Players' as source
FROM bball1
WHERE BA > 0.320

UNION ALL

SELECT 
    CAST(Player_name as TEXT) as player_name, 
    CAST(AVG as REAL) as batting_avg, 
    CAST(home_run as INTEGER) as home_runs, 
    CAST(run_batted_in as INTEGER) as runs_batted_in, 
    'Modern Players' as source
FROM bball2
WHERE AVG > 0.320

ORDER BY batting_avg DESC
LIMIT 5;