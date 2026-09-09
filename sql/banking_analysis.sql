
-- ============================================================
-- BANKING CUSTOMER & TRANSACTION ANALYTICS
-- SQL ANALYSIS
-- ============================================================

-- Database table:
-- bank_transactions


-- ============================================================
-- 1. TOTAL CUSTOMERS AND TRANSACTIONS
-- ============================================================

SELECT
    COUNT(DISTINCT CustomerID) AS total_customers,
    COUNT(TransactionID) AS total_transactions
FROM bank_transactions;


-- ============================================================
-- 2. TRANSACTION VALUE SUMMARY
-- ============================================================

SELECT
    SUM("TransactionAmount (INR)") AS total_transaction_value,
    AVG("TransactionAmount (INR)") AS average_transaction_value,
    MIN("TransactionAmount (INR)") AS minimum_transaction_value,
    MAX("TransactionAmount (INR)") AS maximum_transaction_value
FROM bank_transactions;


-- ============================================================
-- 3. TOP CUSTOMERS BY TRANSACTION VALUE
-- ============================================================

SELECT
    CustomerID,
    COUNT(TransactionID) AS transaction_count,
    SUM("TransactionAmount (INR)") AS total_transaction_value
FROM bank_transactions
GROUP BY CustomerID
ORDER BY total_transaction_value DESC
LIMIT 20;


-- ============================================================
-- 4. CUSTOMER TRANSACTION FREQUENCY
-- ============================================================

WITH customer_frequency AS (
    SELECT
        CustomerID,
        COUNT(TransactionID) AS transaction_count
    FROM bank_transactions
    GROUP BY CustomerID
)

SELECT
    transaction_count,
    COUNT(CustomerID) AS customer_count
FROM customer_frequency
GROUP BY transaction_count
ORDER BY transaction_count;


-- ============================================================
-- 5. TRANSACTION BY MONTH
-- ============================================================

SELECT
    strftime('%Y-%m', TransactionDate) AS transaction_month,
    COUNT(TransactionID) AS transaction_count,
    SUM("TransactionAmount (INR)") AS total_transaction_value,
    AVG("TransactionAmount (INR)") AS average_transaction_value
FROM bank_transactions
GROUP BY strftime('%Y-%m', TransactionDate)
ORDER BY transaction_month;


-- ============================================================
-- 6. TRANSACTION BY HOUR
-- ============================================================

SELECT
    TransactionHour,
    COUNT(TransactionID) AS transaction_count,
    SUM("TransactionAmount (INR)") AS total_transaction_value,
    AVG("TransactionAmount (INR)") AS average_transaction_value
FROM bank_transactions
GROUP BY TransactionHour
ORDER BY TransactionHour;


-- ============================================================
-- 7. TRANSACTION BY DAY OF WEEK
-- ============================================================

SELECT
    TransactionDayName,
    COUNT(TransactionID) AS transaction_count,
    SUM("TransactionAmount (INR)") AS total_transaction_value,
    AVG("TransactionAmount (INR)") AS average_transaction_value
FROM bank_transactions
GROUP BY TransactionDayName
ORDER BY transaction_count DESC;


-- ============================================================
-- 8. CUSTOMER VALUE SEGMENT
-- ============================================================

WITH customer_value AS (
    SELECT
        CustomerID,
        SUM("TransactionAmount (INR)") AS total_transaction_value
    FROM bank_transactions
    GROUP BY CustomerID
),

customer_segment AS (
    SELECT
        CustomerID,
        total_transaction_value,
        CASE
            WHEN total_transaction_value <= 536.80
                THEN 'Low'
            WHEN total_transaction_value <= 3577.00
                THEN 'Medium'
            ELSE 'High'
        END AS customer_value_segment
    FROM customer_value
)

SELECT
    customer_value_segment,
    COUNT(CustomerID) AS customer_count,
    SUM(total_transaction_value) AS total_transaction_value,
    ROUND(
        SUM(total_transaction_value) * 100.0 /
        (SELECT SUM(total_transaction_value)
         FROM customer_value),
        2
    ) AS transaction_value_percentage
FROM customer_segment
GROUP BY customer_value_segment
ORDER BY
    CASE customer_value_segment
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
    END;


-- ============================================================
-- 9. TRANSACTION VALUE RANGE
-- ============================================================

SELECT
    CASE
        WHEN "TransactionAmount (INR)" <= 500
            THEN '₹0–500'
        WHEN "TransactionAmount (INR)" <= 1000
            THEN '₹501–1,000'
        WHEN "TransactionAmount (INR)" <= 5000
            THEN '₹1,001–5,000'
        WHEN "TransactionAmount (INR)" <= 10000
            THEN '₹5,001–10,000'
        WHEN "TransactionAmount (INR)" <= 50000
            THEN '₹10,001–50,000'
        WHEN "TransactionAmount (INR)" <= 100000
            THEN '₹50,001–100,000'
        ELSE '> ₹100,000'
    END AS transaction_value_range,

    COUNT(TransactionID) AS transaction_count,

    SUM("TransactionAmount (INR)") AS total_transaction_value,

    AVG("TransactionAmount (INR)") AS average_transaction_value

FROM bank_transactions

GROUP BY transaction_value_range

ORDER BY
    CASE transaction_value_range
        WHEN '₹0–500' THEN 1
        WHEN '₹501–1,000' THEN 2
        WHEN '₹1,001–5,000' THEN 3
        WHEN '₹5,001–10,000' THEN 4
        WHEN '₹10,001–50,000' THEN 5
        WHEN '₹50,001–100,000' THEN 6
        ELSE 7
    END;


-- ============================================================
-- 10. DAILY TRANSACTION PERFORMANCE
-- ============================================================

SELECT
    DATE(TransactionDate) AS transaction_date,
    COUNT(TransactionID) AS transaction_count,
    SUM("TransactionAmount (INR)") AS total_transaction_value,
    AVG("TransactionAmount (INR)") AS average_transaction_value
FROM bank_transactions
GROUP BY DATE(TransactionDate)
ORDER BY transaction_date;


-- ============================================================
-- 11. PEAK TRANSACTION DAYS
-- ============================================================

SELECT
    DATE(TransactionDate) AS transaction_date,
    COUNT(TransactionID) AS transaction_count,
    SUM("TransactionAmount (INR)") AS total_transaction_value,
    AVG("TransactionAmount (INR)") AS average_transaction_value
FROM bank_transactions
GROUP BY DATE(TransactionDate)
ORDER BY transaction_count DESC
LIMIT 10;


-- ============================================================
-- 12. PEAK DAYS BY TRANSACTION VALUE
-- ============================================================

SELECT
    DATE(TransactionDate) AS transaction_date,
    COUNT(TransactionID) AS transaction_count,
    SUM("TransactionAmount (INR)") AS total_transaction_value,
    AVG("TransactionAmount (INR)") AS average_transaction_value
FROM bank_transactions
GROUP BY DATE(TransactionDate)
ORDER BY total_transaction_value DESC
LIMIT 10;


-- ============================================================
-- 13. TRANSACTION ACTIVITY BY TIME PERIOD
-- ============================================================

SELECT
    CASE
        WHEN TransactionHour BETWEEN 0 AND 5
            THEN '00:00–05:59'
        WHEN TransactionHour BETWEEN 6 AND 11
            THEN '06:00–11:59'
        WHEN TransactionHour BETWEEN 12 AND 17
            THEN '12:00–17:59'
        ELSE '18:00–23:59'
    END AS transaction_time_period,

    COUNT(TransactionID) AS transaction_count,

    SUM("TransactionAmount (INR)") AS total_transaction_value,

    AVG("TransactionAmount (INR)") AS average_transaction_value

FROM bank_transactions

GROUP BY transaction_time_period

ORDER BY
    CASE transaction_time_period
        WHEN '00:00–05:59' THEN 1
        WHEN '06:00–11:59' THEN 2
        WHEN '12:00–17:59' THEN 3
        WHEN '18:00–23:59' THEN 4
    END;


-- ============================================================
-- 14. TRANSACTION VALUE DISTRIBUTION
-- ============================================================

WITH ordered_transactions AS (
    SELECT
        "TransactionAmount (INR)" AS transaction_amount,

        ROW_NUMBER() OVER (
            ORDER BY "TransactionAmount (INR)"
        ) AS row_number,

        COUNT(*) OVER () AS total_rows

    FROM bank_transactions
)

SELECT
    MIN(transaction_amount) AS minimum_transaction_value,

    MAX(transaction_amount) AS maximum_transaction_value,

    AVG(transaction_amount) AS average_transaction_value,

    (
        SELECT AVG(transaction_amount)
        FROM ordered_transactions
        WHERE row_number IN (
            CAST((total_rows + 1) / 2 AS INTEGER),
            CAST((total_rows + 2) / 2 AS INTEGER)
        )
    ) AS median_transaction_value

FROM ordered_transactions;


-- ============================================================
-- END OF SQL ANALYSIS
-- ============================================================
