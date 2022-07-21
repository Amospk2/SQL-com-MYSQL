#Here we are create the DB, all tables, relationships, constraint and foreign keys

CREATE DATABASE BancoDeDadosI;

use BancoDeDadosI;

CREATE TABLE Autor(
	ID_Autor int not null auto_increment,
	Nome_Autor varchar(255) not null,
	Sobrenome_Autor varchar(255) not null,
	created_at datetime not null default now() on update now(),
	updated_at datetime not null default now() on update now(),
	constraint pk_id primary key(ID_Autor),
	constraint un_id unique(ID_Autor)
);


CREATE TABLE Livro(
	ID_Livro int not null auto_increment,
	Nome_Livro varchar(255) not null,
	ID_Autor int not null,
	created_at datetime not null default now() on update now(),
	updated_at datetime not null default now() on update now(),
	constraint un_id unique(ID_Livro),
	constraint pk_id primary key(ID_Livro),
	constraint fk_autorID foreign key(ID_Autor) references Autor(ID_Autor)
);


INSERT INTO Autor(Nome_Autor, Sobrenome_Autor)
values ('Fulano', 'Santos'), ('Fulano', 'Silva');

INSERT INTO Livro(Nome_Livro, ID_Autor)
values ('Romance', 1), ('Drama', 2);


select L.Nome_Livro as BookName, A.Nome_Autor as Name_Autor
from Livro as L
join Autor as A on A.ID_Autor = L.ID_Autor;


select Nome_Livro, ID_Autor, (select Nome_Autor from Autor where Livro.ID_Autor = ID_Autor limit 1) from Livro;

