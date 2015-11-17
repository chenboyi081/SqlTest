--SQL语句入门--
--1.sql语言是解释语言
--2.它不区分大小写
--3.没有“”，所有字符或者字符串都使用''包含
--4.sql里面也有类似于c#的运算符
--	算术运算符：+ - * / %
--	关系运算符：>  <   >= <=    =(赋值与逻辑相等都是=)，  <>   !=
--	逻辑运算符：！（not） &&(and) || (or)
--5.在sql中没有BOOL值的概念，也就意味着条件中不能写true/false  但是对于bit类型的值，在视图里面只能输入true/false,但是在代码中只能输入1/0
--6.在sql中也有if..else   还有while循环
--7.它也有一些保留关键字：object address user var
--8.sql对类型要求不是很严格，所以类型都可以转换为字符串进行处理


---创建数据库：--
--数据库名称--
--逻辑名称--name
--初始大小--size
--文件增长---filegrowth
--文件路径--filename
--语法:
--create database 数据库名称
--on 文件组
--（
----数据库名称--
----逻辑名称--name
----初始大小--size
----文件增长---filegrowth
----文件路径--filename
--）
--log on
--(
----数据库名称--
----逻辑名称--name
----初始大小--size
----文件增长---filegrowth
----文件路径--filename
--)
--自动创建文件夹   execute 执行  xp--extends procedure
exec sp_configure 'show advanced options',1
go
reconfigure
go
exec sp_configure 'xp_cmdshell' ,1
go
reconfigure
go
execute xp_cmdshell 'mkdir d:\project'
--判断数据库是否已经存在，如果存在就先删除再创建
use master --因为数据库的记录都存储这个master库的sysdatabases里面
if exists( select * from sysdatabases where name='MyBase')--exists是一个函数，用来判断（）中的结果集是否为null,如果为null.就返回false,否则返回true
 drop database MyBase --drop是用来注销结构的
go
create database MyBase --指定数据库名称
on primary --默认就是主文件组
(
name='MyBase_data',--逻辑名称 当语句不是一句可以独立执行的语句的时候就需要添加，它往往是一个语句块中的一句
size=3mb, --初始大小
fileGrowth=10%,--文件增长，每一次比前一次增长10%的容量
maxsize=1000mb,--限制文件的最大容量
filename='d:\project\MyBase_data.mdf' --文件全路径，必须指定文件的扩展名，最后一句不需要添加，
),
filegroup mygroup --创建文件组，那么接下来的一个数据库就会创建在这个文件组上
(
name='MyBase_data1',--逻辑名称 当语句不是一句可以独立执行的语句的时候就需要添加，它往往是一个语句块中的一句
size=3mb, --初始大小
fileGrowth=10%,--文件增长，每一次比前一次增长10%的容量
maxsize=1000mb,--限制文件的最大容量
filename='e:\aa\MyBase_data1.ndf' --文件全路径，必须指定文件的扩展名，最后一句不需要添加，
)
log on
(
name='MyBase_log',--逻辑名称 当语句不是一句可以独立执行的语句的时候就需要添加，它往往是一个语句块中的一句
size=3mb, --初始大小
fileGrowth=10%,--文件增长，每一次比前一次增长10%的容量,日志文件一般不会限制文件大小
filename='d:\project\MyBase_log.ldf' --文件全路径，必须指定文件的扩展名，最后一句不需要添加，
),
(
name='MyBase_log1',--逻辑名称 当语句不是一句可以独立执行的语句的时候就需要添加，它往往是一个语句块中的一句
size=3mb, --初始大小
fileGrowth=10%,--文件增长，每一次比前一次增长10%的容量,日志文件一般不会限制文件大小
filename='d:\project\MyBase_log1.ldf' --文件全路径，必须指定文件的扩展名，最后一句不需要添加，
)


--创建数据表
--语法：
--create table 表名
--(
-- 字段名称   类型   字段的特征（标识列 是否可以为null 主键 唯一键 外键 check约束）,--排名不分先后
-- 字段名称   类型   字段的特征（标识列 是否可以为null 主键 唯一键 外键 check约束）
--)
--Student：Id（学生编号，自动编号，主键）、Name（学生姓名）、Gender（性别）、Address（家庭地址）、Phone（电话）、Age（年龄）、Birthday（出生日期）CardId（身份证号）、CId（班级Id）
use MyBase
if exists(select * from sysobjects where name='Student')
--在sql中的if必须做处理
begin
	--print '数据表存在' --默认只包含一句
	drop table Student
end
go--批处理结束的标记
create table  Student
(
Id int primary key identity(1,1) ,--第一个参数是标识种子，第二个参数是标识增量
Name nvarchar(50) not null, --一定要记得为字符类型的字段设置长度，不然长度默认就是1  not null 就是说明这个字符非空--必须给值
Gender char(2) not null,
[Address] nvarchar(100) null,--如果为空可以设置为null,或者干脆不写，不定就说明这个字段的值呆以为null
Phone char(13),
Age int check(age>0 and age<100),
CardId char(18) not null,
Birthday datetime not null,
CId int not null
)