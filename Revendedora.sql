create database revendedora;

use revendedora;

create table cliente(
	id_clie        varchar(2) primary key not null unique,
    nome           varchar(15) not null,
    sobrenome      varchar(15) not null,
    telefone       varchar(14) unique not null,
    fk_end_clie    varchar(2) unique not null,
    fk_posse       varchar(11) unique not null,
foreign key(fk_end_clie) references endereco(id_end),
foreign key(fk_posse) references automovel(renavam)
);

create table vendedor(
	id_vendedor         varchar(2) primary key unique not null,
    nome                varchar(15) not null,
    sobrenome           varchar(15) not null,
    telefone            varchar(14) unique not null,
    dat_adm             date not null,
check( dat_adm like '--/--/----'),
	salario             decimal(6,0) not null,
    fk_end_ven          varchar(2) unique not null,
foreign key(fk_end_ven) references endereco(id_end)
);

create table endereco(
	id_end              varchar(2) primary key unique not null,
	cep                 varchar(8) not null,
    rua                 varchar(50) not null,
    numero              int not null,
    complemento         varchar(100),
    bairro              varchar(40) not null,
    cidade              varchar(40) not null,
    estado              varchar(40) not null
);

create table venda(
	id                  varchar(2) primary key unique not null,
    preco               decimal(6,0) not null, 
    data_venda          date,
check(data_venda like '--/--/----'),
	fk_comprador        varchar(2) unique not null,
    fk_vendedor         varchar(2) unique not null,
    fk_auto             varchar(2) unique not null,
foreign key(fk_comprador) references cliente(id_clie),
foreign key(fk_vendedor) references vendedor(id_vendedor),
foreign key(fk_auto) references automovel(renavam)
);

create table automovel(
	renavam             varchar(11)primary key unique not null,
    marca               varchar(12)not null,
    preco               decimal(6,0) not null,
    motor               varchar(40) not null,
    num_portas          int not null,
    combustivel         varchar(10) not null default 'Gasolina',
    placa               varchar(7) not null,
    modelo              varchar(20) not null,
    ano_fab             date not null,
check(ano_fab like '----'),
	ano_mode            date not null,
check(ano_mode like '----'),
	cor                 varchar(20) not null
);