use master --切换数据库
if exists(select * from sysdatabases where name='MySchool')
  drop database MySchool --删除数据库
go
exec sp_configure 'show advanced options',1
go
reconfigure
go
exec sp_configure  'xp_cmdshell',1
go
reconfigure
go
exec xp_cmdshell 'mkdir d:\project'
go
create database MySchool
on --在那一个文件组上创建，默认就是主文件组
(
 name='MySchool_data',--逻辑名称
 size=3mb,--初始大小
 filegrowth=10%,--文件增长
 maxsize=1000mb,--文件最大容量
 filename='d:\project\MySchool_data.mdf'    --文件全路径，包含目录和文件名 
)
log on
(
 name='MySchool_log',--逻辑名称
 size=3mb,--初始大小
 filegrowth=10%,--文件增长
 --maxsize=1000mb,--文件最大容量,日志文件一般不会限制最大文件
 filename='d:\project\MySchool_log.ldf' 
)
use MySchool --先切换数据库
if exists(select * from sysobjects where name='Grade')
  drop table Grade
  go 
create table Grade
(
--字段名称  字段类型 字段的特征(主键 唯一键 外键 check约束 是否为null,默认值)
GradeId int identity(1,1),
GradeName nvarchar(50) not null
)
--为grade表添加约束
--alter table 表名 add constraint 约束名称 约束类型 约束说明(字段，表达式，值)
alter table grade add constraint PK_GradeId primary key(GradeId),
constraint UQ_GradeName unique(GradeName)

if exists(select * from sysobjects where name='Student')
  drop table Student
  go 
create table Student
(
StudentNo int primary key identity(1,1),
LoginPwd varchar(50)  not null,
StudentName nvarchar(50) not null,
Gender char(1) not null,
GradeId int not null,
Phone varchar(14) ,
Address nvarchar(200),
Birthday datetime not null,
Email varchar(50)
)
--为student表添加约束
--	密码loginPwd的长度大于等于6位
alter table student add constraint CK_LoginPwd check(len(loginPwd)>=6)
--	studentNo学号是标识列--不能通过约束添加
--	Gender性别只能取1和0，1代表男，0代表女
alter table student add constraint CK_Gender check(gender=0 or gender=1)
--	GradeId是grade表的外键
alter table student add constraint FK_Grade_Student_GradeId foreign key(gradeid) references grade(GradeId)
--	Address有默认值：“未填写”--	Email:默认值 匿名@未知.com
alter table student
add constraint DF_Address default(N'未填写') for address,
constraint DF_Email default('aa@bb.com') for email


alter table student add TestId int

