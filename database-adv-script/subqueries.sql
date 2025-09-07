-- A subquery is a query inside another query.
-- This code below is to find all properties with an average rating above 4.0.
SELECT property_id, AVG(rating) AS avg_rating
FROM reviews
GROUP BY property_id;
-- ==> This will give us the average rating for each property.

-- Now, we use a subquery to filter properties with an average rating above 4.0.
SELECT property_id, AVG(rating) AS avg_rating
FROM reviews
GROUP BY property_id
HAVING AVG(rating) > 4.0;
-- ==> HAVING is like WHERE but for aggregated values.
-- ==> This will return only those properties with an average rating greater than 4.0.

-- Now; Let's use it as subquery to get more details about these properties.
SELECT *
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
-- ==> This will return all details of properties that have an average rating above 4.0.

-- STEP #3: Checking for correlated subqueries to find users who have made more thatn 3 bookings.
SELECT *
FROM users AS u
WHERE (
    SELECT COUNT(*)
    FROM bookings AS b
    WHERE b.user_id = u.user_id
) > 3;
-- This version is called correlated subquery because the inner query references a column from the outer query (u.user_id).
-- The inner query runs once for each row of the outer query.
-- The inner query counts bookings for each user, and the outer query filters users with more than
-- ==> This gives us users with more than 3 bookings.
-- Now, let's use a correlated subquery to get details of these users.
SELECT *
FROM users u
WHERE EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.user_id = u.user_id
    AND (SELECT COUNT(*) FROM bookings b_inner WHERE b_inner.user_id = u.user_id) > 3
);
-- ==> This will return all details of users who have made more than 3 bookings.

-- LEARNINGS
-- Why use a subquery here?
-- Subqueries let you break a problem into steps: first calculate averages, then filter properties.
-- It’s more flexible than trying to combine everything in one single query with joins and aggregations.
-- 🔹 Things to remember
-- Use GROUP BY whenever aggregating per group.
-- Use HAVING to filter after aggregation.
-- IN (subquery) is a common pattern for filtering based on computed results.