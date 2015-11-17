--go
--create view VW_getResult
--as
--select * from Student where Sex='��'
--go
--select * from VW_getResult

--go
----declare @subjectname nvarchar(50)='office'
----declare @subjectid int,@examtime datetime
----select @subjectid=(select subjectid from Subject where SubjectName=@subjectname)
----print @subjectid
----select @examtime=(select MAX(Result.ExamDate) from Result where SubjectId=@subjectid)
----select MAX(Result.StudentResult),MIN(Result.StudentResult) from Result where SubjectId=@subjectid and ExamDate=@examtime


--declare @subjectname nvarchar(50)='office'
--declare @subjectid int
--declare @avg int
--select @subjectid=(select Subject.SubjectId from Subject where Subject.SubjectName=@subjectname)
--select @avg=(select AVG(result.StudentResult) from Result where Result.SubjectId=@subjectid and Result.StudentResult is not null)
--print @avg
--if(@avg > 60)
--begin
--	print '��߷ֵ�����ѧ����Ϣ'
--	select top 3 * from Result where SubjectId=@subjectid order by StudentResult desc
--end
--else
--begin
--	print '��ͷֵ�����ѧ���ɼ�'
--	select top 3 * from Result where SubjectId=@subjectid order by StudentResult
--end

--declare @errorsum int=0
--begin transaction
--update bank set cmoney-=1000 where name='aa'
--set @errorsum=@errorsum+@@error
--update bank set cmoney+=1000 where name='bb'
--set @errorsum=@errorsum+@@error
--if(@errorsum<>0)
--rollback transaction
--else
--commit transaction
--select * from bank

--if exists(select * from sysobjects where name='usp_getAllStuInfo')
--drop proc usp_getAllStuInfo
--go
--create procedure usp_getAllStuInfo
--@sex varchar(2),
--@classname nvarchar(50)
--as
--declare @classid int=(select classid from grade where classname=@classname)
--select * from Student where sex=@sex and ClassId=@classid
--go

--execute usp_getAllStuInfo '��','���ڰ�'


--���myschollMoreDate�����²�������ӿ�Ŀ��Ϣ����Ӧ�ı���subject����ӳɹ�������ӵĿ�ĿID������б�Ҫ��Ҳ�뷵�ذ༶ID.
--���彨��Ҫ�����£�


--1.�����洢���̣����������ղ������༶���ƣ��γ����ƣ���ʱ������ʱ����Ĭ��ֵ��30��
--���������������һ���ǰ༶ID,һ���ǿγ�ID
--2.�ж�����İ༶���ƺͿγ������Ƿ�Ϊnull,������Ӧ�Ĵ�����ʾ
--3.��ʼ����
--4.�жϰ༶�Ƿ���� �����û�д��� ����ִ�в���༶��Ϣ���������õ���Ӧ�ı�ʶ��

--5.�ж������Ƿ���Ҫ�ع����������Ҫ��ִ�в���γ���Ϣ����

--6.�ж������Ƿ���Ҫ�ع����������Ҫ�͵õ���Ӧ�Ŀγ̱�� 
--7.�ύ������ɿγ���Ϣ����Ӳ�����

go
if exists(select * from sysobjects where name='usp_getSubjectId')		--�ж��Ƿ���ڴ洢����
drop procedure usp_getSubjectId
go
create procedure usp_getSubjectId
@classid int output,
@subjectid int output,
@subjectname nvarchar(50),
@classname nvarchar(50),
@classhour int=2
as
	if(@subjectname is null or @classname is null or LEN(RTRIM(LTRIM(@className)))=0 or LEN(RTRIM(LTRIM(@subjectName)))=0)
	print '�༶��γ�����Ϊ��'
	return 1 --�з���ֵ
	--insert into Subject 
	declare @error int=0
	begin transaction
	--�ж�����İ༶�����Ƿ��Ѿ�����
	if exists(select * from grade where classname=@classname)
		set @classid=(select classid from grade where classname=@classname)  --������ڣ���ֱ�ӷ��ػ�ȡ��classidֵ
	else
		begin
			insert into grade values(@classname)
			set @error=@error+@@error	--��¼����
			set @classid=(select @@IDENTITY)
			if(@error<>0)
			begin
				rollback transaction
				return 2	--�з���ֵ
			end
		end
	--�����¿γ̼�¼
	insert into Subject values(@subjectname,@classhour,@classid)
	set @error=@error+@@error	--��¼����
	set @subjectid =(select @@IDENTITY)
	if (@error<>0)
		begin
			rollback transaction
			return 3	--�з���ֵ
		end
	if (@error<>0)
		rollback transaction
	else
		commit transaction
go

--���ô洢����
--��������������Ĵ洢���̣���Ҫ������Ӧ���������͵ı������շ���ֵ
--����������������ô�ڵ��õ�ʱ��Ҳ����ʹ��output��Ϊ���յı��
--declare @subjectname nvarchar(50),@classname nvarchar(50),@classhour int
declare @cid int,@sid int
exec usp_getSubjectId @cid output,@sid output,'���˷����','���˰�',2
print @cid
print @sid