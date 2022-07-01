-- 1) Insira 5 usuários

INSERT INTO users(first_name, last_name, email, salary, password_hash)
VALUES('Luciano', 'Santana', 'lusantana@gmail.com', ROUND(RAND() * 10000, 2) ,'ASF3DF2G4DA'), 
('Renata', 'Dias', 'RenataD@gmail.com', ROUND(RAND() * 10000, 2), 'ASD2S56GSA'),
('Fernando', 'Torres', 'fdD@gmail.com', ROUND(RAND() * 10000, 2), 'KOIO2332IO'),
('Leticia', 'Fontes', 'fddf@gmail.com', ROUND(RAND() * 10000, 2), 'PO32PO32O'),
('Xyla', 'Pessoa', 'dffd@gmail.com', ROUND(RAND() * 10000, 2), 'NM54MN54N4')

-- 2) Insira 5 perfís para os usuários inseridos

select id, first_name from users where id >= 112;

INSERT INTO profiles(bio, description, user_id)
SELECT CONCAT("Bio de ", first_name), CONCAT("Descrição de ", first_name), id 
from users 
where id >= 112;

-- outra forma de inserir

INSERT INTO profiles(bio, description, user_id)
VALUES ('Uma bio', 'Uma descrição', (select id from users where email = 'dffd@gmail.com'),
('Uma bio', 'Uma descrição', (select id from users where email = 'RenataD@gmail.com');


-- 3) Insira permissões (roles) para os usuários inseridos

INSERT IGNORE INTO users_roles(user_id, role_id)
Select id, (select id from roles order by rand() limit 1) from users
where id >= 112;

INSERT IGNORE INTO users_roles(user_id, role_id)
VALUES(
	(select id from users where email = 'RenataD@gmail.com'),
	(select id from roles where name = 'DELETE')
),
(
	(select id from users where email = 'dffd@gmail.com'),
	(select id from roles where name = 'DELETE')
);


select u.first_name, ur.role_id, ur.user_id, r.name from users as u
join users_roles as ur on u.id = ur.user_id
join roles as r on r.id = ur.role_id;


-- 4) Selecione os últimos 5 usuários por ordem decrescente

select * from users where id > 112 order by id desc;



-- 5) Atualize o último usuário inserido

select * from users where id > 112 order by id desc;

update users set last_name = 'Amster' where id > 112 order by id desc limit 1;


-- 6) Remova uma permissão de algum usuário

SELECT * from users_roles where user_id = 112;

DELETE FROM users_roles where user_id = 112 and role_id = 2;


#outra forma de usar o delete
DELETE FROM users_roles where 
user_id = (select id from users where email = 'RenataD@gmail.com') and
role_id  = (select id from roles where name = 'DELETE');

-- sempre usar um select antes do delete

-- 7) Remova um usuário que tem a permissão "PUT"


-- delete com join
SELECT u.first_name, ur.user_id, ur.role_id, r.name  
FROM users u
JOIN users_roles as ur ON u.id = ur.user_id
JOIN roles as r on ur.role_id = r.id
where r.name = 'PUT';


-- SELECT u.first_name, ur.user_id, ur.role_id, r.name  
DELETE u  
FROM users u
JOIN users_roles as ur ON u.id = ur.user_id
JOIN roles as r on ur.role_id = r.id
where r.name = 'PUT' and u.id = 26;

DELETE FROM users_roles ur
WHERE ur.role_id = 3 and ur.user_id = 18;



select u.first_name, ur.user_id, ur.role_id from users u
joiN users_roles ur on u.id = ur.user_id;

DELETE FROM users_roles where user_id = 16;

-- 8) Selecione usuários com perfís e permissões (obrigatório)


SELECT u.first_name, ur.user_id, ur.role_id as role, p.bio as bio
FROM users u
INNER JOIN users_roles ur ON u.id = ur.user_id
INNER JOIN profiles p ON p.user_id = u.id;


SELECT u.first_name, ur.user_id, ur.role_id, r.name, p.bio  
FROM users u
LEFT JOIN users_roles as ur ON u.id = ur.user_id
LEFT JOIN roles as r on ur.role_id = r.id
LEFT JOIN profiles as p on p.user_id = u.id;


-- 9) Selecione usuários com perfís e permissões (opcional)


SELECT u.first_name, ur.user_id, ur.role_id as role, p.bio as bio
FROM users u
LEFT JOIN users_roles ur ON u.id = ur.user_id
LEFT JOIN profiles p ON p.user_id = u.id;


-- 10) Selecione usuários com perfís e permissões ordenando por salário

SELECT u.first_name, u.salary, ur.user_id, ur.role_id as role, p.bio as bio
FROM users u
LEFT JOIN users_roles ur ON u.id = ur.user_id
LEFT JOIN profiles p ON p.user_id = u.id
order by salary asc;






















