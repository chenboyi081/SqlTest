--SQL�������--
--1.sql�����ǽ�������
--2.�������ִ�Сд
--3.û�С����������ַ������ַ�����ʹ��''����
--4.sql����Ҳ��������c#�������
--	�����������+ - * / %
--	��ϵ�������>  <   >= <=    =(��ֵ���߼���ȶ���=)��  <>   !=
--	�߼������������not�� &&(and) || (or)
--5.��sql��û��BOOLֵ�ĸ��Ҳ����ζ�������в���дtrue/false  ���Ƕ���bit���͵�ֵ������ͼ����ֻ������true/false,�����ڴ�����ֻ������1/0
--6.��sql��Ҳ��if..else   ����whileѭ��
--7.��Ҳ��һЩ�����ؼ��֣�object address user var
--8.sql������Ҫ���Ǻ��ϸ��������Ͷ�����ת��Ϊ�ַ������д���


---�������ݿ⣺--
--���ݿ�����--
--�߼�����--name
--��ʼ��С--size
--�ļ�����---filegrowth
--�ļ�·��--filename
--�﷨:
--create database ���ݿ�����
--on �ļ���
--��
----���ݿ�����--
----�߼�����--name
----��ʼ��С--size
----�ļ�����---filegrowth
----�ļ�·��--filename
--��
--log on
--(
----���ݿ�����--
----�߼�����--name
----��ʼ��С--size
----�ļ�����---filegrowth
----�ļ�·��--filename
--)
--�Զ������ļ���   execute ִ��  xp--extends procedure
exec sp_configure 'show advanced options',1
go
reconfigure
go
exec sp_configure 'xp_cmdshell' ,1
go
reconfigure
go
execute xp_cmdshell 'mkdir d:\project'
--�ж����ݿ��Ƿ��Ѿ����ڣ�������ھ���ɾ���ٴ���
use master --��Ϊ���ݿ�ļ�¼���洢���master���sysdatabases����
if exists( select * from sysdatabases where name='MyBase')--exists��һ�������������жϣ����еĽ�����Ƿ�Ϊnull,���Ϊnull.�ͷ���false,���򷵻�true
 drop database MyBase --drop������ע���ṹ��
go
create database MyBase --ָ�����ݿ�����
on primary --Ĭ�Ͼ������ļ���
(
name='MyBase_data',--�߼����� ����䲻��һ����Զ���ִ�е�����ʱ�����Ҫ��ӣ���������һ�������е�һ��
size=3mb, --��ʼ��С
fileGrowth=10%,--�ļ�������ÿһ�α�ǰһ������10%������
maxsize=1000mb,--�����ļ����������
filename='d:\project\MyBase_data.mdf' --�ļ�ȫ·��������ָ���ļ�����չ�������һ�䲻��Ҫ��ӣ�
),
filegroup mygroup --�����ļ��飬��ô��������һ�����ݿ�ͻᴴ��������ļ�����
(
name='MyBase_data1',--�߼����� ����䲻��һ����Զ���ִ�е�����ʱ�����Ҫ��ӣ���������һ�������е�һ��
size=3mb, --��ʼ��С
fileGrowth=10%,--�ļ�������ÿһ�α�ǰһ������10%������
maxsize=1000mb,--�����ļ����������
filename='e:\aa\MyBase_data1.ndf' --�ļ�ȫ·��������ָ���ļ�����չ�������һ�䲻��Ҫ��ӣ�
)
log on
(
name='MyBase_log',--�߼����� ����䲻��һ����Զ���ִ�е�����ʱ�����Ҫ��ӣ���������һ�������е�һ��
size=3mb, --��ʼ��С
fileGrowth=10%,--�ļ�������ÿһ�α�ǰһ������10%������,��־�ļ�һ�㲻�������ļ���С
filename='d:\project\MyBase_log.ldf' --�ļ�ȫ·��������ָ���ļ�����չ�������һ�䲻��Ҫ��ӣ�
),
(
name='MyBase_log1',--�߼����� ����䲻��һ����Զ���ִ�е�����ʱ�����Ҫ��ӣ���������һ�������е�һ��
size=3mb, --��ʼ��С
fileGrowth=10%,--�ļ�������ÿһ�α�ǰһ������10%������,��־�ļ�һ�㲻�������ļ���С
filename='d:\project\MyBase_log1.ldf' --�ļ�ȫ·��������ָ���ļ�����չ�������һ�䲻��Ҫ��ӣ�
)


--�������ݱ�
--�﷨��
--create table ����
--(
-- �ֶ�����   ����   �ֶε���������ʶ�� �Ƿ����Ϊnull ���� Ψһ�� ��� checkԼ����,--���������Ⱥ�
-- �ֶ�����   ����   �ֶε���������ʶ�� �Ƿ����Ϊnull ���� Ψһ�� ��� checkԼ����
--)
--Student��Id��ѧ����ţ��Զ���ţ���������Name��ѧ����������Gender���Ա𣩡�Address����ͥ��ַ����Phone���绰����Age�����䣩��Birthday���������ڣ�CardId�����֤�ţ���CId���༶Id��
use MyBase
if exists(select * from sysobjects where name='Student')
--��sql�е�if����������
begin
	--print '���ݱ����' --Ĭ��ֻ����һ��
	drop table Student
end
go--����������ı��
create table  Student
(
Id int primary key identity(1,1) ,--��һ�������Ǳ�ʶ���ӣ��ڶ��������Ǳ�ʶ����
Name nvarchar(50) not null, --һ��Ҫ�ǵ�Ϊ�ַ����͵��ֶ����ó��ȣ���Ȼ����Ĭ�Ͼ���1  not null ����˵������ַ��ǿ�--�����ֵ
Gender char(2) not null,
[Address] nvarchar(100) null,--���Ϊ�տ�������Ϊnull,���߸ɴ಻д��������˵������ֶε�ֵ����Ϊnull
Phone char(13),
Age int check(age>0 and age<100),
CardId char(18) not null,
Birthday datetime not null,
CId int not null
)