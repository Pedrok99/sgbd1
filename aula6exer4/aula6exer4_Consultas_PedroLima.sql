-- --------  << aula6exer4 >>  ----------
--
--                    SCRIPT DE CONSULTA E VIEW (DML e DDL)
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

-- Mostrar todos empregados de um departamento específico definido pelo usuário;

select empregado.nome, departamento.nome from empregado 
inner join departamento on empregado.matricula = departamento.matricula
where departamento.nome = "RH";

--  Listar todas os departamentos e seus respectivos gerentes, inclusive os departamentos que estiverem momentaneamente sem gerentes, que também deverão ser listados;

select departamento.nome as nomeDepartamento, empregado.nome as nomeGerente from departamento 
left join empregado on empregado.matricula = departamento.matricula;

-- mostrar todos os empregados que nasceram em um intervalo de datas de nascimento definidas pelo usuário no esquema de consulta DE.. ATÉ... (usar nova instrução BETWEEN);

SELECT empregado.nome, empregado.dataNascimento FROM empregado
WHERE empregado.dataNascimento BETWEEN '1970-12-20' AND '2006-01-01';

-- Apresentar quantos empregados estão trabalhando em cada projeto (sem identificar os empregados - mostrar somente a quantidade numérica de empregados, nome do projeto e número que identifica cada projeto).
select count(trabalha.numeroProjeto) as qtdEmpregados, projeto.nome, projeto.numeroProjeto  from empregado 
inner join trabalha on empregado.matricula = trabalha.matricula
inner join projeto on trabalha.numeroProjeto = projeto.numeroProjeto
group by trabalha.numeroProjeto;

-- Mostrar todos os dados dos dependentes consultando por qualquer parte do nome fornecido na pesquisa, além da matrícula funcional e o nome do empregado ao qual este dependente esta associado na empresa.
select dependente.nome, dependente.sexo, dependente.dataNascimento from dependente 
inner join empregado on dependente.matricula = empregado.matricula
where dependente.nome like '%Alves%' or empregado.nome like '%Alves%' or empregado.matricula like '%30223%';
