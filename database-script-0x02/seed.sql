-- =========================
-- SAMPLE DATA POPULATION
-- =========================

-- 1. Insert Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '123-456-7890', 'guest'),
  (gen_random_uuid(), 'Bob', 'Williams', 'bob@example.com', 'hashed_pw2', '321-654-0987', 'host'),
  (gen_random_uuid(), 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', NULL, 'guest'),
  (gen_random_uuid(), 'Diana', 'Smith', 'diana@example.com', 'hashed_pw4', '555-444-3333', 'admin');

-- Get user IDs for relationships (replace with actual values if running manually)
-- SELECT * FROM "User";

-- 2. Insert Properties (owned by Bob as host)
INSERT INTO "Property" (property_id, host_id, name, description, location, price_per_night)
VALUES
  (gen_random_uuid(), (SELECT user_id FROM "User" WHERE email='bob@example.com'), 'Seaside Villa', 'A beautiful villa by the beach.', 'Miami, FL', 250.00),
  (gen_random_uuid(), (SELECT user_id FROM "User" WHERE email='bob@example.com'), 'Mountain Cabin', 'Cozy cabin with a mountain view.', 'Aspen, CO', 180.00);

-- SELECT * FROM "Property";

-- 3. Insert Bookings (Alice & Charlie book Bob’s properties)
INSERT INTO "Booking" (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM "Property" WHERE name='Seaside Villa'),
   (SELECT user_id FROM "User" WHERE email='alice@example.com'),
   '2025-06-10', '2025-06-15', 1250.00, 'confirmed'),

  (gen_random_uuid(),
   (SELECT property_id FROM "Property" WHERE name='Mountain Cabin'),
   (SELECT user_id FROM "User" WHERE email='charlie@example.com'),
   '2025-07-01', '2025-07-05', 720.00, 'pending');

-- SELECT * FROM "Booking";

-- 4. Insert Payments (only Alice paid, Charlie’s booking is pending)
INSERT INTO "Payment" (payment_id, booking_id, amount, payment_method)
VALUES
  (gen_random_uuid(),
   (SELECT booking_id FROM "Booking" b JOIN "User" u ON b.user_id=u.user_id WHERE u.email='alice@example.com'),
   1250.00, 'credit_card');

-- SELECT * FROM "Payment";

-- 5. Insert Reviews (Alice reviews Seaside Villa)
INSERT INTO "Review" (review_id, property_id, user_id, rating, comment)
VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM "Property" WHERE name='Seaside Villa'),
   (SELECT user_id FROM "User" WHERE email='alice@example.com'),
   5, 'Amazing stay! The villa was perfect for our family vacation.');

-- SELECT * FROM "Review";

-- 6. Insert Messages (Alice messages Bob, Bob replies)
INSERT INTO "Message" (message_id, sender_id, recipient_id, message_body)
VALUES
  (gen_random_uuid(),
   (SELECT user_id FROM "User" WHERE email='alice@example.com'),
   (SELECT user_id FROM "User" WHERE email='bob@example.com'),
   'Hi Bob, I’m interested in booking your villa. Is it available in June?'),

  (gen_random_uuid(),
   (SELECT user_id FROM "User" WHERE email='bob@example.com'),
   (SELECT user_id FROM "User" WHERE email='alice@example.com'),
   'Hi Alice, yes, the villa is available. I’ll confirm your booking shortly.');
