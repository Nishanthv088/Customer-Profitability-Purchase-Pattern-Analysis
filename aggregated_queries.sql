--Clean the Data in SQL Server
SELECT 
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    UnitPrice,
    CustomerID,
    Country,
    CAST(InvoiceDate AS DATETIME) AS InvoiceDate,
    Quantity * UnitPrice AS TotalPrice
INTO online_retail_cleaned
FROM online_retail
WHERE 
    Quantity > 0
    AND UnitPrice > 0
    AND CustomerID IS NOT NULL
    AND InvoiceNo NOT LIKE 'C%';

--Total Revenue by Country
SELECT Country, ROUND(SUM(TotalPrice), 2) AS Revenue
INTO Revenue_Country
FROM online_retail_cleaned
GROUP BY Country
ORDER BY Revenue DESC;

-- Top 10 Products by Revenue
SELECT TOP 10 Description, SUM(TotalPrice) AS Revenue
INTO Top10_Revenue_Product
FROM online_retail_cleaned
GROUP BY Description
ORDER BY Revenue DESC;

--Monthly Sales Trend
SELECT 
    YEAR(InvoiceDate) AS [Year],
    MONTH(InvoiceDate) AS [Month],
    SUM(TotalPrice) AS MonthlyRevenue
	INTO Revenue_Monthwise
FROM online_retail_cleaned
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY [Year], [Month];

--Customer Segmentation
SELECT
  CustomerID,
  SUM(Quantity * UnitPrice) AS TotalRevenue,
  COUNT(DISTINCT InvoiceNo) AS OrderFrequency,
  CASE 
    WHEN SUM(Quantity * UnitPrice) >= 10000 THEN 'High'
    WHEN SUM(Quantity * UnitPrice) BETWEEN 3000 AND 9999 THEN 'Medium'
    ELSE 'Low'
  END AS Segment
  INTO Customer_Segment
FROM online_retail_cleaned
WHERE Quantity > 0 AND UnitPrice > 0 AND InvoiceNo NOT LIKE 'C%'
GROUP BY CustomerID;

--Customer_Sales_Summary
SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Frequency,
    SUM(Quantity * UnitPrice) AS Revenue,
    CAST(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo) AS DECIMAL(10, 2)) AS AvgOrder
    INTO Customer_Sales_Summary
FROM online_retail_cleaned
WHERE 
    Quantity > 0 
    AND UnitPrice > 0 
    AND CustomerID IS NOT NULL
    AND InvoiceNo NOT LIKE 'C%'
GROUP BY CustomerID
ORDER BY Revenue DESC;