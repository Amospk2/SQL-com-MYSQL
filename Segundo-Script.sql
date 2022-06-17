-- comando select no sql

SELECT u.id i, u.first_name fn, u.email em 
FROM users as u;

/*
 * apelidos: 
 * select * from users u;
 * select * from users as u;
 * select first_name as FN from users u;
 * SELECT id, first_name as FN, email em FROM users u WHERE id > 3;
 * 
 * */


/*
 *	DISTINCT: mostra apenas os valores diferentes
 *	count: realiza a contagem de elementos
 * */
SELECT COUNT(DISTINCT first_name) from users;


/*
 * clausula WHERE - Filtra registros
 * Seleciona valores que correspondem a condição
 * SELECT COLUMN_NAME, COLUMN_NAME,...
 * FROM TABLE_NAME, TABLE_NAME
 * WHERE CONDIÇÃO
 
Operator	Description	Example
=		Equal	
>		Greater than	
<		Less than	
>=		Greater than or equal	
<=		Less than or equal	
<>		Not equal. Note: In some versions of SQL this operator may be written as !=	
BETWEEN	Between a certain range	
LIKE	Search for a pattern	
IN		To specify multiple possible values for a column
*/

SELECT * FROM  users u WHERE u.id < 10;

SELECT * FROM  users u WHERE u.id <> 1 and u.id <> 2;

SELECT * FROM  users u WHERE u.id BETWEEN 10 and 20;

SELECT * FROM  users u WHERE u.first_name LIKE "h%";

SELECT * FROM  users u WHERE u.last_name in ("Souza", "Santos");

SELECT * FROM users 
WHERE created_at > '2022-06-15 11:41:38' 
and last_name in ('Souza', 'Santos');























