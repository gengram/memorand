package com.memorand.servlets.nuevo;

import com.memorand.beans.InProject;
import com.memorand.beans.Project;
import com.memorand.controller.InProjectsController;
import com.memorand.controller.ProjectsController;
import com.memorand.util.Generador;
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

public class ProjectNew extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        
        FileItemFactory fif = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(fif);
        HttpSession session = request.getSession();
        
        ArrayList<String> proj_fields = new ArrayList<>();
        
        String user_type = (String) session.getAttribute("user_type");
        
        try
        {
            List items = sfu.parseRequest(request);
            
            for (int i = 0; i < items.size(); i++)
            {
                FileItem fi = (FileItem) items.get(i);
                
                if (fi.isFormField())
                    proj_fields.add(fi.getString());
            }
        }
        
        catch (FileUploadException e)
        {
            System.err.println(e.getMessage());
        }
        
        if (user_type != null && user_type.equals("admin"))
        {
            Generador g1 = new Generador();
            
            String proj_id = g1.newID();
            String inst_id = (String) session.getAttribute("inst_id");
            
            if (inst_id != null)
            {
                String proj_color = proj_fields.get(0).substring(1);
            
                Project project = new Project(proj_id, proj_fields.get(1), proj_color);
                ProjectsController projc = new ProjectsController();
                
                if (projc.modelCreateProject(project))
                {
                    InProject inproj = new InProject(inst_id, proj_id);
                    InProjectsController inprojc = new InProjectsController();
                    
                    if (inprojc.modelCreateInProject(inproj))
                    { response.sendRedirect("admin/home.jsp"); }
                    else
                    { response.sendRedirect("admin/home.jsp?error=200-1");}
                
                }
                else
                {
                    response.sendRedirect("admin/home.jsp?error=200-2");
                }
            }
            else
            {
                response.sendRedirect("admin/home.jsp?error=200-3");
            }
        }
        else
        {
            response.sendRedirect("index.jsp?error=101");
        }
        
    }

}