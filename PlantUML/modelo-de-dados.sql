-- Tabela para Usuários (Operador e Administrador)
CREATE TABLE usuarios (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    login VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    tipo_usuario VARCHAR(20) NOT NULL -- 'OPERADOR' ou 'ADMIN'
);

-- Tabela para Tarifas
CREATE TABLE tarifas (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    valor_por_hora DECIMAL(10, 2) NOT NULL,
    data_vigencia DATE NOT NULL
);

-- Tabela para Vagas
CREATE TABLE vagas (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    status VARCHAR(20) NOT NULL -- 'LIVRE' ou 'OCUPADA'
);

-- Tabela para Veículos
CREATE TABLE veiculos (
    placa VARCHAR(10) PRIMARY KEY,
    modelo VARCHAR(100)
);

-- Tabela principal de Tickets (Movimentação)
CREATE TABLE tickets (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    hora_entrada DATETIME NOT NULL,
    hora_saida DATETIME NULL,
    valor_total DECIMAL(10, 2) NULL,
    estado VARCHAR(20) NOT NULL, -- 'ABERTO', 'FECHADO', 'CANCELADO'
    
    -- Chaves Estrangeiras
    veiculo_placa VARCHAR(10),
    vaga_id BIGINT,
    usuario_id BIGINT,
    
    FOREIGN KEY (veiculo_placa) REFERENCES veiculos(placa),
    FOREIGN KEY (vaga_id) REFERENCES vagas(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
