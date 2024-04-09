package com.memorand.servlets.nuevo;

import com.memorand.beans.CoTask;
import com.memorand.beans.Task;
import com.memorand.controller.CoTasksController;
import com.memorand.controller.TasksController;
import com.memorand.util.Generador;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

public class TaskNew extends HttpServlet
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
            
            ArrayList<String> task_fields = new ArrayList<>();
            
            String user_type = (String) session.getAttribute("user_type");
            
            try
            {
                List items = sfu.parseRequest(request);

                for (int i = 0; i < items.size(); i++)
                {
                    FileItem fi = (FileItem) items.get(i);

                    if (fi.isFormField())
                        task_fields.add(fi.getString());
                }
            }
        
            catch (FileUploadException e)
            {
                System.err.println(e.getMessage());
            }
            
            if (user_type != null)
            {
                if (user_type.equals("ch"))
                {
                    Generador g = new Generador();
                
                    String task_id = g.newID();
                    String collab_id = request.getParameter("id");
                    
                    String s_edate = task_fields.get(2);
                    
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                    LocalDateTime localDateTime = LocalDateTime.parse(task_fields.get(2), formatter);
                    Timestamp task_edate = Timestamp.valueOf(localDateTime);
                    
                    Timestamp task_sdate = new Timestamp(System.currentTimeMillis());
                    
                    Task task = new Task(task_id, task_fields.get(0), task_fields.get(1), task_sdate, task_edate, "Incompleta", task_fields.get(3), task_fields.get(4));
                    TasksController taskc = new TasksController();
                    
                    if (taskc.modelCreateTask(task))
                    {
                        CoTask cotask = new CoTask(collab_id, task_id);
                        CoTasksController cotaskc = new CoTasksController();
                        
                        if (cotaskc.modelCreateCoTask(cotask))
                        {
                            response.sendRedirect("work/collab.jsp?id="+collab_id);
                        }
                        else
                        {
                            response.sendRedirect("work/collab.jsp?id="+collab_id+"&error=200-1");
                        }
                    }
                    else
                    {
                        response.sendRedirect("work/collab.jsp?id="+collab_id+"&error=200-2");
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