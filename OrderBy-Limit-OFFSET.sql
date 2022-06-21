/*
ORDER BY:
ordena os valores das colunas em ordem crescente ASC ou decrescente DESC.
ORDER BY id ASC;
ORDER BY id DESC;
ORDER BY id DESC, first_name DESC; (vai priorizar o id, geralmente se usa apenas 1 coluna como principal)

*/


SELECT id, first_name, last_name, email as uemail
FROM users 
WHERE id 
BETWEEN 1 AND 3 ORDER BY id DESC, first_name ASC;
-- ordena pelo id


SELECT id, first_name, last_name, email as uemail
FROM users 
WHERE id 
BETWEEN 1 AND 3 ORDER BY  first_name ASC, id DESC;
-- ordena pelo first_name


/*
LIMIT E OFFSET

LIMIT: limita a quantidade de registros que vão aparecer
OFFSET: Definite o começo de onde começa a coleta dos registros. (Padrão: OFFSET 0)
 */

SELECT id, first_name, last_name, email as uemail
FROM users 
WHERE id 
BETWEEN 1 AND 102 ORDER BY id ASC
limit 10 offset 92;

SELECT id, first_name, last_name, email as uemail
FROM users 
WHERE id 
BETWEEN 1 AND 102 ORDER BY id ASC
limit 82, 10;-- (offset, limit)






















