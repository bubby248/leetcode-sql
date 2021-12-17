Write an SQL query to find the employees who earn more than their managers.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.


/*select A.name as Employee from
(select id,name,salary,managerId from Employee)A
join
(select id,name,salary,managerId from Employee)B
ON A.managerId=B.id and A.salary>B.salary*/


select c.*  from 
(select a.Name as "Employee" from Employee as a, Employee as b where a.ManagerId = b.Id and a.Salary > b.Salary)c