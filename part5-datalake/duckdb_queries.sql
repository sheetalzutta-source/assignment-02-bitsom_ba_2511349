-- =====================================
-- CROSS-FORMAT QUERIES (DUCKDB)
-- =====================================
-- =====================================
-- Q1: List all customers along with the total number of orders they have placed
-- =====================================

SELECT 
c.customer_id,
c.name,
COUNT(o.order_id) AS total_orders
FROM 'customers.csv' c
LEFT JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;


-- =====================================
-- Q2: Find the top 3 customers by total order value
-- =====================================

SELECT 
c.customer_id,
c.name,
SUM(o.total_amount) AS total_value
FROM 'customers.csv' c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_value DESC
LIMIT 3;


-- =====================================
-- Q3: List all products purchased by customers from Bangalore
-- =====================================
-- Product level data not available due to missing linkage

SELECT 
c.name,
o.order_id,
o.total_amount
FROM 'customers.csv' c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';


-- =====================================
-- Q4: Join all three files to show: customer name, order date, product name, and quantity
-- =====================================
-- Product name and quantity not available due to missing relationship

SELECT 
c.name,
o.order_date,
o.total_amount,
o.num_items
FROM 'customers.csv' c
JOIN read_json_auto('orders.json') o
ON c.customer_id = o.customer_id;
