select * from ibmuser.emp;
select * from ibmuser.dept;
select count(empno) as total_emp from ibmuser.emp;
select job,sum(salary) from ibmuser.emp group by job;
--Joins using 2 Tables(simple join)
select deptname, count(empno) 
        from ibmuser.dept d, ibmuser.emp e 
        where d.deptno=e.workdept 
        group by deptname 
        order by deptname;
-- Joins using 3 Tables= Customer, Orders, Items (simple join)
select company, stock_num, menu_code 
        from customer c, orders o, items I
        WHERE c.customer_num = o.customer_num
        AND o.order_num = i.order_num;
select max(salary) sal from ibmuser.emp;

--select the maximum conpensiation each department is giving to their employee
select deptname ,sum(salary)+ sum(bonus) + sum(comm) MAX_COMPENSATION

        from ibmuser.emp e, ibmuser.dept D
        where e.workdept = d.deptno group by deptname order by deptname;



---------------------------------------------------------------------------
--                Nth HIEGHEST SALARY
---------------------------------------------------------------------------
-- Using Sub quires
select * from ibmuser.emp where salary=(
        select max(salary) from ibmuser.emp where salary<(select MAX(salary) from ibmuser.emp));

-- Using LIMIT operator
select distinct(salary) from ibmuser.emp order by salary desc limit 3,1;

-- Using N - 1 formula
select * from ibmuser.emp e1 where 3-1=(
        select distinct(count(*)) from ibmuser.emp e2 where e1.salary>e2.salary);

-- Using DENSE_RANK() OVER 
SELECT * FROM (
  SELECT firstnme, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS r
  FROM ibmuser.emp) AS subquery WHERE r = 1;


--------------------------------------------------------------------------
--              ARTHEMATIC OPERATIONS OF DATETIME(yy-mm-dd)
--------------------------------------------------------------------------
-- current date + 2 years
-- current date + 1 year + 5 months + 10 days
-- current time + 5 hours - 6 minutes + 10 seconds
---------------------------------------------------------------------------
-- year(current timestamp)           month(current timestamp)
-- day ()               hour()          minute()
-- second()             time()          microsecond()
---------------------------------------------------------------------------

select current date + 2 years from sysibm.sysdummy1;

-- Getting date or time from a timestamp column
select col1, col2, date(timestamp-col), time(timestamp-col) from table;

-- No.of Days difference between two dates
select days(current date + 1 year) - days(current date) from sysibm.sysdummy1;

--Create Table ibmuser.employees (iDs int primary key, Name varchar(50), birthdate Date);

select * from ibmuser.emp where birthdate ='1948-03-19';

------------------------BETWEEN----------------------------------------------

-- fetch who born between the giving dates using between
select * from ibmuser.emp where birthdate between '1990-01-01' and '2000-01-01';


----------------------IN-----------------------------------------------------

-- fetch the people who born in given dates only
select * from ibmuser.emp where birthdate in ('1990-01-01', '2000-01-01');

-----------------------------------------------------------------------------
--                      LIKE
-----------------------------------------------------------------------------
select * from ibmuser.emp where firstnme like('%HN');
select empno, firstnme, hiredate - birthdate as difference from ibmuser.emp;
select * from ibmuser.emp;


--FETCH & OFFSET
select * from ibmuser.emp order by salary desc fetch first 5 rows only;
