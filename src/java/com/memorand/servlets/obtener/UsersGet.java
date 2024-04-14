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
        String collab = request.getParameter("collab");
        
        response.setContentType("text/html");
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        PrintWriter out = response.getWriter();
        UsersController userc = new UsersController();
        String htmlContent;
        
        if (user_type != null && reqby != null)
        {
            switch (user_type)
            {
                case "staff":
                    switch (reqby)
                    {
                        case "admin":
                            htmlContent = userc.modelGetAdmins(inst, status);
                            out.println(htmlContent);
                            break;
                        default:
                            session.invalidate();
                            response.sendError(400);
                            break;
                    }
                    break;
                default:
                    switch (reqby)
                    {
                        case "collab":
                            htmlContent = userc.modelGetPeople(collab);
                            out.println(htmlContent);
                            break;
                        default:
                            session.invalidate();
                            response.sendError(400);
                            break;
                    }
                    break;
            }
        }
        else
        {
            session.invalidate();
            response.sendError(400);
        }
    }
    
}