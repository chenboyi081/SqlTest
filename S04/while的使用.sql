--WHILE循环--
--1.不有写true/false
--2.没有｛｝，只有begin..and
--3.可以嵌套
--4.也可以在循环体写continue/break,continue可以中止当前这一次，继续下一次，break是跳出当前这一层循环

---计算1-100之间所有奇数的和--
declare @i int=1
declare @sum int=0
while(@i<=100)
begin
 if(@i%2!=0)
	begin
		set @sum+=@i
	end 
 set @i+=1 
end
print '和='+cast(@sum as char(4))

go
--如果office不及格的人超过半数(考试题出难了)，则给每个人增加2分,循环加，直到不及格的人数少于一半。
declare @subjectName nvarchar(50)='office'--科目名称
declare @subejctId int=(select subjectId from Subject where SubjectName=@subjectName)--科目ID
declare @totalNum int --总人数
set @totalNum=(select COUNT(*) from Result where SubjectId=@subejctId)
declare @unpassNum int---没有及格人数
select @unpassNum =COUNT(*) from Result where SubjectId=@subejctId and StudentResult<70
print @totalnum
print @unpassnum
while(@totalNum/2<@unpassNum)
	begin
		update Result set StudentResult+=5 where SubjectId=@subejctId and StudentResult <=95
		--再一次计算不及格人数
		select @unpassNum =COUNT(*) from Result where SubjectId=@subejctId and StudentResult<70
	end
	
go
declare @subjectName nvarchar(50)='office'--科目名称
declare @subejctId int=(select subjectId from Subject where SubjectName=@subjectName)--科目ID
declare @totalNum int --总人数
set @totalNum=(select COUNT(*) from Result where SubjectId=@subejctId)
--declare @unpassNum int---没有及格人数
--select @unpassNum =COUNT(*) from Result where SubjectId=@subejctId and StudentResult<70
--print @totalnum
--print @unpassnum
while(1=1)
	begin
		if((select COUNT(*) from Result where SubjectId=@subejctId and StudentResult<70)>@totalNum/2)
			update Result set StudentResult+=4 where SubjectId=@subejctId and StudentResult<=96
		else
			break
	end
