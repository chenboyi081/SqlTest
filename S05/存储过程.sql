--exec sp_renamedb 'aa','MySchool'
--自定义存储过程
语法：
--go
--create proc usp_自定义名称 --方法名称
--参数--形参，相当于方法的()
--输入参数
--	没有默认值的--调用时必须给值
--	有默认值的形参--调用时爱给不给
--输出参数--out/ref---output
--as --方法体
-- 定义变量
--逻辑语句
--返回值---return 
--go

--查询所有学员信息
if exists(select * from sysobjects where name='usp_getAllStudentInfo')
 drop proc usp_getAllStudentInfo
go
create proc usp_getAllStudentInfo
--()
as
--方法体
	select * from Student
go --超出了存储过程、函数、触发器或视图的最大嵌套层数(最大层数为 32)。
--执行存储过程，获取所有学员信息
exec usp_getAllStudentInfo

--查询指定班级的学员信息
if exists(select * from sysobjects where name='usp_getAllStudentInfoByClassName')
 drop proc usp_getAllStudentInfoByClassName
go
create proc usp_getAllStudentInfoByClassName
@className nvarchar(50) --定义参数不需要添加declare关键字
as
declare @classId int --班级ID
set @classId=(select classid from grade where classname=@className)
--查询
select * from Student where ClassId=@classId
go
--执行存储过程，根据班级名称获取学员信息
exec usp_getAllStudentInfoByClassName '七期班'

--查询指定班级指定性别的学员信息
if exists(select * from sysobjects where name='usp_getAllStudentInfoByClassNameAndSex')
 drop proc usp_getAllStudentInfoByClassNameAndSex
go
create proc usp_getAllStudentInfoByClassNameAndSex
@className nvarchar(50),--这只是参数列表中的一个，并不能单独执行，所以需要使用，连接
@sex char(2)='男'--一般是建议将有默认值的参数写在参数列表的最后，这一点与c#不一样（那边会报错）
as
declare @classid int
set @classid=(select classid from grade where classname=@className)
select * from Student where ClassId=@classid and Sex=@sex
go
--执行存储过程，根据班级名称和性别返回学员信息
--如果实参值的长度大于形参的长度，那么系统会做截断，而不会报错
--如果某个参数使用了  参数：值的方式，那么这个参数之后的所有参数都必须使用这种格式，但是之前就不管
Exec usp_getAllStudentInfoByClassNameAndSex  @className='七期班',@sex=default


---根据班级名称和性别获取学员信息，同时返回符合条件的总人数
if exists(select * from sysobjects where name='usp_getCountAndinfoByClassNameAndSex')
 drop proc usp_getCountAndinfoByClassNameAndSex
go
create proc usp_getCountAndinfoByClassNameAndSex
@className nvarchar(50),--班级名称
@cnt int output, --需要返回的总人数 output说明这是一个输出参数。ouput的本质就是向服务器请求这个参数的数据的一个标记，对应着c#中的out类型传递参数，在调用的时候也需要添加out关键字
@name nvarchar(50) output, --可以有多个输出参数
@sex char(2)='男'--性别
as
declare @classid int
set @classid=(select classid from grade where classname=@className)
select * from Student where ClassId=@classid and Sex=@sex
set @cnt=(select COUNT(*) from Student  where ClassId=@classid and Sex=@sex )
set @name=(select  top  1 StudentName from Student order by StudentName desc)
go
--调用有输出参数的存储过程
declare @count int
declare @name nvarchar(50)
--参数=值  ouput的本质就是向服务器请求这个参数的数据的一个标记
--@cnt=@count output:作用就是：向服务器请求@cnt将其存储到@count里面
exec usp_getCountAndinfoByClassNameAndSex @cnt=@count output, @className='七期班',@name=@name output
print @count
print @name
--1.如果在存储过程中没有为输出参数赋值，但是在调用的时候为输出参数的变量赋值了默认值，那么结果就返回之前的默认值，但是如果在存储过程中为输出参数赋值了，那么就返回存储过程输出参数值
--2.不管什么情况，在存储过程中为输出参数赋值围默认值都是冒有意义了

---创建通过return返回值的存储过程
if exists(select * from sysobjects where name='usp_getCountbySex')
 drop proc usp_getCountbySex
go
create proc usp_getCountbySex
@sex char(2)='男'
as
declare @cnt int=(select COUNT(*) from Student where Sex=@sex)
print '返回值前面的输出语句'
return @cnt --相当于方法的return，会结束当前存储过程的执行
print '返回值后面的输出语句'
go
--调用通过return返回值的存储过程
declare @num varchar(10)
exec @num= usp_getCountbySex
print @num
