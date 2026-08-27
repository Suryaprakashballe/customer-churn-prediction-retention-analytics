# 📊 Customer Churn Prediction & Retention Analytics

![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-XGBoost-orange)
![SQL](https://img.shields.io/badge/SQL-MySQL-blue?logo=mysql)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)
![SHAP](https://img.shields.io/badge/Explainability-SHAP-purple)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

An end-to-end customer churn analytics project combining **exploratory data analysis, feature engineering, machine learning, SHAP-based explainability, customer risk segmentation, SQL analytics, and Power BI visualization** to identify customers at higher risk of churn and support retention prioritization.

---

## 📌 Executive Summary

Customer churn can negatively affect recurring revenue and customer lifetime value. This project develops an end-to-end analytical workflow to identify customers who are more likely to churn and translate model predictions into actionable customer risk segments.

The project combines:

- Exploratory data analysis
- Feature engineering
- Machine learning
- Model optimization
- Classification threshold analysis
- SHAP-based explainability
- Customer risk segmentation
- Retention prioritization
- MySQL analytics
- Power BI visualization

The overall workflow moves from **raw customer data → predictive modeling → explainability → customer risk segmentation → retention analytics**.

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
| 🔎 Explainability | SHAP-based model analysis |
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
3. **How well does the model identify potential churners?**
4. **Which customers should be prioritized?**
5. **What customer characteristics can guide retention actions?**

This project addresses these questions through a combination of **machine learning, explainable AI, SQL analytics, and business intelligence**.

---

## 🎯 Project Objectives

### Predictive Analytics

- Build baseline churn classification models
- Compare multiple machine learning algorithms
- Optimize the strongest model
- Evaluate model performance using multiple classification metrics
- Analyze different probability thresholds

### Explainable AI

- Identify important churn-related features
- Use SHAP to explain model predictions
- Understand how customer characteristics influence predicted churn risk

### Customer Segmentation

- Convert churn probabilities into actionable risk levels
- Identify high-priority customer groups
- Analyze risk across activity, geography, demographics, balance, and product ownership

### Business Analytics

- Perform customer and churn analysis using MySQL
- Develop a retention prioritization framework
- Visualize customer risk and retention insights using Power BI

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

Additional engineered features were created during the project to improve analytical interpretation and customer segmentation.

---

## 🔍 Exploratory Data Analysis

The exploratory analysis examines customer characteristics and their relationship with churn.

Key areas include:

- Overall churn distribution
- Numerical feature distributions
- Categorical feature relationships
- Churn rates across customer segments
- Customer activity patterns
- Balance-related patterns
- Product ownership
- Age-based patterns
- Geographic differences

The EDA phase was used to identify meaningful patterns and potential churn drivers before developing predictive models.

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

### Modeling Workflow

1. Train-test splitting
2. Feature preprocessing
3. Baseline model development
4. Model comparison
5. Hyperparameter optimization
6. Final model selection
7. Probability threshold analysis
8. Model evaluation

Because churn prediction is an imbalanced classification problem, the analysis considers **ROC-AUC and PR-AUC** alongside precision, recall, F1-score, and accuracy.

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

The optimized XGBoost model achieved the strongest ROC-AUC and PR-AUC among the evaluated models.

---

## 🎚️ Classification Threshold Optimization

The default classification threshold of `0.50` was not treated as automatically optimal.

Multiple probability thresholds were evaluated to understand the trade-off between precision and recall.

| Threshold | Precision | Recall | F1-Score |
|---:|---:|---:|---:|
| 0.20 | 49.8% | 74.4% | 59.6% |
| 0.25 | 55.3% | 71.7% | 62.5% |
| 0.30 | 59.2% | 66.3% | 62.6% |
| **0.35** | **65.0%** | **61.2%** | **63.0%** |
| 0.40 | 68.6% | 58.0% | 62.8% |
| 0.50 | 78.5% | 51.1% | 61.9% |

An operating threshold of **0.35** was selected based on the precision-recall trade-off and resulting F1 performance.

This demonstrates why classification thresholds should be considered in the context of the intended business use rather than automatically assuming `0.50`.

---

## 🔎 Model Explainability with SHAP

The final model was analyzed using **SHAP (SHapley Additive exPlanations)** to understand which features contribute most strongly to churn predictions.

The analysis helps answer:

> **Why does the model consider a customer high risk?**

Important features analyzed include:

- `NumOfProducts`
- `Age`
- `Geography`
- `Gender`
- `ActivityStatus`
- `AgeActivity`
- `Balance`
- `CreditScore`

`NumOfProducts` showed the strongest contribution among the analyzed features based on mean absolute SHAP importance.

SHAP improves model transparency by connecting predictions with interpretable feature-level contributions.

---

## 👥 Customer Risk Segmentation

Churn probabilities were converted into actionable customer risk categories.

### Risk Levels

- 🟢 **Low Risk**
- 🟡 **Moderate Risk**
- 🟠 **High Risk**
- 🔴 **Very High Risk**

Risk segmentation allows retention teams to prioritize customers according to their predicted churn risk rather than treating all customers equally.

Risk patterns were further analyzed across:

- Customer activity
- Geography
- Number of products
- Customer demographics
- Account balance characteristics

---

## 🎯 Retention Prioritization Strategy

The project extends churn prediction into a **customer retention prioritization framework**.

A Customer Value Proxy is used to help prioritize customers because the benchmark dataset does not contain actual:

- Customer Lifetime Value
- Profit
- Revenue contribution
- Transaction history
- Historical retention campaign outcomes

Therefore, the retention prioritization framework should be interpreted as an **analytical decision-support framework rather than a causal estimate of financial impact**.

### Prioritization Factors

Customers can be prioritized using a combination of:

- Churn risk
- Customer value proxy
- Activity status
- Geography
- Product ownership

This framework helps identify customer groups that may deserve different levels of retention attention.

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
- Predicted churn risk
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

[Open the Power BI report](powerbi/customer_churn_retention_dashboard.pbix)

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
```

## 📁 Project Structure

```
customer-churn-prediction-retention-analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── models/
│   └── model_config.json
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_eda.ipynb
│   ├── 03_feature_engineering.ipynb
│   ├── 04_baseline_models.ipynb
│   ├── 05_model_optimization.ipynb
│   ├── 06_model_explainability.ipynb
│   └── 07_retention_strategy.ipynb
│
├── powerbi/
│   ├── customer_churn_retention_dashboard.pbix
│   └── powerbi_dashboard_preview.png
│
├── reports/
│   ├── baseline_model_results.csv
│   ├── optimized_model_results.csv
│   ├── final_model_metrics.csv
│   ├── optimized_xgboost_threshold_analysis.csv
│   ├── feature_importance_comparison.csv
│   ├── retention_prioritization.csv
│   ├── retention_summary.csv
│   └── feature_dictionary.md
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_validation.sql
│   ├── 03_customer_kpis.sql
│   ├── 04_churn_analysis.sql
│   ├── 05_customer_segmentation.sql
│   └── 06_analytical_views.sql
│
├── .gitignore
├── README.md
└── requirements.txt
```

## 📓 Notebook Guide

| Notebook | Purpose |
|---|---|
| 01_data_understanding.ipynb | Dataset structure, quality checks and initial analysis |
| 02_eda.ipynb | Exploratory data analysis and churn patterns |
| 03_feature_engineering.ipynb | Feature creation and preprocessing |
| 04_baseline_models.ipynb | Baseline model development and evaluation |
| 05_model_optimization.ipynb | Model comparison, optimization and threshold analysis |
| 06_model_explainability.ipynb | SHAP-based model interpretation |
| 07_retention_strategy.ipynb | Risk segmentation and retention prioritization |

## 🧰 Tech Stack

**Programming & Data Analysis**
Python, Pandas, NumPy

**Visualization**
Matplotlib, Seaborn, Power BI

**Machine Learning**
Scikit-learn, XGBoost

**Explainable AI**
SHAP

**Database & Analytics**
MySQL, SQL

**Development & Version Control**
Jupyter Notebook, Git, GitHub

## 🚀 How to Run

### 1. Clone the Repository
```
git clone https://github.com/Suryaprakashballe/customer-churn-prediction-retention-analytics.git
cd customer-churn-prediction-retention-analytics
```

### 2. Create a Virtual Environment
```
python -m venv venv
```
Activate it on Windows:
```
venv\Scripts\activate
```

### 3. Install Dependencies
```
pip install -r requirements.txt
```

### 4. Run the Analysis

Open Jupyter Notebook and run the notebooks in the following order:
```
01_data_understanding.ipynb
02_eda.ipynb
03_feature_engineering.ipynb
04_baseline_models.ipynb
05_model_optimization.ipynb
06_model_explainability.ipynb
07_retention_strategy.ipynb
```

### 5. Run SQL Analytics

Import the required dataset into MySQL and execute the SQL scripts in the sql/ directory in the following order:
```
01_database_setup.sql
02_data_validation.sql
03_customer_kpis.sql
04_churn_analysis.sql
05_customer_segmentation.sql
06_analytical_views.sql
```

### 6. Explore the Power BI Dashboard

Open the Power BI report located at:
```
powerbi/customer_churn_retention_dashboard.pbix
```
The dashboard preview is available in the powerbi/ directory.

## 📌 Key Results

**Predictive Performance**
- ROC-AUC: 0.863
- PR-AUC: 0.714
- Accuracy: 85.4%
- Precision: 65.0%
- Recall: 61.2%
- F1-Score: 63.0%

**Decision Optimization**
- Selected operating threshold: 0.35
- Threshold analysis demonstrated the trade-off between precision and recall.

**Explainability**
- SHAP was used to identify the strongest model drivers.
- NumOfProducts was the strongest feature by mean absolute SHAP importance among the analyzed features.

**Customer Analytics**
- Customers were segmented into Low, Moderate, High, and Very High risk categories.
- Retention priorities were developed using churn risk and a customer value proxy.
- SQL and Power BI were used to convert analytical results into business-facing insights.

## ⚠️ Project Limitations

This project uses a benchmark banking churn dataset and therefore has several limitations:

- No actual customer lifetime value is available.
- No transaction history is available.
- No historical retention campaign outcomes are available.
- The Customer Value Proxy is not equivalent to actual customer profitability.
- Retention recommendations are not causal estimates.
- Model performance on this benchmark dataset may not represent performance on real production data.
- The model should be retrained and validated using organization-specific data before operational deployment.

These limitations should be considered when interpreting the retention prioritization results.

## 🔮 Future Improvements

Potential extensions include:

- Probability calibration
- Model monitoring
- Automated retraining pipelines
- Real-time churn scoring
- API deployment
- Streamlit-based prediction interface
- Integration with CRM systems
- A/B testing of retention interventions
- Incorporating transaction-level data
- Incorporating actual Customer Lifetime Value
- Monitoring model drift and performance over time

## 👨‍💻 Author

**Surya Prakash Balle**

Aspiring Data Analyst / Data Scientist

Skills: Python • SQL • Power BI • Machine Learning • Data Visualization • Statistical Analysis • Explainable AI
