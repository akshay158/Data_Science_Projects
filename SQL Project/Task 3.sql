with Cust_Spending as
(select `Customer ID`, Round(sum(Total),2) as Total_Spendings
from walmartsales
group by `Customer ID`
)
select  `Customer ID`, Total_Spendings, Case 
when Total_Spendings <20000 then "Low"
when Total_Spendings between 20000 and 22000 then "Medium"
else "High"
END as Spending_Tiers
from Cust_Spending
order by Total_Spendings desc


