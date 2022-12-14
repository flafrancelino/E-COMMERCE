# E-COMMERCE
Refinando um projeto conceitual de banco de dados.

## Descrição do Desafio

O esquema deverá ser adicionado a um repositório do Github para futura avaliação do desafio de projeto. Adicione ao Readme a descrição do projeto conceitual para fornecer o contexto sobre seu esquema.

## Levantamento de requisitos:

NARRATIVA - PRODUTO
 - Os produtos são vendidos por uma única plataforme online. Contudo, estes podem ter vendedores distintos (terceiros).
 - Cada produto possui um fornecedor.
 - Um ou mais produtos podem compor um pedido.

NARRATIVA - CLIENTE
 - O cliente pode se cadastrar no site com seu CPJ ou CNPJ.
 - O endereço do cliente irá determinar o valor do frete.
 - Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.

NARRATIVA - PEDIDO
 - Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega.
 - Um produto ou mais compõem o pedido.
 - O pedido pode ser cancelado. 

## Objetivo:
Refine o modelo apresentado acrescentando os seguintes pontos:
* Cliente PJ e PF - Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
* Pagamento - Pode ter cadastrado mais de uma forma de pagamento;
* Entrega - Possui status e código de rastreio.

Realize a criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realize a persistência de dados para realização de testes. Especifique ainda queries mais complexas dos que apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:

Recuperações simples com SELECT Statement
Filtros com WHERE Statement
Crie expressões para gerar atributos derivados
Defina ordenações dos dados com ORDER BY
Condições de filtros aos grupos – HAVING Statement
Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
Diretrizes
Não há um mínimo de queries a serem realizadas;
Os tópicos supracitados devem estar presentes nas queries;
Elabore perguntas que podem ser respondidas pelas consultas;
As cláusulas podem estar presentes em mais de uma query;
