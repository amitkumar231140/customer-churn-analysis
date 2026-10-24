CREATE VIEW vw_JoinData AS
SELECT *
FROM prod_churn
WHERE Customer_Status = 'Joined';