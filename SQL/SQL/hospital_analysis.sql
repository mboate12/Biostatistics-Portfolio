-- Step 1: Preview the hospital_info table; showcasing 1st 10 row 

SELECT *
FROM "hospital_project.db.csv"
LIMIT 10;

--Step 2: List the column names in hospital_project.db.csv to understand structure of table 
PRAGMA table_info('hospital_project.db.csv') 


--  Step 3: Select hospitals with a 5-star rating

SELECT "Hospital Name",State, "Hospital Type", "Hospital overall rating"
FROM "hospital_project.db.csv"
WHERE "Hospital overall rating" = '5'
ORDER BY  "State", "Hospital Name";


-- Step 4: Count 5-star hospitals per state
SELECT State, COUNT(*) AS num_five_star_hospitals
FROM "hospital_project.db.csv"
WHERE "Hospital overall rating" = '5'
GROUP BY State
ORDER BY num_five_star_hospitals DESC;

-- Step 5: Average hospital rating by hospital type; to  show case which type of hospital scores higher
SELECT "Hospital Type", 
       AVG(CAST("Hospital overall rating" AS FLOAT)) AS average_rating
FROM "hospital_project.db.csv"
WHERE "Hospital overall rating" IS NOT NULL
GROUP BY "Hospital Type"
ORDER BY average_rating DESC;

--  Step 6: List hospitals with missing overall ratings
SELECT "Hospital Name", State, "Hospital Type"
FROM "hospital_project.db.csv"
WHERE "Hospital overall rating" IS NULL
LIMIT 10;

-- Bonus: Create a clean version of the table without NULL ratings; a temporary version for future queries without missing data
CREATE TEMP TABLE clean_hospital_info AS
SELECT *
FROM "hospital_project.db.csv"
WHERE "Hospital overall rating" IS NOT NULL;

