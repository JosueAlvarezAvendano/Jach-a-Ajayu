-- SCRIPT DO BANDO DE DADOS - JACH1A AJAYU

-- Criando o Database Jach'a Ajayu
CREATE DATABASE jacha_ajayu;
USE jacha_ajayu;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	sobrenome VARCHAR(45),
	email VARCHAR(60),
	senha VARCHAR(20)
);

CREATE TABLE Quiz (
	idQuiz INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    descricao VARCHAR(200),
    qtdQuestoes INT
);

CREATE TABLE tentativa (
	idTentativa INT,
    fkUsuario INT,
    CONSTRAINT fkUsuarioTentativa
		FOREIGN KEY (fkUsuario) 
			REFERENCES usuario(idUsuario),
    fkQuiz INT,
    CONSTRAINT fkQuizTentativa
		FOREIGN KEY (fkQuiz)
			REFERENCES quiz(idQuiz),
	CONSTRAINT fkComposta
		PRIMARY KEY ( idTentativa, fkUsuario, fkQuiz),
	qtdAcertos INT,
    qtdErros INT,
    porcentagem DECIMAL(4,3),
    dtTentativa DATETIME DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO quiz (idQuiz, nome, descricao, qtdQuestoes) VALUES
	(1, 'Conhecendo o Folclore', 'Quiz sobre elementos do folclore boliviano.', 12);
    
INSERT INTO usuario (nome, sobrenome, email, senha) VALUES
	('Josué', 'Alvarez', 'josue@gmail.com', 'Alvarez02$'),
	('Usuario', 'Teste', 'teste@gmail.com', 'Teste02$'),
	('Miguel', 'Rojas', 'miguel@gmail.com', 'Rojas02$'),
	('Lucia', 'Fernandez', 'lucia@gmail.com', 'Fernandez02$'),
	('Paulo', 'Guzman', 'paulo@gmail.com', 'Guzman02$'),
	('Mariana', 'Torres', 'mariana@gmail.com', 'TOrres02$');
    
    
SELECT qtdAcertos, qtdErros FROM tentativa WHERE fkUsuario = 1 ORDER BY idTentativa DESC LIMIT 1;

INSERT INTO tentativa (idTentativa, fkUsuario, fkQuiz, qtdAcertos, qtdErros, porcentagem) VALUES

-- Josué (idUsuario = 1)
(1, 1, 1, 7, 3, 0.70),
(2, 1, 1, 9, 1, 0.90),
(3, 1, 1, 8, 2, 0.80),
(4, 1, 1, 10, 0, 1.00),
(5, 1, 1, 6, 4, 0.60),

-- Usuario Teste (idUsuario = 2)
(1, 2, 1, 4, 6, 0.40),
(2, 2, 1, 6, 4, 0.60),
(3, 2, 1, 5, 5, 0.50),
(4, 2, 1, 3, 7, 0.30),
(5, 2, 1, 7, 3, 0.70),

-- Miguel (idUsuario = 3)
(1, 3, 1, 8, 2, 0.80),
(2, 3, 1, 10, 0, 1.00),
(3, 3, 1, 7, 3, 0.70),
(4, 3, 1, 9, 1, 0.90),
(5, 3, 1, 6, 4, 0.60),

-- Lucia (idUsuario = 4)
(1, 4, 1, 3, 7, 0.30),
(2, 4, 1, 5, 5, 0.50),
(3, 4, 1, 4, 6, 0.40),
(4, 4, 1, 6, 4, 0.60),
(5, 4, 1, 7, 3, 0.70),

-- Paulo (idUsuario = 5)
(1, 5, 1, 6, 4, 0.60),
(2, 5, 1, 7, 3, 0.70),
(3, 5, 1, 5, 5, 0.50),
(4, 5, 1, 8, 2, 0.85),
(5, 5, 1, 9, 1, 0.65),

-- Mariana (idUsuario = 6)
(1, 6, 1, 9, 1, 0.90),
(2, 6, 1, 8, 2, 0.85),
(3, 6, 1, 7, 3, 0.70),
(4, 6, 1, 10, 0, 1.00),
(5, 6, 1, 6, 4, 0.60);


SELECT * FROM usuario;
SELECT * FROM quiz;
SELECT * FROM tentativa WHERE fkUsuario = 1;

SELECT
    -- Últimos 5 percentuais (retorna como lista separada por vírgula)
    (SELECT GROUP_CONCAT(porcentagem ORDER BY idTentativa DESC SEPARATOR ',')
     FROM Tentativa
     WHERE fkUsuario = 1
     LIMIT 5) AS ultimos_percentuais,

    -- Últimos acertos e erros
    (SELECT qtdAcertos
     FROM Tentativa
     WHERE fkUsuario = 1
     ORDER BY idTentativa DESC
     LIMIT 1) AS ultimo_acerto,

    (SELECT qtdErros
     FROM Tentativa
     WHERE fkUsuario = 1
     ORDER BY idTentativa DESC
     LIMIT 1) AS ultimo_erro;


SELECT u.nome, MAX(t.porcentagem) AS pontuacao
FROM Usuario u
JOIN Tentativa t ON u.idUsuario = t.fkUsuario
GROUP BY u.idUsuario, u.nome
ORDER BY MAX(t.porcentagem) DESC   -- últimos usuários cadastrados
LIMIT 5;

DROP TABLE usuario;
DROP DATABASE jacha_ajayu;


