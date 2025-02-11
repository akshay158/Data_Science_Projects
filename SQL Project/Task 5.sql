with payment_method_count as 
(select City, Payment, count(*) as Num_of_payments from walmartsales group by City,Payment),
most_popular_paymentMethod as
(select City, Payment, Num_of_payments, 
Rank() over (partition by city order by Num_of_payments desc) as Rank_of_pay_method 
from payment_method_count)
select City, Payment as `Payment Mode`, Num_of_payments from most_popular_paymentMethod
where Rank_of_pay_method = 1