use MySchool
--һ���Բ��������¼--
insert into grade values(4,'����')

insert into Grade (GradeId,GradeName)
select 5,'aaa' union all --ֻ��ȫ��д��union all�Ų���ȥ���ظ���¼
select 5,'aaa' union all
select 5,'aaa' union all
select 5,'aaa' union all
select 6,'bb' union --union ���һ�䲻��Ҫ��union,��union���治��дDefault
select 6,'bb'

delete from Grade

---һ���Բ��������¼
--1��select �ֶ��б�/*  into Ŀ�ı�  from  Դ�� ������һ�����ѯ�ֶ���ͬ�ṹ���±�Ҳ����ζ���±����ȴ��ڣ�����ϵͳ���ɵ�
select classname into newGrade from Grade
truncate table grade
--2. insert into Ŀ�ı��� select * from Դ��Ŀ�ı�����ȴ���,���û�д��� ,�ͱ�����
--select classname  into Grade from newGrade
insert into Grade select * from newgrade


select * into newGrade from Grade
--ʹ��select into from ���ɵ��±��ֶε����Զ�����ʧ�����˱�ʶ������֮��
select * from newGrade
