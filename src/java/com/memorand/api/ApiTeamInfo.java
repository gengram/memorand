/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.memorand.api;

import com.google.gson.Gson;
import com.memorand.beans.Team;
import com.memorand.controller.TeamsController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cesaaaaar
 */
public class ApiTeamInfo extends HttpServlet{
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("application/json");
        
        String team_id = request.getParameter("team_id");
        
        if (team_id == null || team_id.isEmpty())
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        
        TeamsController teamsc = new TeamsController();
        Team team = teamsc.modelGetTeamInfoById(team_id);
        
        Gson gson = new Gson();
        
        String user_info = gson.toJson(team);
        
        try (PrintWriter out = response.getWriter())
        {
            out.println(user_info);
        }
    }
}
