-- --------  << TF3_32_PedroLima >>  ----------
--
--                    SCRIPT DE POPULACAO (DML)
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

USE TF3_32_PedroLima;

INSERT INTO EMPRESA (cnpj, razaoSocial, nomeFantasia, inscricaoEstadual, cidade, uf, complemento, bairro, numero) VALUES
(76723402000186, 'Noah e Andrea Contábil ME', 'Contabilidade N e A', 1117005295930, 'Contagem', 'MG', 'Rua Leonora Marcelina Ferreira', 'Borba Gato', 154),
(30357200000167, 'Sara e Alice Comercio de Bebidas Ltda', 'Comercio de Bebidas SA', 0718142300150, 'Brasília', 'DF', 'Quadra EQNM 38/40 Bloco A', 'Taguatinga Norte (Taguatinga)', 134),
(83020093000143, 'Liz e Luís Padaria ME', 'Padaria LL', 0780852600170, 'Brasília', 'DF', 'Quadra QS 8 Conjunto 220D', 'Areal (Águas Claras)', 504),

(41259191000198, 'Matheus e Marina Entregas Expressas ME', 'Entregas Expressas ME', 452454098246, 'Bebedouro', 'SP', 'Rua Doutor Manoel Joaquim dos Reis', 'Parque Residencial Eldorado', 891),
(93482719000197, 'Benjamin e Juliana Eletrônica Ltda', 'BJ Eletronica', 972191663214, 'Osasco', 'SP', 'Rua Treze de Outubro', 'Bussocaba', 786),
(86851981000104, 'Kamilly e Anthony Financeira Ltda', 'KA Financeira', 130058185, 'Macapá', 'AP', 'Passagem Jardin America', 'Marabaixo', 200),

(86416706000154, 'Jennifer e Yago Calçados Ltda', 'Jennifer e Yago Calçados', 0763255500184, 'Brasília', 'DF', 'Condomínio Privê II Quadra 1 Conjunto K', 'Setor de Mansões do Lago Norte', 152),
(81721364000162, 'Bruna e Laura Filmagens ME', 'BL Filmagens', 0760990000166, 'Brasília', 'DF', 'Quadra SHIS QI 26 Conjunto 7', 'Setor de Habitações Individuais Sul', 714),
(19573219000108, 'Débora e Sophia Esportes ME', 'Materiais esportivos SD', 0260355955942, 'Pará de Minas', 'MG', 'Rua Luiz Porfírio de Oliveira', 'Recanto da Lagoa', 132), 

(04723113000176, 'Analu e Murilo Padaria Ltda', 'Analu Padaria', 103796622, 'Anápolis', 'GO', 'Rua dos Pina', 'Jardim Calixto', 251),
(61801640000195, 'Bruna e Mirella Buffet ME', 'Buffet BM', 102006733, 'Goiânia', 'GO', 'Rua São José', 'Jardim Dom Fernando II', 931),

(90007882000100, 'Otávio e Raimunda Lavanderia ME', 'Raimundinha LavaLava', 114069131, 'Rio Verde', 'GO', 'Rua Mariana', 'Vila Rocha', 146),
(33833852000119, 'Jéssica e Alice Informática Ltda', 'Infotech', 03123402110, 'Cuiabá', 'MT', 'Rua Princesa Isabel', 'Altos da Serra I', 178),

(64190629000124, 'Vicente e Carla Adega Ltda', 'Adega VC', 09436536262, 'Sinop', 'MT', 'Rua João de Marco', 'Setor Industrial', 983),
(34013242000131, 'Levi e Leandro Padaria Ltda', 'Padaria LL', 80857022316, 'Cuiabá', 'MT', 'Travessa Afonso Penna', 'Despraiado', 310);


INSERT INTO REPRESENTANTE (nomeCompleto, core, nadaConsta, cpf, cnpjRepresentante) VALUES
('Liz Augusto da Silva', 2841254, 'NAO CONSTA', 56313235320, 83020093000143),
('Sara Isabelly Gabrielly Aparício', 1564151, 'NAO CONSTA', 79281284545, 30357200000167),
('Noah Rosa Sales', 3232589, 'NAO CONSTA', 76345471909, 76723402000186),
('Analu Costa Soares', 3212543, 'CONSTA', 26639730090, 04723113000176),
('Bruna Fernandes Valadares', 6556872, 'NAO CONSTA', 33875509013, 61801640000195);

INSERT INTO CLIENTE (devedor, dataIngresso, cnpjCliente) VALUES
('SIM', '2020-10-03', 41259191000198),
('NAO', '2001-03-12', 93482719000197),
('NAO', '1998-07-26', 86851981000104),
('SIM', '2017-10-13', 90007882000100),
('NAO', '2021-03-12', 33833852000119);

INSERT INTO FORNECEDOR (exclusivo, valorMinimoPorPedido, cnpjFornecedor) VALUES
('NAO', 1300,   86416706000154),
('SIM',   200,  81721364000162),
('NAO', 499.99, 19573219000108),
('NAO', 2500,   64190629000124),
('NAO', 1320.50,  34013242000131);

INSERT INTO PRODUTO (nomeProduto, qntMinimaPorPedido) VALUES
('Tenis esportivo', 10),
('Camera tekPix', 30),
('Passagem ida e volta floripa', 5),
('Coca-cola Lata 350ml', 100),
('Enroladinho de queijo', 100);

INSERT INTO FUNCIONARIO (dataNascimento, carteiraDeTrabalho, nadaConsta, nome, bairro, complemento, numero, uf , cidade, cpf, cnpjRepresentante) VALUES
('1998-12-12', 38814938504, 'NAO CONSTA', 'Alberto Pereira Pinto', 'Novo Estrela', 'Travessa José Alberto Cruz', 10,'PA', 'Castanhal', 22502171814, 76723402000186),
('1970-10-02', 47568427226, 'CONSTA', 'Mateus José Otávio Souza', 'Ponta de Matos', 'Rua Nelson Souto Maior Rosas', 22, 'PB', 'Cabedelo', 09324679465, 30357200000167),
('1983-03-22', 94650182381, 'NAO CONSTA', 'Filipe Carlos Eduardo Tiago da Cunha', 'Campina de Icoaraci (Icoaraci)', 'Rua Joaquim Resende', 599, 'PA', 'Belém', 17913737123, 83020093000143),
('1997-03-02', 63680246973, 'NAO CONSTA', 'Antônia Aline da Luz', 'Setor São José', 'Rua A', 424, 'GO', 'Goiânia', 54992284183, 04723113000176),
('1997-11-04', 08789508112, 'NAO CONSTA', 'Vanessa Manuela Débora Souza', 'Parque Calixtópolis', 'Rua Túlio Siqueira', 123,'GO', 'Anápolis', 15888279170, 61801640000195 );

INSERT INTO VISITA (descricao, dataVisita, cnpjCliente, cnpjRepresentante) VALUES
('Cliente vendeu 90% do estoque', '2012-01-09',93482719000197, 83020093000143),
('Cliente não vendeu nada', '2012-09-12', 41259191000198, 83020093000143),
('Cliente está com extrema falta de estoque', '2020-12-01', 86851981000104, 30357200000167),
(null, '2015-12-12', 90007882000100, 04723113000176),
(null, '2011-10-25', 33833852000119, 61801640000195);

INSERT INTO PEDIDO (observacao, dataPedido, dataEntrega, qntParcelas, statusPagamento, formaPagamento, cnpjFornecedor, idVisita) VALUES
('Todos na cor vermelha', '2020-10-03', '2020-11-15',1 , 'Pago', 'A VISTA',  86416706000154, 1),
('Ligar antes da entrega', '2017-10-25', '2017-12-03', 3, 'Nao Pago', 'A PRAZO', 81721364000162, 2),
(null, '2020-01-07', '2020-03-25', 12, 'Pago', 'A PRAZO',  19573219000108, 3),
('Cuidado extra no transporte', '2015-12-12', '2016-01-10', 1, 'Pago', 'A VISTA', 64190629000124, 4),
(null, '2011-10-25', '2011-12-25', 3, 'Pago', 'A PRAZO', 34013242000131,5);

INSERT INTO telefoneFuncionario (cpfFuncionario, telefone) VALUES
(22502171814, 9125751744),
(09324679465, 3326227877),
(17913737123, 6399272446),
(54992284183, 4544445121),
(15888279170, 5484751577);

INSERT INTO telefoneEmpresa (cnpjEmpresa, telefone) VALUES
(76723402000186, 55170691744),
(30357200000167, 39752759692),
(83020093000143, 42754762008),
(41259191000198, 41195583459),
(93482719000197, 67746962161),
(86851981000104, 56963600115),
(86416706000154, 75453294219),
(81721364000162, 25396773513),
(19573219000108, 34986891517),
(04723113000176, 11323476316),
(61801640000195, 39295556941),
(90007882000100, 20479268639),
(33833852000119, 84621386655),
(64190629000124, 11792983844),
(34013242000131, 84928408799);

INSERT INTO contrata (cnpjFornecedor, cnpjRepresentante, dataContratacao, comissao, salario, tipoPagamento) VALUES
(86416706000154, 83020093000143, '2015-03-02', 0.02, 1800.50, 'LIQUIDEZ'),
(81721364000162, 30357200000167, '2010-05-25', 0.015, 1905.25, 'NO PEDIDO'),
(19573219000108, 76723402000186, '2019-12-17', 0.01, 2300, 'NO PEDIDO'),
(64190629000124, 04723113000176, '2020-01-10', 0.25, 800, 'NO PEDIDO'),
(34013242000131, 61801640000195, '2019-09-09', 1, 0, 'LIQUIDEZ');

INSERT INTO pertence (cnpjFornecedor, codProduto, preco, estoque) VALUES
(86416706000154, 3, 200, 40),
(81721364000162, 2, 79.90, 300),
(19573219000108, 1, 69.99, 450),
(64190629000124, 4, 10, 500),
(34013242000131, 5, 1.50, 1000);

INSERT INTO possui (codProduto, codPedido, quantidade, desconto) VALUES
(1, 1, 10, 0.05),
(2, 2, 45, 0.1),
(3, 3, 6, 0),
(4, 4, 150, 0),
(5, 5, 200, 0);
