Uma clínica médica está preocupada com o receituário que seus médicos estão passando para cada paciente e lhe contratou para elaborar uma base de dados que permita ao coordenador da clínica acompanhar estas receitas médicas fornecidas aos pacientes, evitando possíveis enganos. Cada médico precisa ser cadastrado com seu CRM (número de inscrição do médico no Conselho Regional de Medicina, que é estadual), nome completo e especialidade clínica, enquanto os pacientes serão registrados no banco de dados com nome completo, idade, sexo, telefone(s) e o endereço residencial (só um endereço). A possível prescrição média, contida na receita fornecida pelo médico após uma consulta na clínica, deverá conter a data de emissão e o(s) medicamento(s) receitado(s).

=> Script de controle que criará dois usuários na base de dados desse exercício seguindo as definições de controle de acesso abaixo:

* dono: possui todos os privilégios sobre essa base de dados somente, pois será o DBA para administrar somente essa base de dados com senha dono21;
* usuario: possui os privilégios de consulta de dados sobre todas as tabelas desta base de dados, podendo realizar inserção de dados somente na tabela MEDICO, além da senha usu21;

=> Consultas

A) Apresentar todos os dados dos médicos de uma determinada especialidade fornecida pelo usuário;

B) Consultar paciente(s) por qualquer parte do nome fornecido pelo usuário;

C) Mostrar o médico e o nome do paciente que tiveram consultas em uma data no padrão DE... ATÉ...;

D) Pesquisar quantos médicos existem por especialidade.
