-- Retail Sales Analysis
-- File: 03_subqueries.sql
-- Purpose: Practice scalar subqueries and derived-table subqueries.

-- Find products priced above the average product price.
SELECT
    p.product,
    p.price
FROM products p
WHERE p.price > (
    SELECT AVG(price)
    FROM products
);


-- Show each product name, its price, and the average price of all products.
SELECT
    product,
    price,
    (
        SELECT AVG(price)
        FROM products
    ) AS average_price
FROM products;


-- Find all orders whose sales value is greater than
-- the overall average sales of all orders.
SELECT *
FROM orders
WHERE sales > (
    SELECT AVG(sales)
    FROM orders
);


-- Find each customer and their total sales.
-- Show only customers whose total sales are greater than
-- the average total sales per customer.
SELECT
    customer_id,
    SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(sales) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            customer_id,
            SUM(sales) AS customer_total
        FROM orders
        GROUP BY customer_id
    ) x
);
