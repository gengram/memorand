package com.memorand.servlets.eliminar;

import com.memorand.controller.IdeasController;
import com.memorand.controller.TaskIdeasController;
import com.memorand.controller.TasksController;
import com.memorand.controller.UserIdeasController;
import com.memorand.controller.UsersController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IdeaDelete extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String idea_id = request.getParameter("id");
        String i_user_id = "", i_task_id = "";
       
        HttpSession session = request.getSession();
        
        String user_id = (String) session.getAttribute("user_id");
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_id != null)
        {
            if ("ch".equals(user_type) || "wk".equals(user_type))
            {
                if (idea_id != null)
                {
                    IdeasController ideac = new IdeasController();

                    if (ideac.beanGetIdea(idea_id) != null)
                    {
                        TasksController taskc = new TasksController();
                        i_task_id = taskc.beanGetTaskByTool("ideas", "idea_id", idea_id).getTask_id();
                        
                        UsersController userc = new UsersController();
                        i_user_id = userc.beanGetUserByTool("ideas","idea_id",idea_id).getUser_id();
                        
                        TaskIdeasController taskideac = new TaskIdeasController();
                        UserIdeasController userideac = new UserIdeasController();

                        if (taskideac.modelDeleteTaskIdea(i_task_id, idea_id) && userideac.modelDeleteUserIdea(i_user_id, idea_id))
                        {
                            IdeasController ideac2 = new IdeasController();

                            if (ideac2.modelDeleteIdea(idea_id))
                                response.sendRedirect("work/tarea.jsp?id="+i_task_id);
                            else
                                response.sendRedirect("work/tarea.jsp?id="+i_task_id+"&error=Model");
                        }
                        else
                            response.sendRedirect("work/tarea.jsp?id="+i_task_id+"&error=Model");
                    }
                    else
                            response.sendRedirect("work/tarea.jsp?id="+i_task_id+"&error=InvalidIdea");
                }
                else
                    response.sendRedirect("work/tarea.jsp?id="+i_task_id+"&error=InvalidParams");
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