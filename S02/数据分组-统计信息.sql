---���ݷ���-ͳ����Ϣ-----
--select �ֶ��б� from ���б�  where ������Դ��������ɸѡ group by �����ֶ��б� Order by �����ֶ��б�
--1.�õ�����ѧԱ������
select COUNT(*) from Student
--2.�õ���Ů��������
select COUNT(*) from Student where Sex='��'
select COUNT(*) from Student where Sex='Ů'
--ʹ�÷���ͳ��
select COUNT(*),sex from Student group by sex

select COUNT(*),sex from Student
select COUNT(*) from Student
select distinct sex from Student

--��ѯÿ���༶������
--����ͳ����һ������:��ۺϺ���һ������ڲ�ѯ�е��У�Ҫô���ۺϣ�Ҫô������
--1.�ۺϲ�Ӧ������ WHERE �Ӿ���,�﷨����
--2.where ��ִ���ڷ���֮ǰ���ȶ�Դ������ɸѡ֮���ٶ�ɸѡ�õ��Ľ����������
--3.having�ǶԷ���ͳ�Ƶõ��Ľ������ɸѡ�ġ�
--select �ֶ��б� from  ���б�  where Դ����ɸѡ����  group by ����ͳ���ֶ��б� having  �Է���ͳ�ƽ������ɸѡ order by �õ����ս����֮�����������
select classid ,COUNT(*)  from Student   group by ClassId  having ClassId=6
select classid �༶,COUNT(*) ����,StudentNo from Student   group by ClassId  having StudentNo>10
--  5 ��ʾ                                        1��ȡ����Դ    2  ɸѡԭ                    3 ������Դ���з���  4 �Է���ͳ�ƵĽ������ɸѡ    6�����ս��������������                      
select classid �༶,COUNT(*) ���� from Student where Email is not null   group by ClassId  having COUNT(*) between 2 and 3      order by  ���� desc

select StudentNo no,StudentName name from Student where StudentName like '%'


select COUNT(*) ���� from Student where Email is not null  having COUNT(*)>=3       order by  ���� desc

select classid, sex,COUNT(*) from Student group by ClassId,Sex order by ClassId,sex

--����ͳ����ϰ:
--1.��ѯÿ���༶����ѧʱ������������������
select classid, SUM(ClassHour) from Subject where ClassId is not null group by ClassId order by SUM(ClassHour)
--2.��ѯÿ���μӿ��Ե�ѧԱ��ƽ����
select studentNo, AVG(StudentResult) from Result where StudentResult is not null group by StudentNo --having StudentResult is not null
--3.��ѯÿ�ſγ̵�ƽ���֣������ս�������
select SubjectId, AVG(StudentResult) as score from Result where StudentResult is not null group by SubjectId order by  score desc
--4.��ѯÿ���༶��Ů��������
select ClassId,Sex, COUNT(*) from Student group by ClassId,Sex
