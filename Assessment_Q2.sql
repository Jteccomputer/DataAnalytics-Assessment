/*
-- Query: WITH monthly_tx_counts AS (
    SELECT
        owner_id,
        DATE_FORMAT(transaction_date, '%Y-%m') AS txn_month,
        COUNT(*) AS tx_count
    FROM
        savings_savingsaccount
    WHERE
        transaction_status = 'successful'
    GROUP BY
        owner_id, txn_month
),
avg_tx_per_customer AS (
    SELECT
        owner_id,
        AVG(tx_count) AS avg_txn_per_month
    FROM
        monthly_tx_counts
    GROUP BY
        owner_id
),
categorized_customers AS (
    SELECT
        CASE
            WHEN avg_txn_per_month >= 10 THEN 'High Frequency'
            WHEN avg_txn_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category,
        avg_txn_per_month
    FROM
        avg_tx_per_customer
)
SELECT
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 1) AS avg_transactions_per_month
FROM
    categorized_customers
GROUP BY
    frequency_category
ORDER BY
    FIELD(frequency_category, 'High Frequency', 'Medium Frequency', 'Low Frequency')
-- Date: 2025-05-17 15:14
*/
