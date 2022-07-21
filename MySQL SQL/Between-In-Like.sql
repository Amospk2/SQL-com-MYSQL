/*
 
Between: Seleciona campos que estão entre determinados ranges

SELECT * FROM users WHERE id BETWEEN 1 AND 10;
*/

select * from users where created_at BETWEEN '2019-12-29 00:00:00' and '2020-02-14 23:59:58';

select * from users where created_at BETWEEN '2019-12-29 00:00:00' and '2020-02-14 23:59:58' and id BETWEEN 90 and 100;

select * from users where id BETWEEN 95 and 150;


/*
 IN:
 Usado para escolher todos os valores de uma lista que você passar.
 */
select * from users where id in (10, 20, 30);
select * from users where first_name in ('Amos');


/*
 
 Like:
 Usado como uma expressão regular, escolhemos apenas registros que contem uma parte do texto
 % - qualquer coisa
 _ - um caractere

 */


select * from users where id like '1%';
select * from users where first_name like '%a';
select * from users where first_name like 'h%a';
select * from users where first_name like '%mo%';
select * from users where first_name like '%a%b%';
select * from users where first_name like '_m_s';


/*
Usando NOT: 

Pode ser usado para negar uma afirmação, exemplo: 
SELECT id, first_name, last_name from users where id not between 1 and 50;

*/


select * from users where not first_name in ('Amos');
select * from users where first_name not in ('Amos');
SELECT id, first_name, last_name from users where not id = "1";
SELECT id, first_name, last_name from users where not id BETWEEN 1 and 90;


/*

Order By:

Ordena os dados a partir de uma coluna, sendo em ordem crescente ou decrescente

*/

SELECT * from users;

SELECT * FROM users ORDER BY last_name ASC, id DESC;


/*
INSERT INTO:

Sintaxe:

Para inserir todos os valores de uma tabela:
INSERT INTO TABLE_NAME 
VALUES(VALUE1, VALUE2...)

Para inserir valores especificos:
INSERT INTO TABLE_NAME(COLUMN_NAME, COLUMN_NAME, COLUMN_NAME...)
VALUES(VALUE1, VALUE2);

*/

INSERT INTO users
values(111,"Rex", "T", "T@gmail.com", "R_hash", now(), now());

INSERT INTO users(first_name, last_name, email, password_hash)
values("Amós", "santos", "Amosdres@gmail.com", "A_hash");







