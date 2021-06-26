-- --------  << aula6exer4 >>  ----------
--
--                    SCRIPT DE POPULACAO (DML)
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

INSERT INTO LOCALIZACAO (bairro, numero, rua, sala) VALUES
('São Francisco', 3, 'Travessa Um', 23),
('Senador', 26, 'Rua Itumbiara', 2),
('Boa Vista', 1, 'Travessa Ferreira Leite', 3),
('IAPI', 12, '7ª Travessa Floresta', 6);

INSERT INTO DEPARTAMENTO (nome, codLocal, dataInicioGerente, matricula) VALUES
('gerencia', 1, null, null),
('Núcleo de T.I', 2, NULL, NULL),
('Administração e Finanças', 3, NULL, NULL),
('RH', 4, NULL, NULL),
('Gestão Processual', 3, NULL, NULL);

INSERT INTO EMPREGADO(numeroDepartamento, matricula, salario, nome, dataNascimento, sexo, rua, numero, bairro) VALUES
 (1, 05377, 799955.2, 'Ana Fonseca', '1980-05-23', 'm',  'rua do manjericao', 22, 'jardim florido'),
 (2, 30223, 154365.3, 'Gabriella Gomes Cabral', '1976-02-04', 'm', 'rua das margaridas', 10, 'morumbi'),
 (4, 05373, 759915.8, 'Matheus Fonseca', '1950-06-27', 'h', 'rua alberto praga', 22, 'santo antonio'),
 (3, 23144, 412372.2, 'Amanda Cardoso Peres', '1999-10-10','m', '12 de abril',  35, 'vincentao'),
 (3, 01257, 491806.1, 'Pedro Rodrigues', '2006-01-16','h', 'alfredo cornelio', 12,'jacaranda verde') ,
 (2, 88974, 934752.9, 'Ana Alves', '2008-08-04','m','paulo algusto',30, 'martirio') ,
 (1, 44085, 537784.0, 'Henrique Alves', '1992-03-01','h','algusta', 23, 'colgos');

INSERT INTO PROJETO(nome, numeroDepartamento, codLocal) VALUES
 ('obracerta', 3, 2),
 ('doarti', 2, 3),
 ('guardioes da saude', 1, 4),
 ('show do bau', 1, 1);

INSERT INTO DEPENDENTE(nome, sexo, dataNascimento, ligacao, matricula) VALUES
('Henrique Rodrigues','h',  '1997-01-12', 'filho', 30223) ,
('Pedro da Cunha','h', '1986-04-17', 'tio', 23144) ,
('Raimundo Melo','h', '2007-05-01', 'pai', 88974) ,
('Raimunda Alves','m', '1984-10-22', 'mãe', 01257) ;

INSERT INTO supervisiona(matriculaSupervisor, matriculaSupervisionado) VALUES
(05377, 30223),
(30223, 05373),
(30223, 23144),
(05373, 44085);
 
INSERT INTO trabalha(matricula, numeroProjeto, horasSemanais) VALUES
(05377, 1, 5),
(30223, 3, 3),
(30223, 4, 7),
(05373, 2, 6);

-- adicionando gerentes
UPDATE DEPARTAMENTO SET DEPARTAMENTO.dataInicioGerente = '2010-12-23', DEPARTAMENTO.matricula = '05377' WHERE DEPARTAMENTO.numeroDepartamento = 1;
UPDATE DEPARTAMENTO SET DEPARTAMENTO.dataInicioGerente = '2000-02-11', DEPARTAMENTO.matricula = '30223' WHERE DEPARTAMENTO.numeroDepartamento = 2;
UPDATE DEPARTAMENTO SET DEPARTAMENTO.dataInicioGerente = '1994-03-12', DEPARTAMENTO.matricula = '23144' WHERE DEPARTAMENTO.numeroDepartamento = 3;
UPDATE DEPARTAMENTO SET DEPARTAMENTO.dataInicioGerente = '2017-09-26', DEPARTAMENTO.matricula = '05373' WHERE DEPARTAMENTO.numeroDepartamento = 4;