-- MyCompany���ݿ�
-- ���� MyCompany���ݿ�

--���ű� department
--	dId
--	dName
--Ա���� employee
--	eId
--	eName
--	eSex
--	eAge
--	eSalary
--	eDepId
--	eInTime ��ְʱ��

--����  ����  ��Լ��  ��Ӳ�������    ���� ��ɾ��

--1����ѯ����Ա��
--2����ѯ���ʳ���2000��Ǯ��Ա��
--3����ѯ���½�����5��Ա��  ---��������
--4����ѯԱ����ƽ������ select avg() from 
--5����ѯ�ܹ��ж���Ա�� count
--6����ѯÿ�������ж���Ա�� ---�����ŷ���
--7����ѯÿ�����ŵ�ƽ������
--8����ѯÿ��������Ա����ƽ������
--9����ѯƽ�����ʳ���2000����Щ����
--10����ѯԱ�����ʣ����������ʣ���ͬʱ��ͬһ�������ʾƽ�����ʺ���߹���
--select ' '+���������� from ��
--union
--select cast(ƽ������ as varchar()),��߹��� from ��
--11����ѯ���������'��,��'����ЩԱ�������Խ��������������

use master
if exists(select * from sysdatabases where name='MyCompany')
drop database MyCompany
go
--�����ļ���
	--��ǰ�����߼�ѡ��
	--exec sp_configure 'show advanced options',1
	--go
	--RECONFIGURE
	--go
	--exec sp_configure 'xp_cmdshell',1
	--go
	--RECONFIGURE
	--go
	--exec xp_cmdshell 'mkdir g:\testsql'


create database MyCompany   --�����ݿ�
on primary
(
	name='MyCompany_data',
	size=3MB,
	FileGrowth=10%,
	maxSize=100MB,
	FileName='G:\sql��ѯ\MyCompany_data.mdf'
)
log on
(
	name='MyCompany_log',
	size=1MB,
	FileGrowth=10%,
	FileName='G:\sql��ѯ\MyCompany_log.ldf'
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
		EInTime datetime    --��ְʱ��
)

go
alter table employee
add constraint PK_EId primary key(EId),
constraint FK_employee_department_EDepId foreign key(EDepId) references department(DId)
go

use Mycompany --�������
insert into department values ('����')
insert into department values('����')
insert into department values ('Ļ��')
insert into department values ('������')

insert into employee values('����ʦ', 0, 28, 10000, 1, '2006-08-08')
insert into employee values('����', 1, 45, 9000, 2, '2004-08-08')
insert into employee values('������ʦ', 0, 35, 6000, 1, '2004-01-08')
insert into employee values('����һ��', 0, 19, 1800, 1, '2013-02-08')
insert into employee values('�ƹ�ʦ', 1, 24, 1600, 3, '2010-08-08')
insert into employee values('����ʦ', 1, 25, 1800, 3, '2009-08-08')
insert into employee values('·�˼�', 1, 24, 1550, 4, '2010-05-08')
insert into employee values('��һ��', 1, 30, 5000, 1, '2006-08-08')
insert into employee values('������', 1, 35, 7000, 2, '2009-03-05')
insert into employee values('����·��', 1, 35, 2500, 4, '2005-07-20') 
go