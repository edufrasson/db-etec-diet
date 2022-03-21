drop database etec_diet;

create database etec_diet;
use etec_diet;

create table paciente(
	id int auto_increment,
    nome varchar(60) not null,
    data_nascimento date not null,
    peso double not null,
    altura double not null,
    sexo varchar(1) not null,
    primary key(id)
);

create table categoria_nutriente(
	id int auto_increment,
	descricao varchar(100) not null,
    primary key(id)
);

create table categoria_alimento(
	id int auto_increment,
	descricao varchar(100) not null,
    primary key(id)
);

create table dieta(
	id int auto_increment,
    descricao varchar(100) not null,    
    data_inicio date not null,
    data_fim date not null,
    id_paciente int not null,
    primary key(id),
    foreign key(id_paciente) references paciente(id)
);

create table refeicao(
	id int auto_increment,
    descricao varchar(50) not null,    
    horario varchar(50) not null,
    id_dieta int not null,
    primary key(id),
    foreign key(id_dieta) references dieta(id)
);

create table alimento(
	id int auto_increment,
    nome varchar(100) not null,
    porcao int not null,
    id_categoria_alimento int not null,
    primary key(id),
    foreign key(id_categoria_alimento) references categoria_alimento(id)
);

create table refeicao_alimento_assoc(
	id_refeicao int not null,
    id_alimento int not null,
    quantidade int not null,
    primary key(id_refeicao, id_alimento),
    foreign key(id_refeicao) references refeicao(id),
    foreign key(id_alimento) references alimento(id)
);

create table nutriente(
	id int auto_increment,
    descricao varchar(100) not null,
    quantidade double not null,
    id_alimento int not null, 
    id_categoria_nutriente int not null,
    primary key(id),
    foreign key(id_alimento) references alimento(id),
    foreign key(id_categoria_nutriente) references categoria_nutriente(id)
);