---Len(参数)--得到指定的字段或者字符串的长度---存储的字符个数--不区分中英文
select LEN('中华')
--DataLength(参数)--得到指定的字段或者字符串值占据的字节数
select DATALENGTH('中华')

--char:空间一旦分配就不会再根据存储的内容进行回收,但是如果存储的字符数走出了空间大小,就会报一个  截断二进制数据的错误--
select LEN(Char) from CharTest
select DATALENGTH(Char) from CharTest

--Varchar：会根据存储的内容做相应的处理：如果存储的内容小于指定的大小，那么多余的空间会自动回收，但是如果走出范围还是报错
select LEN(Varchar) from CharTest
select DATALENGTH(Varchar) from CharTest

--当你的数据的长度可以大概限制一个波动不是很的范围空间值之内的,那么就可以使用char,如身份证号 ，但是如果值的空间范围波动很大，那么就应该考虑使用varchar

--nchar:不管什么类型的字符都是占据两个字节 它就是传说中的unicode字符，它的目标就是消除乱码
select LEN(Nchar) from CharTest
select DATALENGTH(Nchar) from CharTest

--Nvarchar  n代表unicode字符，var代表自动收缩。
select LEN(Nvarchar) from CharTest
select DATALENGTH(Nvarchar) from CharTest

---如果全部是英文字符的时候就应该考虑使用非unicode,如果包含中文就可以考虑使用unicode字符