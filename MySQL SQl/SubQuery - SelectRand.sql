

-- adicionando roles
INSERT INTO roles (name)
VALUES('POST'), ('PUT'), ('DELETE'), ('GET');

-- adicionando users_roles 
INSERT INTO users_roles (user_id, role_id)
VALUES (101, 2);

-- buscando users_rolas
SELECT user_id, role_id FROM users_roles WHERE user_id = 101 and role_id = 2;

-- fazendo uma subquery com o select, aqui o select dentro de outro select busca os dados
-- de roles e retorna como uma coluna que se junta a coluna id do select principal:
select id, (select id from roles order by rand() limit 1) as qualquer from users;


-- insert com subquery, inserindo roles aleatorios para os usuarios:
INSERT IGNORE INTO users_roles (user_id, role_id)
select id, (select id from roles order by rand() limit 1) from users order by rand() limit 2;




SELECT u.id as uid, u.first_name, p.bio, r.name
FROM users AS u 
LEFT JOIN profiles as p ON u.id = p.user_id
INNER JOIN users_roles as ur ON u.id = ur.user_id
INNER JOIN roles as r ON ur.role_id = r.id
ORDER BY uid ASC;

/*
 Seleção multipla em varias tabelas, o script acima pega informações das tabelas, compara e ordena apenas os
 registros que estão nessas exigencias.
 */


-- select com join
select u.id as uid, p.bio from users as u 
LEFT JOIN profiles as p on u.id = p.user_id 
where u.first_name = 'Amos';


-- update com join
update users as u
LEFT JOIN profiles as p on u.id = p.user_id 
set p.bio = CONCAT(p.bio, ' Atualizado') 
where u.first_name = 'Amos';

-- delete com join
DELETE u from users as u
LEFT JOIN profiles as p on u.id = p.user_id
where u.first_name = 'Amos';





