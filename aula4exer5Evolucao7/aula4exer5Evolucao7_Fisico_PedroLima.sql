-- --------  << aula4exer5Evolucao7 >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 15/03/2021
-- Autor(es) ..............: Pedro Henrique Vieria
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer5Evolucao7
--
--  Data última alteração:
--    26/03/2021
--     => fazendo correções referentes a evolução
--    15/04/2021
--     => Adicionando on delete e on cascade
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 		   => 02 Usuarios
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
    IF NOT EXISTS aula4exer5Evolucao7;

USE aula4exer5Evolucao7;

-- TABELAS

CREATE TABLE MEDICO (
    nomeCompleto VARCHAR(40) NOT NULL,
    crmNumero VARCHAR(10) NOT NULL,
    crmEstado VARCHAR(2) NOT NULL,
    CONSTRAINT MEDICO_PK PRIMARY KEY (crmNumero, crmEstado)
)ENGINE = InnoDB;

CREATE TABLE ESPECIALIDADE (
    idEspecialidade INTEGER NOT NULL AUTO_INCREMENT,
    nomeEspecialidade VARCHAR(40) NOT NULL,
    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PACIENTE (
    cpf VARCHAR(15) NOT NULL,
    nomeCompleto VARCHAR(40) NOT NULL,
    dtNascimento DATE NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    rua VARCHAR(40),
    numero INTEGER NOT NULL,
    bairro VARCHAR(15) NOT NULL,
    complemento VARCHAR(40) NOT NULL,
    cidade VARCHAR(15) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    CONSTRAINT PACIENTE_PK PRIMARY KEY (cpf)
)ENGINE = InnoDB;

CREATE TABLE CONSULTA (
    data DATE NOT NULL,
    idConsulta INTEGER AUTO_INCREMENT,
    hora TIME NOT NULL,
    crmNumero VARCHAR(10) NOT NULL,
    crmEstado VARCHAR(2) NOT NULL,
    cpf VARCHAR(15),
    CONSTRAINT CONSULTA_PK PRIMARY KEY (idConsulta),
    CONSTRAINT CONSULTA_MEDICO_FK FOREIGN KEY (crmNumero, crmEstado)
    REFERENCES MEDICO (crmNumero, crmEstado) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY (cpf)
    REFERENCES PACIENTE (cpf) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE RECEITA (
    idReceita INTEGER AUTO_INCREMENT,
    recomendacao VARCHAR(255),
    dataEmissao DATE NOT NULL,
    posologia VARCHAR(255),
    idConsulta INTEGER NOT NULL, 
    CONSTRAINT RECEITA_PK PRIMARY KEY (idReceita),
    CONSTRAINT RECEITA_CONSULTA_FK FOREIGN KEY (idConsulta)
    REFERENCES CONSULTA (idConsulta) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MEDICAMENTO (
    principioAtivo VARCHAR(40) NOT NULL,
    idMedicamento INTEGER AUTO_INCREMENT,
    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (idMedicamento)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE telefone (
    cpfPaciente VARCHAR(15) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (cpfPaciente)
    REFERENCES PACIENTE (cpf) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE contem (
    idReceita INTEGER NOT NULL,
    idMedicamento INTEGER NOT NULL,
    CONSTRAINT contem_RECEITA_FK FOREIGN KEY (idReceita) 
    REFERENCES RECEITA(idReceita) ON DELETE CASCADE,
    CONSTRAINT contem_MEDICAMENTO_FK FOREIGN KEY (idMedicamento) 
    REFERENCES MEDICAMENTO(idMedicamento) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB;

CREATE TABLE possui (
    idEspecialidade INTEGER NOT NULL,
    crmNumero VARCHAR(40) NOT NULL,
    crmEstado VARCHAR(2) NOT NULL,
    CONSTRAINT possui_MEDICO_FK FOREIGN KEY (crmNumero, crmEstado)
    REFERENCES MEDICO (crmNumero, crmEstado) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade)
    REFERENCES ESPECIALIDADE (idEspecialidade) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB;
 