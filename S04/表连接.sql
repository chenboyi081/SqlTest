--������Join--
--��ѯ����ѧ�������������估���ڰ༶
--ʹ���Ӳ�ѯ
select StudentName,DATEDIFF(yyyy,borndate,getdate()),(select classname from grade where ClassId=Student.ClassId) from Student
--ʹ��from���
select StudentName,DATEDIFF(yyyy,borndate,getdate()),classname
from Student,grade
where Student.ClassId=grade.ClassId
--ʹ�ö������  �� inner join ����ı�  on ��ν�������(�ܹ������������ֶ�һ������ܹ������������ϵ���ֶ�)
select StudentName,DATEDIFF(yyyy,borndate,getdate()),classname
from Student
join grade on Student.ClassId=grade.ClassId
--1.�����ӣ�inner join.�ҵ�����������ϵ���ֶ�ֵ��ȵļ�¼,����ֶ�ֵ�����,��ô������
--��ѯѧ�����������䡢�༶���ɼ�
select Student.StudentName,DATEDIFF(YYYY,Student.BornDate,GETDATE()),grade.classname,Result.StudentResult
from Student
inner join grade on Student.ClassId=grade.ClassId
inner join Result on Student.StudentNo=Result.StudentNo
where student.ClassId=2

--��ѯÿ��ѧԱ��Ҫ�μӵĿ��Կ�Ŀ����
select Student.StudentNo,Student.StudentName,Subject.SubjectName
from Student
inner join Result on Student.StudentNo=Result.StudentNo
inner join Subject on Result.SubjectId=Subject.SubjectId

select Student.StudentNo,Student.StudentName,Subject.SubjectName
from Student
inner join Subject on Student.ClassId=Subject.ClassId

select * from PhoneType 
inner join PhoneNum on PhoneNum.pTypeId=PhoneType.ptId

--��,������
--�����ӣ����Եõ��������м�¼��ֻ������������ֶε�ֵ���ұ����Ҳ�����Ӧ�Ĺ�����¼����ô�ұ��е������ֶλ���nullֵ���
select * from PhoneType   left join  PhoneNum on PhoneNum.pTypeId=PhoneType.ptId

--��ѯû�вμӿ��Ե�ѧԱ��Ϣ
select * from Student
left join Result on Student.StudentNo=Result.StudentNo
where Result.StudentNo is null and Result.SubjectId is null

--������:
select * from PhoneType left join PhoneNum on PhoneNum.pTypeId=PhoneType.ptId


--��������:
select * from Student
cross join grade

--��������ӵĽ���:
--1.��ȷ���ֶζ���������һЩ��,ͨ��  ��.�ֶ�  �ķ�ʽ����ȷ��
--2.�鿴��Щ������һЩ���������Խ����������ϵ���ֶΣ������û�й����������Ƿ���Ҫʹ���м���������й���
--3.������Ӻ���Եõ�һ������ı����Զ������������ֶ����where����
--��ϰ1����ѯ����Ӣ�Ｐ���ѧ�����������估�ɼ�
select Student.StudentName,DATEDIFF(YYYY,Student.BornDate,GETDATE()),Result.StudentResult
from Student
inner join Result on Student.StudentNo=Result.StudentNo
inner join Subject on Result.SubjectId=Subject.SubjectId
where Subject.SubjectName='office' and Result.StudentResult>=60
--��ϰ2����ѯ���вμӿ��Ե�(english������Ϊnull)ѧ�����������估�ɼ�
--��ϰ3����ѯ����ѧ��(�μӺ�δ�μӿ���)��ѧ�����������䡢�ɼ������û�вμӿ�����ʾȱ��,���С��60����ʾ������office
select Student.StudentName,DATEDIFF(yyyy,student.borndate,getdate()),
case
 when Result.StudentResult is null then 'û�п���'
 when Result.StudentResult>=60 then cast(Result.StudentResult AS CHAR(3))
 else '������'  
end
from Student
left join Result on Student.StudentNo=Result.StudentNo
inner join Subject on Result.SubjectId=Subject.SubjectId
where Subject.SubjectName='office'

