-- 1. How many rows are in the data_analyst_jobs table?

SELECT *
FROM data_analyst_jobs;

-- answer: 1793

-- 2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
limit 10;

-- answer: ExxonMobil

-- 3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT locations
FROM data_analyst_jobs
WHERE Locations='TN'

-- answer: 21 TN
-- answer: 6 KY 

-- 4. How many postings in Tennessee have a star rating above 4?

SELECT star_rating
FROM data_analyst_jobs
WHERE star_rating > 4
and locations = 'TN'

-- answer: 3

-- 5. How many postings in the dataset have a review count between 500 and 1000?

SELECT *
FROM data_analyst_jobs
WHERE review_count
BETWEEN 500 AND 1000;

-- answer: 151

-- 6. Show the average star rating for companies in each state. 
-- The output should show the state as `state` and the average rating for the state as `avg_rating`. 
-- Which state shows the highest average rating?

SELECT company, locations AS "state", AVG(star_rating) as "avg_rating"
FROM data_analyst_jobs
WHERE star_rating > 4.9
GROUP BY company, locations

-- answer: GA, CA, MD, WI, NY, MA, TN, and VA all show an AVG rating of 5.0
-- no state has anything higher then 5.0 when updating the rating to 5.0

-- 7. Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT title
FROM data_analyst_jobs

-- answer: 881 

-- 8.	How many unique job titles are there for California companies?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE locations = 'CA'

-- answer: CA = 230 job titles

-- 9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
-- How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating), review_count
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company, review_count, star_rating

-- answer: 46 with reviews > 5000

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. 
-- Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
-- What is that rating?

SELECT company, AVG(star_rating), review_count
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company, review_count, star_rating
ORDER BY star_rating desc

-- answer: American Expres w/a avg rating of 4.19

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title LIKE '%Analyst';

-- answer: 1071 total job titles that contain Analyst
-- without duplicate titles, there's only 320 total 

--12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
-- What word do these positions have in common?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT LIKE '%Analyst%'
AND title NOT LIKE '%Analytics%'
AND title NOT LIKE '%ANALYST%'
AND title NOT LIKE '%analytics%'
AND title NOT LIKE '%ANALYTICS%'
AND title NOT LIKE '%analyst%'

-- Answer: 4 jobs without Analyst, or Analytics in the title 
-- The 4 jobs left all involve Tableau in the description 

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. 
-- Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- Disregard any postings where the domain is NULL. 
-- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
-- Which three industries are in the top 4 on this list? 
-- How many jobs have been listed for more than 3 weeks for each of the top 4?

SELECT domain, days_since_posting, skill
FROM data_analyst_jobs
WHERE (domain IS NOT null)
AND (days_since_posting IS NOT null)
AND (skill IS NOT null)
AND skill = 'SQL'
AND days_since_posting >21
ORDER BY domain DESC

-- answer: Top 3 in the top 4 on the list
-- Transport & Freight, Real Estate, Internet & Software
-- 11 jobs total > 3 weeks
-- T&F has 1, Real Estate has 1, I&S has 1 listing, and CG&S has 2 Listings over 3 weeks
