WITH day_sales AS (
    SELECT 
        DAYNAME(`Date`) AS day_of_week, 
        round(SUM(Total),0) AS total_sales
    FROM walmartsales GROUP BY DAYNAME(`Date`)
),
Ranked_Days AS (
    SELECT
        day_of_week,
        total_sales,
        RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM day_sales
)
SELECT 
    day_of_week,
    total_sales,
    sales_rank
FROM Ranked_Days
ORDER BY sales_rank asc;