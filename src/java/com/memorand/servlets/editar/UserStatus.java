package com.memorand.servlets.editar;

import com.memorand.beans.User;
import com.memorand.controller.UsersController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserStatus extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String user_id = request.getParameter("id");
        String user_status = request.getParameter("status");
        String new_status = "no";
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null)
        {
            switch (user_type)
            {
                case "staff":
                case "admin":
                    
                    if (user_id != null && user_status != null)
                    {
                        UsersController userc = new UsersController();

                        switch (user_status)
                        {
                            case "si":
                                new_status = "no";
                                break;
                            case "no":
                                new_status = "si";
                                break;
                            default:
                                response.sendRedirect("home.jsp?error=InvalidInstStatus");
                                break;
                        }
                        
                        if (userc.modelUpdateUserStatus(user_id, new_status))
                        {
                            response.sendRedirect("staff/admin.jsp?id="+user_id);
                        }
                        else
                        { response.sendRedirect("staff/home.jsp?error=Model"); }
                    }
                    else
                    { response.sendRedirect("home.jsp?error=InvalidParams"); }
                    
                    break;
                default:
                    response.sendRedirect("index.jsp?error=InvalidUserType");
                    break;
            }
        }
        else
        {
            session.invalidate();
            response.sendRedirect("index.jsp?error=InvalidUser");
        }
    }
}