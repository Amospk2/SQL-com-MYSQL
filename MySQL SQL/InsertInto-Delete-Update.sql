/*
 insert into com select:
 
 Inserindo valores usando valores de outras tabelas. A partir
 do insert into podemos usar o select para utilizar valores de outras tabelas
 na inserção. 
 */


insert into profiles(bio, description, user_id)
select 1,2,3;-- coloco 1, 2 e 3 na tabela


insert into profiles(bio, description, user_id)
select 'bio', 'description', id from users; 
-- coloco os dois primeiros textos e depois o id de um usuario
-- é uma iteração, ele passa por todos os id da tabela users e adiciona em profiles

insert into profiles(bio, description, user_id)
select CONCAT('Bio de ', first_name) , CONCAT('Descrição de ', first_name), id from users;
-- CONCAT() - concatena textos
-- usamos a mesma ideia do codigo passado, aqui concatenamos o texto com o nome do usuario e
-- adicionamos o seu id para a FK users_id;



/*
 DELETE
 
Use WHERE to specify whitch record we want delete.
The delete statement always must have a WHERE otherwise its will delete
all table data. Pay attention for use a SELECT to see the table data and after use DELETE
to remove the select infos.
 */

SELECT * FROM users WHERE id = 102;
SELECT * FROM users WHERE id BETWEEN 90 and 100;
-- select and see the column infos

DELETE FROM users WHERE id = 102;
DELETE FROM users WHERE id BETWEEN 90 AND 100;
-- delete data before seen



# Como está definido como cascade os relacionamentos, deletar usuarios apaga o profile correspondente a ele.

/*
 
 Update
 
Used to update values from a row. The sintaxe: 
UPDATE table_name set column_name = value, column_name = value,... WHERE CONDITION

SET statement define whitch column will update and what values are changes
WHERE keyword define where the changes will happen

 */

select * from users where id BETWEEN 1 and 3;
update users set first_name = 'Amos', last_name = 'Santoa' where id = 1; 
update users set first_name = 'Amos', last_name = 'Santoa' where id BETWEEN 1 and 3; 








