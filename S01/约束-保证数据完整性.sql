--Լ��-��֤����������--
--ʲô�����������ԣ���֤���ݵ���ʵ����ȫ��׼ȷ

--һ�����������������ԣ�
--1.ʵ�������ԣ�ʵ�����ָһ�м�¼����������Ծ���Ϊ�˱�֤��һ�м�¼��Ψһ��
--	�������ǿգ�Ψһ
--	��ʶ�У�ϵͳ�Զ����ɵģ���Զ�����ظ���Ҳ��Ψһ
--	Ψһ����Ψһ�����ǿ���Ϊnull,ֻ��nullһ��

--2.�������ԣ������ָ�����ֶΣ�Ҳ��˵������������Ϊ�˱�֤�ֶε�ֵ��׼ȷ���а�ȫ��
--	checkԼ��
--	�Ƿ�Ϊnull
--	��������
--	�����Լ��--��ϵ
--	Ĭ��ֵԼ��

--�Զ��������ԣ�checkԼ��
--��ϵ��һ�ֶ��һ�Ĺ�ϵ 
--���������ԣ������Լ����һ���������ĳ���ֶε�ֵ��������������һ����������ĳ���ֶ�,һ�����ֶε�ֵ����������һ������ֶ����Ѿ����ڵ�ֵ
--��������õı�����ڵı�
--�����������ñ��ȴ��ڵı�
--�����������ϵ��ϸ�ڣ�
--1.����ѡ�������ȥ�����������ϵ
--2.�����������ϵ���ֶε����ͱ���һ��
--3.�����������ϵ���ֶε����������ȫһ��
--4.�������������ϵ�ı���������ݵ�ʱ����Ҫ�����������ļ�¼������������ļ�¼
--5.�������������ϵ�ı���ɾ�����ݵ�ʱ����ɾ�������ļ�¼��ɾ��������ļ�¼
--6.�����������ϵ���ֶ��������б�������������Ψһ��

--��û�п����ԣ�������û���κμ�¼�����Ǵӱ����ж�����¼��Ϊʲô��
--�У���Ϊ������ϵ���ֶ��������п�����Ψһ������Ψһ����ΪNULL

--ʹ�ô��봴��Լ��--
--����(primary key PK)  Ψһ��(unique UQ) Ĭ��ֵ(default  DF) ckeckԼ��(check  CK) �����(foreign key  FK)
--�﷨��
--alter table ����
--add constraint Լ������(��д_�û��Զ�������) Լ������  Լ��˵��(���ʽ  �ֶ�����  ֵ)

--�������
if exists(select * from sysobjects where name='PK_id')
	alter table student drop constraint PK_id
alter table student add constraint PK_id primary key(id)
--Ϊname�ֶ����Ψһ��
alter table student add constraint UQ_Name unique(name)
--Ϊ�Ա����checkԼ��
alter table student add constraint CK_gender check(gender='��' or gender='Ů')
--Ϊ�������checkԼ����ͬʱΪ��ַ���Ĭ��Լ��
alter table student
add constraint DF_Address default(N'���ڹ�wg��') for address, --Ϊĳ���ֶ����Լ��
constraint CK_Age check(age>0 and age<=100)
---Ϊcid��������
alter table student
add constraint FK_Student_Class_Cid foreign key(cid) references class(classId)
