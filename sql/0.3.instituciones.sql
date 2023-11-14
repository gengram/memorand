create table instituciones(
	id_institucion varchar(16) primary key not null,
	nombre_institucion varchar(24),
	limite_profes varchar(8),
	limite_alumnos varchar(8)
);

create table pertenecen(
	id_institucion varchar(16),
	id_usuario varchar(16),
	foreign key (id_institucion) references instituciones (id_institucion),
	foreign key (id_usuario) references usuarios (id_usuario)
);
