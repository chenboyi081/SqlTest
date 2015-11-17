-- MyCompany数据库
-- 创建 MyCompany数据库

--部门表 department
--	dId
--	dName
--员工表 employee
--	eId
--	eName
--	eSex
--	eAge
--	eSalary
--	eDepId
--	eInTime 入职时间

--建库  建表  建约束  添加测试数据    更新 和删除

--1、查询所有员工
--2、查询工资超过2000快钱的员工
--3、查询最新进来的5个员工  ---降序排序
--4、查询员工的平均工资 select avg() from 
--5、查询总共有多少员工 count
--6、查询每个部门有多少员工 ---按部门分组
--7、查询每个部门的平均工资
--8、查询每个部门男员工的平均工资
--9、查询平均工资超过2000的那些部门
--10、查询员工工资（姓名，工资）的同时，同一结果集显示平均工资和最高工资
--select ' '+姓名，工资 from 表
--union
--select cast(平均工资 as varchar()),最高工资 from 表
--11、查询名字里包含'定,月'的这些员工，并对结果按照年龄排序

use master
if exists(select * from sysdatabases where name='MyCompany')
drop database MyCompany
go
--创建文件夹
	--此前开启高级选项
	--exec sp_configure 'show advanced options',1
	--go
	--RECONFIGURE
	--go
	--exec sp_configure 'xp_cmdshell',1
	--go
	--RECONFIGURE
	--go
	--exec xp_cmdshell 'mkdir g:\testsql'


create database MyCompany   --建数据库
on primary
(
	name='MyCompany_data',
	size=3MB,
	FileGrowth=10%,
	maxSize=100MB,
	FileName='G:\sql查询\MyCompany_data.mdf'
)
log on
(
	name='MyCompany_log',
	size=1MB,
	FileGrowth=10%,
	FileName='G:\sql查询\MyCompany_log.ldf'
)



	
go
use MyCompany
if exists(select * from sysobjects where name='department')
drop table department
go
create table department
(
		DId int primary key identity(1,1),
		DName nvarchar(50) not null
)	

go
if exists(select * from sysobjects where name='employee')
drop table employee
go
create table employee
(
		EId int  identity(1,1),
		EName nvarchar(50) not null,
		ESex bit not null,
		EAge int not null,
		ESalary money,
		EDepId int not null,
		EInTime datetime    --入职时间
)

go
alter table employee
add constraint PK_EId primary key(EId),
constraint FK_employee_department_EDepId foreign key(EDepId) references department(DId)
go

use Mycompany --添加数据
insert into department values ('主演')
insert into department values('导演')
insert into department values ('幕后')
insert into department values ('跑龙套')

insert into employee values('苍老师', 0, 28, 10000, 1, '2006-08-08')
insert into employee values('导演', 1, 45, 9000, 2, '2004-08-08')
insert into employee values('武兰老师', 0, 35, 6000, 1, '2004-01-08')
insert into employee values('新人一号', 0, 19, 1800, 1, '2013-02-08')
insert into employee values('灯光师', 1, 24, 1600, 3, '2010-08-08')
insert into employee values('音响师', 1, 25, 1800, 3, '2009-08-08')
insert into employee values('路人甲', 1, 24, 1550, 4, '2010-05-08')
insert into employee values('男一号', 1, 30, 5000, 1, '2006-08-08')
insert into employee values('副导演', 1, 35, 7000, 2, '2009-03-05')
insert into employee values('资深路人', 1, 35, 2500, 4, '2005-07-20') 
go