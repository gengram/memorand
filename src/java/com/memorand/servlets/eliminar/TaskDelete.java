package com.memorand.servlets.eliminar;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TaskDelete extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String task_id = request.getParameter("id");
        
        response.sendRedirect("work/tarea.jsp?id=" + task_id);
    }
}