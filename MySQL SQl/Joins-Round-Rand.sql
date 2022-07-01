/*
Selecionando dados de duas tabelas:
*/

SELECT u.id as uid, p.id as pid, p.bio, u.first_name
FROM users AS u, profiles AS p 
where u.id = p.user_id;




/*
Joins for w3school:

INNER JOIN: Returns records that have matching values in both tables
LEFT JOIN: Returns all records from the left table, and the matched records from the right table
RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
CROSS JOIN: Returns all records from both tables
 */


/*
INNER JOIN:

We use to receive relationship information. The inner join statement only return data when both tables have 
data. Also we use ON to specify which condition will return values.

SELECT u.id as uid, p.id as pid, p.bio, u.first_name
FROM users AS u
INNER JOIN profiles p
ON u.id = p.user_id;


*/

SELECT u.id as uid, p.id as pid, p.bio, u.first_name
FROM users AS u
INNER JOIN profiles p
ON u.id = p.user_id;

SELECT u.id as uid, p.id as pid, p.bio, u.first_name
FROM users AS u
INNER JOIN profiles p
ON u.id = p.user_id
where u.first_name like 'a%'
ORDER BY p.bio ASC 
LIMIT 10;

-- you can use others statement like WHERE, ORDER BY, LIMIT...



/*
LEFT JOIN

Only return all data from left table ignoring all registers from other tables.
For example:
*/
SELECT u.id as uid, p.id as pid, p.bio, u.first_name
FROM users AS u
LEFT JOIN profiles p
ON u.id = p.user_id;


/*
RIGHT JOIN

Only look at data from right table ignoring all registers from other tables. 
Same no existing relationship with both tables. For example:
*/


SELECT u.id as uid, p.id as pid, p.bio, u.first_name
FROM users AS u
RIGHT JOIN profiles p
ON u.id = p.user_id; 

/*


ROUND() - limit the values after comma(virgula)

Rand() - generate random values between 0 and 1


*/
select * ROUND(rand() * 10000, 2);

-- generate random values for the salarys of the users
UPDATE users set salary = ROUND(rand() * 10000, 2);


SELECT salary FROM users WHERE salary BETWEEN 1500 AND 5500 ORDER BY salary ASC;





