use memorand;

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

create table apuntes (
	id_apunte varchar(16) primary key not null,
	nom_apunte varchar(32),
	texto_apunte longtext,
	fecha_apunte varchar(10),
	autor_apunte varchar(24),
	usado_apunte varchar(2)
);

create table cuentan (
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

