/*
  ==============================================================
  Descrição: Criação da base de dados e das tabelas que surgiram
             após a modelagem do mini-mundo.
  ==============================================================
*/

-- Criação da base de dados do projeto
CREATE DATABASE projeto_leilao;
USE projeto_leilao;

-- Criação das tabelas

CREATE TABLE INSTITUICAO(
	matricula int PRIMARY KEY,
	nome varchar(50) NOT NULL,
	sigla varchar(10)
);

CREATE TABLE LEILAO(
	codigo int PRIMARY KEY,
	matric_instituicao int NOT NULL,
	data_inicio date NOT NULL,
	data_fim date NOT NULL,
	FOREIGN KEY (matric_instituicao) REFERENCES INSTITUICAO(matricula)
);

CREATE TABLE TIPO(
	id int PRIMARY KEY,
	nome varchar(21) NOT NULL,
	descricao text(256)
);

CREATE TABLE LOTE(
	id INTEGER PRIMARY KEY,
	situacao varchar(20),
	preco_minimo REAL NOT NULL,
	codigo_leilao INTEGER NOT NULL,
	id_tipo INTEGER NOT NULL,
	FOREIGN KEY (codigo_leilao) REFERENCES LEILAO(codigo),
	FOREIGN KEY (id_tipo) REFERENCES TIPO(id)
);

CREATE TABLE MERCADORIA(
	codigo INT PRIMARY KEY,
	nome VARCHAR(21) NOT NULL,
	descricao TEXT,
	quantidade INT NOT NULL,
	recinto_armazenador VARCHAR(30) NOT NULL,
	id_lote INT NOT NULL,
	FOREIGN KEY (id_lote) REFERENCES LOTE(id)
);

CREATE TABLE COMPRADOR(
	matricula INT PRIMARY KEY,
	nome VARCHAR(52) NOT NULL,
	CEP VARCHAR(10) NOT NULL,
	UF VARCHAR(2),
	CPF VARCHAR(14),
	CNPJ VARCHAR(18),
	tipo VARCHAR(8) NOT NULL
);

CREATE TABLE LANCE(
	id INT PRIMARY KEY,
	valor REAL NOT NULL,
	data DATE NOT NULL,
	hora TIME NOT NULL,
	id_lote INT NOT NULL,
	matric_comprador INT NOT NULL,
	FOREIGN KEY (id_lote) REFERENCES LOTE(id),
	FOREIGN KEY (matric_comprador) REFERENCES COMPRADOR(matricula)
);

CREATE TABLE CONTATO(
	matric_comprador INTEGER,
	contato VARCHAR(21),
	PRIMARY KEY (matric_comprador,contato),
	FOREIGN KEY (matric_comprador) REFERENCES COMPRADOR(matricula)
);
