-- SCRIPT DO BANDO DE DADOS - JACH1A AJAYU

-- Criando usuário
CREATE USER 'jacha_ajayu'@'%' IDENTIFIED BY 'Ajayu02$';
GRANT SELECT, INSERT ON jach_ajayu.* TO 'jacha_ajayu'@'%';

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


INSERT INTO tentativa (idTentativa, fkUsuario, fkQuiz, qtdAcertos, qtdErros, porcentagem) VALUES
(1, 1, 1, 8, 4, 0.666),
(2, 1, 1, 10, 2, 0.833),
(3, 1, 1, 9, 3, 0.750),
(4, 1, 1, 11, 1, 0.916),
(5, 1, 1, 7, 5, 0.583),
(1, 2, 1, 5, 7, 0.416),
(2, 2, 1, 7, 5, 0.583),
(3, 2, 1, 6, 6, 0.500),
(4, 2, 1, 4, 8, 0.333),
(5, 2, 1, 8, 4, 0.666),
(1, 3, 1, 9, 3, 0.750),
(2, 3, 1, 11, 1, 0.916),
(3, 3, 1, 8, 4, 0.666),
(4, 3, 1, 10, 2, 0.833),
(5, 3, 1, 7, 5, 0.583),
(1, 4, 1, 4, 8, 0.333),
(2, 4, 1, 6, 6, 0.500),
(3, 4, 1, 5, 7, 0.416),
(4, 4, 1, 7, 5, 0.583),
(5, 4, 1, 8, 4, 0.666),
(1, 5, 1, 7, 5, 0.583),
(2, 5, 1, 8, 4, 0.666),
(3, 5, 1, 6, 6, 0.500),
(4, 5, 1, 9, 3, 0.750),
(5, 5, 1, 10, 2, 0.833),
(1, 6, 1, 10, 2, 0.833),
(2, 6, 1, 9, 3, 0.750),
(3, 6, 1, 8, 4, 0.666),
(4, 6, 1, 11, 1, 0.916),
(5, 6, 1, 7, 5, 0.583);


SELECT * FROM usuario;
SELECT * FROM quiz;
SELECT * FROM tentativa;
SELECT * FROM tentativa WHERE fkUsuario = 1;
