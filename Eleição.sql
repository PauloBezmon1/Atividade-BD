CREATE DATABASE eleicao;

USE eleicao;

CREATE TABLE partido(
	pk_cod_partido           INT PRIMARY KEY UNIQUE NOT NULL,
    nome                     VARCHAR(40) UNIQUE NOT NULL,
    sigla                    VARCHAR(5) UNIQUE NOT NULL,
    numero                   INT UNIQUE NOT NULL
);

CREATE TABLE cargo(
	pk_cod_cargo             INT PRIMARY KEY UNIQUE NOT NULL,
    nome_cargo               VARCHAR(30) UNIQUE NOT NULL,
    CHECK(nome_cargo <>'Prefeito' AND nome_cargo <>'Vereador'),
    salario                  float(6,0) NOT NULL DEFAULT 'R$ 17,000,00',
    n_vagas                  INT NOT NULL UNIQUE
);

CREATE TABLE candidato(
	pk_num_candn             INT UNIQUE NOT NULL PRIMARY KEY,
    nome                     VARCHAR(40) UNIQUE NOT NULL,
    fk_cargo                 INT NOT NULL,
    fk_partido               INT NOT NULL,
    FOREIGN KEY(fk_cargo)    REFERENCES cargo(pk_cod_cargo),
    FOREIGN KEY(fk_partido)  REFERENCES partido(pk_cod_partido)
);

CREATE TABLE voto(
	pk_cod_voto              VARCHAR(10) UNIQUE PRIMARY KEY NOT NULL auto_increment,
    fk_num_cand              VARCHAR(6) NOT NULL,
    fk_titulo                VARCHAR(12) UNIQUE NOT NULL,
    FOREIGN KEY(fk_num_cand) REFERENCES candidato(pk_num_candidato),
    FOREIGN KEY(fk_titulo)   REFERENCES eleitor(pk_titulo)
);

CREATE TABLE eleitor(
	pk_titulo               VARCHAR(12) UNIQUE NOT NULL PRIMARY KEY UNIQUE auto_increment,
    nome                    VARCHAR(40) NOT NULL,
    zona                    VARCHAR(40) UNIQUE NOT NULL,
    sessão                  VARCHAR(3)  unique NOT NULL
);