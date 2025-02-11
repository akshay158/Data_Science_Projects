delimiter //
create procedure repeat_cust( in days int)
begin 
select t1.`Customer ID`, count(t1.`Customer ID`) as Repeat_purchase_count, datediff(t2.`Date`, t1.`Date`) as diff_days from walmartsales t1 
inner join walmartsales t2 on t1.`Customer ID` = t2.`Customer ID`
AND t1.`Date` < t2.`Date`
AND datediff(t2.`Date`, t1.`Date`) <= days
group by `Customer ID`, datediff(t2.`Date`, t1.`Date`)
having Repeat_purchase_count > 1;
End //
delimiter ;
call repeat_cust(3);
drop procedure if exists repeat_cust -- TO reset the procedure
