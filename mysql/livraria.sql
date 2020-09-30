create database livraria;
use livraria;

create table autores (
   idAutor int (11) not null auto_increment primary key,
   -- not null para quando é obrigatório  --
   -- unique = usado em texto grande, aceita imagem, mt generico -- 
   -- unique = nao existe mais de um email --
   -- ex: email varchar(11) not null unique  --
   nome varchar(100) not null,
   pseudonomio varchar(100),
   ano date not null,
   pais0rigem varchar (100),
   notaBibliografica text
   -- caso nao queira aplicar a primary key e auto_increment de primeira, pode se utilizar: --
   -- constraint `pkautor` primary key (idAutor) --
);
create table editoras (
    idEditora int (11) not null auto_increment primary key,
	nome varchar(100) not null,
    razaoSocial varchar(100) not null,
    endereco varchar (200) not null
);
create table telefones (
    idTelefone int (11) not null auto_increment primary key,
    codigoPais varchar (7) not null,
	ddd varchar(8) not null,
    telefone varchar(10) not null,
    tipo varchar (100) not null,
    -- como na editora precisa ter os dados de numero,idEditora é uma foreign key(nao precisa de crase) entao precisa chamar a constraint:
    idEditora int (11),
    constraint  fkEditora foreign key (idEditora) references editoras(IdEditora)
);
create table livros (
    idLivro int (11) not null auto_increment primary key,
	titulo varchar(255) not null,
    codigo varchar(100) not null unique,
    idioma varchar (100) not null,
    anoLancamento date not null
);
create table autoresLivros (
    idAutor int (11) not null,
	idLivro int(11) not null,
    constraint  fkAutoresLivros foreign key (idAutor) references autores(IdAutor),
    constraint  fkLivrosAutores foreign key (idLivro) references livros(IdLivro),
    constraint idComposta primary key (idAutor,idLivro)
);
create table edicoes (
    idEdicao int (11) not null  primary key ,
	paginasedicoes int (11) not null,
    isbn varchar(100) not null unique,
    precoVenda double (9,2) not null,
    qtEstoque int(11) not null,
    anoPublicacao int(4) not null,
    idEditora int (11),
    constraint fkEditoraEdicao foreign key (idEditora) references editoras(IdEditora)
);
create table edicoesLivros (
    idEdicao int (11) not null,
	idLivro int(11) not null,
    constraint  fkEdicoesLivros foreign key (idEdicao) references edicoes(IdEdicao),
    constraint  fkLivrosEdicoes foreign key (idLivro) references livros(IdLivro),
    constraint idComposta primary key (idEdicao,idLivro)
);
-- alter altera valores dentro da tabela, mas como ja existia column idEditora nao foi realizado
alter table edicoes add column idEditora int(11) not null;
alter table edicoes add constraint fkEditoraEdicao  foreign key (idEditora) references editoras(IdEEditora);
 -- drop deleta a tabela inteira
drop table edicoes;

insert into autores(nome,pseudonomio,pais0rigem, notaBibliografica,ano)
    values("José de Alencar","top","Brasil","vazio","1980-12-01"),
	      ("Shakespeare","vazio","Inglaterra","vazio","1880-11-04");
     select * from autores;
     select idAutor, nome, pais0rigem from autores where idAutor > 1;

INSERT INTO livros(titulo, codigo , idioma,anoLancamento) 
            VALUES ("Moreninha","001","Portugues","2000-05-01"),
				("Amor","002","Ingles","2000-09-01");
-- livro 1 autor 1				
insert into autoreslivros values(1,1),(2,2);

insert into editoras (nome,razaoSocial,endereco) values ("Letras", "Letras Livros", "Rua das editoras"),
														("Letras", "Letras Livros", "Rua das editoras");

insert into edicoes (paginasedicoes, isbn, precoVenda, qtEstoque, anoPublicacao, idEdicao) values (230, "AAA2", 60,100, 1996, 1);

insert into edicoesLivros values (1,1);

-- ex de atualização update autores set nome = "cecilia meireles" wher idAutor=2;

-- buscar autores que não possuem pseudonomio:
-- select * from autores where pseudonomio is null;

-- buscar o autor mais antigo:
-- select * from autores where order by ano desc;
-- ou
-- select from min(ano), idAutor, nome, pseudonomio  from autores;

-- buscar todos os autores q comecem cm A e nasceram no br:
-- select * from autores where nome like " a%" and PaisOrigem="Brasil";

-- tamanho do nome:
-- select char_length(nome) as tamanho from autores;

insert into telefones (codigoPais, ddd, telefone, tipo, idEditora)  values 
("+55", "(62)", "3230-2222", "fixo", 1), ("+55", "(21)", "3130-2562", "fixo", 2);

-- inner join= faça uma junção com 
-- mostrar telefones e editoras junto:
select* from editoras as e inner join telefones as t on t.idEditora= e.idEditora;

-- view é para economizar tempo e codigo, dps de criado basta dar select com o nome da view criada
-- view para aparecer editoras e seus num:
create view viewEditoras as select e.idEditora,e.nome, e.razaoSocial, e.endereco, t.ddd, t.telefone, t.tipo 
from editoras as e inner join telefones as t on t.idEditora=e.idEditora; 
select* from viewEditoras;
select * from viewEditoras where tipo = "fixo";

-- drop e o nome da view, exclui
-- update viewEditora set nome= "Raimunda" where idEditora=1;

-- criando as junções para criar a view  e selecionando os dados que quero que apareçam 
select e.idEditora, e.nome as NomeEditora,  a.nome, a.pseudonomio,
ed.isbn, ed.anoPublicacao, ed.qtEstoque, l.titulo,l.anoLancamento
from editoras as e inner join edicoes as ed on ed.idEditora= e.idEditora 
 inner join edicoeslivros as el on ed.idEdicao= el.idEdicao
 inner join livros as l on l.idLivro= el.idLivro
 inner join autoreslivros as al on  al.idLivro= l.idLivro 
 inner join autores as a on a.idAutor= al.idAutor;

create view viewEditorasGeral as select e.idEditora, e.nome as NomeEditora,  a.nome, a.pseudonomio,
ed.isbn, ed.anoPublicacao, ed.qtEstoque, l.titulo,l.anoLancamento
from editoras as e inner join edicoes as ed on ed.idEditora= e.idEditora 
 inner join edicoeslivros as el on ed.idEdicao= el.idEdicao
 inner join livros as l on l.idLivro= el.idLivro
 inner join autoreslivros as al on  al.idLivro= l.idLivro 
 inner join autores as a on a.idAutor= al.idAutor;
select * from viewEditorasGeral;



-- trigger
DELIMITER $$ 
create trigger valida_qtde_edicao
before insert on edicoes 
for each row 
begin 
	declare msg varchar (128);
    if(new.qtEstoque <= 0) then
          set new.qtEstoque=null;
          -- para aparecer msg :
          set msg= concat('triggererror: nao é permitido ter o num de estoque igual a zero ou menor q zero: ' , cast(new.qtEstoque as char));
          signal sqlstate '1233' set message_text = msg;
	end if;
end
$$

-- para excluir uma trigger:
-- drop nomedatrigger;
