package com.memorand.servlets.nuevo;

import com.memorand.beans.TeamUser;
import com.memorand.controller.TeamUsersController;
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
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class TeamUserNew extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        FileItemFactory fif = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(fif);
        HttpSession session = request.getSession();
        
        ArrayList<String> teamuser_fields = new ArrayList<>();
        
        String user_type = (String) session.getAttribute("user_type");
        
        try
        {
            List items = sfu.parseRequest(request);
            
            for (int i = 0; i < items.size(); i++)
            {
                FileItem fi = (FileItem) items.get(i);
                
                if (fi.isFormField())
                    teamuser_fields.add(fi.getString());
            }
        }
        catch (FileUploadException e)
        {
            System.err.println(e.getMessage());
        }
        
        if (user_type != null && user_type.equals("admin"))
        {
            String team_id = teamuser_fields.get(0);
            String user_id = teamuser_fields.get(1);
            
            TeamUser teamuser = new TeamUser(team_id, user_id);
            TeamUsersController teamuserc = new TeamUsersController();
            
            if (teamuserc.modelCreateTeamUser(teamuser))
            {
                response.sendRedirect("admin/integrantes.jsp?id="+ team_id);
            }
            else
            {
                response.sendRedirect("admin/integrantes.jsp?error=Model");
            }
        }
        else
        {
            response.sendRedirect("index.jsp?error=InvalidUser");
        }
    }
    
}