# Overview of this directory
This is directory is for designing database Schema using "Data Definition Language" (DDL) commands.

## What's Schema Design?
Schema design involves creating the database schema, which defines the structure of tables, columns, data types, and constraints. It serves as the blueprint for the database.

## Components of Schema Design:
- **Tables**: Define the structure of data storage.
- **Columns**: Specify data types and constraints for each table.
- **Primary Keys**: Uniquely identify each record in a table.
- **Foreign Keys**: Maintain relationships between tables.
- **Constraints**: Define rules for data integrity (e.g., NOT NULL, UNIQUE).

## How to Design a Schema:
- **Define Requirements:** Understand the data requirements and relationships.
- **Create Tables**: Design tables based on entities and attributes.
- **Set Data Types**: Choose appropriate data types for each column.
- **Establish Keys**: Define primary and foreign keys to enforce relationships.
- **Apply Constraints**: Implement constraints to ensure data integrity.
- **Importance**: A well-designed schema ensures efficient data storage, retrieval, and integrity. It provides a foundation for building and scaling applications effectively.

## Key aspects of Database Schema DDL:

1. The database schema acts like a plan or framework for how all data is stored and linked.
2. DDL is a set of SQL commands used to create, modify, or delete database objects like tables, indexes, and schemas.
3. Common DDL commands include CREATE (to build tables or databases), ALTER (to change structure by adding/removing columns), and DROP (to delete objects).
4. Designing the schema involves deciding what tables are needed, what fields they have, their data types, and how they relate to each other through keys (primary keys and foreign keys).

==> A good schema ensures efficient data storage, avoids redundancy, and enforces rules that keep data accurate.

## Schema design
### Define Requirements

#### Entities in your system:
- User – holds account info for guests, hosts, admins.
- Property – properties listed by hosts.
- Booking – bookings made by users for properties.
- Payment – payments linked to bookings.
- Review – ratings/comments left by users on properties.
- Message – messages between users.

#### Relationships:
- User → Property (1-to-many)
- User → Booking (1-to-many)
- Property → Booking (1-to-many)
- Booking → Payment (1-to-1 or 1-to-many)
- User → Review (1-to-many)
- Property → Review (1-to-many)
- User ↔ User through Message (many-to-many, via sender/recipient)