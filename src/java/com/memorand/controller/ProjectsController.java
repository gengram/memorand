package com.memorand.controller;

import com.memorand.beans.Collab;
import com.memorand.beans.Project;
import com.memorand.beans.User;
import com.memorand.model.CollabsModel;
import com.memorand.model.ProjectsModel;
import java.util.ArrayList;

public class ProjectsController
{
    public boolean modelCreateProject(Project project)
    {
        ProjectsModel projm = new ProjectsModel();
        return projm.createProject(project);
    }
    
    public Project modelGetProjectInfoById(String p_id)
    {
        ProjectsModel projm = new ProjectsModel();
        return projm.getProjectInfoById(p_id);
    }
    
    public Project modelGetProjectInfoByCollab(String collab_id)
    {
        ProjectsModel projm = new ProjectsModel();
        return projm.getProjectInfoByCollab(collab_id);
    }
    
    // DEPRECIADO
    public String modelGetAllProjectsByInst(String inst_id, int level1)
    {
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
"                    <td>" + "<i style=\"color: #"+ project.getProj_color() + "; font-size: 2rem;\" class=\"bi bi-square-fill me-2\"></i> "+ project.getProj_name() +"</td>\n" +
"                    <td>" +
"                       <a href='"+ add1 +"proyectos/ver.jsp?proj_id="+ project.getProj_id() +"'> <i class=\"bi bi-eye-fill\" style=\"font-size: 1.5em;\"></i> </a><br>" +
"                    </td>\n" +
"           </tr>";
        }

        return htmlcode;
    
    }
    
    // DEPRECIADO
    public String modelGetListProjectsByInst(String inst_id)
    {
        String htmlcode = "";
        
        ProjectsModel projm = new ProjectsModel();
        
        for (Project project : projm.getAllProjectsByInst(inst_id))
        {
            htmlcode +=
            "<option value='"+ project.getProj_id() + "' style='background-color:#"+ project.getProj_color() +"' >"+ project.getProj_name() + "</option>";
        }
        
        return htmlcode;
    }
    
    // DEPRECIADO
    public String modelGetAllProjectsByTeamRed(String team_id)
    {
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
    
    // DEPRECIADO
    public String modelGetAllProjectsByTeamRed1(String team_id)
    {
        String htmlcode = "";
        
        ProjectsModel projm = new ProjectsModel();
        
        for (Project project : projm.getAllProjectsByTeam(team_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ project.getProj_name() +"</td>\n" +
"                    <td>" +
"                       <svg width='50' height='50'>\n" +
"                           <rect width='50' height='50' style='fill:#"+ project.getProj_color() +";stroke:black;stroke-width:2'/>\n" +
"                       </svg>" +
"                    </td>\n" +
"                    <td>" +
"                       <a href='?team_id="+ team_id +"&proj_id="+ project.getProj_id() +"'>Ver</a>" +
"                    </td>\n" +
"           </tr>";
        }
        
        return htmlcode;
    }
    
    // DEPRECIADO
    public String modelGetAllProjectsByTeamRed2(String team_id, String user_id)
    {
        String htmlcode = "";
        
        UsersController userc = new UsersController();
        User user = userc.modelGetUserInfoById(user_id);

        String user_type = user.getUser_type();
        
        if (user_type.equals("ch"))
        {
            ProjectsModel projm = new ProjectsModel();

            for (Project project : projm.getAllProjectsByTeamAndCh(team_id, user_id))
            {
                String proj_id = project.getProj_id();
                
                CollabsModel collabm = new CollabsModel();
                Collab collab = collabm.getCollabInfoByTeamAndProject(team_id, proj_id);

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
        }
        else
        {
            ProjectsModel projm = new ProjectsModel();

            for (Project project : projm.getAllProjectsByTeam(team_id))
            {
                String proj_id = project.getProj_id();
                
                CollabsModel collabm = new CollabsModel();
                Collab collab = collabm.getCollabInfoByTeamAndProject(team_id, proj_id);

                String collab_id = collab.getCollab_id();

                htmlcode +=
                "<tr>\n" +
    "                    <td>"+ project.getProj_name() +"</td>\n" +
    "                    <td>" +
    "                       <svg width='50' height='50'>\n" +
    "                           <rect width='50' height='50' style='fill:#"+ project.getProj_color() +";stroke:black;stroke-width:2'/>\n" +
    "                       </svg>" +
    "                    </td>\n" +
    "                    <td>" +
    "                       <a href='proyecto.jsp?collab_id="+ collab_id +"'>Ver</a>" +
    "                    </td>\n" +
    "           </tr>";
            }
        }
        
        return htmlcode;
    }
    
    public String modelGetProjects(String team_id, String user_id)
    {
        String htmlcode = "<ul>";
        
        ProjectsModel projm = new ProjectsModel();
        ArrayList<Project> projects = new ArrayList<>();
        
        UsersController userc = new UsersController();
        User user = userc.modelGetUserInfoById(user_id);
        
        String user_type = user.getUser_type();
        
        if (user_type != null)
        {
            switch (user_type)
            {
                case "ch":
                    projects = projm.getAllProjectsByTeamAndCh(team_id, user_id);
                    break;
                case "wk":
                    projects = projm.getAllProjectsByTeam(team_id);
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
                Collab collab = collabm.getCollabInfoByTeamAndProject(team_id, proj_id);

                String collab_id = collab.getCollab_id();
                
                htmlcode += "<li>"+ p.getProj_name() +" <a href='proyecto.jsp?id="+ collab_id +"'>&rarr;</a></li>";
            }
        }
        
        htmlcode += "</ul>";
        
        return htmlcode;
    }
}