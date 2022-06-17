-- testando coisas
# testando
/* testando */
# select * from base_de_dados.users u

# select email from base_de_dados.users u;

# seleciona uma determinada base de dados como "padrão" para esse script
# use base_de_dados;

# Mostra as tabelas da base de dados
show tables;

# Descreve as colunas da tabela
describe users;

#inserir registros em uma tabela:
insert into users 
(first_name, last_name, email, password_hash) 
values('maria', 'sá','maria@gmail.com', '12345678'),
('vagner', 'moura', 'vagner@gmail.com', '954796'),
('helena', 'souza', 'hs@gmail.com', '5_hash');






