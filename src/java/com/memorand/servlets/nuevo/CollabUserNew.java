package com.memorand.servlets.nuevo;

import com.memorand.beans.Collab;
import com.memorand.beans.CollabUser;
import com.memorand.controller.CollabUsersController;
import com.memorand.controller.CollabsController;
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

public class CollabUserNew extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        response.setContentType("text/html;charset=UTF-8");
        
        FileItemFactory fif = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(fif);
        HttpSession session = request.getSession();
        
        ArrayList<String> form_fields = new ArrayList<>();
        
        String user_type = (String) session.getAttribute("user_type");
        
        try
        {
            List items = sfu.parseRequest(request);
            
            for (int i = 0; i < items.size(); i++)
            {
                FileItem fi = (FileItem) items.get(i);
                
                if (fi.isFormField())
                    form_fields.add(fi.getString());
            }
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }
        
        if (user_type != null && user_type.equals("admin"))
        {
            String t_id = form_fields.get(0);
            String p_id = form_fields.get(1);
            String ch_id = form_fields.get(2);
            
            CollabsController collabc = new CollabsController();
            Collab collab = collabc.modelGetCollabInfoByTeamAndProject(t_id, p_id);
            
            String c_id = collab.getCollab_id();
            
            CollabUser collabuser = new CollabUser(c_id, ch_id);
            CollabUsersController collabuserc = new CollabUsersController();
            
            if (collabuserc.modelCreateCollabUser(collabuser))
            {
                response.sendRedirect("admin/gestion/lideres.jsp?team_id="+ t_id +"&proj_id="+ p_id);
            }
            else
            {
                response.sendRedirect("admin/gestion/lideres.jsp?error=200-1");
            }
        }
        else
        {
            response.sendRedirect("index.jsp?error=101");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
