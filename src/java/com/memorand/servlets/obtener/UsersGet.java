package com.memorand.servlets.obtener;

import com.memorand.controller.UsersController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UsersGet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String reqby = request.getParameter("reqby");
        String inst = request.getParameter("inst");
        String status = request.getParameter("status");
        
        response.setContentType("text/html");
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null && "staff".equals(user_type) && reqby != null && status != null)
        {
            switch (reqby)
            {
                case "admin":
                    
                    PrintWriter out = response.getWriter();
                    UsersController userc = new UsersController();
                    String htmlContent = userc.modelGetAdmins(inst, status);
                    out.println(htmlContent);
                    break;
                    
                default:
                    response.sendRedirect("index.jsp?error=InvalidRequest");
                    session.invalidate();
            }
        }
        else
        {
            response.sendRedirect("index.jsp?error=InvalidUserType");
            session.invalidate();
        }
    }
}