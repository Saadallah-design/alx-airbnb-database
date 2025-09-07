-- Aggregation functions in SQL are used to summarize data across multiple rows. Common ones include:
-- COUNT() → counts rows or non-NULL values.
-- SUM() → adds up numeric values.
-- AVG() → calculates average.
-- MIN() / MAX() → finds smallest/largest value.
-- GROUP BY is used with aggregation functions to group rows by one or more columns so you can summarize data per group.

-- ==> Find total number of bookings per user
SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;
-- 1. GROUP BY user_id → groups all bookings by each user.
-- 2. COUNT(*) → counts how many bookings each user has.
-- 3. Result: a table of user_id + total bookings.

-- ##################################################

-- Task 2: Rank properties by total number of bookings using window functions.
-- Window functions perform calculations across a set of table rows related to the current row.
-- They do not collapse rows like GROUP BY but add a new column to each row.
-- Common window functions: ROW_NUMBER(), RANK(), DENSE_RANK(), SUM() OVER
-- Here, we want to rank properties based on how many bookings they have.
SELECT property_id,
       COUNT(*) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM bookings
GROUP BY property_id;
-- 1. GROUP BY property_id → groups bookings by each property.
-- 2. COUNT(*) → counts bookings per property.
-- 3. RANK() OVER (ORDER BY COUNT(*) DESC) → ranks properties by total bookings in descending order.
-- 4. Result: a table of property_id, total bookings, and their rank.