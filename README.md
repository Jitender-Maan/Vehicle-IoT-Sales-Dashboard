# Vehicle IoT Sales Dashboard — Power BI

**Project 1 of my Data Analyst Portfolio**

## Overview
Analysis of 1,000 vehicle sales records comparing IoT-enabled vs Non-IoT vehicles across regions, vehicle types and sales channels for FY 2024.

## Tools Used
- SQL Server (SSMS) — data cleaning and validation
- Power BI — dashboard and visualizations
- DAX — calculated measures
- Power Query — data transformation

## Dataset
- 1,000 orders | 11 columns | Jan–Dec 2024
- Columns: Order_ID, Date, Region, Vehicle_Type, Model, IoT_Enabled, Units_Sold, Price_per_Unit, Total_Revenue, Customer_Type, Sales_Channel

## Key Metrics
| Metric | Value |
|---|---|
| Total Revenue | ₹18.45B |
| Total Units | 10,826 |
| Total Orders | 1,000 |
| IoT Adoption % | 47.1% |
| IoT Revenue Share % | 48.1% |

## Key Insights
- IoT adoption dropped to 36.8% in April 2024 — lowest point of the year
- IoT crossed 50% for the first time in June 2024 and held through December
- July 2024 was the peak sales month — 1,180 units, 43% above monthly average
- IoT vehicles contribute 48.1% of revenue despite being 47.1% of units — slightly higher value per unit
- All 4 regions and 4 vehicle types contributed nearly equally to total revenue

## DAX Measures
```
Total Revenue = SUM(vehicle_sales[Total_Revenue])
Total Units = SUM(vehicle_sales[Units_Sold])
Total Orders = COUNTROWS(vehicle_sales)
IoT Units = CALCULATE(SUM(vehicle_sales[Units_Sold]), vehicle_sales[IoT_Enabled] = "Yes")
IoT Adoption % = DIVIDE([IoT Units], [Total Units])
IoT Revenue = CALCULATE(SUM(vehicle_sales[Total_Revenue]), vehicle_sales[IoT_Enabled] = "Yes")
IoT Revenue Share % = ROUND(DIVIDE([IoT Revenue], [Total Revenue]) * 100, 1) / 100
```

## Dashboard Preview
![Dashboard](Vehicle_IoT_Sales_Dashboard.jpg)

## Author
Jitender | MIS Executive → Data Analyst
| Data Analyst Portfolio | 2026
