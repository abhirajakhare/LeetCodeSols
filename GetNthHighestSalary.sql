CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    with ranked_salary as (
       SELECT
            salary,
            DENSE_RANK() OVER (
                ORDER BY salary desc
            ) salary_rank
        FROM Employee
      ) 
      select salary
      into result
      from ranked_salary
            where salary_rank = N
      and rownum=1;
    
    RETURN result;
END;

/*

Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
In SQL, id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
*/