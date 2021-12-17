select max(Salary) as SecondHighestSalary from Employee 
where Salary not in (select max(Salary) from Employee)

select max(salary) as SecondHighestSalary from Employee where 
salary < (select max(salary) from Employee)


select distinct a.salary as SecondHighestSalary from 
(select id,salary,dense_rank() over (order by salary desc) as rk from Employee)a where a.rk=2