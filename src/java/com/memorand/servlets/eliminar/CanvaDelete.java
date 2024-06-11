package com.memorand.servlets.eliminar;

import com.memorand.controller.CanvasController;
import com.memorand.controller.TaskCanvasController;
import com.memorand.controller.TasksController;
import com.memorand.controller.UserCanvasController;
import com.memorand.controller.UsersController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CanvaDelete extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String canva_id = request.getParameter("id");
        String c_user_id = "", c_task_id = "";
        
        HttpSession session = request.getSession();
        
        String user_id = (String) session.getAttribute("user_id");
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_id != null)
        {
            if ("ch".equals(user_type) || "wk".equals(user_type))
            {
                if (canva_id != null)
                {
                    CanvasController canvac = new CanvasController();
                    
                    if (canvac.beanGetCanva(canva_id) != null)
                    {
                        TasksController taskc = new TasksController();
                        c_task_id = taskc.beanGetTaskByTool("canvas", "canva_id", canva_id).getTask_id();
                        
                        UsersController userc = new UsersController();
                        c_user_id = userc.beanGetUserByTool("canvas", "canva_id", canva_id).getUser_id();
                        
                        TaskCanvasController taskcanvac = new TaskCanvasController();
                        UserCanvasController usercanvac = new UserCanvasController();

                        if (taskcanvac.modelDeleteTaskCanva(c_task_id, canva_id) && usercanvac.modelDeleteUserCanva(c_user_id, canva_id))
                        {
                            CanvasController canvac2 = new CanvasController();

                            if (canvac2.modelDeleteCanva(canva_id))
                                response.sendRedirect("work/tarea.jsp?id="+c_task_id);
                            else
                                response.sendRedirect("work/tarea.jsp?id="+c_task_id+"&error=Model");
                        }
                        else
                            response.sendRedirect("work/tarea.jsp?id="+c_task_id+"&error=Model");
                    }
                    else
                            response.sendRedirect("work/tarea.jsp?id="+c_task_id+"&error=InvalidIdea");
                }
                else
                    response.sendRedirect("work/tarea.jsp?id="+c_task_id+"&error=InvalidParams");
            }
            else
            {
                response.sendRedirect("index.jsp?error=InvalidUserType");
            }
        }
        else
        {
            response.sendRedirect("index.jsp?error=InvalidUser");
        }
    }
}