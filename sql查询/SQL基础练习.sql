use master
go
if exists(select * from sysdatabases where name='TestSchool')
	drop database TestSchool
	go
	--�����ļ���
	--��ǰ�����߼�ѡ��
	exec sp_configure 'show advanced options',1
	go
	RECONFIGURE
	go
	exec sp_configure 'xp_cmdshell',1
	go
	RECONFIGURE
	go
	exec xp_cmdshell 'mkdir g:\testsql'
	
	--�������ݿ�
create database TestSchool
on primary
(
	name='TestSchool_data',
	size=3MB,
	FileGrowth=10%,
	maxSize=100MB,
	FileName='G:\sql��ѯ\TestSchool_data.mdf'
)
log on
(
	name='TestSchool_log',
	size=1MB,
	FileGrowth=10%,
	--maxSize=100MB,
	FileName='G:\sql��ѯ\TestSchool_log.ldf'
)

use TestSchool
go
if exists(select * from sysobjects where name='Teacher') 
drop table Teacher
go
--����
create table Teacher
(
	Id int primary key identity(1,1),  --�����Ƿǿ�Ψһ
	Name nvarchar(50) not null,   --not null ��Ϊ��
	Gender bit not null,
	Age int not null check(age>0 and age<=100),
	Salary money,
	Birthday datetime not null
)

