
---����������--ȫ�ֱ���
go
insert into grade values('fdasfas')
select * from Student
select @@IDENTITY ---���õ���ֵ����ָ����һ����䣬���������insert����ֵ

go
select * from Student
select @@ROWCOUNT

delete from Student where StudentNo=12433
select @@ROWCOUNT

go
--@@ERROR �õ������һ�����Ĵ����
select * from stu --�﷨����Ĵ���ŵò���
select @@ERROR --���������ɾ�����޸Ķ���,����д�����ô�����һ������0�����û�д�����ô��һ����0
update Student set LoginPwd='ss' where StudentNo=1
update Student set LoginPwd='ss' where StudentNo=1
select * from Student
go
select @@ERROR