# Retail Sales SQL Analysis

A hands-on PostgreSQL project focused on analyzing retail sales data using common SQL patterns used in data engineering and analytics.

## Project Overview

This project uses two tables:

- `products`
- `orders`

The goal is to answer business-style questions using SQL while practicing core concepts such as joins, aggregations, subqueries, correlated subqueries, `EXISTS`, and derived tables.

## SQL Concepts Practiced

- `INNER JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `HAVING`
- `SUM`, `AVG`, `MAX`, `COUNT`
- `COUNT(DISTINCT ...)`
- Scalar subqueries
- Correlated subqueries
- Subqueries in the `FROM` clause
- `EXISTS`
- `NOT EXISTS`
- `DISTINCT`
- `ORDER BY`
- `LIMIT`

## Repository Structure

```text
sql-retail-sales-analysis/
│
├── README.md
│
├── setup/
│   ├── 01_create_tables.sql
│   └── 02_insert_data.sql
│
└── queries/
    ├── 01_aggregations.sql
    ├── 02_joins.sql

## Next Steps

- Window functions
- CTEs
- Date-based analysis
- Query performance with `EXPLAIN`
- PySpark / Databricks implementation
    ├── 03_subqueries.sql
    ├── 04_correlated_subqueries.sql
    ├── 05_exists_not_exists.sql
    └── 06_mixed_business_questions.sql
