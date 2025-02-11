with branchProfit_productLine as 
(select Branch, `Product Line`, abs(sum(`gross income` - cogs)) as Total_Profit 
from walmartsales group by Branch, `Product Line`),
Top_ProductLine as 
(select Branch, `Product Line`, Total_Profit, Rank() over (partition by Branch order by Total_Profit desc) as Profit_Rank
from branchProfit_productLine)
select Branch, `Product Line`, Round(Total_profit,2) as Total_Profit from Top_ProductLine
where Profit_Rank = 1;
