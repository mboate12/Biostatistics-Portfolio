/* ============================================================
   Project: Hospital Quality Analysis
   Dataset: Hospital_General_Information.csv
   Author: Mary Boateng
   Purpose: Explore hospital ratings across states, types, and 
            emergency services to showcase SQL analysis skills.
   ============================================================ */

/* ------------------------------------------------------------
   Step 1. Preview data (first 10 rows)
   ------------------------------------------------------------ */
SELECT *
FROM hospital_info
LIMIT 10;

/* ------------------------------------------------------------
   Step 2. Inspect table structure
   ------------------------------------------------------------ */
PRAGMA table_info('hospital_info');


/* ------------------------------------------------------------
   Step 3. Count hospitals by rating (overall distribution)
   ------------------------------------------------------------ */
SELECT "Hospital overall rating",
       COUNT(*) AS num_hospitals
FROM hospital_info
GROUP BY "Hospital overall rating"
ORDER BY "Hospital overall rating";

/* ------------------------------------------------------------
   Step 4. List 5-star hospitals
   ------------------------------------------------------------ */
SELECT "Facility Name", State, "Hospital Type", "Hospital overall rating"
FROM hospital_info
WHERE "Hospital overall rating" = '5'
ORDER BY State, "Facility Name";

/* ------------------------------------------------------------
   Step 5. Count 5-star hospitals per state and rank them
   ------------------------------------------------------------ */
SELECT State,
       COUNT(*) AS num_five_star_hospitals
FROM hospital_info
WHERE "Hospital overall rating" = '5'
GROUP BY State
ORDER BY num_five_star_hospitals DESC;

/* ------------------------------------------------------------
   Step 6. Average rating by hospital type
   ------------------------------------------------------------ */
SELECT "Hospital Type",
       AVG(CAST("Hospital overall rating" AS FLOAT)) AS avg_rating
FROM hospital_info
WHERE "Hospital overall rating" IS NOT NULL
GROUP BY "Hospital Type"
ORDER BY avg_rating DESC;

/* ------------------------------------------------------------
   Step 7. Missing data check (hospitals with no rating)
   ------------------------------------------------------------ */
SELECT COUNT(*) AS missing_ratings
FROM hospital_info
WHERE "Hospital overall rating" IS NULL;

/* ------------------------------------------------------------
   Step 8. Top counties with multiple 5-star hospitals
   ------------------------------------------------------------ */
SELECT "County/Parish", State, COUNT(*) AS five_star_count
FROM hospital_info
WHERE "Hospital overall rating" = '5'
GROUP BY "County/Parish", State
HAVING five_star_count > 1
ORDER BY five_star_count DESC;

/* ------------------------------------------------------------
   Step 9. Emergency services vs. 5-star hospitals
   ------------------------------------------------------------ */
SELECT State,
       COUNT(CASE WHEN "Emergency Services" = 'Yes' 
                  AND "Hospital overall rating" = '5' THEN 1 END) AS five_star_emergency,
       COUNT(CASE WHEN "Emergency Services" = 'No' 
                  AND "Hospital overall rating" = '5' THEN 1 END) AS five_star_non_emergency
FROM hospital_info
GROUP BY State
ORDER BY five_star_emergency DESC;

/* ------*


