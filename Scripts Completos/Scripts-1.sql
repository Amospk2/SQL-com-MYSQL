#Here we are create the DB, all tables, relationships, constraint and foreign keys


#Criação
CREATE DATABASE GitDatabase;

#set the database
USE GitDatabase;

#Create the tables:
CREATE TABLE Users(
	ID int not null auto_increment,
	Name varchar(255) not null,
	Nascimento date not null,
	Email varchar(255) not null,
	Pass date not null,
	created_at datetime not null default now() on update now(),
	updated_at datetime not null default now() on update now(),
	constraint unique_constraint unique(id, name, email),
	constraint pk_id primary key(id)
);


#alter table users because the pass column has type date instead varchar
ALTER TABLE User
modify column pass varchar(255) not null;


#Create Product table
CREATE TABLE Products(
	ProductID INT NOT NULL AUTO_INCREMENT,
	Quantidade int NOT NULL, 
	Valor float NOT NULL,
	created_at datetime NOT NULL default now() on update now(),
	updated_at datetime NOT NULL default now() on update now(),
	constraint unique_product_id unique(productID),
	constraint chk_qtd CHECK(Quantidade > 0 and valor > 0)
);

#Rename Table
RENAME TABLE Products TO Product;

#Alter type of name 
ALTER TABLE Product ADD Name varchar(255) not null after productID;


#Create ProductSold table
CREATE TABLE ProductSold(
	ProductID INT NOT NULL,
	UserID int NOT NULL,
	Quantidade int NOT NULL, 
	Valor float not null,
	created_at datetime NOT NULL default now() on update now(),
	updated_at datetime NOT NULL default now() on update now(),
	constraint chk_qtd_PS CHECK(Quantidade > 0),
	constraint fk_user foreign key(UserID) references Users(id),
	constraint fk_product foreign key(ProductID) references Product(productID)
);



#inserts for Users and Product tables
INSERT INTO Users(name, nascimento, email, pass)
VALUES('Amós', '2001-02-13', 'Teste@gmail.com', '3DF872HD8AJ');

INSERT INTO Product(Name, Quantidade, valor)
VALUES('Celular', 15, 1500);


#select with join
SELECT u.name, ps.quantidade, ps.valor, p.Name
from Users as u
join ProductSold as ps on u.id = ps.userID
join Product as p on ps.productID = p.productID;

















