---�������Ĳ�ѯ---
--�﷨:select �ֶ��б�/* from ���б� where ����
select * from Student where ClassId=1 or ClassId=2 or ClassId=3
--ʹ��in����һ�������ֵ��Χ,inҪ��ָ���ķ�Χ����������һ��
select * from Student where ClassId in(1,2,3)
select * from Student where ClassId not in(1,2,3)
--��ν����һ����ָ��ϵͳ��Ϊ����ǿ������ת�����������ת��OK�����򱨴�
--��ʹ��in��ʱ��ָ���ķ�Χֵ��Ҫ���ֶε�ֵ����Ӧ��ƥ�䣺ǿ��ת��
select * from Student where ClassId in('1','2','3')

--��ѯ���Գɼ���80`90֮���ѧԱ��Ϣ
select * from Result where StudentResult>=80 and StudentResult<=90
--�������ֵ�ķ�Χ�жϿ���ʹ��between...and
select * from Result where StudentResult between 80 and 90


--�������Ĳ�ѯ-ģ����ѯ:�Ƕ��ַ�������
--������ȷ��=�����ϸ����ȫƥ��
--%:��������������ַ�
--_:��������ĵ����ַ�
--[]:����һ�������ֵ��Χ�е�һ���ַ�
--[^]:������ָ���ķ�Χ֮��,����[]��������������
--ͨ��������������ģ����ѯ�У�ģ����ѯ�Ĺؼ����ǣ�like
select * from Student where StudentName like '��%' and Sex='Ů'
select * from Student where StudentName like '��__' and Sex='Ů'
--��ѯѧ����11~18֮���ѧԱ��Ϣ
select * from Student where StudentNo not like '[1-2]'
--������ڷ�Χֵ���м�û�������ˣ�ֻ�ܷ��ڿ�ͷ
select * from Student where StudentNo  like '[345^672]'

---isnull������ʹ�ã�����ʹ��һ���Զ�����ַ����滻nullֵ
select StudentNo,StudentName,ISNULL(email,'û�е�������') from Student where ClassId=6

--ģ����ѯ��ϰ��
--1.��ѯ���ڰ������� �� ��ѧԱ
select classid from grade where classname='���ڰ�'
select * from Student where StudentName like '��%' and ClassId=(select classid from grade where classname='���ڰ�')
--2.��ѯ���п�Ŀ�а���c �ַ��Ŀ�Ŀ��Ϣ--�����ִ�Сд
select * from Subject where SubjectName like '%[Cc]%'
--3.��ѯoffice���һ�ο���ʱ��
select subjectid from Subject where SubjectName='office'
select max(ExamDate) from Result where SubjectId=(select subjectid from Subject where SubjectName='office')
--select �ֶ��б� from ���б� where  ���� order by  �����ֶ��б�
--����Բ�ѯ�õ��Ľ��������¼���ţ��������޸�ԭʼ�Ĳ�ѯ�����
--desc:��������
--asc:��������Ĭ�Ͼ�����������
--top�� order by ֮����ȡֵ
select top 1 ExamDate ��������,StudentNo from Result where SubjectId=(select subjectid from Subject where SubjectName='office') order by �������� desc,StudentNo asc

