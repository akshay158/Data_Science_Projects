with cust_revenue as
(select `Customer ID`, Round(sum(Total),1) as Revenue
from walmartsales 
group by `Customer ID`),
top_ranked_cust as
(select `Customer ID`, Revenue,
Rank() over (order by Revenue desc) as top_revenue_customer
from cust_revenue)
select top_revenue_customer as Top_5 , `Customer ID`, Revenue from top_ranked_cust
where top_revenue_customer <=5
order by Revenue desc