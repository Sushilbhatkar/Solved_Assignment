--Assignment 1

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from emp table using the alias name as <Empolyee_Name>.

select ename as Employee_Name from emp;

+---------------+
| Employee_Name |
+---------------+
| SMITH         |
| ALLEN         |
| WARD          |
| JONES         |
| MARTIN        |
| BLAKE         |
| CLARK         |
| SCOTT         |
| KING          |
| TURNER        |
| ADAMS         |
| JAMES         |
| FORD          |
| MILLER        |
+---------------+
14 rows in set (0.00 sec)

-- Q-2. Write an SQL query to fetch unique values of DEPARTMENT  from emp table.

select distinct dname as Department from dept;

+------------+
| Department |
+------------+
| ACCOUNTING |
| RESEARCH   |
| SALES      |
| OPERATIONS |
+------------+
4 rows in set (0.00 sec)

-- Q-3. Write an SQL query to show the last 5 record from a table

select * from emp order by empno desc limit 5;

+-------+--------+----------+------+------------+------+------+--------+
| empno | ename  | job      | mgr  | hiredate   | sal  | comm | deptno |
+-------+--------+----------+------+------------+------+------+--------+
|  7934 | MILLER | CLERK    | 7782 | 1982-01-23 | 1300 | NULL |     10 |
|  7902 | FORD   | ANALYST  | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7900 | JAMES  | CLERK    | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7876 | ADAMS  | CLERK    | 7788 | 1987-08-24 | 1100 | NULL |     20 |
|  7844 | TURNER | SALESMAN | 7698 | 1981-09-08 | 1500 |    0 |     30 |
+-------+--------+----------+------+------------+------+------+--------+
5 rows in set (0.00 sec)

-- Assignment 2

-- Q-1. Write an SQL query to print the first three characters of  FIRST_NAME from emp table.

select substr(ename,1,3) as first_three_characters  from emp;

+------------------------+
| first_three_characters |
+------------------------+
| SMI                    |
| ALL                    |
| WAR                    |
| JON                    |
| MAR                    |
| BLA                    |
| CLA                    |
| SCO                    |
| KIN                    |
| TUR                    |
| ADA                    |
| JAM                    |
| FOR                    |
| MIL                    |
+------------------------+
14 rows in set (0.00 sec)


--  Q-2. Write an SQL query to find the position of the alphabet (‘a’) in the ename column ‘CLARK ’ from Worker table.

select ename ,locate('a',ename) from emp where ename = "CLARK";

+-------+-------------------+
| ename | locate('a',ename) |
+-------+-------------------+
| CLARK |                 3 |
+-------+-------------------+
1 row in set (0.00 sec)

-- Q-3.Write an SQL query to print the name of employees having the highest salary in each department

select deptno,max(sal) as max_sal from emp group by deptno;

+--------+---------+
| deptno | max_sal |
+--------+---------+
|     10 |    5000 |
|     20 |    3000 |
|     30 |    2850 |
+--------+---------+
3 rows in set (0.00 sec)

-- Assignment 3

-- Q-1. Write an SQL query to print the FIRST_NAME from emp table after removing white spaces from the right side.

select ltrim(ename) from emp;

+--------------+
| ltrim(ename) |
+--------------+
| SMITH        |
| ALLEN        |
| WARD         |
| JONES        |
| MARTIN       |
| BLAKE        |
| CLARK        |
| SCOTT        |
| KING         |
| TURNER       |
| ADAMS        |
| JAMES        |
| FORD         |
| MILLER       |
+--------------+

-- Q-2. Write an SQL query that fetches the unique values of DEPARTMENT from dept table and prints its length.

select distinct dname,length(dname) as len_dep from dept;

+------------+---------+
| dname      | len_dep |
+------------+---------+
| ACCOUNTING |      10 |
| RESEARCH   |       8 |
| SALES      |       5 |
| OPERATIONS |      10 |
+------------+---------+

-- Q-3. Write an SQL query to fetch nth max salaries from a table.

select distinct sal from emp order by sal desc limit 3,1;

+------+
| sal  |
+------+
| 2850 |
+------+

-- Assignment 4

-- Q-1. Write an SQL query to print the FIRST_NAME from emp table after replacing ‘A’ with ‘a’. 

select replace(ename,'A','a') from emp ;

+------------------------+
| replace(ename,'A','a') |
+------------------------+
| SMITH                  |
| aLLEN                  |
| WaRD                   |
| JONES                  |
| MaRTIN                 |
| BLaKE                  |
| CLaRK                  |
| SCOTT                  |
| KING                   |
| TURNER                 |
| aDaMS                  |
| JaMES                  |
| FORD                   |
| MILLER                 |
+------------------------+

-- Q-2. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select emp.empno,emp.ename,dept.deptno,dept.dname from emp join dept on emp.deptno = dept.deptno order by emp.ename asc,dept.dname desc ;

+-------+--------+--------+------------+
| empno | ename  | deptno | dname      |
+-------+--------+--------+------------+
|  7876 | ADAMS  |     20 | RESEARCH   |
|  7499 | ALLEN  |     30 | SALES      |
|  7698 | BLAKE  |     30 | SALES      |
|  7782 | CLARK  |     10 | ACCOUNTING |
|  7902 | FORD   |     20 | RESEARCH   |
|  7900 | JAMES  |     30 | SALES      |
|  7566 | JONES  |     20 | RESEARCH   |
|  7839 | KING   |     10 | ACCOUNTING |
|  7654 | MARTIN |     30 | SALES      |
|  7934 | MILLER |     10 | ACCOUNTING |
|  7788 | SCOTT  |     20 | RESEARCH   |
|  7369 | SMITH  |     20 | RESEARCH   |
|  7844 | TURNER |     30 | SALES      |
|  7521 | WARD   |     30 | SALES      |
+-------+--------+--------+------------+

-- Q-3. Write an SQL query to fetch the names of workers who earn the highest salary.

select ename,sal from emp where sal in (select max(sal) from emp);

+-------+------+
| ename | sal  |
+-------+------+
| KING  | 5000 |
+-------+------+

-- Assignment 5

-- Q-1. Write an SQL query to print details of workers excluding first names, “JONES” and “TURNER” from Worker table.

select * from emp where ename not in ('JONES', 'TURNER');

+-------+--------+-----------+------+------------+------+------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal  | comm | deptno |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-22 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-09-23 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-19 | 5000 | NULL |     10 |
|  7876 | ADAMS  | CLERK     | 7788 | 1987-08-24 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+

-- Q-2. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘s’ and contains six alphabets.

select * from emp where ename like '%s';

+-------+-------+---------+------+------------+------+------+--------+
| empno | ename | job     | mgr  | hiredate   | sal  | comm | deptno |
+-------+-------+---------+------+------------+------+------+--------+
|  7566 | JONES | MANAGER | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7876 | ADAMS | CLERK   | 7788 | 1987-08-24 | 1100 | NULL |     20 |
|  7900 | JAMES | CLERK   | 7698 | 1981-12-03 |  950 | NULL |     30 |
+-------+-------+---------+------+------------+------+------+--------+

-- Q-3. Write a query to validate Email of Employee.

select empno,ename,email from emp1 where email not like '%@gmail.com';

Empty set (0.00 sec)

-- Assignment 6

-- Q-1. Write an SQL query to print details of the Workers who have joined in Feb’1981.

select * from emp where month(hiredate) = 2 and year(hiredate) = 1981;

+-------+-------+----------+------+------------+------+------+--------+
| empno | ename | job      | mgr  | hiredate   | sal  | comm | deptno |
+-------+-------+----------+------+------------+------+------+--------+
|  7499 | ALLEN | SALESMAN | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD  | SALESMAN | 7698 | 1981-02-22 | 1250 |  500 |     30 |
+-------+-------+----------+------+------------+------+------+--------+

-- Q-2. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT * FROM emp WHERE (ename, deptno) IN (SELECT ename, deptno FROM emp GROUP BY ename, deptno HAVING COUNT(*) > 1);

Empty set (0.00 sec)

-- Q-3. How to remove duplicate rows from Employees table.



-- Assignment 7

-- Q-1. Write an SQL query to show only odd rows from a table.

select * from (SELECT *, ROW_NUMBER() OVER (ORDER BY empno) AS rn FROM emp) odd_row where rn % 2 = 1;

+-------+--------+-----------+------+------------+------+------+--------+----+
| empno | ename  | job       | mgr  | hiredate   | sal  | comm | deptno | rn |
+-------+--------+-----------+------+------------+------+------+--------+----+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |  1 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |  3 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-22 | 1250 | 1400 |     30 |  5 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |  7 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-19 | 5000 | NULL |     10 |  9 |
|  7876 | ADAMS  | CLERK     | 7788 | 1987-08-24 | 1100 | NULL |     20 | 11 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 | 13 |
+-------+--------+-----------+------+------------+------+------+--------+----+

-- Q-2. Write an SQL query to clone a new table from another table.
 
 CREATE TABLE clean_table AS SELECT DISTINCT * FROM emp;

+-------+--------+-----------+------+------------+------+------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal  | comm | deptno |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-22 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-09-23 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-19 | 5000 | NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500 |    0 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1987-08-24 | 1100 | NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950 | NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000 | NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300 | NULL |     10 |
+-------+--------+-----------+------+------------+------+------+--------+

-- Assignment 8

-- Q-1. Write an SQL query to fetch intersecting records of two tables.

select e.empno,e.ename,e.job,d.dname,d.loc from emp e  join dept d on e.deptno = d.deptno; 

+-------+--------+-----------+------------+----------+
| empno | ename  | job       | dname      | loc      |
+-------+--------+-----------+------------+----------+
|  7782 | CLARK  | MANAGER   | ACCOUNTING | NEW YORK |
|  7839 | KING   | PRESIDENT | ACCOUNTING | NEW YORK |
|  7934 | MILLER | CLERK     | ACCOUNTING | NEW YORK |
|  7369 | SMITH  | CLERK     | RESEARCH   | DALLAS   |
|  7566 | JONES  | MANAGER   | RESEARCH   | DALLAS   |
|  7788 | SCOTT  | ANALYST   | RESEARCH   | DALLAS   |
|  7876 | ADAMS  | CLERK     | RESEARCH   | DALLAS   |
|  7902 | FORD   | ANALYST   | RESEARCH   | DALLAS   |
|  7499 | ALLEN  | SALESMAN  | SALES      | CHICAGO  |
|  7521 | WARD   | SALESMAN  | SALES      | CHICAGO  |
|  7654 | MARTIN | SALESMAN  | SALES      | CHICAGO  |
|  7698 | BLAKE  | MANAGER   | SALES      | CHICAGO  |
|  7844 | TURNER | SALESMAN  | SALES      | CHICAGO  |
|  7900 | JAMES  | CLERK     | SALES      | CHICAGO  |
+-------+--------+-----------+------------+----------+

-- Q-2. Write an SQL query to show records from one table that another table does not have.

select * from emp e left join dept d on e.deptno=d.deptno where d.deptno is null ;

Empty set (0.00 sec)

-- Assignment 9 

-- Q-1.  Write an SQL query to show the top n (say 10) records of a table.

select * from emp limit 10 ;

+-------+--------+-----------+------+------------+------+------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal  | comm | deptno |
+-------+--------+-----------+------+------------+------+------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800 | NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600 |  300 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250 |  500 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975 | NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-22 | 1250 | 1400 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850 | NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450 | NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-09-23 | 3000 | NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-19 | 5000 | NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500 |    0 |     30 |
+-------+--------+-----------+------+------------+------+------+--------+

-- Q-2. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select distinct ename,sal from emp order by sal desc limit 1 offset 4;

+-------+------+
| ename | sal  |
+-------+------+
| BLAKE | 2850 |
+-------+------+

-- Assignment 10 

-- Q-1. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

select ename,sal 
from emp 
where 
	sal = (select max(sal) from emp where sal 
		< (select max(sal) from emp where sal 
			< (select max(sal) from emp where sal 
				< (select max(sal) from emp where sal 
					< (select max(sal) from emp)))));

+-------+------+
| ename | sal  |
+-------+------+
| CLARK | 2450 |
+-------+------+

-- Q-2. Write an SQL query to fetch the list of employees with the same salary.

select ename, sal from emp where sal in (select sal from emp group by sal having count(*)>1)  ;

+--------+------+
| ename  | sal  |
+--------+------+
| WARD   | 1250 |
| MARTIN | 1250 |
| SCOTT  | 3000 |
| FORD   | 3000 |
+--------+------+