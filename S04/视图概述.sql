---��ͼ�ı��ʾ���һ��sql���--select.����ʾһ�ű�Ĳ������ݻ���ű���ۺ����ݣ���ṹ�������ǽ����ڶԱ�Ĳ�ѯ������ 
--��ͼ�ı��ʾ���һ����������Ĳ�������������һ��
--��ͼ���沢û�������洢���ݣ����洢����sql��䣬��ִ����ͼ��ȡ���ݵ�ʱ�򣬱��ʾ���ִ����ͼ�е�sql���ȥ��ȡ����
select * from Student
select * from vw_getstudentResultInfo
--ͨ��������䴴����ͼ
�﷨��
--go
--create view vw_�Զ�������
--as
-- select ����
--go
--��ȡ���ڰ�ѧԱ��Ϣ
--1.�ɲ�����д����select��ѯ��ֻ��дһ��
--2����ͼ����ֻ��дselect����������κε�update/delete/insert���
if exists(select * from sysobjects where name='vw_getStudentByClassId_6')
drop view vw_getStudentByClassId_6
go
create view vw_getStudentByClassId_6
as
 select    * from Student
go
--����ͼ���в�ѯ
select * from vw_getStudentByClassId_6 order by studentname
--����ͼ�����޸�,���Զ���ͼ����ɾ�����Ӻ��޸Ĳ��������Ҳ�����ֱ��Ӱ�����������һ�㲻����ȥ����Щ��������Ϊ��ͼ�ı���Ŀ����Ϊ��ѯ
update vw_getStudentByClassId_6 set loginpwd='qqqqqqq' where Studentno=2
delete from vw_getStudentByClassId_6 where Studentno=23

--��ͼ������ɾ�����޸Ĳ���ֻ������ڵ���������漰�˶����Ĳ�������ô�����ɹ�
select * from vw_getstudentResultInfo 
delete from vw_getstudentResultInfo where Studentno=6
update vw_getstudentResultInfo set studentresult=55 , subjectname='c#' where Studentno=6 