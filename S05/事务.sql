update bank set cmoney-=1000 where name='aa'
go
update bank set cmoney+=1000 where  name='bb'
--在这个时候需要保证这两句sql语句要么都能成功执行，要么就都不执行--需要一种新的处理机制--事务：它并不是一种什么样的操作，而只是一种在操作执行的时候的一种处理机制
--1,事务是种处理机制，处理方式
--2.它是对有可能修改表数据的操作而言--增加删除和修改
--事务的四个特点：ACID
--A:原子性：事务要么都执行，要么都不执行，它不可以再分
--C.一致性：在事务处理前后，表的对应的数据需要保持某个方面的一致
--I:隔离性：事务是独立的，事务在执行的时候与其它事务无关
--D.持久性：事务一旦提交，那么表的数据会永远修改
--事务的三条关键语句：
--开启事务：begin transaction
--回滚事务：rollback transaction
--提交事务：commit transaction
--事务到底如何创建：
--1.将需要执行的sql语句块包含在开启事务和提交事务之间 或者开启事务和回滚事务之间
--2.事务一旦开启，就必须提交或者回滚:事务在处理的时候需要占据文件句柄。句柄没有释放之前其它的请求无法进行，所以一定要让开启事务后能够执行到回滚或者提交
--3.如果需要回滚或者提交，则必须有对应的开启事务的语句
--使用事务执行转帐操作
declare @error int=0 --创建一个变量存储每一条sql语句可能产生的错误号
select * from bank
begin transaction --开启了一个事务 
update bank set cmoney-=500 where name='aa'
--@@ERROR它只能取到最近的这一条sql命令的错误号，而不管这条命令是干什么的
set @error=@error+@@ERROR --每一条sql命令都有可能会出错，使用变量记录它们的错误号，如果错误号为0就说明没有错误，如果错误号不为0就说明语句执行出错了,如果在某句发现语句执行出错，不会立刻做出判断提交或者回滚，而只是记录错误号而已	
update bank set cmoney+=500 where  name='bb'
set @error=@error+@@ERROR
select * from bank
if(@error<>0)
	rollback transaction
else
	commit transaction
