--- ������ϵʱ�ļ�������
alter table student
with nocheck --�������������
add constraint FK_Grade_Student_GradeId foreign key(gradeid) references grade(gradeid)
on delete set null
--[ ON DELETE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]
--on--�������ֲ�����ʱ������Ӧ�Ĵ���
--NO ACTION--�����κβ������ñ���ͱ�������ɾ����ɾ��
--CASCADE��������ɾ��������Ӧ�Ĵӱ�����Ҳ��ɾ��������Ҳһ��
--SET NULL�����ɾ������ļ�¼����ô��Ӧ�Ĵӱ��¼���ֶ�ֵ�ᱻ����Ϊnull,ǰ���Ǵӱ������ֶε�ֵ������null
--SET DEFAULT :ɾ�������¼���ӱ�ļ�¼�Ķ�Ӧ�ֶ�ֵ����ΪĬ��ֵ��ǰ������֮ǰΪ����ֶ�������Ĭ��ֵ
