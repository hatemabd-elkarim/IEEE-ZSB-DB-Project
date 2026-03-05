use wagba;

-- By Ramadan -----------------------------------------------------------------------------------------
-- 1. Calculate total revenue, average rating, and total orders for each restaurant
SELECT
    r.name AS Restaurant_name,
    SUM(o.total_price) AS total_revenue,
    AVG(rr.rating) AS average_rating,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM
    `Order` o
    JOIN Branch b ON o.branch_id = b.branch_id
    JOIN Restaurant r ON b.restaurant_id = r.restaurant_id
    LEFT JOIN Restaurant_Review rr ON o.order_id = rr.order_id
WHERE
    o.status = 'delivered'
GROUP BY
    r.name
ORDER BY
    total_revenue DESC,
    average_rating DESC,
    total_orders DESC;
     
-- 2. Identify top customers based on total spending and their last order date
SELECT
    c.customer_id AS ID,
    c.name AS Name,
    p.phone_no,
    SUM(o.total_price) AS Total_spent,
    MAX(o.ordered_at) AS Last_Order_Date
FROM
    Customer c
    JOIN Customer_Phone p ON c.customer_id = p.customer_id
    JOIN `Order` o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name,
    p.phone_no
ORDER BY Total_spent DESC
LIMIT 10;

-- 3. Calculate total earnings and average rating for each busy captain
SELECT
    c.captain_id,
    c.name AS captain_name,
    COALESCE(e.trips, 0) AS trips_completed,
    COALESCE(e.total_pay, 0) AS Total_Earnings,
    COALESCE(r.avg_rating, 0) AS Captain_rating
FROM Captain c
    LEFT JOIN (
        SELECT captain_id, COUNT(order_id) AS trips, SUM(base_pay + bonus) AS total_pay
        FROM Captain_Earning
        GROUP BY
            captain_id
    ) e ON c.captain_id = e.captain_id
    LEFT JOIN (
        SELECT captain_id, AVG(rating) AS avg_rating
        FROM Captain_Review
        GROUP BY
            captain_id
    ) r ON c.captain_id = r.captain_id
WHERE
    c.status = 'busy'
ORDER BY
    Total_Earnings DESC,
    Captain_rating DESC;
    
-- By Tamer -----------------------------------------------------------------------------------------
-- 4. Calculate total quantity sold, total revenue generated for top 3 items sell best per restaurant
SELECT *
FROM (
        SELECT
            r.name AS restaurant_name, i.name AS item_name, SUM(oi.quantity) AS total_quantity_sold, SUM(oi.quantity * i.price) AS revenue, RANK() OVER (
                PARTITION BY
                    r.restaurant_id
                ORDER BY SUM(oi.quantity * i.price) DESC
            ) AS rank_in_restaurant
        FROM
            Restaurant r
            JOIN Branch b ON r.restaurant_id = b.restaurant_id
            JOIN Item i ON b.branch_id = i.branch_id
            JOIN Order_Items oi ON i.item_id = oi.item_id
            JOIN `Order` o ON oi.order_id = o.order_id
        WHERE
            o.status = 'delivered'
        GROUP BY
            r.restaurant_id, r.name, i.name
    ) ranked_items
WHERE
    rank_in_restaurant <= 3;
    
-- 5. calculates for top captains: deliveries_completed , average_rating, total_order_value
SELECT
    c.captain_id,
    c.name AS captain_name,
    COUNT(o.order_id) AS deliveries_completed,
    AVG(cr.rating) AS average_rating,
    SUM(o.total_price) AS total_order_value
FROM
    Captain c
    LEFT JOIN `Order` o ON c.captain_id = o.captain_id
    LEFT JOIN Captain_Review cr ON c.captain_id = cr.captain_id
WHERE
    o.status = 'delivered'
GROUP BY
    c.captain_id,
    c.name
HAVING
    deliveries_completed >= 5
ORDER BY
    average_rating DESC,
    deliveries_completed DESC;

-- By Sara -----------------------------------------------------------------------------------------
-- 6. FEATURE: Logistics Gap Analysis - Generate a report of all potential branch-to-zone pairings 
-- to identify neighborhoods (zones) where specific branches do not yet offer delivery.
SELECT 
    R.name AS restaurant_name, 
    B.location AS branch_address, 
    All_Zones.zone_name AS potential_zone,
    CASE 
        WHEN DZ.zone_id IS NULL THEN 'No Coverage' 
        ELSE 'Active' 
    END AS service_status
FROM Branch B
JOIN Restaurant R ON B.restaurant_id = R.restaurant_id
CROSS JOIN (
    SELECT DISTINCT zone_name 
    FROM Delivery_Zone
) AS All_Zones
LEFT JOIN Delivery_Zone DZ ON B.branch_id = DZ.branch_id 
    AND All_Zones.zone_name = DZ.zone_name
ORDER BY R.name, All_Zones.zone_name;



--  7. FEATURE: Customer Profile Dashboard - Get a full summary of a customer's profile, 
-- including all registered phone numbers and their primary delivery addresses.
SELECT c.name, c.email, GROUP_CONCAT(DISTINCT cp.phone_no) AS contact_numbers, COUNT(a.address_id) AS saved_addresses
FROM Customer c
LEFT JOIN Customer_Phone cp ON c.customer_id = cp.customer_id
LEFT JOIN Address a ON c.customer_id = a.customer_id
GROUP BY c.customer_id;


-- 8. Identifies number of branches for each restaurant, its delivery fees details
SELECT 
    r.name,
    COUNT(DISTINCT b.branch_id) AS total_branches,
    MIN(dz.delivery_fee) AS cheapest_delivery,
    MAX(dz.delivery_fee) AS priciest_delivery,
    AVG(dz.delivery_fee) AS average_delivery_cost
FROM Restaurant r
JOIN Branch b ON r.restaurant_id = b.restaurant_id
JOIN Delivery_Zone dz ON b.branch_id = dz.branch_id
GROUP BY r.name
ORDER BY average_delivery_cost DESC;

-- By Hatem -----------------------------------------------------------------------------------------
-- 9. show categorized menu of items of a certain branch by id
SELECT 
    i.category,
    i.item_id,
    i.name AS item_name,
    i.price,
    CASE WHEN i.is_available THEN 'Available' ELSE 'Out of Stock' END AS availability,
    COUNT(DISTINCT mg.group_id) AS customization_options
FROM Item i
LEFT JOIN Modifier_Group mg ON i.item_id = mg.item_id
WHERE i.branch_id = 1  -- for example
GROUP BY i.item_id, i.category, i.name, i.price, i.is_available
ORDER BY i.category, i.price;

-- 10. track global usage of promocodes
SELECT 
    pc.code,
    pc.discount_type,
    pc.discount_value,
    pc.expiration_date,
    pc.usage_limit_per_user,
    pc.usage_limit_global,
    COUNT(DISTINCT pu.customer_id) AS unique_users,
    COUNT(pu.promo_usage_id) AS total_uses,
    (pc.usage_limit_global - COUNT(pu.promo_usage_id)) AS global_uses_remaining,
    CASE 
        WHEN pc.expiration_date < CURDATE() THEN 'Expired'
        WHEN pc.usage_limit_global > 0 AND (pc.usage_limit_global - COUNT(pu.promo_usage_id)) <= 0 THEN 'Global Limit Reached'
        ELSE 'Active'
    END AS status
FROM Promo_Code pc
LEFT JOIN Promo_Usage pu ON pc.promo_id = pu.promo_id
GROUP BY 
    pc.promo_id,
    pc.code,
    pc.discount_type,
    pc.discount_value,
    pc.expiration_date,
    pc.usage_limit_per_user,
    pc.usage_limit_global
ORDER BY pc.code;

-- 11. Top donors ranked by total donation amount
SELECT 
    c.customer_id,
    c.name AS donor_name,
    c.email,
    COUNT(o.order_id) AS total_donations,
    SUM(o.total_price) AS total_donated,
    MIN(o.ordered_at) AS first_donation_date,
    MAX(o.ordered_at) AS last_donation_date
FROM Customer c
JOIN `Order` o ON c.customer_id = o.customer_id
WHERE o.is_donation = true
GROUP BY c.customer_id, c.name, c.email
ORDER BY total_donated DESC;

-- 12. calculate current wallet balance for users
SELECT 
    c.customer_id,
    c.name AS customer_name,
    c.email,
    COALESCE(SUM(CASE WHEN wl.transaction_type = 'credit' THEN wl.amount ELSE 0 END), 0) AS total_credits,
    COALESCE(SUM(CASE WHEN wl.transaction_type = 'debit' THEN wl.amount ELSE 0 END), 0) AS total_debits,
    COALESCE(
        SUM(CASE WHEN wl.transaction_type = 'credit' THEN wl.amount ELSE -wl.amount END), 
        0
    ) AS current_balance,
    COUNT(wl.transaction_id) AS total_transactions,
    MAX(wl.created_at) AS last_transaction_date
FROM Customer c
LEFT JOIN Wallet_Ledger wl ON c.customer_id = wl.customer_id
GROUP BY c.customer_id, c.name, c.email
ORDER BY current_balance DESC;

-- By Shahd -----------------------------------------------------------------------------------------
-- 13. Show All Donation Orders
SELECT 
    o.order_id,
    c.name as "Customer Name",
    o.total_price as"Total Price",
    o.ordered_at,
    o.status
FROM `Order` o
JOIN Customer c 
ON o.customer_id = c.customer_id
WHERE o.is_donation = TRUE;

-- 14. Display Customer Order History With Item Ratings
select 
    o.customer_id,
    o.order_id,
    i.name as 'Item Name',
    oi.quantity,
    r.name as restaurant,
    b.location as branch,
    o.ordered_at,
    ir.rating as 'Item Rating'
from `Order` o
join Branch b on o.branch_id = b.branch_id
join Restaurant r on b.restaurant_id = r.restaurant_id
join Order_Items oi on o.order_id = oi.order_id
join Item i on oi.item_id = i.item_id
left join Item_Review ir on oi.order_item_id = ir.order_item_id
where o.customer_id = 1
order by o.ordered_at desc;

-- 15. Display total price per order for each customer
SELECT 
    c.name as 'Customer Name', 
    o.order_id , 
    sum(oi.quantity * i.price) as 'Total Price'
FROM `Order` o
JOIN Customer c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Item i ON oi.item_id = i.item_id
GROUP BY o.order_id, c.name
ORDER BY 'Total Price' DESC;