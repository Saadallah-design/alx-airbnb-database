-- We follow normalization rules (3NF), ensure atomic attributes, and define keys and constraints.

-- =========================================================
-- Normalized Schema Creation Script
-- =========================================================

-- 1. Create table for users
CREATE TABLE "User" (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    role VARCHAR(20) NOT NULL CHECK(role IN ('guest','host','admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_user_email ON "User"(email);

-- 2. Create table for properties
CREATE TABLE "Property" (
    property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_property_host FOREIGN KEY(host_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);
CREATE INDEX idx_property_host ON "Property"(host_id);

-- 3. Create table for bookings
CREATE TABLE "Booking" (
    booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK(status IN ('pending','confirmed','canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property FOREIGN KEY(property_id) REFERENCES "Property"(property_id) ON DELETE CASCADE,
    CONSTRAINT fk_booking_user FOREIGN KEY(user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);
CREATE INDEX idx_booking_property ON "Booking"(property_id);
CREATE INDEX idx_booking_user ON "Booking"(user_id);

-- 4. Create table for payments
CREATE TABLE "Payment" (
    payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    booking_id UUID NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method VARCHAR(20) NOT NULL CHECK(method IN ('credit_card','paypal','stripe')),
    CONSTRAINT fk_payment_booking FOREIGN KEY(booking_id) REFERENCES "Booking"(booking_id) ON DELETE CASCADE
);
CREATE INDEX idx_payment_booking ON "Payment"(booking_id);

-- 5. Create table for reviews
CREATE TABLE "Review" (
    review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INT NOT NULL CHECK(rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_property FOREIGN KEY(property_id) REFERENCES "Property"(property_id) ON DELETE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY(user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);
CREATE INDEX idx_review_property ON "Review"(property_id);
CREATE INDEX idx_review_user ON "Review"(user_id);

-- 6. Create table for messages
CREATE TABLE "Message" (
    message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_message_sender FOREIGN KEY(sender_id) REFERENCES "User"(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_message_recipient FOREIGN KEY(recipient_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);
CREATE INDEX idx_message_sender ON "Message"(sender_id);
CREATE INDEX idx_message_recipient ON "Message"(recipient_id);

/*
Step 3: Key Points of this Design

- 3NF compliant – no transitive dependencies, all attributes depend on primary key.
- Atomic attributes – no arrays or repeating groups.
- Foreign keys – maintain relationships between entities.
- Constraints – CHECK constraints on enums, ratings, and NOT NULL fields.
- Indexes – optimize searches on frequently queried columns (email, booking_id, property_id).
- Scalability – ENUMs can be replaced with lookup tables in the future.
*/
