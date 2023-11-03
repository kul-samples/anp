create table dept(   
  deptno     number(2,0),   
  dname      varchar2(14),   
  loc        varchar2(13),   
  constraint pk_dept primary key (deptno)   
);

create table emp(   
  empno    number(4,0),   
  ename    varchar2(10),   
  job      varchar2(9),   
  mgr      number(4,0),   
  hiredate date,   
  sal      number(7,2),   
  comm     number(7,2),   
  deptno   number(2,0),   
  constraint pk_emp primary key (empno),   
  constraint fk_deptno foreign key (deptno) references dept (deptno)   
);

create table emp(   
  empno    number(4,0),   
  ename    varchar2(10),   
  job      varchar2(9),   
  mgr      number(4,0),   
  hiredate date,   
  sal      number(7,2),   
  comm     number(7,2),   
  deptno   number(2,0),   
  constraint pk_emp primary key (empno),   
  constraint fk_deptno foreign key (deptno) references dept (deptno)   
);





insert into DEPT (DEPTNO, DNAME, LOC) 
values(10, 'ACCOUNTING', 'NEW YORK');

insert into dept   
values(20, 'RESEARCH', 'DALLAS');

insert into dept   
values(30, 'SALES', 'CHICAGO');

insert into dept  
values(40, 'OPERATIONS', 'BOSTON');

insert into emp   
values(   
 7839, 'KING', 'PRESIDENT', null,   
 to_date('17-11-1981','dd-mm-yyyy'),   
 5000, null, 10   
);

insert into emp  
values(  
 7698, 'BLAKE', 'MANAGER', 7839,  
 to_date('1-5-1981','dd-mm-yyyy'),  
 2850, null, 30  
);

insert into emp  
values(  
 7782, 'CLARK', 'MANAGER', 7839,  
 to_date('9-6-1981','dd-mm-yyyy'),  
 2450, null, 10  
);

insert into emp  
values(  
 7566, 'JONES', 'MANAGER', 7839,  
 to_date('2-4-1981','dd-mm-yyyy'),  
 2975, null, 20  
);

insert into emp  
values(  
 7788, 'SCOTT', 'ANALYST', 7566,  
 to_date('13-JUL-87','dd-mm-rr') - 85,  
 3000, null, 20  
);

insert into emp  
values(  
 7902, 'FORD', 'ANALYST', 7566,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 3000, null, 20  
);

insert into emp  
values(  
 7369, 'SMITH', 'CLERK', 7902,  
 to_date('17-12-1980','dd-mm-yyyy'),  
 800, null, 20  
);

insert into emp  
values(  
 7499, 'ALLEN', 'SALESMAN', 7698,  
 to_date('20-2-1981','dd-mm-yyyy'),  
 1600, 300, 30  
);

insert into emp  
values(  
 7521, 'WARD', 'SALESMAN', 7698,  
 to_date('22-2-1981','dd-mm-yyyy'),  
 1250, 500, 30  
);

insert into emp  
values(  
 7654, 'MARTIN', 'SALESMAN', 7698,  
 to_date('28-9-1981','dd-mm-yyyy'),  
 1250, 1400, 30  
);

insert into emp  
values(  
 7844, 'TURNER', 'SALESMAN', 7698,  
 to_date('8-9-1981','dd-mm-yyyy'),  
 1500, 0, 30  
);

insert into emp  
values(  
 7876, 'ADAMS', 'CLERK', 7788,  
 to_date('13-JUL-87', 'dd-mm-rr') - 51,  
 1100, null, 20  
);

insert into emp  
values(  
 7900, 'JAMES', 'CLERK', 7698,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 950, null, 30  
);

insert into emp  
values(  
 7934, 'MILLER', 'CLERK', 7782,  
 to_date('23-1-1982','dd-mm-yyyy'),  
 1300, null, 10  
);
SELECT * FROM EMP;
SELECT * FROM DEPT;


select * from emp;

select EMP.*,TO_CHAR(SYSDATE,'YYYY')- TO_CHAR(HIREDATE,'YYYY'), TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)),TRUNC(SYSDATE-HIREDATE) MB from emp
where Hiredate in ('1-MAY-81','3-DEC-81','17-DEC-81','19-JAN-80')ORDER BY (SYSDATE-HIREDATE) DESC ;


SELECT ENAME,TRUNC(SYSDATE-HIREDATE) FROM EMP ORDER BY TRUNC(SYSDATE-HIREDATE)DESC;
SELECT TO_CHAR(SYSDATE,'YYYY')- TO_CHAR(HIREDATE,'YYYY') FROM EMP;
SELECT*FROM EMP;
SELECT EMP.*, DEPTNO FROM EMP WHERE DEPTNO IN(10,20);
SELECT EMP.*, TO_CHAR(SYSDATE,'YYYY')- TO_CHAR(HIREDATE,'YYYY'),SAL/30 FROM  EMP WHERE SAL/30>100;
select ENAME,HIREDATE,To_char (hiredate,'yyyy') from emp where To_char (hiredate,'yyyy')='1981';

SELECT * FROM EMP WHERE DEPTNO IN (10,20);
SELECT * FROM EMP WHERE DEPTNO =10 OR DEPTNO=20;
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'MON-YYYY') ='AUG-1980';

SELECT * FROM EMP;
select * from emp where hiredate <('1-jan-1981');
SELECT * FROM EMP ORDER BY SAL ASC,SAL;
SELECT * FROM EMP ORDER BY SAL DESC,SAL;
SELECT * FROM EMP ORDER BY DEPTNO ASC,JOB DESC;
SELECT DISTINCT JOB FROM EMP ORDER BY JOB DESC;
SELECT * FROM EMP;
SELECT * FROM EMP WHERE JOB = 'MANAGER';
SELECT * FROM EMP WHERE HIREDATE <('01-JAN-1981');
SELECT EMPNO,ENAME,SAL,SAL/30 DAILYSAL FROM EMP ORDER BY SAL/30 DESC ;
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY')='1981';
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'MM-YYYY')='12-1980';
SELECT EMP.* FROM EMP WHERE SAL*12 BETWEEN 22000 AND 45000;
SELECT SAL*12 FROM EMP;
SELECT * FROM EMP WHERE LENGTH(ENAME)=5; 











create table coach(coach_id number(20),
c_name varchar2(30),constraint pk_coach_id primary key (coach_id));
create table users(user_id number(20),coach_id number(20),name varchar2(30),habitname varchar2(30),constraint pk_user_id primary key(user_id),
                        constraint fk_coach_id foreign key (coach_id)references coach(coach_id));
                        
create table habits(habit_id number(20),habitname varchar2(30),constraint pk_habit_id primary key (habit_id));
create table user_habits (user_habit_id number(20),user_id number(20),habit_id number(20),constraint pk_user_habit_id primary key (user_habit_id),
                            constraint fk_user_id foreign key (user_id) references users(user_id),
                            constraint fk_habit_id foreign key (habit_id) references habits(habit_id));
    
    create table checkins(habitcheckin_id number(20),
    habit_id number(20),
    user_id number(20),checkin_date date,constraint pk_habitcheckin_id primary key (habitcheckin_id),
                            constraint fk_habitt_id foreign key(habit_id) references habits(habit_id),
                            constraint fk_userr_id foreign key (user_id) references users(user_id));
                            
        create table comments(comment_id number(20),habitcheckin_id number(20),user_id number(20),coach_id number(20),commentdate date,commenttext varchar2(30),
           constraint pk_comment_id primary key (comment_id),
           constraint fk_habitcheckin_id1 foreign key (habitcheckin_id) references checkins(habitcheckin_id),
           constraint fk_user_id1 foreign key (user_id) references users(user_id),
           constraint fk_coach_id1 foreign key (coach_id) references coach(coach_id));


SELECT * FROM TAB;




CREATE  TABLE KUSHAL(ID NUMBER(20),NAME VARCHAR(20),CONSTRAINT PK_ID_KUSHAL PRIMARY KEY (ID));
CREATE TABLE PURANDHAR(ID_P NUMBER(10),NAME VARCHAR(20),KUSHAL_ID NUMBER(30), CONSTRAINT FK_IDP_PURANDHAR FOREIGN KEY (KUSHAL_ID) REFERENCES KUSHAL(ID));
CREATE TABLE SUDHEER (ID_S NUMBER(10),NAME VARCHAR(20),KUSHAL_ID NUMBER(15),CONSTRAINT FK_IDS_SUDHEER FOREIGN KEY (KUSHAL_ID) REFERENCES KUSHAL(ID));
SELECT * FROM SUDHEER;
SELECT * FROM PURANDHAR;
SELECT * FROM KUSHAL;
INSERT INTO KUSHAL VALUES('121','RAMU');
INSERT INTO KUSHAL VALUES('122','RAJU');
INSERT INTO KUSHAL VALUES('123','RAMARAJU');

ALTER TABLE KUSHAL ADD  SL_NO NUMBER(15);
SELECT * FROM KUSHAL;
UPDATE KUSHAL SET SL_NO = 100
WHERE ID=121;
SELECT * FROM KUSHAL;
UPDATE KUSHAL SET SL_NO = 200
WHERE ID=122
SELECT * FROM KUSHAL;
UPDATE KUSHAL SET SL_NO = 300
WHERE ID=123;
select * from kushal;
select * from purandhar;
alter table purandhar rename column name to location;
rename kushal to kushil;
select * from kushil;
insert into purandhar values ('221','tirupati','121');
insert into purandhar values ('221','tirupati','121');
insert into purandhar values ('221','tirupati','121');
select * from tab;

select ename from emp where length(ename)=5 AND ENAME LIKE 'S%';
select * from emp where ENAME like 'S%' and length(ename)=5;

select * from emp where job = 'MANAGER' AND DEPTNO=10;

SELECT * FROM EMP
INTERSECT
SELECT * FROM EMP WHERE DEPTNO=20;

select * from emp where job='CLERK' or job='ANALYST' order by job desc;

create table rrrr ( place varchar(20) check (place ='tirupati','renigunta'),id number(10));
insert into rrrr values ('tirupati',10);

select * from rrrr;


select ename from emp  where ename like 'S%' and length(ename)=5;
select ename from emp  where ename like '__R_' and length(ename)=4;
select ename from emp where ename like 'S%H';
SELECT * FROM EMP WHERE  TO_CHAR (HIREDATE,'MM')=1;

select * from emp;
truncate table emp;


create table student(
rollno number(10),
ename varchar2(20),
location varchar(20),
marks number(10),
grade varchar(10));

select * from student;
 
 
 
 select * from student  order by MARKS desc;
 
 alter table student add SALARY number(10);
 
 select * from student;
 
 update student set JOB='software' 
 where rollno=5;
 
 
 select * from student;
 truncate table student;
 select * from student;
 
 SELECT * FROM EMP;
  insert into student values('01','srikar','tiruati','95','A+');
 insert into student values('02','sudheer','kadapa','98','A+');
 insert into student values('04','purandhar','chandragiri','80','A');
 insert into student values('05','mouli','renigunta','50','C');
 insert into student values('6','kushal','srikalahasti','25','null');
 
 
 
 CREATE TABLE COP(ID NUMBER (10),NAME VARCHAR(10));
 
 
 SELECT * FROM COP;
 
 
TRUNCATE TABLE EMP;
SELECT * FROM EMP;

ALTER TABLE EMP DROP COLUMN HIREDATE;
SELECT * FROM EMP;

 ALTER TABLE EMP ADD HIREDATE DATE;
 
 
 
 create table EMPLOYPEE (DEPTNO NUMBER (10)PRIMARY KEY, NAME VARCHAR2(15),LOC VARCHAR2(15));

INSERT INTO EMPLOYPEE VALUES (10,'VIRAT','BANGALORE');
INSERT INTO EMPLOYPEE VALUES (20,'ROHIT','MUMBAI');
INSERT INTO EMPLOYPEE VALUES (30,'DHONI','CHENNAI');
INSERT INTO EMPLOYPEE VALUES (40,'SAMSON','TIRUPATI');
 
 CREATE TABLE DEPARTMENT(ROLE VARCHAR2(10),SALARY NUMBER(10),DEPTNO NUMBER(15),FOREIGN KEY(DEPTNO) REFERENCES EMPLOYPEE(DEPTNO)); 
 SELECT * FROM DEPARTMENT;
 
 INSERT INTO DEPARTMENT VALUES ('BATSMAN','80000','10');
  INSERT INTO DEPARTMENT VALUES ('BOWLER','60000','40');
   INSERT INTO DEPARTMENT VALUES ('CAPTAIN','95000','30');
    INSERT INTO DEPARTMENT VALUES ('BATSMAN','75000','20');
    
    SELECT * FROM DEPARTMENT;
    ALTER TABLE DEPARTMENT ADD COLUMN DNAME;

 SELECT * FROM EMPLOYPEE;
 
 SELECT * FROM EMPLOYPEE,DEPARTMENT WHERE EMPLOYPEE.DEPTNO=DEPARTMENT.DEPTNO;
 
 SELECT * FROM EMPLOYPEE WHERE LOC='CHENNAI';
 SELECT * FROM EMPLOYPEE WHERE DEPTNO=10;
 SELECT * FROM DEPARTMENT  ORDER BY SALARY DESC;
 SELECT NAME,SALARY ,(SALARY+500)FROM DEPARTMENT; 
 
 
 
 
 SELECT * FROM DEPARTMENT;
 
 
 TRUNCATE TABLE DEPARTMENT;
 
 DESC DEPARTMENT;
 
 
 
 
 SELECT * FROM EMP;
 TRUNCATE TABLE EMP;
 
 
 
 
 
 Create table emp(   
  empno    number(4,0),   
  ename    varchar2(10),   
  job      varchar2(9),   
  mgr      number(4,0),   
  hiredate date,   
  sal      number(7,2),   
  comm     number(7,2),   
  deptno   number(2,0),   
  constraint pk_emp primary key (empno),   
  constraint fk_deptno foreign key (deptno) references dept (deptno)   
);
select * from emp;


Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7839,'KING','PRESIDENT',null,to_date('17-11-81','DD-MM-RR'),5000,null,10);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7698,'BLAKE','MANAGER',7839,to_date('01-05-81','DD-MM-RR'),2850,null,30);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7782,'CLARK','MANAGER',7839,to_date('09-06-81','DD-MM-RR'),2450,null,10);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7566,'JONES','MANAGER',7839,to_date('02-04-81','DD-MM-RR'),2975,null,20);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7788,'SCOTT','ANALYST',7566,to_date('19-04-87','DD-MM-RR'),3000,null,20);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7902,'FORD','ANALYST',7566,to_date('03-12-81','DD-MM-RR'),3000,null,20);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7369,'SMITH','CLERK',7902,to_date('17-12-80','DD-MM-RR'),800,null,20);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7499,'ALLEN','SALESMAN',7698,to_date('20-02-81','DD-MM-RR'),1600,300,30);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7521,'WARD','SALESMAN',7698,to_date('22-02-81','DD-MM-RR'),1250,500,30);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7654,'MARTIN','SALESMAN',7698,to_date('28-09-81','DD-MM-RR'),1250,1400,30);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7844,'TURNER','SALESMAN',7698,to_date('08-09-81','DD-MM-RR'),1500,0,30);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7876,'ADAMS','CLERK',7788,to_date('23-05-87','DD-MM-RR'),1100,null,20);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7900,'JAMES','CLERK',7698,to_date('03-12-81','DD-MM-RR'),950,null,30);
Insert into emp (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7934,'MILLER','CLERK',7782,to_date('23-01-82','DD-MM-RR'),1300,null,10);

select DISTINCT JOB from emp;

SELECT * FROM EMP;


select * from emp where job='MANAGER'; 
select * FROM EMP WHERE TO_CHAR (HIREDATE ,'YYYY') <1981;  
SELECT  EMPNO,ENAME,SAL,SAL/30 DSAL FROM  EMP ORDER BY SAL*12 ASC ;
SELECT EMPNO,ENAME,JOB,HIREDATE,SAL/30 DSAL , TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(HIREDATE,'YYYY')  FROM EMP WHERE SAL/30>100 ;
SELECT E.*, SAL/30 DSAL ,TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(HIREDATE,'YYYY') FROM EMP E WHERE SAL/30 >100 ;

SELECT * FROM EMP WHERE JOB = 'CLERK' OR JOB='ANALYST' ORDER BY JOB DESC;
SELECT * FROM EMP  WHERE HIREDATE =('1-MAY-1981') OR HIREDATE=('3-DEC-1981') OR HIREDATE=('19-JAN-1980')ORDER BY HIREDATE ASC;
SELECT * FROM EMP WHERE HIREDATE =('19-JAN-1980');
SELECT * FROM EMP WHERE HIREDATE IN ('1-MAY-1981','3-DEC-1981','19-JAN-1980') ORDER BY HIREDATE ASC;
SELECT * FROM EMP WHERE DEPTNO IN('10','20');
SELECT  * FROM EMP WHERE  TO_CHAR(HIREDATE,'MON-YYYY')= 'AUG-1980';
SELECT * FROM EMP WHERE (LENGTH(ENAME))=5 AND ENAME LIKE ('S___%');
SELECT * FROM EMP WHERE (LENGTH(ENAME))=4 AND ENAME LIKE ('__R%');
SELECT  * FROM EMP WHERE  TO_CHAR(HIREDATE,'MON')= 'JAN';
SELECT  * FROM EMP WHERE  TO_CHAR (HIREDATE,'MON')  LIKE ('_A%');
SELECT * FROM EMP WHERE LENGTH(SAL)=4 AND SAL LIKE ('___0') ORDER BY SAL ASC;
SELECT * FROM EMP WHERE ENAME LIKE ('%LL%');
SELECT * FROM EMP WHERE DEPTNO<>20;

SELECT * FROM EMP WHERE JOB NOT IN ('PRESIDENT','MANAGER') ORDER BY SAL ASC;
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'MON')<>'MARCH';
SELECT * FROM EMP WHERE DEPTNO IN('30','10') AND TO_CHAR(HIREDATE,'YYYY')='1981';
SELECT * FROM EMP WHERE ENAME ='SMITH';
SELECT * FROM EMP WHERE JOB='CLERK' AND DEPTNO=20;
SELECT * FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO AND DNAME IN('ACCOUNTING','RESEARCH') ORDER BY D.DEPTNO;


SELECT * FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO AND JOB IN ('MANAGER','ANALYST') AND LOC IN ('NEW YORK','DALLAS')
AND  TO_CHAR(SYSDATE,'YYYY') - TO_CHAR(HIREDATE,'YYYY')>7 AND COMM IS NULL ORDER BY D.LOC ;
 
SELECT * FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO AND (D.LOC IN ('CHICAGO') OR D.DNAME = ('ACCOUNTING')) AND E.SAL*12>28000 AND E.SAL NOT IN (3000,2800) 
 AND E.JOB<>'MANAGER' AND( E.EMPNO NOT LIKE ('__7') OR E.EMPNO NOT LIKE ('__8'))S ORDER BY E.DEPTNO,E.JOB DESC;


SELECT ROWNUM ,E.* FROM EMP E;
CREATE TABLE DEPT AS SELECT * FROM;
select * from emp;
select * from dept;


select * from emp where sal >( select sal from emp where ename='BLAKE') ;

SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME='ALLEN');

SELECT * FROM EMP WHERE HIREDATE ;





select * from emp e1, emp e2 where e1.deptno=e2.deptno intersect

select * from emp e1,emp e2 where e1.deptno=e2.deptno;

create table task (slno number (8),name  varchar2(16),phno number (16));

select * from dept intersect 
select deptno,ename,job from emp ;









select * from task;




create table student_1 (idno number (5),name varchar2(10),marks number(5));
select * from student_1;

create table student_2 as select * from student_1;

select * from student_2;

insert into student_1 values ('111','kushal','65');
insert into student_1 values ('112','rakesh','75');
insert into student_1 values ('113','ramesh','95');




insert into student_2 (idno,name,marks)
select idno,name,marks
from student_1;
select * from student_2;
delete from student_2 where idno='111';

select ltrim ('dml','d')from dual;
select * from emp;

select rpad ('kusha',6,'l')from dual;
select job, decode (JOB,'PRESIDENT', 'PRE','MANAGER', 'MGR','ANALYST', 'ANA','CLERK', 'CLE',JOB) FROM EMP;


CREATE VIEW V1 AS SELECT * FROM EMP;
SELECT * FROM V1;

CREATE VIEW V3 AS SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;

        
select *  from emp where mgr = '7566';

select * from dept;
select  ename,sal,sal * 20/100 dasl,sal+sal * 20/100 dasl from emp  where sal > 3000 ; 
select  max (sal) from emp;
select min (sal) from emp;
select * from emp where sal > (SELECT MAX( SAL) FROM EMP WHERE JOB='MANAGER');

select * from emp,dept where emp.deptno=dept.deptno;
select * from emp,dept where emp.deptno<>dept.deptno;  

select * from emp e1,emp e2 where e1.deptno=e2.deptno;
select * from emp e ,dept d where emp.deptno =dept.deptno(+);


select deptno from dept
union
select deptno from emp;


create table b (no number (7));

insert into b  values (1); 

select * from a
intersect

select * from b;







create view V_1 as select * from emp;

select * from v_1;


select * from emp where sal in

(select  max (sal) from emp);

select * from 
(select emp.*,rownum rn from emp)
where rn=(select count(empno)from emp);

  Select * from 
(Select emp.*, rownum rn from EMP)
Where rn= (select count (empno) from EMP);

select * from (select emp.*,rownum rn from emp)
where rn in (1,4,5,7);
 
  select * from emp order by sal asc;
  
select * from emp  order by deptno asc, job desc;

 Select distinct job from emp order by job desc;
 
 Select  * from emp where job = 'MANAGER';

select * from emp where hiredate <('1-jan-1981');


select Empno, Ename, Sal,trunc(sal/30) dsal,sal*12 asal   from emp  order by asal asc;

select Emp.*,to_char (sysdate,'yyyy')-to_char(hiredate,'yyyy') from emp where job = 'MANAGER';


select Emp.*,to_char (sysdate,'yyyy')-to_char(hiredate,'yyyy') EXP ,TRUNC(SAL/30) DSAL from emp WHERE (SAL/30) >100;

select * from emp where job = 'CLERK' or job = 'ANALYST' order by job desc;

select * from emp where hiredate in ('01-may-81','31-dec-81','17-dec-81','19-jan-80')order by hiredate asc;





select * from emp where deptno in ('10','20');

select * from emp  WHERE to_CHAR(hiredate, 'MON-YYYY') ='AUG-1980';





SELECT * FROM EMP WHERE ENAME LIKE 'S%' AND LENGTH(ENAME)=5 ;

SELECT * FROM EMP WHERE ENAME LIKE '__R%' AND LENGTH (ENAME)=4;

SELECT * FROM EMP WHERE TO_CHAR (HIREDATE ,'MON') = 'JAN';

SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'MONTH') LIKE '_A%';

SELECT * FROM EMP WHERE SAL LIKE '%0' AND LENGTH (SAL)=4;

SELECT * FROM EMP  WHERE ENAME LIKE '%LL%';

SELECT * FROM EMP WHERE DEPTNO<>20;


SELECT * FROM EMP WHERE JOB NOT IN ('PRESIDENT','MANAGER') ORDER BY SAL ASC;

SELECT * FROM EMP WHERE TO_CHAR  (HIREDATE,'MONTH')<>'MARCH';

SELECT * FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY') = 1981 AND DEPTNO IN (30,10);

SELECT * FROM EMP WHERE JOB = 'CLERK' AND DEPTNO=20;

SELECT * FROM EMP WHERE ENAME = 'SMITH';

SELECT E.*,D.* FROM EMP E,DEPT D WHERE D.DNAME IN ('ACCOUNTING','RESEARCH') ORDER BY E.DEPTNO ASC;


SELECT * FROM EMP E,DEPT D WHERE  E.DEPTNO=D.DEPTNO AND E.JOB IN('MANAGER','ANALYST') AND D.LOC IN ('NEW YORK','DALLAS')
AND TO_CHAR(SYSDATE,'YYYY')-TO_CHAR (HIREDATE,'YYYY')>7 ;


