🛒 Online Retail Sales Analysis Dashboard (Power BI + SQL + Python)

📌 Project Overview

Objective:
To analyze retail transactional data, segment customers, track revenue trends, and visualize KPIs for business insights.

Tools Used:
- SQL Server (SSMS)
- Python (Pandas, NumPy, Matplotlib)
- Power BI
  
🔄 Workflow
1. Data Cleaning (SQL & Python)
- Removed nulls and duplicates
- Converted columns to appropriate data types (Quantity, UnitPrice)
- Handled missing values in CustomerID and Description
  
2. SQL Analysis
- Imported cleaned data into SQL Server
- Created aggregated tables:
  • Customer_Sales_Summary
  • Customer_Segment
  • Revenue_By_Country
  • Revenue_By_Month_Year
  • Top_10_Revenue_Products
- Created key measures such as Total Revenue, Avg Revenue per Customer, Frequency (Order Count), CLTV, and Repeat Purchase Rate
  
3. Exploratory Data Analysis (Python)
- Analyzed sales distribution, top countries, product performance
- Time series analysis for monthly trends
- CLTV calculated using Recency, Frequency, and Monetary value
  
4. Power BI Dashboard
Key Visuals:
- Revenue Trend (Month-Year)
- Revenue by Country
- Top 10 Customers by Revenue
- Repeat vs One-Time Buyers (Donut Chart)
- Customer Lifetime Value Segments (Donut Chart)
- Top Products by Revenue
- KPI Cards: Total Revenue, Avg Order Value, Frequency
- Revenue by Customer Segment
- Filters: Country, Date, Segment
  
💡 Business Insights
- Majority of revenue comes from the UK
- A small group of high-value customers contributes significantly to revenue
- Repeat buyers have a higher average order value
- Certain products are consistently top sellers across months
- Some countries show potential for targeting based on contribution
  
🚀 How to Run
1. SQL: Run the queries in 'aggregated_queries.sql' in SSMS to generate summary tables
2. Python: Use 'eda_analysis.ipynb' for exploratory analysis
3. Power BI: Open 'final_dashboard.pbix', ensure SQL tables are connected, and refresh the data
   
📌 Dataset
Available from: https://www.kaggle.com/datasets/lakshmi25npathi/online-retail-dataset

📌 License
This project is for educational & portfolio purposes only.
