---�ֲ�����--
--�﷨
--declare @���� ����=��ʼֵ
declare @name varchar='aaaa' --����ַ���û��ָ�����ȣ���ô���Ⱦ���1
print @name
--���ָ�ֵ��ʽ:��sql��Ϊ������ֵ����ʹ��set/select,������ֱ��ʹ��  ����=ֵ
--set:������ֱ�Ӹ�һ�������ֵ
--select:������ͨ����ѯ��ֵ
go
--��ѯ����˼���ѧԱ��Ϣ
select * from Student where BornDate<(select BornDate from Student where StudentName='��˼')
go
declare @time datetime
--set���������sql��䣬��ô����������� �����Ӳ�ѯ
--set @time=(select  BornDate from Student where StudentName='��˼')
--ʹ��select��ֵ�����������sql��䣬�����Ƕ����Ӳ�ѯ��Ҳ����ʡ��select�ؼ���
select @time=  BornDate from Student where StudentName='��˼'
print @time
--ʹ��set/select��ֵ�Ĺ�ͬ��
--1.����ֱ�Ӹ�ֵ
--2.��������sql�����һ������Sql��䣬��ô����û���κε�����
go
--����
declare @age int=100,@name varchar(50)='aaa'
--1.setһ��ֻ��Ϊһ��������ֵ,��select����һ��Ϊ���������ֵ
--set @age=20 ,@name='����'
--select @age=20 ,@name='����'
--2.set���и�ֵ��ʱ�����sql��䷵�ض���һ��ֵ����ô���Ӳ�ѯ���ص�ֵ��ֹһ�������Ӳ�ѯ������ =��!=��<��<=��>��>= ֮�󣬻��Ӳ�ѯ�������ʽʱ����������ǲ�����ġ����������select��ֵ��sql���ʡ����select.��ô��õ����һ��ֵ
--set @name=(select StudentName from Student)
--select @name= StudentName from Student
--3.���sql��䷵��nullֵ����ôset���Ϊnullֵ��select�ᱣ��ԭʼֵ
--set @name=(select StudentName from Student where StudentNo=100)
select @name= StudentName from Student where StudentNo=100
print @name
print @age


--���������ʽ��
--select:�Խ�����ķ�ʽ���
--print :���ı���ʽ���,ÿһ��print����ռ��һ��,����Զֻ�����һ��ֵ,�����ڷ������������
select * from Student
print 'aa' +'bb'

--��ѯ�μ����һ�Ρ�office�����Գɼ���߷ֺ���ͷ�
select MAX(StudentResult),MIN(StudentResult) from Result
where  SubjectId=(select subjectid from subject where subjectname='office') and ExamDate=(select max(examdate) from result where subjectid=(select subjectid from subject where subjectname='office'))
declare @subjectname nvarchar(50)='office' --��Ŀ����
go
declare @subjectname nvarchar(50)='office' --��Ŀ����
declare @subjectId int --��Ŀ ID
set @subjectId=(select subjectid from subject where subjectname=@subjectname)
declare @time datetime --���һ�ο�������
select @time=MAX(examdate) from Result where SubjectId=@subjectId
--��ѯ
select MAX(StudentResult),MIN(StudentResult) from Result where SubjectId=@subjectId and ExamDate=@time


