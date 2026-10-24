/*****************************************************************************************
Project Name : Customer Churn Analysis & Prediction
File Name    : 04_Create_Views.sql
Description  : Create SQL Views for Power BI Reporting
Database     : db_churn
Table Name   : churn
Author       : Manjunath G L
******************************************************************************************/

USE db_churn;

-- -----------------------------------------------------------------------------------------
-- VIEW 01 : Customer Churn Data
-- Description : Creates a reporting view containing active and churned customers.
-- -----------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW vw_ChurnData AS
SELECT *
FROM churn
WHERE Customer_Status IN ('Stayed', 'Churned');


-- -----------------------------------------------------------------------------------------
-- VIEW 02 : Joining Data for Dashboard
-- Description : Creates a reporting view for customer join analysis.
-- -----------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW vw_JoinData AS
SELECT *
FROM churn
WHERE Customer_Status = 'Joined';


-- -----------------------------------------------------------------------------------------
-- VIEW 03 : Customer Summary
-- Description : Creates a summary view showing customer count by status.
-- -----------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW vw_CustomerStatusSummary AS
SELECT
    Customer_Status,
    COUNT(*) AS Total_Customers
FROM churn
GROUP BY Customer_Status;


-- -----------------------------------------------------------------------------------------
-- VIEW 04 : Contract Summary
-- Description : Creates a summary view showing churn by contract type.
-- -----------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW vw_ContractSummary AS
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers
FROM churn
GROUP BY Contract;


-- -----------------------------------------------------------------------------------------
-- VIEW 05 : Payment Method Summary
-- Description : Creates a summary view showing churn by payment method.
-- -----------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW vw_PaymentMethodSummary AS
SELECT
    Payment_Method,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers
FROM churn
GROUP BY Payment_Method;


-- -----------------------------------------------------------------------------------------
-- VIEW 06 : Internet Type Summary
-- Description : Creates a summary view showing churn by internet type.
-- -----------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW vw_InternetTypeSummary AS
SELECT
    Internet_Type,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers
FROM churn
GROUP BY Internet_Type;


-- -----------------------------------------------------------------------------------------
-- VIEW 07 : State Summary
-- Description : Creates a summary view showing churn by state.
-- -----------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW vw_StateSummary AS
SELECT
    State,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers
FROM churn
GROUP BY State;