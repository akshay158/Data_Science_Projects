with genderSales_monthly as 
(select Gender, date_format(Date, '%m-%Y') as Months, round(sum(Total),2) as total_sales
from walmartsales 
group by Gender, Months
order by Months)
select * from genderSales_monthly