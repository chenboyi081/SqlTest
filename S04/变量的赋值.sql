---局部变量--
--语法
--declare @名称 类型=初始值
declare @name varchar='aaaa' --如果字符串没有指定长度，那么长度就是1
print @name
--两种赋值方式:在sql中为变量赋值必须使用set/select,而不能直接使用  变量=值
--set:侧重于直接给一个具体的值
--select:侧重于通过查询赋值
go
--查询比林思大的学员信息
select * from Student where BornDate<(select BornDate from Student where StudentName='林思')
go
declare @time datetime
--set后面如果是sql语句，那么必须接完整的 独立子查询
--set @time=(select  BornDate from Student where StudentName='林思')
--使用select赋值，如果后面是sql语句，可以是独立子查询，也可以省略select关键字
select @time=  BornDate from Student where StudentName='林思'
print @time
--使用set/select赋值的共同点
--1.都能直接给值
--2.如果后面的sql语句是一个完整Sql语句，那么两者没有任何的区别
go
--区别：
declare @age int=100,@name varchar(50)='aaa'
--1.set一次只能为一个变量赋值,而select可以一次为多个变量赋值
--set @age=20 ,@name='张三'
--select @age=20 ,@name='张三'
--2.set进行赋值的时候如果sql语句返回多行一列值，那么：子查询返回的值不止一个。当子查询跟随在 =、!=、<、<=、>、>= 之后，或子查询用作表达式时，这种情况是不允许的。但是如果是select赋值且sql语句省略了select.那么会得到最后一个值
--set @name=(select StudentName from Student)
--select @name= StudentName from Student
--3.如果sql语句返回null值，那么set会成为null值而select会保留原始值
--set @name=(select StudentName from Student where StudentNo=100)
select @name= StudentName from Student where StudentNo=100
print @name
print @age


--两种输出方式：
--select:以结果集的方式输出
--print :以文本形式输出,每一个print单独占据一行,且永远只能输出一个值,它是在服务器端输出的
select * from Student
print 'aa' +'bb'

--查询参加最近一次“office”考试成绩最高分和最低分
select MAX(StudentResult),MIN(StudentResult) from Result
where  SubjectId=(select subjectid from subject where subjectname='office') and ExamDate=(select max(examdate) from result where subjectid=(select subjectid from subject where subjectname='office'))
declare @subjectname nvarchar(50)='office' --科目名称
go
declare @subjectname nvarchar(50)='office' --科目名称
declare @subjectId int --科目 ID
set @subjectId=(select subjectid from subject where subjectname=@subjectname)
declare @time datetime --最近一次考试日期
select @time=MAX(examdate) from Result where SubjectId=@subjectId
--查询
select MAX(StudentResult),MIN(StudentResult) from Result where SubjectId=@subjectId and ExamDate=@time


