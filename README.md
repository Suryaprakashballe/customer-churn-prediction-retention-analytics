# Surya Customer Churn Prediction and Retention Analytics

## Project Overview

This project analyzes bank customer churn and converts predictive model output into a retention strategy. It consolidates the original seven-notebook workflow into a final evaluator-ready notebook.

## Problem Statement

Customer churn reduces revenue and customer lifetime value. The goal is to identify customers likely to leave and prioritize retention action.

## Objectives

- Analyze churn patterns across customer and account attributes.
- Prepare a cleaned modeling dataset without identifier leakage.
- Compare baseline and optimized machine learning models.
- Select and evaluate a final XGBoost model.
- Explain model behavior using SHAP and XGBoost feature importance.
- Build customer risk and retention priority segments.
- Separate implemented AI/ML work from future Generative AI enhancement ideas.

## Dataset

- Records: 10,000
- Columns: 14
- Target: `Exited`
- Churned customers: 2,037
- Stayed customers: 7,963
- Overall churn rate: 20.37%
- Missing values: 0

## Dataset Source

The project uses the supplied bank customer churn dataset located at `data/raw/bank_customer_churn.csv`.

## Technologies

Python, pandas, NumPy, scikit-learn, XGBoost, SHAP, matplotlib, seaborn, joblib, SQL, Jupyter Notebook, and Power BI.

## Project Workflow

1. Data understanding
2. Data cleaning
3. Exploratory data analysis
4. Feature engineering
5. Model preparation
6. Baseline modeling
7. Model optimization
8. Final XGBoost evaluation
9. Threshold comparison
10. SHAP explainability
11. Customer risk analysis
12. Retention strategy

## Repository Structure

```text
data/raw/bank_customer_churn.csv
data/processed/
notebooks/
models/
reports/
sql/
powerbi/Customer_churn.pbix
Surya_Customer_Churn_Analytics.ipynb
Surya_Customer_Churn_ProjectReport.docx
requirements.txt
README.md
```

## Data Cleaning

The raw dataset was verified as complete, with no missing values. Identifier fields such as `RowNumber`, `CustomerId`, and `Surname` were excluded from training.

## EDA

Key verified churn patterns:

- Germany has the highest churn rate at 32.44%.
- Female customers have a churn rate of 25.07%, compared with 16.46% for male customers.
- Age groups 46-55 and 56-65 have the highest churn rates.
- Inactive customers have higher churn than active customers.
- Customers with 3 or 4 products have very high churn rates.

## Machine Learning

Baseline models included naive baseline, Logistic Regression, Random Forest, and XGBoost. Optimized models included Logistic Regression, Random Forest, and XGBoost. The selected final model is optimized XGBoost.

## Model Evaluation

Operational threshold from `model_config.json`: 0.35.

| Metric | Score |
| --- | --- |
| Accuracy | 0.8540 |
| Precision | 0.6501 |
| Recall | 0.6118 |
| F1 | 0.6304 |
| ROC-AUC | 0.8631 |
| PR-AUC | 0.7139 |

## Threshold Comparison

| Threshold | Precision | Recall | F1 |
| --- | --- | --- | --- |
| 0.35 | 0.6501 | 0.6118 | 0.6304 |
| 0.50 | 0.7849 | 0.5111 | 0.6190 |

The verified files show that threshold 0.35 improves recall and F1, while threshold 0.50 improves precision. Threshold choice should depend on the cost of false positives versus false negatives.

## Explainability

SHAP and native XGBoost feature importance were both retained. They differ because SHAP measures average contribution to predictions, while native XGBoost importance reflects tree splitting behavior.

Top SHAP signals include number of products, age, Germany, gender, activity, balance, credit score, and estimated salary.

## Retention Strategy

The project creates `RiskScore`, `RiskLevel`, `CustomerValueScore`, `CustomerValueSegment`, `RetentionPriority`, and `RecommendedAction`.

| Priority | Customers | Percentage |
| --- | --- | --- |
| Monitor | 7616 | 76.16% |
| Medium | 649 | 6.49% |
| High | 1009 | 10.09% |
| Critical | 726 | 7.26% |

## Key Findings

- Churn risk is concentrated in specific geography, age, activity, and product groups.
- Optimized XGBoost provides the final predictive model.
- Threshold 0.35 is the saved operational threshold for retention prioritization.
- Retention actions should focus first on critical and high-priority customer segments.

## Business Recommendations

- Prioritize outreach to critical and high-priority customers.
- Investigate Germany-specific churn drivers.
- Review product experience for customers with 3 or 4 products.
- Increase engagement programs for inactive customers.
- Use model explanations to guide transparent business discussions.

## AI Enhancement

Implemented: machine learning, XGBoost, SHAP explainability, risk scoring, and retention segmentation.

Future AI enhancement: natural-language churn insights, automated risk summaries, personalized retention recommendations, natural-language querying, and automated insight generation. The project does not claim that Generative AI was implemented.

## Installation

```bash
pip install -r requirements.txt
```

## How To Run

Open `Surya_Customer_Churn_Analytics.ipynb` from the project root and run the cells in order.

## Results

The final selected model is optimized XGBoost with operational threshold 0.35 and F1 score 0.6304.

## Limitations

- Dashboard content in the PBIX file was not directly verified in this environment.
- Business cost assumptions for threshold selection were not quantified.
- Customer value scoring is a proxy, not a validated lifetime value model.

## Future Scope

Add drift monitoring, cost-sensitive threshold optimization, live CRM integration, validated customer lifetime value modeling, and future Generative AI support for explanation and recommendation drafting.

## Conclusion

The project delivers a complete churn analytics workflow that connects predictive modeling, explainability, and retention planning while keeping implemented AI/ML work distinct from future Generative AI ideas.
