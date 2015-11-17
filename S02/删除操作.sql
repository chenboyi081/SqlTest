--数据删除--
语法:
--delete [from] 表名 where 条件
delete from Student where StudentNo=4 or StudentNo=5 or StudentNo=6
--使用delete进行删除的特点：
--1.它是一条一条进行删除的，每一次的删除都会写入到日志文件，效率不高
--2.标识列值不会重新从标识种子计算

--使用truncate进行删除
--语法：
--truncate table 表名  --没有条件，
--1.它不是一条篥进行删除的，它是一次性整体删除，与删除的记录数无关
--2.它的日志文件的写入是按最小化折方式进行写入--一次
--3.标识列会重新从标识种子计算

truncate table student