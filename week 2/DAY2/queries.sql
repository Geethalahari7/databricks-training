-- DATE & TIMESTAMP FUNCTIONS IN MYSQL

-- 1. CREATE TABLE

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    order_timestamp TIMESTAMP,
    delivery_date DATE,
    order_amount DECIMAL(10,2)
);

-- 2. INSERT SAMPLE DATA

INSERT INTO orders VALUES
(1, 'Karthik', '2024-01-15', '2024-01-15 10:30:45', '2024-01-20', 2500.00),
(2, 'Veena', '2024-02-18', '2024-02-18 18:45:20', '2024-02-22', 3200.50),
(3, 'Ravi', '2024-03-02', '2024-03-02 09:15:10', '2024-03-08', 4100.75),
(4, 'Anil', '2024-03-09', '2024-03-09 14:05:55', '2024-03-15', 1800.00),
(5, 'Suresh', '2024-01-07', '2024-01-07 23:55:00', '2024-01-12', 2900.00);

-- 3. CURRENT DATE & TIME FUNCTIONS

SELECT CURDATE();
SELECT CURRENT_DATE();

SELECT CURTIME();
SELECT CURRENT_TIME();

SELECT NOW();
SELECT CURRENT_TIMESTAMP;

-- 4. EXTRACT YEAR, MONTH, DAY

SELECT
    order_id,
    YEAR(order_date) AS year_value,
    MONTH(order_date) AS month_value,
    DAY(order_date) AS day_value
FROM orders;

-- 5. EXTRACT USING EXTRACT()

SELECT
    order_id,
    EXTRACT(YEAR FROM order_date) AS extract_year,
    EXTRACT(MONTH FROM order_date) AS extract_month,
    EXTRACT(DAY FROM order_date) AS extract_day
FROM orders;

-- 6. MONTH NAME & DAY NAME

SELECT
    order_id,
    MONTHNAME(order_date) AS month_name,
    DAYNAME(order_date) AS day_name
FROM orders;

-- 7. WEEKDAY & DAYOFWEEK

SELECT
    order_id,
    WEEKDAY(order_date) AS weekday_number,
    DAYOFWEEK(order_date) AS dayofweek_number
FROM orders;

-- 8. IDENTIFY WEEKENDS USING DAYNAME

SELECT
    order_id,
    order_date
FROM orders
WHERE DAYNAME(order_date) IN ('Saturday','Sunday');

-- 9. IDENTIFY WEEKENDS USING DAYOFWEEK

SELECT
    order_id,
    order_date
FROM orders
WHERE DAYOFWEEK(order_date) IN (1,7);

-- 10. IDENTIFY WEEKDAYS

SELECT
    order_id,
    order_date
FROM orders
WHERE DAYOFWEEK(order_date) BETWEEN 2 AND 6;

-- 11. ADD DAYS

SELECT
    order_id,
    order_date,
    DATE_ADD(order_date, INTERVAL 5 DAY) AS added_days
FROM orders;

-- 12. SUBTRACT DAYS

SELECT
    order_id,
    order_date,
    DATE_SUB(order_date, INTERVAL 3 DAY) AS subtracted_days
FROM orders;

-- 13. ADD MONTHS

SELECT
    order_id,
    DATE_ADD(order_date, INTERVAL 1 MONTH) AS added_month
FROM orders;

-- 14. SUBTRACT MONTHS

SELECT
    order_id,
    DATE_SUB(order_date, INTERVAL 2 MONTH) AS subtracted_month
FROM orders;

-- 15. ADD YEARS

SELECT
    order_id,
    DATE_ADD(order_date, INTERVAL 1 YEAR) AS added_year
FROM orders;

-- 16. DATEDIFF

SELECT
    order_id,
    DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;

-- 17. TIMESTAMPDIFF

SELECT
    order_id,
    TIMESTAMPDIFF(DAY, order_date, delivery_date) AS days_difference,
    TIMESTAMPDIFF(MONTH, order_date, delivery_date) AS months_difference
FROM orders;

-- 18. LAST DAY OF MONTH

SELECT
    order_id,
    LAST_DAY(order_date) AS last_day
FROM orders;

-- 19. FIRST DAY OF MONTH

SELECT
    order_id,
    DATE_SUB(order_date, INTERVAL DAY(order_date)-1 DAY) AS first_day
FROM orders;

-- 20. DATE FORMAT

SELECT
    order_id,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date
FROM orders;

SELECT
    order_id,
    DATE_FORMAT(order_date, '%M %d, %Y') AS long_format_date
FROM orders;

-- 21. STRING TO DATE

SELECT STR_TO_DATE('15-01-2024', '%d-%m-%Y');

-- 22. TIMESTAMP FORMATTING

SELECT
    order_id,
    DATE_FORMAT(order_timestamp, '%d-%m-%Y %H:%i:%s') AS formatted_timestamp
FROM orders;

-- 23. FILTER BY MONTH NUMBER

SELECT *
FROM orders
WHERE MONTH(order_date) = 1;

-- 24. FILTER BY MONTH NAME

SELECT *
FROM orders
WHERE MONTHNAME(order_date) = 'February';

-- 25. FINANCIAL YEAR LOGIC

SELECT
    order_id,
    order_date,
    CASE
        WHEN MONTH(order_date) >= 4
        THEN CONCAT(YEAR(order_date), '-', YEAR(order_date)+1)
        ELSE CONCAT(YEAR(order_date)-1, '-', YEAR(order_date))
    END AS financial_year
FROM orders;

-- 26. ORDERS IN LAST 7 DAYS

SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

-- 27. ORDERS PLACED TODAY

SELECT *
FROM orders
WHERE DATE(order_timestamp) = CURDATE();
