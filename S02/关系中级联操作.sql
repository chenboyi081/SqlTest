--- 创建关系时的级联操作
alter table student
with nocheck --不检查现有数据
add constraint FK_Grade_Student_GradeId foreign key(gradeid) references grade(gradeid)
on delete set null
--[ ON DELETE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]
--on--在做何种操作的时候做相应的处理
--NO ACTION--不做任何操作：该报错就报错，可以删除就删除
--CASCADE：级联：删除主表，对应的从表数据也会删除，更新也一样
--SET NULL：如果删除主表的记录，那么对应的从表记录的字段值会被设置为null,前提是从表的这个字段的值可以是null
--SET DEFAULT :删除主表记录，从表的记录的对应字段值设置为默认值，前提是你之前为这个字段设置了默认值
