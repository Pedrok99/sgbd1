-- --------  <<aula4exer5Evolucao7>>  ----------
--
--                    SCRIPT DE POPULACAO (DML)
--
-- Data Criacao ...........: 20/03/2021
-- Autor(es) ..............: Pedro Henrique Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer5Evolucao7
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 		   => 02 Usuarios
-- ---------------------------------------------------------
USE aula4exer5Evolucao7;
--
INSERT INTO MEDICO (nomeCompleto, crmNumero, crmEstado) VALUES
 ('Jose Fonseca', '82631', 'df'),
 ('Gabriella Gomes Cabral', '8123', 'ac'),
 ('Lucas Leonardo Castro', '76123', 'ba'),
 ('Caio Castro', '32412', 'go'),
 ('Alexandre Peres', '78325', 'ms'),
 ('Ludmila Leal', '51135', 'pe'),
 ('Rodrigo Fagundes', '85375', 'rn');

INSERT INTO ESPECIALIDADE(nomeEspecialidade) VALUES
('cardiologia'),
('pediatria'),
('geriatria'),
('dermatologia'),
('oftalmologia'),
('infectologia'),
('Oncologia');

INSERT INTO PACIENTE(cpf, nomeCompleto, dtNascimento, sexo, rua, numero, bairro, complemento, cidade, estado, cep) VALUES
 ('05377799955', 'Ana Fonseca', '1980-05-23', 'M',  'rua do manjericao', 22, 'jardim florido', 'perto do mercado', 'Paranoa', 'ac', '72862123'),
 ('30223154365', 'Gabriella Gomes Cabral', '1976-02-04', 'F', 'rua das margaridas', 10, 'morumbi', 'ao lado do salão','Taguatinga', 'df',  '63526133'),
 ('05373759915', 'Matheus Fonseca', '1950-06-27', 'M', 'rua alberto praga', 22, 'santo antonio', 'perto da drogaria', 'samamba', 'df', '72253123'),
 ('23144412372', 'Amanda Cardoso Peres', '1999-10-10','F', '12 de abril',  35, 'vincentao', 'na esquina', 'Vincente Pires', 'ba', '76546125' ),
 ('01257491806', 'Pedro Rodrigues', '2006-01-16','F', 'alfredo cornelio', 12,'jacaranda verde','portao branco','aleluia','ba', '68721873') ,
 ('88974934752', 'Ana Alves', '2008-08-04','F','paulo algusto',30, 'martirio', 'perto do bar','lapa', 'rn', '76991697') ,
 ('44085537784', 'Henrique Alves', '1992-03-01','M','algusta', 23, 'colgos', 'ponta da rua', 'amargos', 'rj', '93566379');

INSERT INTO CONSULTA(data, hora, crmNumero, crmEstado, cpf) VALUES
 ('2021-06-15','13:01:00','82631', 'df', '05377799955'),
 ('2021-03-05','14:13:00','78325', 'ms', '05373759915'),
 ('2020-12-23','17:30:30','76123', 'ba', '30223154365'),
 ('2010-10-13','16:35:30','32412', 'go', '88974934752'),
 ('2015-11-25','13:38:30','51135', 'pe', '44085537784'),
 ('2018-03-19','12:45:30','85375', 'rn', '01257491806'),
 ('2017-01-01','08:30:30','8123', 'ac', '23144412372');

INSERT INTO RECEITA (recomendacao, dataEmissao , posologia , idConsulta) VALUES
 ('Repouso e agua','2021-06-15', '2 comprimidos a cada 6 horas', 1),
 ('Repouso', '2020-12-23', '4 capsulas por dia', 3),
 ('cortar carboidratos', '2020-01-01', 'misturar com agua e tomar a noite', 4),
 ('Tratamento medicado', '2018-03-19', '2 comprimidos a cada 3 horas', 6),
 ('Menos sal na comida', '2015-11-25', '2 litros por dia', 5),
 ('Repouso com exercicios pela manha', '2017-01-01', 'aplicar na região a cada 6 horas', 7),
 ('evitar exercicios','2021-03-05', 'aplicar sobre a ferida', 2);

INSERT INTO MEDICAMENTO (principioAtivo) VALUES
 ('Abacavir'),
 ('Famotidina'),
 ('Haloperidol'),
 ('Gabapentina'),
 ('Baricitinibe'),
 ('Empagliflozina'),
 ('Basiliximabe');

INSERT INTO telefone (cpfPaciente, telefone) VALUES
 ('05377799955', '99446-9827'),
 ('30223154365', '969013-6164'),
 ('05373759915', '975489-5421'),
 ('23144412372', '915757-6639'),
 ('01257491806', '923651-3123'),
 ('88974934752', '962534-5641'),
 ('44085537784', '951265-5410');

INSERT INTO contem (idReceita, idMedicamento) VALUES
 (1, 3),
 (2, 4),
 (3, 2),
 (5, 5),
 (6, 7),
 (7, 6),
 (4, 1);

INSERT INTO possui (idEspecialidade, crmNumero, crmEstado) VALUES
(3,'82631', 'df'),
(4,'82631', 'df'),
(7,'76123', 'ba'),
(1,'32412', 'go'),
(2,'51135', 'pe'),
(5,'85375', 'rn'),
(6,'8123', 'ac');
