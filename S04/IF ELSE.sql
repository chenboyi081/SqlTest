--IF ELSE
--1.也有多重和嵌套
--2.没有｛｝，用begin..end替代
--3.if结构里面必须有语句做处理
--4.没有所谓的true/false
--5.()可以省略
--if(1<>1)
--	begin
--		print 'aa'
--		print 'bb'
--	end
go
--计算office平均分数并输出，如果平均分数超过60分输出成绩最高的三个学生的成绩，否则输出后三名的学生
declare @subjectName nvarchar(50)='office'--科目名称
declare @subjectId int=(select SubjectId from Subject where SubjectName=@subjectName)--科目ID
declare @avg int--平均分
select @avg=(select AVG(StudentResult) from Result where SubjectId=@subjectId and studentresult is not null) 
if @avg>=60
 begin
	print '成绩不错。输入前三名：'
	select top 3 * from Result where SubjectId=@subjectId order by StudentResult desc 
 end
else
 begin
	print '成绩不好。输入后三名：'
	select top 3 * from Result where SubjectId=@subjectId order by StudentResult asc  
 end   
