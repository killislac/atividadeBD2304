CREATE DATABASE bd_videolocadora;
USE bd_videolocadora;

CREATE TABLE cliente (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);


CREATE TABLE filme (
    idFilme INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(100),
    genero VARCHAR(50),
    anoLancamento INT
);


CREATE TABLE locacao (
    idLocacao INT IDENTITY(1,1) PRIMARY KEY,
    idCliente INT,
    idFilme INT,
    dataLocacao DATE,
    valor DECIMAL(5,2),
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (idFilme) REFERENCES filme(idFilme)
);

INSERT INTO cliente (nome, cidade) VALUES
('Carlos Silva', 'São Paulo'),
('Ana Souza', 'Rio de Janeiro'),
('Marcos Lima', 'Belo Horizonte'),
('Fernanda Dias', 'São Paulo'),
('Kamily Lacerda', 'São Bernardo'),
('Anthony Raminelli', 'São Bernardo');

INSERT INTO filme (titulo, genero, anoLancamento) VALUES
('Matrix', 'Ficção Científica', 1999),
('Titanic', 'Romance', 1997),
('Vingadores', 'Ação', 2012),
('Coringa', 'Drama', 2019),
('Interestelar', 'Ficção Científica', 2014),  
('Parasita', 'Suspense', 2019),  
('O Poderoso Chefão', 'Drama', 1972);  

INSERT INTO locacao (idCliente, idFilme, dataLocacao, valor) VALUES

(2, 1, '2023-05-04', 5.00), 
(3, 4, '2023-05-01', 6.50), 
(4, 1, '2023-05-01', 5.00), 
(4, 4, '2023-05-05', 6.50), 

-- Locação para Kamily Lacerda e Anthony Raminelli
(5, 1, '2023-05-02', 5.00), 
(5, 2, '2023-05-03', 4.50),  
(6, 3, '2023-05-02', 6.00),  
(6, 4, '2023-05-04', 6.50), 
(5, 7, '2023-05-06', 5.50); 

SELECT * 
FROM filme;

SELECT * 
FROM cliente 
WHERE cidade = 'São Paulo';

SELECT c.nome AS Cliente, f.titulo AS Filme, l.dataLocacao, l.valor
FROM locacao l
INNER JOIN cliente c ON l.idCliente = c.idCliente
INNER JOIN filme f ON l.idFilme = f.idFilme;

SELECT c.nome AS Cliente, COUNT(l.idLocacao) AS TotalLocacoes
FROM locacao l
INNER JOIN cliente c ON l.idCliente = c.idCliente
GROUP BY c.nome;


SELECT * 
FROM filme
ORDER BY anoLancamento DESC;

SELECT c.nome AS Cliente, COUNT(l.idLocacao) AS TotalLocacoes
FROM locacao l
INNER JOIN cliente c ON l.idCliente = c.idCliente
GROUP BY c.nome
HAVING COUNT(l.idLocacao) > 1;