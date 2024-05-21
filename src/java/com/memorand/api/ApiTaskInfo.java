/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.memorand.api;

import com.google.gson.Gson;
import com.memorand.beans.Task;
import com.memorand.controller.TasksController;
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
public class ApiTaskInfo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("application/json");
        
        String task_id = request.getParameter("task_id");
        
        if (task_id == null || task_id.isEmpty())
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        
        TasksController tasksc = new TasksController();
        Task task = tasksc.modelGetTaskInfoById(task_id);
        
        Gson gson = new Gson();
        
        String task_info = gson.toJson(task);
        
        try (PrintWriter out = response.getWriter())
        {
            out.println(task_info);
        }
    }
}
