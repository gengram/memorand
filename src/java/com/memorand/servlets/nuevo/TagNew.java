package com.memorand.servlets.nuevo;

import com.memorand.beans.CoTag;
import com.memorand.beans.Tag;
import com.memorand.controller.CoTagsController;
import com.memorand.controller.TagsController;
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

public class TagNew extends HttpServlet
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {}
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
        
        HttpSession session = request.getSession();
        
        if (session != null)
        {
            FileItemFactory fif = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(fif);
            
            ArrayList<String> tag_fields = new ArrayList<>();
            
            String user_type = (String) session.getAttribute("user_type");
            
            try
            {
                List items = sfu.parseRequest(request);

                for (int i = 0; i < items.size(); i++)
                {
                    FileItem fi = (FileItem) items.get(i);

                    if (fi.isFormField())
                        tag_fields.add(fi.getString());
                }
            }
            
            catch (FileUploadException e)
            {
                System.err.println(e.getMessage());
            }
            
            if (user_type != null)
            {
                if (user_type.equals("ch"))
                {
                    Generador g = new Generador();
                    
                    String tag_id = g.newID();
                    String collab_id = request.getParameter("id");
                    
                    String tag_color = tag_fields.get(1).substring(1);
                    
                    Tag tag = new Tag(tag_id, tag_fields.get(0), tag_color);
                    TagsController tagc = new TagsController();
                    
                    if (tagc.modelCreateTag(tag))
                    {
                        CoTag cotag = new CoTag(collab_id, tag_id);
                        CoTagsController cotagc = new CoTagsController();
                        
                        if (cotagc.modelCreateCoTag(cotag))
                        {
                            response.sendRedirect("work/collab.jsp?id="+collab_id);
                        }
                        else
                        {
                            response.sendRedirect("work/collab.jsp?_id="+collab_id+"&error=200-1");
                        }
                    }
                    else
                    {
                        response.sendRedirect("work/collab.jsp?id="+collab_id+"&error=200-2");
                    }
                }
                else
                {
                    response.sendRedirect("work/home.jsp?error=100");
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

    @Override
    public String getServletInfo()
    {
        return "Short description";
    }

}