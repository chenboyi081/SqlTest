
---变量的种类--全局变量
go
insert into grade values('fdasfas')
select * from Student
select @@IDENTITY ---它得到的值不是指点上一条语句，而是最近的insert语句的值

go
select * from Student
select @@ROWCOUNT

delete from Student where StudentNo=12433
select @@ROWCOUNT

go
--@@ERROR 得到最近这一条语句的错误号
select * from stu --语法错误的错误号得不到
select @@ERROR --针对于增加删除和修改而言,如果有错误那么错误号一定大于0，如果没有错误那么就一定是0
update Student set LoginPwd='ss' where StudentNo=1
update Student set LoginPwd='ss' where StudentNo=1
select * from Student
go
select @@ERROR