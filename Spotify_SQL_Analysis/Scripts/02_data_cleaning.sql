/* ============================================================
   SPOTIFY DATA EXPLORATION & DATA QUALITY CHECKS
   Purpose:
   - Understand dataset size and structure
   - Check uniqueness across key fields
   - Identify invalid records
   - Perform basic cleaning
   ============================================================ */


-- Total number of records in the dataset
SELECT COUNT(*) 
FROM spotify;


-- Number of unique artists
SELECT COUNT(DISTINCT artist) 
FROM spotify;


-- Number of unique albums
SELECT COUNT(DISTINCT album) 
FROM spotify;


-- Number of album types (e.g., single, album, compilation)
SELECT COUNT(DISTINCT album_type) 
FROM spotify;



/* ============================================================
   DURATION ANALYSIS
   Purpose:
   - Check range and quality of track duration values
   ============================================================ */

-- View duration values (quick inspection)
SELECT duration_min 
FROM spotify;

-- Longest track duration
SELECT MAX(duration_min) 
FROM spotify;

-- Shortest track duration
SELECT MIN(duration_min) 
FROM spotify;



/* ============================================================
   DATA QUALITY CHECK
   Purpose:
   - Identify invalid records (e.g., duration = 0)
   - These may represent missing or corrupted data
   ============================================================ */

-- Inspect records with invalid duration
SELECT * 
FROM spotify
WHERE duration_min = 0;

-- Remove invalid records to improve analysis accuracy
DELETE FROM spotify
WHERE duration_min = 0;



/* ============================================================
   CATEGORICAL DATA EXPLORATION
   Purpose:
   - Understand platform and channel distribution
   ============================================================ */

-- List unique content channels
SELECT DISTINCT channel 
FROM spotify;

-- Identify platforms where tracks are most played
SELECT DISTINCT most_played_on 
FROM spotify;
