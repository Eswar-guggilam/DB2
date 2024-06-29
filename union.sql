select * from ibmuser.emp;
select * from ibmuser.dept;
select deptno,deptname from ibmuser.dept union select empno,phoneno from ibmuser.emp;
select * from ibmuser.emp where hiredate >= '2000-01-01';
select current TIMESTAMP from sysibm.sysdummy1;
