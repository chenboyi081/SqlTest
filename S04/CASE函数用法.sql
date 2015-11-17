--CASE函数用法--
语法：
--1.Case...end会生成一个新列，作用是判断你指定字段的值或者范围，然后得到一个用户自定义的对应的值
--2.它并不会修改原始的表数据，而只是修改结果集的显示
--3.case可以做等值判断，也可以做范围判断。
--4.做等值判断的语法：
--case 字段或者表达式
--  when 具体的值 then '用户自定义值'
--  else 上面的when都不满足就满足else
--end
--5.做等值判断的时候不能判断null值
select StudentNo,StudentName,
case ClassId+1 --当case后面接有字段或者表达式说这个case只能做行等值判断
 when 1 then '一期班'
 when 2 then '二期班' 
  else '我不知道'
end,--case会生成一个新列，所以如果Case..end后面还有其它列，就必须先使用，进行分割
case email
 when  NULL  then '没有填写'
 else email 
end as 你要的列名
 from Student
--case ..end做范围判断
语法：
--case --没有接任何的列名或者表达式
-- when 表达式 then 值
-- 。。。。
-- else  值  
--end 
--then后面的值的类型需要可以互换
--when后面的表达式使用的字段可以是任意的，并不要求是同一个
select StudentName,
case 
  when BornDate>'2000-1-1' then '小屁孩' --如果不满足这个when相当于隐藏一个条件转到下一个when
  when BornDate>'1990-1-1' then '小青年'
  when BornDate>'1980-1-1' then '小中年'
  when sex='男' then '他是男的'
end,
case
 when Email is null then '没有填写'
 else Email  
end
 from Student

--百分制转换为素质教育
select StudentNo,
case 
 when StudentResult>=90 then 'A'
 when StudentResult>=80 then 'B'
 when StudentResult>=70 then 'C'
 when StudentResult>=60 then 'D' 
 when StudentResult is  null then '没有考试'
 else  'E'
end AS 成绩
 from Result
 
