-- --------  << PedroLima >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 06/04/2021
-- Autor(es) ..............: Pedro Henrique Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: PedroLima
--
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS PedroLima;
USE PedroLima;

CREATE TABLE INTERNAUTA (
nome varchar(40) NOT NULL,
dataNasc DATE NOT NULL,
sexo ENUM("M", "F") NOT NULL,
idInternauta int NOT NULL AUTO_INCREMENT,
apelido varchar(15) NOT NULL,
CONSTRAINT INTERNAUTA_PK PRIMARY KEY (idInternauta)
)ENGINE=innoDB AUTO_INCREMENT=1;


CREATE TABLE INTERESSE (
idInteresse int AUTO_INCREMENT NOT NULL,
tipoInteresse ENUM("P","I") NOT NULL,
nomeInteresse varchar(30) NOT NULL,
CONSTRAINT INTERESSE_PK PRIMARY KEY (idInteresse)
)ENGINE=innoDB AUTO_INCREMENT=1;


CREATE TABLE email (
idInternauta int NOT NULL,
email varchar(60) NOT NULL ,
CONSTRAINT email_INTERNAUTA_FK FOREIGN KEY (idInternauta) REFERENCES INTERNAUTA (idInternauta),
CONSTRAINT email_UK UNIQUE (email)
)ENGINE=innoDB;


CREATE TABLE interage (
idInternautaA int,
idInternautaB int,
CONSTRAINT interage_INTERNAUTA_A_FK FOREIGN KEY (idInternautaA) REFERENCES INTERNAUTA (idInternauta),
CONSTRAINT interage_INTERNAUTA_B_FK FOREIGN KEY (idInternautaB) REFERENCES INTERNAUTA (idInternauta)
)ENGINE=innoDB;


CREATE TABLE tem (
idInteresse int,
idInternauta int,
CONSTRAINT tem_INTERESSE_FK FOREIGN KEY (idInteresse) REFERENCES INTERESSE (idInteresse),
CONSTRAINT tem_INTERNAUTA_FK FOREIGN KEY (idInternauta) REFERENCES INTERNAUTA (idInternauta)
)ENGINE=innoDB;