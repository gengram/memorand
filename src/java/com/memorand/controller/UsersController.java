package com.memorand.controller;

import com.memorand.beans.User;
import com.memorand.model.UsersModel;

public class UsersController {

    public boolean modelCreateUser(User user) {
        
        UsersModel userm = new UsersModel();
        return userm.createUser(user);
        
    }
    
    public boolean modelLoginUser(User user) {
        
        UsersModel userm = new UsersModel();
        return userm.loginUser(user);
    
    }
    
    public User modelGetUserInfo(User user) {
        
        UsersModel userm = new UsersModel();
        return userm.getUserInfo(user);
    
    }
    
    public String modelGetAllAdminByInst(String inst_id) {
    
        String htmlcode = "";
        
        UsersModel userm = new UsersModel();
        
        for (User admin : userm.getAllAdminByInst(inst_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td> <img src='../"+ admin.getUser_profile()+"' width='40'></img> </td>\n" +
"                    <td>"+ admin.getUser_pat() +"</td>\n" +
"                    <td>"+ admin.getUser_mat() +"</td>\n" +
"                    <td>"+ admin.getUser_name() +"</td>\n" +
"                    <td>"
                    + "<a href='administradores/editar.jsp?inst_id="+ admin.getUser_id() +"'>Editar</a><br>"
                  + "</td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    public String modelGetAllAdmin() {
    
        String htmlcode = "";
        
        UsersModel userm = new UsersModel();
        
        for (User admin : userm.getAllAdmin())
        {
            String admin_status = admin.getUser_status();
            
            switch (admin_status)
            {
                case "si":
                    admin_status = "Activo";
                    break;
                case "no":
                    admin_status = "Inactivo";
                    break;
                default:
                    admin_status = "ERROR";
                    break;
            }
            
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ admin.getUser_id() +"</td>\n" +
"                    <td>"+ admin.getUser_email() +"</td>\n" +
"                    <td>"+ admin.getUser_pass() +"</td>\n" +
"                    <td>"+ admin.getUser_type() +"</td>\n" +
"                    <td>"+ admin.getUser_name() +"</td>\n" +
"                    <td>"+ admin.getUser_pat() +"</td>\n" +
"                    <td>"+ admin.getUser_mat() +"</td>\n" +
"                    <td>"+ admin_status +"</td>\n" +
"                    <td> <img src='../"+ admin.getUser_profile() +"' width='40'></img> </td>\n" +
"                    <td>"
                    + "<a href='administradores/editar.jsp?inst_id="+ admin.getUser_id() +"'>Editar</a><br>"
                  + "</td>\n" +
"           </tr>";
            
        }
        
        return htmlcode;
        
    }
}
