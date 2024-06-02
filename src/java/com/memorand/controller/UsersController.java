package com.memorand.controller;

import com.memorand.beans.Collab;
import com.memorand.beans.User;
import com.memorand.model.CollabsModel;
import com.memorand.model.UsersModel;
import java.util.ArrayList;

public class UsersController
{
    public boolean modelCreateUser(User u)
    {
        UsersModel userm = new UsersModel();
        return userm.createUser(u);
    }

    public boolean modelValidateUserByLogin(User u)
    {
        UsersModel userm = new UsersModel();
        return userm.validateUserByLogin(u);
    }

    public boolean modelValidateUserByEmail(String u_email)
    {
        UsersModel userm = new UsersModel();
        return userm.validateUserByEmail(u_email);
    }

    public User beanGetUserByLogin(User u)
    {
        UsersModel userm = new UsersModel();
        return userm.getUserByLogin(u);
    }

    public User beanGetUser(String u_id)
    {
        UsersModel userm = new UsersModel();
        return userm.getUser(u_id);
    }

    public String adminGetUserChiefsByInst(String inst_id, boolean all)
    {
        String htmlcode = "";
        
        UsersModel userm = new UsersModel();

        for (User ch : userm.getUserChiefsByInst(inst_id, all))
        {
            String circleFillgreen;
            
            if (ch.getUser_status().equals("si"))
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
            else
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
            
            htmlcode += "<tr>\n"
                     + "<td style='padding: 20px;' class='align-middle'>" + circleFillgreen + "</td>"
                     + "<td style='padding: 20px;' class='align-middle text-start'><img class='me-2 rounded-2' src='../" + ch.getUser_profile() + "' width='40'></img>" + ch.getUser_name() + " " + ch.getUser_pat() + " " + ch.getUser_mat() + "</td>\n"
                     + "<td style='padding: 20px;' class='align-middle'><text style='color: #AFB2B3'>" + ch.getUser_email() + "</text></td>\n"
                     + "<td style='padding: 20px;' class='align-middle'>"
                     + "<a href='lider.jsp?id=" + ch.getUser_id() + "'><i style='color: #25ce7b; font-size: 25px' class=\"bi bi-chevron-right\"></i></a><br>"
                     + "</td>\n"
                     + "</tr>";
        }

        return htmlcode;
    }
    
    public String adminGetUserWorkersByInst(String inst_id, boolean all)
    {
        String htmlcode = "";
        
        UsersModel userm = new UsersModel();

        for (User ch : userm.getUserWorkersByInst(inst_id, all))
        {
            String circleFillgreen;
            
            if (ch.getUser_status().equals("si"))
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
            else
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";

            htmlcode += "<tr>\n"
                     + "<td style='padding: 20px;' class='align-middle'>" + circleFillgreen + "</td>"
                     + "<td style='padding: 20px;' class='align-middle text-start'><img class='me-2 rounded-2' src='../" + ch.getUser_profile() + "' width='40'></img>" + ch.getUser_name() + " " + ch.getUser_pat() + " " + ch.getUser_mat() + "</td>\n"
                     + "<td style='padding: 20px;' class='align-middle'><text style='color: #AFB2B3'>" + ch.getUser_email() + "</text></td>\n"
                     + "<td style='padding: 20px;' class='align-middle'>"
                     + "<a href='integrante.jsp?id=" + ch.getUser_id() + "'><i style='color: #25ce7b; font-size: 25px' class=\"bi bi-chevron-right\"></i></a><br>"
                     + "</td>\n"
                     + "</tr>";
        }

        return htmlcode;
    }

    public String adminGetUserChiefsByCollab(String team_id, String proj_id)
    {
        String htmlcode = "";

        UsersModel userm = new UsersModel();

        for (User ch : userm.getUserChiefsByCollab(team_id, proj_id))
            htmlcode += "<tr>\n"
                     + "<td><img class='rounded-2 me-2' src='../../" + ch.getUser_profile() + "' width='40'></img>" + ch.getUser_name() + "</td>\n"
                     + "<td>"
                     + "<a href='' style='color: red'><i class=\"bi bi-trash3-fill\"></i></a><br>"
                     + "</td>\n"
                     + "</tr>";

        return htmlcode;
    }

    public String adminGetUserWorkersByTeam(String team_id)
    {
        String htmlcode = "";

        UsersModel userm = new UsersModel();

        for (User wk : userm.getUserWorkersByTeam(team_id))
            htmlcode += "<tr>\n"
                     + "<td style='padding: 20px;' class='align-middle text-start'><text class='ms-5'><img class='me-2 rounded-2' src='../" + wk.getUser_profile() + "' width='40'></img>" + wk.getUser_name() + " " + wk.getUser_pat() + "</text></td>\n"
                     + "<td style='padding: 20px;' class='align-middle'>"
                     + "<a style='color:red' href='../tudelete?user_id=" + wk.getUser_id() + "&team_id=" + team_id + "'><i class=\"bi bi-trash3-fill\"></i></a><br>"
                     + "<a href='integrante.jsp?id=" + wk.getUser_id() + "&team_id=" + team_id + "'><i class=\"bi bi-chevron-right\" style=\"font-size: 25px;\"></i></a><br>"
                     + "</td>\n"
                     + "</tr>";

        return htmlcode;
    }

    public String adminGetUserWorkersSelectByInst(String inst_id, boolean all)
    {
        String htmlcode = "";

        UsersModel userm = new UsersModel();

        for (User wk : userm.getUserWorkersByInst(inst_id, all))
            htmlcode += "<option value='" + wk.getUser_id() + "' >" + wk.getUser_pat() + " " + wk.getUser_name() + "</option>";

        return htmlcode;
    }

    public String adminGetUserChiefsSelectByInst(String inst_id, boolean all)
    {
        String htmlcode = "";

        UsersModel userm = new UsersModel();

        for (User wk : userm.getUserChiefsByInst(inst_id, all))
            htmlcode += "<option value='" + wk.getUser_id() + "' >" + wk.getUser_pat() + " " + wk.getUser_name() + "</option>";

        return htmlcode;
    }

    public String staffGetUserAdminsByInst(String inst_id, String status)
    {
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
        ArrayList<User> admins = userm.getUserAdminsByInst(inst_id, status);

        if (admins.isEmpty())
        {
            htmlcode = "<p class='mt-5'>No hay administradores disponibles.</p>";
            return htmlcode;
        }
        else
        {
            for (User admin : admins)
            {
                String circleFillgreen;
                
                if (admin.getUser_status().equals("si"))
                    circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
                else
                    circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
                
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

    public String workGetUsersByCollab(String collab_id)
    {
        String htmlcode = "";

        CollabsModel collabm = new CollabsModel();
        Collab collab = collabm.getCollabInfoById(collab_id);

        if (collab != null)
        {
            String team_id = collab.getTeam_id();
            String proj_id = collab.getProj_id();

            UsersModel userm = new UsersModel();

            ArrayList<User> chs = userm.getUserChiefsByCollab(team_id, proj_id);
            ArrayList<User> wks = userm.getUserWorkersByTeam(team_id);

            if (chs.isEmpty())
            {
                htmlcode += "<div class=\"row\">"
                        + "<div class=\"col-lg-1 d-none d-lg-block\"></div>"
                        + "<div class=\"col-lg-10\">"
                         + "<h2>L&iacute;deres</h2>"
                        + "<p>No hay l&iacute;deres disponibles.</p>"
                        + "</div>"
                        + "</div>"
                        + "<div class=\"col-lg-1 d-none d-lg-block\"></div>"
                        + "</div>";
            }
            else
            {
                htmlcode += "<div class=\"row mt-3\">"
                        + "<div class=\"col-lg-1 d-none d-lg-block\"></div>"
                        + "<div class=\"col-lg-10\">"
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
                        + "<div class=\"col-lg-1 d-none d-lg-block\"></div>";
            }

            if (wks.isEmpty())
            {
                 htmlcode += "<div class=\"row\">"
                        + "<div class=\"col-lg-1 d-none d-lg-block\"></div>"
                        + "<div class=\"col-lg-10\">"
                         + "<h2>Integrantes</h2>"
                        + "<p>No hay integrantes disponibles.</p>"
                         + "</div>"
                        + "</div>"
                        + "<div class=\"col-lg-1 d-none d-lg-block\"></div>"
                        + "</div>";
            }
            else
            {
                htmlcode += "<div class=\"row mt-2\">"
                        + "<div class=\"col-lg-1 d-none d-lg-block\"></div>"
                        + "<div class=\"col-lg-10\">"
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
                        + "<div class=\"col-lg-1 d-none d-lg-block\"></div>";
            }
        }

        return htmlcode;
    }

    public boolean modelUpdateUserProfile(User u)
    {
        UsersModel userm = new UsersModel();
        return userm.updateUserProfile(u);
    }
    
    public boolean modelUpdateUserStatus(String u_id, String u_status)
    {
        UsersModel userm = new UsersModel();
        return userm.updateUserStatus(u_id, u_status);
    }

    public boolean modelUpdateUserPassword(String u_id, String u_pass)
    {
        UsersModel userm = new UsersModel();
        return userm.updateUserPassword(u_id, u_pass);
    }
    
    public String convertUserType(String type)
    {
        String user_type;

        switch (type)
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
                user_type = "Integrante";
                break;
            default:
                user_type = "ERROR";
                break;
        }

        return user_type;
    }

    public String convertUserStatus(String status)
    {
        String user_status;

        switch (status)
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