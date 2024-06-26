package com.memorand.servlets.nuevo;

import com.memorand.beans.CoPost;
import com.memorand.beans.Post;
import com.memorand.beans.UserPost;
import com.memorand.controller.CoPostsController;
import com.memorand.controller.PostsController;
import com.memorand.controller.UserPostsController;
import com.memorand.util.Generador;
import com.memorand.util.HtmlEscapes;
import com.memorand.util.Sanitizante;
import com.memorand.util.TimeTransformer;
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

public class PostNew extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        
        if (session != null)
        {
            FileItemFactory fif = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(fif);
            
            ArrayList<String> post_fields = new ArrayList<>();
            
            String user_id = (String) session.getAttribute("user_id");
            String user_type = (String) session.getAttribute("user_type");
            
            try
            {
                List<FileItem> items = sfu.parseRequest(request);

                for (FileItem item : items)
                {
                    if (item.isFormField())
                    {
                        String fieldValue = item.getString();
                        if (fieldValue != null)
                        {
                            post_fields.add(fieldValue);
                        }
                    }
                }
            }
        
            catch (FileUploadException e)
            {
                System.err.println(e.getMessage());
            }
            
            if (user_type != null)
            {
                if (user_type.equals("wk") || user_type.equals("ch"))
                {
                    String post_text = post_fields.get(0).trim();
                    
                    post_text = Sanitizante.sanitizar(post_text);
                    
                    Generador g = new Generador();
                
                    String post_id = g.newID();
                    String collab_id = request.getParameter("id");
                    
                    Timestamp ts = new Timestamp(System.currentTimeMillis());
                    
                    Post post = new Post(post_id, post_text,0,0,0,ts);
                    PostsController postc = new PostsController();
                    
                    if (postc.modelCreatePost(post))
                    {
                        CoPost copost = new CoPost(collab_id, post_id);
                        CoPostsController copostc = new CoPostsController();
                        
                        if (copostc.modelCreateCoPost(copost))
                        {
                            UserPost userpost = new UserPost(user_id, post_id);
                            UserPostsController userpostc = new UserPostsController();
                            
                            if (userpostc.modelCreateUserPost(userpost))
                            {
                                response.sendRedirect("work/collab.jsp?id="+collab_id+"&view=posts");
                            }
                            else
                            {
                                response.sendRedirect("work/collab.jsp?id="+collab_id+"&error=200-1");
                            }
                        }
                        else
                        {
                            response.sendRedirect("work/collab.jsp?id="+collab_id+"&error=200-2");
                        }
                    }
                    else
                    {
                        response.sendRedirect("work/collab.jsp?id="+collab_id+"&error=200-3");
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