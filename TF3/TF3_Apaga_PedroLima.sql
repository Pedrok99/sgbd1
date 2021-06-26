-- --------  << TF3_32_PedroLima >>  ----------
--
--                    SCRIPT DE REMOCAO (DDL)
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

USE TF3_32_PedroLima;

-- Dropando Tabelas
DROP TABLE possui;
DROP TABLE pertence;
DROP TABLE contrata;
DROP TABLE telefoneEmpresa;
DROP TABLE telefoneFuncionario;
DROP TABLE PEDIDO;
DROP TABLE VISITA;
DROP TABLE FUNCIONARIO;
DROP TABLE PRODUTO;
DROP TABLE FORNECEDOR;
DROP TABLE CLIENTE;
DROP TABLE REPRESENTANTE;
DROP TABLE EMPRESA;

-- Dropando Usuários
drop user representante;
drop user funcionario;

-- Dropando views
drop view PEDIDOS_POR_CLIENTE;
