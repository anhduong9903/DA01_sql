-- ex1
SELECT NAME FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE ='USA'; 
-- ex2
SELECT * FROM CITY 
WHERE COUNTRYCODE='JPN';
-- ex3
SELECT CITY, STATE FROM STATION; 
-- ex4
SELECT DISTINCT CITY FROM STATION 
WHERE CITY LIKE 'a%' OR CITY LIKE 'e%' OR CITY LIKE 'i%' OR CITY LIKE 'o%' OR CITY LIKE 'u%';
-- ex5
SELECT DISTINCT CITY FROM STATION 
WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';
-- ex6
SELECT DISTINCT CITY FROM STATION 
WHERE CITY NOT LIKE 'a%' AND CITY NOT LIKE 'e%' AND CITY NOT LIKE 'i%' AND CITY NOT LIKE 'o%' AND CITY NOT LIKE 'u%';
-- ex7
SELECT name FROM Employee
ORDER BY name ASC; 
-- ex8 
SELECT name FROM Employee 
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;
-- ex9
SELECT product_id FROM Products
WHERE low_fats='Y' AND recyclable='Y'; 
-- ex10
SELECT name FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL; 
-- ex11
SELECT name, population, area FROM WORLD 
WHERE area >= 3000000 OR population >= 25000000; 
-- ex12
SELECT DISTINCT author_id AS id FROM Views 
WHERE viewer_id = author_id AND viewer_id >= 1
ORDER BY id ASC;
-- ex13
SELECT part FROM parts_assembly
WHERE finish_date IS NULL; 
-- ex14
select * from lyft_drivers
where yearly_salary <=30000 or yearly_salary >=70000;
-- ex15 
select * from uber_advertising
where money_spent >100000 and year='2019';
