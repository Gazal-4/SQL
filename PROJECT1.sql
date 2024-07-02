create database project1;
use project1;

select * from products;
select * from sales;

/* 1. Sales report above 30000000 */
select p.Product_ID,p.Product_Name,s.Customer_Name,s.Salesperson,s.Customer_Type,s.Value_in_Naira
from products p
INNER JOIN sales s
on p.Product_ID = s.Product_ID
where Value_in_Naira >= 30000000
order by Value_in_Naira desc;

/* 2. Customer Sales value by recent date*/
select Customer_Name,Customer_Type,Date,Value_in_Naira
from sales
order by Date desc;

/* 3. Customer_Type changed to Channel */
select Customer_Name,Customer_Type as Channel,Date,Value_in_Naira
from sales
order by Date desc;

/* 4. Biggest contributor based on Customer_Type */
select Customer_Type,Value_in_Naira
from sales
group by Customer_Type,Value_in_Naira
order by sum(Value_in_Naira) desc;

/* 5. Both datasets combined */
select p.Product_ID,p.Product_Name,p.Brand,p.UoM,s.Sales_ID,s.Customer_Name,s.Location,
s.Salesperson,s.Customer_Type,s.Date,s.Quantity,s.Value_in_Naira
from products p
left join sales s
on p.Product_ID = s.Product_ID;

/* 6. 2017-2019 Records for Salesperson named Kristi in desc  */
select p.Product_ID,p.Product_Name,p.Brand,p.UoM,s.Sales_ID,s.Customer_Name,s.Location,
s.Salesperson,s.Customer_Type,s.Date,s.Quantity,s.Value_in_Naira
from products p
left join sales s
on p.Product_ID = s.Product_ID
where Salesperson = "kristi" and Date between 2017 and 2019;

/* 7. Products and their sales values*/
select p.Product_Name,sum(s.Value_in_Naira) as total_values
from products p
left join sales s
on p.Product_ID = s.Product_ID
group by p.Product_Name;

/* 8. Data aggregation/sum/avg/max/min sales values */
select sum(Value_in_Naira) as Total_sales, 
avg(Value_in_Naira) as avg_sales,
min(Value_in_Naira) as min_sales,
max(Value_in_Naira) as max_sales
from sales;

/* 9. Total quantity,total sales, total price for each product */
select p.Product_ID,p.Product_Name,sum(s.Quantity) as Quantity,sum(s.Value_in_Naira) as Revenue
from products p
left join sales s
on p.Product_ID = s.Product_ID
group by  p.Product_ID,p.Product_Name
order by Revenue desc;





