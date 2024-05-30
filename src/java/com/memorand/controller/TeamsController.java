package com.memorand.controller;

import com.memorand.beans.Team;
import com.memorand.beans.User;
import com.memorand.model.TeamsModel;
import java.util.ArrayList;

public class TeamsController {

    public boolean modelCreateTeam(Team team) {
        TeamsModel teamm = new TeamsModel();
        return teamm.createTeam(team);
    }

    public Team modelGetTeamInfoById(String t_id) {
        TeamsModel teamm = new TeamsModel();
        return teamm.getTeamInfoById(t_id);
    }

    public Team modelGetTeamInfoByCollab(String collab_id) {
        TeamsModel teamm = new TeamsModel();
        return teamm.getTeamInfoByCollab(collab_id);
    }

    // DEPRECIADO
    public String modelGetAllTeamsByInst(String inst_id, int level1) {

        String htmlcode = "";
        String add1 = "";

        TeamsModel teamm = new TeamsModel();

        for (int i = 0; i < level1; i++) {
            add1 += "../";
        }

        for (Team team : teamm.getAllTeamsByInst(inst_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td style='padding: 20px;' class='align-middle text-start'><i style=\"color: #" + team.getTeam_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2\"></i>" + team.getTeam_name() + "</td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'>"
                    + "                       <a href='" + add1 + "departamentos/ver.jsp?team_id=" + team.getTeam_id() + "'>  <i class=\"bi bi-chevron-right\" style=\"font-size: 25px;\"></i> </a><br>"
                    + "                    </td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    // DEPRECIADO
    public String modelGetAllTeamsByInstRed(String inst_id) {

        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getAllTeamsByInst(inst_id)) {

            htmlcode += "<option value='" + team.getTeam_id() + "' style='background-color:#" + team.getTeam_color() + "' >" + team.getTeam_name() + "</option>";

        }

        return htmlcode;

    }

    public String modelGetAllTeamsByInstRed2(String inst_id) {

        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getAllTeamsByInst(inst_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td style='padding: 20px;' class='align-middle text-start'><i style=\"color: #" + team.getTeam_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2\"></i>" + team.getTeam_name() + "</td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle '>"
                    + "                       <a href='?team_id=" + team.getTeam_id() + "'> <i class=\"bi bi-chevron-right\" style=\"font-size: 25px;\"></i> </a><br>"
                    + "                    </td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    public String modelGetAllTeamsByProjRed(String proj_id) {

        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getAllTeamsByInst(proj_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td>" + team.getTeam_name() + "</td>\n"
                    + "                    <td>"
                    + "                       <svg width='50' height='50'>\n"
                    + "                           <rect width='50' height='50' style='fill:#" + team.getTeam_color() + ";stroke:black;stroke-width:2'/>\n"
                    + "                       </svg>"
                    + "                    </td>\n"
                    + "                    <td>"
                    + "                       <a href='?team_id=" + team.getTeam_id() + "'>Ver</a><br>"
                    + "                    </td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    // DEPRECIADO
    public String modelGetAllTeamsByUserRed(String user_id) {

        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getAllTeamsByWk(user_id)) {
            htmlcode
                    += "<tr>\n"
                    + "                    <td style='padding: 20px;' class='align-middle text-start'><text class='ms-5'><i style=\"color: #" + team.getTeam_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2\"></i>" + team.getTeam_name() + "</text></td>\n"
                    + "                    <td style='padding: 20px;' class='align-middle'>"
                    + "                       <a href='../departamentos/ver.jsp?team_id=" + team.getTeam_id() + "'><i class=\"bi bi-chevron-right\" style=\"font-size: 25px;\"></i></a><br>"
                    + "                    </td>\n"
                    + "           </tr>";

        }

        return htmlcode;

    }

    public String modelGetAllTeamsByUserRed3(String user_id) {

        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getAllTeamsByWk(user_id)) {
            htmlcode += "<option value='" + team.getTeam_id() + "' style='background-color:#" + team.getTeam_color() + "' >" + team.getTeam_name() + "</option>";
        }

        return htmlcode;

    }

    // DEPRECIADO
    public String modelGetAllTeamsByUserRed2(String user_id) {
        String htmlcode = "";

        UsersController userc = new UsersController();
        User user = userc.modelGetUserInfoById(user_id);

        String user_type = user.getUser_type();

        if (user_type.equals("ch")) {
            TeamsModel teamm = new TeamsModel();

            for (Team team : teamm.getAllTeamsByCh(user_id)) {
                htmlcode
                        += "<tr>\n"
                        + "                    <td>" + team.getTeam_name() + "</td>\n"
                        + "                    <td>"
                        + "                       <svg width='50' height='50'>\n"
                        + "                           <rect width='50' height='50' style='fill:#" + team.getTeam_color() + ";stroke:black;stroke-width:2'/>\n"
                        + "                       </svg>"
                        + "                    </td>\n"
                        + "                    <td>"
                        + "                       <a href='departamento.jsp?team_id=" + team.getTeam_id() + "&view=info'>Estadísticas</a><br>"
                        + "                       <a href='?team_id=" + team.getTeam_id() + "'>Ver</a><br>"
                        + "                    </td>\n"
                        + "           </tr>";
            }
        } else {
            TeamsModel teamm = new TeamsModel();

            for (Team team : teamm.getAllTeamsByWk(user_id)) {

                htmlcode
                        += "<tr>\n"
                        + "                    <td>" + team.getTeam_name() + "</td>\n"
                        + "                    <td>"
                        + "                       <svg width='50' height='50'>\n"
                        + "                           <rect width='50' height='50' style='fill:#" + team.getTeam_color() + ";stroke:black;stroke-width:2'/>\n"
                        + "                       </svg>"
                        + "                    </td>\n"
                        + "                    <td>"
                        + "                       <a href='?team_id=" + team.getTeam_id() + "'>Ver</a><br>"
                        + "                    </td>\n"
                        + "           </tr>";
            }
        }

        return htmlcode;
    }

    // DEPRECIADO
    public String modelGetListTeamsByInst(String inst_id) {
        String htmlcode = "";

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getAllTeamsByInst(inst_id)) {
            htmlcode
                    += "<option value='" + team.getTeam_id() + "' style='background-color:#" + team.getTeam_color() + "' >" + team.getTeam_name() + "</option>";
        }

        return htmlcode;
    }

    public String modelGetListTeamsByInst2(String inst_id, String selectedTeamName) {
        StringBuilder htmlcode = new StringBuilder();

        TeamsModel teamm = new TeamsModel();

        for (Team team : teamm.getAllTeamsByInst(inst_id)) {
            htmlcode.append("<option value='").append(team.getTeam_id()).append("' style='background-color:#").append(team.getTeam_color()).append("' ");

            // Marcar como seleccionada la opción correspondiente al equipo actual
            if (team.getTeam_name().equals(selectedTeamName)) {
                htmlcode.append("selected");
            }

            htmlcode.append(">").append(team.getTeam_name()).append("</option>");
        }

        return htmlcode.toString();
    }

    public String modelGetTeams(String user_id) {
        String htmlcode = "";
        String hrefcode = "";

        TeamsModel teamm = new TeamsModel();
        ArrayList<Team> teams = new ArrayList<>();

        UsersController userc = new UsersController();
        User user = userc.modelGetUserInfoById(user_id);

        String user_type = user.getUser_type();

        if (user_type != null) {
            switch (user_type) {
                case "ch":
                    teams = teamm.getAllTeamsByCh(user_id);
                    break;
                case "wk":
                    teams = teamm.getAllTeamsByWk(user_id);
                    break;
                default:
                    return htmlcode;
            }
        }

        if (teams.isEmpty()) {
            htmlcode = "<p>No hay equipos por mostrar.</p>";
            return htmlcode;
        } else {
            for (Team t : teams) {
                ProjectsController projc = new ProjectsController();

                if (user_type != null) {
                    switch (user_type) {
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
                        + "        <div class=\"col-md-2\"></div>\n"
                        + "        <div class=\"col-md-11 ms-4\">\n"
                        + "            <div class=\"card-header\" style=\"background-color: transparent;\">\n"
                        + "                <p class=\"titulo text-end mt-1\" style=\"color: #2A2927; font-size: 21px;\">\n"
                        + t.getTeam_name()
                        + hrefcode
                        + "                </p>\n"
                        + "            </div>\n"
                        + "        </div>\n"
                        + "    </div>\n"
                        + "</div>";

                htmlcode += "<div class='mt-3'></div>";
                htmlcode += projc.modelGetProjects(t.getTeam_id(), user_id);
            }
        }

        return htmlcode;
    }

}
