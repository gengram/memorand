package com.memorand.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ServiceStatus extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String service_id = request.getParameter("id");
        String service_status = request.getParameter("status");
        String new_status = "no";
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null && "staff".equals(user_type))
        {
            if (service_id != null && service_status != null)
            {
                ServicesController servicec = new ServicesController();
                
                switch (service_status)
                {
                    case "si":
                        new_status = "no";
                        break;
                    case "no":
                        new_status = "si";
                        break;
                    default:
                        response.sendRedirect("staff/home.jsp?error=InvalidServiceStatus");
                        break;
                }
                
                if (servicec.modelUpdateServiceStatus(service_id, new_status))
                {
                    response.sendRedirect("staff/configuracion.jsp");
                }
                else
                {
                    response.sendRedirect("staff/configuracion.jsp?error=Model");
                }
            }
            else
            { response.sendRedirect("home.jsp?error=InvalidParams"); }
        }
        else
        {
            session.invalidate();
            response.sendRedirect("index.jsp?error=InvalidUser");
        }
    }
}