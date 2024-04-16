drop database if exists memorand;
create database memorand;
use memorand;

create table institutions
(
	inst_id varchar(36) primary key not null,
	inst_name varchar(128),
	inst_type varchar(16),
	inst_profile varchar(256),
	inst_status varchar(2),
	lim_ch varchar(8),
	lim_wk varchar(8),
	lim_gp varchar(8),
	lim_ks varchar(8)
);

create table users
(
	user_id varchar(36) primary key not null,
	user_email varchar(64),
	user_pass varchar(32),
	user_type varchar(8),
	user_name varchar(32),
	user_pat varchar(16),
	user_mat varchar(16),
	user_status varchar(2),
	user_profile varchar(256)
);

create table inusers
(
	inst_id varchar(36),
	user_id varchar(36),
	foreign key (inst_id) references institutions (inst_id),
	foreign key (user_id) references users (user_id)
);

create table projects
(
	proj_id varchar(36) primary key not null,
	proj_name varchar(36),
	proj_color varchar(6)
);

create table teams
(
	team_id varchar(36) primary key not null,
	team_name varchar(36),
	team_color varchar(36)
);

create table inprojects
(
	inst_id varchar(36),
	proj_id varchar(36),
	foreign key (inst_id) references institutions (inst_id),
	foreign key (proj_id) references projects (proj_id)
);

create table inteams
(
	inst_id varchar(36),
	team_id varchar(36),
	foreign key (inst_id) references institutions (inst_id),
	foreign key (team_id) references teams (team_id)
);

create table collabs
(
	collab_id varchar(36) primary key not null,
	collab_status varchar(2),
	team_id varchar(36),
	proj_id varchar(36),
	foreign key (team_id) references teams (team_id),
	foreign key (proj_id) references projects (proj_id)
);

create table teamusers
(
	team_id varchar(36),
	user_id varchar(36),
	foreign key (team_id) references teams (team_id),
	foreign key (user_id) references users (user_id)
);

create table collabusers
(
	collab_id varchar(36),
	user_id varchar(36),
	foreign key (collab_id) references collabs (collab_id),
	foreign key (user_id) references users (user_id)
);

create table tasks
(
	task_id varchar(36) primary key not null,
	task_name varchar(128),
	task_info text,
	task_sdate timestamp,
	task_edate timestamp,
	task_status varchar(16),
	task_prior varchar(16),
	task_diff varchar(16)
);

create table posts
(
	post_id varchar(36) primary key not null,
	post_text varchar(1024),
	post_r1 int,
	post_r2 int,
	post_r3 int,
	post_date timestamp
);

create table tags
(
	tag_id varchar(36) primary key not null,
	tag_name varchar(32),
	tag_color varchar(6)
);

create table cotasks
(
	collab_id varchar(36),
    task_id varchar(36),
    foreign key (collab_id) references collabs (collab_id),
    foreign key (task_id) references tasks (task_id)
);

create table cotags
(
	collab_id varchar(36),
    tag_id varchar(36),
    foreign key (collab_id) references collabs (collab_id),
    foreign key (tag_id) references tags (tag_id)
);

create table coposts
(
	collab_id varchar(36),
    post_id varchar(36),
    foreign key (collab_id) references collabs (collab_id),
    foreign key (post_id) references posts (post_id)
);

create table tasktags
(
	task_id varchar(36),
    tag_id varchar(36),
    foreign key (task_id) references tasks (task_id),
    foreign key (tag_id) references tags (tag_id)
);

create table ideas
(
	idea_id varchar(36) primary key not null,
	idea_text varchar(256),
	idea_date timestamp,
	idea_color varchar(6)
);

create table canvas
(
	canva_id varchar(36) primary key not null,
	canva_name varchar(64),
	canva_draw longtext,
	canva_cdate timestamp,
	canva_mdate timestamp,
	canva_status varchar(16)
);

create table notes
(
	note_id varchar(36) primary key not null,
	note_name varchar(64),
	note_text text,
	note_cdate timestamp,
	note_mdate timestamp,
	note_status varchar(16)
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

create table userideas
(
	user_id varchar(36),
	idea_id varchar(36),
	foreign key (user_id) references users (user_id),
	foreign key (idea_id) references ideas (idea_id)
);

create table usercanvas
(
    user_id varchar(36),
    canva_id varchar(36),
    foreign key (user_id) references users (user_id),
    foreign key (canva_id) references canvas (canva_id)
);

create table usernotes
(
    user_id varchar(36),
    note_id varchar(36),
    foreign key (user_id) references users (user_id),
    foreign key (note_id) references notes (note_id)
);

create table userposts
(
    user_id varchar(36),
    post_id varchar(36),
    foreign key (user_id) references users (user_id),
    foreign key (post_id) references posts (post_id)
);

insert into users (user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile) values ("b9fde85b-5ce6-452c-96ef-735e4cd6ee94", "mygengram@gmail.com", "gengram", "staff", "Gengram", "Memorand", "Srl", "si", "XM-Uploads/users/profile/user_icon.png");
insert into institutions (inst_id, inst_name, inst_type, inst_profile, inst_status, lim_ch, lim_wk, lim_gp, lim_ks) values ("b44f62ec-127d-4ee0-8b54-00e227792439","Gengram","Empresa","XM-Uploads/institutions/default.png","si","100","2000","100","100");

insert into users (user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile) values ("5c38bb7c-026b-471b-8e24-e500cbf69833", "nicotest@gmail.com", "nico", "admin", "Nicolás", "Juárez", "Barrios", "si", "XM-Uploads/users/profile/default-user.png");
insert into inusers (inst_id, user_id) values ("b44f62ec-127d-4ee0-8b54-00e227792439", "5c38bb7c-026b-471b-8e24-e500cbf69833");

create table tokens
(
	token_id varchar(36) primary key not null,
	token_type varchar(16),
	token_status varchar(2)
);

create table usertokens 
(
	user_id varchar(36),
	token_id varchar(36),
	foreign key (user_id) references users (user_id),
	foreign key (token_id) references tokens (token_id)
);

create table services
(
	service_id varchar(36) primary key not null,
	service_name varchar(16),
	service_status varchar(2)
);

create table requests 
(
	req_id varchar(36) primary key not null,
	req_date timestamp,
	req_name varchar(32),
	req_pat varchar(16),
	req_mat varchar(16),
	req_inst varchar(36),
	req_email varchar(64),
	req_phone varchar(16),
	req_job varchar(32),
	req_num varchar(8),
	req_msg text
);

create table suggestions
(
	sug_id varchar(36) primary key not null,
	sug_date timestamp,
	sug_msg text,
	sug_email varchar(64)
);

insert into services (service_id, service_name, service_status) values ("9cd15faf-0fa5-482c-a7dd-d07790797528","memorand","si");
insert into services (service_id, service_name, service_status) values ("c10c1331-6801-4402-b62d-b860d443885b","ventas","si");
insert into services (service_id, service_name, service_status) values ("99949271-4466-46bc-b306-aa171e7e81b3","tester","si");
