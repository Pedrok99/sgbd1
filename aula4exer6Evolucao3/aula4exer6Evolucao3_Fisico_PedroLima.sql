-- --------  <<aula4exer6Evolucao3>>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 13/03/2021
-- Autor(es) ..............: Pedro Henrique Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--  
-- Data última alteração:
--    20/03/2021
--     => fazendo correções referentes a evolução
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- ---------------------------------------------------------
CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao3;

USE aula4exer6Evolucao3;

CREATE TABLE PROPRIETARIO (
    cpf VARCHAR(15) NOT NULL,
    nome VARCHAR(40) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    dataNascimento DATE NOT NULL,
    estado VARCHAR(2) NOT NULL,
    bairro VARCHAR(40) NOT NULL,
    cidade VARCHAR(25) NOT NULL,
    rua VARCHAR(40) NOT NULL,
    numero INT NOT NULL
    CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf)
)ENGINE=InnoDB;

CREATE TABLE telefone (
    cpf VARCHAR(15) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO(cpf)   
)ENGINE=InnoDB;

CREATE TABLE CATEGORIA (
    idCategoria INT NOT NULL AUTO_INCREMENT,
    nomeCategoria VARCHAR(25) NOT NULL,
    CONSTRAINT CATEGORIA_PK PRIMARY KEY (idCategoria)
)ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE MODELO (
    idModelo INT NOT NULL AUTO_INCREMENT,
    nomeModelo VARCHAR(25),
    CONSTRAINT MODELO_PK PRIMARY KEY (idModelo)
)ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE VEICULO (
    chassi VARCHAR(25) NOT NULL,
    cor VARCHAR(15) NOT NULL,
    ano INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    idModelo INT,
    idCategoria INT,
    CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
    CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO(cpf),
    CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (idModelo)
    REFERENCES MODELO(idModelo),
    CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (idCategoria)
    REFERENCES CATEGORIA(idCategoria)
)ENGINE=InnoDB;

CREATE TABLE TIPOINFRACAO (
    idTipo INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL,
    valor FLOAT NOT NULL,
    CONSTRAINT TIPOINFRACAO_PK PRIMARY KEY (idTipo)
)ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE AGENTE (
    matricula VARCHAR(25) NOT NULL ,
    nome VARCHAR(40) NOT NULL,
    dataContratacao DATE NOT NULL,
    CONSTRAINT AGENTE_PK PRIMARY KEY (matricula)
)ENGINE=InnoDB;

CREATE TABLE LOCAL (
    codigoLocal INT NOT NULL AUTO_INCREMENT,
    velocidadePermitida INT NOT NULL,
    latitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    CONSTRAINT LOCAL_PK PRIMARY KEY (codigoLocal)
)ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE INFRACAO (
    data DATE NOT NULL,
    hora TIME NOT NULL,
    velocidadeAferida INT NOT NULL,
    idInfracao INT NOT NULL AUTO_INCREMENT,
    placa VARCHAR(10) NOT NULL,
    matricula VARCHAR(25) NOT NULL,
    idTipo INT NOT NULL,
    codigoLocal INT NOT NULL,
    CONSTRAINT INFRACAO_PK PRIMARY KEY (idInfracao),
    CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa)
    REFERENCES VEICULO(placa),
    CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matricula)
    REFERENCES AGENTE(matricula),
    CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (idTipo)
    REFERENCES TIPOINFRACAO(idTipo),
    CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codigoLocal)
    REFERENCES LOCAL(codigoLocal)   
)ENGINE=InnoDB AUTO_INCREMENT=1;
 
