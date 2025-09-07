-- Creating an appropriate indexes for high usage columns in users, booking, and properties tables.
-- Columns used in WHERE clauses, JOIN conditions, and ORDER BY clauses are good candidates for indexing.

-- -- On Users table (primary key usually indexed by default, but we ensure it)
CREATE INDEX idx_users_email ON users(email);

-- -- On Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- -- On Properties table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);

-- ==>  This will help speed up queries that filter or join on these columns.
-- ###############################################

-- Task 2: Measure the query performance before and after adding indexes.
-- Use EXPLAIN ANALYZE to see the query execution plan and time taken.
-- Example query to test performance:
EXPLAIN ANALYZE
SELECT p.property_id, p.location, COUNT(b.booking_id) AS total_bookings
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
WHERE p.location = 'New York'
GROUP BY p.property_id, p.location
ORDER BY total_bookings DESC;
-- ==> Run this query before and after adding indexes to compare performance.
-- Look for reductions in execution time and changes in the query plan indicating index usage.
-- ###############################################