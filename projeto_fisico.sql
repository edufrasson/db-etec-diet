create database db_etec_diet;
use db_etec_diet;

create table paciente(
	id int auto_increment,
    nome varchar(60),
    data_nascimento date,
    peso double,
    altura double,
    sexo varchar(1),
    primary key(id)
);

create table categoria_nutriente(
	id int auto_increment,
	descricao varchar(100),
    primary key(id)
);

create table categoria_alimento(
	id int auto_increment,
	descricao varchar(100),
    primary key(id)
);

create table dieta(
	id int auto_increment,
    descricao varchar(100),    
    data_inicio date,
    data_fim date,
    id_paciente int,
    primary key(id),
    foreign key(id_paciente) references paciente(id)
);

create table refeicao(
	id int auto_increment,
    descricao varchar(50),    
    horario varchar(50),
    id_dieta int,
    primary key(id),
    foreign key(id_dieta) references dieta(id)
);

create table alimento(
	id int auto_increment,
    nome varchar(100),
    porcao int,
    id_categoria_alimento int,
    primary key(id),
    foreign key(id_categoria_alimento) references categoria_alimento(id)
);

create table refeicao_alimento_assoc(
	id_refeicao int,
    id_alimento int,
    primary key(id_refeicao, id_alimento),
    foreign key(id_refeicao) references refeicao(id),
    foreign key(id_alimento) references alimento(id)
);

create table nutriente(
	id int auto_increment,
    quantidade int,
    id_alimento int,
    id_categoria_nutriente int,
    primary key(id),
    foreign key(id_alimento) references alimento(id),
    foreign key(id_categoria_nutriente) references categoria_nutriente(id)
);