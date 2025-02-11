with sales_by_customerType as
-- Find total sales for each customer type and for each product line
(select `Customer Type`, `Product Line`, round(sum(Total),2) as total_sales
from walmartsales
group by `Customer Type`, `Product Line`),
rank_productLines as
-- Rank product line preference of each customer type
(select `Customer Type`, `Product Line`, total_sales, 
Rank() over(partition by `Customer Type` order by total_sales desc) as ProductLine_Rank from sales_by_customerType)
select `Customer Type`, `Product Line`, total_sales, ProductLine_Rank
from rank_productLines




