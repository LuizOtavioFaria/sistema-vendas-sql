-- Criando a tabela de clientes
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Criando a tabela de produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);

-- Criando a tabela de pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Criando a tabela de itens do pedido
CREATE TABLE itens_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Criando a tabela de pagamentos
CREATE TABLE pagamentos (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL,
    valor_pago DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

-- Inserindo valores na tabela de clientes
INSERT INTO clientes (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com'),
('Carlos Santos', 'carlos@email.com');

-- Inserindo valores na tabela de produtos
INSERT INTO produtos (nome, preco) VALUES
('Notebook', 3500.00),
('Smartphone', 2000.00),
('Fone de Ouvido', 150.00);

-- Inserindo valores na tabela de pedidos
INSERT INTO pedidos (cliente_id) VALUES
(1), (2), (3);

-- Inserindo valores na tabela de itens do pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES
(1, 1, 1), -- Pedido 1, Notebook
(2, 2, 2), -- Pedido 2, 2 Smartphones
(3, 3, 3); -- Pedido 3, 3 Fones de Ouvido

-- Inserindo valores na tabela de pagamentos
INSERT INTO pagamentos (pedido_id, valor_pago) VALUES
(1, 3500.00),
(2, 4000.00),
(3, 450.00);

-- Consultando os dados de cada tabela
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM pedidos;
SELECT * FROM itens_pedido;
SELECT * FROM pagamentos;
