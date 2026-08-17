-- Retail Sales Analysis
-- File: 01_create_tables.sql
-- Purpose: Create the products and orders tables used for SQL practice.

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sales_person_id INT,
    order_date DATE,
    ship_date DATE,
    order_status VARCHAR(30),
    ship_address VARCHAR(150),
    bill_address VARCHAR(150),
    quantity INT,
    sales NUMERIC(10,2),
    creation_time TIMESTAMP,

    CONSTRAINT fk_orders_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
