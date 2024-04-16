package com.memorand.servlets.editar;

import com.memorand.controller.InstitutionsController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InstitutionStatus extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String inst_id = request.getParameter("id");
        String inst_status = request.getParameter("status");
        String new_status = "no";
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null && "staff".equals(user_type))
        {
            if (inst_id != null && inst_status != null)
            {
                InstitutionsController instc = new InstitutionsController();
                
                switch (inst_status)
                {
                    case "si":
                        new_status = "no";
                        break;
                    case "no":
                        new_status = "si";
                        break;
                    default:
                        response.sendRedirect("staff/home.jsp?error=InvalidInstStatus");
                        break;
                }
                
                if (instc.modelUpdateInstStatus(inst_id, new_status))
                {
                    response.sendRedirect("staff/institucion.jsp?id="+inst_id);
                }
                else
                { response.sendRedirect("staff/home.jsp?error=Model"); }
                
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
