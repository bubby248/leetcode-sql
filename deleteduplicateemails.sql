Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.


delete from Person where id not in (SELECT id FROM 
(select min(id) as id,email from Person group by email)A )



delete from Person where id in (
select id from 
(
select id,email,row_number() over(partition by email order by id asc) as row_num from Person
) as sub_query where sub_query.row_num>1);

