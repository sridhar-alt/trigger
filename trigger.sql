CREATE TABLE userdb
(
userid int not null PRIMARY KEY identity(1,1),
Name varchar(20) not null,
MobileNumber varchar(10)unique not null,
DOB date not null,
Sex varchar(1) not null,
age int not null check (age>18),
useraddress varchar(25) not null,
passwords varchar(25) not null,
)


INSERT INTO userdb(Name,MobileNumber, DOB,Sex,age,useraddress,passwords)
VALUES ('sridhar','2321342344', '02-Apr-98','m',24,'salem','12345');

delete  from  userdb where userid=1;


drop table userdb;

select * from userdb;

drop table EntryUser;

select * from EntryUser;


create table EntryUser
(
id int not null,
Name varchar(20) not null,
DOB date not null,
Sex varchar(1) not null,
useraddress varchar(25) not null,
timeuser DateTime not null,
operation char(3) not null,
check(operation ='ins' or operation ='del')
)


create trigger trginsertuser
 on userdb
After insert,delete,update
as
begin
    insert into EntryUser(id,Name,DOB,Sex,useraddress,timeuser,operation)
	select i.userid,Name,DOB,Sex,useraddress,GETDATE(),'ins' from inserted as i
	union all
	select d.userid,Name,DOB,Sex,useraddress,GETDATE(),'del' from deleted as d
end

drop trigger trginsertuser;

drop table EntryUser;

select * from EntryUser;


--views

create view age18 as
select userid,Name,DOB,Sex,useraddress,age from userdb
where age>18;

select * from age18;