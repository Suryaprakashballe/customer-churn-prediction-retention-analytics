CREATE OR REPLACE VIEW vw_churn_by_geography AS
SELECT
    Geography,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers
GROUP BY Geography;


CREATE OR REPLACE VIEW vw_churn_kpis AS
SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    COUNT(*) - SUM(Exited) AS retained_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate,
    ROUND(AVG(CreditScore), 2) AS avg_credit_score,
    ROUND(AVG(Age), 2) AS avg_age,
    ROUND(AVG(Balance), 2) AS avg_balance,
    ROUND(AVG(IsActiveMember) * 100, 2) AS active_member_rate
FROM customers;

CREATE OR REPLACE VIEW vw_churn_by_activity AS
SELECT
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers
GROUP BY IsActiveMember;

CREATE OR REPLACE VIEW vw_churn_by_products AS
SELECT
    NumOfProducts,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers
GROUP BY NumOfProducts;

CREATE OR REPLACE VIEW vw_churn_by_age AS
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
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers
GROUP BY age_group;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';