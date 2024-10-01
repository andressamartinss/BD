CREATE DATABASE perfumaria;
USE perfumaria;

CREATE TABLE cliente(
 Cod_cli int,
 nome varchar(100),
 CPF varchar(20),
 Telefone varchar (16),
 Endereço varchar (100),
 PRIMARY KEY (Cod_cli)
)


CREATE TABLE regiao(
Cod_regiao int,
nome varchar(100),
descricao varchar(200),
PRIMARY KEY (Cod_regiao)
)

CREATE TABLE pontoestrategico(
Cod_regiao int,
localizacao varchar(100),
nome varchar (100),
FOREIGN KEY (Cod_regiao) REFERENCES regiao
)

CREATE TABLE vendedor(
Cod_vendedor int,
Cod_regiao int,
nome varchar(100),
CPF varchar(100),
Telefone varchar(16),
PRIMARY KEY (Cod_vendedor),
FOREIGN KEY (Cod_regiao) REFERENCES regiao
)

CREATE TABLE veiculo(
Cod_veiculo int,
placa varchar (8),
modelo varchar (50),
ano float,
PRIMARY KEY (Cod_veiculo)

)

CREATE TABLE locacao(
Cod_veiculo int,
Cod_vendedor int,
hora time,
FOREIGN KEY (Cod_veiculo) REFERENCES veiculo, 
FOREIGN KEY (Cod_vendedor) REFERENCES vendedor, 
)

CREATE TABLE notafiscal(
Cod_vendedor int,
Cod_cli int,
Cod_nota int,
data_hora datetime,
FOREIGN KEY (Cod_vendedor) REFERENCES vendedor,
FOREIGN KEY (Cod_cli) REFERENCES cliente,
PRIMARY KEY (Cod_nota)
)

CREATE TABLE produto(
Cod_produto int,
nome varchar(100),
preco_unit float,
quantidade float,
PRIMARY KEY (Cod_produto)
)

CREATE TABLE itemnf(
Cod_produto int,
Cod_nota int,
nome varchar(100),
FOREIGN KEY(Cod_produto) REFERENCES produto,
FOREIGN KEY (Cod_nota) REFERENCES notafiscal
)