use memorand;

create table asignaturas (
	id_asigna varchar(16) primary key not null,
	nom_asigna varchar(32),
	color_asigna varchar(6)
);

create table grupos (
	id_grupo varchar(16) primary key not null,
	nom_grupo varchar(32)
);

create table tareas (
	id_tarea varchar(16) primary key not null,
	nom_tarea varchar(32),
	info_tarea varchar(255),
	fecha_tarea varchar(10),
	final_tarea varchar(10),
	hora_tarea varchar(8),
	autor_tarea varchar(24)
);

create table inscriben (
	id_inscrip varchar(16) primary key not null,
	id_usuario varchar(16),
	id_inst varchar(16),
	id_grupo varchar(16),
	id_asigna varchar(16),
	foreign key (id_usuario) references usuarios (id_usuario),
	foreign key (id_inst) references instituciones (id_inst),
	foreign key (id_grupo) references grupos (id_grupo),
	foreign key (id_asigna) references asignaturas (id_asigna)
);

create table grupotarea (
        id_grupo varchar(16),
        id_tarea varchar(16),
        foreign key (id_grupo) references grupos (id_grupo),
        foreign key (id_tarea) references tareas (id_tarea)
);

create table grupoapunte (
        id_grupo varchar(16),
        id_apunte varchar(16),
        foreign key (id_grupo) references grupos (id_grupo),
        foreign key (id_apunte) references apuntes (id_apunte)
);

create table entregan (
	id_entrega varchar(16) primary key not null,
        id_tarea varchar(16),
	id_apunte varchar(16),
	fecha_entrega varchar(10),
	hora_entrega varchar(8),
	estado_entrega varchar(16),
        foreign key (id_tarea) references tareas (id_tarea),
        foreign key (id_apunte) references apuntes (id_apunte)
);


