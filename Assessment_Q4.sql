/*
-- Query: WITH transaction_data AS (
    SELECT
        owner_id,
        COUNT(*) AS total_transactions,
        AVG(amount * 0.001) AS avg_profit_per_transaction
    FROM
        savings_savingsaccount
    WHERE
        transaction_status = 'successful'
    GROUP BY
        owner_id
),
tenure_data AS (
    SELECT
        id AS customer_id,
        name,
        TIMESTAMPDIFF(MONTH, date_joined, CURDATE()) AS tenure_months
    FROM
        users_customuser
),
clv_estimate AS (
    SELECT
        t.customer_id,
        t.name,
        t.tenure_months,
        td.total_transactions,
        ROUND((td.total_transactions / t.tenure_months) * 12 * td.avg_profit_per_transaction, 2) AS estimated_clv
    FROM
        tenure_data t
    JOIN
        transaction_data td ON t.customer_id = td.owner_id
    WHERE
        t.tenure_months > 0
)
SELECT *
FROM clv_estimate
ORDER BY estimated_clv DESC
-- Date: 2025-05-17 15:19
*/
