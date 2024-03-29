package com.memorand.api;

import com.google.gson.Gson;
import com.memorand.beans.User;
import com.memorand.controller.UsersController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ApiUserInfo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        
        if (user_id == null || user_id.isEmpty())
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        response.setContentType("application/json");
        
        String user_id = request.getParameter("user_id");
        
        if (user_id == null || user_id.isEmpty())
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        
        UsersController usersc = new UsersController();
        User user = usersc.modelGetUserInfoById(user_id);
        
        Gson gson = new Gson();
        
        String user_info = gson.toJson(user);
        
        try (PrintWriter out = response.getWriter()) {
            out.println(user_info);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
