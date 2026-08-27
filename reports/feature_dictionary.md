# Feature Dictionary

## Original Features

| Feature | Description | Type |
|---|---|---|
| CreditScore | Customer credit score | Numerical |
| Geography | Customer's country | Categorical |
| Gender | Customer gender | Categorical |
| Age | Customer age | Numerical |
| Tenure | Number of years the customer has been with the bank | Numerical |
| Balance | Customer's account balance | Numerical |
| NumOfProducts | Number of banking products held by the customer | Numerical |
| HasCrCard | Indicates whether the customer has a credit card | Binary |
| IsActiveMember | Indicates whether the customer is an active bank member | Binary |
| EstimatedSalary | Estimated annual salary | Numerical |
| Exited | Target variable indicating whether the customer churned | Binary |

## Engineered Features

| Feature | Description | Purpose |
|---|---|---|
| AgeGroup | Age grouped into predefined customer age bands | Enables age-segment analysis |
| BalanceStatus | Categorizes customers based on account balance | Identifies balance-related customer segments |
| ActivityStatus | Converts member activity into interpretable Active/Inactive categories | Supports behavioral segmentation |
| AgeActivity | Interaction between age group and activity status | Captures combined demographic and activity patterns |

## Identifier / Source Fields

| Feature | Description | Usage |
|---|---|---|
| RowNumber | Original dataset row identifier | Excluded from modeling |
| CustomerId | Unique customer identifier | Used for customer-level identification |
| Surname | Customer surname | Excluded from predictive modeling |

## Target Variable

### Exited

- `1` → Customer churned
- `0` → Customer remained with the bank

The target variable is used for supervised binary classification.
