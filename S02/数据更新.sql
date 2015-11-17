--数据更新-- 做修改和删除对于程序员而言一定需要看有没有条件
语法：
update 表名 set 字段=新值,字段=新值 where 条件(主键一般就可以做为条件)

update Student set GradeId=1
--修改学号为9的学员班级是3班
update Student set GradeId=3 where StudentNo=9
update Student set Gender=0,GradeId=3 where StudentNo=4
--多条件修改
update Student set Address='广州传智' where GradeId=1 and Gender=0