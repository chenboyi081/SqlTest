---�ַ�������--
--1.CHARINDEX:��һ����������Ҫ��ѯ���ַ������ڶ�����Դ�ַ������������ǿ�ʼ��ѯ��λ�ã���1��ʼ����
select CHARINDEX('����','�л����񹲺͹�',4)
--2.LEN���õ�ָ���ַ��ĸ���,����Ӣ���޹�
select LEN('�л�����aa')
--3.UPPER():��Ӣ��Сдת��Ϊ��д LOWER()����дת��ΪСд
select lower(UPPER('fgasdfasf'))
--4.LTRIM   RTRIM,û��trim����   Trim() TrimStart()  TrimEnd();
SELECT  ltrim(Rtrim('                      dfg      hjkl                         '))+'�ϳ�s'
--5.REPLACE �滻,���û���ҵ���Ӧ��Ҫ�滻��,�ͷ���ԭʼ�ַ���ֵ
select REPLACE('�л����񹲺͹�','��d��','����')
--6.RIGHT()  LEFT():�������Դ����ַ����ĳ���,���ǲ����Ǹ�ֵ
select right('�л����񹲺͹�',-10)
--7.
select SUBSTRING('�л�sdsfdsf���񹲺͹�',CHARINDEX('����','�л�sdsfdsf���񹲺͹�'),2)

--STUFF
select STUFF('�л����񹲺͹�',3,2,'dfasfasdfasd')

--wuhu0723@126.com
select CHARINDEX('@','wuhu0723@126.com')
select  LEFT('wuhu0723@126.com',CHARINDEX('@','wuhu0723@126.com')-1)

select  right('wuhu0723@126.com',len('wuhu0723@126.com')-CHARINDEX('@','wuhu0723@126.com'))

