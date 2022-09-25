-- Criando o banco de dados Ecommerce
CREATE DATABASE ECOMMERCE;

-- Habilitando o banco para uso
USE ECOMMERCE;

--Criando as tabelas
CREATE TABLE Endereco (
Rua VARCHAR(30),
Bairro VARCHAR(30),
Estado VARCHAR(15),
Pais VARCHAR(15),
CEP VARCHAR(10),
Id_Endereco INTEGER PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Pessoa_Fisica (
Id_ClientePF INTEGER PRIMARY KEY AUTO_INCREMENT,
Nome_Cliente VARCHAR(30),
Data_Nascimento DATETIME,
CPF VARCHAR(10),
Id_Cliente INTEGER
);

CREATE TABLE Pessoa_Juridica (
Id_ClientePJ INTEGER PRIMARY KEY AUTO_INCREMENT,
Nome_Cliente VARCHAR(30),
Data_Nascimento DATETIME,
CNPJ VARCHAR(10),
Id_Cliente INTEGER
);

CREATE TABLE Fornecedor (
Razao_Social VARCHAR(45),
CNPJ VARCHAR(10),
Id_Fornecedor INTEGER PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Vendedor_Terceiro (
Id_Vendedor_Terceiro INTEGER PRIMARY KEY AUTO_INCREMENT,
Razao_Social_Vendedor VARCHAR(10),
Local_Vendedor_Terceiro VARCHAR(20),
CNPJ_Vendedor VARCHAR(10)
);

CREATE TABLE Produto (
Id_Produto INTEGER PRIMARY KEY AUTO_INCREMENT,
Descricao_Produto VARCHAR(45),
Valor_Produto DECIMAL(10),
Categoria_Produto VARCHAR(45)
);

CREATE TABLE Cliente (
Id_Cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
Id_Endereco INTEGER,
FOREIGN KEY(Id_Endereco) REFERENCES Endereco (Id_Endereco)
);

CREATE TABLE Estoque (
Local_Estoque VARCHAR(45),
Id_Estoque INTEGER PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Pagamento (
Id_Pagamento INTEGER PRIMARY KEY AUTO_INCREMENT,
Tipo_Pagamento VARCHAR(10),
Data_Compra VARCHAR(10),
Confirmar_Cancelar_Pagamento VARCHAR(10),
Id_Cliente INTEGER,
FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)
);

CREATE TABLE Pedido (
Id_Pedido INTEGER PRIMARY KEY AUTO_INCREMENT,
Status_Pedido INTEGER,
Descricao_Pedido VARCHAR(10),
Frete DECIMAL(10),
Cod_Rastreio VARCHAR(10),
Confirmar_Cancelar_Pedido VARCHAR(10),
Id_Cliente INTEGER,
FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)
);

CREATE TABLE Requer (
Id_Produto INTEGER,
Id_Pedido INTEGER,
FOREIGN KEY(Id_Produto) REFERENCES Produto (Id_Produto),
FOREIGN KEY(Id_Pedido) REFERENCES Pedido (Id_Pedido)
);

CREATE TABLE Fornece (
Id_Fornecedor INTEGER,
Id_Produto INTEGER,
FOREIGN KEY(Id_Fornecedor) REFERENCES Fornecedor (Id_Fornecedor),
FOREIGN KEY(Id_Produto) REFERENCES Produto (Id_Produto)
);

CREATE TABLE Vende (
Id_Produto INTEGER,
Id_Vendedor_Terceiro INTEGER,
FOREIGN KEY(Id_Produto) REFERENCES Produto (Id_Produto),
FOREIGN KEY(Id_Vendedor_Terceiro) REFERENCES Vendedor_Terceiro (Id_Vendedor_Terceiro)
);

CREATE TABLE Contem (
Id_Estoque INTEGER,
Id_Produto INTEGER,
FOREIGN KEY(Id_Estoque) REFERENCES Estoque (Id_Estoque),
FOREIGN KEY(Id_Produto) REFERENCES Produto (Id_Produto)
);

-- Alerando as tabelas para adicionar as foreigns keys
ALTER TABLE Pessoa_Fisica ADD FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente);
ALTER TABLE Pessoa_Juridica ADD FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente);

-- Inserindo dados na tabela endereco:
INSERT INTO ENDERECO VALUES ('Rua 1', 'Asa Sul', 'DF', 'Brasil', '72345-439', NULL),
                            ('Rua 23', 'Asa Norte', 'DF', 'Brasil', '72345-459', NULL),
                            ('Rua 2', 'Recanto das Flores', 'DF', 'Brasil', '72345-126', NULL),
                            ('Rua 231', 'Sobradinho', 'DF', 'Brasil', '72322-002', NULL),
                            ('Rua 5', 'Bandeiras', 'DF', 'Brasil', '72445-439', NULL);
INSERT INTO ENDERECO VALUES ('Rua 7', 'Sucupira', 'DF', 'Brasil', '724225-039', NULL);

-- Inserindo dados na tabela cliente:
INSERT INTO CLIENTE VALUES (NULL, 1),
                            (NULL, 2),
                            (NULL, 3),
                            (NULL, 4),
                            (NULL, 5);
INSERT INTO CLIENTE VALUES (NULL, 1);


-- Inserindo dados na tabela pessoa_fisica:
INSERT INTO PESSOA_FISICA VALUES (NULL, 'Ana Beatriz', '1994-07-06 09:00:00', '0398498219', 1),
                                 (NULL, 'Maria Alice', '1993-05-05 19:23:00', '0348233545', 2),
                                 (NULL, 'Jorge Antonio', '1990-04-19 13:00:00', '0183693219', 3),
                                 (NULL, 'Joao Otavio', '1954-07-06 06:40:00', '1235491235', 4),
                                 (NULL, 'Camila Silva', '1992-10-13 10:30:40', '0499433874', 5);

-- Inserindo dados na tabela pessoa_juridica:
INSERT INTO PESSOA_JURIDICA VALUES (NULL, 'Flavia Leite', '1994-07-06 09:40:00', '0332298219', 1);

-- Inserindo dados na tabela fornecedor:
INSERT INTO FORNECEDOR VALUES ( 'Brasmedica LTDA', '123456789', NULL),
                              ( 'Alpha LTDA', '987654321', NULL),
                              ( 'Girassol LTDA', '123099089', NULL),
                              ( 'Caramujo Embalagem LTDA', '333356789', NULL),
                              ( 'Joao da esquina LTDA', '666675789', NULL),
                              ( 'Skol LTDA', '127777789', NULL);
                              
-- Inserindo dados na tabela vendedor_terceiro:
INSERT INTO VENDEDOR_TERCEIRO VALUES (NULL, 'Barbados', 'Brasilia', '1010101010'),
                            (NULL, 'TEND TUDO', 'Goias', '2020202020'),
                            (NULL, 'Entregador', 'Goiania', '3030303030');
                              
-- Inserindo dados na tabela produto:
INSERT INTO PRODUTO VALUES (NULL, 'Caldo de cana', 10.00, 'Bebida'),
                           (NULL, 'Paste', 7.00, 'Comida'),
                           (NULL, 'Refrigerante', 8.00, 'Bebida'),
                           (NULL, 'Suco', 10.00, 'Bebida'),
                           (NULL, 'Agulha', 23.00, 'Acessorio'),
                           (NULL, 'Pinça', 100.00, 'Acessorio'),
                           (NULL, 'Tesoura sutura', 43.00, 'Acessorio');

-- Inserindo dados na tabela estoque:
INSERT INTO ESTOQUE VALUES ('Santa Maria', NULL),
                           ('SIA', NULL),
                           ('CD CENTRAL', NULL),
                           ('CD LOCAL', NULL);

-- Inserindo dados na tabela pagamento:
INSERT INTO PAGAMENTO VALUES (NULL, 'Credito', '2022-09-09', 'Confirma', 1),
                             (NULL, 'Credito', '2022-09-09', 'Confirma', 2),
                             (NULL, 'Debito', '2022-09-09', 'Confirma', 3),
                             (NULL, 'Dinheiro', '2022-09-09', 'Confirma', 4),
                             (NULL, 'Dinheiro', '2022-09-09', 'Confirma', 5);

-- Inserindo dados na tabela pedido:
INSERT INTO PEDIDO VALUES (NULL, 1, 'Bebida', 100, 123, 'Confirma', 1),
                          (NULL, 1, 'Acessorio', 120, 2344, 'Confirma', 2),
                          (NULL, 2, 'Acessorio', 140, 423, 'Confirma', 3);

-- Inserindo dados na tabela VENDE:
INSERT INTO VENDE VALUES (1, 1),
                          (1, 2),
                          (2, 1),
                          (7, 2);

-- Inserindo dados na tabela FORNECE:
INSERT INTO FORNECE VALUES (6, 3),
                          (4, 4),
                          (1, 7),
                          (5, 6);

-- Inserindo dados na tabela CONTEM:
INSERT INTO CONTEM VALUES (1, 6),
                          (1, 5),
                          (2, 1),
                          (2, 2);

-- Inserindo dados na tabela REQUER:
INSERT INTO REQUER VALUES (3, 1),
                          (4, 1),
                          (7, 2),
                          (6, 2);

 -- SELECT:
SELECT Id_Produto, Descricao_Produto, Valor_Produto, Categoria_Produto
FROM PRODUTO; 



-- SELECT com WHERE:
SELECT Id_Produto, Descricao_Produto, Valor_Produto
FROM PRODUTO
WHERE Categoria_Produto = 'Bebida';

-- ORDER BY:
SELECT Id_Produto, Descricao_Produto, Valor_Produto, Categoria_Produto 
FROM PRODUTO
ORDER BY Valor_Produto;

-- JUNÇÃO: 
SELECT Endereco.Rua, Endereco.Bairro, Endereco.Estado, Endereco.Id_Endereco, Cliente.Id_Endereco
FROM Endereco
INNER JOIN Cliente
ON Cliente.Id_Endereco  = Endereco.Id_Endereco;


            