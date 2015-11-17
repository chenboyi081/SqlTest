---视图的本质就是一句sql语句--select.它表示一张表的部分数据或多张表的综合数据，其结构和数据是建立在对表的查询基础上 
--视图的本质就是一张虚拟表：它的操作与操作表基本一致
--视图里面并没有真正存储数据，它存储的是sql语句，当执行视图获取数据的时候，本质就是执行视图中的sql语句去获取数据
select * from Student
select * from vw_getstudentResultInfo
--通过命令语句创建视图
语法：
--go
--create view vw_自定义名称
--as
-- select 命令
--go
--获取六期班学员信息
--1.可不可以写多条select查询？只能写一条
--2。视图里面只能写select，不能添加任何的update/delete/insert语句
if exists(select * from sysobjects where name='vw_getStudentByClassId_6')
drop view vw_getStudentByClassId_6
go
create view vw_getStudentByClassId_6
as
 select    * from Student
go
--对视图进行查询
select * from vw_getStudentByClassId_6 order by studentname
--对视图进行修改,可以对视图进行删除增加和修改操作，况且操作会直接影响物理表，所以一般不建立去做这些操作，因为视图的本质目的是为查询
update vw_getStudentByClassId_6 set loginpwd='qqqqqqq' where Studentno=2
delete from vw_getStudentByClassId_6 where Studentno=23

--视图的增加删除和修改操作只能针对于单个表，如果涉及了多个表的操作，那么将不成功
select * from vw_getstudentResultInfo 
delete from vw_getstudentResultInfo where Studentno=6
update vw_getstudentResultInfo set studentresult=55 , subjectname='c#' where Studentno=6 