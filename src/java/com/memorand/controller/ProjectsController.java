package com.memorand.controller;

import com.memorand.beans.Collab;
import com.memorand.beans.Project;
import com.memorand.model.CollabsModel;
import com.memorand.model.ProjectsModel;

public class ProjectsController {
    
    public boolean modelCreateProject(Project project) {
        
        ProjectsModel projm = new ProjectsModel();
        return projm.createProject(project);
    
    }
    
    public String modelGetAllProjectsByInst(String inst_id, int level1) {
        
        String htmlcode = "";
        String add1 = "";

        ProjectsModel projm = new ProjectsModel();
        
        for (int i = 0; i < level1; i++)
        {
            add1 += "../";
        }
        
        for (Project project : projm.getAllProjectsByInst(inst_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ project.getProj_id() +"</td>\n" +
"                    <td>"+ project.getProj_name() +"</td>\n" +
"                    <td>" +
"                       <svg width='200' height='100'>\n" +
"                           <rect width='200' height='100' style='fill:#"+ project.getProj_color() +";stroke:black;stroke-width:2'/>\n" +
"                       </svg>" +
"                    </td>\n" +
"                    <td>" +
"                       <a href='"+ add1 +"proyectos/ver.jsp?proj_id="+ project.getProj_id() +"'>Ver</a><br>" +
"                    </td>\n" +
"           </tr>";
        }

        return htmlcode;
    
    }
    
    public String modelGetListProjectsByInst(String inst_id) {
    
        String htmlcode = "";
        
        ProjectsModel projm = new ProjectsModel();
        
        for (Project project : projm.getAllProjectsByInst(inst_id))
        {
            htmlcode +=
            "<option value='"+ project.getProj_id() + "' style='background-color:#"+ project.getProj_color() +"' >"+ project.getProj_name() + "</option>";
        }
        
        return htmlcode;
    }
    
    public String modelGetAllProjectsByTeamRed(String team_id) {
    
        String htmlcode = "";
        
        ProjectsModel projm = new ProjectsModel();
        
        for (Project project : projm.getAllProjectsByTeam(team_id))
        {
            CollabsModel collabm = new CollabsModel();
            
            String p_id = project.getProj_id();
            
            Collab collab = collabm.getCollabInfoByTeamAndProject(team_id, p_id);
            
            String collab_status = collab.getCollab_status();
            
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ project.getProj_name() +"</td>\n" +
"                    <td>" +
"                       <svg width='50' height='50'>\n" +
"                           <rect width='50' height='50' style='fill:#"+ project.getProj_color() +";stroke:black;stroke-width:2'/>\n" +
"                       </svg>" +
"                    </td>\n" +
"                    <td>"+ collab_status +"</td>\n" +
"                    <td>" +
"                       <a href='#'>Desactivar</a>" +
"                       <a href='#' style='color:red'>Borrar</a>" +
"                    </td>\n" +
"           </tr>";
        }
        
        return htmlcode;
    }
    
    public Project modelGetProjectInfoById(String p_id) {
        
        ProjectsModel projm = new ProjectsModel();
        return projm.getProjectInfoById(p_id);
    
    }
}