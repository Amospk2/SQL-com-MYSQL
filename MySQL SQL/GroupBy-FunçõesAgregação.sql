
/*
COUNT() function is used to count occurrences of a register in the table.
For example, COUNT(ID) will return number of id's with the same value, 
and COUNT(first_name) will count occurrences of first_names.



GROUP BY agroup register with the same values.
Agregação: agregar valores de uma tabela, o group by só 
funciona se ele poder agregar os valores de uma ou mais tabelas.




*/

SELECT first_name, COUNT(id) as total
FROM users 
GROUP BY first_name
ORDER BY total DESC;

/*
 
 Consulta utilizando diferente comandos para busca e agrupamento:
 
 */
SELECT u.first_name, COUNT(u.id) as total -- conta os numero de registros
from users as u
LEFT JOIN profiles as p
ON u.id = p.user_id
WHERE u.id in (15, 55, 112, 75, 44)
GROUP BY first_name #Agrupa os registros pelo first_name
ORDER BY total DESC
LIMIT 10;





#FUNÇÕES DE AGREGAÇÃO:

/*
 
MAX() retorna o valor maximo de uma coluna
MIN() retorna o valor minimo de uma coluna
AVG() retorna a media de valores de uma coluna
SUM() retorna a soma dos valores de uma coluna
COUNT() conta as ocorrencias de valores em uma coluna



*/
SELECT 
MAX(salary) as max_salary, 
MIN(salary) as min_salary,
AVG(salary) as avg_salary,
SUM(salary) as sum_salary,
COUNT(salary) as count_salary
from users
WHERE first_name = "Xyla";


SELECT
u.first_name,
MAX(u.salary) as max_salary, 
MIN(u.salary) as min_salary,
AVG(u.salary) as avg_salary,
SUM(u.salary) as sum_salary,
COUNT(u.id) as total -- conta os numero de registros
from users as u
LEFT JOIN profiles as p
ON u.id = p.user_id
WHERE u.id in (15, 55, 112, 75, 44)
GROUP BY first_name #Agrupa os registros pelo first_name
ORDER BY total DESC
LIMIT 10;


SELECT
u.first_name,
MAX(u.salary) as max_salary, 
MIN(u.salary) as min_salary,
AVG(u.salary) as avg_salary,
SUM(u.salary) as sum_salary,
COUNT(u.id) as total -- conta os numero de registros
from users as u
LEFT JOIN profiles as p
ON u.id = p.user_id
GROUP BY first_name #Agrupa os registros pelo first_name
ORDER BY total DESC;





