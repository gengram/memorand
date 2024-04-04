package com.memorand.controller;

import com.memorand.beans.User;
import com.memorand.model.UsersModel;
import java.util.ArrayList;

public class UsersController {

    public boolean modelCreateUser(User user) {
        
        UsersModel userm = new UsersModel();
        return userm.createUser(user);
        
    }
    
    public boolean modelLoginUser(User user) {
        
        UsersModel userm = new UsersModel();
        return userm.loginUser(user);
    
    }
    
    public boolean modelValidateUserEmail(String u_email) {
    
        UsersModel userm = new UsersModel();
        return userm.validateUserEmail(u_email);
        
    }
    
    public User modelGetUserInfoByLogin(User user) {
        
        UsersModel userm = new UsersModel();
        return userm.getUserInfoByLogin(user);
    
    }
    
    public User modelGetUserInfoById(String u_id)
    {
        UsersModel userm = new UsersModel();
        return userm.getUserInfoById(u_id);
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllAdminByInst(String inst_id, int level1, int level2) {
    
        String htmlcode = "";
        String add1 = "";
        String add2 = "";
        
        UsersModel userm = new UsersModel();
        
        for (int i = 0; i < level1; i++) {
            add1 += "../";
        }
        
        for (int i = 0; i < level2; i++) {
            add2 += "../";
        }
        
        for (User admin : userm.getAllAdminByInst(inst_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td> <img class=\"rounded-3\" src='"+ add1 + admin.getUser_profile() +"' width='40'></img> </td>\n" +
"                    <td>"+ admin.getUser_pat() +"</td>\n" +
"                    <td>"+ admin.getUser_mat() +"</td>\n" +
"                    <td>"+ admin.getUser_name() +"</td>\n" +
"                    <td>"
                    + "<a href='"+ add2 +"administradores/ver.jsp?user_id="+ admin.getUser_id() +"'> <i class=\"bi bi-eye-fill\" style=\"font-size: 1.5em;\"></i>  </a><br>"
                  + "</td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
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
 
"                    <td>"+  "<img class=\"rounded-3 me-2\" src='../"+ admin.getUser_profile() +"' width='40'></img>" + admin.getUser_name() + "</td>\n" +
"                    <td>"+ admin.getUser_pat() +"</td>\n" +
"                    <td>"+ admin.getUser_mat() +"</td>\n" +
"                    <td>"+ admin_status +"</td>\n" +
"                    <td>"
                    + "<a href='administradores/ver.jsp?user_id="+ admin.getUser_id() +"'> <i class=\"bi bi-eye-fill\" style=\"font-size: 1.5em;\"></i> </a><br>"
                  + "</td>\n" +
"           </tr>";
            
        }
        
        return htmlcode;
        
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllChByInst(String inst_id, int level1, int level2) {
    
        String htmlcode = "";
        String add1 = "";
        String add2 = "";
        
        UsersModel userm = new UsersModel();
        
        for (int i = 0; i < level1; i++) {
            add1 += "../";
        }
        
        for (int i = 0; i < level2; i++) {
            add2 += "../";
        }
        
        for (User ch : userm.getAllChByInst(inst_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ ch.getUser_id() +"</td>\n" +
"                    <td>"+ ch.getUser_email() +"</td>\n" +
"                    <td>"+ ch.getUser_pass() +"</td>\n" +
"                    <td>"+ ch.getUser_type() +"</td>\n" +
"                    <td>"+ ch.getUser_name() +"</td>\n" +
"                    <td>"+ ch.getUser_pat() +"</td>\n" +
"                    <td>"+ ch.getUser_mat() +"</td>\n" +
"                    <td>"+ ch.getUser_status() +"</td>\n" +
"                    <td> <img src='"+ add1 + ch.getUser_profile() +"' width='40'></img> </td>\n" +
"                    <td>"
                    + "<a href='"+ add2 +"lideres/ver.jsp?user_id="+ ch.getUser_id() +"'>Ver</a><br>"
                  + "</td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllChByCollabRed(String team_id, String proj_id) {
    
        String htmlcode = "";
        
        UsersModel userm = new UsersModel();
        
        for (User ch : userm.getAllChByCollab(team_id, proj_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ ch.getUser_name() +"</td>\n" +
"                    <td> <img src='../../" + ch.getUser_profile() +"' width='40'></img> </td>\n" +
"                    <td>"
                    + "<a href=''>Borrar</a><br>"
                  + "</td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllWkByTeamRed (String team_id) {
    
        String htmlcode = "";
        
        UsersModel userm = new UsersModel();
        
        for (User wk : userm.getAllWkByTeam(team_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ wk.getUser_name() +" "+ wk.getUser_pat() +"</td>\n" +
"                    <td> <img src='../../"+ wk.getUser_profile() +"' width='40'></img> </td>\n" +
"                    <td>"
                    + "<a href='../../tudelete?user_id="+ wk.getUser_id() +"&team_id="+ team_id +"'>Borrar</a><br>"
                  + "</td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllWkByInst(String inst_id, int level1, int level2) {
    
        String htmlcode = "";
        String add1 = "";
        String add2 = "";
        
        UsersModel userm = new UsersModel();
        
        for (int i = 0; i < level1; i++) {
            add1 += "../";
        }
        
        for (int i = 0; i < level2; i++) {
            add2 += "../";
        }
        
        for (User ch : userm.getAllWkByInst(inst_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ ch.getUser_id() +"</td>\n" +
"                    <td>"+ ch.getUser_email() +"</td>\n" +
"                    <td>"+ ch.getUser_pass() +"</td>\n" +
"                    <td>"+ ch.getUser_type() +"</td>\n" +
"                    <td>"+ ch.getUser_name() +"</td>\n" +
"                    <td>"+ ch.getUser_pat() +"</td>\n" +
"                    <td>"+ ch.getUser_mat() +"</td>\n" +
"                    <td>"+ ch.getUser_status() +"</td>\n" +
"                    <td> <img src='"+ add1 + ch.getUser_profile() +"' width='40'></img> </td>\n" +
"                    <td>"
                    + "<a href='"+ add2 +"integrantes/ver.jsp?user_id="+ ch.getUser_id() +"'>Ver</a><br>"
                  + "</td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetListWkByInst(String inst_id) {
        
        String htmlcode = "";
        
        UsersModel userm = new UsersModel();
        
        for (User wk: userm.getAllWkByInst(inst_id))
        {
            htmlcode +=
            "<option value='" + wk.getUser_id() + "' >" + wk.getUser_pat() + " " + wk.getUser_name() + "</option>";
        }
        
        return htmlcode;
        
    }
    
    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetListChByInst(String inst_id) {
        
        String htmlcode = "";
        
        UsersModel userm = new UsersModel();
        
        for (User wk: userm.getAllChByInst(inst_id))
        {
            htmlcode +=
            "<option value='" + wk.getUser_id() + "' >" + wk.getUser_pat() + " " + wk.getUser_name() + "</option>";
        }
        
        return htmlcode;
        
    }
    
    public String modelGetAdmins(String inst_id, String admin_status)
    {
        String htmlcode = "<table border=\"1\">\n"
                + "                <thead>\n"
                + "                    <tr>\n"
                + "                        <th></th>\n"
                + "                        <th></th>\n"
                + "                        <th>Nombre</th>\n"
                + "                        <th></th>\n"
                + "                        <th></th>\n"
                + "                    </tr>\n"
                + "                </thead>\n"
                + "                <tbody>";
        
        UsersModel userm = new UsersModel();
        ArrayList<User> admins = userm.getAdmins(inst_id, admin_status);
        
        if (admins.isEmpty()) 
            htmlcode = "<p>No hay administradores disponibles.</p>";
        else
        {
            for (User admin : admins)
            {
                htmlcode
                        += "<tr>\n"
                        + "     <td>" + admin.getUser_status() + "</td>\n"
                        + "     <td> <img src='../" + admin.getUser_profile() + "' width='40'></img> </td>\n"
                        + "     <td>" + admin.getUser_name() +" "+ admin.getUser_pat() +" "+ admin.getUser_mat() +"</td>\n"
                        + "     <td>" + admin.getUser_email() +"</td>\n"
                        + "     <td> <a href='admin.jsp?id=" + admin.getUser_id() + "'>Ver</a> </td>\n"
                        + "</tr>\n";
            }

            htmlcode += "</tbody>\n"
                    + "</table>";
        }
        
        return htmlcode;
    }
    
    public String modelConvUserType(String u_type) {
    
        String user_type;
        
        switch (u_type)
        {
            case "staff":
                user_type = "Staff";
                break;
            case "admin":
                user_type = "Admin";
                break;
            case "ch":
                user_type = "Lider";
                break;
            case "wk":
                user_type = "Participante";
                break;
            default:
                user_type = "ERROR";
                break;
        }
        
        return user_type;
        
    }
    
    public String modelConvUserStatus(String u_status) {
    
        String user_status;
        
        switch (u_status)
        {
            case "si":
                user_status = "Activo";
                break;
            default:
                user_status = "Inactivo";
                break;
        }
        
        return user_status;
    
    }
    
}
