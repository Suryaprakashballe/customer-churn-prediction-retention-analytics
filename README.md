# 📊 Customer Churn Prediction & Retention Analytics

![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-XGBoost-orange)
![SQL](https://img.shields.io/badge/SQL-MySQL-blue?logo=mysql)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)
![SHAP](https://img.shields.io/badge/Explainability-SHAP-purple)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

An end-to-end customer churn analytics project that combines **exploratory data analysis, feature engineering, machine learning, SHAP-based explainability, customer risk segmentation, SQL analytics, and Power BI visualization** to identify customers at higher risk of churn and prioritize retention efforts.

---

## 📌 Executive Summary

Customer churn can negatively affect recurring revenue and customer lifetime value. The objective of this project is to build an analytical system that can:

- Identify customers with a higher probability of churn
- Understand the behavioral and demographic factors associated with churn
- Compare multiple machine learning models
- Optimize the classification threshold for a practical operating point
- Explain model predictions using SHAP
- Segment customers into actionable risk levels
- Prioritize customers for retention intervention
- Provide business-oriented insights through SQL and Power BI

The project follows an end-to-end workflow from **raw customer data to predictive modeling and retention prioritization**.

---

## ⭐ Project Highlights

| Area | Implementation |
|---|---|
| 📊 Data Analysis | Exploratory analysis of 10,000 banking customers |
| 🛠️ Feature Engineering | Age, balance, activity, and interaction features |
| 🤖 Machine Learning | Logistic Regression, Random Forest & XGBoost |
| 🏆 Final Model | Optimized XGBoost |
| 📈 ROC-AUC | **0.863** |
| 📊 PR-AUC | **0.714** |
| 🎚️ Threshold Optimization | Operating threshold of **0.35** |
| 🔎 Explainability | SHAP-based feature analysis |
| 👥 Risk Segmentation | Low, Moderate, High & Very High |
| 🎯 Retention Strategy | Risk × Customer Value prioritization |
| 🗄️ SQL | MySQL customer and churn analytics |
| 📊 Visualization | Interactive Power BI dashboard |

---

## 🎯 Business Problem

A bank needs to identify customers who are likely to leave so that retention teams can prioritize their efforts.

A simple churn prediction model is not enough. The business also needs to understand:

1. **Who is likely to churn?**
2. **What factors are associated with churn?**
3. **How confident is the model?**
4. **Which customers should be prioritized?**
5. **What customer characteristics can guide retention actions?**

This project addresses these questions through a combination of machine learning and business analytics.

---

## 🎯 Project Objectives

### Predictive Analytics

- Build baseline churn classification models
- Compare multiple machine learning algorithms
- Optimize the strongest model
- Evaluate performance using appropriate classification metrics

### Explainable AI

- Identify important churn drivers
- Use SHAP to explain model behavior
- Understand how customer characteristics influence churn predictions

### Customer Segmentation

- Classify customers into risk categories
- Identify high-priority customer groups
- Analyze risk across activity, geography, and product ownership

### Business Analytics

- Perform customer and churn analysis using MySQL
- Develop retention prioritization logic
- Visualize insights using Power BI

---

## 📊 Dataset

The project uses a banking customer churn dataset containing **10,000 customer records**.

### Key Variables

| Feature | Description |
|---|---|
| CreditScore | Customer credit score |
| Geography | Customer's country |
| Gender | Customer gender |
| Age | Customer age |
| Tenure | Number of years with the bank |
| Balance | Customer account balance |
| NumOfProducts | Number of banking products held |
| HasCrCard | Whether the customer has a credit card |
| IsActiveMember | Whether the customer is an active member |
| EstimatedSalary | Estimated customer salary |
| Exited | Churn target variable |

### Target Variable

`Exited`

- `1` → Customer churned
- `0` → Customer remained

Additional engineered features were created to improve analytical interpretation and segmentation.

---

## 🔍 Exploratory Data Analysis

The exploratory analysis examines:

- Overall churn distribution
- Numerical feature distributions
- Categorical feature relationships
- Churn rates across customer segments
- Customer activity patterns
- Balance-related patterns
- Product ownership
- Age-based patterns
- Geographic differences

The EDA phase was used to identify potential churn patterns before developing predictive models.

---

## 🛠️ Feature Engineering

Additional features were created to improve interpretability and capture meaningful customer segments.

### Engineered Features

| Feature | Purpose |
|---|---|
| `AgeGroup` | Groups customers into interpretable age ranges |
| `BalanceStatus` | Classifies customers according to account balance |
| `ActivityStatus` | Represents active/inactive customer behavior |
| `AgeActivity` | Captures the interaction between age group and activity status |

Identifier fields that do not provide useful predictive information were excluded from model training.

---

## 🤖 Machine Learning

The project evaluates multiple classification approaches.

### Models

- Majority-class baseline
- Logistic Regression
- Random Forest
- XGBoost

The modeling workflow includes:

1. Train-test splitting
2. Feature preprocessing
3. Model training
4. Performance evaluation
5. Model comparison
6. Hyperparameter optimization
7. Threshold analysis

Because churn prediction is an imbalanced classification problem, **ROC-AUC and PR-AUC** are considered alongside precision, recall, F1-score, and accuracy.

---

## 📈 Model Performance

The evaluated models produced the following results:

| Model | ROC-AUC | PR-AUC |
|---|---:|---:|
| Logistic Regression | 0.851 | 0.695 |
| Random Forest | 0.862 | 0.691 |
| **XGBoost** | **0.863** | **0.714** |

### Final XGBoost Performance

| Metric | Score |
|---|---:|
| Accuracy | **85.4%** |
| Precision | **65.0%** |
| Recall | **61.2%** |
| F1-Score | **63.0%** |
| ROC-AUC | **0.863** |
| PR-AUC | **0.714** |

### Selected Model

**Optimized XGBoost**

The optimized XGBoost model achieved the strongest overall ROC-AUC and PR-AUC among the evaluated models.

---

## 🎚️ Classification Threshold Optimization

Instead of automatically using the default classification threshold of `0.50`, multiple probability thresholds were evaluated.

| Threshold | Precision | Recall | F1-Score |
|---:|---:|---:|---:|
| 0.20 | 49.8% | 74.4% | 59.6% |
| 0.25 | 55.3% | 71.7% | 62.5% |
| 0.30 | 59.2% | 66.3% | 62.6% |
| **0.35** | **65.0%** | **61.2%** | **63.0%** |
| 0.40 | 68.6% | 58.0% | 62.8% |
| 0.50 | 78.5% | 51.1% | 61.9% |

An operating threshold of **0.35** was selected based on the precision-recall trade-off and the resulting F1 performance.

This allows the model to operate at a more appropriate decision point than simply assuming a universal `0.50` threshold.

---

## 🔎 Model Explainability with SHAP

Model predictions were analyzed using **SHAP (SHapley Additive exPlanations)** to understand which features contribute most strongly to churn predictions.

The analysis helps answer:

> **Why does the model consider a customer high risk?**

Important features identified through the explainability analysis include:

- `NumOfProducts`
- `Age`
- `Geography`
- `Gender`
- `ActivityStatus`
- `AgeActivity`
- `Balance`
- `CreditScore`

`NumOfProducts` showed the strongest contribution among the analyzed features based on mean absolute SHAP importance.

SHAP analysis makes the model more interpretable and supports the transition from **prediction to actionable customer analysis**.

---

## 👥 Customer Risk Segmentation

The project converts churn predictions into actionable customer risk categories.

### Risk Levels

- 🟢 **Low Risk**
- 🟡 **Moderate Risk**
- 🟠 **High Risk**
- 🔴 **Very High Risk**

This segmentation allows retention teams to focus resources on customers who require greater attention instead of treating every customer equally.

Risk patterns were further analyzed across:

- Customer activity
- Geography
- Number of products
- Customer demographics
- Account balance characteristics

---

## 🎯 Retention Prioritization Strategy

The project extends churn prediction into a **customer retention prioritization framework**.

A Customer Value Proxy is used to help prioritize customers because the dataset does not contain actual:

- Customer Lifetime Value
- Profit
- Revenue contribution
- Transaction history
- Historical retention campaign outcomes

Therefore, the retention prioritization framework should be interpreted as an **analytical decision-support framework rather than a causal estimate of financial impact**.

### Prioritization Logic

Customers can be prioritized based on a combination of:

- Churn risk
- Customer value proxy
- Activity status
- Geography
- Product ownership

The resulting framework helps identify customer groups that may deserve different levels of retention attention.

---

## 🗄️ SQL Analytics

MySQL was used to perform customer and churn-focused analytical queries.

The SQL analysis includes:

- Database setup
- Data validation
- Customer KPI analysis
- Churn analysis
- Customer segmentation
- Analytical views

The SQL layer demonstrates how predictive outputs can be combined with structured business analytics for reporting and decision-making.

---

## 📊 Power BI Dashboard

An interactive Power BI dashboard was developed to translate the churn prediction and retention analysis into business-facing insights.

### Dashboard Pages

#### 1. Bank Customer Churn & Retention Analytics

Provides an overall view of:

- Total customers
- Average predicted churn risk
- High and critical priority customers
- Customer risk distribution
- Geographic churn risk
- Age-group risk patterns
- Retention priority distribution

#### 2. Churn Drivers & Customer Risk Patterns

Analyzes predicted churn risk across:

- Age groups
- Activity status
- Number of products
- Balance status
- Geography
- Risk level

#### 3. Retention Prioritization & Action Plan

Connects customer risk with the Customer Value Proxy to support:

- Critical customer identification
- High-priority customer identification
- Risk × value analysis
- Retention priority segmentation
- Recommended retention actions
- Customer-level prioritization

### Dashboard Preview

![Bank Customer Churn & Retention Analytics](powerbi/powerbi_dashboard_preview.png)

The complete interactive Power BI report is available in the repository:

[Open the Power BI report](powerbi/Customer_churn.pbix)

---

## 🏗️ Project Workflow

```text
Raw Customer Data
       ↓
Data Understanding
       ↓
Exploratory Data Analysis
       ↓
Feature Engineering
       ↓
Baseline Models
       ↓
Model Optimization
       ↓
SHAP Explainability
       ↓
Churn Risk Prediction
       ↓
Customer Risk Segmentation
       ↓
Retention Prioritization
       ↓
SQL Analytics + Power BI
       ↓
Business Insights
