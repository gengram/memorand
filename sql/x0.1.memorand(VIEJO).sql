drop database if exists memorand;
create database memorand;
use memorand;

create table usuarios(
	id_usuario varchar(16) primary key not null,
	correo_usuario varchar(32),
	pass_usuario varchar(24),
	tipo_usuario varchar(8),
	nom_usuario varchar(24),
	pat_usuario varchar(16),
	mat_usuario varchar(16),
    est_usuario varchar(2)
);
