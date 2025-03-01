CREATE DATABASE db_gestao_vendas;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    role ENUM('ADMIN', 'FUNCIONARIO', 'VISUALIZADOR') NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    estoque_minimo INT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE movimentacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    usuario_id INT NOT NULL,
    tipo_movimentacao ENUM('ENTRADA', 'SAIDA') NOT NULL,
    quantidade INT NOT NULL,
    data_movimentacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE logs_acesso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    acao VARCHAR(255) NOT NULL,
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip VARCHAR(45),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL
);
