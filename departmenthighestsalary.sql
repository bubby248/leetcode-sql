Write an SQL query to find employees who have the highest salary in each of the departments.

with cte as 
(select e.name as name,e.salary as salary,e.departmentId as deptId,d.name as deptName,
     rank() over (partition by departmentid order by salary desc) as rk from Employee e join 
    Department d on e.departmentId=d.id
)
select deptName as Department,name as Employee,salary as Salary from cte where rk=1;

