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

SELECT * FROM usuario;

DROP TABLE usuario;
DROP DATABASE jacha_ajayu;


