package com.memorand.controller;

import com.memorand.beans.Collab;
import com.memorand.beans.Project;
import com.memorand.beans.Team;
import com.memorand.beans.User;
import com.memorand.model.CollabsModel;
import com.memorand.model.TeamsModel;
import java.util.ArrayList;

public class TeamsController
{
    public boolean modelCreateTeam(Team t)
    {
        TeamsModel teamm = new TeamsModel();
        return teamm.createTeam(t);
    }
    
    public boolean modelDeleteTeam(String t_id)
    {
        TeamsModel teamm = new TeamsModel();
        return teamm.deleteTeam(t_id);
    }

    public Team beanGetTeam(String t_id)
    {
        TeamsModel teamm = new TeamsModel();
        return teamm.getTeam(t_id);
    }

    public Team beanGetTeamByCollab(String collab_id)
    {
        TeamsModel teamm = new TeamsModel();
        return teamm.getTeamByCollab(collab_id);
    }

    public String adminGetTeamsByInstitution(String inst_id, String page)
    {
        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getTeamsByInstitution(inst_id))
            htmlcode += "<tr>\n"
                     + "<td style='padding: 20px;' class='align-middle text-start'><i style=\"color: #" + team.getTeam_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2\"></i>" + team.getTeam_name() + "</td>\n"
                     + "<td style='padding: 20px;' class='align-middle'>"
                     + "<a href='"+ page +".jsp?team_id=" + team.getTeam_id() + "'>  <i class=\"bi bi-chevron-right\" style=\"font-size: 25px;\"></i> </a><br>"
                     + "</td>\n"
                     + "</tr>";

        return htmlcode;
    }

    public String adminGetTeamsSelectByInstitution(String inst_id)
    {
        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getTeamsByInstitution(inst_id))
            htmlcode += "<option value='" + team.getTeam_id() + "' style='background-color:#" + team.getTeam_color() + "' >" + team.getTeam_name() + "</option>";

        return htmlcode;
    }

    public String adminGetTeamsByProject(String proj_id)
    {
        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getTeamsByProject(proj_id))
            htmlcode += "<tr>\n"
                     + "<td>" + team.getTeam_name() + "</td>\n"
                     + "<td>"
                     + "<svg width='50' height='50'>\n"
                     + "<rect width='50' height='50' style='fill:#" + team.getTeam_color() + ";stroke:black;stroke-width:2'/>\n"
                     + "</svg>"
                     + "</td>\n"
                     + "<td>"
                     + "<a href='equipo.jsp?id=" + team.getTeam_id() + "'>Ver</a><br>"
                     + "</td>\n"
                     + "</tr>";

        return htmlcode;
    }

    public String adminGetTeamsByUserWorker(String user_id)
    {
        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getTeamsByUserWorker(user_id))
            htmlcode += "<tr>\n"
                     + "<td style='padding: 20px;' class='align-middle text-start'><text class='ms-5'><i style=\"color: #" + team.getTeam_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2\"></i>" + team.getTeam_name() + "</text></td>\n"
                     + "<td style='padding: 20px;' class='align-middle'>"
                     + "<a href='equipo.jsp?id=" + team.getTeam_id() + "'><i class=\"bi bi-chevron-right\" style=\"font-size: 25px;\"></i></a><br>"
                     + "</td>\n"
                     + "</tr>";

        return htmlcode;
    }

    public String adminGetTeamsSelectByUserWorker(String user_id)
    {
        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getTeamsByUserWorker(user_id))
            htmlcode += "<option value='" + team.getTeam_id() + "' style='background-color:#" + team.getTeam_color() + "' >" + team.getTeam_name() + "</option>";

        return htmlcode;
    }

    public String workGetTeamsByUser(String user_id)
    {
        StringBuilder htmlcode = new StringBuilder();
        String hrefcode = "";

        TeamsModel teamm = new TeamsModel();
        ArrayList<Team> teams = new ArrayList<>();

        UsersController userc = new UsersController();
        User user = userc.beanGetUser(user_id);

        String user_type = user.getUser_type();

        if (user_type != null)
        {
            switch (user_type)
            {
                case "ch":
                    teams = teamm.getTeamsByUserChief(user_id);
                    break;
                case "wk":
                    teams = teamm.getTeamsByUserWorker(user_id);
                    break;
                default:
                    return htmlcode.toString();
            }
        }

        if (teams.isEmpty())
        {
            htmlcode.append("<p>No hay equipos por mostrar.</p>");
            return htmlcode.toString();
        }

        ProjectsController projc = new ProjectsController();
        CollabsModel collabm = new CollabsModel();

        for (Team t : teams)
        {
            switch (user_type)
            {
                case "ch":
                    ArrayList<Project> all_proj = projc.beanGetProjectsByTeam(t.getTeam_id());
                    
                    if (all_proj.size() == 1)
                    {
                        Project alone_proj = all_proj.get(0);
                        String proj_id = alone_proj.getProj_id();
                        Collab collab = collabm.getCollabByTeamAndProject(t.getTeam_id(), proj_id);
                        String collab_id = collab.getCollab_id();
                        hrefcode = "<a href='rendimiento.jsp?id=" + collab_id + "' class='subtitulo text-end' style='color: #AFB2B3; font-size: 18px;'>Ver rendimiento <i class='bi bi-chevron-right' style='color: #AFB2B3;'></i></a>";
                    }
                    else
                    {
                        hrefcode = "<a href='' data-bs-toggle=\"modal\" data-bs-target=\"#modalRendimiento" + t.getTeam_id() + "\" class='subtitulo text-end' style='color: #AFB2B3; font-size: 18px;'>Ver rendimiento <i class='bi bi-chevron-right' style='color: #AFB2B3;'></i></a>";
                    }
                    break;
                case "wk":
                default:
                    hrefcode = "";
                    break;
            }

            htmlcode.append("<div class=\"card border border-1 mt-4\" style=\"max-height: 60px;\">\n")
                    .append("    <div class=\"row g-0\">\n")
                    .append("        <div class=\"col-2\" style=\"background-color: #").append(t.getTeam_color()).append("; max-height: 58px; min-width: 40px; width: 40px;\"></div>\n")
                    .append("        <div class=\"col-10 ms-2 ms-md-4\">\n")
                    .append("            <div class=\"card-header\" style=\"background-color: transparent;\">\n")
                    .append("                <p class=\"titulo text-end mt-1 ms-3\" style=\"color: #2A2927; font-size: 21px;\">\n")
                    .append(t.getTeam_name())
                    .append(hrefcode)
                    .append("                </p>\n")
                    .append("            </div>\n")
                    .append("        </div>\n")
                    .append("    </div>\n")
                    .append("</div>");

            htmlcode.append("<div class='mt-3'></div>");
            htmlcode.append(projc.workGetProjects(t.getTeam_id(), user_id));

            // Modal Ver Proyecto
            htmlcode.append("      <div class=\"modal fade\" tabindex=\"-1\" role=\"dialog\" id=\"modalRendimiento").append(t.getTeam_id()).append("\">\n")
                    .append("            <div class=\"modal-dialog modal-dialog-centered modal-xlM\" role=\"document\">\n")
                    .append("                <div class=\"modal-content rounded-4 shadow\">\n")
                    .append("                    <div class=\"modal-header p-5 pb-4 border-bottom-0\">\n")
                    .append("                        <h1 class=\"fw-bold mb-0 fs-2\" style=\"color: #2A2927\">Rendimiento de ").append(t.getTeam_name()).append("</h1>\n")
                    .append("                        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n")
                    .append("                    </div>\n")
                    .append("                    <div class=\"modal-body p-5 pt-2\">\n")
                    .append("                        <div class=\"row\">\n")
                    .append("                            <div class=\"col-12\">\n")
                    .append("                                <div>\n")
                    .append("                                    <label class=\"form-label ms-4\">Proyecto</label>\n")
                    .append("                                    <select id=\"proj_page").append(t.getTeam_id()).append("\" class=\"form-select ms-4\" style=\"border-color: #E3E4E5;\" required onchange=\"redirectToPage('proj_page").append(t.getTeam_id()).append("')\">\n")
                    .append("                                        <option value=\"\" disabled selected hidden>Selecciona uno</option>\n")
                    .append(projc.workGetProjectsSelectByTeam(t.getTeam_id()))
                    .append("                                    </select>\n")
                    .append("                                </div>\n")
                    .append("                            </div>\n")
                    .append("                        </div>\n")
                    .append("                    </div>\n")
                    .append("                </div>\n")
                    .append("            </div> \n")
                    .append("        </div>");
        }

        return htmlcode.toString();
    }
}