package com.memorand.controller;

import com.memorand.beans.Team;
import com.memorand.beans.User;
import com.memorand.model.TeamsModel;

public class TeamsController {
    
    public boolean modelCreateTeam(Team team) {
        
        TeamsModel teamm = new TeamsModel();
        return teamm.createTeam(team);
        
    }
    
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
"                    <td>"+ team.getTeam_id() +"</td>\n" +
"                    <td>"+ team.getTeam_name() +"</td>\n" +
"                    <td>" +
"                       <svg width='200' height='100'>\n" +
"                           <rect width='200' height='100' style='fill:#"+ team.getTeam_color() +";stroke:black;stroke-width:2'/>\n" +
"                       </svg>" +
"                    </td>\n" +
"                    <td>" +
"                       <a href='"+ add1 +"departamentos/ver.jsp?team_id="+ team.getTeam_id() +"'>Ver</a><br>" +
"                    </td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
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
    
    public String modelGetAllTeamsByUserRed2(String user_id) {
    
        String htmlcode = "";
        
        UsersController userc = new UsersController();
        User user = userc.modelGetUserInfoById(user_id);
        
        if (user.getUser_type().equals("ch"))
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
    
    public String modelGetListTeamsByInst(String inst_id) {
    
        String htmlcode = "";
        
        TeamsModel teamm = new TeamsModel();
        
        for (Team team: teamm.getAllTeamsByInst(inst_id))
        {
            htmlcode +=
            "<option value='"+ team.getTeam_id() + "' style='background-color:#"+ team.getTeam_color() +"' >"+ team.getTeam_name() + "</option>";
        }
        
        return htmlcode;
        
    }
    
    public Team modelGetTeamInfoById(String t_id) {
        
        TeamsModel teamm = new TeamsModel();
        return teamm.getTeamInfoById(t_id);
        
    }
}
