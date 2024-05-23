package com.memorand.servlets.eliminar;

import com.memorand.controller.CoPostsController;
import com.memorand.controller.PostsController;
import com.memorand.controller.UserPostsController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PostDelete extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String collab_id = request.getParameter("collab_id");
        String post_id = request.getParameter("post_id");
        
        response.setContentType("text/html");
        
        HttpSession session = request.getSession();
        
        String user_id = (String) session.getAttribute("user_id");
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_id != null && user_type != null && collab_id != null && post_id != null) 
        {
            CoPostsController copostc = new CoPostsController();
            
            if (copostc.modelDeleteUserPost(collab_id, post_id))
            {
                UserPostsController userpostc = new UserPostsController();
                
                if (userpostc.modelDeleteUserPost(user_id, post_id))
                {
                    PostsController postsController = new PostsController();
                    
                    if (postsController.modelDeletePost(post_id))
                    {
                        response.sendRedirect("work/collab.jsp?id="+collab_id+"&view=posts");
                    }
                    else
                    {
                        response.sendRedirect("work/collab.jsp?id="+collab_id+"&view=posts&error=Model");
                    }
                }
                else
                    {
                        response.sendRedirect("work/collab.jsp?id="+collab_id+"&view=posts&error=Model");
                    }
            }
            else
            {
                response.sendRedirect("work/collab.jsp?id="+collab_id+"&view=posts&error=Model");
            }
        }
        else
        {
            session.invalidate();
            response.sendError(400);
        }
    }
}