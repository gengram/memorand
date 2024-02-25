drop database if exists memorand;
create database memorand;
use memorand;

create table institutions
(
	inst_id varchar(36) primary key not null,
	inst_name varchar(128),
	inst_type varchar(16),
	inst_profile varchar(256),
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
