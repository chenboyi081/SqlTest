--CASE�����÷�--
�﷨��
--1.Case...end������һ�����У��������ж���ָ���ֶε�ֵ���߷�Χ��Ȼ��õ�һ���û��Զ���Ķ�Ӧ��ֵ
--2.���������޸�ԭʼ�ı����ݣ���ֻ���޸Ľ��������ʾ
--3.case��������ֵ�жϣ�Ҳ��������Χ�жϡ�
--4.����ֵ�жϵ��﷨��
--case �ֶλ��߱��ʽ
--  when �����ֵ then '�û��Զ���ֵ'
--  else �����when�������������else
--end
--5.����ֵ�жϵ�ʱ�����ж�nullֵ
select StudentNo,StudentName,
case ClassId+1 --��case��������ֶλ��߱��ʽ˵���caseֻ�����е�ֵ�ж�
 when 1 then 'һ�ڰ�'
 when 2 then '���ڰ�' 
  else '�Ҳ�֪��'
end,--case������һ�����У��������Case..end���滹�������У��ͱ�����ʹ�ã����зָ�
case email
 when  NULL  then 'û����д'
 else email 
end as ��Ҫ������
 from Student
--case ..end����Χ�ж�
�﷨��
--case --û�н��κε��������߱��ʽ
-- when ���ʽ then ֵ
-- ��������
-- else  ֵ  
--end 
--then�����ֵ��������Ҫ���Ի���
--when����ı��ʽʹ�õ��ֶο���������ģ�����Ҫ����ͬһ��
select StudentName,
case 
  when BornDate>'2000-1-1' then 'Сƨ��' --������������when�൱������һ������ת����һ��when
  when BornDate>'1990-1-1' then 'С����'
  when BornDate>'1980-1-1' then 'С����'
  when sex='��' then '�����е�'
end,
case
 when Email is null then 'û����д'
 else Email  
end
 from Student

--�ٷ���ת��Ϊ���ʽ���
select StudentNo,
case 
 when StudentResult>=90 then 'A'
 when StudentResult>=80 then 'B'
 when StudentResult>=70 then 'C'
 when StudentResult>=60 then 'D' 
 when StudentResult is  null then 'û�п���'
 else  'E'
end AS �ɼ�
 from Result
 
