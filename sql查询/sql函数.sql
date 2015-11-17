select LEN('中华人民共和国')
select lTRIM('        aaaa            ')+'Q'
select REPLACE('中 华 人 民共 和 国',' ','')
select RIGHT('中华人民共和国',3)
select STUFF('中华人民共和国',2,4,'aaaa')

--chenboyi081@qq.com
--截取用户名和域名
select CHARINDEX('@','chenboyi081@qq.com')
select LEN('chenboyi081@qq.com')
select LEFT('chenboyi081@qq.com',CHARINDEX('@','chenboyi081@qq.com')-1)
select RIGHT('chenboyi081@qq.com',LEN('chenboyi081@qq.com')-CHARINDEX('@','chenboyi081@qq.com'))


select ROUND(1.445,1)
select SIGN(0)
--	sqrt求平方根
select SQRT(8)
--POWER求幂


--日期函数（重要）
select GETDATE()
--DATEADD 第一个参数是指时间间隔，第二个参数是指你需要增加的数量，第三个参数是你增减以那一个日期 值做为参考
select DATEADD(YY,3,GETDATE())

--DATEDIFF 找到两个日期值指定间隔单位的差异
select DATEDIFF(YY,'1990-1-1',GETDATE())

--DATENAME可以得到日期部分的字符串表现形式
select DATENAME(DW,GETDATE())

--DATEPART 得到指定的日期部分

--得到今天过生日的学生的姓名和班级信息
select StudentName,ClassId from Student where DATEPART(MM,borndate)=DATEPART(mm,getdate()) and DATEPART(DD,BornDate)=DATEPART(DD,getdate())