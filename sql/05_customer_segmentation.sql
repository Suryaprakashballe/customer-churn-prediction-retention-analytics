USE bank_churn_analytics;

SELECT
    CustomerId,
    Age,
    Balance,
    IsActiveMember,
    Geography,
    NumOfProducts,
    Exited,
    CASE
        WHEN Exited = 1 THEN 'Churned'
        WHEN IsActiveMember = 0
             AND Age >= 45
             AND Balance > 100000
            THEN 'High Retention Priority'
        WHEN IsActiveMember = 0
             OR Age >= 45
            THEN 'Medium Retention Priority'
        ELSE 'Lower Retention Priority'
    END AS retention_segment
FROM customers;

SELECT
    Geography,
    COUNT(*) AS high_priority_customers,
    ROUND(AVG(Balance), 2) AS avg_balance,
    ROUND(AVG(Age), 2) AS avg_age
FROM customers
WHERE Exited = 0
  AND IsActiveMember = 0
  AND Age >= 45
  AND Balance > 100000
GROUP BY Geography
ORDER BY high_priority_customers DESC;

SELECT
    CustomerId,
    Geography,
    Gender,
    Age,
    Balance,
    NumOfProducts,
    EstimatedSalary
FROM customers
WHERE Exited = 0
  AND IsActiveMember = 0
  AND Balance > 100000
ORDER BY Balance DESC
LIMIT 25;

SELECT
    COUNT(*) AS customers,
    ROUND(SUM(Balance), 2) AS total_balance,
    ROUND(AVG(Balance), 2) AS average_balance
FROM customers
WHERE Exited = 0
  AND IsActiveMember = 0
  AND Balance > 100000;
  
  WITH churn_summary AS (
    SELECT
        Geography,
        COUNT(*) AS customers,
        SUM(Exited) AS churned_customers,
        AVG(Exited) * 100 AS churn_rate
    FROM customers
    GROUP BY Geography
)
SELECT
    Geography,
    customers,
    churned_customers,
    ROUND(churn_rate, 2) AS churn_rate
FROM churn_summary
ORDER BY churn_rate DESC;

WITH age_activity AS (
    SELECT
        CASE
            WHEN Age BETWEEN 18 AND 25 THEN '18-25'
            WHEN Age BETWEEN 26 AND 35 THEN '26-35'
            WHEN Age BETWEEN 36 AND 45 THEN '36-45'
            WHEN Age BETWEEN 46 AND 55 THEN '46-55'
            WHEN Age BETWEEN 56 AND 65 THEN '56-65'
            ELSE '66+'
        END AS age_group,
        CASE
            WHEN IsActiveMember = 1 THEN 'Active'
            ELSE 'Inactive'
        END AS activity_status,
        COUNT(*) AS customers,
        SUM(Exited) AS churned_customers
    FROM customers
    GROUP BY age_group, activity_status
)
SELECT
    age_group,
    activity_status,
    customers,
    churned_customers,
    ROUND(churned_customers * 100.0 / customers, 2) AS churn_rate
FROM age_activity
ORDER BY churn_rate DESC;

WITH geography_churn AS (
    SELECT
        Geography,
        COUNT(*) AS customers,
        SUM(Exited) AS churned_customers,
        AVG(Exited) * 100 AS churn_rate
    FROM customers
    GROUP BY Geography
)
SELECT
    Geography,
    customers,
    churned_customers,
    ROUND(churn_rate, 2) AS churn_rate,
    RANK() OVER (
        ORDER BY churn_rate DESC
    ) AS churn_rank
FROM geography_churn;

WITH age_churn AS (
    SELECT
        CASE
            WHEN Age BETWEEN 18 AND 25 THEN '18-25'
            WHEN Age BETWEEN 26 AND 35 THEN '26-35'
            WHEN Age BETWEEN 36 AND 45 THEN '36-45'
            WHEN Age BETWEEN 46 AND 55 THEN '46-55'
            WHEN Age BETWEEN 56 AND 65 THEN '56-65'
            ELSE '66+'
        END AS age_group,
        COUNT(*) AS customers,
        AVG(Exited) * 100 AS churn_rate
    FROM customers
    GROUP BY age_group
)
SELECT
    age_group,
    customers,
    ROUND(churn_rate, 2) AS churn_rate,
    RANK() OVER (
        ORDER BY churn_rate DESC
    ) AS risk_rank
FROM age_churn
ORDER BY risk_rank;

