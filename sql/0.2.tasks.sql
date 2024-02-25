use memorand;

create table ideas
(
	idea_id varchar(36) primary key not null,
	idea_text varchar(256),
	idea_date varchar(16),
	idea_color varchar(6)
);

create table canvas
(
	canva_id varchar(36) primary key not null,
	canva_name varchar(64),
	canva_draw longtext,
	canva_cdate varchar(16),
	canva_mdate varchar(16),
	canva_status varchar(2)
);

create table notes
(
	note_id varchar(36) primary key not null,
	note_name varchar(64),
	note_text text,
	note_cdate varchar(16),
	note_mdate varchar(16),
	note_status varchar(2)
);

create table taskideas
(
	task_id varchar(36),
	idea_id varchar(36),
	foreign key (task_id) references tasks (task_id),
	foreign key (idea_id) references ideas (idea_id)
);

create table taskcanvas
(
    task_id varchar(36),
    canva_id varchar(36),
    foreign key (task_id) references tasks (task_id),
	foreign key (canva_id) references canvas (canva_id)
);

create table tasknotes
(
	task_id varchar(36),
	note_id varchar(36),
	foreign key (task_id) references tasks (task_id),
	foreign key (note_id) references notes (note_id)
);