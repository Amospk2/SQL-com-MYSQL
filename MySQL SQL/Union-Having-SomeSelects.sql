
/*

The UNION operator is used to combine the result-set of two or more SELECT statements.

Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order

Note: If some customers or suppliers have the same city, each city will only be listed once, 
because UNION selects only distinct values. Use UNION ALL to also select duplicate values!
*/


SELECT id from users
union
SELECT id from profiles;


SELECT id from users
union all
SELECT id from profiles;



#################################################################



/*
 
 The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
 
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);
 */


SELECT first_name, COUNT(first_name) as first_name_ocorrence, SUM(salary) 
from users
group by first_name, salary
having SUM(salary) > 7000;


SELECT first_name, COUNT(first_name) as first_name_ocorrence, SUM(salary) 
from users
group by first_name
having SUM(salary) > 7000
order by count(first_name) DESC;






#################################################################


#seleciona valores da mesma tabela com ids diferente mas que possuem um valor em comum
#no caso é o updated_at:

SELECT A.first_name as Fist_name1, B.first_name as Fist_name2, A.updated_at 
from users A, users B
where A.id <> B.id
and A.updated_at = B.updated_at
order by A.updated_at;


select u.id, u.first_name, p.bio, p.id
from users as u
cross join profiles as p;


delete p
from users as u
left join profiles as p on u.id = p.user_id
where p.id in (201, 213, 190);


SELECT r.name, COUNT(ur.role_id) as roles
FROM users_roles as ur
INNER JOIN users u ON u.id = ur.user_id
INNER JOIN roles r ON ur.role_id = r.id
GROUP BY r.name;



