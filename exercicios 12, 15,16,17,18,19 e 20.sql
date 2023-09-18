create database exercicios;

use exercicios;

-- Exercício 12
create table if not exists countries(
	country_id          int not null primary key unique auto_increment,
    country_name        varchar(35) not null,
    region_id           decimal(10,0) not null unique
);

-- Exercício 15
create table funcionarios(
	employee_id           varchar(2) Primary key Unique not null,
    firt_name             varchar(15) not null,
    last_name             varchar(15) not null,
    email                 varchar(55) not null unique,
    phone_number          varchar(14) not null unique,
    hire_date             date,
    check( hire_date like '--/--/----'),
    salary                decimal(6,0) not null,
    commision             decimal(6,0),
	fk_manager_id            varchar(2) not null unique,
    fk_departament_id        varchar(2) not null unique,
Foreign key(fk_manager_id) References manage(manage_id),
foreign key(fk_departament_id) References departament(departament_id)
);

create table manage(
	manager_id           varchar(2) primary key unique not null
);

create table departament(
	departament_id       varchar(2) primary key unique not null
);


-- Exercício 16
create table funcionarios(
	employee_id           varchar(2) Primary key Unique not null,
    firt_name             varchar(15) not null,
    last_name             varchar(15) not null,
    email                 varchar(55) not null unique,
    phone_number          varchar(14) not null unique,
    hire_date             date,
    check( hire_date like '--/--/----'),
    salary                decimal(6,0) not null,
    commision             decimal(6,0),
	fk_manager_id            varchar(2) not null unique,
    fk_departament_id        varchar(2) not null unique,
    fk_job                varchar(2) not null unique, 
foreign key(fk_manager_id) References manage(manage_id),
foreign key(fk_departament_id) References departamento(departament_id),
foreign key(fk_job) References empregos(job_id)
);
alter table funcionarios add constraint fk_restricao foreign key(fk_departament_id) references departamento(departamento_id);
alter table funcionarios add constraint fk_restricao2 foreign key(fk_job)           references empregos(job_id);


create table manage(
	manager_id           varchar(2) primary key unique not null
);

create table departamento(
	departament_id       varchar(2) primary key unique not null
);

create table empregos(
	job_id          varchar(2) primary key unique not null
);



-- exercicio 17 e 18
create table funcionarios(
	employee_id           varchar(2) Primary key Unique not null,
    firt_name             varchar(15) not null,
    last_name             varchar(15) not null,
    email                 varchar(55) not null unique,
    phone_number          varchar(14) not null unique,
    hire_date             date,
    check( hire_date like '--/--/----'),
    salary                decimal(6,0) not null,
    commision             decimal(6,0),
    fk_job                varchar(2) not null unique, 
foreign key(fk_job) References empregos(job_id)
);
alter table funcionarios add constraint fk_restricao foreign key(fk_job) references empregos(job_id) on update cascade on delete restrict;

create table empregos(
	job_id          varchar(2) primary key unique not null
); 



-- exercicio 19
create table funcionarios(
	employee_id           varchar(2) Primary key Unique not null,
    firt_name             varchar(15) not null,
    last_name             varchar(15) not null,
    email                 varchar(55) not null unique,
    phone_number          varchar(14) not null unique,
    hire_date             date,
    check( hire_date like '--/--/----'),
    salary                decimal(6,0) not null,
    commision             decimal(6,0),
    fk_job                varchar(2) not null unique, 
foreign key(fk_job) References empregos(job_id)
);
alter table funcionarios add constraint fk_restricao foreign key(fk_job) references empregos(job_id) on delete set null;

create table empregos(
	job_id          varchar(2) primary key unique not null
); 

-- exercicio 20
create table funcionarios(
	employee_id           varchar(2) Primary key Unique not null,
    firt_name             varchar(15) not null,
    last_name             varchar(15) not null,
    email                 varchar(55) not null unique,
    phone_number          varchar(14) not null unique,
    hire_date             date,
    check( hire_date like '--/--/----'),
    salary                decimal(6,0) not null,
    commision             decimal(6,0),
    fk_job                varchar(2) not null unique, 
foreign key(fk_job) References empregos(job_id)
);
alter table funcionarios add constraint fk_restricao foreign key(fk_job) references empregos(job_id) on delete no action;

create table empregos(
	job_id          varchar(2) primary key unique not null
); 
