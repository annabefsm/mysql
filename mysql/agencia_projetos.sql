create database agencia;
use agencia;

create table projetos (
idProjeto int (11) not null auto_increment primary key,
titulo varchar (30) not null,
codigo int (50) not null,
tempoDuracao varchar (50) not null,
areaProjeto varchar (100) not null,
instituicao varchar (50) not null,
idAvaliador int (11),
constraint fkAvaliadorProjeto foreign key (idAvaliador) references avaliadores(IdAvaliador)

);
-- ALTER TABLE projetos change titulo titulo varchar (50) not null;
-- drop table projetos;
-- select * from projetos;

create table areas (
idArea int(11) not null auto_increment primary key,
nome varchar (50) not null,
codigo int (50) not null,
descricao text not null,
indice  varchar (50) not null,
 -- como o projeto precisa ter os dados da area,idProjeto é uma foreign key(nao precisa de crase)
 -- entao precisa chamar a constraint:
  idProjeto int (11),
 constraint  fkProjeto foreign key (idProjeto) references projetos(IdProjeto)
);
-- drop table areas; 
create table areasProjetos (
idArea int (11) not null,
idProjeto int (11) not null, 
constraint fkAreasProjetos foreign key (idArea) references areas(IdArea),
constraint fkProjetosAreas foreign key (idProjeto) references projetos(IdProjeto),
constraint idComposta primary key (idArea,idProjeto)
);
create table pesquisadores (
idPesquisador int(11) not null auto_increment primary key,
nome varchar (50) not null,
RG varchar (50) not null,
CPF varchar (50) not null,
sexo varchar (20) not null,
dataNascimento date not null,
grau varchar (50) not null,
instituicao varchar (50) not null
);

create table pesquisadoresProjetos (
idPesquisador int (11) not null,
idProjeto int(11) not null,
constraint  fkPesquisadoresProjetos foreign key (idPesquisador) references pesquisadores(IdPesquisador),
constraint  fkProjetosPesquisadores foreign key (idProjeto) references projetos(IdProjeto),
constraint idComposta primary key (idPesquisador,idProjeto)
);
-- drop table pesquisadoresProjetos;
create table avaliadores (
idAvaliador int (11) not null auto_increment primary key, 
nome varchar (50) not null,
RG varchar (50) not null,
CPF varchar (50) not null,
sexo varchar (20) not null,
dataNascimento date not null,
grau varchar (50) not null,
instituicao varchar (50) not null,
areaProjeto varchar (100) not null
);
create table avaliadoresProjetos (
idAvaliador int (11) not null,
idProjeto int(11) not null,
constraint  fkAvaliadoresProjetos foreign key (idAvaliador) references avaliadores(IdAvaliador),
constraint  fkProjetosAvaliadores foreign key (idProjeto) references projetos(IdProjeto),
constraint idComposta primary key (idAvaliador,idProjeto)
);

insert into pesquisadores (nome, RG , CPF,sexo,dataNascimento,grau,instituicao) values 
  ("Anna Beatriz Mendes", "686834-9", " 052.834.342-23", "Feminino", "1989-04-19", "avançado", "Universidade de Havard"),
  ("João Almeida", "786834-9", " 072.834.342-21", "Masculino"," 1980-02-09", "avançado", "Universidade de Oxford"),
   ("Ryan Augusto", "616234-8", " 052.844.242-09", "Masculino"," 1994-10-01", "avançado", "Universidade de Standford");
   
insert into areas (nome,codigo,descricao,indice) values 
	("Paleontologia",123, "Estudo de fósseis", "40%"),
	("Tecnologia da Informação",1234, "Impactos à sociedade da tecnologia", "60%"),
    (" Reserva de Fauna",12345,"Reserva da fauna", "70%");
   -- update areas set nome = "Reserva de Fauna" where idArea=3;
insert into projetos(titulo,codigo,tempoDuracao,areaProjeto,instituicao, idProjeto) values 
		("Mapeação do Genoma de Dinossauros", 111, " Indertiminado", "Paleontologia", "Universidade de Havard"),
		("Consciência Digital nos anos 2050", 122, " 5 anos", "Tecnologia da Informação", "Universidade de Oxford"),
        ("Medidas de Prevenção para a Extinção de Abelhas", 133, " 4 anos", " Reserva de Fauna", "Universidade de Standford" );
select* from pesquisadores, projetos;
 insert into pesquisadoresProjetos values (1,1), (2,2),(3,3);
 
 insert into areasProjetos values (1,1),(2,2),(3,3);
 select * from areasProjetos;
 select * from pesquisadores, projetos;
 insert into avaliadores(nome,RG,CPF,sexo,dataNascimento,grau,instituicao,areaProjeto) values
						("Amanda dos Santos","7868383 ","032.805.441-12","Feminino", "1980-09-24", "Doutora", "UFU-GO", "Paleontologia"),
                        ("Jhone Rock","1866323 ","022.605.241-12", "Masculino", "1978-10-20", "Doutor", "Oxford", "Tecnologia da Informação"),
                        ("Jack Ruffo","2164583 ","002.305.231.10", "Masculino", "1980-06-10", "Doutor", "Harvard", "Reserva de Fauna");
insert into avaliadoresProjetos values (1,1),(2,2),(3,3);
select * from pesquisadores, projetos, avaliadores;