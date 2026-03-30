CREATE DATABASE sales_db;
USE sales_db;

USE sales_db;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    row_id        INT,
    order_id      VARCHAR(50),
    order_date    VARCHAR(50),
    ship_date     VARCHAR(50),
    ship_mode     VARCHAR(50),
    customer_id   VARCHAR(50),
    customer_name VARCHAR(100),
    segment       VARCHAR(50),
    country       VARCHAR(50),
    city          VARCHAR(50),
    state         VARCHAR(50),
    postal_code   VARCHAR(20),
    region        VARCHAR(50),
    product_id    VARCHAR(50),
    category      VARCHAR(50),
    sub_category  VARCHAR(50),
    product_name  VARCHAR(200),
    sales         DECIMAL(10,2),
    quantity      INT,
    discount      DECIMAL(5,2),
    profit        DECIMAL(10,2)
);
USE sales_db;
SELECT * FROM sales LIMIT 10;
-- total products
SELECT 
    region, 
    SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;
-- Top 5 Profitable Categories:
SELECT 
    category, 
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC
LIMIT 5;
--  Monthly Sales Trend
SELECT 
    MONTH(order_date) AS month_num,
    MONTHNAME(order_date) AS month_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY month_num;
--  Discount Impact on Profit:
SELECT 
    discount,
    AVG(profit) AS avg_profit,
    COUNT(*) AS total_orders
FROM sales
GROUP BY discount
ORDER BY discount;