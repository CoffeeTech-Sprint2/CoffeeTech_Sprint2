CREATE DATABASE coffeTech;
use coffeTech;

create table cadastro(
idCadastro int primary key auto_increment,
razaoSocial varchar(45),
cnpj char(14) null,
dataAdesao datetime
);

create table usuario(
idUsuario int primary key auto_increment,
email varchar(45), 
nome varchar(45),
celular char(11),
senha varchar(45),
prefContato varchar(10),
tipoUsuario varchar(10),
fkCadastroUsuario int,
CONSTRAINT chkEmail CHECK (email like '%@%'),
CONSTRAINT chkPrefContato CHECK (prefContato IN ('email', 'celular', 'whatsapp')),
CONSTRAINT chkTipoUsuario CHECK(tipoUsuario IN('responsavel', 'administrador', 'usuario')),
CONSTRAINT fkUsuarioCadastro FOREIGN KEY (fkCadastroUsuario) REFERENCES cadastro(idCadastro)
);

create table propriedade(
idPropriedade int primary key auto_increment,
nome_fazenda varchar(45),
hectares decimal(6,1),
cep char(9),
tipo_solo varchar(45),
fkCadastroPropriedade int,
CONSTRAINT fkPropriedadeCadastro FOREIGN KEY (fkCadastroPropriedade) REFERENCES cadastro(idCadastro)
);

create table sensor(
idSensor int primary key auto_increment,
localizacaoInterna varchar(45),
fkPropriedade int,
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
dataInstalacao datetime,
dtManutencao datetime,
CONSTRAINT pkComposta primary key(idManutencao, fkSensor),
CONSTRAINT fkSensorManutencao foreign key (fkSensor) references sensor(idSensor)
);