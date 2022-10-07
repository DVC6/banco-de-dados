-- create database dvc6;
-- use dvc6;



select * from hospital;

create table hospital (
  id_hospital int primary key auto_increment,
  nome_fantasia varchar(100),
  cnpj varchar(18),
  email varchar(30),
  senha varchar(30),
  site varchar(45),
  logradouro  varchar(45),
  numero int,
  cidade varchar(45),
  estado varchar(45),
  bairro varchar(45),
  telefone varchar(15)
  );

select * from hospital;


create table funcionario(
  id_funcionario int primary key auto_increment,
  nome_funcionario varchar(45),
  senha varchar(45),
  email varchar(45),
  cargo varchar(30),
  fkhospital int,
  constraint fkhospital_funcionario foreign key (fkhospital) references hospital (id_hospital)
);

create table pre_check_in (
  id_pre_check_in int primary key auto_increment,
  nome varchar(45),
  cpf varchar(14),
  rg varchar(12),
  idade int,
  email varchar(45),
  data_cadastro datetime,
  fkhospital int,
  constraint fkhospital_pre foreign key (fkhospital) references hospital (id_hospital)
  );

create table feedback(
	id_feedback int primary key auto_increment,
	nota int,
	texto varchar(100),
	dthora datetime,
	fkfuncionario int,
	constraint fkfuncionario_feedback foreign key (fkfuncionario) references hospital (id_hospital)
  );


create table totem (
  id_totem int primary key auto_increment,
  localização varchar(45),
  nome_maquina varchar(45),
  status_atual varchar(5),
  fkhospital int,
  constraint fkhospital_totem foreign key (fkhospital) references hospital (id_hospital)
  );

  
create table tipo_componente(
	id_tipo_componente int primary key auto_increment,
	nome varchar(45),
	medida_componente varchar(20)
);

create table metricas(
	id_metricas int primary key auto_increment,
	limite_cpu_perigo float,
	limite_disco_perigo float,
	limite_ram_perigo float,
	limite_ram_alerta float,
	limite_cpu_alerta float,
	limite_disco_alerta float
);

create table componente (
  id_componente int primary key auto_increment,
  total_componente float,
  fktipocomponente int,
  constraint fktipo_componente foreign key (fktipocomponente) references tipo_componente (id_tipo_componente),
  fktotem int,
  constraint fktotem_componente foreign key (fktotem) references totem (id_totem),
  fkmetricas int,
  constraint fkmetricas_componente  foreign key (fkmetricas) references metricas (id_metricas)
  );

create table leitura (
  id_leitura int primary key auto_increment,
  data_hora_atual datetime,
  consumo float,
  fkcomponente int,
  constraint fkcomponente_leitura foreign key (fkcomponente) references componente (id_componente)
  );
