-- --------  << aula6exer4 >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 20/04/2021
-- Autor(es) ..............: Pedro Henrique Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula6exer4
--
--
-- PROJETO => 01 Base de Dados
--         => 07 Tabelas
-- 	       => 02 Usuarios
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS aula6exer4;

USE aula6exer4;

-- TABELAS

CREATE TABLE LOCALIZACAO (
bairro varchar(30) NOT NULL,
numero INTEGER NOT NULL,
rua varchar(30) NOT NULL,
sala INTEGER NOT NULL,
codLocal INTEGER AUTO_INCREMENT,
CONSTRAINT LOCALIZACAO_PK PRIMARY KEY (codLocal)
)ENGINE=innoDB AUTO_INCREMENT = 1;

CREATE TABLE DEPARTAMENTO (
nome varchar(30) NOT NULL,
numeroDepartamento INTEGER NOT NULL AUTO_INCREMENT,
matricula INTEGER,
dataInicioGerente DATE,
codLocal INTEGER NOT NULL,
CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY (numeroDepartamento),
CONSTRAINT DEPARTAMENTO_LOCALIZACAO_FK FOREIGN KEY (codLocal) 
REFERENCES LOCALIZACAO (codLocal) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=innoDB AUTO_INCREMENT = 1;


CREATE TABLE EMPREGADO (
matricula INTEGER NOT NULL,
nome varchar(30) NOT NULL,
salario FLOAT NOT NULL,
dataNascimento DATE NOT NULL,
sexo ENUM("m", "h") NOT NULL,
rua varchar(30) NOT NULL,
numero INTEGER NOT NULL,
bairro varchar(30) NOT NULL,
numeroDepartamento INTEGER,
CONSTRAINT EMPREGADO_PK PRIMARY KEY (matricula),
CONSTRAINT EMPREGADO_DEPARTAMENTO_FK FOREIGN KEY (numeroDepartamento) 
REFERENCES DEPARTAMENTO (numeroDepartamento) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=innoDB;


CREATE TABLE PROJETO (
nome varchar(30) NOT NULL,
numeroProjeto INTEGER NOT NULL auto_increment,
numeroDepartamento INTEGER NOT NULL,
codLocal INTEGER NOT NULL,
CONSTRAINT PROJETO_PK PRIMARY KEY (numeroProjeto),
CONSTRAINT PROJETO_DEPARTAMENTO_FK FOREIGN KEY (numeroDepartamento) 
REFERENCES DEPARTAMENTO (numeroDepartamento) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT PROJETO_LOCALIZACAO_FK FOREIGN KEY (codLocal) 
REFERENCES LOCALIZACAO (codLocal) ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=innoDB auto_increment = 1;


CREATE TABLE DEPENDENTE (
nome varchar(30) NOT NULL,
sexo ENUM("m", "h") NOT NULL,
dataNascimento DATE NOT NULL,
ligacao varchar(30) NOT NULL,
idDependente INTEGER AUTO_INCREMENT,
matricula INTEGER NOT NULL,
CONSTRAINT DEPENDENTE_PK PRIMARY KEY (idDependente),
CONSTRAINT DEPENDENTE_EMPREGADO_FK FOREIGN KEY (matricula) 
REFERENCES EMPREGADO (matricula) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=innoDB AUTO_INCREMENT = 1;


CREATE TABLE supervisiona (
matriculaSupervisor INTEGER NOT NULL,
matriculaSupervisionado INTEGER NOT NULL ,
CONSTRAINT supervisiona_EMPREGADOA_FK FOREIGN KEY (matriculaSupervisor) 
REFERENCES EMPREGADO (matricula) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT supervisiona_EMPREGADOB_FK FOREIGN KEY (matriculaSupervisionado) 
REFERENCES EMPREGADO (matricula) ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=innoDB;

CREATE TABLE trabalha (
matricula INTEGER NOT NULL,
numeroProjeto INTEGER NOT NULL,
horasSemanais INTEGER NOT NULL,
CONSTRAINT trabalha_EMPREGADO_FK FOREIGN KEY (matricula) 
REFERENCES EMPREGADO (matricula) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY (numeroProjeto) 
REFERENCES PROJETO (numeroProjeto) ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=innoDB;

-- N??o ?? poss??vel criar a tabela departamento ou empregado, independente da ordem, visto que uma depende da outra
 
ALTER TABLE DEPARTAMENTO
    ADD CONSTRAINT DEPARTAMENTO_EMPREGADO_FK
    FOREIGN KEY (matricula)
    REFERENCES EMPREGADO (matricula)
	ON DELETE CASCADE ON UPDATE CASCADE;
    