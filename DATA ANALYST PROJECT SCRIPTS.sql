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
