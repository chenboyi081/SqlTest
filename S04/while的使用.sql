--WHILEѭ��--
--1.����дtrue/false
--2.û�У�����ֻ��begin..and
--3.����Ƕ��
--4.Ҳ������ѭ����дcontinue/break,continue������ֹ��ǰ��һ�Σ�������һ�Σ�break��������ǰ��һ��ѭ��

---����1-100֮�����������ĺ�--
declare @i int=1
declare @sum int=0
while(@i<=100)
begin
 if(@i%2!=0)
	begin
		set @sum+=@i
	end 
 set @i+=1 
end
print '��='+cast(@sum as char(4))

go
--���office��������˳�������(�����������)�����ÿ��������2��,ѭ���ӣ�ֱ�����������������һ�롣
declare @subjectName nvarchar(50)='office'--��Ŀ����
declare @subejctId int=(select subjectId from Subject where SubjectName=@subjectName)--��ĿID
declare @totalNum int --������
set @totalNum=(select COUNT(*) from Result where SubjectId=@subejctId)
declare @unpassNum int---û�м�������
select @unpassNum =COUNT(*) from Result where SubjectId=@subejctId and StudentResult<70
print @totalnum
print @unpassnum
while(@totalNum/2<@unpassNum)
	begin
		update Result set StudentResult+=5 where SubjectId=@subejctId and StudentResult <=95
		--��һ�μ��㲻��������
		select @unpassNum =COUNT(*) from Result where SubjectId=@subejctId and StudentResult<70
	end
	
go
declare @subjectName nvarchar(50)='office'--��Ŀ����
declare @subejctId int=(select subjectId from Subject where SubjectName=@subjectName)--��ĿID
declare @totalNum int --������
set @totalNum=(select COUNT(*) from Result where SubjectId=@subejctId)
--declare @unpassNum int---û�м�������
--select @unpassNum =COUNT(*) from Result where SubjectId=@subejctId and StudentResult<70
--print @totalnum
--print @unpassnum
while(1=1)
	begin
		if((select COUNT(*) from Result where SubjectId=@subejctId and StudentResult<70)>@totalNum/2)
			update Result set StudentResult+=4 where SubjectId=@subejctId and StudentResult<=96
		else
			break
	end
