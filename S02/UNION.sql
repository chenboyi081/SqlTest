--���Ͻ����union(���������--
select StudentNo as nonono,SUM(StudentResult) from Result where StudentNo=1 group by StudentNo
union
select StudentNo as no,aa='22' from Result where StudentNo=2 

---union���Ժϲ���������
--��������ǰ���һ��ע��:
--1.�ϲ��Ľ����������������ȫһ��
--2.�ϲ��Ķ��������Ķ�Ӧ�е�������Ҫһ��(�����໥ת��)
--3.�����������ֻ���һ��������й�

--
select top 3 * from Student
union --����distinct����
select top 3 * from Student

select top 3 * from Student
union all --����distinct���������ĺϲ�Ч�ʸ��ߣ���Ϊû�б���ȥ�жϽ����¼�Ƿ��ظ�
select top 3 * from Student

--Ҫ����һ������в�ѯ��ѧ����Ӣ����߳ɼ�����ͳɼ���ƽ���ɼ�
select MAX(StudentResult) from Result
select MIN(StudentResult) from Result
select AVG(StudentResult) from Result

--
select MAX(StudentResult), MIN(StudentResult), AVG(StudentResult) from Result

--
select (select MAX(StudentResult) from Result),(select MIN(StudentResult) from Result),(select AVG(StudentResult) from Result)

select MAX(StudentResult) from Result
union
select MIN(StudentResult) from Result
union
select AVG(StudentResult) from Result

--��ѯÿһ��ѧԱ�ĳɼ���ͬʱ����������ʾƽ����
union����в������order by���������ֻ�ܼ���������һ���order byֻ��ȥѡ���һ��������е���
select cast(StudentNo as CHAR(2)) as id,StudentResult from Result
union
select 'ƽ����',AVG(StudentResult) from Result  order by id Desc

select ' '+cast(StudentNo as CHAR(2)) as id,StudentResult from Result
union
select '  ƽ����',AVG(StudentResult) from Result 
