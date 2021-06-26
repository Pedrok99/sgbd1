A empresa FUI é organizada em departamentos. Cada departamento tem um nome, um número e um empregado que gerencia o departamento. Deve-se saber a data em que um empregado iniciou como gerente de um departamento. Um departamento pode ter diversas localizações. Um departamento controla um número de projetos, cada qual com um nome, um número e uma única localização. São armazenados o nome do empregado, matrícula, endereço (rua, número, bairro), salário, idade, sexo e data de nascimento.

Um empregado está associado a um departamento, mas pode trabalhar em diversos projetos, não necessariamente controlados pelo mesmo departamento. Deve-se saber o número de horas semanais que um empregado trabalha em cada projeto, bem como o supervisor direto de cada empregado. Cada empregado pode possuir vários dependentes, devendo-se saber, para cada dependente, o nome, sexo, data de nascimento e a sua ligação (de dependência) com o empregado.

 => Script de controle que criará dois usuários na base de dados desse exercício seguindo as definições de controle de acesso
abaixo:

* administrador: possui todos os privilégios sobre essa base de dados somente, pois será o DBA para administrar
somente essa base de dados com senha 123admin, podendo repassar seus privilégios para outros usuários desta
base de dados;
* funcionario: possui os privilégios de consulta de dados sobre todas as tabelas desta base de dados, podendo
realizar inserção de dados somente na tabela DEPENDENTE, além da senha usu123;

=> Consultas

A) Mostrar todos empregados de um departamento específico definido pelo usuário, mas nesta evolução como uma VIEW que deve atender as exigências de projeção indicadas no início desta atividade;

B) Listar todas os departamentos e seus respectivos gerentes, inclusive os departamentos que estiverem momentaneamente sem gerentes, que também deverão ser listados;

C) Mostrar todos os empregados que nasceram em um intervalo de datas de nascimento definidas pelo usuário no esquema de consulta DE.. ATÉ... (usar nova instrução BETWEEN);

D) Apresentar quantos empregados estão trabalhando em cada projeto (sem identificar os empregados - mostrar somente a quantidade numérica de empregados, nome do projeto e número que identifica cada projeto).

E) Mostrar todos os dados dos dependentes consultando por qualquer parte do nome fornecido na pesquisa, além da matrícula funcional e o nome do empregado ao qual este dependente esta associado na empresa.