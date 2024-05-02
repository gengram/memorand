package com.memorand.servlets.nuevo;

import com.memorand.beans.Canva;
import com.memorand.beans.TaskCanva;
import com.memorand.beans.UserCanva;
import com.memorand.controller.CanvasController;
import com.memorand.controller.TaskCanvasController;
import com.memorand.controller.UserCanvasController;
import com.memorand.util.Generador;
import java.io.IOException;
import java.io.PrintWriter;
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

public class CanvaNew extends HttpServlet
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
            
            ArrayList<String> canva_fields = new ArrayList<>();
            
            String user_type = (String) session.getAttribute("user_type");
            String user_id = (String) session.getAttribute("user_id");
            
            try
            {
                List items = sfu.parseRequest(request);

                for (int i = 0; i < items.size(); i++)
                {
                    FileItem fi = (FileItem) items.get(i);

                    if (fi.isFormField())
                        canva_fields.add(fi.getString());
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
                    
                    String canva_id = g.newID();
                    String task_id = request.getParameter("id");
                    
                    String canva_name = canva_fields.get(0).trim();
                    
                    Timestamp canva_cdate = new Timestamp(System.currentTimeMillis());
                    Timestamp canva_mdate = new Timestamp(System.currentTimeMillis());
                    
                    Canva canva = new Canva(canva_id, canva_name, "", canva_cdate, canva_mdate, "Privado");
                    CanvasController canvac = new CanvasController();
                    
                    if (canvac.modelCreateCanva(canva))
                    {
                        TaskCanva taskcanva = new TaskCanva(task_id, canva_id);
                        TaskCanvasController taskcanvac = new TaskCanvasController();
                        
                        if (taskcanvac.modelCreateTaskCanva(taskcanva))
                        {
                            UserCanva usercanva = new UserCanva(user_id, canva_id);
                            UserCanvasController usercanvac = new UserCanvasController();
                            
                            if (usercanvac.modelCreateUserCanva(usercanva))
                            {
                                response.sendRedirect("work/lienzo.jsp?id="+canva_id);
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