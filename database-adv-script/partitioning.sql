-- Assuming the booking table is large and we want to partition it by booking_start column for better performance and management.
-- PostgreSQL supports range partitioning, list partitioning, and hash partitioning.
-- Here, we will use range partitioning based on booking_start date.

-- Step 1: Create the main bookings table as a partitioned table.
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    booking_start DATE NOT NULL,
    booking_end DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (booking_start);
-- This creates a partitioned table where data will be divided into partitions based on the booking_start date.
-- Step 2: Create partitions for different date ranges.
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
-- You can create more partitions as needed for future years or months.

-- Test the performance of queries on the partitioned table (e.g., fetching bookings by date range).
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE booking_start >= '2024-06-01' AND booking_start < '2024-07-01';
-- The EXPLAIN ANALYZE output will show how the query planner uses partition pruning to only scan the relevant partitions.
-- This should improve performance significantly compared to querying a non-partitioned table, especially as the
-- bookings table grows larger over time.
-- LEARNINGS
-- Partitioning helps manage large tables by dividing them into smaller, more manageable pieces.
-- It can improve query performance by allowing the database to scan only relevant partitions.
-- Always analyze query performance before and after partitioning to measure impact.

-- ##################################################

-- 🔹 Things to remember
-- Choose partitioning strategy based on query patterns (e.g., range for date-based queries).
-- Ensure partitions are created for all expected data ranges to avoid performance hits.
-- Regularly monitor and maintain partitions (e.g., adding new partitions for future data).
-- Consider using indexes on partitioned tables for further performance improvements.
-- Note: The above code assumes you have the necessary permissions to create tables and partitions in your database.
-- Adjust the partition ranges based on your specific use case and data distribution.
-- Also, remember that partitioning is a physical database design choice and may not be supported in all SQL databases.
-- The syntax and capabilities may vary between different database systems (e.g., PostgreSQL, MySQL, Oracle, etc.).
-- Always refer to the documentation of the specific database you are using for the most accurate information.

-- ##################################################