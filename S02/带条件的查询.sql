--���ݼ���--
�﷨:
--select �ֶ��б�/* from ���б� where ����(not and or) 

--1.��ѯ����ѧԱ��Ϣ
select * from Student
--2.��ѯ����ŮѧԱ��Ϣ
select * from Student where Sex='Ů'
--3.��������ѯ
select * from Student where Sex='Ů' and ClassId='6'
--4.ָ����ѯ����
select StudentName,Sex,Phone,Address from Student where Sex='Ů' and ClassId='6'
select Student.StudentName,Student.Sex,Student.Phone,Student.Address from Student where Sex='Ů' and ClassId='6'
--5.ָ���б��� as����ָ���б��⣬����������ʡ�ԣ����ֲ��������ǵõ������֮������ͼ�е�����һ����ʾ��ʽ�����ѯ�޹�
select StudentName as ����,Sex �Ա�,�绰=Phone,Address from Student where Sex='Ů' and ClassId='6'
--6.��ӳ�����
select StudentName as ����,Sex �Ա�,�绰=Phone,Address,'����' as ���� from Student where Sex='Ů' and ClassId='6'

--select�����ֹ���
1.��ѯ
2.���:�Խ��������ʽ���������
select 1

--
-ʹ��top��ȡ��¼,top������ȡָ�������ļ�¼��Ҳ����ʹ�ðٷֱ�
--�������������룬����Ceiling
--select CEILING(0.999)
select top 2 StudentName as ����,Sex �Ա�,�绰=Phone,Address,'����' as ���� from Student where Sex='Ů' and ClassId='6'
select top 80 percent StudentName as ����,Sex �Ա�,�绰=Phone,Address,'����' as ���� from Student where Sex='Ů' and ClassId='6'
--ʹ��distinct�������ظ���¼.����˵���ظ���¼����ָ���ԭʼ��¼,����ͨ����ѯ�õ��Ľ����,ֻ�в�ѯ�Ľ������ÿһ���ֶ�ֵ��һ��,����Ϊ���ظ���¼
select distinct   LoginPwd,Sex from Student