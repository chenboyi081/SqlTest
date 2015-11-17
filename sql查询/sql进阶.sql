--go
--create view VW_getResult
--as
--select * from Student where Sex='男'
--go
--select * from VW_getResult

--go
----declare @subjectname nvarchar(50)='office'
----declare @subjectid int,@examtime datetime
----select @subjectid=(select subjectid from Subject where SubjectName=@subjectname)
----print @subjectid
----select @examtime=(select MAX(Result.ExamDate) from Result where SubjectId=@subjectid)
----select MAX(Result.StudentResult),MIN(Result.StudentResult) from Result where SubjectId=@subjectid and ExamDate=@examtime


--declare @subjectname nvarchar(50)='office'
--declare @subjectid int
--declare @avg int
--select @subjectid=(select Subject.SubjectId from Subject where Subject.SubjectName=@subjectname)
--select @avg=(select AVG(result.StudentResult) from Result where Result.SubjectId=@subjectid and Result.StudentResult is not null)
--print @avg
--if(@avg > 60)
--begin
--	print '最高分的三个学生信息'
--	select top 3 * from Result where SubjectId=@subjectid order by StudentResult desc
--end
--else
--begin
--	print '最低分的三个学生成绩'
--	select top 3 * from Result where SubjectId=@subjectid order by StudentResult
--end

--declare @errorsum int=0
--begin transaction
--update bank set cmoney-=1000 where name='aa'
--set @errorsum=@errorsum+@@error
--update bank set cmoney+=1000 where name='bb'
--set @errorsum=@errorsum+@@error
--if(@errorsum<>0)
--rollback transaction
--else
--commit transaction
--select * from bank

--if exists(select * from sysobjects where name='usp_getAllStuInfo')
--drop proc usp_getAllStuInfo
--go
--create procedure usp_getAllStuInfo
--@sex varchar(2),
--@classname nvarchar(50)
--as
--declare @classid int=(select classid from grade where classname=@classname)
--select * from Student where sex=@sex and ClassId=@classid
--go

--execute usp_getAllStuInfo '男','二期班'


--请对myschollMoreDate做如下操作：添加科目信息，对应的表是subject表，添加成功返回添加的科目ID，如果有必要，也请返回班级ID.
--具体建议要求如下：


--1.创建存储过程，有三个接收参数（班级名称，课程名称，课时），课时是有默认值（30）
--有两个输出参数，一个是班级ID,一个是课程ID
--2.判断输入的班级名称和课程名称是否为null,给了相应的错误提示
--3.开始事务
--4.判断班级是否存在 ，如果没有存在 就先执行插入班级信息操作，并得到相应的标识列

--5.判断事务是否需要回滚，如果不需要就执行插入课程信息操作

--6.判断事务是否需要回滚，如果不需要就得到相应的课程编号 
--7.提交事务，完成课程信息的添加操作。

go
if exists(select * from sysobjects where name='usp_getSubjectId')		--判断是否存在存储过程
drop procedure usp_getSubjectId
go
create procedure usp_getSubjectId
@classid int output,
@subjectid int output,
@subjectname nvarchar(50),
@classname nvarchar(50),
@classhour int=2
as
	if(@subjectname is null or @classname is null or LEN(RTRIM(LTRIM(@className)))=0 or LEN(RTRIM(LTRIM(@subjectName)))=0)
	print '班级或课程名不为空'
	return 1 --有返回值
	--insert into Subject 
	declare @error int=0
	begin transaction
	--判断输入的班级名称是否已经存在
	if exists(select * from grade where classname=@classname)
		set @classid=(select classid from grade where classname=@classname)  --如果存在，就直接返回获取的classid值
	else
		begin
			insert into grade values(@classname)
			set @error=@error+@@error	--记录错误
			set @classid=(select @@IDENTITY)
			if(@error<>0)
			begin
				rollback transaction
				return 2	--有返回值
			end
		end
	--插入新课程记录
	insert into Subject values(@subjectname,@classhour,@classid)
	set @error=@error+@@error	--记录错误
	set @subjectid =(select @@IDENTITY)
	if (@error<>0)
		begin
			rollback transaction
			return 3	--有返回值
		end
	if (@error<>0)
		rollback transaction
	else
		commit transaction
go

--调用存储过程
--调用有输出参数的存储过程，需要创建对应数量和类型的变量接收返回值
--如果是输出参数，那么在调用的时候也必须使用output做为接收的标记
--declare @subjectname nvarchar(50),@classname nvarchar(50),@classhour int
declare @cid int,@sid int
exec usp_getSubjectId @cid output,@sid output,'超人飞翔课','超人班',2
print @cid
print @sid