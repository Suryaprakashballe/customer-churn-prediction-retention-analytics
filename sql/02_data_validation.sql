USE bank_churn_analytics;

SELECT
    COUNT(*) AS total_rows,
    SUM(CustomerId IS NULL) AS missing_customer_id,
    SUM(CreditScore IS NULL) AS missing_credit_score,
    SUM(Geography IS NULL) AS missing_geography,
    SUM(Gender IS NULL) AS missing_gender,
    SUM(Age IS NULL) AS missing_age,
    SUM(Tenure IS NULL) AS missing_tenure,
    SUM(Balance IS NULL) AS missing_balance,
    SUM(NumOfProducts IS NULL) AS missing_products,
    SUM(HasCrCard IS NULL) AS missing_credit_card,
    SUM(IsActiveMember IS NULL) AS missing_activity,
    SUM(EstimatedSalary IS NULL) AS missing_salary,
    SUM(Exited IS NULL) AS missing_exited
FROM customers;

SELECT
    CustomerId,
    COUNT(*) AS customer_count
FROM customers
GROUP BY CustomerId
HAVING COUNT(*) > 1;

SELECT
    Exited,
    COUNT(*) AS customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM customers),
        2
    ) AS percentage
FROM customers
GROUP BY Exited
ORDER BY Exited;

SELECT DISTINCT Geography
FROM customers
ORDER BY Geography;

SELECT DISTINCT Gender
FROM customers
ORDER BY Gender;

SELECT DISTINCT Exited
FROM customers
ORDER BY Exited;

SELECT
    MIN(CreditScore) AS min_credit_score,
    MAX(CreditScore) AS max_credit_score,
    MIN(Age) AS min_age,
    MAX(Age) AS max_age,
    MIN(Tenure) AS min_tenure,
    MAX(Tenure) AS max_tenure,
    MIN(NumOfProducts) AS min_products,
    MAX(NumOfProducts) AS max_products
FROM customers;

