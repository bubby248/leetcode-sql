CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
RETURN (
# Write your MySQL query statement below.
select distinct Salary
from
(select dense_rank() over (order by Salary desc) as rn, Salary
from Employee) tmp
where rn = N
);
END