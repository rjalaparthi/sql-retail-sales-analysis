-- Retail Sales Analysis
-- File: 01_aggregations.sql
-- Purpose: Practice GROUP BY, HAVING, DISTINCT, and aggregate functions.

-- Find customers whose total sales across all their orders are greater than 100.
SELECT
    customer_id,
    SUM(sales) AS total_sales
FROM orders
GROUP BY customer_id
HAVING SUM(sales) > 100;


-- Find products that have been ordered by more than one distinct customer.
SELECT
    product_id,
    COUNT(DISTINCT customer_id) AS distinct_customer_count
FROM orders
GROUP BY product_id
HAVING COUNT(DISTINCT customer_id) > 1;


-- Find customers who placed at least one order with sales greater than 50.
SELECT DISTINCT customer_id
FROM orders
WHERE sales > 50;


-- Find the second-highest distinct sales value.
SELECT MAX(sales) AS second_highest_sales
FROM orders
WHERE sales < (
    SELECT MAX(sales)
    FROM orders
);
