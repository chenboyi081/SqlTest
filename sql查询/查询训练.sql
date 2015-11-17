--1.查询六期班所有姓 陈 的学员
--2.查询所有科目中包含c 字符的科目信息
--3.查询office最近一次考试时间


select * from Student where ClassId=5 and StudentName like '陈%' 
select * from Subject where SubjectName like '%[c]%'
select MAX(ExamDate) from Result where SubjectId=1


--1.查询每个班级的总学时数，并按照升序排列
--2.查询每个参加考试的学员的平均分
--3.查询每门课程的平均分，并按照降序排列
--4.查询每个班级男女生的人数

select ClassId,SUM(ClassHour) classhour from Subject where ClassId is not null group by ClassId order by SUM(ClassHour)

select StudentNo,AVG(StudentResult) 平均成绩 from Result where StudentResult is not null group by StudentNo


--作业2
--1.查询出一期班所有的科目名称
--2.查询出六期班男同学的姓名和住址
--3.出无电子邮件的学生姓名和班级信息
--4.查询出生日期在1990年之后的三期班的男学生姓名和年级信息
--5.查询出参加了日期为2013-01-22 00:00:00的“office”科目考试的成绩信息
--6.查询出考试前五名成绩

select classname,SubjectName from Subject,grade where classname='二期班' and Subject.ClassId=grade.ClassId
select classname,StudentName,Address from Student,grade where classname='六期班' and Student.ClassId=grade.ClassId and Sex='男'
select StudentName,classname from Student,grade where Email is null and grade.ClassId=student.ClassId
--select StudentName,ClassId,BornDate from Student where BornDate>1990 
select StudentName,classname,BornDate from Student,grade where BornDate>'1990' and Sex='男' and classname='三期班' and Student.ClassId=grade.ClassId
select SubjectName,StudentResult,ExamDate from Result,Subject where ExamDate='2013-01-22 00:00:00' and Result.SubjectId=Subject.SubjectId and Subject.SubjectName='office'
select top 5 StudentName,StudentResult from Result,Student order by StudentResult desc

