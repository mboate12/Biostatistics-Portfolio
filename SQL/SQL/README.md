#  Hospital Ratings SQL Analysis

##  Project Overview
This project uses real hospital data to explore how hospital types and states relate to their overall CMS quality ratings. It includes SQL skills like filtering, grouping, ordering, and basic aggregation.

##  Queries Included
1. Preview of the dataset
2. List of 5-star rated hospitals
3. Count of 5-star hospitals by state
4. Average hospital rating by hospital type
5. List of hospitals with missing ratings
6. Temporary cleaned table (no missing values)

##  Sample SQL Used

```sql
SELECT "Hospital Name", State, "Hospital Type", "Hospital overall rating"
FROM "hospital_project.db.csv"
WHERE "Hospital overall rating" = '5';
