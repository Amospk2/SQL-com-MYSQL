-- CREATE DATABASE is used to create a new database following below sintax:
-- CREATE DATABASE databasename;

-- DROP DATABASE is used to delete a database 
-- DROP DATABASE databasename;

use GitDatabase;

CREATE DATABASE GitDatabase;

DROP DATABASE GitDatabase;


#########################################

-- SHOW DATABASES; 
-- mostra todas as bases de dados
SHOW DATABASES;


#########################################

/*
CREATE TABLE is used to create a new table for a database.

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

*/

CREATE TABLE Alunos(
	id int not null,
	Nome_completo varchar(255),
	Data_nasc int,
	Endereco varchar(255),
	Cidade varchar(255),
	Sexo varchar(255),
	Telefone varchar(255)
#	created_at datetime,
#	updated_at datetime 
);


#########################################

-- DROP TABLE tablename;
-- this command will delete the table and delete all data inside the table;

DROP TABLE Alunos;


#########################################

/*
The ALTER TABLE statement is used to add, delete, or modify columns in an existing table, 
this statement is also used to add and drop various constraints on an existing table.
*/


#ALTER TABLE - ADD Column

ALTER TABLE Alunos 
ADD created_at datetime;

ALTER TABLE Alunos 
ADD updated_at datetime;

ALTER TABLE Alunos 
ADD birthDay date;

#ALTER TABLE - DROP COLUMN

ALTER TABLE Alunos
DROP COLUMN telefone;


#ALTER TABLE - MODIFY COLUMN

#Mudança na posição da coluna
ALTER TABLE Usuarios
MODIFY COLUMN birthDay year not null AFTER CIDADE;

#Adicionando valores padrão:
ALTER TABLE Usuarios 
MODIFY COLUMN created_at datetime
DEFAULT now() on update now() NOT NULL;


#########################################

/*
The following constraints are commonly used in SQL:

NOT NULL - The NOT NULL constraint enforces a column to NOT accept NULL values.
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly


*/

#Adicionando primary key e unique:
ALTER TABLE Usuarios
ADD CONSTRAINT Unique_column unique(Nome_completo),
ADD CONSTRAINT Primary_key PRIMARY KEY(id);

#Removendo unique e primary key
ALTER TABLE Usuarios 
DROP INDEX Unique_column;

ALTER TABLE Usuarios 
DROP PRIMARY KEY;

#renomeando tabela
RENAME TABLE Alunos TO Usuarios;


#Adicionando foreign key para a tabela:
CREATE TABLE Pedidos(
	PedidoID int not null,
	NumeroPedido int not null,
	UsuariosID int,
	Primary Key (PedidoID),
	CONSTRAINT FK_PedidoUsuario FOREIGN KEY(UsuariosID) REFERENCES Usuarios(id)
);

#########################################

#alterando a o tipo da coluna:
ALTER TABLE Usuarios
MODIFY COLUMN Data_nasc date not null;




#########################################














