---Len(����)--�õ�ָ�����ֶλ����ַ����ĳ���---�洢���ַ�����--��������Ӣ��
select LEN('�л�')
--DataLength(����)--�õ�ָ�����ֶλ����ַ���ֵռ�ݵ��ֽ���
select DATALENGTH('�л�')

--char:�ռ�һ������Ͳ����ٸ��ݴ洢�����ݽ��л���,��������洢���ַ����߳��˿ռ��С,�ͻᱨһ��  �ض϶��������ݵĴ���--
select LEN(Char) from CharTest
select DATALENGTH(Char) from CharTest

--Varchar������ݴ洢����������Ӧ�Ĵ�������洢������С��ָ���Ĵ�С����ô����Ŀռ���Զ����գ���������߳���Χ���Ǳ���
select LEN(Varchar) from CharTest
select DATALENGTH(Varchar) from CharTest

--��������ݵĳ��ȿ��Դ������һ���������Ǻܵķ�Χ�ռ�ֵ֮�ڵ�,��ô�Ϳ���ʹ��char,�����֤�� ���������ֵ�Ŀռ䷶Χ�����ܴ���ô��Ӧ�ÿ���ʹ��varchar

--nchar:����ʲô���͵��ַ�����ռ�������ֽ� �����Ǵ�˵�е�unicode�ַ�������Ŀ�������������
select LEN(Nchar) from CharTest
select DATALENGTH(Nchar) from CharTest

--Nvarchar  n����unicode�ַ���var�����Զ�������
select LEN(Nvarchar) from CharTest
select DATALENGTH(Nvarchar) from CharTest

---���ȫ����Ӣ���ַ���ʱ���Ӧ�ÿ���ʹ�÷�unicode,����������ľͿ��Կ���ʹ��unicode�ַ�