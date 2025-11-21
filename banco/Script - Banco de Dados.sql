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

CREATE TABLE Tentativa (
	idTentativa INT AUTO_INCREMENT,
    fkUsuario INT,
    CONSTRAINT fkUsuarioTentativa
		FOREIGN KEY (fkCUsuario) 
			REFERENCES Usuario(idUsuario),
    fkQuiz INT,
    CONSTRAINT fkQuizTentativa
		FOREIGN KEY (fkQuiz)
			REFERENCES Quiz(idQuiz),
	CONSTRAINT fkComposta
		PRIMARY KEY ( idTentativa, fkUsuario, fkQuiz),
	qtdAcertos INT,
    qtdErros INT
);
	idTentativa INT,
    fkUsuario INT,
    fkQuiz INT,
    qtdAcertos INT,
    qtdErros INT,
    porcentagem DECIMAL(2,1)
);


INSERT INTO Quiz VALUES
	(1, 'Conhecendo o Folclore', ),

SELECT * FROM usuario;

DROP TABLE usuario;
DROP DATABASE jacha_ajayu;


