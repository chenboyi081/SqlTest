--数据插入
---方法的调用 一一对应：类型对应，顺序对应，数量对应
--语法： 字段列表就相当于形参，而值列表就相当于实参
--insert  [into] 表名[(字段列表)] values(值列表)
--1.为student表添加全部的列数据,如果没有指定具体的字段列表，那么就需要为所有列添加值,但是标识列是永远不能人为添加值的，因为它是系统自动生成的。
insert into  Student values('123455667','张三','男',4,'110',N'广州','1990-1-1','aa@bb.com')
--2.如果字段可以为null，或者字段有默认值，那么在添加值的时候可以使用null/default
insert into  Student values('123455667','张三','男',4,null,'广州','1990-1-1',default)
--3.如果没有指定可以为null或者有默认值的字段，那么就不需要为他赋值:列名或所提供值的数目与表定义不匹配。
insert into  Student(LoginPwd,StudentName,Gender,GradeId,Birthday) values('123455667','张三','男',4,'1990-1-1') --INSERT 语句中列的数目小于 VALUES 子句中指定的值的数目。VALUES 子句中值的数目必须与 INSERT 语句中指定的列的数目匹配
--4.非空字段一定需要传入值
insert into  Student(LoginPwd,StudentName,Gender,GradeId) values('123455667','张三','男',4) 
--5.插入的值必须符合表的完整性约束
insert into  Student(LoginPwd,StudentName,Gender,GradeId,Birthday) values('123456','张三','男',5,'1999-9-9') 
--6.任何内容都可以使用’‘包含，但是如果是字符串类型的数据没有使用’‘就会报错。其实原因主就是：系统会对你传入的值做隐式的类型转换，如果可以转换成功，那么就转换后再使用，如果不能那么就报错
--但是如果是字符串值没有添加’‘，那么会将这个字符串值当成一个列名--变量名
insert into  Student(LoginPwd,StudentName,Gender,GradeId,Birthday) values('123456','张三',男,'2','1999-9-9') 
--7.日期值如果没有添加’‘，那么就得到日期的默认值--1905-6-5
insert into  Student(LoginPwd,StudentName,Gender,GradeId,Birthday) values('123456','张三','男','2',1999-9-9)