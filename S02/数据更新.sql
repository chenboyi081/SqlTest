--���ݸ���-- ���޸ĺ�ɾ�����ڳ���Ա����һ����Ҫ����û������
�﷨��
update ���� set �ֶ�=��ֵ,�ֶ�=��ֵ where ����(����һ��Ϳ�����Ϊ����)

update Student set GradeId=1
--�޸�ѧ��Ϊ9��ѧԱ�༶��3��
update Student set GradeId=3 where StudentNo=9
update Student set Gender=0,GradeId=3 where StudentNo=4
--�������޸�
update Student set Address='���ݴ���' where GradeId=1 and Gender=0