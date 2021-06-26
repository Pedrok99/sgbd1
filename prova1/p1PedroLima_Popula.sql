-- --------  << PedroLima >>  ----------
--
--                    SCRIPT DE POPULACAO (DML)
--
-- Data Criacao ...........: 06/04/2021
-- Autor(es) ..............: Pedro Henrique Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: PedroLima
--  
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
--
-- ---------------------------------------------------------
USE PedroLima;

INSERT INTO INTERNAUTA(nome, dataNasc, sexo, apelido) VALUES
('Pedro Alves Costa', '1984-10-18', 'M', 'PedroA1984'),
('Maria Pinto Cruz', '1987-02-11', 'F', 'M4r14p'),
('Carla Costa de Jesus', '2014-11-23', 'M', 'Carlinha12');

INSERT INTO INTERESSE(tipoInteresse, nomeInteresse) VALUES
('P', 'Artes'),
('P', 'Esportes'),
('P', 'Musica'),
('I', 'Romances');

INSERT INTO email(idInternauta, email) VALUES
(1, 'pedroac@mail.com'),
(2, 'mapintoc@mail.com'),
(3, 'carlinha12@mail.com');

INSERT INTO interage(idInternautaA, idInternautaB) VALUES
(1, 2),
(1, 3),
(2, 3);

INSERT INTO tem(idInteresse, idInternauta) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 3),
(1, 3);
