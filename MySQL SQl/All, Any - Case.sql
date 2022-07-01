
#################################################################


#The EXISTS operator is used to test for the existence of any record in a subquery.
#The EXISTS operator returns TRUE if the subquery returns one or more records.


SELECT p.id, p.bio, p.description 
FROM profiles p 
WHERE EXISTS (SELECT u.salary from users u where u.id = p.user_id and salary < 1000);


SELECT u2.id, u2.first_name, u2.salary
FROM users u2  
WHERE EXISTS (SELECT u.salary from users u where u2.id = u.id and u.salary < 1000);



/*

ANY

Filtra na consulta valores de uma tabela, com ligação com outra tabela, que tem alguam condição atendida:
SELECT first_name 
FROM users
WHERE id = any (select user_id from users_roles where role_id = 1);


O Script acima pega todos os nomes de usuarios que tem na tabela users_roles a role = 1

ALL

Retorna algo quando TODOS os valores atendem uma condição

SELECT ALL first_name 
from users
where TRUE;


*/

SELECT first_name 
FROM users
WHERE id = any (select user_id from profiles where bio like 'b%');



SELECT ALL first_name 
from users
where TRUE;


#Não retorna nada pois nem todos os valores da tabela atendem essa exigencia
SELECT first_name 
FROM users
WHERE id = ANY(select user_id from profiles where bio like 'B%');


#################################################################

SELECT u.id, p.bio, p.description,
case
	WHEN u.salary > 5500 THEN 'Have a good salary'
	WHEN u.salary < 5500 THEN 'No have a good salary'
	ELSE 'This person dont have profile!'
end as HasGoodSalary
FROM users as u, profiles as p
where u.id = p.user_id






