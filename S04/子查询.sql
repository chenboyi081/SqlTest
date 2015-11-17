--子查询--
--一个查询里面还包含着另外一个查询
--子查询做为条件--
--1.包含在()里面先执行的查询就是子查询语句,包含子查询的就称不父查询语句
--2.引入子查询时，在选择列表中只能指定一个表达式,就是意味着子查询做为条件(有关系运算符)的时候子查询永远不可能出现多列的情况
--3.子查询返回的值不止一个。当子查询跟随在 =、!=、<、<=、>、>= 之后，或子查询用作表达式时，这种情况是不允许的,就意味着如果子查询跟在关系运算符之后，必须保证子查询只返回了单个值,如果真的需要这么做就可以使用关键字 in/not in
--查询比林思年龄大的学员信息
--4.有子查询的sql语句返回的列只与父查询有关，子查询中的列仅仅是做为条件判断
--1.先查询出林思的年龄
select borndate from Student where StudentName='林思'
--返回一行多列值----做为条件永远错误
select * from Student where BornDate<(select * from Student where StudentName='林思')
--返回多行一列值
select * from Student where BornDate<(select borndate from Student)
--查询班级ID《=3的学员信息
select classid from grade where ClassId<=3
select StudentNo,StudentName from Student where ClassId not in(select classid from grade where ClassId<=3)

--子查询得到某列的值 --用得最少
--查询学员是10的学员office考试成绩和考试日期,显示学员姓名
select (select studentname from student where studentno=10),StudentResult,ExamDate from Result where StudentNo=10 and SubjectId=(select SubjectId from Subject where SubjectName='office')

--3.查询得到结果集，可以使用子查询返回一张虚拟表
--查询班级ID为1的所有学员的考试成绩
--1查询出班级ID为1的学员的学号 
select studentno from Student where ClassId=1
--查询指定学号的学员的成绩
select * from Result where StudentNo in(select studentno from Student where ClassId=1)
--分页
select top 5 * from Student
select top 5 * from Student where StudentNo not in(select top 5 StudentNo from Student order by StudentNo)

--ROW_NUMBER 可以为查询出的每一行返回一个行号，行号类似于标识列，永远不会重复，同是它默认是连续的
--over说明在那一个字段上进行排序，因为按不同字段排序结果集的显示是不一样的
select ROW_NUMBER() over(order by studentno) as id,* from Student
--如果子查询做为结果集那么必须为其添加别名
select * from (select ROW_NUMBER() over(order by studentno) as id,* from Student) as temp
where temp.id>=6 and id<=10


--使用Row_number() over(指定排序字段)实现分页,这个函数可以为结果集添加一个新列
select ROW_NUMBER() over(order by studentno) as id,* from Student
select * from (select ROW_NUMBER() over(order by studentno) as id,* from Student
) as temp where  id>0 and id<=5

--查询年龄比“廖杨”大的学员，显示这些学员的信息
select * from Student where BornDate<(select BornDate from Student where StudentName='廖杨')
--查询二期班开设的课程
select * from Subject where ClassId=(select ClassId from grade where classname='二期班')
--查询参加最近一次“office”考试成绩最高分和最低分
select subjectid from Subject where SubjectName='office'
select MAX(ExamDate) from Result where SubjectId=(select subjectid from Subject where SubjectName='office')

select  max(StudentResult),MIN(StudentResult) from Result where SubjectId=
	(select subjectid from Subject where SubjectName='office') 
		and ExamDate=
			(select MAX(ExamDate) from Result where SubjectId=
				(select subjectid from Subject where SubjectName='office'))


--子查询的分类:
--1.独立子查询:单独可以运行的子查询
--2.相关子查询：子查询中引用了父查询中的列
--查询参加了考试的学员信息
select distinct StudentNo from Result
select * from Student where StudentNo in(select distinct StudentNo from Result)

select * from Student where StudentNo=(select distinct StudentNo from Result where Result.StudentNo=Student.StudentNo)

select StudentNo from Result where StudentNo=33

select * from Student where StudentNo=(select StudentNo from Result where StudentNo=33)


