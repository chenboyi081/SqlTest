--���ݲ���--
--�﷨������������������Ӧ�����Ͷ�Ӧ   ������Ӧ   ˳���Ӧ
--insert [into] ����[(�ֶ��б�)] values(ֵ�б�)
use MySchool
--1.���������û��ָ��������ֶ��б���ô��Ĭ����ҪΪ���������ֵ,���ǲ���ʲôʱ�򶼲���Ϊ��ʶ����Ϊ���ֵ
insert into Student values(3,'dsfasdfas','fasdfas',1,3,'23432','fadsfas','2012-2-2','fasfasd')
--2.����Ϊ��ʶ�в���ֵ������ʹ�������б��� IDENTITY_INSERT Ϊ ON ʱ������Ϊ��'Student'�еı�ʶ��ָ����ʽֵ��
--3.���û��ָ�����������,�ͱ���Ϊ���������ֵ,Ҳ����ζ��ֵ���������ܶ�Ҳ������:���������ṩֵ����Ŀ����岻ƥ�䡣
insert into Student values('dsfasdfas','fasdfas',1,3,'23432','fadsfas','2012-2-2')
--4.���Ϊ����ΪNULL���ֶ�ָ��nullֵ��������Ĭ��ֵ���ֶ�ָ��Ĭ��ֵ
insert into Student values('dsfasdfas','fasdfas',1,3,'23432',default,'2012-2-2',null)
--5.����ֶο���ΪNULL,��ô�Ϳ��Բ�ָ������ֶ�
insert into Student(LoginPwd,StudentName,Gender,GradeId,Phone,Address,Birthday) values('dsfasdfas','fasdfas',1,3,'23432',default,'2012-2-2')
--6.����Ƿǿ��ֶΣ��ͱ������ֵ
insert into Student(LoginPwd,StudentName,Gender,GradeId,Phone,Address) values('dsfasdfas','fasdfas',1,3,'23432',default)
--�����ֵ����������������Լ��
insert into Student(LoginPwd,StudentName,Gender,GradeId,Phone,Address,Birthday) values('aaa','fasdfas',1,3,'23432',default,'2012-2-2')

--�����ڲ�������ʱ�ĵ�λ��
--7.�κ����͵�ֵ�����԰����ڡ������ڣ�ϵͳ������ʽ��ǿ��ת������ʵ�ε�ֵǿ��ת��Ϊ�ֶε����ͣ��������ת����ִ����Ӧ�Ĳ��������������ת���ͱ���
insert into Student values('dsfasdfas','fasdfas','0','3','23432','fadsfas','2012-2-2','fasfasd')
--8.������ַ�������ȴû����ӡ����ͻ᣺1.�������ֵ��ɵ��ַ�����OK 2.����Ƿ���ֵ��ɵ��ַ����ͱ���
insert into Student values('dsfasdfas',fasdfas,'0','3','23432','fadsfas','2012-2-2','fasfasd')
insert into Student values('dsfasdfas',123123,'0','3','23432','fadsfas','2012-2-2','fasfasd')
--9.�������͵�ֵһ����Ҫ�����ڡ������ڣ��������ϵͳ��Ĭ��ֵ  1905-7-2   1906-6-22
insert into Student values('dsfasdfas',121,'0','3','23432','fadsfas',2012-2-2,'fasfasd')