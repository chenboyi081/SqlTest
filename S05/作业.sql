--�ֲ�ѯͼ���������Ϣ��Ҫ��ͼ��۸���ʾΪ��
--�۸�Ϊ�գ���ʾΪ���۸�δ֪��
--10-20����ʾΪ���۸���10��20֮�䡱
--20-30������ʾΪ���۸����С�
--������ԭ����ʾ

select bookid,bookname,
case--���ӱ��ʽ�����ֶΣ��Ϳ�������Χ��nullֵ���ж�
 when price between 20 and 30 then '�۸�����'
 when price between 10 and 19 then '�۸���10��20֮��' 
 when price is  null then '�۸�δ֪'
 ELSE cast(price  as CHAR(10))
end as �۸�
 from books

--2.��ѯѧ����"1����ѧ���μӡ����һ�Ρ��ġ�office���γ̿��Եĳɼ���Ҫ�����ѧ�������ͳɼ�
--	1.ʹ���Ӳ�ѯ
--	2.���û����Ӧ����������Ը������ݱ��е����� 
select Student.StudentName,Result.StudentResult
from Student
inner join Result on Student.StudentNo=Result.StudentNo
where Result.StudentNo=1 and ExamDate=
	(select MAX(ExamDate) from Result where StudentNo=1 and SubjectId=
		(select SubjectId from Subject where SubjectName='office')) and SubjectId=
			(select SubjectId from Subject where SubjectName='office')
			
--ʹ�ñ���
go
declare @studentNo int=1--ѧ��
declare @subjectName nvarchar(50)='office' --��Ŀ����
declare @subjectId int=(select SubjectId from Subject where SubjectName=@subjectName) --��ĿID
declare @time datetime--��������һ�ο�������
set @time=(select MAX(ExamDate) from Result where StudentNo=@studentNo and SubjectId=@subjectId)
--��ѯ
select StudentNo,StudentResult from Result where StudentNo=@studentNo and SubjectId=@subjectId and ExamDate=@time
--ʹ���Ӳ�ѯ�õ��е�ֵ
select (select studentname from student where studentno=@studentno),StudentResult from Result where StudentNo=@studentNo and SubjectId=@subjectId and ExamDate=@time
--ʹ���Ӳ�ѯ��Ϊ�����
select StudentName,temp.StudentResult from 
Student
inner join (select StudentNo,StudentResult from Result where StudentNo=@studentNo and SubjectId=@subjectId and ExamDate=@time) temp on Student.StudentNo=temp.StudentNo
go

--3.���ѧ����office�������һ�ο����Ƿ��в�����60�ּ��񣩵�ѧ�������У�ÿ�˼�2�֣�����95�ֵ�ѧ�����ټӷ֣�ֱ������ѧ����ο��Գɼ�������(ע��ӷֹ��̲�ҪΥ��Լ��)
declare @subjectName nvarchar(50)='office' --��Ŀ����
declare @subjectId int=(select subjectId from Subject where SubjectName=@subjectName)--��ĿID
declare @time datetime=(select MAX(ExamDate) from Result where SubjectId=@subjectId)--��һ��Ŀ���һ�ο���ʱ��
--exists�ж���û�У�����������䷵�صĽ������Ϊnull,��ôexists�����ͷ���true,����ͷ���false
while(1=1)
	begin
		if exists(select * from Result where SubjectId=@subjectId and ExamDate=@time and StudentResult<60)
			begin
				update Result set StudentResult+=2 where SubjectId=@subjectId and ExamDate=@time and StudentResult<=95
			end
		else
			break
	end


--4.��ӡ����ͼ����ʹ�ö���ѭ�����
--��
--���
--����
--�����
--������
declare @i int=1
declare @graph varchar(10)=''
while(@i<=5)
	begin
		set @graph=@graph+'��'
		set @i+=1
		print @graph
	end
