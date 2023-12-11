use memorand;

create table instituciones(
	id_inst varchar(16) primary key not null,
	nom_inst varchar(24),
	tipo_inst varchar(16),
	lim_lider varchar(8),
	lim_part varchar(8),
    lim_grupo varchar(4),
    lim_sector varchar(4)
);

create table pertenecen (
	id_inst varchar(16),
	id_usuario varchar(16),
	foreign key (id_inst) references instituciones (id_inst),
	foreign key (id_usuario) references usuarios (id_usuario)
);
