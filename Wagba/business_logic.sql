use wagba;

-- Calculate total revenue, average rating, and total orders for each restaurant
SELECT 
r.name AS Restaurant_name,
 SUM(o.total_price) AS total_revenue,
 AVG(rr.rating) AS average_rating ,
 COUNT(DISTINCT o.order_id) AS total_orders
FROM `Order` o 
 JOIN Branch b ON o.branch_id = b.branch_id
 JOIN Restaurant r ON b.restaurant_id = r.restaurant_id
LEFT JOIN Restaurant_Review rr ON o.order_id = rr.order_id
WHERE o.status = 'delivered'
GROUP BY r.name
ORDER BY total_revenue DESC, average_rating DESC, total_orders DESC;

use wagba;
-- Identify top customers based on total spending and their last order date
SELECT
    c.customer_id AS ID,
    c.name AS Name,
    p.phone_no,
    SUM(o.total_price) AS Total_spent,
    MAX(o.ordered_at) AS Last_Order_Date
FROM Customer c
JOIN Customer_Phone p 
    ON c.customer_id = p.customer_id
JOIN `Order` o 
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id,
    c.name,
    p.phone_no
ORDER BY Total_spent DESC
LIMIT 10;

use wagba;
-- Calculate total earnings and average rating for each busy captain
SELECT
c.captain_id , 
c.name AS captain_name ,
COALESCE(e.trips, 0) AS trips_completed,
COALESCE(e.total_pay, 0) AS Total_Earnings,  
COALESCE(r.avg_rating, 0) AS Captain_rating
FROM
Captain c
LEFT JOIN (
SELECT captain_id, 
COUNT(order_id) AS trips, 
SUM(base_pay + bonus) AS total_pay
FROM Captain_Earning
    GROUP BY captain_id
) e ON c.captain_id = e.captain_id
LEFT JOIN (
 SELECT captain_id, AVG(rating) AS avg_rating
    FROM Captain_Review
    GROUP BY captain_id
) r ON c.captain_id = r.captain_id 
WHERE c.status = 'busy'
ORDER BY Total_Earnings DESC , Captain_rating DESC 