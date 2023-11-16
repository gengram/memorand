use memorand;

create table instituciones(
	id_inst varchar(16) primary key not null,
	nom_inst varchar(24),
	lim_profes varchar(8),
	lim_alumnos varchar(8)
);

create table pertenecen (
	id_inst varchar(16),
	id_usuario varchar(16),
	foreign key (id_inst) references instituciones (id_inst),
	foreign key (id_usuario) references usuarios (id_usuario)
);
