/* ============================================================
   SPOTIFY DATASET TABLE CREATION
   Purpose:
   - Create a structured table to store Spotify track-level metrics.
   - Designed for music analytics, engagement analysis, and feature exploration.
   - Includes audio features, performance metrics, and platform indicators.
   ============================================================ */

-- Remove table if it already exists (prevents duplication errors)
DROP TABLE IF EXISTS spotify;

-- Create the main Spotify analytics table
CREATE TABLE spotify(

    /* ========================
       BASIC TRACK INFORMATION
       ======================== */
    artist VARCHAR(255),          -- Name of the performing artist
    track VARCHAR(255),           -- Track name
    album VARCHAR(255),           -- Album where the track appears
    album_type VARCHAR(255),      -- Album classification (single, album, compilation)

    /* ========================
       AUDIO FEATURE METRICS
       (Spotify-engineered attributes)
       ======================== */
    danceability FLOAT,           -- How suitable the track is for dancing (0–1)
    energy FLOAT,                 -- Intensity and activity level of the track
    loudness FLOAT,               -- Overall loudness in decibels (dB)
    speechiness FLOAT,            -- Presence of spoken words
    acoustiness FLOAT,            -- Likelihood the track is acoustic
    instrumentalness FLOAT,       -- Probability the track contains no vocals
    liveness FLOAT,               -- Presence of live audience recording
    valence FLOAT,                -- Positivity/mood of the track
    tempo FLOAT,                  -- Speed of the track (BPM)
    duration_min FLOAT,           -- Track duration in minutes

    /* ========================
       CONTENT & PLATFORM DATA
       ======================== */
    title VARCHAR(255),           -- YouTube/streaming video title
    channel VARCHAR(255),         -- Channel or publisher name

    /* ========================
       ENGAGEMENT METRICS
       ======================== */
    views FLOAT,                  -- Total video views
    likes BIGINT,                 -- Total likes
    comments BIGINT,              -- Total comments

    /* ========================
       RIGHTS & DISTRIBUTION
       ======================== */
    licensed BOOLEAN,             -- Whether the content is officially licensed
    official_video BOOLEAN,       -- Indicates if it's an official music video

    /* ========================
       STREAMING PERFORMANCE
       ======================== */
    stream BIGINT,                -- Total stream count across platforms

    /* ========================
       DERIVED / ENGINEERED FEATURES
       ======================== */
    energy_liveness FLOAT,        -- Combined metric for performance intensity
    most_played_on VARCHAR(50)    -- Platform with highest plays (e.g., YouTube/Spotify)
);
