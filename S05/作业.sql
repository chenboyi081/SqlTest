--现查询图书的所有信息，要求图书价格显示为：
--价格为空：显示为“价格未知“
--10-20：显示为“价格在10至20之间”
--20-30：：显示为“价格适中”
--其他：原样显示

select bookid,bookname,
case--不接表达式或者字段，就可以做范围和null值的判断
 when price between 20 and 30 then '价格适中'
 when price between 10 and 19 then '价格在10至20之间' 
 when price is  null then '价格未知'
 ELSE cast(price  as CHAR(10))
end as 价格
 from books

--2.查询学号是"1“的学生参加”最近一次“的“office”课程考试的成绩，要求输出学生姓名和成绩
--	1.使用子查询
--	2.如果没有相应的数据则可以更改数据表中的数据 
select Student.StudentName,Result.StudentResult
from Student
inner join Result on Student.StudentNo=Result.StudentNo
where Result.StudentNo=1 and ExamDate=
	(select MAX(ExamDate) from Result where StudentNo=1 and SubjectId=
		(select SubjectId from Subject where SubjectName='office')) and SubjectId=
			(select SubjectId from Subject where SubjectName='office')
			
--使用变量
go
declare @studentNo int=1--学号
declare @subjectName nvarchar(50)='office' --科目名称
declare @subjectId int=(select SubjectId from Subject where SubjectName=@subjectName) --科目ID
declare @time datetime--这个人最近一次考试日期
set @time=(select MAX(ExamDate) from Result where StudentNo=@studentNo and SubjectId=@subjectId)
--查询
select StudentNo,StudentResult from Result where StudentNo=@studentNo and SubjectId=@subjectId and ExamDate=@time
--使用子查询得到列的值
select (select studentname from student where studentno=@studentno),StudentResult from Result where StudentNo=@studentNo and SubjectId=@subjectId and ExamDate=@time
--使用子查询做为结果集
select StudentName,temp.StudentResult from 
Student
inner join (select StudentNo,StudentResult from Result where StudentNo=@studentNo and SubjectId=@subjectId and ExamDate=@time) temp on Student.StudentNo=temp.StudentNo
go

--3.检查学生“office”课最近一次考试是否有不及格（60分及格）的学生。如有，每人加2分，高于95分的学生不再加分，直至所有学生这次考试成绩均及格(注意加分过程不要违反约束)
declare @subjectName nvarchar(50)='office' --科目名称
declare @subjectId int=(select subjectId from Subject where SubjectName=@subjectName)--科目ID
declare @time datetime=(select MAX(ExamDate) from Result where SubjectId=@subjectId)--这一科目最近一次考试时间
--exists判断有没有，如果后面的语句返回的结果集不为null,那么exists函数就返回true,否则就返回false
while(1=1)
	begin
		if exists(select * from Result where SubjectId=@subjectId and ExamDate=@time and StudentResult<60)
			begin
				update Result set StudentResult+=2 where SubjectId=@subjectId and ExamDate=@time and StudentResult<=95
			end
		else
			break
	end


--4.打印如下图案：使用二重循环完成
--★
--★★
--★★★
--★★★★
--★★★★★
declare @i int=1
declare @graph varchar(10)=''
while(@i<=5)
	begin
		set @graph=@graph+'★'
		set @i+=1
		print @graph
	end
