-- ============================================================
-- Vehicle IoT Sales Analysis
-- Database: EV_Projects | Table: vehicle_sales
-- Author: Jitender | Date: April 2026
-- ============================================================

-- Q1: Total Revenue
SELECT SUM(CAST(Total_Revenue AS BIGINT)) AS Total_Revenue
FROM vehicle_sales;

-- Q2: Total Units Sold
SELECT SUM(Units_Sold) AS Total_Units
FROM vehicle_sales;

-- Q3: Total Orders
SELECT COUNT(*) AS Total_Orders
FROM vehicle_sales;

-- Q4: IoT vs Non-IoT Units Split
SELECT 
    IoT_Enabled,
    SUM(Units_Sold) AS Total_Units
FROM vehicle_sales
GROUP BY IoT_Enabled;

-- Q5: IoT Adoption % (by Units)
SELECT 
    ROUND(
        CAST(SUM(CASE WHEN IoT_Enabled = 'Yes' THEN Units_Sold ELSE 0 END) AS FLOAT)
        / SUM(Units_Sold) * 100, 1
    ) AS IoT_Adoption_Pct
FROM vehicle_sales;

-- Q6: IoT vs Non-IoT Revenue Split
SELECT 
    IoT_Enabled,
    SUM(CAST(Total_Revenue AS BIGINT)) AS Revenue
FROM vehicle_sales
GROUP BY IoT_Enabled;

-- Q7: IoT Revenue Share % (by Revenue)
SELECT 
    ROUND(
        CAST(SUM(CASE WHEN IoT_Enabled = 'Yes' THEN CAST(Total_Revenue AS BIGINT) ELSE 0 END) AS FLOAT)
        / SUM(CAST(Total_Revenue AS BIGINT)) * 100, 1
    ) AS IoT_Revenue_Share_Pct
FROM vehicle_sales;

-- Q8: Monthly IoT Adoption Trend
SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS MonthNum,
    SUM(CASE WHEN IoT_Enabled = 'Yes' THEN Units_Sold ELSE 0 END) AS IoT_Units,
    SUM(Units_Sold) AS Total_Units,
    ROUND(
        CAST(SUM(CASE WHEN IoT_Enabled = 'Yes' THEN Units_Sold ELSE 0 END) AS FLOAT)
        / SUM(Units_Sold) * 100, 1
    ) AS IoT_Adoption_Pct
FROM vehicle_sales
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY YEAR(Date), MONTH(Date);
