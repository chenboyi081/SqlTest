--�Ӳ�ѯ--
--һ����ѯ���滹����������һ����ѯ
--�Ӳ�ѯ��Ϊ����--
--1.������()������ִ�еĲ�ѯ�����Ӳ�ѯ���,�����Ӳ�ѯ�ľͳƲ�����ѯ���
--2.�����Ӳ�ѯʱ����ѡ���б���ֻ��ָ��һ�����ʽ,������ζ���Ӳ�ѯ��Ϊ����(�й�ϵ�����)��ʱ���Ӳ�ѯ��Զ�����ܳ��ֶ��е����
--3.�Ӳ�ѯ���ص�ֵ��ֹһ�������Ӳ�ѯ������ =��!=��<��<=��>��>= ֮�󣬻��Ӳ�ѯ�������ʽʱ����������ǲ������,����ζ������Ӳ�ѯ���ڹ�ϵ�����֮�󣬱��뱣֤�Ӳ�ѯֻ�����˵���ֵ,��������Ҫ��ô���Ϳ���ʹ�ùؼ��� in/not in
--��ѯ����˼������ѧԱ��Ϣ
--4.���Ӳ�ѯ��sql��䷵�ص���ֻ�븸��ѯ�йأ��Ӳ�ѯ�е��н�������Ϊ�����ж�
--1.�Ȳ�ѯ����˼������
select borndate from Student where StudentName='��˼'
--����һ�ж���ֵ----��Ϊ������Զ����
select * from Student where BornDate<(select * from Student where StudentName='��˼')
--���ض���һ��ֵ
select * from Student where BornDate<(select borndate from Student)
--��ѯ�༶ID��=3��ѧԱ��Ϣ
select classid from grade where ClassId<=3
select StudentNo,StudentName from Student where ClassId not in(select classid from grade where ClassId<=3)

--�Ӳ�ѯ�õ�ĳ�е�ֵ --�õ�����
--��ѯѧԱ��10��ѧԱoffice���Գɼ��Ϳ�������,��ʾѧԱ����
select (select studentname from student where studentno=10),StudentResult,ExamDate from Result where StudentNo=10 and SubjectId=(select SubjectId from Subject where SubjectName='office')

--3.��ѯ�õ������������ʹ���Ӳ�ѯ����һ�������
--��ѯ�༶IDΪ1������ѧԱ�Ŀ��Գɼ�
--1��ѯ���༶IDΪ1��ѧԱ��ѧ�� 
select studentno from Student where ClassId=1
--��ѯָ��ѧ�ŵ�ѧԱ�ĳɼ�
select * from Result where StudentNo in(select studentno from Student where ClassId=1)
--��ҳ
select top 5 * from Student
select top 5 * from Student where StudentNo not in(select top 5 StudentNo from Student order by StudentNo)

--ROW_NUMBER ����Ϊ��ѯ����ÿһ�з���һ���кţ��к������ڱ�ʶ�У���Զ�����ظ���ͬ����Ĭ����������
--over˵������һ���ֶ��Ͻ���������Ϊ����ͬ�ֶ�������������ʾ�ǲ�һ����
select ROW_NUMBER() over(order by studentno) as id,* from Student
--����Ӳ�ѯ��Ϊ�������ô����Ϊ����ӱ���
select * from (select ROW_NUMBER() over(order by studentno) as id,* from Student) as temp
where temp.id>=6 and id<=10


--ʹ��Row_number() over(ָ�������ֶ�)ʵ�ַ�ҳ,�����������Ϊ��������һ������
select ROW_NUMBER() over(order by studentno) as id,* from Student
select * from (select ROW_NUMBER() over(order by studentno) as id,* from Student
) as temp where  id>0 and id<=5

--��ѯ����ȡ�������ѧԱ����ʾ��ЩѧԱ����Ϣ
select * from Student where BornDate<(select BornDate from Student where StudentName='����')
--��ѯ���ڰ࿪��Ŀγ�
select * from Subject where ClassId=(select ClassId from grade where classname='���ڰ�')
--��ѯ�μ����һ�Ρ�office�����Գɼ���߷ֺ���ͷ�
select subjectid from Subject where SubjectName='office'
select MAX(ExamDate) from Result where SubjectId=(select subjectid from Subject where SubjectName='office')

select  max(StudentResult),MIN(StudentResult) from Result where SubjectId=
	(select subjectid from Subject where SubjectName='office') 
		and ExamDate=
			(select MAX(ExamDate) from Result where SubjectId=
				(select subjectid from Subject where SubjectName='office'))


--�Ӳ�ѯ�ķ���:
--1.�����Ӳ�ѯ:�����������е��Ӳ�ѯ
--2.����Ӳ�ѯ���Ӳ�ѯ�������˸���ѯ�е���
--��ѯ�μ��˿��Ե�ѧԱ��Ϣ
select distinct StudentNo from Result
select * from Student where StudentNo in(select distinct StudentNo from Result)

select * from Student where StudentNo=(select distinct StudentNo from Result where Result.StudentNo=Student.StudentNo)

select StudentNo from Result where StudentNo=33

select * from Student where StudentNo=(select StudentNo from Result where StudentNo=33)


