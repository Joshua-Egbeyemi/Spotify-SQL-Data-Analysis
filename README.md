# 🎵 Spotify Advanced SQL: Business Intelligence & Streaming Analytics

## 🎯 Project Objective
This project moves beyond basic data extraction to solve core business challenges for record labels and streaming platforms. By leveraging **Advanced PostgreSQL**, I analyzed a dataset of 20,000+ tracks to identify platform-specific growth opportunities, artist performance benchmarks, and audio-driven engagement metrics.

---

## 🛠️ Tech Stack & SQL Mastery
* **Database:** PostgreSQL
* **Advanced SQL Techniques:** * **Window Functions:** `DENSE_RANK()` for competitive ranking and `SUM() OVER()` for cumulative growth tracking.
    * **Common Table Expressions (CTEs):** Used for modular logic and enhanced query readability.
    * **Conditional Aggregations:** Utilized `CASE` statements with `COALESCE` to handle cross-platform comparisons and null values.
    * **Data Integrity:** Implemented subqueries for dynamic filtering and division-by-zero safeguards.

---

## 🚀 Key Business Insights & Visual Proof

### 1. Platform Performance Gap (Spotify vs. YouTube)
**The Problem:** Marketing teams often misallocate budgets by assuming a track's popularity is uniform across platforms.
* **The Logic:** Built a subquery to compare aggregated streams, using `COALESCE` to handle platform-specific nulls.
* **Business Value:** Identifies "Audio-First" tracks that dominate Spotify but lack visual traction on YouTube.
* **Recommendation:** Shift budget from expensive video production to Spotify Playlist pitching for these tracks.

<details>
<summary><b>Click to View Query Result</b></summary>
<br>
<img src="Documentation/1.PNG" width="900" alt="Spotify vs YouTube Comparison">
</details>

---

### 2. Artist "Power Trio" Analysis
**The Problem:** Identifying which specific tracks drive the most traffic for an artist's entire catalog.
* **The Logic:** Applied `DENSE_RANK()` partitioned by artist to isolate the Top 3 tracks by total views.
* **Business Value:** Pinpoints the "Entry Point" songs that should be prioritized in discovery ads.

<details>
<summary><b>Click to View Query Result</b></summary>
<br>
<img src="Documentation/2.PNG" width="900" alt="Artist Ranking Result">
</details>

---

### 3. Engagement Growth Patterns (Cumulative Analytics)
**The Problem:** Understanding the "Viral Tipping Point"—how active engagement (Likes) scales with passive reach (Views).
* **The Logic:** Implemented a Window Function to calculate the running total of likes ordered by view count.
* **Business Value:** Helps A&R teams identify which tracks are converting "listeners" into "fans" at the highest velocity.

<details>
<summary><b>Click to View Query Result</b></summary>
<br>
<img src="Documentation/3.PNG" width="900" alt="Cumulative Growth Result">
</details>

---

## 📂 File Documentation
* **`01_database_setup.sql`**: Schema definition and table creation.
* **`02_data_cleaning.sql`**: Removing zero-duration tracks and standardizing categorical data.
* **`03_business_queries.sql`**: The core analysis script containing the 6 strategic business queries.

---

## 🏁 Final Conclusion
The analysis reveals that **platform behavior is highly segmented**. By bridging the gap between audio metadata and streaming numbers, businesses can move from "guessing" what fans like to implementing **data-driven release and marketing strategies.**

---
**Author:** Joshua Egbeyemi  
[LinkedIn Profile](https://www.linkedin.com/in/https://www.linkedin.com/in/joshua-egbeyemi-0108ja08/) | [GitHub Portfolio](https://github.com/Joshua-Egbeyemi)

