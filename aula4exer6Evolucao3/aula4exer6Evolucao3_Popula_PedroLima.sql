-- --------  <<aula4exer6Evolucao3>>  ----------
--
--                    SCRIPT DE POPULACAO (DML)
--
-- Data Criacao ...........: 13/03/2021
-- Autor(es) ..............: Pedro Henrique Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--  
-- Data última alteração:
--    20/03/2021
--     => fazendo correções referentes a evolução
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- ---------------------------------------------------------
USE aula4exer6Evolucao3;
--
INSERT INTO PROPRIETARIO(cpf, nome, sexo, dataNascimento, cidade, bairro, estado, rua, numero) VALUES
 ('05377799955', 'Jose Fonseca', 'M', '1950-06-27','Brasilia', '320', 'DF', 'rua jardim das flores', 24 ),
 ('30223154365', 'Gabriella Gomes', 'F', '1976-02-04','Taguatinga',  'rua das margaridas', 'DF', 'rua são pedro', 10),
 ('26351312433', 'Lucas Matos', 'M', '1986-01-02','Paranoa',  '450', 'DF', 'rua são lucas', 13),
 ('54548755877', 'Julio Pereira', 'M', '1974-05-24','Aguas claras',  'cannaa', 'DF', 'rua das dores', 26),
 ('33625537129', 'Ednaldo costa', 'M', '1990-03-10','Ceilandia',  '760', 'DF', 'rua 15', 43),
 ('23144412372', 'Amanda Cardoso Peres', 'F', '1999-10-10','Vincente Pires',  'rua vincentao', 'DF', 'rua avelino costa', 54);
 
INSERT INTO telefone(cpf, telefone) VALUES
('05377799955', '6198514-6322'),
('23144412372', '6199642-3566'),
('26351312433', '6199232-3986'),
('54548755877', '61923-4566'),
('33625537129', '619623-3587'),
('23144412372', '6199842-2553');

INSERT INTO CATEGORIA(nomeCategoria) VALUES
 ('AUTOMOVEL'),
 ('MOTOCICLETA'),
 ('VAN'),
 ('BICICLETA'),
 ('ONIBUS'),
 ('CAMINHAO');

INSERT INTO MODELO(nomeModelo) VALUES
 ('FUSCA FLEX'),
 ('HONDA CIVIC'),
 ('KOMBI TURBO'),
 ('CALOI TWISTER 2 MARCHAS'),
 ('VOLVO FH 540'),
 ('KAWAZAKI CGR99FAN');

INSERT INTO VEICULO(chassi, cor, ano, placa, cpf, idModelo, idCategoria) VALUES
('39v eX3BV3 e3 F53738', 'Branco', 1810, 'NBY-9399', '05377799955', 1, 1),
('6Ah XTrNFN gm NR9202', 'Azul', 2010, 'MWE-9987', '30223154365', 2, 1),
('1XA A4ewCG vY Ey0580', 'Amarelo', 2010, 'BZV-2017', '26351312433', 3, 3),
('8l0 331unn JT kH7074', 'Lilás', 2015, 'FRA-4946', '33625537129', 5, 6),
('6uP 2m8U3T Ad gE2558', 'Pessego', 2000, 'MTU-4203', '26351312433', 4, 4),
('3h7 71pjHJ 23 640538', 'Rosa', '2015', 'HZR-5503', '23144412372', 3, 2);

INSERT INTO TIPOINFRACAO(descricao, valor) VALUES
 ('AVANCAR SINAL', 130.50),
 ('ACIMA DA VELOCIDADE', 255.10),
 ('CONTRA MÃO', 755.10),
 ('ABAIXO DA VELOCIDADE MINIMA', 150.90),
 ('SEM CINTO DE SEGURANÇA', 879.99),
 ('ESTACIONAR EM LOCAL PROIBIDO', 170.19);

INSERT INTO AGENTE (matricula, nome, dataContratacao) VALUES
 ('1801123212','Jorge Silva', '2002-07-03'),
 ('6253232133', 'Marcos Pessanha', '2005-10-19'),
 ('8756631233', 'Laura Florencia', '2010-12-10'),
 ('7454511274', 'Roberto Carlos', '2019-01-01'),
 ('7845454581', 'Marcela Cruz', '1998-03-25'),
 ('8761268947', 'Lucas Cardoso', '2010-10-01');

INSERT INTO LOCAL(velocidadePermitida, latitude, longitude) VALUES
 (80, -30.4899, 131.2257),
 (60, -15.9596, 140.8481),
 (50, -67.0936, 134.4197),
 (120, -77.9580, -164.3870),
 (100, 55.0183, 47.8341),
 (40, -9.1979, 167.0078);

INSERT INTO INFRACAO(data ,hora ,velocidadeAferida , placa , matricula, idTipo, codigoLocal)VALUES
  ('2017-09-16', '03:01:00', 81, 'NBY-9399','6253232133',2,1),
  ('2018-05-03', '19:30:59', 30, 'MWE-9987','6253232133',1,3),
  ('2000-03-12', '05:23:59', 42, 'BZV-2017','8756631233',1,4),
  ('2019-12-23', '17:12:43', 30, 'MTU-4203','7845454581',3,6),
  ('2020-03-03', '08:36:23', 30, 'FRA-4946','6253232133',2,4),
  ('2017-09-16', '00:34:52', 0, 'HZR-5503','1801123212', 3,2);
