-- To know about the anomilities we need to have Z-score 
with stats as 
-- Calculate average of Total and standard deviation
(select `Product Line`, Round(avg(Total),2) as Avg_Sales, Round(stddev(Total),1) as std_dev_sales
from walmartsales group by `Product Line`),
transaction_Zscores as 
-- Calculate Z-score of each transactions
(select ws.`Customer ID`,ws.Branch, ws.`Product Line`, ws.Total as Sales, s.Avg_Sales, s.std_dev_sales, (ws.Total - s.Avg_Sales)/s.std_dev_sales as `z-score`
from walmartsales ws Join stats s on ws.`Product Line` = s.`Product Line`)
-- Find the Anomilies 
select `Customer ID`, Branch, `Product Line`, Sales,Avg_Sales , round(`z-score`,1) as `Z-score`
from transaction_Zscores
where `z-score` > 2.1 OR `z-score` < -1.1
order by `z-score` desc