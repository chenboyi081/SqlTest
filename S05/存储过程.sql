--exec sp_renamedb 'aa','MySchool'
--�Զ���洢����
�﷨��
--go
--create proc usp_�Զ������� --��������
--����--�βΣ��൱�ڷ�����()
--�������
--	û��Ĭ��ֵ��--����ʱ�����ֵ
--	��Ĭ��ֵ���β�--����ʱ��������
--�������--out/ref---output
--as --������
-- �������
--�߼����
--����ֵ---return 
--go

--��ѯ����ѧԱ��Ϣ
if exists(select * from sysobjects where name='usp_getAllStudentInfo')
 drop proc usp_getAllStudentInfo
go
create proc usp_getAllStudentInfo
--()
as
--������
	select * from Student
go --�����˴洢���̡�����������������ͼ�����Ƕ�ײ���(������Ϊ 32)��
--ִ�д洢���̣���ȡ����ѧԱ��Ϣ
exec usp_getAllStudentInfo

--��ѯָ���༶��ѧԱ��Ϣ
if exists(select * from sysobjects where name='usp_getAllStudentInfoByClassName')
 drop proc usp_getAllStudentInfoByClassName
go
create proc usp_getAllStudentInfoByClassName
@className nvarchar(50) --�����������Ҫ���declare�ؼ���
as
declare @classId int --�༶ID
set @classId=(select classid from grade where classname=@className)
--��ѯ
select * from Student where ClassId=@classId
go
--ִ�д洢���̣����ݰ༶���ƻ�ȡѧԱ��Ϣ
exec usp_getAllStudentInfoByClassName '���ڰ�'

--��ѯָ���༶ָ���Ա��ѧԱ��Ϣ
if exists(select * from sysobjects where name='usp_getAllStudentInfoByClassNameAndSex')
 drop proc usp_getAllStudentInfoByClassNameAndSex
go
create proc usp_getAllStudentInfoByClassNameAndSex
@className nvarchar(50),--��ֻ�ǲ����б��е�һ���������ܵ���ִ�У�������Ҫʹ�ã�����
@sex char(2)='��'--һ���ǽ��齫��Ĭ��ֵ�Ĳ���д�ڲ����б�������һ����c#��һ�����Ǳ߻ᱨ��
as
declare @classid int
set @classid=(select classid from grade where classname=@className)
select * from Student where ClassId=@classid and Sex=@sex
go
--ִ�д洢���̣����ݰ༶���ƺ��Ա𷵻�ѧԱ��Ϣ
--���ʵ��ֵ�ĳ��ȴ����βεĳ��ȣ���ôϵͳ�����ضϣ������ᱨ��
--���ĳ������ʹ����  ������ֵ�ķ�ʽ����ô�������֮������в���������ʹ�����ָ�ʽ������֮ǰ�Ͳ���
Exec usp_getAllStudentInfoByClassNameAndSex  @className='���ڰ�',@sex=default


---���ݰ༶���ƺ��Ա��ȡѧԱ��Ϣ��ͬʱ���ط���������������
if exists(select * from sysobjects where name='usp_getCountAndinfoByClassNameAndSex')
 drop proc usp_getCountAndinfoByClassNameAndSex
go
create proc usp_getCountAndinfoByClassNameAndSex
@className nvarchar(50),--�༶����
@cnt int output, --��Ҫ���ص������� output˵������һ�����������ouput�ı��ʾ��������������������������ݵ�һ����ǣ���Ӧ��c#�е�out���ʹ��ݲ������ڵ��õ�ʱ��Ҳ��Ҫ���out�ؼ���
@name nvarchar(50) output, --�����ж���������
@sex char(2)='��'--�Ա�
as
declare @classid int
set @classid=(select classid from grade where classname=@className)
select * from Student where ClassId=@classid and Sex=@sex
set @cnt=(select COUNT(*) from Student  where ClassId=@classid and Sex=@sex )
set @name=(select  top  1 StudentName from Student order by StudentName desc)
go
--��������������Ĵ洢����
declare @count int
declare @name nvarchar(50)
--����=ֵ  ouput�ı��ʾ��������������������������ݵ�һ�����
--@cnt=@count output:���þ��ǣ������������@cnt����洢��@count����
exec usp_getCountAndinfoByClassNameAndSex @cnt=@count output, @className='���ڰ�',@name=@name output
print @count
print @name
--1.����ڴ洢������û��Ϊ���������ֵ�������ڵ��õ�ʱ��Ϊ��������ı�����ֵ��Ĭ��ֵ����ô����ͷ���֮ǰ��Ĭ��ֵ����������ڴ洢������Ϊ���������ֵ�ˣ���ô�ͷ��ش洢�����������ֵ
--2.����ʲô������ڴ洢������Ϊ���������ֵΧĬ��ֵ����ð��������

---����ͨ��return����ֵ�Ĵ洢����
if exists(select * from sysobjects where name='usp_getCountbySex')
 drop proc usp_getCountbySex
go
create proc usp_getCountbySex
@sex char(2)='��'
as
declare @cnt int=(select COUNT(*) from Student where Sex=@sex)
print '����ֵǰ���������'
return @cnt --�൱�ڷ�����return���������ǰ�洢���̵�ִ��
print '����ֵ�����������'
go
--����ͨ��return����ֵ�Ĵ洢����
declare @num varchar(10)
exec @num= usp_getCountbySex
print @num
