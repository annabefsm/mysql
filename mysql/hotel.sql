create database hotel;

 use hotel;
 
 create table clientes (
 idCliente int (11) not null auto_increment primary key,
 nome varchar (100) not null,
 RG varchar (30) not null,
 CPF varchar (30) not null,
 endereco varchar (100) not null,
 email varchar (50) not null, 
 telefone varchar (50) not null,
 telefone2 varchar (50) not null
 );
 alter table clientes add column sexo varchar (30) not null;
 
 create table quartos (
 idQuarto int (11) not null auto_increment primary key,
 numero int (100) not null,
 andar int(100) not null,
 tipo varchar (100) not null,
 descricao varchar (100) not null, 
 preco varchar (100) not null
 );
 
 create table reservas (
 idReserva int (11) not null auto_increment primary key,
 dataEntrada date not  null,
 dataSaida date not null,
 idQuarto int (11) null,
 constraint fkQuartosReservas foreign key (idQuarto) references quartos(IdQuarto)
 );
 drop table reservas;
 
 create table servicos (
 idServico int (11) not null auto_increment primary key,
 codigo varchar (100) not null,
 tipo varchar (100) not null, 
 descricao varchar (100) not null,
 precoTotal varchar (100) not null
 );
 drop table servicos;
 
 create table clientesQuartos (
 idCliente int (11) not null,
 idQuarto int (11) not null,
 constraint  fkClientesQuartos foreign key (idCliente) references clientes(IdCliente),
constraint  fkQuartosClientes foreign key (idQuarto) references quartos(IdQuarto),
constraint idComposta primary key (idCliente,idQuarto)
 );
 
 create table servicosClientes (
 idServico int (11) not null,
 idCliente int (11) not null, 
 constraint  fkServicosClientes foreign key (idServico) references servicos(IdServico),
 constraint  fkClientesServicos foreign key (idCliente) references clientes(IdCliente),
 constraint idComposta primary key (idServico, idCliente)
 );
 
 create table reservasClientes (
 idReserva int (11) not null,
 idCliente int (11) not null, 
 constraint  fkReservasClientes foreign key (idReserva) references reservas(IdReserva),
 constraint  fkClientesReservas foreign key (idCliente) references clientes(IdCliente),
 constraint idComposta primary key (idReserva, idCliente)
 );

insert into clientes (nome,RG,CPF,endereco,email, telefone,telefone2, sexo) values 
		  ("Marcos da silva", "56566831-2", "021.831.241-22", "Rua da Conversa","marcos.silva@gmail.com","(62)98220-4050", "vazio","homem"),
          ("Maria Fernanda", "26516811-2", "001.831.201-09", "Rua da Onça","maria.fernanda@hotmail.com","(62)98115-3929","vazio","mulher");
          
  insert into quartos (numero,andar,tipo,descricao,preco) values    
                       (301,3,"Quarto de família","Quarto de no max 3:uma cama de casal, uma cama de solteiro, frigobar, atendimento 24h", "R$ 100,00"),
                       (507,5,"Quarto de casal", "Quarto de no max 2:uma cama de casal, frigobar, atendimento 24h, vista para o parque, banheira", "R$ 120,00");
                       
 insert into clientesQuartos values (1,1), (2,2);   
 
 insert reservas (dataEntrada,dataSaida, idQuarto) values ("2020-09-01","2020-09-10",1),
                                                           ("2020-09-02","2020-09-05",2);
                                                           
insert into reservasClientes values (1,1),(2,2);

insert into servicos (codigo, tipo, descricao, precoTotal) values 
(123,"água extra"," 2x agua de R$5,00", "R$ 10,00"),
(1234,"água extra, cerveja Brahma Puro Malte, janta para um"," 2x agua de R$5,00, 30x cerveja BPM R$ 3,50, 3x Janta R$ 15,00", "R$ 160,00 ");

insert into servicosClientes values (1,1), (2,2);