# 📚 Overview of Booking System Database (Learning Project)

Hi there! 👋  
This project is a **practice database** for a simple booking system (like Airbnb but smaller).  
I built it to **learn SQL, database design, and normalization**.  

## 🎯 What I’m Learning Here
- How to design a database from scratch.
- Why **normalization** matters (1NF → 2NF → 3NF).
- How to use **primary keys, foreign keys, and constraints**.
- How to insert sample data and query it.
- How to make my SQL code clean and scalable.

## 🗂️ The Database (What It Stores)
1. **Users** → people who use the system (guest, host, or admin).
2. **Properties** → places hosts list for booking.
3. **Bookings** → when a guest books a property.
4. **Payments** → payments for bookings.
5. **Reviews** → guests leaving feedback about a property.
6. **Messages** → users sending messages to each other.

==> So it’s like a **mini Airbnb clone** database. 🏠

## 🔑 Normalization (in simple words)
I followed the rules of **database normalization** to avoid problems like duplication or inconsistency.

1. **1NF (First Normal Form)**  
   - No repeating groups, only atomic values.  
   - Example: Instead of putting multiple phone numbers in one column, I’d put them in a separate table.

2. **2NF (Second Normal Form)**  
   - Every column depends on the whole primary key.  
   - Since most of my tables use a single `id` as the primary key, this was easy.

3. **3NF (Third Normal Form)**  
   - No “indirect” dependencies.  
   - Example: In the `Booking` table, total_price depends only on the booking itself, not on the property’s base price.

👉 Bottom line: **Everything in the database depends only on the table’s key, not on something else.**

## 📊 Relationships (Explained Simply)

- A **User** can be a **Host** (who owns properties) or a **Guest** (who books them).
- A **Property** belongs to one **User** (host).
- A **Booking** links a **User (guest)** with a **Property**.
- A **Payment** belongs to one **Booking**.
- A **Review** is written by a **User** about a **Property**.
- A **Message** is sent from one **User** to another.

If we draw it like a map:
    User → Property
    User → Booking → Property
    Booking → Payment
    User → Review → Property
    User → Message → User
