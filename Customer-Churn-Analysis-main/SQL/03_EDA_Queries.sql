
USE db_churn;

SELECT Customer_ID,
Total_Revenue
FROM churn
ORDER BY Total_Revenue DESC
LIMIT 10;

SELECT Churn_Category,
COUNT(*)
FROM churn
GROUP BY Churn_Category;

SELECT Contract,
COUNT(*) AS Churned_Customers
FROM churn
WHERE Customer_Status='Churned'
GROUP BY Contract;

SELECT Payment_Method,
COUNT(*) AS Churned_Customers
FROM churn
WHERE Customer_Status='Churned'
GROUP BY Payment_Method;

SELECT Internet_Type,
COUNT(*) AS Churned_Customers
FROM churn
WHERE Customer_Status='Churned'
GROUP BY Internet_Type;

SELECT Customer_ID,
Total_Revenue
FROM churn
ORDER BY Total_Revenue DESC
LIMIT 10;