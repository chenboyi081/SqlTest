--���ں���--
--GETDATE():��ȡ��ǰϵͳ����
select GETDATE()
--DATEADD���ܹ���ָ������������ָ����ʱ�� 
select DATEADD(MM,2,GETDATE())
---��ѯ�����Ѿ�20����ѧԱ��Ϣ-
select * from Student where BornDate<DATEADD(yyyy,-20,getdate())
--��ѯ���䳬��20���ѧԱ��Ϣ
--DATEDIFF():�ҳ��������ڵĲ���
select studentname, DATEDIFF(yyyy,borndate,getdate()) as age from Student order by  age desc

--DATENAME:������ָ�����ڲ��ֵ��ַ�����ʽ
select DATENAME(dw,GETDATE())
--DATEPART:���Եõ�ָ�������ڲ��� 2014-4-11 10:47
select cast(DATEPART(yyyy,getdate()) as CHAR(4))+'-'+ cast(DATEPART(mm,getdate()) as CHAR(2))
select DATEPART(dd,getdate())
select DATEPART(hh,getdate())
select DATEPART(mi,getdate())

--��ѯ���䳬��20�����6�ڰ��ѧ����Ϣ��
select * from Student where ClassId=6 and DATEDIFF(yyyy,borndate,getdate())>20
select * from Student where ClassId=6 and BornDate<DATEADD(yyyy,-20,getdate())
--��ѯ1�·ݹ����յ�ѧ����Ϣ
select * from Student where DATEPART(mm,borndate) =1
--��ѯ��������յ�ѧ�����������ڰ༶
select * from Student where DATEPART(mm,borndate) =DATEPART(mm,getdate()) and DATEPART(dd,borndate) =DATEPART(dd,getdate()) 
--��ѯѧ��Ϊ��10����ѧ��Email��������
--������ѧ��Ϊ�����һ��Email��ַ���������£�GZ+��ǰ����+4λ�����+@itcast.com





