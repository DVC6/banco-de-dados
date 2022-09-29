
USE DVC6;


CREATE TABLE HOSPITAL (
  ID_HOSPITAL INT IDENTITY(1,1) PRIMARY KEY,
  NOME_FANTASIA VARCHAR(100),
  CNPJ VARCHAR(18),
  EMAIL VARCHAR(30),
  SENHA VARCHAR(30),
  CEP CHAR(8),
  NUMERO INT,
  TELEFONE VARCHAR(15),
  SITE VARCHAR(45)
  );

CREATE TABLE FUNCIONARIO(
  ID_FUNCIONARIO INT IDENTITY(1,1) PRIMARY KEY,
  NOME_FUNCIONARIO VARCHAR(45),
  SENHA VARCHAR(45),
  EMAIL VARCHAR(45),
  CARGO VARCHAR(30),
  FKHOSPITAL INT,
  CONSTRAINT FKHOSPITAL_FUNCIONARIO FOREIGN KEY (FKHOSPITAL) REFERENCES HOSPITAL (ID_HOSPITAL)
);

CREATE TABLE PRE_CHECK_IN (
  ID_PRE_CHECK_IN INT IDENTITY(1,1) PRIMARY KEY,
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
	ID_FEEDBACK INT IDENTITY(1,1) PRIMARY KEY,
	NOTA INT,
	TEXTO VARCHAR(100),
	DTHORA DATETIME,
	FKFUNCIONARIO INT
	CONSTRAINT FKFUNCIONARIO_FEEDBACK FOREIGN KEY(FKFUNCIONARIO) REFERENCES FUNCIONARIO (ID_FUNCIONARIO),
  );


CREATE TABLE TOTEM (
  ID_TOTEM INT IDENTITY(1,1) PRIMARY KEY,
  LOCALIZAÇÃO VARCHAR(45),
  NOME_MAQUINA VARCHAR(45),
  STATUS_ATUAL VARCHAR(5),
  FKHOSPITAL INT,
  CONSTRAINT FKHOSPITAL_TOTEM FOREIGN KEY (FKHOSPITAL) REFERENCES HOSPITAL (ID_HOSPITAL)
  );

  
CREATE TABLE TIPO_COMPONENTE(
	ID_TIPO_COMPONENTE INT IDENTITY(1,1) PRIMARY KEY,
	NOME VARCHAR(45),
	MEDIDA_COMPONENTE VARCHAR(20)
);

CREATE TABLE METRICAS(
	ID_METRICAS INT IDENTITY(1,1) PRIMARY KEY,
	LIMITE_CPU_PERIGO FLOAT,
	LIMITE_DISCO_PERIGO FLOAT,
	LIMITE_RAM_PERIGO FLOAT,
	LIMITE_RAM_ALERTA FLOAT,
	LIMITE_CPU_ALERTA FLOAT,
	LIMITE_DISCO_ALERTA FLOAT,
);

CREATE TABLE COMPONENTE (
  ID_COMPONENTE INT IDENTITY(1,1) PRIMARY KEY,
  TOTAL_COMPONENTE FLOAT,
  FKTIPOCOMPONENTE INT,
  CONSTRAINT FKTIPO_COMPONENTE FOREIGN KEY (FKTIPOCOMPONENTE) REFERENCES TIPO_COMPONENTE (ID_TIPO_COMPONENTE),
  FKTOTEM INT,
  CONSTRAINT FKTOTEM_COMPONENTE FOREIGN KEY (FKTOTEM) REFERENCES TOTEM (ID_TOTEM),
  FKMETRICAS INT,
  CONSTRAINT FKMETRICAS_COMPONENTE  FOREIGN KEY (FKMETRICAS) REFERENCES METRICAS (ID_METRICAS)
  );

CREATE TABLE LEITURA (
  ID_LEITURA INT IDENTITY(1,1) PRIMARY KEY,
  DATA_HORA_ATUAL DATETIME,
  CONSUMO FLOAT,
  FKCOMPONENTE INT,
  CONSTRAINT FKCOMPONENTE_LEITURA FOREIGN KEY (FKCOMPONENTE) REFERENCES COMPONENTE (ID_COMPONENTE)
  );

