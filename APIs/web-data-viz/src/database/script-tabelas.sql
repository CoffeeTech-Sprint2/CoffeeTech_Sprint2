-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

-- CREATE DATABASE aquatech;

-- USE aquatech;

-- CREATE TABLE empresa (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	razao_social VARCHAR(50),
-- 	cnpj CHAR(14),
-- 	codigo_ativacao VARCHAR(50)
-- );

-- CREATE TABLE usuario (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	nome VARCHAR(50),
-- 	email VARCHAR(50),
-- 	senha VARCHAR(50),
-- 	fk_empresa INT,
-- 	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
-- );

-- CREATE TABLE aviso (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	titulo VARCHAR(100),
-- 	descricao VARCHAR(150),
-- 	fk_usuario INT,
-- 	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
-- );

-- create table aquario (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	descricao VARCHAR(300),
-- 	fk_empresa INT,
-- 	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
-- );


-- create table medida (
-- 	id INT PRIMARY KEY AUTO_INCREMENT,
-- 	temperatura DECIMAL,
-- 	momento DATETIME,
-- 	fk_aquario INT,
-- 	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
-- );

-- insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
-- insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');
-- insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);
-- insert into aquario (descricao, fk_empresa) values ('Aquário de Peixe-dourado', 2);

CREATE DATABASE coffeeTech;
use coffeeTech;
create table empresa(
idEmpresa int primary key auto_increment,
razaoSocial varchar(45),
cnpj char(14) null,
dataAdesao datetime,
cep char(8),
logradouro varchar(45),
numEndereco varchar(10)
);

create table usuario(
idUsuario int primary key auto_increment,
nome varchar(45),
celular char(11),
telefone char(11),
email varchar(45),
senha varchar(45),
fkEmpresa int,
CONSTRAINT chkEmail CHECK (email like ('%@%')),
CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

-- create table credenciais (
-- idCredenciais int auto_increment,
-- fkUsuario INT,
-- email varchar(45),
-- senha varchar(45),
-- CONSTRAINT pkComposta primary key (idCredenciais, fkUsuario),
-- CONSTRAINT fkCredenciaisUsuario foreign key (fkUsuario) references usuario(idUsuario),
-- CONSTRAINT chkEmail CHECK (email like ('%@%'))
-- );

create table propriedade(
idPropriedade int primary key auto_increment,
nome_fazenda varchar(45),
hectares decimal(6,1),
cep char(9),
tipo_solo varchar(45),
fkEmpresa int,
CONSTRAINT fkEmpresaPropriedade FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

create table sensor(
idSensor int primary key auto_increment,
localizacaoInterna varchar(45),
fkPropriedade int,
dataInstalacao datetime,
CONSTRAINT fkPropriedadeSensor foreign key (fkPropriedade) references propriedade(idPropriedade)
);

create table leitura(
idLeitura int primary key auto_increment,
umidade decimal(4,1),
dataHora datetime,
fkSensorLeitura int,
CONSTRAINT fkLeituraSensor FOREIGN KEY (fkSensorLeitura) references sensor(idSensor)
);

create table manutencao(
idManutencao int,
fkSensor int unique,
dataManutencao datetime,
CONSTRAINT pkComposta primary key(idManutencao, fkSensor),
CONSTRAINT fkSensorManutencao foreign key (fkSensor) references sensor(idSensor)
);

insert into empresa (razaoSocial, cnpj) values
('Fazenda Batatinha', 12345678000195);

select * from empresa;

select * from usuario;