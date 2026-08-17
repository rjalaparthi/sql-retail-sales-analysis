-- Retail Sales Analysis
-- File: 05_exists_not_exists.sql
-- Purpose: Practice EXISTS and NOT EXISTS for matching and missing-record checks.

-- Find all products that have never appeared in any order.
SELECT *
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.product_id = p.product_id
);


-- Find all products whose price is greater than the average product price
-- and that have appeared in at least one order.
SELECT *
FROM products p
WHERE p.price > (
    SELECT AVG(price)
    FROM products
)
AND EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.product_id = p.product_id
);
