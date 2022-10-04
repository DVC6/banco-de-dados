CREATE DATABASE DVC6;
USE DVC6;

SELECT * FROM HOSPITAL;

CREATE TABLE HOSPITAL (
  ID_HOSPITAL INT PRIMARY KEY AUTO_INCREMENT,
  nome_fantasia VARCHAR(100),
  cnpj VARCHAR(18),
  email VARCHAR(30),
  senha VARCHAR(30),
  site VARCHAR(45),
  logradouro  VARCHAR(45),
  numero INT,
  cidade VARCHAR(45),
  estado VARCHAR(45),
  bairro VARCHAR(45),
  telefone VARCHAR(15)
  );

SELECT * FROM Hospital;


CREATE TABLE FUNCIONARIO(
  ID_FUNCIONARIO INT PRIMARY KEY AUTO_INCREMENT,
  NOME_FUNCIONARIO VARCHAR(45),
  SENHA VARCHAR(45),
  EMAIL VARCHAR(45),
  CARGO VARCHAR(30),
  FKHOSPITAL INT,
  CONSTRAINT FKHOSPITAL_FUNCIONARIO FOREIGN KEY (FKHOSPITAL) REFERENCES HOSPITAL (ID_HOSPITAL)
);

CREATE TABLE PRE_CHECK_IN (
  ID_PRE_CHECK_IN INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(45),
  CPF VARCHAR(14),
  RG VARCHAR(12),
  IDADE INT,
  EMAIL VARCHAR(45),
  DATA_CADASTRO DATETIME,
  FKHOSPITAL INT,
  CONSTRAINT FKHOSPITAL_PRE FOREIGN KEY (FKHOSPITAL) REFERENCES HOSPITAL (ID_HOSPITAL)
  );

CREATE TABLE FEEDBACK(
	ID_FEEDBACK INT PRIMARY KEY AUTO_INCREMENT,
	NOTA INT,
	TEXTO VARCHAR(100),
	DTHORA DATETIME,
	FKFUNCIONARIO INT,
	CONSTRAINT FKFUNCIONARIO_FEEDBACK FOREIGN KEY (FKFUNCIONARIO) REFERENCES HOSPITAL (ID_HOSPITAL)
  );


CREATE TABLE TOTEM (
  ID_TOTEM INT PRIMARY KEY AUTO_INCREMENT,
  LOCALIZAÇÃO VARCHAR(45),
  NOME_MAQUINA VARCHAR(45),
  STATUS_ATUAL VARCHAR(5),
  FKHOSPITAL INT,
  CONSTRAINT FKHOSPITAL_TOTEM FOREIGN KEY (FKHOSPITAL) REFERENCES HOSPITAL (ID_HOSPITAL)
  );

  
CREATE TABLE TIPO_COMPONENTE(
	ID_TIPO_COMPONENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(45),
	MEDIDA_COMPONENTE VARCHAR(20)
);

CREATE TABLE METRICAS(
	ID_METRICAS INT PRIMARY KEY AUTO_INCREMENT,
	LIMITE_CPU_PERIGO FLOAT,
	LIMITE_DISCO_PERIGO FLOAT,
	LIMITE_RAM_PERIGO FLOAT,
	LIMITE_RAM_ALERTA FLOAT,
	LIMITE_CPU_ALERTA FLOAT,
	LIMITE_DISCO_ALERTA FLOAT
);

CREATE TABLE COMPONENTE (
  ID_COMPONENTE INT PRIMARY KEY AUTO_INCREMENT,
  TOTAL_COMPONENTE FLOAT,
  FKTIPOCOMPONENTE INT,
  CONSTRAINT FKTIPO_COMPONENTE FOREIGN KEY (FKTIPOCOMPONENTE) REFERENCES TIPO_COMPONENTE (ID_TIPO_COMPONENTE),
  FKTOTEM INT,
  CONSTRAINT FKTOTEM_COMPONENTE FOREIGN KEY (FKTOTEM) REFERENCES TOTEM (ID_TOTEM),
  FKMETRICAS INT,
  CONSTRAINT FKMETRICAS_COMPONENTE  FOREIGN KEY (FKMETRICAS) REFERENCES METRICAS (ID_METRICAS)
  );

CREATE TABLE LEITURA (
  ID_LEITURA INT PRIMARY KEY AUTO_INCREMENT,
  DATA_HORA_ATUAL DATETIME,
  CONSUMO FLOAT,
  FKCOMPONENTE INT,
  CONSTRAINT FKCOMPONENTE_LEITURA FOREIGN KEY (FKCOMPONENTE) REFERENCES COMPONENTE (ID_COMPONENTE)
  );

