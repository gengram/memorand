drop database if exists memorand;
create database memorand;
use memorand;

create table institutions (
	
    inst_id varchar(36) primary key not null,
    inst_name varchar(32),
    inst_type varchar(16),
    inst_profile varchar(256),
	lim_ch varchar(8),
    lim_wk varchar(8),
    lim_gp varchar(8),
    lim_ks varchar(8)

);

create table users (

	user_id varchar(36) primary key not null,
    user_email varchar(32),
    user_pass varchar(24),
    user_type varchar(8),
    user_name varchar(24),
    user_pat varchar(16),
    user_mat varchar(16),
    user_status varchar(2),
    user_profile varchar(256)
        
);

create table inusers (

	inuser_id varchar(36) primary key not null,
    inst_id varchar(36),
    user_id varchar(36),
    foreign key (inst_id) references institutions (inst_id),
    foreign key (user_id) references users (user_id)

);

create table classes (
	
    class_id varchar(36) primary key not null,
    class_name varchar(32),
    class_icon varchar(256),
    class_color varchar(6),
    class_bkg varchar(256)
	
);

create table clusters (
	
    cluster_id varchar(36) primary key not null,
    cluster_name varchar(32),
    cluster_color varchar(6)

);

create table inclasses (

	inst_id varchar(36),
    class_id varchar(36),
    foreign key (inst_id) references institutions (inst_id),
    foreign key (class_id) references classes (class_id)

);

create table inclusts (

	inst_id varchar(36),
    cluster_id varchar(36),
    foreign key (inst_id) references institutions (inst_id),
    foreign key (cluster_id) references clusters (cluster_id)
    
);

create table clustclass (
	
    clustclass_id varchar(36) primary key not null,
    cluster_id varchar(36),
    class_id varchar(36),
    foreign key (cluster_id) references clusters (cluster_id),
    foreign key (class_id) references classes (class_id)

);

create table clustusers (
	
    clustuser_id varchar(36) primary key not null,
    inuser_id varchar(36),
    cluster_id varchar(36),
    foreign key (cluster_id) references clusters (cluster_id),
    foreign key (inuser_id) references inusers (inuser_id)

);

create table collab (

	collab_id varchar(36) primary key not null,
    clustclass_id varchar(36),
	clustuser_id varchar(36),
    foreign key (clustclass_id) references clustclass (clustclass_id),
    foreign key (clustuser_id) references clustusers (clustuser_id)
    
);

create table individual (

	indiv_id varchar(36) primary key not null,
    indiv_color varchar(6),
    indiv_bkg varchar(256)

);

create table ivusers (

	user_id varchar(36),
    indiv_id varchar(36),
    foreign key (user_id) references users (user_id),
    foreign key (indiv_id) references individual (indiv_id)

);

create table assignments (
	
    assign_id varchar(36) primary key not null,
    assign_name varchar(32),
    assign_info varchar(256),
    assign_date varchar(10),
    assign_end varchar(10),
    assign_hr varchar(10),
    assign_by varchar(32)

);

create table notes (
	
    note_id varchar(36) primary key not null,
    note_name varchar(32),
    note_text longtext,
    note_by varchar(32),
    note_status varchar(2)

);

create table tasks (
	
    task_id varchar(36) primary key not null,
    task_name varchar(32),
    task_info varchar(256),
    task_date varchar(10),
    task_start varchar(10),
    task_end varchar(10),
    task_status varchar(2)

);

create table ideas (
	
    idea_id varchar(36) primary key not null,
    idea_text varchar(256),
    idea_date varchar(10),
    idea_color varchar(6)
    
);

create table routines (
	
    rout_id varchar(36) primary key not null,
    rout_name varchar(32),
    rout_info varchar(256),
    rout_days varchar(10),
    rout_hour varchar(10)

);

create table coassign (

	collab_id varchar(36),
    assign_id varchar(36),
    foreign key (collab_id) references collab (collab_id),
	foreign key (assign_id) references assignments (assign_id)
    
);

create table conotes (

	collab_id varchar(36),
    note_id varchar(36),
    foreign key (collab_id) references collab (collab_id),
	foreign key (note_id) references notes (note_id)
    
);

create table ivnotes (

	indiv_id varchar(36),
    note_id varchar(36),
    foreign key (indiv_id) references individual (indiv_id),
	foreign key (note_id) references notes (note_id)
    
);

create table ivtasks (

	indiv_id varchar(36),
    task_id varchar(36),
    foreign key (indiv_id) references individual (indiv_id),
	foreign key (task_id) references tasks (task_id)
    
);

create table ivideas (

	indiv_id varchar(36),
    idea_id varchar(36),
    foreign key (indiv_id) references individual (indiv_id),
	foreign key (idea_id) references ideas (idea_id)
    
);

create table ivrouts (

	indiv_id varchar(36),
    rout_id varchar(36),
    foreign key (indiv_id) references individual (indiv_id),
	foreign key (rout_id) references routines (rout_id)
    
);