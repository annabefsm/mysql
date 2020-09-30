create database academia;
use academia;

create table alunos (
idAluno int (11) not null auto_increment primary key,
 nome varchar (50) not null,
 codMatricula int(50) not null,
 dataMatricula date not null,
 dataNascimento date not null,
 endereco varchar (100) not null,
 telefone varchar (50) not null,
 altura double not null,
 peso double  not null
);

create table turmas (
idTurma int (11) not null auto_increment primary key,
tipoAtiv varchar (100) not null,
numAluno int(50) not null,
dataInicio date not null,
dataFinal date not null,
horario varchar (50) not null,
duracao varchar (50) not null
);
create table instrutores (
idInstrutor int (11) not null auto_increment primary key,
 nome varchar (100) not null,
 RG  varchar (20) not null,
 dataNascimento date not null,
 endereco varchar (100) not null,
 telefone varchar (20) not null,
 telefone2 varchar (20) not null,
 titulacao varchar(50)  not null
);
 
create table instrutoresTurmas (
idInstrutor int(11) not null,
idTurma int (11) not null,
constraint  fkInstrutoresTurmas foreign key (idInstrutor) references instrutores(IdInstrutor),
constraint  fkTurmasInstrutores foreign key (idTurma) references turmas(IdTurma),
constraint idComposta primary key (idInstrutor,idTurma)  
);
create table alunosTurmas (
idAluno int(11) not null,
idTurma int (11) not null,
constraint  fkAlunosTurmas foreign key (idAluno) references alunos(IdAluno),
constraint  fkTurmasAlunos foreign key (idTurma) references turmas(IdTurma),
constraint idComposta primary key (idAluno,idTurma)  
);
insert into alunos (nome,codMatricula,dataMatricula,dataNascimento,endereco,telefone,altura,peso ) values
                    ("José Henrique",123, "2019-11-20","2005-05-15","Rua das Rosas","(62)98115-3424",1.76,78.5 ),
                     ("Betina Carla",124, "2019-11-21","2005-06-11","Rua Alameida Iáiá","(62)98145-1414",1.66,70.5);
                     
insert into turmas ( tipoAtiv,numAluno,dataInicio,dataFinal,horario,duracao) values 
				    ("Educação Física","27","2020-01-10","2020-12-01","8:30","50min"),
                     ("Portugues","27", "2020-01-10","2020-12-23","7:30","50min");
insert into instrutores(nome,RG, dataNascimento, endereco, telefone, telefone2, titulacao) values
				("Bernardo Silva", "787831-2","1990-11-21","Rua da concordia", "(62)3220-1509","(62)98220-3450","Edução Física"),
                ("Patricia Ferreira", "686831-8","1986-09-26","Rua da concordia", "(62)3220-1509","(62)98110-3390","Letras");
                
insert into    instrutoresTurmas values (1,1), (2,2); 
insert into    AlunosTurmas values (1,1),(1,2),(2,1), (2,2); 
select * from alunos,turmas,instrutores;