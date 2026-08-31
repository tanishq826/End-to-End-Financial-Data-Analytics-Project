# 🏦 Bank Loan Financial Analytics | Python • SQL • Power BI • DAX

<p align="center">

**End-to-End Financial Data Analytics & Business Intelligence Project**

Transforming **40,000+ loan records** into an interactive Bank Loan Intelligence Dashboard using **Python, SQL, Power BI, DAX, and Data Modeling**.

</p>

<p align="center">






</p>


---

## 📌 Project Overview

The objective of this project is to build a comprehensive **Bank Loan Analytics Dashboard** that provides insights into:

* Loan application trends
* Loan funding and repayment performance
* Interest rate and borrower DTI
* Good Loan vs Bad Loan performance
* Loan status-wise analysis
* Regional lending activity
* Loan term distribution
* Employment length
* Loan purposes
* Home ownership
* Detailed borrower and loan-level information

The solution follows an end-to-end analytics workflow:

```text
Raw Data
   ↓
Python – Data Cleaning & Transformation
   ↓
SQL – Data Validation & Analysis
   ↓
Power BI – Data Modeling
   ↓
DAX – KPI & Comparative Measures
   ↓
Interactive Power BI Dashboards
   ↓
Business Insights & Decision Making
```

---

## 🎯 Business Problem

Banks generate large volumes of loan data containing information about applications, funded amounts, repayments, borrower profiles, loan status, interest rates, and other financial attributes.

The challenge is to convert this raw data into meaningful insights that can help the bank:

* Monitor overall lending performance
* Track loan applications over time
* Analyze funded and received amounts
* Measure loan portfolio quality
* Identify Good Loans and Bad Loans
* Understand regional lending patterns
* Analyze borrower characteristics
* Compare monthly performance
* Identify trends and potential areas of concern

The project addresses these requirements through a multi-page Power BI reporting solution.

---

# 🛠️ Technologies Used

| Technology       | Purpose                                                     |
| ---------------- | ----------------------------------------------------------- |
| 🐍 Python        | Data extraction, cleaning, preprocessing and transformation |
| 🗄️ SQL          | Data validation, accuracy checks and analytical queries     |
| 📊 Power BI      | Dashboard development and interactive visualization         |
| 📐 DAX           | KPI calculations, MTD/MoM analysis and business measures    |
| 🧩 Data Modeling | Structuring data for efficient reporting and analysis       |
| 📁 Excel/CSV     | Source data handling                                        |

---

# 📂 Dataset

The project works with **40,000+ loan records** containing information related to loan applications, borrowers, loan amounts, repayments, interest rates, loan status and other attributes.

Typical analytical fields include:

* Loan ID
* Issue Date
* Loan Amount
* Funded Amount
* Amount Received
* Interest Rate
* Debt-to-Income Ratio (DTI)
* Loan Status
* Loan Term
* Employee Length
* Loan Purpose
* Home Ownership
* State
* Borrower information

---

# 🔄 Data Analytics Workflow

## 1. Data Extraction & Preprocessing – Python

Python was used to prepare the raw loan dataset before loading it into the analytical environment.

### Key activities:

* Imported raw loan data
* Inspected dataset structure
* Checked missing values
* Identified duplicate records
* Validated data types
* Standardized categorical values
* Processed date fields
* Cleaned numerical columns
* Prepared data for SQL and Power BI

### Python Libraries

```text
Pandas
NumPy
```

Example workflow:

```python
import pandas as pd
import numpy as np

df = pd.read_csv("bank_loan_data.csv")

# Dataset overview
print(df.info())

# Check missing values
print(df.isnull().sum())

# Check duplicate records
print(df.duplicated().sum())
```

---

# 🗄️ 2. SQL Data Validation & Analysis

SQL was used to verify the accuracy and consistency of the processed data and perform analytical queries.

### SQL analysis included:

* Total loan applications
* Total funded amount
* Total amount received
* Loan status analysis
* Good vs Bad Loan analysis
* Monthly loan trends
* State-wise lending analysis
* Loan purpose analysis
* Loan term analysis
* Borrower segmentation

Example:

```sql
SELECT 
    COUNT(*) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan;
```

---

# 🧩 3. Power BI Data Modeling

The cleaned and validated data was imported into Power BI.

A structured data model was created to support:

* KPI calculations
* Time-based analysis
* Loan-status analysis
* Borrower segmentation
* Interactive filtering
* Drill-down analysis
* Comparative performance tracking

The data model was designed to provide an efficient foundation for DAX calculations and dashboard visualizations.

---

# 📐 4. DAX Measures

DAX was used to create business measures required for the Bank Loan Report.

### Core KPIs

The dashboard tracks:

* Total Loan Applications
* MTD Loan Applications
* MoM Loan Applications
* Total Funded Amount
* MTD Funded Amount
* MoM Funded Amount
* Total Amount Received
* MTD Amount Received
* MoM Amount Received
* Average Interest Rate
* MTD Average Interest Rate
* MoM Average Interest Rate
* Average DTI
* MTD Average DTI
* MoM Average DTI

The problem statement specifically requires tracking these overall and month-to-date metrics along with month-over-month changes.

### Example DAX

```DAX
Total Loan Applications =
COUNTROWS('Bank Loan')
```

```DAX
Total Funded Amount =
SUM('Bank Loan'[Funded Amount])
```

```DAX
Total Amount Received =
SUM('Bank Loan'[Amount Received])
```

```DAX
Average Interest Rate =
AVERAGE('Bank Loan'[Interest Rate])
```

```DAX
Average DTI =
AVERAGE('Bank Loan'[DTI])
```

---

# 🟢🔴 Good Loan vs Bad Loan Analysis

One of the major objectives of the project is to evaluate the quality of the loan portfolio.

## 🟢 Good Loans

Loans are classified as **Good Loans** when their status is:

* Fully Paid
* Current

The dashboard calculates:

* Good Loan Application %
* Good Loan Applications
* Good Loan Funded Amount
* Good Loan Total Received Amount

This classification follows the uploaded problem statement.

### Example DAX

```DAX
Good Loan Applications =
CALCULATE(
    [Total Loan Applications],
    'Bank Loan'[Loan Status] IN {"Fully Paid", "Current"}
)
```

```DAX
Good Loan Application % =
DIVIDE(
    [Good Loan Applications],
    [Total Loan Applications]
)
```

---

## 🔴 Bad Loans

Loans are classified as **Bad Loans** when their status is:

* Charged Off

The dashboard calculates:

* Bad Loan Application %
* Bad Loan Applications
* Bad Loan Funded Amount
* Bad Loan Total Received Amount

This classification is specified in the project problem statement.

### Example DAX

```DAX
Bad Loan Applications =
CALCULATE(
    [Total Loan Applications],
    'Bank Loan'[Loan Status] = "Charged Off"
)
```

```DAX
Bad Loan Application % =
DIVIDE(
    [Bad Loan Applications],
    [Total Loan Applications]
)
```

---

# 📊 Power BI Dashboards

The project contains **three major dashboards**.

---

# 1️⃣ Dashboard 1 – Summary

The **Summary Dashboard** provides a high-level view of the bank's lending performance and loan portfolio quality.

### Key KPI Cards

* Total Loan Applications
* MTD Loan Applications
* MoM Loan Applications
* Total Funded Amount
* MTD Funded Amount
* MoM Funded Amount
* Total Amount Received
* MTD Amount Received
* MoM Amount Received
* Average Interest Rate
* Average DTI

### Good Loan KPIs

* Good Loan Application %
* Good Loan Applications
* Good Loan Funded Amount
* Good Loan Total Received Amount

### Bad Loan KPIs

* Bad Loan Application %
* Bad Loan Applications
* Bad Loan Funded Amount
* Bad Loan Total Received Amount

### Loan Status Grid

A detailed grid provides metrics by loan status, including:

* Total Loan Applications
* Total Funded Amount
* Total Amount Received
* MTD Funded Amount
* MTD Amount Received
* Average Interest Rate
* Average DTI

These requirements are directly defined in the project specification.

---

# 2️⃣ Dashboard 2 – Overview

The **Overview Dashboard** provides visual analysis of lending trends and borrower characteristics.

### 📈 Monthly Trends by Issue Date

**Chart:** Line Chart

Analyzes:

* Total Loan Applications
* Total Funded Amount
* Total Amount Received

The x-axis represents the month based on Issue Date.

This helps identify:

* Monthly trends
* Growth patterns
* Seasonal variations
* Changes in lending activity

---

### 🗺️ Regional Analysis by State

**Chart:** Filled Map

Analyzes lending metrics by state:

* Loan Applications
* Funded Amount
* Amount Received

This helps identify geographical differences in lending activity.

---

### 🍩 Loan Term Analysis

**Chart:** Donut Chart

Analyzes loan distribution based on loan terms such as:

* 36 months
* 60 months

Metrics include:

* Loan Applications
* Funded Amount
* Amount Received

---

### 📊 Employee Length Analysis

**Chart:** Bar Chart

Analyzes lending metrics across employee-length categories such as:

* 1 year
* 5 years
* 10+ years

This helps understand the relationship between employment history and lending activity.

---

### 💰 Loan Purpose Analysis

**Chart:** Bar Chart

Analyzes loan activity by purpose, such as:

* Debt Consolidation
* Credit Card
* Other loan purposes

Metrics include:

* Loan Applications
* Funded Amount
* Amount Received

---

### 🏠 Home Ownership Analysis

**Chart:** Tree Map

Analyzes loan activity by:

* Own
* Rent
* Mortgage

This provides a hierarchical view of lending based on borrower home ownership.

---

# 3️⃣ Dashboard 3 – Details

The **Details Dashboard** provides a consolidated and detailed view of the loan portfolio.

Its objective is to provide a user-friendly interface for accessing detailed information about:

* Loans
* Borrowers
* Loan performance
* Loan-related metrics

It acts as a detailed exploration layer behind the high-level KPI and visualization dashboards.

### Key Features

* Detailed loan-level analysis
* Borrower-level information
* Loan status analysis
* Interactive filtering
* Drill-down functionality
* Detailed financial metrics

---

# 🎛️ Interactive Features

The Power BI report includes interactive features such as:

### 🔍 Dynamic Filtering

Users can filter the report based on different dimensions such as:

* Date
* State
* Loan Status
* Loan Purpose
* Loan Term
* Employment Length
* Home Ownership

### ⬇️ Drill-Down Analysis

Users can move from high-level metrics to more detailed information to understand the underlying loan portfolio.

### 📊 Comparative Analysis

DAX measures enable:

* MTD analysis
* MoM comparison
* Good vs Bad Loan comparison
* Loan-status comparison
* Trend analysis

---

# 📸 Dashboard Gallery

### Executive Summary

```
![Summary Dashboard](<img width="1297" height="727" alt="Screenshot 2026-08-31 152101" src="https://github.com/user-attachments/assets/3599b3e8-1208-491e-906c-1c1710a605e8" />)
```

### Lending Overview

```
![Overview Dashboard](screenshots/dashboard_overview.png)
```

### Loan Details

```
![Details Dashboard](screenshots/dashboard_details.png)
```

---

# 💡 Key Business Questions Answered

The dashboard helps answer questions such as:

1. How many loan applications has the bank received?
2. How much money has been funded?
3. How much money has been received from borrowers?
4. How are loan applications changing month-over-month?
5. What is the average interest rate?
6. What is the average borrower DTI?
7. What percentage of loans are classified as Good Loans?
8. How many loans have been Charged Off?
9. Which states have the highest lending activity?
10. Which loan terms are most common?
11. Which loan purposes generate the most lending?
12. How does employment length relate to loan activity?
13. How does home ownership vary across the loan portfolio?
14. How do different loan statuses affect portfolio performance?

---

# 📁 Suggested Repository Structure

```text
Bank-Loan-Financial-Analytics/
│
├── README.md
│
├── data/
│   ├── financial_loan.csv
│   └── financial_loan_data_excel.xlsx
│
├── sql/
│   └── Notebook_1.sql
│
├── powerbi/
│   └── Bank_Loan_Report.pbix
│
├── screenshots/
│   ├── dashboard_summary.png
│   ├── dashboard_overview.png
│   └── dashboard_details.png
│
└── documentation/
    ├── Domain Knowledge Doc.docx
    ├── Problem Statement.docx
    ├── Query Doc.docx
    └── Terminologies in Data.docx
```

---

# 🚀 Project Highlights

* ✅ End-to-end financial data analytics workflow
* ✅ Processed and transformed **40,000+ records**
* ✅ Python-based data preprocessing
* ✅ SQL-based data validation and analysis
* ✅ Power BI data modeling
* ✅ DAX-based KPI development
* ✅ MTD and MoM comparative analysis
* ✅ Good Loan vs Bad Loan analysis
* ✅ Multi-page interactive dashboard
* ✅ Drill-down analysis
* ✅ Dynamic filtering
* ✅ Regional and borrower segmentation
* ✅ Loan portfolio quality analysis

---

# 📈 Business Value

The dashboard converts raw loan data into actionable financial insights.

It enables stakeholders to:

* Monitor lending performance
* Track loan portfolio health
* Identify changes in loan applications
* Evaluate funded and received amounts
* Monitor Good vs Bad Loan performance
* Understand borrower characteristics
* Identify regional lending patterns
* Support data-driven lending strategies

---

# 👨‍💻 My Role

### Data Preprocessing & Analytics

I worked on the end-to-end analytics workflow, with a strong focus on **data preprocessing, validation, transformation, and reporting**.

### Key Responsibilities

* Extracted and processed 40,000+ loan records using Python
* Cleaned and transformed raw financial data
* Performed data quality and accuracy checks using SQL
* Developed analytical SQL queries
* Built the Power BI data model
* Created DAX measures for financial KPIs
* Implemented MTD and MoM calculations
* Developed Good Loan vs Bad Loan analysis
* Designed interactive multi-page Power BI dashboards
* Implemented dynamic filters and drill-down analysis
* Converted analytical requirements into business-focused visualizations

---

# 🧠 Skills Demonstrated

```text
Python
Pandas
NumPy
SQL
Data Cleaning
Data Validation
Data Transformation
Data Modeling
Power BI
DAX
KPI Development
Time Intelligence
Financial Analytics
Business Intelligence
Data Visualization
Dashboard Development
```

---

# 📌 Conclusion

This project demonstrates how raw financial data can be transformed into a complete **Business Intelligence solution** using Python, SQL, Power BI, DAX, and data modeling.

The final Bank Loan Report provides both **high-level KPI monitoring** and **detailed drill-down analysis**, helping users understand lending performance, loan quality, borrower characteristics, and portfolio trends.

---



