use memorand;
insert into users (user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile) values ("b9fde85b-5ce6-452c-96ef-735e4cd6ee94", "mygengram@gmail.com", "gengram", "staff", "Gengram", "Memorand", "Srl", "si", "XM-Uploads/users/profile/user_icon.png");
insert into institutions (inst_id, inst_name, inst_type, inst_profile, lim_ch, lim_wk, lim_gp, lim_ks) values ("b44f62ec-127d-4ee0-8b54-00e227792439","gengram","empresa","XM-Uploads/institutions/gengram-logo.png","100","2000","100","100");

insert into users (user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile) values ("5c38bb7c-026b-471b-8e24-e500cbf69833", "nicotest@gmail.com", "nico", "admin", "Nicolás", "Juárez", "Barrios", "si", "XM-Uploads/users/profile/user_icon.png");
insert into inusers (inst_id, user_id) values ("b44f62ec-127d-4ee0-8b54-00e227792439", "5c38bb7c-026b-471b-8e24-e500cbf69833");