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
prefContato varchar(10),
tipoUsuario varchar(10),
fkEmpresa int,
CONSTRAINT chkPrefContato CHECK (prefContato IN ('email', 'celular', 'whatsapp')),
CONSTRAINT chkTipoUsuario CHECK(tipoUsuario IN('responsavel', 'administrador', 'usuario')),
CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

create table credenciais (
idCredenciais int auto_increment,
fkUsuario INT,
email varchar(45),
senha varchar(45),
CONSTRAINT pkComposta primary key (idCredenciais, fkUsuario),
CONSTRAINT fkCredenciaisUsuario foreign key (fkUsuario) references usuario(idUsuario),
CONSTRAINT chkEmail CHECK (email like ('%@%'))
);

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