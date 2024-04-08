package com.memorand.servlets.obtener;

import com.memorand.controller.TasksController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TasksGet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String reqby = request.getParameter("reqby");
        String collab = request.getParameter("collab");
        String view = request.getParameter("view");
        
        response.setContentType("text/html");
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null && reqby != null)
        {
            PrintWriter out = response.getWriter();
            TasksController taskc = new TasksController();
            String htmlContent;
            
            switch (reqby)
            {
                case "collab":
                    
                    if (view != null)
                    {
                        switch (view) {
                            case "panel":
                                htmlContent = taskc.modelGetTasksPanel(collab, "task_edate");
                                break;
                            case "table":
                                htmlContent = taskc.modelGetTasksTable(collab, "task_edate");
                                break;
                            default:
                                throw new AssertionError();
                        }
                    }
                    else
                    {
                        htmlContent = taskc.modelGetTasksPanel(collab, "task_edate");
                    }
                    out.println(htmlContent);
                    break;
                    
                default:
                    session.invalidate();
                    response.sendError(400);
                    break;
            }
        }
        else
        {
            session.invalidate();
            response.sendError(400);
        }
    }

}