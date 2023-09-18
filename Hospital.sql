CREATE DATABASE clinica;

USE clinica;

CREATE TABLE medicos(
	pk_crm                VARCHAR(6) UNIQUE NOT NULL PRIMARY KEY,
    nome                  VARCHAR(40) NOT NULL,
    idade                 INT not null,
    CHECK(idade >= 23),
    especialidade         CHAR(20) NOT NULL DEFAULT 'Ortopedia',
    cpf                   VARCHAR(11) UNIQUE NOT NULL,
    date_adm              DATE not null,
    CHECK(data_adm  LIKE '--/--/----')
);

CREATE TABLE sala(
	pk_num_sala           INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
    CHECK(pk_num_sala >= 1 and pk_num_sala <= 50),
    andar                 INT UNIQUE NOT NULL,
    CHECK(andar <= 12),
    fk_med                INT NOT NULL,
    FOREIGN KEY(fk_med) REFERENCES medicos(pk_crm)
);

CREATE TABLE pacientes(
	pk_rg                 VARCHAR(9) PRIMARY KEY UNIQUE NOT NULL,
    nome                  VARCHAR(40) NOT NULL,
    data_nasc             DATE not null,
    CHECK(data_nasc LIKE '--/--/----'),
    cidade                varchar(30) DEFAULT 'Itabuna' not null,
    doenca                VARCHAR(40) NOT NULL,
    plano_saude           VARCHAR(40) NOT NULL DEFAULT 'SUS'
);

CREATE TABLE funcionarios(
	pk_matricula          VARCHAR(15) PRIMARY KEY NOT NULL UNIQUE,
    nome                  VARCHAR(40) NOT NULL,
    data_nasc             DATE NOT NULL,
    data_adm              DATE NOT NULL,
	cargo                 VARCHAR(40) NOT NULL DEFAULT 'Assistente Médico',
    salary                FLOAT(6,0) NOT NULL DEFAULT 'R$   510,00',
    CHECK(salary >= 510)
);

CREATE TABLE consulta(
	pk_cod_consulta              INT NOT NULL UNIQUE PRIMARY KEY,
    data_horario                 DATETIME,
    fk_crm                       VARCHAR(6) NOT NULL,
    fk_rg                        VARCHAR(9) NOT NULL,
    fk_num_sala                  INT NOT NULL,
    FOREIGN KEY(fk_crm)          REFERENCES medicos(pk_crm),
    FOREIGN KEY(fk_rg)           REFERENCES pacientes(pk_rg),
    FOREIGN KEY(fk_num_sala)     REFERENCES sala(pk_num_sala)
); 