--��ԭ���Ƶ���ʱ����
select * into newGrade from grade
--ɾ��Դ�����ݣ����ñ�ʶ��
truncate table grade
--���±�����ݲ��뵽ԭ����
insert into grade select classname from newGrade 