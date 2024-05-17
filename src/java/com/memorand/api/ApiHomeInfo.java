package com.memorand.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// URL: memorand/api/home - METHOD: get

public class ApiHomeInfo extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("application/json");
        
        String user_id = request.getParameter("user_id");
        
        if (user_id == null || user_id.isEmpty())
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        
        
    }
}