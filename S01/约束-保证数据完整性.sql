--约束-保证数据完整性--
--什么叫数据完整性：保证数据的真实，安全和准确

--一共有四种数据完整性：
--1.实体完整性：实体就是指一行记录，这个完整性就是为了保证这一行记录是唯一的
--	主键：非空，唯一
--	标识列：系统自动生成的，永远不会重复，也是唯一
--	唯一键：唯一，但是可以为null,只能null一次

--2.域完整性：域就是指单个字段，也就说明域完整性是为了保证字段的值是准确的有安全的
--	check约束
--	是否为null
--	数据类型
--	主外键约束--关系
--	默认值约束

--自定义完整性：check约束
--关系是一种多对一的关系 
--引用完整性：主外键约束：一个表（外键表）某个字段的值必须引用自另外一个表（主表）的某个字段,一个的字段的值必须是另外一个表的字段中已经存在的值
--外键表：引用的表，后存在的表
--主键表：被引用表，先存在的表
--建立主外键关系的细节：
--1.必须选择外键表去创建主外键关系
--2.建立主外键关系的字段的类型必须一致
--3.建立主外键关系的字段的意义必须完全一致
--4.建立了主外键关系的表在添加数据的时候需要先添加主键表的记录，再添加外键表的记录
--5.建立了主外键关系的表在删除数据的时候先删除外键表的记录再删除主键表的记录
--6.建立主外键关系的字段在主表中必须是主键或者唯一键

--有没有可能性：主表中没有任何记录，但是从表中有多条记录？为什么？
--有：因为建立关系的字段在主表中可以是唯一键，而唯一可以为NULL

--使用代码创建约束--
--主键(primary key PK)  唯一键(unique UQ) 默认值(default  DF) ckeck约束(check  CK) 主外键(foreign key  FK)
--语法：
--alter table 表名
--add constraint 约束名称(缩写_用户自定义名称) 约束类型  约束说明(表达式  字段名称  值)

--添加主键
if exists(select * from sysobjects where name='PK_id')
	alter table student drop constraint PK_id
alter table student add constraint PK_id primary key(id)
--为name字段添加唯一键
alter table student add constraint UQ_Name unique(name)
--为性别添加check约束
alter table student add constraint CK_gender check(gender='男' or gender='女')
--为年龄添加check约束，同时为地址添加默认约束
alter table student
add constraint DF_Address default(N'我在广wg州') for address, --为某个字段添加约束
constraint CK_Age check(age>0 and age<=100)
---为cid添加主外键
alter table student
add constraint FK_Student_Class_Cid foreign key(cid) references class(classId)
