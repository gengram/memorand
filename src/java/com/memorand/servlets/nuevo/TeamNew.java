package com.memorand.servlets.nuevo;

import com.memorand.beans.Team;
import com.memorand.beans.InTeam;
import com.memorand.controller.TeamsController;
import com.memorand.controller.InTeamsController;
import com.memorand.util.Generador;
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
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class TeamNew extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        FileItemFactory fif = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(fif);
        HttpSession session = request.getSession();
        
        ArrayList<String> team_fields = new ArrayList<>();
        
        String user_type = (String) session.getAttribute("user_type");
        
        try
        {
            List items = sfu.parseRequest(request);
            
            for (int i = 0; i < items.size(); i++)
            {
                FileItem fi = (FileItem) items.get(i);
                
                if (fi.isFormField())
                    team_fields.add(fi.getString());
            }
            
        }
        catch (FileUploadException e)
        {
            System.err.println(e.getMessage());
        }
        
        if (user_type != null && user_type.equals("admin"))
        {
            
            Generador g1 = new Generador();
            
            String team_id = g1.newID();
            String inst_id = (String) session.getAttribute("inst_id");
            
            if (inst_id != null)
            {
                String team_color = team_fields.get(0).substring(1); 
                
                Team team = new Team(team_id, Sanitizante.sanitizar(team_fields.get(1)), team_color);
                TeamsController teamc = new TeamsController();
                
                if (teamc.modelCreateTeam(team))
                {
                    InTeam inteam = new InTeam(inst_id, team_id);
                    InTeamsController inteamc = new InTeamsController();
                    
                    if(inteamc.modelCreateInTeam(inteam))
                    {
                        response.sendRedirect("admin/home.jsp");
                    }
                    else
                    {
                        response.sendRedirect("index.jsp?error=200-1");
                    }
                }
                else
                {
                    response.sendRedirect("index.jsp?error=200-2");
                }
            }
            else
            {
                    response.sendRedirect("index.jsp?error=200-3");
            }
            
        }
        else
        {
            response.sendRedirect("index.jsp?error=101");
        }
        
    }

}