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

-- Apresentar todos os dados dos médicos de uma determinada especialidade fornecida pelo usuário;
SELECT MEDICO.nomeCompleto, MEDICO.crmNumero, MEDICO.crmEstado, nomeEspecialidade as especialidade FROM MEDICO 
INNER JOIN possui ON MEDICO.crmNumero = possui.crmNumero AND MEDICO.crmEstado = possui.crmEstado 
INNER JOIN ESPECIALIDADE on possui.idEspecialidade = ESPECIALIDADE.idEspecialidade
WHERE ESPECIALIDADE.nomeEspecialidade = "oftalmologia";

-- Consultar paciente(s) por qualquer parte do nome fornecido pelo usuário;
SELECT * FROM PACIENTE where nomeCompleto like '%Fonseca%';

-- Mostrar o médico e o nome do paciente que tiveram consultas em uma data no padrão DE... ATÉ...;
SELECT PACIENTE.nomeCompleto as nomePaciente, MEDICO.nomeCompleto as nomeMedico, consulta.data as dataConsulta FROM consulta
inner join MEDICO on MEDICO.crmEstado = consulta.crmEstado and MEDICO.crmNumero = consulta.crmNumero
inner join PACIENTE on PACIENTE.cpf = consulta.cpf
WHERE consulta.data BETWEEN '2011-12-20' AND '2020-01-01';

-- Pesquisar quantos médicos existem por especialidade.
SELECT count(nomeEspecialidade) as qtdMedicos, nomeEspecialidade as especialidade FROM MEDICO 
INNER JOIN possui ON MEDICO.crmNumero = possui.crmNumero AND MEDICO.crmEstado = possui.crmEstado 
INNER JOIN ESPECIALIDADE on possui.idEspecialidade = ESPECIALIDADE.idEspecialidade
group by especialidade.idEspecialidade;

