select LEN('�л����񹲺͹�')
select lTRIM('        aaaa            ')+'Q'
select REPLACE('�� �� �� �� �� ��',' ','')
select RIGHT('�л����񹲺͹�',3)
select STUFF('�л����񹲺͹�',2,4,'aaaa')

--chenboyi081@qq.com
--��ȡ�û���������
select CHARINDEX('@','chenboyi081@qq.com')
select LEN('chenboyi081@qq.com')
select LEFT('chenboyi081@qq.com',CHARINDEX('@','chenboyi081@qq.com')-1)
select RIGHT('chenboyi081@qq.com',LEN('chenboyi081@qq.com')-CHARINDEX('@','chenboyi081@qq.com'))


select ROUND(1.445,1)
select SIGN(0)
--	sqrt��ƽ����
select SQRT(8)
--POWER����


--���ں�������Ҫ��
select GETDATE()
--DATEADD ��һ��������ָʱ�������ڶ���������ָ����Ҫ���ӵ�����������������������������һ������ ֵ��Ϊ�ο�
select DATEADD(YY,3,GETDATE())

--DATEDIFF �ҵ���������ֵָ�������λ�Ĳ���
select DATEDIFF(YY,'1990-1-1',GETDATE())

--DATENAME���Եõ����ڲ��ֵ��ַ���������ʽ
select DATENAME(DW,GETDATE())

--DATEPART �õ�ָ�������ڲ���

--�õ���������յ�ѧ���������Ͱ༶��Ϣ
select StudentName,ClassId from Student where DATEPART(MM,borndate)=DATEPART(mm,getdate()) and DATEPART(DD,BornDate)=DATEPART(DD,getdate())