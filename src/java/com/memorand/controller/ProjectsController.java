package com.memorand.controller;

import com.memorand.beans.Project;
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
"                    <td>"+ project.getProj_icon() +"</td>\n" +
"                    <td>" +
"                       <svg width='200' height='100'>\n" +
"                           <rect width='200' height='100' style='fill:#"+ project.getProj_color() +";stroke:black;stroke-width:2'/>\n" +
"                       </svg>" +
"                    </td>\n" +
"                    <td>"+ project.getProj_bkg() +"</td>\n" +
"                    <td>" +
"                       <a href='"+ add1 +"proyectos/ver.jsp?proj_id="+ project.getProj_id() +"'>Ver</a><br>" +
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