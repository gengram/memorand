package com.memorand.controller;

import com.memorand.beans.Idea;
import com.memorand.beans.User;
import com.memorand.model.IdeasModel;
import com.memorand.model.UsersModel;
import com.memorand.util.Duracion;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;

public class IdeasController
{
    public boolean modelCreateIdea(Idea idea)
    {
        IdeasModel ideam = new IdeasModel();
        return ideam.createIdea(idea);
    }
    
    public Idea modelGetIdeaById(String i_id)
    {
        IdeasModel ideam = new IdeasModel();
        return ideam.getIdeaById(i_id);
    }
    
    public String modelGetIdeasByTask(String task_id)
    {
        String htmlcode = "<h3>Nueva idea</h3>\n"
                + "            <h1><a href='ideanew.jsp?id=" + task_id + "'>+</a></h1>\n"
                + "            \n"
                + "            <h3>Lluvia de ideas</h3>\n"
                + "            <p>Agrega aqu&iacute; las partes m&aacute;s importantes de tu tarea.</p>";
        
        IdeasModel ideam = new IdeasModel();
        ArrayList<Idea> ideas = ideam.getIdeasByTask(task_id);
        
        if (ideas.isEmpty())
        {
            htmlcode += "<p>No hay ideas por mostrar</p>";
            return htmlcode;
        }
        else
        {
            for (Idea i : ideas)
            {
                String idea_id = i.getIdea_id();
                
                UsersModel userm = new UsersModel();
                User user = userm.getUserInfoByIdea(idea_id);
                
                String user_name = "null";
                
                if (user != null)
                {
                    user_name = user.getUser_name() + " " + user.getUser_pat();
                }
                
                Instant ideaInstant = i.getIdea_date().toInstant();
                Instant now = Instant.now();
                
                Duration duration = Duration.between(ideaInstant, now);
                Duracion d = new Duracion();
                
                String timeAgo = d.formatDuration(duration);
                
                htmlcode += "<div style='background-color:#"+ i.getIdea_color() +"'>"
                    + "<p>" + user_name + " - Hace " + timeAgo
                    + "<p>" + i.getIdea_text()+ "</p>"
                    + "</div>";
            }
        }
        
        return htmlcode;
    }
}