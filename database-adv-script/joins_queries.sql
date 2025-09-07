-- Aim of this joins_queries.sql file is to demonstrate different types of SQL joins.
-- I will write queries to show how INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN work.
-- For the INNER JOIN example, I will retrieve all bookings and the respective users who made those bookings.

SELECT bookings.booking_id, users.user_id, users.username
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;

-- This INNER JOIN ensures only rows with matching user_id in both bookings and users are returned.
-- Selecting booking_id, user_id, and username, ties each booking to the user who made it.

-- ###########################################

-- For the LEFT JOIN example, I will retrieve all properties and their reviews, including properties that have no reviews.

SELECT properties.property_id, properties.title, reviews.review_id, reviews.rating
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id
ORDER BY properties.property_id;

-- This LEFT JOIN returns all properties, even those without reviews.
-- If a property has no reviews, the review_id and rating will be NULL.

-- ###########################################

-- For the FULL OUTER JOIN example, I will  retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

SELECT users.user_id, users.username, bookings.booking_id, bookings.property_id
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;

-- This FULL OUTER JOIN returns all users and all bookings.
-- If a user has no bookings, the booking_id and property_id will be NULL.
-- If a booking is not linked to a user, the user_id and username will be NULL