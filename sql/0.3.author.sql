use memorand;

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

create table usercoms
(
    user_id varchar(36),
    comment_id varchar(36),
    foreign key (user_id) references users (user_id),
	foreign key (comment_id) references comments (comment_id)
);
