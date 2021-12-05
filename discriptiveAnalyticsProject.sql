--create table student.t4_offuture

CREATE TABLE student.t4_offuture
(
Row_ID int,
Order_ID varchar(15),
Order_Date varchar(12), 
Ship_Date varchar(12),
Ship_Mode varchar(17),
Customer_ID varchar(10), 
Customer_Name varchar(25),
Segment varchar(15),
City varchar(40),
State varchar(40),
Country varchar(40),
Postal_Code int,
Market varchar(10),
Region varchar(18),
Product_ID varchar(20),
Category varchar(20),
Sub_Category varchar(15),
Product_Name varchar(150),
Sales real,  
Quantity real,
Discount real,
Profit real,
Shipping_Cost real,
Order_Priority varchar(10)
)

-- offuture database

SELECT * 
FROM student.t4_offuture;

-- Completeness of data
--number of rows 

SELECT COUNT(*) 
FROM student.t4_offuture;


-- Range of numerical columns in table

SELECT MIN(row_id), MAX(row_id) FROM student.t4_offuture;
SELECT MIN(postal_code), MAX(postal_code) FROM student.t4_offuture;
SELECT MIN(sales), MAX(sales) FROM student.t4_offuture;
SELECT MIN(Quantity), MAX(Quantity) FROM student.t4_offuture;
SELECT MIN(discount), MAX(discount) FROM student.t4_offuture;
SELECT MIN(profit), MAX(profit) FROM student.t4_offuture;
SELECT MIN(shipping_cost), MAX(shipping_cost) FROM student.t4_offuture;

-- Null rate in data

SELECT COUNT(*) FROM student.t4_offuture WHERE  postal_code IS NULL;

 -- column names was changed in the below line to assess missing values for each column
SELECT COUNT(*) FROM student.t4_offuture WHERE  profit IS NULL;

-- Checking for duplicated rows in data

SELECT COUNT(row_id)
FROM student.t4_offuture
GROUP BY row_id
HAVING COUNT(row_id) > 1
ORDER BY COUNT(row_id);

-- Unique values in data attributes


SELECT

   COUNT(DISTINCT row_id) as row_count , COUNT(DISTINCT order_id) as order_count,
   COUNT(DISTINCT order_date) as orderDate_count, COUNT(DISTINCT ship_date) as shipDate_count,
   COUNT(DISTINCT ship_mode) as shipMode_count, COUNT(DISTINCT customer_id) as customer_count,
   COUNT(DISTINCT customer_Name) as custName_count, COUNT(DISTINCT segment) as seg_count,
   COUNT(DISTINCT city) as city_count, COUNT(DISTINCT country) as order_count, 
   COUNT(DISTINCT postal_code) as postalCode_count, COUNT(DISTINCT market) as market_count,
   COUNT(DISTINCT region) as region_count, COUNT(DISTINCT product_id) as product_count,
   COUNT(DISTINCT category) as category_count, COUNT(DISTINCT sub_category) as subCat_count,
   COUNT(DISTINCT product_name) as prodName_count, COUNT(DISTINCT sales) as sales_count,
   COUNT(DISTINCT quantity) as quantity_count, COUNT(DISTINCT discount) as discount_count,
   COUNT(DISTINCT profit) as profit_count, COUNT(DISTINCT shipping_cost) as shipping_count,
   COUNT(DISTINCT order_priority) as orderPriority_count
   
FROM
   student.t4_offuture;
  
-- Discriptive statistics for numerical variables

SELECT stddev(sales),AVG(sales) FROM student.t4_offuture;
SELECT stddev(profit),AVG(profit) FROM student.t4_offuture;
SELECT stddev(quantity),AVG(quantity) FROM student.t4_offuture;
SELECT stddev(discount),AVG(discount) FROM student.t4_offuture;
SELECT stddev(shipping_cost),AVG(shipping_cost) FROM student.t4_offuture;

--median
SELECT sales FROM student.t4_offuture Order By sales 
OFFSET (SELECT COUNT(*) FROM student.t4_offuture)/2 LIMIT 1;

SELECT profit FROM student.t4_offuture Order By profit 
OFFSET (SELECT COUNT(*) FROM student.t4_offuture)/2 LIMIT 1;

SELECT quantity FROM student.t4_offuture Order By quantity 
OFFSET (SELECT COUNT(*) FROM student.t4_offuture)/2 LIMIT 1;

SELECT discount FROM student.t4_offuture Order By discount 
OFFSET (SELECT COUNT(*) FROM student.t4_offuture)/2 LIMIT 1;

SELECT shipping_cost FROM student.t4_offuture Order By shipping_cost 
OFFSET (SELECT COUNT(*) FROM student.t4_offuture)/2 LIMIT 1;


-- Discriptive statistics for categorical variables
SELECT MIN(order_date),
MAX(order_date) 
FROM student.t4_offuture;
SELECT MIN(order_date),
MAX(order_date) 
FROM student.t4_offuture;

-- category with highest frequency in each categorical column.

-- Ship Mode

SELECT
  ship_mode,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  ship_mode
Order By num desc;

--Segment

SELECT
  segment,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  segment
Order By num desc;

--City

SELECT
  city,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  city
Order By num desc;

-- State

SELECT
  state,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  state
Order By num desc;

--Country

SELECT
  country,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  country
Order By num desc;

-- Market

SELECT
  market,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  market
Order By num desc;

--Region

SELECT
  region,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  region
Order By num desc;

-- Category

SELECT
  category,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  category
Order By num desc;

-- Sub-Category

SELECT
  sub_category,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  sub_category
Order By num desc;

-- Product Name

SELECT
  product_name,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  product_name
Order By num desc;

--Order Priority

SELECT
  order_priority,
  COUNT(*) As num
FROM
 student.t4_offuture
GROUP BY
  order_priority
Order By num desc;
