package com.memorand.servlets.eliminar;

import com.memorand.controller.TeamUsersController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TeamUserDelete extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user_id = request.getParameter("user_id");
        String team_id = request.getParameter("team_id");
        
        TeamUsersController teamuserc = new TeamUsersController();
        
        if(teamuserc.modelDeleteTeamUser(user_id, team_id))
        {
            response.sendRedirect("admin/gestion/integrantes.jsp?team_id="+team_id);
        }
        else
        {
            response.sendRedirect("admin/gestion/integrantes.jsp?team_id="+team_id+"&error=200-1");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}