#Question
SELECT  COUNT(DISTINCT "language")
FROM countrylanguage
where isofficial='True'


select countrycode, count(*)
from countrylanguage
where isofficial='True'
GROUP BY countrycode
having count(*) > 1
ORDER BY countrycode ASC
limit 5 offset 2  -- offset ilk 2 ustunden kecir 5 denesini verir





# Question2 
sELECT  AVG(lifeexpectancy)
from country 

# Question3
SELECT AVG(population)
from city 
Where countrycode = 'NLD'

# Question4
SELECT COUNT(gender)
from customers
where "state" = 'OR' and gender ='F'

# Question5
SELECT firstname,lastname
From customers 
Where age > 44 and income>=100000

# Question6
SELECT firstname,lastname
From customers 
Where age >= 30 and age<=50 and income<=50000

# Question7
SELECT AVG(income)
From customers 
Where age > 20 and age < 50 

# Question8
SELECT SUM(totalamount)
from orders 
Where customerid = 7888 or customerid = 1082 or customerid = 12808 or customerid = 9623

# Question9
SELECT COUNT(DISTINCT "name")
from city 
where district='Zuid-Holland' or district='Noord-Brabant' or district='Utrecht'

# Question10
SELECT AVG(income)
From customers 
Where age BETWEEN 20 and 50 

# Question11
SELECT DISTINCT lifeexpectancy
from country
where lifeexpectancy IS NOT NULL 

# Question12
SELECT *
From customers
where starts_with(zip::text,'2') and substring(zip::text,3,1)='1'

# Question13
SELECT *
From customers 
Where ((age < 20 or age >=50) and income>50000) and (country= 'Japan' or country='Australia')
limit 10 

# Question14
SELECT SUM(totalamount)
FROM orders
WHERE orderdate::text LIKE '2004-06%' and netamount>=100;


#Question15
SELECT COUNT(*)
FROM orders
WHERE orderdate::text LIKE '2004-01%'

#Question16---88 əmin deyiləm
SELECT *
FROM customers
WHERE "state"='OH' or  "state"='NY' or "state"='OR'

#Question17
SELECT "state", COUNT(customers.customerid)
from customers
Group by "state"

#Question18
SELECT category, AVG(price)
from products
Group by category

#Question19--18   with nese as 
with sum1 as (SELECT continent,SUM("population") AS cont_sum_population
from country
Group by continent)


#Question20 --19, 101
SELECT continent,(cont_sum_population/SUM("population"))*100
from sum1
Group by continent



#Question21    --117
SELECT category, MAX(price)
From products
Group by category;




#Question22--121
SELECT *,
    CASE
        if  price < 10 THEN 'Low'
        ELSIF price BETWEEN 10 AND 20 THEN 'Medium'
        ELSE 'High'
    END if  price_class
FROM products
LIMIT 10;





#Question23
SELECT SUM(surfacearea)
from country
Where "population">50e6

#Question22


                                        #ELAVELER

###ORDERBY

select first_name,last_name
from employees
order by first_name asc, last_name desc

select *
from employees
order by birth_date

select *
from employees
where first_name  ilike 'k%' 
order by hire_date
limit 5;


-------------------------------------------- LIKE --------------------------------------------
select count(*)
from employees
where first_name ilike 'A%_R'


select count(*)
from customers 
where zip::text like '%2%'


select count(*)
from customers 
where zip::text like '2_1%'


-------------------------------------------- OPERATOR PRECEDENCE (comparison operators) --------------------------------------------
select *
from customers
where ((age < 30 or age >= 50 ) and income > 50000) and (country= 'Japan' or country='Australia')


select sum(totalamount)
from orders 
where totalamount > 100 and orderdate::text like '2004-06%'
limit 5;

-- SELECT SUM(totalamount) 
-- FROM orders
-- WHERE (orderdate >= '2004-06-01' AND orderdate <= '2004-06-30') AND totalamount > 100

-------------------------------------------- DATA FILTERING --------------------------------------------
select *
from employees
where now() - birth_date > interval '60 years'
limit 5 ;

select count(*)
from employees
where hire_date::text like '%-02-%'

-- SELECT count(emp_no) 
-- FROM employees
-- WHERE EXTRACT (MONTH FROM hire_date) = 2;


select count(*)
from employees
where extract(month from birth_date) = 11

select max(extract(year from age (now(),birth_date)))
from employees 

select *
from orders 
where extract ( year from orderdate ) = 2004
limit 5;
-------------------------------------------- JOINS --------------------------------------------

select *
from orders join customers using(customerid)
where state = 'OH' or state = 'NY' or state = 'OR' --state in ('OH','OR','NY')
limit 5 ;


select prod_id, quan_in_stock
from products join inventory using(prod_id)


select emp_no,dept_no
from employees join dept_emp using(emp_no) join departments using(dept_no)
limit 5;


select hire_date, count(*)
from employees 
Group by hire_date 
order by hire_date 

--1991 olan tapsiriqda qaldim


select emp_no,hire_date, count(*)
from employees join titles using(emp_no)
where extract(year from hire_date) > 1991
group by emp_no
order by emp_no,hire_date
limit 50;

-- How many employees were hired in each year?
-- Database: Employees
-- Table: Employees

select extract (year from hire_date),count(*)
from employees 
group by extract (year from hire_date)
order by extract (year from hire_date) 


-- Find the employee numbers and names of employees who work in the 'Sales' department.
-- Database: Employees
-- Table: Employees, Dept_emp, Departments

select *
from employees join dept_emp using(emp_no) join departments using(dept_no)
where dept_name = 'Sales'
limit 5;







