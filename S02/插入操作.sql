--数据插入--
--语法：方法参数有三个对应：类型对应   数量对应   顺序对应
--insert [into] 表名[(字段列表)] values(值列表)
use MySchool
--1.如果表名后没有指定具体的字段列表，那么就默认需要为所有列添加值,但是不管什么时候都不能为标识列人为添加值
insert into Student values(3,'dsfasdfas','fasdfas',1,3,'23432','fadsfas','2012-2-2','fasfasd')
--2.不能为标识列插入值：仅当使用了列列表并且 IDENTITY_INSERT 为 ON 时，才能为表'Student'中的标识列指定显式值。
--3.如果没有指定具体的列名,就必须为所有列添加值,也就意味着值的数量不能多也不能少:列名或所提供值的数目与表定义不匹配。
insert into Student values('dsfasdfas','fasdfas',1,3,'23432','fadsfas','2012-2-2')
--4.如何为可以为NULL的字段指定null值，或者有默认值的字段指定默认值
insert into Student values('dsfasdfas','fasdfas',1,3,'23432',default,'2012-2-2',null)
--5.如果字段可以为NULL,那么就可以不指定这个字段
insert into Student(LoginPwd,StudentName,Gender,GradeId,Phone,Address,Birthday) values('dsfasdfas','fasdfas',1,3,'23432',default,'2012-2-2')
--6.如果是非空字段，就必须插入值
insert into Student(LoginPwd,StudentName,Gender,GradeId,Phone,Address) values('dsfasdfas','fasdfas',1,3,'23432',default)
--插入的值必须满足表的完整性约束
insert into Student(LoginPwd,StudentName,Gender,GradeId,Phone,Address,Birthday) values('aaa','fasdfas',1,3,'23432',default,'2012-2-2')

--类型在插入数据时的地位：
--7.任何类型的值都可以包含在‘’以内：系统会做隐式的强制转换，将实参的值强制转换为字段的类型，如果可以转换就执行相应的操作，如果不可以转换就报错
insert into Student values('dsfasdfas','fasdfas','0','3','23432','fadsfas','2012-2-2','fasfasd')
--8.如果是字符串类型却没有添加‘’就会：1.如果是数值组成的字符串就OK 2.如果是非数值组成的字符串就报错
insert into Student values('dsfasdfas',fasdfas,'0','3','23432','fadsfas','2012-2-2','fasfasd')
insert into Student values('dsfasdfas',123123,'0','3','23432','fadsfas','2012-2-2','fasfasd')
--9.日期类型的值一定需要包含在‘’以内，否则就是系统的默认值  1905-7-2   1906-6-22
insert into Student values('dsfasdfas',121,'0','3','23432','fadsfas',2012-2-2,'fasfasd')