/*
-- Query: WITH recent_savings AS (
    SELECT
        plan_id,
        owner_id,
        MAX(transaction_date) AS last_transaction_date
    FROM
        savings_savingsaccount
    WHERE
        transaction_status = 'successful'
    GROUP BY
        plan_id, owner_id
),
recent_investments AS (
    SELECT
        id AS plan_id,
        owner_id,
        GREATEST(
            IFNULL(last_charge_date, '1900-01-01'),
            IFNULL(start_date, '1900-01-01'),
            IFNULL(created_on, '1900-01-01')
        ) AS last_transaction_date
    FROM
        plans_plan
    WHERE
        is_fixed_investment = 1 AND is_deleted = 0 AND is_archived = 0
),
combined AS (
    SELECT
        plan_id,
        owner_id,
        'Savings' AS type,
        last_transaction_date
    FROM
        recent_savings
    UNION ALL
    SELECT
        plan_id,
        owner_id,
        'Investment' AS type,
        last_transaction_date
    FROM
        recent_investments
)
SELECT
    plan_id,
    owner_id,
    type,
    last_transaction_date,
    DATEDIFF(CURDATE(), last_transaction_date) AS inactivity_days
FROM
    combined
WHERE
    last_transaction_date < CURDATE() - INTERVAL 365 DAY
ORDER BY
    inactivity_days DESC
-- Date: 2025-05-17 15:17
*/
