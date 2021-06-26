-- --------  << TF3_32_PedroLima >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 08/05/2021
-- Autor(es) ..............: Pedro Henrique Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF3_32_PedroLima
--
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas
--         => 02 Usuarios
--         => 01 Visao
-- -----------------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS TF3_32_PedroLima;

USE TF3_32_PedroLima;

-- TABELAS

CREATE TABLE EMPRESA (   
cnpj BIGINT NOT NULL,
complemento VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,     
uf VARCHAR(2) NOT NULL,
bairro VARCHAR(100) NOT NULL,
numero INT NOT NULL,
razaoSocial VARCHAR(100) NOT NULL,
inscricaoEstadual BIGINT NOT NULL,
nomeFantasia VARCHAR(100) NOT NULL,
CONSTRAINT EMPRESA_UK_razaoSocial UNIQUE (razaoSocial),
CONSTRAINT EMPRESA_UK UNIQUE (uf, nomeFantasia, inscricaoEstadual),
CONSTRAINT EMPRESA_PK PRIMARY KEY (cnpj)
)ENGINE=innoDB;


CREATE TABLE REPRESENTANTE (
nomeCompleto VARCHAR(50) NOT NULL,
core BIGINT NOT NULL,
nadaConsta ENUM("CONSTA", "NAO CONSTA") NOT NULL,
cpf BIGINT NOT NULL,
cnpjRepresentante BIGINT NOT NULL,
CONSTRAINT REPRESENTANTE_UK_core UNIQUE (core),
CONSTRAINT REPRESENTANTE_UK_cpf UNIQUE (cpf),
CONSTRAINT REPRESENTANTE_PK PRIMARY KEY (cnpjRepresentante),
CONSTRAINT REPRESENTANTE_EMPRESA_FK FOREIGN KEY (cnpjRepresentante) 
    REFERENCES EMPRESA (cnpj)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE=innoDB;


CREATE TABLE CLIENTE (
devedor ENUM("SIM","NAO") NOT NULL,
dataIngresso DATE NOT NULL,
cnpjCliente BIGINT NOT NULL,
CONSTRAINT CLIENTE_PK PRIMARY KEY (cnpjCliente),
CONSTRAINT CLIENTE_EMPRESA_FK FOREIGN KEY (cnpjCliente) 
    REFERENCES EMPRESA (cnpj)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE=innoDB;


CREATE TABLE FORNECEDOR (
valorMinimoPorPedido BIGINT NOT NULL,
exclusivo ENUM("SIM","NAO") NOT NULL,
cnpjFornecedor BIGINT NOT NULL,
CONSTRAINT FORNECEDOR_PK PRIMARY KEY (cnpjFornecedor),
CONSTRAINT FORNECEDOR_EMPRESA_FK FOREIGN KEY (cnpjFornecedor) 
    REFERENCES EMPRESA (cnpj)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE=innoDB;


CREATE TABLE PRODUTO (
nomeProduto VARCHAR(100) NOT NULL,
qntMinimaPorPedido INT NOT NULL,
codProduto INT NOT NULL AUTO_INCREMENT,
CONSTRAINT PRODUTO_PK PRIMARY KEY (codProduto)
)ENGINE=innoDB AUTO_INCREMENT = 1;


CREATE TABLE FUNCIONARIO (
dataNascimento DATE NOT NULL,
carteiraDeTrabalho BIGINT NOT NULL,
nadaConsta ENUM("CONSTA", "NAO CONSTA") NOT NULL,
nome VARCHAR(100) NOT NULL,
bairro VARCHAR(100) NOT NULL,
complemento VARCHAR(100) NOT NULL,
numero INT NOT NULL,
uf VARCHAR(2) NOT NULL,
cidade VARCHAR(100) NOT NULL,
cpf BIGINT NOT NULL,
cnpjRepresentante BIGINT NOT NULL,
CONSTRAINT FUNCIONARIO_UK UNIQUE (carteiraDeTrabalho),
CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (cpf),
CONSTRAINT FUNCIONARIO_REPRESENTANTE_FK FOREIGN KEY (cnpjRepresentante) 
    REFERENCES REPRESENTANTE (cnpjRepresentante)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
)ENGINE=innoDB;

CREATE TABLE VISITA (
    idVisita INT AUTO_INCREMENT NOT NULL,
    descricao VARCHAR(500),
    dataVisita DATE NOT NULL,
    cnpjRepresentante BIGINT NOT NULL,
    cnpjCliente BIGINT NOT NULL,
    CONSTRAINT VISITA_PK PRIMARY KEY (idVisita),
    CONSTRAINT VISITA_REPRESENTANTE_FK FOREIGN KEY (cnpjRepresentante)
        REFERENCES REPRESENTANTE (cnpjRepresentante)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT VISITA_CLIENTE_FK FOREIGN KEY (cnpjCliente)
        REFERENCES CLIENTE (cnpjCliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)ENGINE=innoDB AUTO_INCREMENT = 1;

CREATE TABLE PEDIDO (
observacao VARCHAR(300),
dataPedido DATE NOT NULL,
codPedido INT NOT NULL AUTO_INCREMENT,
dataEntrega DATE NOT NULL,
qntParcelas INT NOT NULL,
statusPagamento ENUM("Pago", "Nao Pago") NOT NULL,
formaPagamento ENUM("A VISTA","A PRAZO") NOT NULL,
cnpjFornecedor BIGINT NOT NULL,
idVisita INT NOT NULL,
CONSTRAINT PEDIDO_PK PRIMARY KEY (codPedido),
CONSTRAINT PEDIDO_FORNECEDOR_FK FOREIGN KEY (cnpjFornecedor) 
    REFERENCES FORNECEDOR (cnpjFornecedor)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT PEDIDO_VISITA_FK FOREIGN KEY (idVisita) 
    REFERENCES VISITA (idVisita)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE=innoDB AUTO_INCREMENT = 1;


CREATE TABLE telefoneFuncionario (
cpfFuncionario BIGINT NOT NULL,
telefone BIGINT NOT NULL,
CONSTRAINT telefone_UK UNIQUE (telefone),
CONSTRAINT telefone_FUNCIONARIO_FK FOREIGN KEY (cpfFuncionario) 
    REFERENCES FUNCIONARIO (cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE=innoDB;

CREATE TABLE telefoneEmpresa (
cnpjEmpresa BIGINT NOT NULL,
telefone BIGINT NOT NULL,
CONSTRAINT telefone_UK UNIQUE (telefone),
CONSTRAINT telefone_EMPRESA_FK FOREIGN KEY (cnpjEmpresa) 
    REFERENCES EMPRESA (cnpj)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE=innoDB;


CREATE TABLE contrata (
cnpjFornecedor BIGINT NOT NULL,
cnpjRepresentante BIGINT NOT NULL,
dataContratacao DATE NOT NULL,
comissao FLOAT NOT NULL,
salario FLOAT NOT NULL,
tipoPagamento ENUM("LIQUIDEZ", "NO PEDIDO") NOT NULL,
CONSTRAINT contrata_FORNECEDOR_FK FOREIGN KEY (cnpjFornecedor) 
    REFERENCES FORNECEDOR (cnpjFornecedor)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT contrata_REPRESENTANTE_FK FOREIGN KEY (cnpjRepresentante) 
    REFERENCES REPRESENTANTE (cnpjRepresentante)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE=innoDB;


CREATE TABLE pertence (
cnpjFornecedor BIGINT NOT NULL,
codProduto INT NOT NULL,
preco FLOAT NOT NULL,
estoque INT NOT NULL,
CONSTRAINT pertence_FORNECEDOR_FK FOREIGN KEY (cnpjFornecedor) 
    REFERENCES FORNECEDOR (cnpjFornecedor)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT pertence_PRODUTO_FK FOREIGN KEY (codProduto) 
    REFERENCES PRODUTO (codProduto)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE=innoDB;


CREATE TABLE possui (
codProduto INT NOT NULL,
codPedido INT NOT NULL,
quantidade INT NOT NULL,
desconto FLOAT NOT NULL,
CONSTRAINT possui_PRODUTO_FK FOREIGN KEY (codProduto) 
    REFERENCES PRODUTO (codProduto)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
CONSTRAINT possui_PEDIDO_FK FOREIGN KEY (codPedido) 
    REFERENCES PEDIDO (codPedido)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)ENGINE=innoDB;
