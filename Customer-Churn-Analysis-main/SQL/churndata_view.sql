CREATE VIEW vw_ChurnData AS
SELECT *
FROM prod_churn
WHERE Customer_Status IN ('Churned', 'Stayed');	