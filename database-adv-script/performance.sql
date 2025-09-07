-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql
SELECT b.booking_id, b.booking_date, b.status,
       u.user_id, u.name AS user_name, u.email AS user_email,
       p.property_id, p.location AS property_location, p.price AS property_price,
       pay.payment_id, pay.amount AS payment_amount, pay.payment_date 
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;
-- This query joins the bookings table with users, properties, and payments tables to get comprehensive booking details.
-- Now, let's optimize this query for better performance.
-- First, we will create indexes on the foreign key columns used in the JOIN conditions to speed up the lookups.
-- Creating indexes on foreign key columns
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
-- After creating the indexes, we can re-run the initial query and use EXPLAIN ANALYZE to check the performance improvement.
EXPLAIN ANALYZE
SELECT b.booking_id, b.booking_date, b.status,
       u.user_id, u.name AS user_name, u.email AS user_email,
       p.property_id, p.location AS property_location, p.price AS property_price,
       pay.payment_id, pay.amount AS payment_amount, pay.payment_date 
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;
-- The EXPLAIN ANALYZE output will show the execution plan and time taken for the query before and after adding indexes.
-- Look for reductions in execution time and changes in the query plan indicating index usage.
-- This optimization should significantly improve the performance of the query, especially with large datasets.
-- LEARNINGS
-- Indexes on foreign key columns can greatly enhance the performance of JOIN operations.   
-- Always analyze query performance before and after optimizations to measure impact.