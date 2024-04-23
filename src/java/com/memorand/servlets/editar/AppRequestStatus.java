package com.memorand.servlets.editar;

import com.memorand.controller.AppRequestsController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AppRequestStatus extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String req_id = request.getParameter("id");
        String req_status = request.getParameter("status");
        String new_status = "no";
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null && "staff".equals(user_type))
        {
            if (req_id != null && req_status != null)
            {
                AppRequestsController reqc = new AppRequestsController();
                
                switch (req_status)
                {
                    case "si":
                        new_status = "no";
                        break;
                    case "no":
                        new_status = "si";
                        break;
                    default:
                        response.sendRedirect("staff/ventas.jsp?error=InvalidReqStatus");
                        break;
                }
                
                if (reqc.modelUpdateRequestStatus(req_id, new_status))
                {
                    response.sendRedirect("staff/solicitud.jsp?id="+req_id);
                }
                else
                {
                    response.sendRedirect("staff/ventas.jsp?error=Model");
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