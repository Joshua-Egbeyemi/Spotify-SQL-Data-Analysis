/* ============================================================
   BUSINESS INSIGHT 1:
   Tracks Streamed More on Spotify Than YouTube
   Purpose:
   - Identify tracks that perform better on Spotify vs YouTube.
   - Useful for platform-focused promotion strategies.
   ============================================================ */

SELECT *
FROM (
    SELECT
        track,

        -- Total streams where platform = YouTube
        COALESCE(SUM(CASE 
            WHEN most_played_on = 'Youtube' THEN stream 
        END), 0) AS streamed_on_youtube,

        -- Total streams where platform = Spotify
        COALESCE(SUM(CASE 
            WHEN most_played_on = 'Spotify' THEN stream 
        END), 0) AS streamed_on_spotify

    FROM spotify
    GROUP BY track
) AS t1
WHERE streamed_on_spotify > streamed_on_youtube
AND streamed_on_youtube <> 0;



/* ============================================================
   BUSINESS INSIGHT 2:
   Top 3 Most Viewed Tracks Per Artist (Window Function)
   Purpose:
   - Identify each artist’s highest-performing songs.
   - Useful for recommendation systems & promotion targeting.
   ============================================================ */

WITH ranking_artist AS (
    SELECT
        artist,
        track,
        SUM(views) AS total_views,

        -- Rank tracks per artist by total views
        DENSE_RANK() OVER (
            PARTITION BY artist 
            ORDER BY SUM(views) DESC
        ) AS rank
    FROM spotify
    GROUP BY artist, track
)

SELECT *
FROM ranking_artist
WHERE rank <= 3
ORDER BY artist, total_views DESC;



/* ============================================================
   BUSINESS INSIGHT 3:
   Tracks With Above-Average Liveness
   Purpose:
   - Identify tracks likely recorded in live settings.
   - Liveness > average suggests live performance influence.
   ============================================================ */

-- Find average liveness score
SELECT AVG(liveness) FROM spotify;

-- Retrieve tracks with above-average liveness
SELECT 
    track,
    artist,
    liveness
FROM spotify
WHERE liveness > (
    SELECT AVG(liveness) 
    FROM spotify
);



/* ============================================================
   BUSINESS INSIGHT 4:
   Energy Range Per Album
   Purpose:
   - Measure variation in musical intensity within albums.
   - High difference suggests diverse track dynamics.
   ============================================================ */

WITH energy_stats AS (
    SELECT 
        album,
        MAX(energy) AS highest_energy,
        MIN(energy) AS lowest_energy
    FROM spotify
    GROUP BY album
)

SELECT 
    album,
    highest_energy - lowest_energy AS energy_diff
FROM energy_stats
ORDER BY energy_diff DESC;



/* ============================================================
   BUSINESS INSIGHT 5:
   Tracks With High Energy-to-Liveness Ratio
   Purpose:
   - Identify highly energetic studio tracks vs live performances.
   - Ratio > 1.2 indicates strong intensity vs live presence.
   ============================================================ */

WITH energy_ratio AS (
    SELECT
        track,
        energy,
        liveness,
        energy / liveness AS energy_to_liveness
    FROM spotify
    WHERE liveness <> 0   -- Prevent division by zero
)

SELECT *
FROM energy_ratio
WHERE energy_to_liveness > 1.2;



/* ============================================================
   BUSINESS INSIGHT 6:
   Cumulative Likes Ordered by Views
   Purpose:
   - Track engagement growth pattern.
   - Shows how likes accumulate as view count increases.
   - Uses window function for running total.
   ============================================================ */

SELECT 
    track,
    views,

    -- Running total of likes based on increasing views
    SUM(likes) OVER (ORDER BY views) AS cumulative_likes
FROM spotify
ORDER BY views;
