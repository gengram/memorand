package com.memorand.servlets.editar;

import com.memorand.beans.Task;
import com.memorand.controller.TasksController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TaskStatus extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String task_id = request.getParameter("id");
        String task_status = "", new_status = "";
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null)
        {
            if ("ch".equals(user_type))
            {
                if (task_id != null)
                {
                    TasksController taskc = new TasksController();
                    TasksController taskc2 = new TasksController();
                    
                    Task task = taskc.beanGetTask(task_id);
                    
                    if (task != null)
                    {
                        task_status = task.getTask_status();
                        
                        switch (task_status)
                        {
                            case "Incompleta":
                                new_status = "Completada";
                                break;
                            case "Completada":
                                new_status = "Incompleta";
                                break;
                            case "Atrasada":
                                new_status = "Fuera de plazo";
                                break;
                            case "Fuera de plazo":
                                new_status = "Atrasada";
                                break;
                            default:
                                response.sendRedirect("work/home.jsp?error=InvalidTaskStatus");
                                break;
                        }
                    
                        if (taskc2.modelUpdateTaskStatus(task_id, new_status))
                            response.sendRedirect("work/tarea.jsp?id="+task_id);
                        else
                            response.sendRedirect("work/tarea.jsp?id="+task_id+"error=Model");
                    }
                    else
                    {
                        response.sendRedirect("work/home.jsp?error=InvalidTask");
                    }
                }
                else
                {
                    response.sendRedirect("work/home.jsp?error=InvalidTask");
                }
            }
            else
            {
                response.sendRedirect("work/home.jsp?error=InvalidUserType");
            }
        }
        else
        {
            response.sendRedirect("index.jsp?error=InvalidUserType");
        }
    }
}