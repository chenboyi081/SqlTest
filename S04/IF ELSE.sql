--IF ELSE
--1.Ҳ�ж��غ�Ƕ��
--2.û�У�������begin..end���
--3.if�ṹ������������������
--4.û����ν��true/false
--5.()����ʡ��
--if(1<>1)
--	begin
--		print 'aa'
--		print 'bb'
--	end
go
--����officeƽ����������������ƽ����������60������ɼ���ߵ�����ѧ���ĳɼ������������������ѧ��
declare @subjectName nvarchar(50)='office'--��Ŀ����
declare @subjectId int=(select SubjectId from Subject where SubjectName=@subjectName)--��ĿID
declare @avg int--ƽ����
select @avg=(select AVG(StudentResult) from Result where SubjectId=@subjectId and studentresult is not null) 
if @avg>=60
 begin
	print '�ɼ���������ǰ������'
	select top 3 * from Result where SubjectId=@subjectId order by StudentResult desc 
 end
else
 begin
	print '�ɼ����á������������'
	select top 3 * from Result where SubjectId=@subjectId order by StudentResult asc  
 end   
