-- --------  << aula6exer4 >>  ----------
--
--                    SCRIPT DE AUTENTICACAO (DDL)
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

CREATE USER 'administrador' IDENTIFIED BY '123admin';
GRANT ALL ON aula6exer4.* TO 'administrador';

CREATE USER 'funcionario' IDENTIFIED BY 'usu123';
GRANT SELECT ON aula6exer4.* TO 'funcionario';
GRANT INSERT ON aula6exer4.DEPENDENTE TO 'funcionario';

FLUSH PRIVILEGES;