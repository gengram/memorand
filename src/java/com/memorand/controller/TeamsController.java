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
    
    public Team modelGetTeamInfoById(String t_id)
    {
        TeamsModel teamm = new TeamsModel();
        return teamm.getTeamInfoById(t_id);
    }
    
    public Team modelGetTeamInfoByCollab(String collab_id)
    {
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
        
        for (Team team : teamm.getAllTeamsByInst(inst_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ team.getTeam_name() +"</td>\n" +
"                    <td>" +
"                       <i style=\"color: #"+ team.getTeam_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill\"></i> " +
"                    </td>\n" +
"                    <td>" +
"                       <a href='"+ add1 +"departamentos/ver.jsp?team_id="+ team.getTeam_id() +"'>  <i class=\"bi bi-eye-fill\" style=\"font-size: 1.5em;\"></i> </a><br>" +
"                    </td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    // DEPRECIADO
    public String modelGetAllTeamsByInstRed(String inst_id) {
    
        String htmlcode = "";
        
        TeamsModel teamm = new TeamsModel();
        
        for (Team team : teamm.getAllTeamsByInst(inst_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ team.getTeam_name() +"</td>\n" +
"                    <td>" +
"                       <svg width='50' height='50'>\n" +
"                           <rect width='50' height='50' style='fill:#"+ team.getTeam_color() +";stroke:black;stroke-width:2'/>\n" +
"                       </svg>" +
"                    </td>\n" +
"                    <td>" +
"                       <a href='?team_id="+ team.getTeam_id() +"'>Ver</a><br>" +
"                    </td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    // DEPRECIADO
    public String modelGetAllTeamsByUserRed(String user_id) {
    
        String htmlcode = "";
        
        TeamsModel teamm = new TeamsModel();
        
        for (Team team : teamm.getAllTeamsByUser(user_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ team.getTeam_name() +"</td>\n" +
"                    <td>" +
"                       <svg width='50' height='50'>\n" +
"                           <rect width='50' height='50' style='fill:#"+ team.getTeam_color() +";stroke:black;stroke-width:2'/>\n" +
"                       </svg>" +
"                    </td>\n" +
"                    <td>" +
"                       <a href='?team_id="+ team.getTeam_id() +"'>Ver</a><br>" +
"                    </td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    // DEPRECIADO
    public String modelGetAllTeamsByUserRed2(String user_id)
    {
        String htmlcode = "";
        
        UsersController userc = new UsersController();
        User user = userc.modelGetUserInfoById(user_id);
        
        String user_type = user.getUser_type();
        
        if (user_type.equals("ch"))
        {
            TeamsModel teamm = new TeamsModel();

            for (Team team : teamm.getAllTeamsByCh(user_id))
            {
                htmlcode +=
                "<tr>\n" +
    "                    <td>"+ team.getTeam_name() +"</td>\n" +
    "                    <td>" +
    "                       <svg width='50' height='50'>\n" +
    "                           <rect width='50' height='50' style='fill:#"+ team.getTeam_color() +";stroke:black;stroke-width:2'/>\n" +
    "                       </svg>" +
    "                    </td>\n" +
    "                    <td>" +
    "                       <a href='departamento.jsp?team_id="+ team.getTeam_id() +"&view=info'>Estadísticas</a><br>" +
    "                       <a href='?team_id="+ team.getTeam_id() +"'>Ver</a><br>" +
    "                    </td>\n" +
    "           </tr>";
            }
        }
        else
        {
            TeamsModel teamm = new TeamsModel();

            for (Team team : teamm.getAllTeamsByUser(user_id))
            {
                htmlcode +=
                "<tr>\n" +
    "                    <td>"+ team.getTeam_name() +"</td>\n" +
    "                    <td>" +
    "                       <svg width='50' height='50'>\n" +
    "                           <rect width='50' height='50' style='fill:#"+ team.getTeam_color() +";stroke:black;stroke-width:2'/>\n" +
    "                       </svg>" +
    "                    </td>\n" +
    "                    <td>" +
    "                       <a href='?team_id="+ team.getTeam_id() +"'>Ver</a><br>" +
    "                    </td>\n" +
    "           </tr>";
            }
        }
        
        return htmlcode;
    }
    
    // DEPRECIADO
    public String modelGetListTeamsByInst(String inst_id)
    {
        String htmlcode = "";
        
        TeamsModel teamm = new TeamsModel();
        
        for (Team team : teamm.getAllTeamsByInst(inst_id))
        {
            htmlcode +=
            "<option value='"+ team.getTeam_id() + "' style='background-color:#"+ team.getTeam_color() +"' >"+ team.getTeam_name() + "</option>";
        }
        
        return htmlcode;
    }
    
    public String modelGetTeams(String user_id)
    {
        String htmlcode = "";
        String hrefcode = "";
        
        TeamsModel teamm = new TeamsModel();
        ArrayList<Team> teams = new ArrayList<>();
        
        UsersController userc = new UsersController();
        User user = userc.modelGetUserInfoById(user_id);
        
        String user_type = user.getUser_type();
        
        if(user_type != null)
        {
            switch (user_type)
            {
                case "ch":
                    teams = teamm.getAllTeamsByCh(user_id);
                    break;
                case "wk":
                    teams = teamm.getAllTeamsByUser(user_id);
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
                
                if(user_type != null)
                {
                    switch (user_type)
                    {
                        case "ch":
                            hrefcode = "<a href='rendimiento.jsp?id="+ t.getTeam_id() +"'>&rarr;</a>";
                            break;
                        case "wk":
                        default:
                            hrefcode = "";
                            break;
                    }
                }
                
                htmlcode += "<h3>"+ t.getTeam_name() +" "+ hrefcode +"</h3>";
                htmlcode += projc.modelGetProjects(t.getTeam_id(), user_id);

            }
        }
        
        return htmlcode;
    }
    
}