package com.memorand.servlets.eliminar;

import com.memorand.controller.NotesController;
import com.memorand.controller.TaskNotesController;
import com.memorand.controller.TasksController;
import com.memorand.controller.UserNotesController;
import com.memorand.controller.UsersController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NoteDelete extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String note_id = request.getParameter("id");
        String n_user_id = "", n_task_id = "";
        
        HttpSession session = request.getSession();
        
        String user_id = (String) session.getAttribute("user_id");
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_id != null)
        {
            if ("ch".equals(user_type) || "wk".equals(user_type))
            {
                if (note_id != null)
                {
                    NotesController notec = new NotesController();
                    
                    if (notec.beanGetNote(note_id) != null)
                    {
                        TasksController taskc = new TasksController();
                        n_task_id = taskc.beanGetTaskByTool("notes", "note_id", note_id).getTask_id();
                        
                        UsersController userc = new UsersController();
                        n_user_id = userc.beanGetUserByTool("notes", "note_id", note_id).getUser_id();
                        
                        TaskNotesController tasknotec = new TaskNotesController();
                        UserNotesController usernotec = new UserNotesController();

                        if (tasknotec.modelDeleteTaskNote(n_task_id, note_id) && usernotec.modelDeleteUserNote(n_user_id, note_id))
                        {
                            NotesController notec2 = new NotesController();

                            if (notec2.modelDeleteNote(note_id))
                                response.sendRedirect("work/tarea.jsp?id="+n_task_id);
                            else
                                response.sendRedirect("work/tarea.jsp?id="+n_task_id+"&error=Model");
                        }
                        else
                            response.sendRedirect("work/tarea.jsp?id="+n_task_id+"&error=Model");
                    }
                }
            }
        }
    }
}