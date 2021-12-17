Write an SQL query to find all dates Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).


select A.id1 as id from
(select id,lead(id) over(order by recordDate asc) as id1,temperature,lead(temperature) over(order by recordDate asc) as temp1,
	recordDate,lead(recordDate) over(order by recordDate asc) as recordDate1 from Weather)A 
where A.temp1>A.temperature and DATEADD(DAY, 1,A.recordDate) = A.recordDate1