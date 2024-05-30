package com.memorand.controller;

import com.memorand.beans.Collab;
import com.memorand.beans.User;
import com.memorand.model.CollabsModel;
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

    public User modelGetUserInfoById(String u_id) {
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

        for (User admin : userm.getAllAdminByInst(inst_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td> <img class=\"rounded-3\" src='" + add1 + admin.getUser_profile() + "' width='40'></img> </td>\n"
                    + "                    <td>" + admin.getUser_pat() + "</td>\n"
                    + "                    <td>" + admin.getUser_mat() + "</td>\n"
                    + "                    <td>" + admin.getUser_name() + "</td>\n"
                    + "                    <td>"
                    + "<a href='" + add2 + "administradores/ver.jsp?user_id=" + admin.getUser_id() + "'> <i class=\"bi bi-eye-fill\" style=\"font-size: 1.5em;\"></i>  </a><br>"
                    + "</td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllAdmin() {

        String htmlcode = "";

        UsersModel userm = new UsersModel();

        for (User admin : userm.getAllAdmin()) {
            String admin_status = admin.getUser_status();

            switch (admin_status) {
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

            htmlcode
                    += "<tr>\n"
                    + "                    <td>" + "<img class=\"rounded-3 me-2\" src='../" + admin.getUser_profile() + "' width='40'></img>" + admin.getUser_name() + "</td>\n"
                    + "                    <td>" + admin.getUser_pat() + "</td>\n"
                    + "                    <td>" + admin.getUser_mat() + "</td>\n"
                    + "                    <td>" + admin_status + "</td>\n"
                    + "                    <td>"
                    + "<a href='administradores/ver.jsp?user_id=" + admin.getUser_id() + "'> <i class=\"bi bi-eye-fill\" style=\"font-size: 1.5em;\"></i> </a><br>"
                    + "</td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetImgUser(String inst_id, int level1) {
        String htmlcode = "";
        String add1 = "";

        UsersModel userm = new UsersModel();

        for (int i = 0; i < level1; i++) {
            add1 += "../";
        }

        for (User ch : userm.getAllChByInst(inst_id)) {
            htmlcode += "<a class=\"navbar-brand\" href=\"/memorand/work/perfil.jsp\">"
                    + "<img src='\"+ add1 + ch.getUser_profile() +\"' width=\"230\" style=\"margin-left: 10%\">"
                    + "</a>";
        }

        return htmlcode;

    }

    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllChByInst(String inst_id) {

        String htmlcode = "";
        
        UsersModel userm = new UsersModel();

        for (User ch : userm.getAllChByInst(inst_id)) {
            String circleFillgreen;
            if (ch.getUser_status().equals("si")) {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
            } else {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
            }
            htmlcode
                    += "<tr>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'>" + circleFillgreen + "</td>"
                    + "                    <td style='padding: 20px;' class='align-middle text-start'><img class='me-2 rounded-2' src='../" + ch.getUser_profile() + "' width='40'></img>" + ch.getUser_name() + " " + ch.getUser_pat() + " " + ch.getUser_mat() + "</td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'><text style='color: #AFB2B3'>" + ch.getUser_email() + "</text></td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'>"
                    + "<a href='lider.jsp?id=" + ch.getUser_id() + "'><i style='color: #25ce7b; font-size: 25px' class=\"bi bi-chevron-right\"></i></a><br>"
                    + "</td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllChByCollabRed(String team_id, String proj_id) {

        String htmlcode = "";

        UsersModel userm = new UsersModel();

        for (User ch : userm.getAllChByCollab(team_id, proj_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td><img class='rounded-2 me-2' src='../../" + ch.getUser_profile() + "' width='40'></img>" + ch.getUser_name() + "</td>\n"
                    + "                    <td>"
                    + "<a href='' style='color: red'><i class=\"bi bi-trash3-fill\"></i></a><br>"
                    + "</td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllWkByTeamRed(String team_id) {

        String htmlcode = "";

        UsersModel userm = new UsersModel();

        for (User wk : userm.getAllWkByTeam(team_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td style='padding: 20px;' class='align-middle text-start'><text class='ms-5'><img class='me-2 rounded-2' src='../" + wk.getUser_profile() + "' width='40'></img>" + wk.getUser_name() + " " + wk.getUser_pat() + "</text></td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'>"
                    + "<a style='color:red' href='../tudelete?user_id=" + wk.getUser_id() + "&team_id=" + team_id + "'>Borrar</a><br>"
                    + "<a href='integrante.jsp?id=" + wk.getUser_id() + "&team_id=" + team_id + "'><i class=\"bi bi-chevron-right\" style=\"font-size: 25px;\"></i></a><br>"
                    + "</td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetAllWkByInst(String inst_id) {

        String htmlcode = "";
        String add1 = "";
        String add2 = "";

        UsersModel userm = new UsersModel();

        for (User ch : userm.getAllWkByInst(inst_id)) {
            String circleFillgreen;
            if (ch.getUser_status().equals("si")) {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
            } else {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
            }

            htmlcode
                    += "<tr>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'>" + circleFillgreen + "</td>"
                    + "                    <td style='padding: 20px;' class='align-middle text-start'><img class='me-2 rounded-2' src='../" + ch.getUser_profile() + "' width='40'></img>" + ch.getUser_name() + " " + ch.getUser_pat() + " " + ch.getUser_mat() + "</td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'><text style='color: #AFB2B3'>" + ch.getUser_email() + "</text></td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'>"
                    + "<a href='integrante.jsp?id=" + ch.getUser_id() + "'><i style='color: #25ce7b; font-size: 25px' class=\"bi bi-chevron-right\"></i></a><br>"
                    + "</td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetListWkByInst(String inst_id) {

        String htmlcode = "";

        UsersModel userm = new UsersModel();

        for (User wk : userm.getAllWkByInst(inst_id)) {
            htmlcode
                    += "<option value='" + wk.getUser_id() + "' >" + wk.getUser_pat() + " " + wk.getUser_name() + "</option>";
        }

        return htmlcode;

    }

    // DEPRECIADO BORRAR CUANDO SEA SEGURO
    public String modelGetListChByInst(String inst_id) {

        String htmlcode = "";

        UsersModel userm = new UsersModel();

        for (User wk : userm.getAllChByInst(inst_id)) {
            htmlcode
                    += "<option value='" + wk.getUser_id() + "' >" + wk.getUser_pat() + " " + wk.getUser_name() + "</option>";
        }

        return htmlcode;

    }

    public String modelGetAdmins(String inst_id, String admin_status) {
        String htmlcode = "<table class='table mt-3'>\n"
                + "                <thead>\n"
                + "                    <tr>\n"
                + "                        <th scope='col'></th>\n"
                + "                        <th scope='col'><text class='ms-5'>Nombre</text></th>\n"
                + "                        <th scope='col'></th>\n"
                + "                        <th scope='col'></th>\n"
                + "                    </tr>\n"
                + "                </thead>\n"
                + "                <tbody>";

        UsersModel userm = new UsersModel();
        ArrayList<User> admins = userm.getAdmins(inst_id, admin_status);

        if (admins.isEmpty()) {
            htmlcode = "<p class='mt-5'>No hay administradores disponibles.</p>";
            return htmlcode;
        } else {
            for (User admin : admins) {
                String circleFillgreen;
                if (admin.getUser_status().equals("si")) {
                    circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
                } else {
                    circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
                }
                htmlcode
                        += "<tr>\n"
                        + "     <td style='padding: 20px;' class='align-middle'>" + circleFillgreen + "</td>\n"
                        + "     <td style='padding: 20px;' class='align-middle'> <img class='me-3' src='../" + admin.getUser_profile() + "' width='40'></img>"  + admin.getUser_name() + " " + admin.getUser_pat() + " " + admin.getUser_mat() + "</td>\n"
                        + "     <td style='padding: 20px;' class='align-middle'>" + admin.getUser_email() + "</td>\n"
                        + "     <td style='padding: 20px;' class='align-middle'> <a href='admin.jsp?id=" + admin.getUser_id() + "'><i style='color: #7473C0; font-size: 25px' class=\"bi bi-chevron-right\"></i></a> </td>\n"
                        + "</tr>\n";
            }

            htmlcode += "</tbody>\n"
                    + "</table>";
        }

        return htmlcode;
    }

    public String modelGetPeople(String collab_id) {
        String htmlcode = "";

        CollabsModel collabm = new CollabsModel();
        Collab collab = collabm.getCollabInfoById(collab_id);

        if (collab != null) {
            String team_id = collab.getTeam_id();
            String proj_id = collab.getProj_id();

            UsersModel userm = new UsersModel();

            ArrayList<User> chs = userm.getAllChByCollab(team_id, proj_id);
            ArrayList<User> wks = userm.getAllWkByTeam(team_id);

            if (chs.isEmpty())
            {
                htmlcode += "<div class=\"row\">"
                        + "<div class=\"col-1\"></div>"
                        + "<div class=\"col-10\">"
                         + "<h2>L&iacute;deres</h2>"
                        + "<p>No hay l&iacute;deres disponibles.</p>"
                        + "</div>"
                        + "</div>"
                        + "<div class=\"col-1\"></div>"
                        + "</div>";
            }
            else
            {
                htmlcode += "<div class=\"row mt-3\">"
                        + "<div class=\"col-1\"></div>"
                        + "<div class=\"col-10\">"
                        + "<h2>L&iacute;deres</h2>"
                        + "<table class=\"table text-center mt-\">\n"
                        + "     <thead>\n"
                        + "         <tr>\n"
                        + "             <th scope=\"col\" ></th>\n"
                        + "             <th scope=\"col\" >Nombre</th>\n"
                        + "             <th scope=\"col\" >Correo</th>\n"
                        + "         </tr>\n"
                        + "     </thead>\n"
                        + "  <tbody>";

                for (User ch : chs)
                {
                    htmlcode += "<tr>\n"
                            + "     <td class=\"align-middle\" ><img src='../"+ ch.getUser_profile() +"' width='40'/> </td>\n"
                            + "     <td class=\"align-middle\" >" + ch.getUser_name() + " " + ch.getUser_pat() + " " + ch.getUser_mat() + "</td>\n"
                            + "     <td class=\"align-middle\">" + ch.getUser_email() + "</td>\n"
                            + "  </tr>";
                }

                htmlcode += "</tbody>\n"
                        + "</table>"
                        + "</div>"
                        + "<div class=\"col-1\"></div>";
            }

            if (wks.isEmpty())
            {
                 htmlcode += "<div class=\"row\">"
                        + "<div class=\"col-1\"></div>"
                        + "<div class=\"col-10\">"
                         + "<h2>Integrantes</h2>"
                        + "<p>No hay integrantes disponibles.</p>"
                         + "</div>"
                        + "</div>"
                        + "<div class=\"col-1\"></div>"
                        + "</div>";
            }
            else
            {
                htmlcode += "<div class=\"row mt-2\">"
                        + "<div class=\"col-1\"></div>"
                        + "<div class=\"col-10\">"
                        + "<h2>Integrantes</h2>"
                        + "<table class=\"table text-center mt-3\" >\n"
                        + "     <thead>\n"
                        + "         <tr>\n"
                        + "             <th scope=\"col\"></th>\n"
                        + "             <th scope=\"col\">Nombre</th>\n"
                        + "             <th scope=\"col\">Correo</th>\n"
                        + "         </tr>\n"
                        + "     </thead>\n"
                        + "  <tbody>";

                for (User wk : wks) 
                {
                    htmlcode += "<tr>\n"
                            + "     <td class=\"align-middle\" ><img src='../"+ wk.getUser_profile() +"' width='40'/> </td>\n"
                            + "     <td class=\"align-middle\" >" + wk.getUser_name() + " " + wk.getUser_pat() + " " + wk.getUser_mat() + "</td>\n"
                            + "     <td class=\"align-middle\" >" + wk.getUser_email() + "</td>\n"
                            + "  </tr>";
                }

                htmlcode += "</tbody>\n"
                        + "</table>"
                        + "</div>"
                        + "<div class=\"col-1\"></div>";
            }
        }

        return htmlcode;
    }

    public String modelConvUserType(String u_type) {

        String user_type;

        switch (u_type) {
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
                user_type = "Integrante";
                break;
            default:
                user_type = "ERROR";
                break;
        }

        return user_type;

    }

    public String modelConvUserStatus(String u_status) {

        String user_status;

        switch (u_status) {
            case "si":
                user_status = "Activo";
                break;
            default:
                user_status = "Inactivo";
                break;
        }

        return user_status;

    }

    public boolean modelUpdateUser(User user) {
        UsersModel userm = new UsersModel();
        return userm.updateUser(user);
    }

    public boolean modelUpdateUserStatus(String user_id, String user_status) {
        UsersModel userm = new UsersModel();
        return userm.updateUserStatus(user_id, user_status);
    }
}
