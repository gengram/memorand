package com.memorand.servlets.nuevo;

import com.memorand.beans.Note;
import com.memorand.beans.TaskNote;
import com.memorand.beans.UserNote;
import com.memorand.controller.NotesController;
import com.memorand.controller.TaskNotesController;
import com.memorand.controller.UserNotesController;
import com.memorand.util.Generador;
import com.memorand.util.Sanitizante;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class NoteNew extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        if (session != null)
        {
            FileItemFactory fif = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(fif);
            
            ArrayList<String> note_fields = new ArrayList<>();
            
            String user_type = (String) session.getAttribute("user_type");
            String user_id = (String) session.getAttribute("user_id");
            
            try
            {
                List items = sfu.parseRequest(request);

                for (int i = 0; i < items.size(); i++)
                {
                    FileItem fi = (FileItem) items.get(i);

                    if (fi.isFormField())
                        note_fields.add(fi.getString());
                }
            }
        
            catch (FileUploadException e)
            {
                System.err.println(e.getMessage());
            }
            
            if (user_type != null && user_id != null)
            {
                if (user_type.equals("ch") || user_type.equals("wk"))
                {
                    Generador g = new Generador();
                    
                    String note_id = g.newID();
                    String task_id = request.getParameter("id");
                    
                    String note_name = note_fields.get(0).trim();
                    
                    note_name = Sanitizante.sanitizar(note_name);
                    
                    Timestamp note_cdate = new Timestamp(System.currentTimeMillis());
                    Timestamp note_mdate = new Timestamp(System.currentTimeMillis());
                    
                    Note note = new Note(note_id, note_name, "", note_cdate, note_mdate, "Privado");
                    NotesController notec = new NotesController();
                    
                    if (notec.modelCreateNote(note))
                    {
                        TaskNote tasknote = new TaskNote(task_id, note_id);
                        TaskNotesController tasknotec = new TaskNotesController();
                        
                        if (tasknotec.modelCreateTaskNote(tasknote))
                        {
                            UserNote usernote = new UserNote(user_id, note_id);
                            UserNotesController usernotec = new UserNotesController();
                            
                            if (usernotec.modelCreateUserNote(usernote))
                            {
                                response.sendRedirect("work/nota.jsp?id="+note_id);
                            }
                            else
                            { response.sendRedirect("work/tarea.jsp?id="+task_id+"&error=200-1"); }
                        }
                        else
                        { response.sendRedirect("work/tarea.jsp?id="+task_id+"&error=200-2"); }
                    }
                    else
                    { response.sendRedirect("work/tarea.jsp?id="+task_id+"&error=200-3"); }
                }
                else
                {
                    session.invalidate();
                    response.sendRedirect("index.jsp?error=100");
                }
            }
            else
            {
                session.invalidate();
                response.sendRedirect("index.jsp?error=100");
            }
        }
        else
        {
            response.sendRedirect("index.jsp?error=101");
        }
    }
    
}