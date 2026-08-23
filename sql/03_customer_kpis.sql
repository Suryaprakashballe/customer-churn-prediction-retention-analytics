USE bank_churn_analytics;

SELECT
    COUNT(*) AS total_customers,
    SUM(Exited) AS churned_customers,
    COUNT(*) - SUM(Exited) AS retained_customers,
    ROUND(
        AVG(Exited) * 100,
        2
    ) AS churn_rate
FROM customers;

SELECT
    ROUND(AVG(CreditScore), 2) AS avg_credit_score,
    ROUND(AVG(Age), 2) AS avg_age,
    ROUND(AVG(Balance), 2) AS avg_balance,
    ROUND(AVG(NumOfProducts), 2) AS avg_products,
    ROUND(AVG(EstimatedSalary), 2) AS avg_salary
FROM customers;

SELECT
    ROUND(AVG(IsActiveMember) * 100, 2) AS active_member_rate,
    ROUND(AVG(HasCrCard) * 100, 2) AS credit_card_ownership_rate
FROM customers;