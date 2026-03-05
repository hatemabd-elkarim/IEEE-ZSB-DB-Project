use al_muizz_mystery;

SELECT description, date
FROM crime_scene_reports
WHERE location = 'Al-Muizz Street';
/*
	description: Theft occurred between 11:15 PM and 11:20 PM. Witness A saw a man carrying a large bag drop a receipt 
    from "Sobia King" for 2 Sobia and 1 Kharoub before jumping into a White Hyundai Verna that sped away towards Salah Salem road.
    date: 2026-02-16
*/

SELECT customer_phone
FROM sobia_king_sales
WHERE order_details LIKE '%2 Sobia, 1 Kharoub%';
-- 010-9999-8888

SELECT license_plate
FROM traffic_cameras
WHERE car_make = 'Hyundai' AND car_color = 'White' AND location LIKE '%Salah Salem%' AND timestamp > '2026-02-16 23:15:00';
/*
	ن ج ن - 2562
	أج د - 1234
	هـ ج ب - 6097
*/

SELECT receiver_number
FROM phone_calls
WHERE caller_number = '010-9999-8888';
-- 011-7777-6666

SELECT *
FROM vehicle_owners
WHERE phone_number in ('010-9999-8888', '011-7777-6666') AND 
license_plate in ('ن ج ن - 2562', 'أ ج د - 1234','هـ ج ب - 6097');
-- Sayed El-Tayer

SELECT seat_number
FROM ramses_station_tickets
WHERE passenger_name = 'Sayed El-Tayer'
-- 14B
