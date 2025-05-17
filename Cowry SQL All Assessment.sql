USE DataAnalytics_Assessment;

CREATE TABLE `plans_plan` (
  `id` char(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `last_charge_date` date DEFAULT NULL,
  `next_charge_date` date DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `frequency_id` int NOT NULL,
  `owner_id` char(32) NOT NULL,
  `status_id` int NOT NULL,
  `interest_rate` double NOT NULL,
  `withdrawal_date` date DEFAULT NULL,
  `default_plan` tinyint(1) NOT NULL,
  `plan_type_id` int NOT NULL,
  `goal` double NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `next_returns_date` date NOT NULL,
  `last_returns_date` date NOT NULL,
  `cowry_amount` int NOT NULL,
  `debit_card` char(32) DEFAULT NULL,
  `is_archived` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `is_goal_achieved` tinyint(1) NOT NULL,
  `is_a_goal` tinyint(1) NOT NULL,
  `is_interest_free` tinyint(1) NOT NULL,
  `plan_group_id` char(32) DEFAULT NULL,
  `is_deleted_from_group` tinyint(1) NOT NULL,
  `is_a_fund` tinyint(1) NOT NULL,
  `purchased_fund_id` char(32) DEFAULT NULL,
  `is_a_wallet` tinyint(1) NOT NULL,
  `currency_is_dollars` tinyint(1) NOT NULL,
  `is_auto_rollover` tinyint(1) NOT NULL,
  `is_vendor_plan` tinyint(1) NOT NULL,
  `plan_source` varchar(100) NOT NULL,
  `is_donation_plan` tinyint(1) NOT NULL,
  `donation_description` longtext NOT NULL,
  `donation_expiry_date` date DEFAULT NULL,
  `donation_link` varchar(255) DEFAULT NULL,
  `link_code` varchar(255) DEFAULT NULL,
  `charge_payment_fee` tinyint(1) NOT NULL,
  `donation_is_approved` tinyint(1) NOT NULL,
  `is_emergency_plan` tinyint(1) NOT NULL,
  `is_personal_challenge` tinyint(1) NOT NULL,
  `currency_id` int NOT NULL,
  `is_a_usd_index` tinyint(1) NOT NULL,
  `usd_index_id` char(32) DEFAULT NULL,
  `open_savings_plan` tinyint(1) NOT NULL,
  `new_cycle` tinyint(1) NOT NULL,
  `recurrence` longtext,
  `is_bloom_note` tinyint(1) NOT NULL,
  `is_managed_portfolio` tinyint(1) NOT NULL,
  `portfolio_holdings_id` char(32) DEFAULT NULL,
  `is_fixed_investment` tinyint(1) NOT NULL,
  `is_regular_savings` tinyint(1) NOT NULL,
  `preset_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plans_plan_9399d341` (`frequency_id`),
  KEY `plans_plan_5e7b1936` (`owner_id`),
  KEY `plans_plan_dc91ed4b` (`status_id`),
  KEY `plans_plan_a008eb24` (`plan_type_id`),
  KEY `plans_plan_plan_group_id_bc264c36` (`plan_group_id`),
  KEY `plans_plan_purchased_fund_id_a6ba198f` (`purchased_fund_id`),
  KEY `plans_plan_usd_index_id_b93858dd_fk_funds_usdindex_id` (`usd_index_id`),
  -- KEY `plans_plan_currency_id_bb34dd0f_fk_plans_currency_id` (`currency_id`),
  KEY `plans_plan_portfolio_holdings_i_cdb8ef74_fk_managed_p` (`portfolio_holdings_id`),
  KEY `plans_plan_preset_id_7bf30202_fk_plans_planpreset_id` (`preset_id`)

  -- CONSTRAINT `plans_plan_currency_id_bb34dd0f_fk_plans_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `plans_currency` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SELECT * FROM plans_plan;

INSERT INTO plans_plan (
  id,
  name,
  description,
  amount,
  created_on,
  frequency_id,
  owner_id,
  status_id,
  interest_rate,
  next_returns_date,
  last_returns_date,
  cowry_amount,
  plan_type_id,
  goal,
  default_plan,
  locked,
  is_archived,
  is_deleted,
  is_goal_achieved,
  is_a_goal,
  is_interest_free,
  is_deleted_from_group,
  is_a_fund,
  is_a_wallet,
  currency_id,
  is_auto_rollover,
  is_vendor_plan,
  plan_source,
  is_donation_plan,
  donation_description,
  charge_payment_fee,
  donation_is_approved,
  is_emergency_plan,
  is_personal_challenge,
  is_a_usd_index,
  open_savings_plan,
  new_cycle,
  is_bloom_note,
  is_managed_portfolio,
  is_fixed_investment,
  is_regular_savings
) VALUES (
  'plan1234567890abcdef1234567890',
  'Monthly Savings',
  'A recurring monthly savings plan',
  10000,
  NOW(),
  1,
  'user1234567890abcdef1234567890ab',
  1,
  0.05,
  '2025-06-01',
  '2025-05-01',
  10000,
  1,
  50000.00,
  1,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  'web',
  0,
  '',
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1
);

ALTER TABLE plans_plan 
MODIFY COLUMN currency_is_dollars TINYINT(1) NOT NULL DEFAULT 0;

SELECT * FROM plans_plan;

CREATE TABLE users_customuser (
  password varchar(128) NOT NULL,
  last_login datetime DEFAULT NULL,
  is_superuser tinyint(1) NOT NULL,
  id char(32) NOT NULL,
  email varchar(60) NOT NULL,
  name varchar(100) DEFAULT NULL,
  first_name varchar(100) DEFAULT NULL,
  last_name varchar(100) DEFAULT NULL,
  phone_number varchar(128) DEFAULT NULL,
  date_of_birth date DEFAULT NULL,
  is_staff tinyint(1) NOT NULL,
  is_active tinyint(1) NOT NULL,
  date_joined datetime NOT NULL,
  is_admin tinyint(1) NOT NULL,
  username varchar(25) DEFAULT NULL,
  created_on datetime NOT NULL,
  gender_id int DEFAULT NULL,
  invite_code varchar(100) DEFAULT NULL,
  avatar_firebase_reference varchar(255) DEFAULT NULL,
  avatar_local_uri varchar(255) DEFAULT NULL,
  avatar_url varchar(255) DEFAULT NULL,
  risk_apetite int NOT NULL,
  current_latitude varchar(100) DEFAULT NULL,
  current_longitude varchar(100) DEFAULT NULL,
  postal_address varchar(255) DEFAULT NULL,
  pin varchar(128) DEFAULT NULL,
  ambassador_profile_id char(32) DEFAULT NULL,
  is_ambassador tinyint(1) NOT NULL,
  account_source varchar(100) NOT NULL,
  is_vendor_account tinyint(1) NOT NULL,
  is_business_account tinyint(1) NOT NULL,
  is_account_deleted tinyint(1) NOT NULL,
  vendor_code varchar(100) NOT NULL,
  is_halal_account tinyint(1) NOT NULL,
  address_city varchar(100) DEFAULT NULL,
  address_country varchar(40) DEFAULT NULL,
  address_state varchar(40) DEFAULT NULL,
  address_street varchar(255) DEFAULT NULL,
  monthly_expense double NOT NULL,
  monthly_salary double NOT NULL,
  is_account_disabled tinyint(1) NOT NULL,
  authy_id varchar(128) DEFAULT NULL,
  fraud_score int NOT NULL,
  account_campaign varchar(150) DEFAULT NULL,
  account_medium varchar(100) DEFAULT NULL,
  last_password_change datetime(6) DEFAULT NULL,
  last_pin_change datetime(6) DEFAULT NULL,
  is_private tinyint(1) NOT NULL,
  disabled_at datetime(6) DEFAULT NULL,
  is_disabled_by_owner tinyint(1) NOT NULL,
  is_account_deleted_by_owner tinyint(1) NOT NULL,
  proposed_deletion_date datetime(6) DEFAULT NULL,
  reason_for_deletion varchar(255) DEFAULT NULL,
  enabled_at datetime(6) DEFAULT NULL,
  signup_device varchar(100) DEFAULT NULL,
  proposed_enablement_date datetime(6) DEFAULT NULL,
  tier_id int DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY email (email),
  UNIQUE KEY ambassador_profile_id (ambassador_profile_id),
  KEY users_customuser_623af7fd (gender_id),
  KEY users_customuser_tier_id_b1df8120 (tier_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO users_customuser (
  id,
  password,
  is_superuser,
  email,
  is_staff,
  is_active,
  date_joined,
  is_admin,
  created_on,
  risk_apetite,
  is_ambassador,
  account_source,
  is_vendor_account,
  is_business_account,
  is_account_deleted,
  vendor_code,
  is_halal_account,
  monthly_expense,
  monthly_salary,
  is_account_disabled,
  fraud_score,
  is_private,
  is_disabled_by_owner,
  is_account_deleted_by_owner
) VALUES (
  '1234567890abcdef1234567890abcdef',  -- id
  'hashed_password_here',              -- password
  0,                                   -- is_superuser
  'user@example.com',                  -- email
  0,                                   -- is_staff
  1,                                   -- is_active
  NOW(),                               -- date_joined
  0,                                   -- is_admin
  NOW(),                               -- created_on
  3,                                   -- risk_apetite
  0,                                   -- is_ambassador
  'website',                           -- account_source
  0,                                   -- is_vendor_account
  0,                                   -- is_business_account
  0,                                   -- is_account_deleted
  'VENDOR123',                         -- vendor_code
  0,                                   -- is_halal_account
  1000.00,                             -- monthly_expense
  3000.00,                             -- monthly_salary
  0,                                   -- is_account_disabled
  0,                                   -- fraud_score
  0,                                   -- is_private
  0,                                   -- is_disabled_by_owner
  0                                    -- is_account_deleted_by_owner
);
SELECT * FROM users_customuser;

CREATE TABLE savings_savingsaccount (
  id int NOT NULL AUTO_INCREMENT,
  savings_id char(32) DEFAULT NULL,
  maturity_start_date datetime NOT NULL,
  maturity_end_date datetime NOT NULL,
  amount double NOT NULL,
  confirmed_amount double NOT NULL,
  deduction_amount double NOT NULL,
  new_balance double NOT NULL,
  transaction_date datetime NOT NULL,
  transaction_reference varchar(200) NOT NULL,
  transaction_status varchar(200) NOT NULL,
  verification_call_amount varchar(200) NOT NULL,
  verification_call_message varchar(100) NOT NULL,
  verification_call_code varchar(50) NOT NULL,
  verification_transaction_date datetime DEFAULT NULL,
  book_returns double NOT NULL,
  available_returns double NOT NULL,
  returns_on_hold double NOT NULL,
  last_returns_date date NOT NULL,
  next_returns_date date NOT NULL,
  created_on datetime NOT NULL,
  card_billed_id char(32) DEFAULT NULL,
  channel_id int NOT NULL,
  charging_method_id int NOT NULL,
  owner_id char(32) NOT NULL,
  plan_id char(32) NOT NULL,
  transaction_type_id int NOT NULL,
  verification_status_id int NOT NULL,
  gateway_response_message varchar(100) DEFAULT NULL,
  fee_in_kobo double NOT NULL,
  donor_id char(32) DEFAULT NULL,
  is_anonymous tinyint(1) NOT NULL,
  description varchar(255) NOT NULL,
  payment_gateway varchar(200) DEFAULT NULL,
  source_bank_account varchar(100) DEFAULT NULL,
  currency varchar(3) DEFAULT NULL,
  fee_in_cents double NOT NULL,
  PRIMARY KEY (id),
  KEY savings_savingsaccount_55544590 (card_billed_id),
  KEY savings_savingsaccount_72eb6c85 (channel_id),
  KEY savings_savingsaccount_298adb2d (charging_method_id),
  KEY savings_savingsaccount_5e7b1936 (owner_id),
  KEY savings_savingsaccount_60fb6a05 (plan_id),
  KEY savings_savingsaccount_92c431dc (transaction_type_id),
  KEY savings_savingsaccount_f09c92ce (verification_status_id),
  KEY savings_savingsaccount_donor_id_d8419ce7 (donor_id),
  KEY idx_description (description)
) ENGINE=InnoDB AUTO_INCREMENT=174451 DEFAULT CHARSET=latin1;

INSERT INTO savings_savingsaccount (
  maturity_start_date,
  maturity_end_date,
  amount,
  confirmed_amount,
  deduction_amount,
  new_balance,
  transaction_date,
  transaction_reference,
  transaction_status,
  verification_call_amount,
  verification_call_message,
  verification_call_code,
  book_returns,
  available_returns,
  returns_on_hold,
  last_returns_date,
  next_returns_date,
  created_on,
  channel_id,
  charging_method_id,
  owner_id,
  plan_id,
  transaction_type_id,
  verification_status_id,
  fee_in_kobo,
  is_anonymous,
  description,
  fee_in_cents
) VALUES (
  NOW(),
  DATE_ADD(NOW(), INTERVAL 1 YEAR),
  5000.00,
  5000.00,
  0.00,
  5000.00,
  NOW(),
  'TXN123456789',
  'completed',
  '5000',
  'Verified successfully',
  '200',
  100.00,
  100.00,
  0.00,
  CURDATE(),
  DATE_ADD(CURDATE(), INTERVAL 1 MONTH),
  NOW(),
  1,  -- channel_id
  1,  -- charging_method_id
  '1234567890abcdef1234567890abcdef', -- owner_id
  'abcdef1234567890abcdef1234567890', -- plan_id
  1,  -- transaction_type_id
  1,  -- verification_status_id
  50.00,
  0,
  'First deposit',
  0.50
);

SELECT * FROM savings_savingsaccount;

/* Assessment Question 1 */
SELECT
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    ROUND(SUM(IFNULL(s.confirmed_amount, 0)) + SUM(IFNULL(p.amount, 0)), 2) AS total_deposits
FROM
    users_customuser u
LEFT JOIN savings_savingsaccount s 
    ON s.owner_id = u.id AND s.transaction_status = 'successful'
LEFT JOIN plans_plan p 
    ON p.owner_id = u.id AND p.is_fixed_investment = 1 AND p.status_id IN (1, 2)  -- replace with actual "active/funded" status IDs
WHERE
    s.id IS NOT NULL AND
    p.id IS NOT NULL
GROUP BY
    u.id, u.name
ORDER BY
    total_deposits DESC;

/* Assessment Question 2 */
WITH monthly_tx_counts AS (
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
    FIELD(frequency_category, 'High Frequency', 'Medium Frequency', 'Low Frequency');

/* Assessment Question 3 */
WITH recent_savings AS (
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
    inactivity_days DESC;

/* Assessment Question 4*/
WITH transaction_data AS (
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
ORDER BY estimated_clv DESC;