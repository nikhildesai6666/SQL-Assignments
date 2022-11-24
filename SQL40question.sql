create table Customers(
CustomerId int primary key identity (1,1),
CustomerName varchar(20) not null,
Product varchar(20) not null,
Price varchar(20) not null,
City varchar(20) not null,
PostalCode int,
Country varchar(20) not null,
)

insert into Customers values('Akash','Table',15000,'Berlin',123456,'US')
insert into Customers values('Akshay','sofa',10000,'Tokyo',111222,'USA')
insert into Customers values('vikas','bed',17000,'shanghai',123123,'CHINA')
insert into Customers values('babasaheb','Pavlova',7000,'nagaland',121212,'Norway')
insert into Customers values('vishnu','TV',25000,'Banglore',232323,'IND')
insert into Customers values('samadhan','Fridge',15000,'London',163245,'UK')
insert into Customers values('amol','Geitost',3000,'Asia',123321,'AUS')
insert into Customers values('krushna','chair',1000,'briten',123214,'france')

--Write a statement that will select the City column from the Customers table
select city from Customers

--Select all the different values from the Country column in the Customers table
select distinct Country from Customers

--Select all records where the City column has the value "London
select * from customers where city='london'

--Use the NOT keyword to select all records where City is NOT "Berlin".
select * from customers where not city='berlin'

--Select all records where the CustomerID column has the value 23
select * from customers where Customerid=7

--Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select * from customers where city='berlin' and postalcode=123456

--Select all records where the City column has the value 'Berlin' or 'London'.
select * from customers where city='berlin' or city='london'

--Select all records from the Customers table, sort the result alphabetically by the column City
select * from Customers order by City

--Select all records from the Customers table, sort the result reversed alphabetically by the column City
select * from Customers order by city desc

--Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City

--select * from Customers order by country and city

--Select all records from the Customers where the PostalCode column is empty.
select * from Customers where PostalCode is null 

--Select all records from the Customers where the PostalCode column is NOT empty.
select * from Customers where PostalCode is not null

--Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway"
update Customers set City='oslo' where Country='norway'

--Delete all the records from the Customers table where the Country value is 'Norway'.
delete from Customers where country='Norway'

--Use the MIN function to select the record with the smallest value of the Price column.
select min(price) as minprice from Customers

--Use an SQL function to select the record with the highest value of the Price column.
select max(price) as maxprice from Customers

--Use the correct function to return the number of records that have the Price value set to 20
select count (*)from Customers where Price = 20

--Use an SQL function to calculate the average price of all products
select avg(price) as avgprice from Customers

--Use an SQL function to calculate the sum of all the Price column values in the Products table
select sum(price) from Customers

--Select all records where the value of the City column starts with the letter "a"
select * from customers where CustomerName like 'a%'

--Select all records where the value of the City column ends with the letter "a"
select * from customers where CustomerName like '%a'

--Select all records where the value of the City column contains the letter "a".
select * from customers where CustomerName like '%a%'

--Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select * from customers where City like 'b%n'

--Select all records where the value of the City column does NOT start with the letter "a".
select * from customers where City not like 'a%'

--Select all records where the second letter of the City is an "a".
select * from customers where City like 'a___'

--Select all records where the first letter of the City is an "a" or a "c" or an "s".
select * from customers where City  like '[acs]%'

--Select all records where the first letter of the City starts with anything from an "a" to an "f".
select * from customers where City  like '[a-f]%'

--Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select * from customers where City not like '[acf]%'

--Use the IN operator to select all the records where the Country is either "Norway" or "France".
select * from Customers where Country in('norway','france')

--Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select * from Customers where Country not in('norway','france')

--Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20
select * from Customers where price between 4000 and 12000

--Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
select * from Customers where price not between 4000 and 12000

--Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
select * from Customers where Product between 'geitost' and 'pavlova'

--When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select CustomerName,postalcode Pno from Customers

--When displaying the Customers table, refer to the table as Consumers instead of Customers.
select * from Customers AS consumers

--List the number of customers in each country.
select count(CustomerId),country from Customers group by country order by count(CustomerId)

--List the number of customers in each country, ordered by the country with the most customers first.
select count(CustomerId),country from Customers group by country order by count(CustomerId)desc

--Write the correct SQL statement to create a new database called testDB.
create database testdb

--Write the correct SQL statement to delete a database named testDB
drop database testdb

--Add a column of type DATE called Birthday in Persons table
alter table persons add birthday date

--Delete the column Birthday from the Persons table
alter table persons drop column birthday



select * from customers