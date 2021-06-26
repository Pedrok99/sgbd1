-- --------     << aula4exer5Evolucao7 >>     ------------
--
--                    SCRIPT DE AUTENTICACAO (DDL)
--
-- Data Criacao ...........: 15/04/2021
-- Autor(es) ..............: Pedro Henrique Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer5Evolucao7
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 		   => 02 Usuarios
-- -----------------------------------------------------------------
USE aula4exer5Evolucao7;

CREATE USER 'dono' IDENTIFIED BY 'dono21';
GRANT ALL ON aula4exer5Evolucao7.* TO 'dono';

CREATE USER 'usuario' IDENTIFIED BY 'usu21';
GRANT SELECT ON aula4exer5Evolucao7.* TO 'usuario';
GRANT INSERT ON aula4exer5Evolucao7.MEDICO TO 'usuario';

FLUSH PRIVILEGES;