----Create a database for Kultra Mega Stores---

create database KMS_Casestudy

----Bring Table to SQL Environment----
select * from [dbo].[KMS Sql Case Study]

----Validate dataset to check for errors----
-- Check the first 10 rows
SELECT TOP 10 * FROM [dbo].[KMS Sql Case Study];

-- Check data counts
SELECT COUNT(*) AS TotalRecords FROM [dbo].[KMS Sql Case Study];

-- Check for missing values in key columns
SELECT 
    SUM(CASE WHEN [Customer_Name] IS NULL THEN 1 ELSE 0 END) AS MissingCustomerNames,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS MissingSales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS MissingProfit
FROM [dbo].[KMS Sql Case Study];

----Data Analysis Queries----
------------------------------------------------------------------------------------------
--CASE SCENARIO 1--
------------------------------------------------------------------------------------------
----1. Highest Sales Product Category----
SELECT TOP 1 
    [Product_Category],
    SUM(Sales) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Product_Category]
ORDER BY TotalSales DESC;
---- The Product with the highest sales is Technology with the value 5984248.182-----


------------------------------------------------------------------------------------------
----2. Top three and bottom 3 regions in terms of sales----
----Top 3 Regions----
SELECT TOP 3
    Region,
    SUM(Sales) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales DESC;
---Top 3 regions
--------West with 3597549.2755
--------Ontario with 3063212.4795 
--------Prarie with 2837304.6015-----

---ii. Bottom 3 Regions----
SELECT TOP 3
    Region,
    SUM(Sales) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY TotalSales ASC;
----Bottom 3 regions
--------a. Nunavut with116376.4835
--------b. Northwest Territories 800847.3295
--------c. Yukon with 975867.371


------------------------------------------------------------------------------------------
----3. Total Sales of appliances in Ontario----
SELECT 
    SUM(Sales) AS TotalApplianceSalesInOntario
FROM [dbo].[KMS Sql Case Study]
WHERE [Product_Sub_Category] = 'Appliances'
AND Region = 'Ontario'
----Total appliance sales in Ontario is 202346.8400


------------------------------------------------------------------------------------------
----4. Bottom 10 Customers----
SELECT TOP 10
    [Customer_Name],
    SUM(Sales) AS TotalSales,
    COUNT(DISTINCT [Order_ID]) AS OrderCount,
    AVG(Sales) AS AvgOrderValue
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name]
ORDER BY TotalSales ASC;
-----Bottom 10 customers----
-------Jeremy Farry - 85.72
-------Natalie DeCherney - 125.90
-------Nicole Fjeld - 153.03
-------Katrina Edelman - 180.76
-------Dorothy Dickinson - 198.08
-------Christine Kargatis - 293.22
-------Eric Murdock	- 343.328
-------Chris McAfee	- 350.18
-------Rick Huthwaite - 415.82
-------Mark Hamilton - 450.99


------------------------------------------------------------------------------------------
----5. Shippin Method that incurred the highest or most cost----
SELECT Ship_Mode, SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM [dbo].[KMS Sql Case Study]
GROUP BY Ship_Mode
ORDER BY Total_Shipping_Cost DESC;
-------KMS Incurred the most cots using Delivery trucks where they spent 51971.940
------------------------------------------------------------------------------------------
select * from [dbo].[KMS Sql Case Study]


------------------------------------------------------------------------------------------
--CASE SCENARIO 2--
------------------------------------------------------------------------------------------
----6. Most Valuable Customers and Products Purchased---
SELECT TOP 5
    [Customer_Name],
    [Customer_Segment],
    SUM(Sales) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Customer_Name], [Customer_Segment]
ORDER BY TotalSales DESC;
-----The most Valuable customers----
--i. Emily Phan
--ii. Roy Skaria
--iii. Liz MacKendrick
--iv. Dennis Kane
--v. John Lucas
SELECT DISTINCT [Product_Category]
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Name] = 'Emily Phan' "Repeated for other customers"
---Major Purchases for these customers are Furniture, Office Supplies and Technology


------------------------------------------------------------------------------------------
----7. Small Business Customer withe Highest sales----
SELECT TOP 1
    [Customer_Name],
    SUM(Sales) AS TotalSales
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Small Business'
GROUP BY [Customer_Name]
ORDER BY TotalSales DESC;
------Small Business customer with highest sales os Dennis Kane with 75967.591 in sales-------


------------------------------------------------------------------------------------------
----8. Corporate customer with most orders between 2009 ans 2012-------
SELECT TOP 1
    [Customer_Name],
    COUNT(DISTINCT [Order_ID]) AS NumberOfOrders
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Corporate'
    AND YEAR([Order_Date]) BETWEEN 2009 AND 2012
GROUP BY [Customer_Name]
ORDER BY NumberOfOrders DESC
----- The Corporate customer with most orders between 2009 ans 2012 is Adam Hart with 18 Orders----


------------------------------------------------------------------------------------------
----9. Most Profitable Consumer Customer---
SELECT TOP 1
    [Customer_Name],
    SUM(Profit) AS TotalProfit
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Consumer'
GROUP BY [Customer_Name]
ORDER BY TotalProfit DESC
---This query is returning an error so I asked chat GPT for help----
SELECT TOP 1
    [Customer_Name],
    SUM(TRY_CONVERT(FLOAT, Profit)) AS TotalProfit
FROM [dbo].[KMS Sql Case Study]
WHERE [Customer_Segment] = 'Consumer'
GROUP BY [Customer_Name]
ORDER BY TotalProfit DESC
------ The most profitable customer is Emily Phan with a total of 34005.44 in purchase value----


------------------------------------------------------------------------------------------
---Another Table had to be created to join primary keys---
CREATE TABLE KMS_Orders_Cleaned (
    [Order ID] INT,
    [Order Date] DATE,
    [Order Priority] VARCHAR(50),
    [Order Quantity] INT,
    Sales FLOAT,
    Discount FLOAT,
    [Ship Mode] VARCHAR(50),
    Profit FLOAT,  -- Explicitly defined as FLOAT
    [Unit Price] FLOAT,
    [Shipping Cost] FLOAT,
    [Customer Name] VARCHAR(100),
    Province VARCHAR(100),
    Region VARCHAR(100),
    [Customer Segment] VARCHAR(50),
    [Product Category] VARCHAR(50),
    [Product Sub-Category] VARCHAR(100),
    [Product Name] VARCHAR(255),
    [Product Container] VARCHAR(50),
    [Product Base Margin] FLOAT,
    [Ship Date] DATE
);
INSERT INTO KMS_Orders_Cleaned
SELECT 
    [Order_ID],
    [Order_Date],
    [Order_Priority],
    [Order_Quantity],
    Sales,
    Discount,
    [Ship_Mode],
    TRY_CONVERT(FLOAT, Profit),
    [Unit_Price],
    [Shipping_Cost],
    [Customer_Name],
    Province,
    Region,
    [Customer_Segment],
    [Product_Category],
    [Product_Sub_Category],
    [Product_Name],
    [Product_Container],
    [Product_Base_Margin],
    [Ship_Date]
FROM [dbo].[KMS Sql Case Study];

----10. Customers that returned items and the segment
-- Option 1: Using explicit join to find customers with returned items
SELECT 
    o.*, -- All columns from orders table
    os.* -- All columns from status table
FROM 
    [dbo].[KMS_Orders_Cleaned] o
INNER JOIN 
    [dbo].[Order_Status] os ON o.[Order ID] = os.[Order_ID];
----------------------------------------------------------------------------------
SELECT DISTINCT
    o.[Customer Name],
    o.[Customer Segment]
FROM 
   [dbo].[KMS_Orders_Cleaned]  o
JOIN 
    [dbo].[Order_Status] os ON o.[Order ID] = os.[Order_ID]
WHERE 
    os.[Status] = 'Returned';
------About 419 customers have returned items. These customers belong to various segments including: Home Office, Corporate etc


------------------------------------------------------------------------------------------
---11. 
SELECT 
    [Order_Priority],
    [Ship_Mode],
    COUNT(*) AS OrderCount,
    AVG([Shipping_Cost]) AS AvgShippingCost,
    AVG(DATEDIFF(day, [Order_Date], [Ship_Date])) AS AvgShippingDays
FROM [dbo].[KMS Sql Case Study]
GROUP BY [Order_Priority], [Ship_Mode]
ORDER BY [Order_Priority], [Ship_Mode]
----- from the available data, What would be expected
----Critical/High priority ? should mostly use Express Air (fast)
----Low/Medium priority ? should mostly use Delivery Truck (economical)
----Delivery Truck should be minimally used for Critical orders
----No, KMS has not appropriately spent shipping costs based on Order Priority.
---High-cost shipping methods (Express Air) were used too often for Low and Medium priority orders.
---Slow and cheap method (Delivery Truck) was used quite a bit for Critical and High priority orders — risking late delivery.
