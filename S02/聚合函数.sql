--�ۺϺ���--
--max():��ָ�����ݷ�Χ�е����ֵ:���Զ��������ͽ��оۺϣ�����Ƿ���ֵô�Ͱ�ֵ��ƴ����������
--min():��ָ�����ݷ�Χ�е���Сֵ:���Զ��������ͽ��оۺϣ�����Ƿ���ֵô�Ͱ�ֵ��ƴ����������
--avg:��ָ�����ݷ�Χ�е�ƽ��ֵ,��ֻ�ܶ���ֵ���оۺ�,���ܶ����ڽ��оۺ�
--sum:��ָ�����ݷ�Χ�еĺ�,��ֻ�ܶ���ֵ���оۺ�,���ܶ����ڽ��оۺ�
--count:�����������ļ�¼��,���ֶ�û���κι�ϵ

select COUNT(*) from Student where ClassId=6
--��ѯ��������ѧԱ  ����ֵԽ���ԽС
select min(BornDate) from Student
select max(BornDate) from Student
select SUM(StudentName) from Student
select min(StudentName) from Student
select max(StudentName) from Student
select max(BornDate) from Student
select avg(BornDate) from Student
--��ѯ��ĿID��1��ѧԱ���ܷ�
select SUM(StudentResult) from Result where SubjectId=1
--ƽ����
--��sql server�У�null��ָ��֪����ʲôֵ���ۺϺ�������˵�nullֵ
select avg(StudentResult*1.0) from Result where SubjectId=1 and StudentResult is not null

select * from Student order by StudentName