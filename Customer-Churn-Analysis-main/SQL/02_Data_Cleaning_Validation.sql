use db_churn;

/*****************************************************************************************
Project Name : Customer Churn Analysis & Prediction
File Name    : 02_Data_Cleaning_Validation.sql
Description  : Data Cleaning and Validation Queries
Database     : db_churn
Table Name   : churn
Author       : Manjunath G L
******************************************************************************************/

USE db_churn;

-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 01 : Preview Dataset
-- Description : Display all records to verify the imported dataset.
-- -----------------------------------------------------------------------------------------

SELECT *
FROM churn;


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 02 : Check Total Records
-- Description : Verify the total number of records.
-- -----------------------------------------------------------------------------------------

-- EDA 09 : Average Monthly Charges by Customer Status
-- Description : Compare average monthly charges across customer statuses.

SELECT
    Customer_Status,
    ROUND(AVG(Monthly_Charge), 2) AS Average_Monthly_Charge
FROM churn
GROUP BY Customer_Status;

SELECT COUNT(*) AS Total_Records
FROM churn;


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 03 : Check for Duplicate Customer IDs
-- Description : Identify duplicate Customer_ID values.
-- -----------------------------------------------------------------------------------------

SELECT
    Customer_ID,
    COUNT(*) AS Duplicate_Count
FROM churn
GROUP BY Customer_ID
HAVING COUNT(*) > 1;


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 04 : Check Missing Customer IDs
-- Description : Find records with NULL or blank Customer_ID values.
-- -----------------------------------------------------------------------------------------

SELECT *
FROM churn
WHERE Customer_ID IS NULL
   OR TRIM(Customer_ID) = '';


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 05 : Check Missing Customer Status
-- Description : Find records with NULL or blank Customer_Status values.
-- -----------------------------------------------------------------------------------------

SELECT *
FROM churn
WHERE Customer_Status IS NULL
   OR TRIM(Customer_Status) = '';


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 06 : Check Missing Contract Values
-- Description : Find records with NULL or blank Contract values.
-- -----------------------------------------------------------------------------------------

SELECT *
FROM churn
WHERE Contract IS NULL
   OR TRIM(Contract) = '';


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 07 : Check Missing Payment Method
-- Description : Find records with NULL or blank Payment_Method values.
-- -----------------------------------------------------------------------------------------

SELECT *
FROM churn
WHERE Payment_Method IS NULL
   OR TRIM(Payment_Method) = '';


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 08 : Check Missing Internet Type
-- Description : Find records with NULL or blank Internet_Type values.
-- -----------------------------------------------------------------------------------------

SELECT *
FROM churn
WHERE Internet_Type IS NULL
   OR TRIM(Internet_Type) = '';


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 09 : Count NULL Values
-- Description : Count NULL values in important columns.
-- -----------------------------------------------------------------------------------------

SELECT
    SUM(Customer_ID IS NULL) AS Customer_ID_Nulls,
    SUM(Gender IS NULL) AS Gender_Nulls,
    SUM(Age IS NULL) AS Age_Nulls,
    SUM(Tenure IS NULL) AS Tenure_Nulls,
    SUM(Monthly_Charge IS NULL) AS Monthly_Charge_Nulls,
    SUM(Total_Revenue IS NULL) AS Total_Revenue_Nulls,
    SUM(Customer_Status IS NULL) AS Customer_Status_Nulls
FROM churn;


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 10 : Verify Customer Status Values
-- Description : Validate Customer_Status categories.
-- -----------------------------------------------------------------------------------------

SELECT
    Customer_Status,
    COUNT(*) AS Total_Customers
FROM churn
GROUP BY Customer_Status;


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 11 : Verify Contract Types
-- Description : Validate Contract categories.
-- -----------------------------------------------------------------------------------------

SELECT
    Contract,
    COUNT(*) AS Total_Customers
FROM churn
GROUP BY Contract;


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 12 : Verify Internet Types
-- Description : Validate Internet_Type categories.
-- -----------------------------------------------------------------------------------------

SELECT
    Internet_Type,
    COUNT(*) AS Total_Customers
FROM churn
GROUP BY Internet_Type;


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 13 : Verify Payment Methods
-- Description : Validate Payment_Method categories.
-- -----------------------------------------------------------------------------------------

SELECT
    Payment_Method,
    COUNT(*) AS Total_Customers
FROM churn
GROUP BY Payment_Method;


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 14 : Validate Numerical Columns
-- Description : Check minimum and maximum values for numeric fields.
-- -----------------------------------------------------------------------------------------

SELECT
    MIN(Age) AS Minimum_Age,
    MAX(Age) AS Maximum_Age,
    MIN(Tenure) AS Minimum_Tenure,
    MAX(Tenure) AS Maximum_Tenure,
    MIN(Monthly_Charge) AS Minimum_Monthly_Charge,
    MAX(Monthly_Charge) AS Maximum_Monthly_Charge,
    MIN(Total_Revenue) AS Minimum_Total_Revenue,
    MAX(Total_Revenue) AS Maximum_Total_Revenue
FROM churn;


-- -----------------------------------------------------------------------------------------
-- DATA CLEANING 15 : Final Data Validation
-- Description : Verify total records and unique customer IDs.
-- -----------------------------------------------------------------------------------------

SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM churn;

-- EDA 10 : Churn by Tenure Group
-- Description : Analyze customer churn across different tenure groups.

-- EDA 10 : Churn by Tenure Group
-- Description : Analyze churn across different customer tenure groups.

SELECT
    CASE
        WHEN Tenure_in_Months BETWEEN 0 AND 12 THEN '0-12 Months'
        WHEN Tenure_in_Months BETWEEN 13 AND 24 THEN '13-24 Months'
        WHEN Tenure_in_Months BETWEEN 25 AND 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS Tenure_Group,
    COUNT(*) AS Churned_Customers
FROM churn
WHERE Customer_Status = 'Churned'
GROUP BY Tenure_Group
ORDER BY MIN(Tenure_in_Months);

DESCRIBE churn;

