package com.memorand.servlets.editar;

import com.memorand.beans.Task;
import com.memorand.controller.TasksController;
import com.memorand.util.Sanitizante;
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

public class TaskEdit extends HttpServlet
{
    private static final String WORK_HOME = "work/home.jsp";
    private static final String INDEX_PAGE = "index.jsp";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);
        
        if (session != null)
        {
            String user_type = (String) session.getAttribute("user_type");
            
            if ("ch".equals(user_type) || "wk".equals(user_type))
            {
                String task_id = request.getParameter("id");
                
                if (task_id != null)
                {
                    FileItemFactory fif = new DiskFileItemFactory();
                    ServletFileUpload sfu = new ServletFileUpload(fif);

                    List<String> task_fields = new ArrayList<>();

                    try
                    {
                        List<FileItem> items = sfu.parseRequest(request);

                        for (FileItem item : items)
                        {
                            if (item.isFormField())
                            {
                                String fieldValue = item.getString();
                                if (fieldValue != null)
                                {
                                    task_fields.add(fieldValue);
                                }
                            }
                        }
                    }

                    catch (FileUploadException e)
                    {
                        System.err.println(e.getMessage());
                    }
                    
                    processTaskUpdate(request, response, session, task_fields, task_id);
                }
                else
                {
                    redirectWithError(response, WORK_HOME, "InvalidTask");
                }
            }
            else
            {
                session.invalidate();
                redirectWithError(response, INDEX_PAGE, "InvalidUser");
            }
        }
        else
        {
            redirectWithError(response, INDEX_PAGE, "SessionExpired");
        }
    }
    
    private void processTaskUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession session, List<String> task_fields, String task_id) throws IOException
    {
        String task_name = Sanitizante.sanitizar(task_fields.get(0).trim());
        String task_info = Sanitizante.sanitizar(task_fields.get(3).trim());
        String task_edate = Sanitizante.sanitizar(task_fields.get(4).trim());
        String task_prior = Sanitizante.sanitizar(task_fields.get(1).trim());
        String task_diff = Sanitizante.sanitizar(task_fields.get(2).trim());
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime localDateTime = LocalDateTime.parse(task_edate, formatter);
        Timestamp ts_task_edate = Timestamp.valueOf(localDateTime);
        
        Task task = new Task(task_id, task_name, task_info, ts_task_edate, task_prior, task_diff);
        TasksController taskc = new TasksController();
        
        if (taskc.modelUpdateTask(task))
            response.sendRedirect("work/tarea.jsp?id=" + task_id);
        else
            redirectWithError(response, WORK_HOME, "Model");
    }
    
    private void redirectWithError(HttpServletResponse response, String page, String errorCode) throws IOException
    {
        response.sendRedirect(page + "?error=" + errorCode);
    }
}