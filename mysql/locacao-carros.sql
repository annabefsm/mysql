create database locacaoCarros;
use locacaoCarros;

create table clientes (
idCliente int (11) not null auto_increment primary key,
nome varchar (100) not null,
RG varchar (30) not null,
CPF varchar (30) not null,
CNH varchar (30) not null,
endereco varchar (100) not null,
dataNascimento date not null
);

create table carros (
idCarro int (11) not null auto_increment primary key,
chassi varchar (30) not null,
placa varchar (20) not null,
modelo varchar (50) not null,
cor varchar (30) not null,
anoModelo varchar (20) not null,
anoFabricacao varchar (20) not null
);

create table categorias (
idCategoria int (11) not null auto_increment primary key,
codigo int (20) not null,
nomeCategoria varchar (50) not null,
precoDiaria varchar (100) not null,
descricao text not null
);

create table historicos (
idHistorico int (11) not null auto_increment primary key,
descricao text not null,
nomeOficina varchar (50) not null,
valorServico varchar (50) not null,
dataManutencao date not null
);

create table controles(
idControle int (11) not null auto_increment primary key,
dataLocacao date not null,
horaLocacao varchar (30) not null,
dataDevolucao date not null,
horaDevolucao varchar (30) not null,
idCarro int (11) not null,
constraint fkCarrosControles foreign key (idCarro) references carros(IdCarro)
);
-- drop table controles;


create table controlesClientes (
idControle int (11) not null, 
idCliente int (11) not null,
constraint fkControlesClientes foreign key (idControle) references controles (idControle),
 constraint  fkClientesControles foreign key (idCliente) references clientes(IdCliente)
);

create table clientesCarros (
idCliente int (11) not null,
idCarro int (11) not null,
constraint  fkClientesCarros foreign key (idCliente) references clientes(IdCliente),
constraint  fkCarrosClientes foreign key (idCarro) references carros(IdCarro),
constraint idComposta primary key (idCliente,idCarro)
);

create table historicosCarros (
idHistorico int (11) not null,
idCarro int (11) not null,
constraint  fkHistoricosCarros foreign key (idHistorico) references historicos(IdHistorico),
constraint  fkCarrosHistoricos foreign key (idCarro) references carros(IdCarro),
constraint idComposta primary key (idHistorico,idCarro)
);

create table categoriasCarros (
idCategoria int (11) not null,
idCarro int (11) not null,
constraint  fkCategoriasCarros foreign key (idCategoria) references categorias(IdCategoria),
constraint  fkCarrosCategorias foreign key (idCarro) references carros(IdCarro),
constraint idComposta primary key (idCategoria,idCarro)
);

insert into clientes (nome,RG,CPF,CNH,endereco,dataNascimento) values 
		  ("Carlos Antônio", "56566831-2", "021.831.241-22", "1234", "Rua da Conversa","1980-03-01"),
          ("Maria Lourdes", "56516811-2", "001.831.201-09", "123", "Rua da Onça","1988-01-11");
          
insert into carros (chassi,placa,modelo,cor,anoModelo,anoFabricacao) values 
		  ( "56566", "PDF-1231","VW Gol", "Branco","2014","1985"),
          ( "523412", "OBJ-0411","Onix","Preto","2017","1998");
          
insert into categorias (codigo,nomeCategoria,precoDiaria,descricao) values 
		  ( 7741, "Segunda classe","R$ 70,50", "vazio"),
          ( 8982, "Segunda classe","R$ 100,00","vazio");
          
insert into controles (dataLocacao, horaLocacao,dataDevolucao, horaDevolucao, idCarro) values 
                              ("2020-01-09","14h", "2020-01-29", "12h",1),
                              ("2020-03-19","18:30", "2020-04-29", "11h",2);
          
insert into historicos (descricao,nomeOficina,valorServico,dataManutencao) values 
                    ("amassado na lataria e etc", "Oficina do Bebeto","R$ 400,00" "2016-04-12"),
                    ("resfriador", "Oficina do Joãozinho","R$ 600,00" "2013-07-02");
                    
insert into categoriasCarros   values (1,1), (2,2);                  
	
insert into clientesCarros   values (1,1), (2,2);

insert into controlesClientes   values (2,1), (1,2);

insert into historicosCarros values (1,2) , (2,1);

