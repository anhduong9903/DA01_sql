--ex1
SELECT 
SUM (CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END )AS laptop_reviews,
SUM (CASE WHEN device_type IN('tablet','phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;
--ex2
select *, 
case when x + y > z and x + z > y and z + y > x then 'Yes'
else 'No'     
end as triangle 
from triangle;
--ex3
SELECT
    ROUND(
    CAST(SUM(CASE WHEN call_category IS NULL OR call_category = 'n/a'
      THEN 1
      ELSE 0
      END)/COUNT(case_id) *100 AS DECIMAL),1)AS call_percentage 
FROM callers;
--ex4
-- cách 1: 
SELECT name 
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL;
-- cách 2: 
SELECT name 
FROM Customer
WHERE COALESCE (referee_id,0) <> 2;
--ex5
select survived,
sum (case when pclass = 1 then 1 else 0 end) as first_class,
sum (case when pclass = 2 then 1 else 0 end) as second_class,
sum (case when pclass = 3 then 1 else 0 end) as third_class
from titanic
group by survived; 

