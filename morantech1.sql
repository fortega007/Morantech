CREATE DATABASE morantech1;
USE morantech1;


-- TABELA DE CADASTRO DO CLIENTE
create table cliente (
idCliente int primary key auto_increment,
nomeEmpresa varchar(60) NOT NULL,
email varchar(70) UNIQUE NOT NULL, constraint chkEmail CHECK (email like '%@%'),
senha varchar(20) NOT NULL,
telefone char(13) default '(00)000000000',
cidade varchar(50),
UF char(2),
CNPJ char(18) NOT NULL,
qtdSensores int
) auto_increment = 100;

insert into cliente values
(null, 'Pedro Morangos', 'pedrorangos@gmail.com', 'ghaks13IK#', '(11)942678493','São Paulo', 'SP', '12.531.198/0001-01', 7),
(null, 'Strawberries Fresh','strawberriesfresh@gmail.com', 'fhks11LL/', '(31)92029256','Juiz de Fora', 'MG', '13.421.013/0298-03', 5),
(null, 'Moranguinhos', 'moranguinhos@hotmail.com', '@Hijs19', '(42)992874566','Ponta Grossa', 'PA', '14.421.123/0021-12', 9),
(null, 'Fresa Fresca', 'fresafresca@gmail.com', '/Pksd120', '(75)99280835','São Desidério ', 'BA', '16.726.121/0972-02', 11),
(null, 'Morango Carioca', 'morangocarioca@outlook.com', 'Mc#10098', '(21)992590345', 'Rio de Janeiro', 'RJ', '12.716.111/0574-04', 6);

-- comandos

desc cliente;
select * from cliente;
select * from cliente where nomeEmpresa like 'M%';
select email from cliente order by nomeEmpresa desc;
select nomeEmpresa, UF from cliente;
select nomeEmpresa, qtdSensores from cliente;



-- TABELA DE SENSOR

create table Modelo_sensor (
idModelo int primary key auto_increment,
modelo varchar(10) not null,
medição varchar(20), constraint chkMedicao check (medição in ('Temperatura','Umidade','Temperatura/Umidade')),
serialNumber char(9) unique not null, -- (SU2023001)
situaçao varchar(1), constraint chkSituaçao check (situaçao in ('A','I')),
dtManutencao date,
fkCliente int, constraint fkc foreign key (fkCliente) references cliente(idCliente)
) auto_increment = 1;

insert into Modelo_sensor values
(null, 'DHT11', 'Temperatura/Umidade', 'SD2023001', 'A', '2023-02-10', 100),
(null, 'DHT11', 'Temperatura/Umidade', 'SD2023002', 'A', '2022-12-28', 101),
(null, 'DHT11', 'Temperatura/Umidade', 'ST2023003','I', '2023-01-05', 102),
(null, 'DHT11', 'Temperatura/Umidade', 'ST2023004','I' ,'2022-10-05', 103),
(null, 'DHT11', 'Temperatura/Umidade', 'ST2023005', 'A', '2022-09-01', 104);

drop table Modelo_sensor;
ALTER TABLE Modelo_sensor RENAME modeloSensor;

-- comandos

desc Modelo_sensor;
select * from Modelo_sensor;
select * from Modelo_sensor JOIN cliente ON fkCliente = idCliente;
select * from Modelo_sensor JOIN cliente ON fkCliente = idCliente where serialNumber = 'ST2023003';
select * from Modelo_sensor JOIN cliente ON fkCliente = idCliente where situacao = 'A';


-- TABELA DADOS DO SENSOR 

create table dados_sensor(
idDados int primary key auto_increment,
temperatura decimal (4,2),
umidade decimal (4,2),
fkModelo int, constraint fkm foreign key (fkModelo) references Modelo_sensor(idModelo)
);

insert into dados_sensor (temperatura, umidade, fkModelo) values
('28.50', '80.00', 1),
('29.00', '90.00', 2),
('29.01', '85.00', 3),
('28.47', '91.00', 4);

drop table dados_sensor;

-- comandos
DESC dados_sensor;
UPDATE dados_sensor SET fkModelo = 3 WHERE idDados = 1; 
UPDATE dados_sensor SET fkModelo = 1 WHERE idDados = 2;
SELECT * FROM  dados_sensor JOIN Modelo_sensor ON fkModelo = idModelo;
SELECT cliente.nomeEmpresa AS Empresa,
modeloSensor.serialNumber AS SerialNumber, 
dados_sensor.temperatura AS Temperatura  FROM  dados_sensor JOIN modeloSensor ON fkModelo = idModelo,
											cliente JOIN modeloSensor ON idCliente = fkCliente where idDados = 2;


-- TABELA DE FUNCIONÁRIOS
create table funcionarios (
idFuncionario int primary key auto_increment,
nome varchar(60) not null,
matricula char(10) unique not null, -- (M202303001)
CPF char(14) not null,
cargo varchar(30) not null,
cargaHorariaSemanal int
) auto_increment = 1;

insert into funcionarios values
(null, 'Gustavo', 'M202301001','234.456.123-20', 'SAC', 30),
(null, 'Kaiky', 'M202301002','243.534.674-24', 'SAC', 30),
(null, 'Vinicius', 'M202301003','987.732.456-48', 'Manutenção TI', 25),
(null,'Samuel','M202301004','675.654.356-08','Manutenção sensor', 15),
(null,'Anna','M202301005','754.657.238-35','Manutenção sensor', 15),
(null,'Guilherme','M202301006','754.132.454-12','Análise Jurídica', 5),
(null,'Renata','M202301007','477.657.765-78','Análise Jurídica', 5),
(null,'João','M202301008','876.455.234-23','TI', 5),
(null,'Fernando','M202301009','876.434.876.24','TI', 5);

-- comandos
desc funcionarios;
select * from funcionarios;
select * from funcionarios where nome like 'G%';
select cargaHorariaSemanal from funcionarios where cargo = 'Manutenção sensor';

