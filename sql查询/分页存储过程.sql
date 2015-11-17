--if exists(select * from sysobjects where name='usp_getPageData')
--	drop proc usp_getPageData
--go
--create proc usp_getPageData
--@totalCount int output,	--ҳ����
--@pageIndex int=1,	--ҳ������
--@pageCount int=5	--ÿҳ��¼��
--as
--select * from (select ROW_NUMBER() over(Order by(studentno))as id,* from Student)temp where id
--between (@pageIndex-1)*@pageCount+1 and @pageIndex*@pageCount
--set @totalCount=ceiling((select COUNT(*) from Student)*1.0/@pageCount)
--go

if exists(select * from sysobjects where name='usp_GetSubjectPageData')
	drop proc usp_GetSubjectPageData
	go
create procedure usp_GetSubjectPageData
@totalCount int output,		--ҳ����
@pageIndex int=1,		--ҳ������
@pageCount int=5		--ÿҳ��¼��
as
select * from (select ROW_NUMBER() over(order by(Subject.SubjectName))as id,* from Subject)temp where id between (@pageIndex-1)*@pageCount+1 and
@pageIndex*@pageCount
set @totalCount=ceiling((select count(*) from Subject)*1.0/@pageCount)
print @totalCount
go

declare @cnt int
exec usp_GetSubjectPageData @cnt output
print @cnt

