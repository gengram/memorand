package com.memorand.servlets.editar;

import com.memorand.beans.Idea;
import com.memorand.controller.IdeasController;
import com.memorand.controller.TasksController;
import com.memorand.util.Sanitizante;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class IdeaEdit extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String idea_id = request.getParameter("id");
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null)
        {
            if (user_type.equals("ch") || user_type.equals("wk"))
            {
                FileItemFactory fif = new DiskFileItemFactory();
                ServletFileUpload sfu = new ServletFileUpload(fif);

                ArrayList<String> idea_fields = new ArrayList<>();

                try
                {
                    List items = sfu.parseRequest(request);

                    for (int i = 0; i < items.size(); i++)
                    {
                        FileItem fi = (FileItem) items.get(i);

                        if (fi.isFormField())
                            idea_fields.add(fi.getString());
                    }
                }
                catch (Exception e)
                {
                    System.err.println(e.getMessage());
                }
                
                String idea_color;
                
                if(!idea_fields.get(0).isEmpty())
                    idea_color = idea_fields.get(0).substring(1);
                else
                    idea_color = "F8DE9B";
                
                String idea_text = Sanitizante.sanitizar(idea_fields.get(1).trim());
                
                Idea idea = new Idea(idea_id, idea_text, null, idea_color);
                IdeasController ideac = new IdeasController();
                
                if (ideac.modelUpdateIdea(idea))
                {
                    TasksController taskc = new TasksController();
                    
                    response.sendRedirect("work/tarea.jsp?id="+taskc.beanGetTaskByTool("ideas", "idea_id", idea_id).getTask_id());
                }
            }
        }
    }
}