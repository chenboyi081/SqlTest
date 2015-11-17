--将原表复制到临时表中
select * into newGrade from grade
--删除源表数据，重置标识列
truncate table grade
--将新表查数据插入到原表中
insert into grade select classname from newGrade 