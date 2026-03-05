use wagba;
INSERT INTO Restaurant (name,cuisine_type) VALUES
('Cairo Bites','Egyptian'),
('Pasta Palace','Italian'),
('Burger Hub','American');
use wagba;
INSERT INTO Branch (restaurant_id, location, open_time, close_time) VALUES
(1, 'Nasr City', '2026-03-05 10:00:00', '2026-03-05 23:59:00'),
(2, 'Zamalek', '2026-03-05 11:00:00', '2026-03-05 23:00:00'),
(3, 'New Cairo', '2026-03-05 10:00:00', '2026-03-06 02:00:00'), 
(1, 'Maadi', '2026-03-05 09:30:00', '2026-03-05 22:30:00'),
(2, 'Heliopolis', '2026-03-05 12:00:00', '2026-03-06 01:00:00');  

INSERT INTO Delivery_Zone (branch_id,zone_name,delivery_fee) VALUES
(1,'Zone A',20),(1,'Zone B',25),
(2,'Zone A',15),
(3,'Central',30),
(4,'North',28),
(5,'East',35);

INSERT INTO Customer (name,email) VALUES
('Ahmed Ali','ahmedd1@mail.com'),
('Sara Mohamed','sarah2@mail.com'),
('Omar Hassan','omar3@mail.com'),
('Mona Adel','mona4@mail.com'),
('Youssef Samy','youssef5@mail.com'),
('Laila Tarek','laila6@mail.com'),
('Khaled Nabil','khaled7@mail.com'),
('Nour Amr','nour8@mail.com'),
('Hana Mostafa','hana9@mail.com'),
('Karim Fady','karim10@mail.com'),
('Salma Hany','salma11@mail.com'),
('Ali Reda','ali12@mail.com'),
('Dina Wael','dina13@mail.com'),
('Mostafa Essam','mostafa14@mail.com'),
('Farah Magdy','farah15@mail.com'),
('Hossam Zaki','hossam16@mail.com'),
('Aya Gamal','aya17@mail.com'),
('Mahmoud Taha','mahmoud18@mail.com'),
('Reem Sherif','reem19@mail.com'),
('Tamer Atef','tamer20@mail.com');

INSERT INTO Wallet_Ledger (customer_id,transaction_type,amount)
SELECT customer_id,'credit',500 FROM Customer;

INSERT INTO Captain (name,phone,vehicle_type,vehicle_plate,status) VALUES
('Captain A','0100000001','Bike','ABC111','available'),
('Captain B','0100000002','Bike','ABC112','busy'),
('Captain C','0100000003','Car','ABC113','available'),
('Captain D','0100000004','Bike','ABC114','inactive'),
('Captain E','0100000005','Car','ABC115','available'),
('Captain F','0100000006','Bike','ABC116','busy'),
('Captain G','0100000007','Car','ABC117','available'),
('Captain H','0100000008','Bike','ABC118','available'),
('Captain I','0100000009','Car','ABC119','busy'),
('Captain J','0100000010','Bike','ABC120','available');

INSERT INTO Item (branch_id,category,name,price) VALUES
(1,'Main','Koshari',50),
(1,'Main','Mahshi',70),
(1,'Drinks','Hibiscus',20),
(3,'Pizza','Margherita',120),
(3,'Pizza','Pepperoni',150),
(3,'Pasta','Alfredo',130);

INSERT INTO Modifier_Group (item_id,name,min_select,max_select) VALUES
(1,'Additions',0,3),
(4,'Pizza Size',1,1);

INSERT INTO Modifier_Option (group_id,name,price_change) VALUES
(1,'Extra Sauce',5),
(1,'Extra Chickpeas',7),
(1,'Fried Onions',3),
(2,'Medium',0),
(2,'Large',30);

INSERT INTO `Order`
(customer_id,branch_id,captain_id,total_price,status)
SELECT 
FLOOR(1 + RAND()*20),
FLOOR(1 + RAND()*5),
FLOOR(1 + RAND()*10),
FLOOR(100 + RAND()*400),
'delivered'
FROM information_schema.tables
LIMIT 40;

INSERT INTO `Order`
(customer_id,branch_id,total_price,status,scheduled_delivery_time)
VALUES
(1,1,300,'pending','2026-03-10 18:30:00'),
(2,2,250,'pending','2026-03-10 18:35:00'),
(3,3,400,'pending','2026-03-11 18:30:00'),
(4,4,350,'pending','2026-03-11 18:40:00'),
(5,5,500,'pending','2026-03-12 18:30:00');

INSERT INTO `Order`
(customer_id,branch_id,is_donation,total_price,status)
VALUES
(6,1,TRUE,200,'delivered'),
(7,2,TRUE,150,'delivered'),
(8,3,TRUE,300,'delivered'),
(9,4,TRUE,250,'delivered'),
(10,5,TRUE,400,'delivered');

INSERT INTO Payment (order_id,payment_type,amount,status)
SELECT order_id,'cash',total_price,'completed'
FROM `Order`
WHERE status = 'delivered';