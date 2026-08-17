-- Retail Sales Analysis
-- File: 06_mixed_business_questions.sql
-- Purpose: Solve mixed business-style SQL questions using joins, aggregations,
-- subqueries, EXISTS, and derived tables.

-- Find the product name that generated the highest total sales.
SELECT
    p.product,
    SUM(o.sales) AS total_sales
FROM products p
INNER JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.product
ORDER BY total_sales DESC
LIMIT 1;


-- Find the second-highest distinct sales value.
SELECT MAX(sales) AS second_highest_sales
FROM orders
WHERE sales < (
    SELECT MAX(sales)
    FROM orders
);


-- Find all orders whose sales value is greater than
-- the average sales for that same product.
SELECT *
FROM orders o1
WHERE o1.sales > (
    SELECT AVG(o2.sales)
    FROM orders o2
    WHERE o2.product_id = o1.product_id
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


-- Find all products that have never appeared in any order.
SELECT *
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.product_id = p.product_id
);


-- Find each product name and the number of distinct customers who ordered it.
-- Show only products ordered by at least 2 distinct customers.
SELECT
    p.product,
    COUNT(DISTINCT o.customer_id) AS distinct_customer_count
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product
HAVING COUNT(DISTINCT o.customer_id) >= 2;
