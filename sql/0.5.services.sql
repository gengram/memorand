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