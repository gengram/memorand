package com.memorand.servlets.nuevo;

import com.memorand.beans.Idea;
import com.memorand.beans.TaskIdea;
import com.memorand.beans.UserIdea;
import com.memorand.controller.IdeasController;
import com.memorand.controller.TaskIdeasController;
import com.memorand.controller.UserIdeasController;
import com.memorand.util.Generador;
import com.memorand.util.Sanitizante;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class IdeaNew extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        
        if (session != null)
        {
            FileItemFactory fif = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(fif);
            
            ArrayList<String> idea_fields = new ArrayList<>();
            
            String user_type = (String) session.getAttribute("user_type");
            String user_id = (String) session.getAttribute("user_id");
            
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
        
            catch (FileUploadException e)
            {
                System.err.println(e.getMessage());
            }
            
            if (user_type != null && user_id != null)
            {
                if (user_type.equals("ch") || user_type.equals("wk"))
                {
                    Generador g = new Generador();
                    
                    String idea_id = g.newID();
                    String task_id = request.getParameter("id");
                    
                    String idea_color;
                    if(!idea_fields.get(0).isEmpty())
                    {
                        idea_color = idea_fields.get(0).substring(1);
                    }
                    else
                    {
                        idea_color = "F8DE9B";
                    }
                    
                    String idea_text = idea_fields.get(1).trim();
                    
                    idea_text = Sanitizante.sanitizar(idea_text);
                    
                    Timestamp idea_date = new Timestamp(System.currentTimeMillis());
                    
                    Idea idea = new Idea(idea_id, idea_text, idea_date, idea_color);
                    IdeasController ideac = new IdeasController();
                    
                    if (ideac.modelCreateIdea(idea))
                    {
                        TaskIdea taskidea = new TaskIdea(task_id, idea_id);
                        TaskIdeasController taskideac = new TaskIdeasController();
                        
                        if (taskideac.modelCreateTaskIdea(taskidea))
                        {
                            UserIdea useridea = new UserIdea(user_id, idea_id);
                            UserIdeasController userideac = new UserIdeasController();
                            
                            if (userideac.modelCreateUserIdea(useridea))
                            {
                                response.sendRedirect("work/tarea.jsp?id="+task_id+"&view=ideas");
                            }
                            else
                            { response.sendRedirect("work/tarea.jsp?id="+task_id+"&error=200-1"); }
                        }
                        else
                        { response.sendRedirect("work/tarea.jsp?id="+task_id+"&error=200-2"); }
                    }
                    else
                    { response.sendRedirect("work/tarea.jsp?id="+task_id+"&error=200-3"); }
                }
                else
                {
                    session.invalidate();
                    response.sendRedirect("index.jsp?error=100");
                }
            }
            else
            {
                session.invalidate();
                response.sendRedirect("index.jsp?error=100");
            }
        }
        else
        {
            response.sendRedirect("index.jsp?error=101");
        }
    }

}