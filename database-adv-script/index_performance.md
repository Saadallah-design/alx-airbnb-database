# First let's define what are INDEXES in SQL
## 1️⃣ What are Indexes in SQL?
An index is a special lookup table that the database uses to speed up data retrieval.
==> Think of it like the index at the back of a book: instead of reading the whole book to find a word, you look it up in the index and jump straight there.

### Without indexes:
SQL has to scan the whole table (called a full table scan) → very slow on large datasets.

### With indexes:
SQL uses the index tree (usually B-tree) to quickly locate rows.

## 2️⃣ When to Use Indexes

Indexes are most useful on columns that are:

- Used in WHERE conditions (e.g., WHERE user_id = 5)
- Used in JOIN conditions (e.g., ON bookings.user_id = users.user_id)
- Used in ORDER BY and GROUP BY clauses

⚠️ But: indexes take up extra space and slow down INSERT/UPDATE/DELETE operations, so you should only index high-usage columns.

## 3️⃣ Example: ALX Airbnb Tables
Likely high-usage columns:

- **users.user_id** (joins, filters, primary key)
- **bookings.user_id** (joins with users)
- **bookings.property_id** (joins with properties)
- **properties.property_id** (joins, primary key)
- **bookings.start_date** (queries by date range, e.g., for partitioning later)



