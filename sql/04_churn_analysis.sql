USE bank_churn_analytics;

SELECT
    Geography,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers
GROUP BY Geography
ORDER BY churn_rate DESC;

SELECT
    Gender,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers
GROUP BY Gender
ORDER BY churn_rate DESC;

SELECT
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS activity_status,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers
GROUP BY IsActiveMember
ORDER BY churn_rate DESC;

SELECT
    NumOfProducts,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

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
GROUP BY age_group
ORDER BY churn_rate DESC;

SELECT
    CASE
        WHEN Balance = 0 THEN 'Zero'
        WHEN Balance <= 50000 THEN '1-50K'
        WHEN Balance <= 100000 THEN '50K-100K'
        WHEN Balance <= 150000 THEN '100K-150K'
        ELSE '150K+'
    END AS balance_group,
    COUNT(*) AS customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers
GROUP BY balance_group
ORDER BY churn_rate DESC;

SELECT
    COUNT(*) AS churned_customers,
    ROUND(SUM(Balance), 2) AS total_balance,
    ROUND(AVG(Balance), 2) AS average_balance
FROM customers
WHERE Exited = 1;

SELECT
    CASE
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS customer_status,
    COUNT(*) AS customers,
    ROUND(SUM(Balance), 2) AS total_balance,
    ROUND(AVG(Balance), 2) AS average_balance
FROM customers
GROUP BY Exited;

SELECT
    CustomerId,
    Geography,
    Gender,
    Age,
    Balance,
    NumOfProducts,
    IsActiveMember,
    EstimatedSalary
FROM customers
WHERE Exited = 1
ORDER BY Balance DESC
LIMIT 20;

SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM customers;

