create database ORG

create table Worker(
Worker_id int not null primary key identity(1,1),
First_Name varchar(25),
Last_Name varchar(25),
Salary int,
Joining_Date Datetime
Department varchar(25)
)
 
insert into worker values('monika','arora',100000,cast('02-14-2014'as datetime),'HR')
insert into worker values('niharika','verma',80000,cast('02-16-2011 09:00:00'as datetime),'admin')
insert into worker values('vishal','singhal',300000,'14-02-20 09:00:00','HR')
insert into worker values('amitabh','singh',500000,'14-02-20 09:00:00','admin')
insert into worker values('vivek','bhati',500000,'14-06-11 09:00:00','admin')
insert into worker values('vipul','diwan',200000,'14-06-11 09:00:00','account')
insert into worker values('satish','kumar',75000,'14-01-20 09:00:00','account')
insert into worker values('geetika','chauhan',90000, '14-04-11 09:00:00','admin')

 
create table Bonas(
Worker_ref_id int,
Bonas_Amount int,
Bonus_Date DateTime,
foreign key(Worker_Ref_id) references Worker(Worker_id)
)
 
 insert into Bonus values(001,5000,'16-02-20')
 insert into Bonus values(002,3000,'16-06-11')
 insert into Bonus values(003,4000,'16-02-20')
 insert into Bonus values(001,4500,'16-02-20')
 insert into Bonus values(002,3500,'16-06-11')

 create table Title(
 Worker_ref_id int,
 worker_title varchar(25),
 affected_from datetime,
 foreign key(Worker_ref_id)
 references worker (worker_id)
 )

 insert into Title values(001,'manager','2016-02-20 00:00:00')
 insert into Title values(002,'executive','2016-06-11 00:00:00')
 insert into Title values(008,'executive','2016-06-11 00:00:00')
 insert into Title values(005,'manager','2016-06-11 00:00:00') 
 insert into Title values(004,'asst-manager','2016-06-11 00:00:00')
 insert into Title values(007,'executive','2016-06-11 00:00:00')
 insert into Title values(006,'lead','2016-06-11 00:00:00')
 insert into Title values(003,'lead','2016-06-11 00:00:00')

 --1).write an sql query to fetch "first_name"from worker table using the alise name as <worker_name>
 select first_name as worker_name from Worker

 --2).WRITE AN SQL QUERY TO FETCH "FIRST_NAME"FROM WORKER TABLE IN UPPER CASE
 select upper(first_name)from worker

 --3).write an sql query to prin the first three character of first_name from worker table
 select substring(first_name,1,3)from worker

 --4).write an sql query to fetch unique values of department from worker table.
 select distinct department from worker

 --5) write an sql query to find the position of the alphabet('a')in the first name column 'amitabh' from worker table.
 select instr(first_name,binary'a') from worker where first_name = 'amitabh'

 --6) write an sql query to print the first_name from worker table after removing white spaces from the right side
 select rtrim(first_name) from worker

 --7) write an sql query to print the department from worker table after removing white spaces from the left side.
 select ltrim(department)from worker

 --8) write an sql query that fetches the unique values of department from worker table and print its length
 select distinct length(department) from worker

 --9) write an sql query to print the first_name from worker table after replacing 'a' with 'A'.
 select replace(first_name),'a','A') from worker

 --10) write an sql query to print the first_name and last_name from worker table into a single column complete_name a space char should seperate them
 select concat(first_name,' 'last_name) as 'complete_name' from worker

 --11) write an sql query to print all worker details from the worker table order by first_name ascending.
 select * from worker order by first_name asc
 
 --12) write an sql query to print all worker details from the worker table order by first_name aceneding and department decending
 select * from worker order by first_name asc,department desc

 --13) write an sql query to print details for workers with the first name as "vipul" and "satish" from worker table'
 select * from worker where first_name in ('vipul','satish')

 --14) write an sql querry to print details of workers excluding first names,"vipul" and "satish" from worker table
 select * from worker where first_name not in ('vipul','satish')

 --15) write an sql query to print details of workers with department name as "admin"
 select * from worker where department like 'admin%' 

 --16) write an sql query to print details of the workers whose first_name contains 'a'
 select * from worker where first_name like '%a'

 --17) write an sql query to print details of the workers whose first_name ends with 'a'
 select * from worker where first_name like '%a'

 --18) write an sql query to print details of the workers whose first_name ends with 'h' and contains six alphabets 
 select * from worker where first_name like '_____h'

 --19) write an sql query to print details of the workers whose salary lies between 100000 and 500000
 select * from worker where salary between 100000 and 500000

 --20) write an sql query to print details of the worker who have joined in feb'2014
 select * from worker where year(joining_date) = 2014 and month(joining_date) = 2

 --21) write an sql query to fetch the count of employee working in the department 'admin'
 select count(*0) from worker where department = 'admin'

 --22) write an sql query to fetch worker names with salaries >= 50000 and <= 100000
 select concat(first_name,' ',last_name) as worker_name,salary
 from worker
 where worker_id in
 (select worker_id from worker where salary between 50000 and 100000)

 --23) write an sql query to fetch the no.of workers for each department in the descending ordder
 select department , count(worker_id) no_of_workers
 from worker 
 group by department order by no_of_workers desc

 --24) write an sql query to print details of the workers who are also managers
 select distinct w.first_name, t.worker_title
 from worker w
 inner join title t
 on w.worker_id = t.worker_ref_id
 and t.worker_title in ('manager')

 --25) write an sql query to fetch duplicate reecords having matching date in some field of a table
 select worker_title, affected_from, count(*)
 from title 
 group by worker_title,affected_from having count(*) > 1

 --26) write an sql query to show only odd rows from a table
 select * from worker where mod (worker_id,2) <> 0

 --27) write an sql query to show only even rows from a table
 select * from worker where mod(worker_id,2) = 0

 --28) write an sql query to clone a new table from another table
 select * into workerclone from worker 
 select * into workerclone from worker where 1= 0

 --29) write an sql query to fetch intersecting records of two tables
 (select * from worker)
 intersect
 (select * from workerclone)

 --30) write an sql query to show records from one table that another table does not have
 select * from worker
 minus
 select * from title

 --31) write an sql query to show the current date and time
 select curdate()

 --32) write an sql query to show the top n(say 10) records of a table
 select * from worker order by salary desc limit 10

 --33) write an sql query to determine the nth (say n=5) highest salary from a table
 select salary from worker order by salary desc limit n-1,1

 --34) write an sql query to determine the 5th highest salary without using top or limit method
 select salary 
 from worker w1
 where 4 =(
 select count (distinct(w2.salary))
 from worker w2
 where w2.salary >= w1.salary )

 --35) write an sql query to fetch the list of employees with the same salary
 select distinct w.Worker_id,w.salary
 from worker w,worker w1
 where w.salary = w1.salary
 and w.worker_id ! = w1.worker_id

 --36) write an sql query to show the second highest salary from a table
 select max(salary) from worker 
 where salary not in (select max(salary) from worker)

 --37) write an sql query to show one row twice in result from a table
 select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR'

--38. Write an SQL query to fetch intersecting records of two tables
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone)

--39. Write an SQL query to fetch the first 50% records from a table.
SELECT *
FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker)

--40. Write an SQL query to fetch the departments that have less than five people in it.
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5

--41. Write an SQL query to show all departments along with the number of people in there
SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT

--42. Write an SQL query to show the last record from a table.
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker)

--43 Write an SQL query to fetch the first row of a table.
Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker)

--44. Write an SQL query to fetch the last five records from a table.
SELECT * FROM Worker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5

--45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary

 --46. Write an SQL query to fetch three max salaries from a table.
 SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc

 --47. Write an SQL query to fetch three min salaries from a table.
 SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc

 --48. Write an SQL query to fetch nth max salaries from a table.
 SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc

 --49. Write an SQL query to fetch departments along with the total salaries paid for each of them
 SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT

 --50. Write an SQL query to fetch the names of workers who earn the highest salary.
 SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker)










 