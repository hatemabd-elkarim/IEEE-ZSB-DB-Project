-- Wagba Database Seed Data
-- Generated with realistic, interconnected dummy data

USE wagba;

-- Disable foreign key checks for clean insertion
SET FOREIGN_KEY_CHECKS = 0;

-- Clear existing data
TRUNCATE TABLE Captain_Earning;
TRUNCATE TABLE Captain_Review;
TRUNCATE TABLE Item_Review;
TRUNCATE TABLE Restaurant_Review;
TRUNCATE TABLE Payment;
TRUNCATE TABLE Order_Item_Modifier;
TRUNCATE TABLE Order_Items;
TRUNCATE TABLE Promo_Usage;
TRUNCATE TABLE Promo_Code;
TRUNCATE TABLE Modifier_Option;
TRUNCATE TABLE Modifier_Group;
TRUNCATE TABLE Item;
TRUNCATE TABLE Delivery_Pricing_Rule;
TRUNCATE TABLE Wallet_Ledger;
TRUNCATE TABLE `Order`;
TRUNCATE TABLE Delivery_Zone;
TRUNCATE TABLE Captain;
TRUNCATE TABLE Branch;
TRUNCATE TABLE Restaurant;
TRUNCATE TABLE Address;
TRUNCATE TABLE Customer_Phone;
TRUNCATE TABLE Customer;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- CUSTOMERS (20 customers with wallet histories)
-- ============================================
INSERT INTO Customer (name, email) VALUES
('Ahmed Hassan', 'ahmed.hassan@email.com'),
('Fatima Ali', 'fatima.ali@email.com'),
('Mohamed Salah', 'mohamed.salah@email.com'),
('Nour Ibrahim', 'nour.ibrahim@email.com'),
('Youssef Mahmoud', 'youssef.mahmoud@email.com'),
('Layla Ahmed', 'layla.ahmed@email.com'),
('Omar Khaled', 'omar.khaled@email.com'),
('Mariam Said', 'mariam.said@email.com'),
('Karim Mostafa', 'karim.mostafa@email.com'),
('Hana Tarek', 'hana.tarek@email.com'),
('Ali Ramadan', 'ali.ramadan@email.com'),
('Sara Adel', 'sara.adel@email.com'),
('Hassan Farouk', 'hassan.farouk@email.com'),
('Dina Youssef', 'dina.youssef@email.com'),
('Amr Samy', 'amr.samy@email.com'),
('Noha Gamal', 'noha.gamal@email.com'),
('Tarek Essam', 'tarek.essam@email.com'),
('Rana Hossam', 'rana.hossam@email.com'),
('Sherif Nabil', 'sherif.nabil@email.com'),
('Yasmin Wael', 'yasmin.wael@email.com');

-- Customer Phone Numbers (Egyptian format)
INSERT INTO Customer_Phone (phone_no, customer_id) VALUES
('01012345678', 1), ('01098765432', 1),
('01123456789', 2),
('01234567890', 3),
('01145678901', 4),
('01256789012', 5),
('01167890123', 6),
('01278901234', 7),
('01089012345', 8),
('01190123456', 9),
('01001234567', 10),
('01112345678', 11),
('01223456789', 12),
('01034567890', 13),
('01145678902', 14),
('01256789013', 15),
('01067890124', 16),
('01178901235', 17),
('01289012346', 18),
('01090123457', 19),
('01101234568', 20);

-- Customer Addresses
INSERT INTO Address (customer_id, street, building, floor, gps_coordinates) VALUES
(1, 'Salah Salem St', '15', '3', '30.0444,31.2357'),
(1, 'Nasr City', '42', '7', '30.0626,31.3458'),
(2, 'Tahrir Square', '8', '2', '30.0444,31.2357'),
(3, 'Zamalek St', '23', '5', '30.0626,31.2230'),
(4, 'Heliopolis', '67', '1', '30.0876,31.3223'),
(5, 'Maadi Corniche', '12', '4', '29.9602,31.2568'),
(6, 'Mohandessin', '88', '6', '30.0489,31.2001'),
(7, '6th October City', '34', '2', '29.9553,30.9378'),
(8, 'New Cairo', '56', '8', '30.0229,31.4913'),
(9, 'Dokki', '19', '3', '30.0382,31.2121'),
(10, 'Giza Square', '77', '5', '30.0131,31.2089'),
(11, 'Nasr City', '91', '7', '30.0626,31.3458'),
(12, 'Heliopolis', '45', '2', '30.0876,31.3223'),
(13, 'Maadi', '33', '4', '29.9602,31.2568'),
(14, 'Zamalek', '18', '6', '30.0626,31.2230'),
(15, 'Downtown Cairo', '52', '1', '30.0444,31.2357'),
(16, 'New Cairo', '71', '9', '30.0229,31.4913'),
(17, '6th October', '28', '3', '29.9553,30.9378'),
(18, 'Mohandessin', '64', '5', '30.0489,31.2001'),
(19, 'Nasr City', '39', '8', '30.0626,31.3458'),
(20, 'Heliopolis', '82', '2', '30.0876,31.3223');

-- ============================================
-- RESTAURANTS & BRANCHES (5+ branches)
-- ============================================
INSERT INTO Restaurant (name, cuisine_type) VALUES
('Shawarma Palace', 'Middle Eastern'),
('Pizza Roma', 'Italian'),
('Sushi Master', 'Japanese'),
('Burger Hub', 'American'),
('Koshari Kingdom', 'Egyptian');

-- Branches with operating hours
INSERT INTO Branch (restaurant_id, location, open_time, close_time) VALUES
(1, 'Nasr City Branch', '2024-01-01 10:00:00', '2024-01-01 23:59:00'),
(1, 'Maadi Branch', '2024-01-01 11:00:00', '2024-01-01 23:00:00'),
(2, 'Zamalek Branch', '2024-01-01 12:00:00', '2024-01-02 00:30:00'),
(3, 'Heliopolis Branch', '2024-01-01 13:00:00', '2024-01-01 23:00:00'),
(4, 'New Cairo Branch', '2024-01-01 10:00:00', '2024-01-02 01:00:00'),
(5, 'Downtown Branch', '2024-01-01 09:00:00', '2024-01-01 22:00:00'),
(2, 'New Cairo Branch', '2024-01-01 11:00:00', '2024-01-02 00:00:00');

-- ============================================
-- DELIVERY ZONES (per branch)
-- ============================================
INSERT INTO Delivery_Zone (branch_id, zone_name, delivery_fee) VALUES
(1, 'Nasr City Area', 15.00),
(1, 'Heliopolis Area', 20.00),
(1, 'New Cairo Area', 30.00),
(2, 'Maadi Central', 10.00),
(2, 'Maadi Extension', 18.00),
(3, 'Zamalek', 12.00),
(3, 'Mohandessin', 15.00),
(3, 'Downtown', 20.00),
(4, 'Heliopolis Central', 10.00),
(4, 'Nasr City', 18.00),
(5, 'New Cairo Central', 15.00),
(5, 'Rehab City', 25.00),
(6, 'Downtown Central', 8.00),
(6, 'Garden City', 12.00),
(7, 'New Cairo West', 12.00),
(7, 'New Cairo East', 18.00);

-- ============================================
-- DELIVERY PRICING RULES (Ramadan surge pricing)
-- Suhour: 2 AM - 3 AM
-- Suhour Rush: 3 AM - 4:30 AM
-- Iftar: 5 PM - 6 PM
-- Iftar Rush: 6 PM - 7 PM
-- ============================================
INSERT INTO Delivery_Pricing_Rule (branch_id, start_time, end_time, multiplier, description) VALUES
-- Branch 1 rules
(1, '02:00:00', '03:00:00', 1.30, 'Suhour'),
(1, '03:00:00', '04:30:00', 1.60, 'Suhour Rush'),
(1, '17:00:00', '18:00:00', 1.40, 'Iftar'),
(1, '18:00:00', '19:00:00', 1.80, 'Iftar Rush'),
-- Branch 2 rules
(2, '02:00:00', '03:00:00', 1.25, 'Suhour'),
(2, '03:00:00', '04:30:00', 1.55, 'Suhour Rush'),
(2, '17:00:00', '18:00:00', 1.35, 'Iftar'),
(2, '18:00:00', '19:00:00', 1.75, 'Iftar Rush'),
-- Branch 3 rules
(3, '02:00:00', '03:00:00', 1.35, 'Suhour'),
(3, '03:00:00', '04:30:00', 1.65, 'Suhour Rush'),
(3, '17:00:00', '18:00:00', 1.45, 'Iftar'),
(3, '18:00:00', '19:00:00', 1.85, 'Iftar Rush'),
-- Branch 4 rules
(4, '02:00:00', '03:00:00', 1.30, 'Suhour'),
(4, '03:00:00', '04:30:00', 1.60, 'Suhour Rush'),
(4, '17:00:00', '18:00:00', 1.40, 'Iftar'),
(4, '18:00:00', '19:00:00', 1.70, 'Iftar Rush'),
-- Branch 5 rules
(5, '02:00:00', '03:00:00', 1.25, 'Suhour'),
(5, '03:00:00', '04:30:00', 1.50, 'Suhour Rush'),
(5, '17:00:00', '18:00:00', 1.35, 'Iftar'),
(5, '18:00:00', '19:00:00', 1.65, 'Iftar Rush'),
-- Branch 6 rules
(6, '02:00:00', '03:00:00', 1.30, 'Suhour'),
(6, '03:00:00', '04:30:00', 1.55, 'Suhour Rush'),
(6, '17:00:00', '18:00:00', 1.40, 'Iftar'),
(6, '18:00:00', '19:00:00', 1.75, 'Iftar Rush'),
-- Branch 7 rules
(7, '02:00:00', '03:00:00', 1.35, 'Suhour'),
(7, '03:00:00', '04:30:00', 1.60, 'Suhour Rush'),
(7, '17:00:00', '18:00:00', 1.45, 'Iftar'),
(7, '18:00:00', '19:00:00', 1.80, 'Iftar Rush');

-- ============================================
-- CAPTAINS (10 captains)
-- ============================================
INSERT INTO Captain (name, phone, vehicle_type, vehicle_plate, status) VALUES
('Mahmoud Saeed', '01501234567', 'Motorcycle', 'ABC 1234', 'available'),
('Khaled Hosni', '01502345678', 'Motorcycle', 'DEF 5678', 'busy'),
('Ibrahim Taha', '01503456789', 'Car', 'GHI 9012', 'available'),
('Sayed Abdel', '01504567890', 'Motorcycle', 'JKL 3456', 'available'),
('Gamal Zaki', '01505678901', 'Scooter', 'MNO 7890', 'busy'),
('Wael Fathy', '01506789012', 'Motorcycle', 'PQR 1234', 'available'),
('Ashraf Nour', '01507890123', 'Car', 'STU 5678', 'inactive'),
('Medhat Shawky', '01508901234', 'Motorcycle', 'VWX 9012', 'available'),
('Tamer Gaber', '01509012345', 'Scooter', 'YZA 3456', 'busy'),
('Hossam Fouad', '01510123456', 'Motorcycle', 'BCD 7890', 'available');

-- ============================================
-- ITEMS WITH DEEP MENUS (Branches 1 & 3 have modifiers)
-- ============================================

-- Branch 1 (Shawarma Palace - Nasr City) - DEEP MENU WITH MODIFIERS
INSERT INTO Item (branch_id, category, name, price, is_available) VALUES
(1, 'Sandwiches', 'Chicken Shawarma', 45.00, true),
(1, 'Sandwiches', 'Beef Shawarma', 55.00, true),
(1, 'Sandwiches', 'Mixed Shawarma', 60.00, true),
(1, 'Platters', 'Chicken Platter', 85.00, true),
(1, 'Platters', 'Beef Platter', 95.00, true),
(1, 'Sides', 'French Fries', 20.00, true),
(1, 'Sides', 'Hummus', 25.00, true),
(1, 'Drinks', 'Soft Drink', 10.00, true),
(1, 'Drinks', 'Fresh Juice', 25.00, true);

-- Modifier Groups for Shawarma items
INSERT INTO Modifier_Group (item_id, name, min_select, max_select) VALUES
(1, 'Bread Type', 1, 1),
(1, 'Sauces', 0, 3),
(1, 'Add-ons', 0, 5),
(2, 'Bread Type', 1, 1),
(2, 'Sauces', 0, 3),
(3, 'Bread Type', 1, 1),
(3, 'Sauces', 0, 3),
(4, 'Rice Type', 1, 1),
(4, 'Sides', 1, 2),
(5, 'Rice Type', 1, 1);

-- Modifier Options
INSERT INTO Modifier_Option (group_id, name, price_change) VALUES
-- Bread Type (Group 1, 4, 6)
(1, 'White Bread', 0.00),
(1, 'Whole Wheat', 3.00),
(1, 'Saj Bread', 5.00),
(4, 'White Bread', 0.00),
(4, 'Whole Wheat', 3.00),
(6, 'White Bread', 0.00),
(6, 'Saj Bread', 5.00),
-- Sauces (Group 2, 5, 7)
(2, 'Tahini', 0.00),
(2, 'Garlic Sauce', 2.00),
(2, 'Hot Sauce', 0.00),
(2, 'Yogurt Sauce', 3.00),
(5, 'Tahini', 0.00),
(5, 'Garlic Sauce', 2.00),
(5, 'Hot Sauce', 0.00),
(7, 'Tahini', 0.00),
(7, 'Garlic Sauce', 2.00),
-- Add-ons (Group 3)
(3, 'Extra Chicken', 15.00),
(3, 'Extra Veggies', 5.00),
(3, 'Cheese', 8.00),
(3, 'Pickles', 3.00),
(3, 'Lettuce & Tomato', 4.00),
-- Rice Type (Group 8, 10)
(8, 'White Rice', 0.00),
(8, 'Yellow Rice', 5.00),
(8, 'Vermicelli Rice', 7.00),
(10, 'White Rice', 0.00),
(10, 'Yellow Rice', 5.00),
-- Sides (Group 9)
(9, 'Salad', 0.00),
(9, 'Hummus', 10.00),
(9, 'Grilled Vegetables', 12.00);

-- Branch 2 (Shawarma Palace - Maadi) - Simple menu
INSERT INTO Item (branch_id, category, name, price, is_available) VALUES
(2, 'Sandwiches', 'Chicken Shawarma', 45.00, true),
(2, 'Sandwiches', 'Beef Shawarma', 55.00, true),
(2, 'Platters', 'Mixed Grill', 120.00, true),
(2, 'Sides', 'Fries', 20.00, true),
(2, 'Drinks', 'Soda', 10.00, true);

-- Branch 3 (Pizza Roma - Zamalek) - DEEP MENU WITH MODIFIERS
INSERT INTO Item (branch_id, category, name, price, is_available) VALUES
(3, 'Pizza', 'Margherita Pizza', 80.00, true),
(3, 'Pizza', 'Pepperoni Pizza', 95.00, true),
(3, 'Pizza', 'Vegetarian Pizza', 85.00, true),
(3, 'Pasta', 'Spaghetti Bolognese', 70.00, true),
(3, 'Pasta', 'Fettuccine Alfredo', 75.00, true),
(3, 'Appetizers', 'Garlic Bread', 30.00, true),
(3, 'Desserts', 'Tiramisu', 45.00, true),
(3, 'Drinks', 'Soft Drink', 12.00, true);

-- Modifier Groups for Pizza
INSERT INTO Modifier_Group (item_id, name, min_select, max_select) VALUES
(15, 'Size', 1, 1),
(15, 'Crust Type', 1, 1),
(15, 'Extra Toppings', 0, 6),
(16, 'Size', 1, 1),
(16, 'Crust Type', 1, 1),
(16, 'Extra Toppings', 0, 6),
(17, 'Size', 1, 1),
(17, 'Crust Type', 1, 1);

-- Modifier Options for Pizza
INSERT INTO Modifier_Option (group_id, name, price_change) VALUES
-- Size (Groups 11, 14, 17)
(11, 'Small (8 inch)', -15.00),
(11, 'Medium (12 inch)', 0.00),
(11, 'Large (16 inch)', 20.00),
(14, 'Small (8 inch)', -15.00),
(14, 'Medium (12 inch)', 0.00),
(14, 'Large (16 inch)', 20.00),
(17, 'Small', -15.00),
(17, 'Medium', 0.00),
(17, 'Large', 20.00),
-- Crust Type (Groups 12, 15, 18)
(12, 'Thin Crust', 0.00),
(12, 'Thick Crust', 10.00),
(12, 'Stuffed Crust', 25.00),
(15, 'Thin Crust', 0.00),
(15, 'Thick Crust', 10.00),
(15, 'Stuffed Crust', 25.00),
(18, 'Thin Crust', 0.00),
(18, 'Thick Crust', 10.00),
-- Extra Toppings (Groups 13, 16)
(13, 'Extra Cheese', 15.00),
(13, 'Mushrooms', 12.00),
(13, 'Olives', 10.00),
(13, 'Bell Peppers', 10.00),
(13, 'Onions', 8.00),
(13, 'Jalapeños', 10.00),
(16, 'Extra Pepperoni', 20.00),
(16, 'Extra Cheese', 15.00),
(16, 'Mushrooms', 12.00),
(16, 'Olives', 10.00),
(16, 'Bell Peppers', 10.00),
(16, 'Italian Sausage', 18.00);

-- Branch 4 (Sushi Master) - Simple menu
INSERT INTO Item (branch_id, category, name, price, is_available) VALUES
(4, 'Rolls', 'California Roll', 65.00, true),
(4, 'Rolls', 'Salmon Roll', 85.00, true),
(4, 'Rolls', 'Spicy Tuna Roll', 90.00, true),
(4, 'Nigiri', 'Salmon Nigiri', 45.00, true),
(4, 'Drinks', 'Green Tea', 15.00, true);

-- Branch 5 (Burger Hub) - Simple menu
INSERT INTO Item (branch_id, category, name, price, is_available) VALUES
(5, 'Burgers', 'Classic Burger', 60.00, true),
(5, 'Burgers', 'Cheese Burger', 70.00, true),
(5, 'Burgers', 'Bacon Burger', 85.00, true),
(5, 'Sides', 'Onion Rings', 25.00, true),
(5, 'Drinks', 'Milkshake', 35.00, true);

-- Branch 6 (Koshari Kingdom) - Simple menu
INSERT INTO Item (branch_id, category, name, price, is_available) VALUES
(6, 'Main', 'Small Koshari', 25.00, true),
(6, 'Main', 'Medium Koshari', 35.00, true),
(6, 'Main', 'Large Koshari', 45.00, true),
(6, 'Sides', 'Extra Dakka', 5.00, true),
(6, 'Drinks', 'Lemonade', 10.00, true);

-- Branch 7 (Pizza Roma - New Cairo) - Simple menu
INSERT INTO Item (branch_id, category, name, price, is_available) VALUES
(7, 'Pizza', 'Margherita', 80.00, true),
(7, 'Pizza', 'Pepperoni', 95.00, true),
(7, 'Pasta', 'Carbonara', 70.00, true),
(7, 'Drinks', 'Cola', 12.00, true);

-- ============================================
-- PROMO CODES
-- ============================================
INSERT INTO Promo_Code (code, discount_type, discount_value, expiration_date, usage_limit_per_user, usage_limit_global) VALUES
('WELCOME20', 'percentage', 20.00, '2024-12-31', 1, 100),
('SAVE50', 'fixed', 50.00, '2024-12-31', 2, 50),
('FREESHIP', 'percentage', 100.00, '2024-06-30', 1, 200),
('SUMMER25', 'percentage', 25.00, '2024-08-31', 3, 150),
('FLAT30', 'fixed', 30.00, '2024-12-31', 2, 100);

-- ============================================
-- ORDERS (50+ historical orders)
-- Mix of: ASAP (null scheduled_time), Scheduled, Iftar pre-orders, Charity donations
-- ============================================

-- Orders from January 2024 (older orders)
INSERT INTO `Order` (customer_id, branch_id, captain_id, delivery_zone_id, ord_street, ord_building, ord_floor, ord_gps_coord, is_donation, status, scheduled_delivery_time, ordered_at, total_price) VALUES
-- ASAP Orders (null scheduled_delivery_time)
(1, 1, 1, 1, 'Salah Salem St', '15', '3', '30.0444,31.2357', false, 'delivered', NULL, '2024-01-15 12:30:00', 125.50),
(2, 3, 2, 6, 'Tahrir Square', '8', '2', '30.0444,31.2357', false, 'delivered', NULL, '2024-01-16 13:45:00', 180.00),
(3, 5, 3, 11, 'Zamalek St', '23', '5', '30.0626,31.2230', false, 'delivered', NULL, '2024-01-17 14:20:00', 95.75),
(4, 2, 4, 4, 'Heliopolis', '67', '1', '30.0876,31.3223', false, 'delivered', NULL, '2024-01-18 18:30:00', 145.00),
(5, 4, 5, 9, 'Maadi Corniche', '12', '4', '29.9602,31.2568', false, 'delivered', NULL, '2024-01-19 19:15:00', 210.50),
(6, 1, 6, 2, 'Mohandessin', '88', '6', '30.0489,31.2001', false, 'delivered', NULL, '2024-01-20 12:00:00', 165.00),
(7, 3, 8, 7, '6th October City', '34', '2', '29.9553,30.9378', false, 'delivered', NULL, '2024-01-21 20:30:00', 195.25),
(8, 6, 1, 13, 'New Cairo', '56', '8', '30.0229,31.4913', false, 'delivered', NULL, '2024-01-22 11:45:00', 88.00),
(9, 2, 3, 5, 'Dokki', '19', '3', '30.0382,31.2121', false, 'delivered', NULL, '2024-01-23 13:20:00', 132.50),
(10, 5, 4, 12, 'Giza Square', '77', '5', '30.0131,31.2089', false, 'delivered', NULL, '2024-01-24 19:00:00', 156.00),

-- Scheduled Orders (with scheduled_delivery_time)
(11, 1, 6, 1, 'Nasr City', '91', '7', '30.0626,31.3458', false, 'delivered', '2024-01-25 20:00:00', '2024-01-25 15:30:00', 175.00),
(12, 3, 8, 6, 'Heliopolis', '45', '2', '30.0876,31.3223', false, 'delivered', '2024-01-26 18:30:00', '2024-01-26 14:00:00', 220.50),
(13, 4, 1, 9, 'Maadi', '33', '4', '29.9602,31.2568', false, 'delivered', '2024-01-27 19:00:00', '2024-01-27 16:20:00', 185.00),
(14, 2, 3, 4, 'Zamalek', '18', '6', '30.0626,31.2230', false, 'delivered', '2024-01-28 13:00:00', '2024-01-28 10:45:00', 112.75),
(15, 6, 4, 14, 'Downtown Cairo', '52', '1', '30.0444,31.2357', false, 'delivered', '2024-01-29 21:00:00', '2024-01-29 17:30:00', 95.00),

-- Iftar Pre-orders (Ramadan orders - March 2024, scheduled for Iftar time)
(16, 1, 6, 3, 'New Cairo', '71', '9', '30.0229,31.4913', false, 'delivered', '2024-03-15 18:00:00', '2024-03-15 10:00:00', 285.00),
(17, 3, 8, 8, '6th October', '28', '3', '29.9553,30.9378', false, 'delivered', '2024-03-16 18:05:00', '2024-03-16 09:30:00', 340.50),
(18, 5, 1, 11, 'Mohandessin', '64', '5', '30.0489,31.2001', false, 'delivered', '2024-03-17 18:10:00', '2024-03-17 11:15:00', 195.00),
(19, 2, 3, 4, 'Nasr City', '39', '8', '30.0626,31.3458', false, 'delivered', '2024-03-18 18:00:00', '2024-03-18 12:00:00', 225.75),
(20, 4, 4, 10, 'Heliopolis', '82', '2', '30.0876,31.3223', false, 'delivered', '2024-03-19 18:15:00', '2024-03-19 13:30:00', 267.50),
(1, 1, 6, 1, 'Salah Salem St', '15', '3', '30.0444,31.2357', false, 'delivered', '2024-03-20 18:00:00', '2024-03-20 10:45:00', 310.00),
(2, 6, 8, 13, 'Tahrir Square', '8', '2', '30.0444,31.2357', false, 'delivered', '2024-03-21 18:05:00', '2024-03-21 11:20:00', 125.00),

-- Charity Donation Orders (is_donation = true)
(3, 1, 1, 1, 'Charity Center', 'Building A', 'Ground', '30.0444,31.2357', true, 'delivered', NULL, '2024-02-01 16:00:00', 450.00),
(4, 3, 3, 6, 'Orphanage', 'Block 5', '1', '30.0444,31.2357', true, 'delivered', NULL, '2024-02-05 17:30:00', 520.00),
(5, 2, 4, 4, 'Food Bank', '12', 'Ground', '29.9602,31.2568', true, 'delivered', NULL, '2024-02-10 15:45:00', 380.00),
(6, 5, 6, 11, 'Community Center', '8', '1', '30.0489,31.2001', true, 'delivered', NULL, '2024-02-15 18:20:00', 290.00),
(7, 4, 8, 9, 'Shelter House', '23', 'Ground', '29.9553,30.9378', true, 'delivered', NULL, '2024-02-20 14:00:00', 410.00),

-- More ASAP Orders (recent - February 2024)
(8, 1, 1, 2, 'New Cairo', '56', '8', '30.0229,31.4913', false, 'delivered', NULL, '2024-02-22 12:30:00', 142.00),
(9, 3, 3, 7, 'Dokki', '19', '3', '30.0382,31.2121', false, 'delivered', NULL, '2024-02-23 13:15:00', 198.50),
(10, 6, 4, 14, 'Giza Square', '77', '5', '30.0131,31.2089', false, 'delivered', NULL, '2024-02-24 19:45:00', 87.00),
(11, 2, 6, 5, 'Nasr City', '91', '7', '30.0626,31.3458', false, 'delivered', NULL, '2024-02-25 20:10:00', 155.75),
(12, 5, 8, 12, 'Heliopolis', '45', '2', '30.0876,31.3223', false, 'delivered', NULL, '2024-02-26 11:20:00', 178.00),
(13, 4, 1, 10, 'Maadi', '33', '4', '29.9602,31.2568', false, 'delivered', NULL, '2024-02-27 18:50:00', 205.25),
(14, 1, 3, 3, 'Zamalek', '18', '6', '30.0626,31.2230', false, 'delivered', NULL, '2024-02-28 12:40:00', 167.50),
(15, 3, 4, 6, 'Downtown Cairo', '52', '1', '30.0444,31.2357', false, 'delivered', NULL, '2024-02-29 21:15:00', 232.00),

-- More scheduled orders (March 2024)
(16, 2, 6, 4, 'New Cairo', '71', '9', '30.0229,31.4913', false, 'delivered', '2024-03-01 19:30:00', '2024-03-01 15:00:00', 189.00),
(17, 5, 8, 11, '6th October', '28', '3', '29.9553,30.9378', false, 'delivered', '2024-03-02 20:00:00', '2024-03-02 16:30:00', 143.50),
(18, 6, 1, 13, 'Mohandessin', '64', '5', '30.0489,31.2001', false, 'delivered', '2024-03-03 13:00:00', '2024-03-03 10:00:00', 98.00),
(19, 4, 3, 9, 'Nasr City', '39', '8', '30.0626,31.3458', false, 'delivered', '2024-03-04 18:30:00', '2024-03-04 14:45:00', 223.75),
(20, 1, 4, 1, 'Heliopolis', '82', '2', '30.0876,31.3223', false, 'delivered', '2024-03-05 19:00:00', '2024-03-05 15:20:00', 201.00),

-- Additional ASAP orders
(1, 3, 6, 8, 'Salah Salem St', '15', '3', '30.0444,31.2357', false, 'delivered', NULL, '2024-03-06 12:00:00', 215.50),
(2, 2, 8, 5, 'Nasr City', '42', '7', '30.0626,31.3458', false, 'delivered', NULL, '2024-03-07 13:30:00', 134.00),
(3, 5, 1, 12, 'Zamalek St', '23', '5', '30.0626,31.2230', false, 'delivered', NULL, '2024-03-08 19:20:00', 172.75),
(4, 6, 3, 14, 'Heliopolis', '67', '1', '30.0876,31.3223', false, 'delivered', NULL, '2024-03-09 20:45:00', 92.50),
(5, 4, 4, 10, 'Maadi Corniche', '12', '4', '29.9602,31.2568', false, 'delivered', NULL, '2024-03-10 11:15:00', 188.00),
(6, 1, 6, 2, 'Mohandessin', '88', '6', '30.0489,31.2001', false, 'delivered', NULL, '2024-03-11 18:00:00', 159.25),
(7, 3, 8, 7, '6th October City', '34', '2', '29.9553,30.9378', false, 'delivered', NULL, '2024-03-12 21:00:00', 245.00),
(8, 2, 1, 4, 'New Cairo', '56', '8', '30.0229,31.4913', false, 'delivered', NULL, '2024-03-13 12:50:00', 127.50),
(9, 5, 3, 11, 'Dokki', '19', '3', '30.0382,31.2121', false, 'delivered', NULL, '2024-03-14 14:10:00', 166.00),

-- Recent orders (some still in progress)
(10, 1, 4, 1, 'Giza Square', '77', '5', '30.0131,31.2089', false, 'delivered', NULL, '2024-03-22 19:30:00', 193.75),
(11, 3, 6, 6, 'Nasr City', '91', '7', '30.0626,31.3458', false, 'completed', NULL, '2024-03-23 20:15:00', 227.50),
(12, 6, 8, 13, 'Heliopolis', '45', '2', '30.0876,31.3223', false, 'out_for_delivery', NULL, '2024-03-24 18:45:00', 103.00),
(13, 2, 1, 5, 'Maadi', '33', '4', '29.9602,31.2568', false, 'preparing', NULL, '2024-03-24 19:00:00', 149.50),
(14, 4, 3, 9, 'Zamalek', '18', '6', '30.0626,31.2230', false, 'accepted', NULL, '2024-03-24 19:15:00', 212.00);

-- ============================================
-- ORDER ITEMS (with modifiers for deep menu branches)
-- ============================================

-- Order 1: Chicken Shawarma with modifiers
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(1, 1, 2), -- 2x Chicken Shawarma
(1, 6, 1), -- 1x French Fries
(1, 8, 2); -- 2x Soft Drink

-- Order 1 Modifiers
INSERT INTO Order_Item_Modifier (order_item_id, modifier_option_id) VALUES
(1, 2), -- Whole Wheat, Tahini, Garlic Sauce
(1, 17); -- Extra Chicken

-- Order 2: Pizza with modifiers
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(2, 15, 1), -- Margherita Pizza
(2, 21, 1); -- Garlic Bread

-- Order 2 Modifiers
INSERT INTO Order_Item_Modifier (order_item_id, modifier_option_id) VALUES
(5, 39), -- Large size
(5, 43), -- Stuffed Crust
(5, 45), -- Extra Cheese
(5, 46); -- Mushrooms

-- Order 3: Burger Hub
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(3, 29, 1), -- Cheese Burger
(3, 31, 1), -- Onion Rings
(3, 32, 1); -- Milkshake

-- Order 4: Shawarma Palace Maadi
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(4, 10, 2), -- Chicken Shawarma
(4, 12, 1), -- Mixed Grill
(4, 13, 1); -- Fries

-- Order 5: Sushi Master
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(5, 23, 2), -- California Roll
(5, 24, 1), -- Salmon Roll
(5, 25, 1), -- Spicy Tuna Roll
(5, 27, 2); -- Green Tea

-- Order 6: Shawarma with modifiers
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(6, 2, 2), -- Beef Shawarma
(6, 7, 1), -- Hummus
(6, 9, 2); -- Fresh Juice

-- Order 6 Modifiers
INSERT INTO Order_Item_Modifier (order_item_id, modifier_option_id) VALUES
(13, 5), -- White Bread
(13, 11), -- Tahini
(13, 12); -- Garlic Sauce

-- Order 7: Pizza with modifiers
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(7, 16, 2), -- Pepperoni Pizza
(7, 22, 1); -- Tiramisu

-- Order 7 Modifiers
INSERT INTO Order_Item_Modifier (order_item_id, modifier_option_id) VALUES
(15, 41), -- Medium size
(15, 44), -- Thick Crust
(15, 50), -- Extra Pepperoni
(15, 51); -- Extra Cheese

-- Order 8: Koshari Kingdom
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(8, 34, 1), -- Medium Koshari
(8, 35, 1), -- Large Koshari
(8, 36, 2), -- Extra Dakka
(8, 37, 2); -- Lemonade

-- Order 9: Simple orders for remaining orders
INSERT INTO Order_Items (order_id, item_id, quantity) VALUES
(9, 10, 3), (9, 14, 2),
(10, 29, 2), (10, 32, 2),
(11, 1, 2), (11, 4, 1),
(12, 15, 1), (12, 19, 1),
(13, 24, 2), (13, 26, 3),
(14, 11, 2), (14, 13, 1),
(15, 33, 3), (15, 37, 3),
(16, 3, 3), (16, 4, 2), (16, 6, 2),
(17, 16, 3), (17, 20, 2), (17, 22, 3),
(18, 28, 3), (18, 31, 2),
(19, 10, 4), (19, 12, 1),
(20, 23, 2), (20, 25, 2), (20, 27, 4),
(21, 1, 5), (21, 5, 2),
(22, 34, 4), (22, 36, 4),
(23, 2, 6), (23, 7, 3),
(24, 15, 4), (24, 21, 2),
(25, 30, 3), (25, 32, 3),
(26, 1, 3), (26, 8, 3),
(27, 16, 2), (27, 19, 1),
(28, 33, 2), (28, 37, 2),
(29, 10, 2), (29, 14, 2),
(30, 24, 3), (30, 26, 2),
(31, 23, 2), (31, 27, 2),
(32, 1, 2), (32, 6, 1),
(33, 15, 2), (33, 22, 2),
(34, 34, 1), (34, 35, 1),
(35, 29, 2), (35, 31, 1),
(36, 2, 2), (36, 9, 2),
(37, 38, 2), (37, 40, 2),
(38, 28, 1), (38, 32, 1),
(39, 24, 2), (39, 25, 1),
(40, 1, 3), (40, 4, 1),
(41, 16, 2), (41, 20, 1),
(42, 11, 3), (42, 13, 2),
(43, 30, 2), (43, 32, 2),
(44, 23, 1), (44, 24, 1),
(45, 1, 2), (45, 8, 2),
(46, 15, 1), (46, 21, 1),
(47, 10, 2), (47, 14, 1),
(48, 34, 2), (48, 37, 2),
(49, 1, 1), (49, 6, 1),
(50, 15, 2), (50, 22, 1),
(51, 34, 2), (51, 37, 2),
(52, 11, 1), (52, 14, 1),
(53, 24, 1), (53, 27, 2),
(54, 1, 1), (54, 8, 1);

-- ============================================
-- PAYMENTS
-- ============================================
INSERT INTO Payment (order_id, payment_type, status, amount) VALUES
(1, 'card', 'completed', 125.50),
(2, 'wallet', 'completed', 180.00),
(3, 'cash', 'completed', 95.75),
(4, 'card', 'completed', 145.00),
(5, 'wallet', 'completed', 210.50),
(6, 'cash', 'completed', 165.00),
(7, 'card', 'completed', 195.25),
(8, 'wallet', 'completed', 88.00),
(9, 'cash', 'completed', 132.50),
(10, 'card', 'completed', 156.00),
(11, 'wallet', 'completed', 175.00),
(12, 'card', 'completed', 220.50),
(13, 'cash', 'completed', 185.00),
(14, 'wallet', 'completed', 112.75),
(15, 'cash', 'completed', 95.00),
(16, 'card', 'completed', 285.00),
(17, 'wallet', 'completed', 340.50),
(18, 'cash', 'completed', 195.00),
(19, 'card', 'completed', 225.75),
(20, 'wallet', 'completed', 267.50),
(21, 'card', 'completed', 310.00),
(22, 'wallet', 'completed', 125.00),
(23, 'cash', 'completed', 450.00),
(24, 'card', 'completed', 520.00),
(25, 'wallet', 'completed', 380.00),
(26, 'cash', 'completed', 290.00),
(27, 'card', 'completed', 410.00),
(28, 'wallet', 'completed', 142.00),
(29, 'cash', 'completed', 198.50),
(30, 'card', 'completed', 87.00),
(31, 'wallet', 'completed', 155.75),
(32, 'cash', 'completed', 178.00),
(33, 'card', 'completed', 205.25),
(34, 'wallet', 'completed', 167.50),
(35, 'cash', 'completed', 232.00),
(36, 'card', 'completed', 189.00),
(37, 'wallet', 'completed', 143.50),
(38, 'cash', 'completed', 98.00),
(39, 'card', 'completed', 223.75),
(40, 'wallet', 'completed', 201.00),
(41, 'cash', 'completed', 215.50),
(42, 'card', 'completed', 134.00),
(43, 'wallet', 'completed', 172.75),
(44, 'cash', 'completed', 92.50),
(45, 'card', 'completed', 188.00),
(46, 'wallet', 'completed', 159.25),
(47, 'cash', 'completed', 245.00),
(48, 'card', 'completed', 127.50),
(49, 'wallet', 'completed', 166.00),
(50, 'cash', 'completed', 193.75),
(51, 'card', 'completed', 227.50),
(52, 'wallet', 'pending', 103.00),
(53, 'cash', 'pending', 149.50),
(54, 'card', 'pending', 212.00);

-- ============================================
-- WALLET LEDGER (20 customers with histories)
-- ============================================

-- Customer 1: Multiple transactions
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(1, NULL, 'credit', 500.00, '2024-01-10 10:00:00'),
(1, 1, 'debit', 125.50, '2024-01-15 12:30:00'),
(1, 21, 'debit', 310.00, '2024-03-20 18:00:00'),
(1, NULL, 'credit', 300.00, '2024-03-21 09:00:00');

-- Customer 2
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(2, NULL, 'credit', 400.00, '2024-01-12 11:00:00'),
(2, 2, 'debit', 180.00, '2024-01-16 13:45:00'),
(2, 42, 'debit', 134.00, '2024-03-07 13:30:00');

-- Customer 3
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(3, NULL, 'credit', 600.00, '2024-01-14 14:00:00'),
(3, 23, 'debit', 450.00, '2024-02-01 16:00:00'),
(3, NULL, 'credit', 500.00, '2024-02-10 10:00:00');

-- Customer 4
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(4, NULL, 'credit', 350.00, '2024-01-16 15:00:00'),
(4, 24, 'debit', 520.00, '2024-02-05 17:30:00'),
(4, NULL, 'credit', 700.00, '2024-02-06 10:00:00');

-- Customer 5
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(5, NULL, 'credit', 450.00, '2024-01-18 10:00:00'),
(5, 5, 'debit', 210.50, '2024-01-19 19:15:00'),
(5, 20, 'debit', 267.50, '2024-03-19 18:15:00');

-- Customer 6
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(6, NULL, 'credit', 300.00, '2024-01-20 09:00:00'),
(6, 25, 'debit', 380.00, '2024-02-10 15:45:00'),
(6, NULL, 'credit', 400.00, '2024-02-15 10:00:00');

-- Customer 7
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(7, NULL, 'credit', 550.00, '2024-01-22 11:00:00'),
(7, 26, 'debit', 290.00, '2024-02-15 18:20:00');

-- Customer 8
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(8, NULL, 'credit', 200.00, '2024-01-24 12:00:00'),
(8, 8, 'debit', 88.00, '2024-01-22 11:45:00'),
(8, 28, 'debit', 142.00, '2024-02-22 12:30:00');

-- Customer 9
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(9, NULL, 'credit', 380.00, '2024-01-26 10:00:00'),
(9, NULL, 'credit', 200.00, '2024-02-20 09:00:00');

-- Customer 10
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(10, NULL, 'credit', 500.00, '2024-01-28 11:00:00'),
(10, 10, 'debit', 156.00, '2024-01-24 19:00:00');

-- Customer 11
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(11, NULL, 'credit', 450.00, '2024-01-30 10:00:00'),
(11, 11, 'debit', 175.00, '2024-01-25 20:00:00'),
(11, 31, 'debit', 155.75, '2024-02-25 20:10:00');

-- Customer 12
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(12, NULL, 'credit', 600.00, '2024-02-01 09:00:00'),
(12, 12, 'debit', 220.50, '2024-01-26 18:30:00'),
(12, NULL, 'credit', 300.00, '2024-02-28 10:00:00');

-- Customer 13
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(13, NULL, 'credit', 350.00, '2024-02-05 10:00:00'),
(13, NULL, 'credit', 400.00, '2024-03-01 09:00:00');

-- Customer 14
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(14, NULL, 'credit', 280.00, '2024-02-10 11:00:00'),
(14, 14, 'debit', 112.75, '2024-01-28 13:00:00'),
(14, 34, 'debit', 167.50, '2024-02-28 21:15:00');

-- Customer 15
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(15, NULL, 'credit', 400.00, '2024-02-15 10:00:00'),
(15, NULL, 'credit', 300.00, '2024-03-10 09:00:00');

-- Customer 16
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(16, NULL, 'credit', 550.00, '2024-02-20 11:00:00'),
(16, NULL, 'credit', 200.00, '2024-03-15 10:00:00');

-- Customer 17
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(17, NULL, 'credit', 700.00, '2024-02-25 12:00:00'),
(17, 17, 'debit', 340.50, '2024-03-16 18:05:00'),
(17, 37, 'debit', 143.50, '2024-03-02 20:00:00');

-- Customer 18
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(18, NULL, 'credit', 350.00, '2024-03-01 10:00:00'),
(18, NULL, 'credit', 250.00, '2024-03-20 09:00:00');

-- Customer 19
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(19, NULL, 'credit', 450.00, '2024-03-05 11:00:00'),
(19, NULL, 'credit', 300.00, '2024-03-21 10:00:00');

-- Customer 20
INSERT INTO Wallet_Ledger (customer_id, ref_order_id, transaction_type, amount, created_at) VALUES
(20, NULL, 'credit', 500.00, '2024-03-10 10:00:00'),
(20, 20, 'debit', 267.50, '2024-03-19 18:15:00'),
(20, 40, 'debit', 201.00, '2024-03-05 19:00:00');

-- ============================================
-- PROMO USAGE
-- ============================================
INSERT INTO Promo_Usage (promo_id, customer_id, order_id) VALUES
(1, 1, 1),
(2, 2, 2),
(1, 3, 3),
(3, 4, 4),
(2, 5, 5),
(1, 6, 6),
(4, 7, 7),
(2, 8, 8),
(1, 9, 9),
(5, 10, 10);

-- ============================================
-- CAPTAIN EARNINGS
-- ============================================
INSERT INTO Captain_Earning (captain_id, order_id, base_pay, bonus) VALUES
(1, 1, 25.00, 5.00),
(2, 2, 30.00, 8.00),
(3, 3, 22.00, 3.00),
(4, 4, 28.00, 6.00),
(5, 5, 35.00, 10.00),
(6, 6, 27.00, 7.00),
(8, 7, 32.00, 9.00),
(1, 8, 20.00, 2.00),
(3, 9, 26.00, 5.00),
(4, 10, 29.00, 7.00),
(6, 11, 31.00, 8.00),
(8, 12, 34.00, 10.00),
(1, 13, 30.00, 8.00),
(3, 14, 24.00, 4.00),
(4, 15, 21.00, 3.00),
(6, 16, 40.00, 15.00),
(8, 17, 45.00, 18.00),
(1, 18, 32.00, 9.00),
(3, 19, 36.00, 12.00),
(4, 20, 38.00, 14.00),
(6, 21, 42.00, 16.00),
(8, 22, 28.00, 6.00),
(1, 23, 50.00, 20.00),
(3, 24, 55.00, 22.00),
(4, 25, 48.00, 18.00),
(6, 26, 40.00, 15.00),
(8, 27, 52.00, 21.00),
(1, 28, 26.00, 5.00),
(3, 29, 33.00, 10.00),
(4, 30, 22.00, 3.00),
(6, 31, 29.00, 7.00),
(8, 32, 31.00, 8.00),
(1, 33, 34.00, 11.00),
(3, 34, 30.00, 8.00),
(4, 35, 35.00, 12.00),
(6, 36, 32.00, 9.00),
(8, 37, 27.00, 6.00),
(1, 38, 23.00, 4.00),
(3, 39, 36.00, 13.00),
(4, 40, 33.00, 10.00),
(6, 41, 35.00, 11.00),
(8, 42, 26.00, 5.00),
(1, 43, 31.00, 8.00),
(3, 44, 22.00, 3.00),
(4, 45, 32.00, 9.00),
(6, 46, 29.00, 7.00),
(8, 47, 38.00, 14.00),
(1, 48, 25.00, 5.00),
(3, 49, 30.00, 8.00),
(4, 50, 33.00, 10.00),
(6, 51, 36.00, 12.00),
(8, 52, 24.00, 4.00),
(1, 53, 28.00, 6.00),
(3, 54, 34.00, 11.00);

-- ============================================
-- REVIEWS
-- ============================================

-- Restaurant Reviews
INSERT INTO Restaurant_Review (restaurant_id, order_id, rating) VALUES
(1, 1, 5),
(2, 2, 4),
(4, 3, 5),
(1, 4, 4),
(3, 5, 5),
(1, 6, 5),
(2, 7, 4),
(5, 8, 3),
(1, 9, 4),
(4, 10, 5),
(1, 11, 5),
(2, 12, 4),
(3, 13, 5),
(1, 14, 4),
(5, 15, 4),
(1, 16, 5),
(2, 17, 5),
(4, 18, 4),
(1, 19, 4),
(3, 20, 5);

-- Item Reviews
INSERT INTO Item_Review (order_item_id, rating) VALUES
(1, 5), (2, 4), (3, 5),
(5, 4), (6, 4),
(7, 5), (8, 5), (9, 4),
(10, 4), (11, 4),
(12, 5), (13, 5), (14, 5), (15, 5),
(16, 5), (17, 4), (18, 5),
(19, 4), (20, 4),
(21, 3), (22, 3), (23, 3),
(24, 4), (25, 4);

-- Captain Reviews
INSERT INTO Captain_Review (captain_id, order_id, rating) VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 5),
(4, 4, 5),
(5, 5, 4),
(6, 6, 5),
(8, 7, 5),
(1, 8, 4),
(3, 9, 4),
(4, 10, 5),
(6, 11, 5),
(8, 12, 4),
(1, 13, 5),
(3, 14, 4),
(4, 15, 4),
(6, 16, 5),
(8, 17, 5),
(1, 18, 4),
(3, 19, 5),
(4, 20, 5);

-- ============================================
-- Summary Statistics
-- ============================================
SELECT 'Database seeded successfully!' as Status;
SELECT COUNT(*) as Total_Customers FROM Customer;
SELECT COUNT(*) as Total_Orders FROM `Order`;
SELECT COUNT(*) as ASAP_Orders FROM `Order` WHERE scheduled_delivery_time IS NULL;
SELECT COUNT(*) as Scheduled_Orders FROM `Order` WHERE scheduled_delivery_time IS NOT NULL;
SELECT COUNT(*) as Iftar_Orders FROM `Order` WHERE scheduled_delivery_time LIKE '%-18:%';
SELECT COUNT(*) as Charity_Donations FROM `Order` WHERE is_donation = true;
SELECT COUNT(*) as Total_Branches FROM Branch;
SELECT COUNT(*) as Total_Captains FROM Captain;
SELECT COUNT(*) as Customers_With_Wallet_History FROM (SELECT DISTINCT customer_id FROM Wallet_Ledger) as w;
SELECT COUNT(DISTINCT item_id) as Items_With_Modifiers FROM Modifier_Group;