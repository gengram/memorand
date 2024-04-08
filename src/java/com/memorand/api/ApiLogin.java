package com.memorand.api;

import com.memorand.beans.User;
import com.memorand.controller.UsersController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApiLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/plain;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter())
        {
            String user_email = request.getParameter("user_email");
            String user_pass = request.getParameter("user_pass");
            
            UsersController userc = new UsersController();
            User user = new User(user_email, user_pass);
            
            if (userc.modelLoginUser(user))
            {
                response.setStatus(200);
            }
            else
            {
                response.setStatus(400);
            }
            
        }
    }
    
    
}
