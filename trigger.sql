select * from emp
select * from empaudit
create table emp
(
id int primary key identity(1,1),
name varchar(20),
contact varchar(10)
)
insert into emp values('Nikhil',7397875540)
insert into emp values('Akash',7397875549)
insert into emp values('Hitesh',7397875548)
create table empaudit
(
auditid int primary key identity(1,1),
description varchar(100)
)
 


create trigger tr_emp_forinsert
on emp for insert
as begin
declare @id int
select @id=id from inserted
insert into empaudit values('new emp with id '+ cast(@id as varchar(5))
+ ' is added at '+ cast(getdate() as varchar(20)))
end

create trigger tr_emp_fordelete
on emp for delete
as begin
declare @id int
select @id=id from deleted
insert into empaudit values('new emp with id '+ cast(@id as varchar(5))
+ ' is removed at '+ cast(getdate() as varchar(20)))
end

delete from emp where id=1

CREATE trigger [dbo].[tr_empl_forup]
on [dbo].[emp] after update
as begin
declare @id int
declare @oldname varchar(20),@newname varchar(20)
declare @oldcontact varchar(10),@newcontact varchar(10)
declare @discription varchar (100) , @newdiscription varchar(100)
select * into #TempTable from inserted
while(Exists(select Id from #TempTable))
begin
set @discription='
select Top 1 @id=Id,@newname=Name,@new
from #TempTable
