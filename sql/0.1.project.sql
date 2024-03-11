use memorand;

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

create table comments
(
	comment_id varchar(36) primary key not null,
	comment_text varchar(512),
	comment_r1 int,
	comment_r2 int,
	comment_r3 int,
	comment_date timestamp
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

create table postcoms
(
	post_id varchar(36),
    comment_id varchar(36),
    foreign key (post_id) references posts (post_id),
    foreign key (comment_id) references comments (comment_id)
);

create table tasktags
(
	task_id varchar(36),
    tag_id varchar(36),
    foreign key (task_id) references tasks (task_id),
    foreign key (tag_id) references tags (tag_id)
);
