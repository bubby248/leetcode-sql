Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The query result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last ones seat.



with cte as (select id,student,lag(student) over(order by id asc) as lagStudent,
lead(student) over(order by id asc) as leadStudent from Seat order by id asc)

select id, case when id%2!=0 then COALESCE(leadStudent,student) when id%2=0 then COALESCE(lagStudent,student) end as student from cte



SELECT
    CASE
        WHEN id%2 = 1 AND id < (SELECT MAX(id) FROM seat) THEN id+1
        WHEN id%2 = 0 THEN id-1
        ELSE id
    END AS id,
    student
FROM seat
ORDER BY id