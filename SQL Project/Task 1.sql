with monthly_sales as 
-- Finding Total Sales accross each Branch as per months
(select Branch, Date_Format(Date, "%m-%Y") as sales_month, Round(sum(Total),2) as Total_Sales
from walmartsales group by Branch, sales_month), 
sales_growth as (
-- Calculating the Growth in Sales for each Branch
select Branch, sales_month, Total_Sales, lag(Total_Sales) over (partition by Branch order by sales_month) as pre_month_sales, 
((Total_Sales - lag(Total_Sales) over (partition by Branch order by sales_month))/lag(Total_Sales) over (partition by Branch order by sales_month))*100 as growth_rate from monthly_sales)
select Branch, sales_month, Total_Sales, Round(growth_rate,2) as Growth_Rate from sales_growth
where growth_rate is Not Null
order by Branch asc;