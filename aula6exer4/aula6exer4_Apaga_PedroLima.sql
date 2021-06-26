-- --------  << aula6exer4 >>  ----------
--
--                    SCRIPT DE REMOCAO (DDL)
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
USE aula6exer4;

DROP TABLE trabalha;
DROP TABLE supervisiona;
DROP TABLE DEPENDENTE;
DROP TABLE PROJETO;
ALTER TABLE DEPARTAMENTO DROP FOREIGN KEY DEPARTAMENTO_EMPREGADO_FK;
DROP TABLE EMPREGADO;
DROP TABLE DEPARTAMENTO;
DROP TABLE LOCALIZACAO;
DROP USER 'funcionario';
DROP USER 'administrador';