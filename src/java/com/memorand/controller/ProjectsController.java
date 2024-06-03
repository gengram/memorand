package com.memorand.controller;

import com.memorand.beans.Collab;
import com.memorand.beans.Project;
import com.memorand.beans.User;
import com.memorand.model.CollabsModel;
import com.memorand.model.ProjectsModel;
import java.util.ArrayList;

public class ProjectsController
{
    public boolean modelCreateProject(Project p)
    {
        ProjectsModel projm = new ProjectsModel();
        return projm.createProject(p);
    }
    
    public boolean modelDeleteProject(String p_id)
    {
        ProjectsModel projm = new ProjectsModel();
        return projm.deleteProject(p_id);
    }

    public Project beanGetProject(String p_id)
    {
        ProjectsModel projm = new ProjectsModel();
        return projm.getProject(p_id);
    }

    public Project beanGetProjectByCollab(String collab_id)
    {
        ProjectsModel projm = new ProjectsModel();
        return projm.getProjectByCollab(collab_id);
    }

    // DEPRECIADO
    public String modelGetAllProjectsByInst(String inst_id) {
        String htmlcode = "";

        ProjectsModel projm = new ProjectsModel();

        for (Project project : projm.getProjectsByInstitution(inst_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td style='padding: 20px;' class='align-middle text-start'><text class=\"ms-5\">" + "<i style=\"color: #" + project.getProj_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2 mt-5\"></i> " + project.getProj_name() + "</text></td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'>"
                    + "                       <a href='proyecto.jsp?id=" + project.getProj_id() + "'> <i style='color: #25ce7b; font-size: 25px' class=\"bi bi-chevron-right\"></i> </a><br>"
                    + "                    </td>\n"
                    + "           </tr>";
        }

        return htmlcode;

    }
    public String modelGetAllProjectsByInst2(String inst_id, int level1) {
        String htmlcode = "";
        String add1 = "";

        ProjectsModel projm = new ProjectsModel();

        for (int i = 0; i < level1; i++) {
            add1 += "../";
        }

        for (Project project : projm.getProjectsByInstitution(inst_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td style='padding: 20px;' class='align-middle text-start'><text class=\"ms-5\">" + "<i style=\"color: #" + project.getProj_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2 mt-5\"></i> " + project.getProj_name() + "</text></td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'>"
                    + "                       <a href='" + add1 + "proyectos/ver_1.jsp?proj_id=" + project.getProj_id() + "'> <i style='color: #25ce7b; font-size: 25px' class=\"bi bi-chevron-right\"></i> </a><br>"
                    + "                    </td>\n"
                    + "           </tr>";
        }

        return htmlcode;

    }

    // DEPRECIADO
    public String modelGetListProjectsByInst(String inst_id) {
        String htmlcode = "";

        ProjectsModel projm = new ProjectsModel();

        for (Project project : projm.getProjectsByInstitution(inst_id)) {
            htmlcode
                    += "<option value='" + project.getProj_id() + "' style='background-color:#" + project.getProj_color() + "' >" + project.getProj_name() + "</option>";
        }

        return htmlcode;
    }

    public String modelGetListProjectsByInst2(String inst_id, String selectedProjId) {
        StringBuilder htmlcode = new StringBuilder();

        ProjectsModel projm = new ProjectsModel();

        for (Project project : projm.getProjectsByInstitution(inst_id)) {
            htmlcode.append("<option value='").append(project.getProj_id()).append("' style='background-color:#").append(project.getProj_color()).append("' ");

            // Marcar como seleccionada la opción correspondiente al proyecto actual
            if (project.getProj_id().equals(selectedProjId)) {
                htmlcode.append("selected");
            }

            htmlcode.append(">").append(project.getProj_name()).append("</option>");
        }

        return htmlcode.toString();
    }

    // DEPRECIADO
    public String modelGetAllProjectsByTeamRed(String team_id) {
        String htmlcode = "";

        ProjectsModel projm = new ProjectsModel();

        for (Project project : projm.getProjectsByTeam(team_id)) {
            CollabsModel collabm = new CollabsModel();

            String p_id = project.getProj_id();

            Collab collab = collabm.getCollabByTeamAndProject(team_id, p_id);

            String collab_status = collab.getCollab_status();
            
            String circleFillgreen;
            if (collab.getCollab_status().equals("si")) {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #25ce7b'></i>";
            } else {
                circleFillgreen = "<i class='bi bi-circle-fill' style='color: #F24848'></i>";
            }

            htmlcode
                    += "<tr>\n"
                    + "                    <td style='padding: 20px;' class='align-middle '>" + circleFillgreen + "</td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle '><i style=\"color: #" +  project.getProj_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2\"></i>" + project.getProj_name() + "</td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle '>"
                    + "                       <a href='#'>Desactivar</a>"
                    + "                       <a href='#' style='color:red'>Borrar</a>"
                    + "                    </td>\n"
                    + "           </tr>";
        }

        return htmlcode;
    }

    // DEPRECIADO
    public String modelGetAllProjectsByTeamRed1(String team_id) {
        String htmlcode = "";

        ProjectsModel projm = new ProjectsModel();

        for (Project project : projm.getProjectsByTeam(team_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td><i style=\"color: #" +  project.getProj_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2\"></i>" + project.getProj_name() + "</td>\n"
                    + "                    <td>"
                    + "                       <a href='?team_id=" + team_id + "&proj_id=" + project.getProj_id() + "'><i class=\"bi bi-chevron-right\" style=\"font-size: 25px;\"></i></a>"
                    + "                    </td>\n"
                    + "           </tr>";
        }

        return htmlcode;
    }

    // DEPRECIADO
    public String modelGetAllProjectsByTeamRed2(String team_id, String user_id) {
        String htmlcode = "";

        UsersController userc = new UsersController();
        User user = userc.beanGetUser(user_id);

        String user_type = user.getUser_type();

        if (user_type.equals("ch")) {
            ProjectsModel projm = new ProjectsModel();

            for (Project project : projm.getProjectsByTeamAndUserChief(team_id, user_id)) {
                String proj_id = project.getProj_id();

                CollabsModel collabm = new CollabsModel();
                Collab collab = collabm.getCollabByTeamAndProject(team_id, proj_id);

                String collab_id = collab.getCollab_id();

                htmlcode
                        += "<tr>\n"
                        + "     <td>" + project.getProj_name() + "</td>\n"
                        + "     <td>"
                        + "         <svg width='50' height='50'>\n"
                        + "             <rect width='50' height='50' style='fill:#" + project.getProj_color() + ";stroke:black;stroke-width:2'/>\n"
                        + "         </svg>"
                        + "     </td>\n"
                        + "     <td>"
                        + "         <a href='proyecto.jsp?collab_id=" + collab_id + "'>Ver</a>"
                        + "     </td>\n"
                        + "</tr>";
            }
        } else {
            ProjectsModel projm = new ProjectsModel();

            for (Project project : projm.getProjectsByTeam(team_id)) {
                String proj_id = project.getProj_id();

                CollabsModel collabm = new CollabsModel();
                Collab collab = collabm.getCollabByTeamAndProject(team_id, proj_id);

                String collab_id = collab.getCollab_id();

                htmlcode
                        += "<tr>\n"
                        + "                    <td>" + project.getProj_name() + "</td>\n"
                        + "                    <td>"
                        + "                       <svg width='50' height='50'>\n"
                        + "                           <rect width='50' height='50' style='fill:#" + project.getProj_color() + ";stroke:black;stroke-width:2'/>\n"
                        + "                       </svg>"
                        + "                    </td>\n"
                        + "                    <td>"
                        + "                       <a href='proyecto.jsp?collab_id=" + collab_id + "'>Ver</a>"
                        + "                    </td>\n"
                        + "           </tr>";
            }
        }

        return htmlcode;
    }

    public String modelGetProjects(String team_id, String user_id)
    {
        String htmlcode = "";

        ProjectsModel projm = new ProjectsModel();
        ArrayList<Project> projects = new ArrayList<>();

        UsersController userc = new UsersController();
        User user = userc.beanGetUser(user_id);

        String user_type = user.getUser_type();

        if (user_type != null)
        {
            switch (user_type)
            {
                case "ch":
                    projects = projm.getProjectsByTeamAndUserChief(team_id, user_id);
                    break;
                case "wk":
                    projects = projm.getProjectsByTeam(team_id);
                    break;
                default:
                    htmlcode = "";
                    return htmlcode;
            }
        }

        if (projects.isEmpty())
        {
            htmlcode = "<p>No hay proyectos por mostrar.</p>";
            return htmlcode;
        }
        else
        {
            for (Project p : projects)
            {
                String proj_id = p.getProj_id();

                CollabsModel collabm = new CollabsModel();
                Collab collab = collabm.getCollabByTeamAndProject(team_id, proj_id);

                String collab_id = collab.getCollab_id();

                htmlcode += "   <p class=\"titulo ms-2\" style=\"color: #2A2927\">\n"
                        + "         <i style=\"color: #" + p.getProj_color() + ";\" class=\"bi bi-square-fill\"></i>\n"
                        + "         <span class=\"ms-4\">" + p.getProj_name() + "</span>\n"
                        + "         <a href='collab.jsp?id=" + collab_id + "' class='mr-4'>\n"
                        + "             <i class='bi bi-chevron-right mr-4'></i>\n"
                        + "         </a>\n"
                        + "     </p>\n";
                htmlcode += "<hr>\n";
            }
        }

        return htmlcode;
    }
}
