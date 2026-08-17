-- Retail Sales Analysis
-- File: 04_correlated_subqueries.sql
-- Purpose: Practice correlated subqueries where the inner query depends on the current outer row.

-- Find all orders whose sales value is greater than
-- the average sales for that same product.
SELECT *
FROM orders o1
WHERE o1.sales > (
    SELECT AVG(o2.sales)
    FROM orders o2
    WHERE o2.product_id = o1.product_id
);
