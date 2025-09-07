# ALX Airbnb Database Project

This repository contains a series of SQL scripts and reports focused on **advanced database concepts**.  
The objective is to master complex database operations, including:

- Joins  
- Subqueries  
- Aggregations  
- Window functions  
- Performance optimization (indexing, partitioning, query refactoring, monitoring)  

## 📂 Directory Structure

```

database-adv-script/
│
├── README.md                  # Project documentation
├── joins\_queries.sql          # Practice SQL joins
├── subqueries.sql             # Subqueries (correlated & non-correlated)
├── aggregations\_and\_window\_functions.sql
├── database\_index.sql         # Index creation
├── index\_performance.md       # Index performance report
├── perfomance.sql             # Initial & optimized queries
├── optimization\_report.md     # Query optimization report
├── partitioning.sql           # Partitioning implementation
├── partition\_performance.md   # Partitioning performance report
└── performance\_monitoring.md  # Monitoring & refinement notes

```

## 🚀 Learning Objectives & Tasks

### 1. Practice SQL Joins
**Objective:** Master SQL joins by writing complex queries using different types of joins.  
**Instructions:**
- Use an **INNER JOIN** to retrieve all bookings and their respective users.  
- Use a **LEFT JOIN** to retrieve all properties and their reviews (including properties without reviews).  
- Use a **FULL OUTER JOIN** to retrieve all users and all bookings, even if unmatched.  

📄 *File:* `joins_queries.sql`


### 2. Practice Subqueries
**Objective:** Write both correlated and non-correlated subqueries.  
**Instructions:**
- Find all properties where the **average rating > 4.0** using a subquery.  
- Write a **correlated subquery** to find users with more than 3 bookings.  

📄 *File:* `subqueries.sql`


### 3. Apply Aggregations and Window Functions
**Objective:** Use SQL aggregation and window functions to analyze data.  
**Instructions:**
- Find the **total number of bookings per user** using `COUNT` + `GROUP BY`.  
- Use window functions (`ROW_NUMBER`, `RANK`) to **rank properties by total bookings**.  

📄 *File:* `aggregations_and_window_functions.sql`


### 4. Implement Indexes for Optimization
**Objective:** Identify and create indexes to improve query performance.  
**Instructions:**
- Identify **high-usage columns** (used in `WHERE`, `JOIN`, `ORDER BY`).  
- Create indexes with `CREATE INDEX` and document them.  
- Measure performance before & after using `EXPLAIN` or `ANALYZE`.  

📄 *Files:* `database_index.sql`, `index_performance.md`


### 5. Optimize Complex Queries
**Objective:** Refactor complex queries to improve performance.  
**Instructions:**
- Write an initial **multi-table query** (bookings + user + property + payment).  
- Analyze performance with `EXPLAIN`.  
- Refactor queries to **reduce execution time** (fewer joins, better indexes).  

📄 *Files:* `perfomance.sql`, `optimization_report.md`


### 6. Partitioning Large Tables
**Objective:** Implement table partitioning for large datasets.  
**Instructions:**
- Partition the **Booking table** by `start_date`.  
- Test query performance on partitioned vs. non-partitioned tables.  
- Document improvements in a short report.  

📄 *Files:* `partitioning.sql`, `partition_performance.md`


### 7. Monitor and Refine Database Performance
**Objective:** Continuously monitor & refine performance.  
**Instructions:**
- Use `SHOW PROFILE` or `EXPLAIN ANALYZE` for query performance checks.  
- Identify bottlenecks and suggest schema/index adjustments.  
- Document performance improvements after refinements.  

📄 *File:* `performance_monitoring.md`


## 🛠️ Tools & Technologies
- **SQL (MySQL/PostgreSQL)**  
- **Query Optimization Techniques**  
- **Indexing & Partitioning**  
- **Performance Monitoring Tools** (`EXPLAIN`, `ANALYZE`, `SHOW PROFILE`)  


## 📖 Notes
This project is part of the **ALX Software Engineering Program** and focuses on building expertise in **database optimization for real-world applications** such as Airbnb.  
```