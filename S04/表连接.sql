--表连接Join--
--查询所有学生的姓名、年龄及所在班级
--使用子查询
select StudentName,DATEDIFF(yyyy,borndate,getdate()),(select classname from grade where ClassId=Student.ClassId) from Student
--使用from多表
select StudentName,DATEDIFF(yyyy,borndate,getdate()),classname
from Student,grade
where Student.ClassId=grade.ClassId
--使用多表连接  表 inner join 另外的表  on 如何建立关联(能够建立关联的字段一般就是能够创建主外键关系的字段)
select StudentName,DATEDIFF(yyyy,borndate,getdate()),classname
from Student
join grade on Student.ClassId=grade.ClassId
--1.内连接：inner join.找到两个表建立关系的字段值相等的记录,如果字段值不相等,那么就抛弃
--查询学生姓名、年龄、班级及成绩
select Student.StudentName,DATEDIFF(YYYY,Student.BornDate,GETDATE()),grade.classname,Result.StudentResult
from Student
inner join grade on Student.ClassId=grade.ClassId
inner join Result on Student.StudentNo=Result.StudentNo
where student.ClassId=2

--查询每个学员需要参加的考试科目名称
select Student.StudentNo,Student.StudentName,Subject.SubjectName
from Student
inner join Result on Student.StudentNo=Result.StudentNo
inner join Subject on Result.SubjectId=Subject.SubjectId

select Student.StudentNo,Student.StudentName,Subject.SubjectName
from Student
inner join Subject on Student.ClassId=Subject.ClassId

select * from PhoneType 
inner join PhoneNum on PhoneNum.pTypeId=PhoneType.ptId

--左,右连接
--左连接，可以得到左表的所有记录，只不过如果左表的字段的值在右表中找不到相应的关联记录，那么右表中的所有字段会以null值替代
select * from PhoneType   left join  PhoneNum on PhoneNum.pTypeId=PhoneType.ptId

--查询没有参加考试的学员信息
select * from Student
left join Result on Student.StudentNo=Result.StudentNo
where Result.StudentNo is null and Result.SubjectId is null

--右连接:
select * from PhoneType left join PhoneNum on PhoneNum.pTypeId=PhoneType.ptId


--交叉连接:
select * from Student
cross join grade

--做多表连接的建议:
--1.先确定字段都来自于那一些表,通过  表.字段  的方式进行确定
--2.查看这些表都有那一些关联（可以建立主外键关系的字段），如果没有关联，考虑是否需要使用中间其它表进行关联
--3.多表连接后可以得到一个虚拟的表，可以对这个表的所有字段添加where条件
--练习1：查询所有英语及格的学生姓名、年龄及成绩
select Student.StudentName,DATEDIFF(YYYY,Student.BornDate,GETDATE()),Result.StudentResult
from Student
inner join Result on Student.StudentNo=Result.StudentNo
inner join Subject on Result.SubjectId=Subject.SubjectId
where Subject.SubjectName='office' and Result.StudentResult>=60
--练习2：查询所有参加考试的(english分数不为null)学生姓名、年龄及成绩
--练习3：查询所有学生(参加和未参加考试)的学生姓名、年龄、成绩，如果没有参加考试显示缺考,如果小于60分显示不及格office
select Student.StudentName,DATEDIFF(yyyy,student.borndate,getdate()),
case
 when Result.StudentResult is null then '没有考试'
 when Result.StudentResult>=60 then cast(Result.StudentResult AS CHAR(3))
 else '不及格'  
end
from Student
left join Result on Student.StudentNo=Result.StudentNo
inner join Subject on Result.SubjectId=Subject.SubjectId
where Subject.SubjectName='office'

