use master
go
if exists(select * from sysdatabases where name='TestSchool')
	drop database TestSchool
	go
	--创建文件夹
	--此前开启高级选项
	exec sp_configure 'show advanced options',1
	go
	RECONFIGURE
	go
	exec sp_configure 'xp_cmdshell',1
	go
	RECONFIGURE
	go
	exec xp_cmdshell 'mkdir g:\testsql'
	
	--创建数据库
create database TestSchool
on primary
(
	name='TestSchool_data',
	size=3MB,
	FileGrowth=10%,
	maxSize=100MB,
	FileName='G:\sql查询\TestSchool_data.mdf'
)
log on
(
	name='TestSchool_log',
	size=1MB,
	FileGrowth=10%,
	--maxSize=100MB,
	FileName='G:\sql查询\TestSchool_log.ldf'
)

use TestSchool
go
if exists(select * from sysobjects where name='Teacher') 
drop table Teacher
go
--建表
create table Teacher
(
	Id int primary key identity(1,1),  --主键是非空唯一
	Name nvarchar(50) not null,   --not null 不为空
	Gender bit not null,
	Age int not null check(age>0 and age<=100),
	Salary money,
	Birthday datetime not null
)

