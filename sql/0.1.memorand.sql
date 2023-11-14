drop database if exists memorand;
create database memorand;
use memorand;

create table usuarios(
	id_usuario varchar(16) primary key not null,
	correo_usuario varchar(32),
	pass_usuario varchar(24),
	tipo_usuario varchar(8),
	nombre_usuario varchar(24),
	paterno_usuario varchar(16),
	materno_usuario varchar(16)
);
