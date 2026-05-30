create database superstore
use superstore

select * from cleanedsuperstore


select Order_ID,Round(Sales,2) as 'Sales' from cleanedsuperstore
order by 'Sales' desc



select Order_ID,Product_Name ,Round(Profit,2) as 'Profit' from cleanedsuperstore
order by 'Profit' desc

select Order_ID,Product_Name ,Round(Sales,2) as 'Sales' from cleanedsuperstore
order by 'Sales' desc

select Customer_Name,Round(Sum(Profit),2) as 'Tot Profit' from cleanedsuperstore
group by Customer_Name
order by 'Tot Profit' desc

select Country_Region, Round(Sum(Profit),2) as 'Tot Profit' from cleanedsuperstore
group by Country_Region
order by 'Tot Profit' desc

select City, Round(Sum(Profit),2) as 'Tot Profit' from cleanedsuperstore
where Country_Region = 'UNited States'
group by City
order by 'Tot Profit' desc


select City, Round(Sum(Profit),2) as 'Tot Profit' from cleanedsuperstore
where Country_Region = 'Canada'
group by City
order by 'Tot Profit' desc

select Region, Round(Sum(Profit),2) as 'Tot Profit' from cleanedsuperstore
where Country_Region = 'Canada'
group by Region
order by 'Tot Profit' desc

select Region, Round(Sum(Sales),2) as 'Tot Sales' from cleanedsuperstore
where Country_Region = 'Canada'
group by Region
order by 'Tot Sales' desc

select Category, Round(Sum(Profit),2) as 'Tot Profit' from cleanedsuperstore
group by Category
order by 'Tot Profit' desc

select Category, Round(Sum(Sales),2) as 'Tot Sales' from cleanedsuperstore
group by Category
order by 'Tot Sales' desc

select Sub_Category, Round(Sum(Profit),2) as 'Tot Profit' from cleanedsuperstore
group by Sub_Category
order by 'Tot Profit' desc

select Sub_Category, Round(Sum(Profit),2) as 'Tot Sales' from cleanedsuperstore
group by Sub_Category
order by 'Tot Sales' desc

select Round(Discount,2) as 'Discount', Round(SUM(Sales),2) as 'Tot Sales' from cleanedsuperstore
group by Round(Discount,2)
order by 'Tot Sales' desc

select Ship_Mode, Round(SUM(Sales),2) as 'Tot Sales' from cleanedsuperstore
group by Ship_Mode
order by 'Tot Sales' desc


select Ship_Mode, Round(SUM(Profit),2) as 'Tot Profit' from cleanedsuperstore
group by Ship_Mode
order by 'Tot Profit' desc

select Ship_Mode, Avg(Shipping_Days) as 'Shipping_Days' from cleanedsuperstore
group by Ship_Mode
order by 'Shipping_Days' asc


select DATEPART(MONTH,Order_Date) as 'Month',DATEPART(Year,Order_Date) as 'Year', Round(Sum(Sales),2) as 'Monthly_Sales',Round(Sum(Profit),2) as 'Monthly_Profit' from cleanedsuperstore

group by DATEPART(Year,Order_Date),DATEPART(MONTH,Order_Date)
order by DATEPART(Year,Order_Date),DATEPART(MONTH,Order_Date) asc

with ranks as (
select Region,Country_Region,Profit,DENSE_RANK()over(partition by Country_Region order by Profit desc) as 'Rank' from cleanedsuperstore)
select Country_Region,Region,Profit, Rank from ranks
where Rank <4



