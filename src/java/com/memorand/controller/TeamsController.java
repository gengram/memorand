package com.memorand.controller;

import com.memorand.beans.Team;
import com.memorand.beans.User;
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
        String htmlcode = "";
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
                    return htmlcode;
            }
        }

        if (teams.isEmpty())
        {
            htmlcode = "<p>No hay equipos por mostrar.</p>";
            return htmlcode;
        }
        else
        {
            for (Team t : teams)
            {
                ProjectsController projc = new ProjectsController();

                if (user_type != null)
                {
                    switch (user_type)
                    {
                        case "ch":
                            hrefcode = "<a href='rendimiento.jsp?id=" + t.getTeam_id() + "'class='subtitulo text-end' style='color: #AFB2B3; font-size: 18px;'>Ver rendimiento <i class='bi bi-chevron-right' style='color: #AFB2B3;'></i></a>";
                            break;
                        case "wk":
                        default:
                            hrefcode = "";
                            break;
                    }
                }

               htmlcode += "<div class=\"card border border-1\" style=\"max-height: 60px;\">\n"
                        + "    <div class=\"row g-0\">\n"
                        + "        <div class=\"col-2\" style=\"background-color: #" + t.getTeam_color() + "; max-height: 58px; min-width: 40px; width: 40px;\"></div>\n"
                        + "        <div class=\"col-10 ms-2 ms-md-4\">\n"
                        + "            <div class=\"card-header\" style=\"background-color: transparent;\">\n"
                        + "                <p class=\"titulo text-end mt-1 ms-3\" style=\"color: #2A2927; font-size: 21px;\">\n"
                        + t.getTeam_name()
                        + hrefcode
                        + "                </p>\n"
                        + "            </div>\n"
                        + "        </div>\n"
                        + "    </div>\n"
                        + "</div>";

                htmlcode += "<div class='mt-3'></div>";
                htmlcode += projc.workGetProjects(t.getTeam_id(), user_id);
            }
        }

        return htmlcode;
    }

}
