--1.��ѯ���ڰ������� �� ��ѧԱ
--2.��ѯ���п�Ŀ�а���c �ַ��Ŀ�Ŀ��Ϣ
--3.��ѯoffice���һ�ο���ʱ��


select * from Student where ClassId=5 and StudentName like '��%' 
select * from Subject where SubjectName like '%[c]%'
select MAX(ExamDate) from Result where SubjectId=1


--1.��ѯÿ���༶����ѧʱ������������������
--2.��ѯÿ���μӿ��Ե�ѧԱ��ƽ����
--3.��ѯÿ�ſγ̵�ƽ���֣������ս�������
--4.��ѯÿ���༶��Ů��������

select ClassId,SUM(ClassHour) classhour from Subject where ClassId is not null group by ClassId order by SUM(ClassHour)

select StudentNo,AVG(StudentResult) ƽ���ɼ� from Result where StudentResult is not null group by StudentNo


--��ҵ2
--1.��ѯ��һ�ڰ����еĿ�Ŀ����
--2.��ѯ�����ڰ���ͬѧ��������סַ
--3.���޵����ʼ���ѧ�������Ͱ༶��Ϣ
--4.��ѯ����������1990��֮������ڰ����ѧ���������꼶��Ϣ
--5.��ѯ���μ�������Ϊ2013-01-22 00:00:00�ġ�office����Ŀ���Եĳɼ���Ϣ
--6.��ѯ������ǰ�����ɼ�

select classname,SubjectName from Subject,grade where classname='���ڰ�' and Subject.ClassId=grade.ClassId
select classname,StudentName,Address from Student,grade where classname='���ڰ�' and Student.ClassId=grade.ClassId and Sex='��'
select StudentName,classname from Student,grade where Email is null and grade.ClassId=student.ClassId
--select StudentName,ClassId,BornDate from Student where BornDate>1990 
select StudentName,classname,BornDate from Student,grade where BornDate>'1990' and Sex='��' and classname='���ڰ�' and Student.ClassId=grade.ClassId
select SubjectName,StudentResult,ExamDate from Result,Subject where ExamDate='2013-01-22 00:00:00' and Result.SubjectId=Subject.SubjectId and Subject.SubjectName='office'
select top 5 StudentName,StudentResult from Result,Student order by StudentResult desc

