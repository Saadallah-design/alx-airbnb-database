## 💡 What is normalization
In simple words, database normalization is like organizing a messy closet. It means arranging data in 
1. a database into smaller
2. neat tables so there’s less repeated information. 

This makes the database 
- easier to manage, 
- quicker to search, 
- and helps keep the information accurate and consistent. 

🎯 By breaking data into focused tables and connecting them properly, it avoids errors and confusion when adding, changing, or deleting data. 
==> It's about creating order and making sure each table in the database has a clear, single purpose.

## The normalization principles to ensure a database is in Third Normal Form (3NF) include the following:
1. The database must first be in Second Normal Form (2NF). This means that it should already have no partial dependencies — every non-prime attribute is fully functionally dependent on the entire primary key.

2. It must have no transitive dependencies for non-prime attributes. This means no non-key attribute should depend on another non-key attribute. All non-prime attributes must depend directly on the primary key.

3. Formally, for every functional dependency X → Y in the table, at least one of these conditions must hold:
    - X is a superkey (a key that uniquely identifies rows),
    - or Y is a prime attribute (an attribute that is part of some candidate key).

==> ***By ensuring these principles***, the database avoids redundancy and update anomalies caused by transitive dependencies where a non-key attribute indirectly depends on the primary key via another non-key attribute. Essentially, 3NF requires that every non-key attribute provides a fact about the key, the whole key, and nothing but the key.

## Database Normalization to 3NF

### Step 1: First Normal Form (1NF)

- ***Requirement***: Each table must have atomic values (no repeating groups or arrays) and a primary key.
- ***User, Property, Booking, Payment, Review, Message tables*** already have atomic attributes and primary keys. ✅
- No repeating groups exist. ✅
==> Conclusion: Tables are in 1NF.

### Step 2: Second Normal Form (2NF)

- ***Requirement***: Must be in 1NF and all non-key attributes must be fully functionally dependent on the entire primary key.
- All tables have single-column primary keys (user_id, property_id, booking_id, etc.), so no partial dependency is possible. ✅

==> Conclusion: Tables are in 2NF.

### Step 3: Third Normal Form (3NF)

- ***Requirement***: Must be in 2NF and no non-key attribute depends on another non-key attribute (i.e., no transitive dependency).

**Analysis of each table:**
1. User
    - Attributes: first_name, last_name, email, password_hash, phone_number, role, created_at
    - No transitive dependency among non-key attributes. ✅

2. Property
    - Attributes: host_id, name, description, location, pricepernight, created_at, updated_at
    - host_id → User(user_id) is a FK; all other attributes depend on property_id. ✅

3. Booking
    - Attributes: property_id, user_id, start_date, end_date, total_price, status, created_at
    - All non-key attributes depend on booking_id. ✅

4. Payment
    - Attributes: booking_id, amount, payment_date, payment_method
    - All non-key attributes depend on payment_id. ✅

5. Review
    - Attributes: property_id, user_id, rating, comment, created_at
    - All non-key attributes depend on review_id. ✅

6. Message
    - Attributes: sender_id, recipient_id, message_body, sent_at
    - All non-key attributes depend on message_id. ✅

## Summary Table

| Table    | Normalization Status | Notes                                   |
| -------- | -------------------- | --------------------------------------- |
| User     | 3NF                  | ✅ No transitive dependencies            |
| Property | 3NF                  | ✅ FK to User(host\_id)                  |
| Booking  | 3NF                  | ✅ FK to Property and User               |
| Payment  | 3NF                  | ✅ FK to Booking                         |
| Review   | 3NF                  | ✅ FK to Property and User               |
| Message  | 3NF                  | ✅ FK to User(sender\_id, recipient\_id) |


