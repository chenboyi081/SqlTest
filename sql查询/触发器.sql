if exists(select * from sysobjects where name='tr_afterinsert')
	drop trigger tr_afterinsert
go
create trigger tr_afterinsert
on grade after insert
as
print 'inserted'
select * from inserted
print 'deleted'
select * from deleted
go

insert into Grade values('test')

--�ô�����ģ��Ψһ��
go
create trigger tr_grade_unique
on grade after insert
as

go