drop database if exists memorand;
create database memorand;
use memorand;

create table usuarios (
	id_usuario varchar(16) primary key not null,
	correo_usuario varchar(32),
	pass_usuario varchar(24),
	tipo_usuario varchar(8),
	nom_usuario varchar(24),
	pat_usuario varchar(16),
	mat_usuario varchar(16),
    est_usuario varchar(2)
);

create table instituciones (
	id_inst varchar(16) primary key not null,
	nom_inst varchar(24),
	tipo_inst varchar(16),
	lim_lider varchar(8),
	lim_part varchar(8),
    lim_grupo varchar(4),
    lim_sector varchar(4)
);

create table pertenecen (
	id_perten varchar(16) primary key not null,
	id_inst varchar(16),
	id_usuario varchar(16),
	foreign key (id_inst) references instituciones (id_inst),
	foreign key (id_usuario) references usuarios (id_usuario)
);

-- GRUPAL

create table sectores (
	id_sector varchar(16) primary key not null,
	nom_sector varchar(32)
);

create table grupos (
	id_grupo varchar(16) primary key not null,
	nom_grupo varchar(32)
);

create table instsector (
	id_inst varchar(16),
	id_sector varchar(16),
	foreign key (id_inst) references instituciones (id_inst),
    foreign key (id_sector) references sectores (id_sector)
);

create table instgrupos (
	id_inst varchar(16),
	id_grupo varchar(16),
	foreign key (id_inst) references instituciones (id_inst),
    foreign key (id_grupo) references grupos (id_grupo)
);

create table inscriben (
	id_inscrib varchar(16) primary key not null,
	id_perten varchar(16),
    id_grupo varchar(16),
	foreign key (id_perten) references pertenecen (id_perten),
	foreign key (id_grupo) references grupos (id_grupo)
);

create table tienen (
	id_tienen varchar(16) primary key not null,
	id_inscrib varchar(16),
    id_sector varchar(16),
	foreign key (id_inscrib) references inscriben (id_inscrib),
	foreign key (id_sector) references sectores (id_sector)
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

create table apuntes (
	id_apunte varchar(16) primary key not null,
	nom_apunte varchar(32),
	texto_apunte longtext,
	fecha_apunte varchar(10),
	autor_apunte varchar(24),
	usado_apunte varchar(2)
);

create table grupotarea (
	id_tienen varchar(16),
	id_tarea varchar(16),
	foreign key (id_tienen) references tienen (id_tienen),
	foreign key (id_tarea) references tareas (id_tarea)
);

create table grupoapunte (
	id_tienen varchar(16),
	id_apunte varchar(16),
	foreign key (id_tienen) references tienen (id_tienen),
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

-- PERSONAL

create table personales (
	id_personal varchar(16) primary key not null,
	color_personal varchar(6),
	fondo_personal varchar(2)
);

create table pendientes (
	id_pend varchar(16) primary key not null,
	nom_pend varchar(32),
	info_pend varchar(256),
	fecha_pend varchar(10),
	inicio_pend varchar(10),
	final_pend varchar(10),
	estado_pend varchar(2)
);

create table ideas (
	id_idea varchar(16) primary key not null,
	texto_idea varchar(64),
	fecha_idea varchar(10)
);

create table rutinas (
	id_rutina varchar(16) primary key not null,
	nom_rutina varchar(32),
	info_rutina varchar(256),
	dias_rutina varchar(128),
	hora_rutina varchar(8)
);

create table personalusuario (
	id_usuario varchar(16),
	id_personal varchar(16),
	foreign key (id_usuario) references usuarios (id_usuario),
    foreign key (id_personal) references personales (id_personal)
);


create table personalpend (
	id_personal varchar(16),
	id_pend varchar(16),
	foreign key (id_personal) references personales (id_personal),
	foreign key (id_pend) references pendientes (id_pend)
);

create table personalidea (
	id_personal varchar(16),
	id_idea varchar(16),
	foreign key (id_personal) references personales (id_personal),
	foreign key (id_idea) references ideas (id_idea)
);

create table personalrutina (
	id_personal varchar(16),
	id_rutina varchar(16),
	foreign key (id_personal) references personales (id_personal),
	foreign key (id_rutina) references rutinas (id_rutina)
);

create table personalapunte (
	id_personal varchar(16),
	id_apunte varchar(16),
	foreign key (id_personal) references personales (id_personal),
	foreign key (id_apunte) references apuntes (id_apunte)
);

