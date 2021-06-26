-- --------     << TF3_32_PedroLima >>     ------------
--
--                    SCRIPT DE CONSULTA E VIEW (DML e DDL)
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

-- Cria uma view que unifica dados relevantes sobre o cliente e seus respectivos pedidos
CREATE OR REPLACE VIEW PEDIDOS_POR_CLIENTE AS
SELECT nomeCliente, CLIENTES.cnpjCliente, dataPedido, codPedido, razaoSocial as nomeFornecedor, cnpjFornecedor  FROM VISITA
INNER JOIN PEDIDO ON VISITA.idVisita = PEDIDO.idVisita
INNER JOIN (SELECT nomeFantasia as nomeCliente, cnpjCliente FROM CLIENTE 
INNER JOIN EMPRESA ON CLIENTE.cnpjCliente = EMPRESA.cnpj) as CLIENTES ON CLIENTES.cnpjCliente = VISITA.cnpjCliente
INNER JOIN EMPRESA ON EMPRESA.cnpj = PEDIDO.cnpjFornecedor;

-- Faz uma consulta de todos os pedidos com base no nome do cliente fornecido. 
-- Devole dados relacionados ao cliente, fornecedor e do pedido em si ordenados pela data do pedido (mais recente para o menos recente)
SELECT nomeCliente, cnpjCliente, dataPedido, PEDIDOS_POR_CLIENTE.codPedido, nomeProduto, quantidade, nomeFornecedor, cnpjFornecedor FROM PEDIDOS_POR_CLIENTE 
INNER JOIN possui ON possui.codPedido = PEDIDOS_POR_CLIENTE.codPedido
INNER JOIN PRODUTO ON PRODUTO.codProduto = possui.codProduto
WHERE nomeCliente LIKE '%lava%' -- Nome Da Loja do cliente
ORDER BY dataPedido DESC; 

-- Procura na base de dados todos os produtos com um determinado nome e os devolve com os
-- dados do fornecedor, nome do produto, preço do produto, estoque atual e a quantidade minima por pedido.
SELECT nomeProduto, preco, estoque, qntMinimaPorPedido, EMPRESA.nomeFantasia as nomeFornecedor, pertence.cnpjFornecedor FROM PRODUTO
INNER JOIN pertence ON pertence.codProduto = PRODUTO.codProduto
INNER JOIN EMPRESA ON EMPRESA.cnpj = pertence.cnpjFornecedor
WHERE nomeProduto LIKE '%coca%'
ORDER BY preco ASC;

