-- --------     << TF3_32_PedroLima_32_PedroLima >>     ------------
--
--                    SCRIPT DE AUTENTICACAO (DDL)
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
USE TF3_32_PedroLima;

-- Usuário representante e dono do banco de dados. 
-- Possui todos os privilégios para manter, atualizar e consultar todo e qualquer registro de todas as tabelas.

CREATE USER 'representante' IDENTIFIED BY 'repress';
GRANT ALL ON TF3_32_PedroLima.* TO 'representante';

-- Usuário funcionário. Trabalha como assistente do representante. 
-- Possui privilégios para consultar em todo o banco de dados, 
-- mas apenas pode inserir e atualizar cadastros de produtos e empresas (clientes e fornecedores).

CREATE USER 'funcionario' IDENTIFIED BY 'func';
GRANT SELECT ON TF3_32_PedroLima.* TO 'funcionario';
GRANT INSERT, UPDATE ON TF3_32_PedroLima.PRODUTO TO 'funcionario';
GRANT INSERT, UPDATE ON TF3_32_PedroLima.EMPRESA TO 'funcionario';
GRANT INSERT, UPDATE ON TF3_32_PedroLima.CLIENTE TO 'funcionario';
GRANT INSERT, UPDATE ON TF3_32_PedroLima.FORNECEDOR TO 'funcionario';

FLUSH PRIVILEGES;