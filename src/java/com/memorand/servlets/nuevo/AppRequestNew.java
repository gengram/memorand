package com.memorand.servlets.nuevo;

import com.memorand.beans.AppRequest;
import com.memorand.controller.AppRequestsController;
import com.memorand.util.Generador;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class AppRequestNew extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        FileItemFactory fif = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(fif);
        
        ArrayList<String> req_fields = new ArrayList<>();
        
        try
        {
            List items = sfu.parseRequest(request);
            
            for (int i = 0; i < items.size(); i++)
            {
                FileItem fi = (FileItem) items.get(i);
                
                if (fi.isFormField())
                    req_fields.add(fi.getString());
            }
            
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }
        
        Generador g = new Generador();
        
        String req_id = g.newID();
        Timestamp req_date = new Timestamp(System.currentTimeMillis());
        
        AppRequest req = new AppRequest(req_id, req_date, req_fields.get(0), req_fields.get(1), req_fields.get(2), req_fields.get(3), req_fields.get(4), req_fields.get(5), req_fields.get(6), req_fields.get(7), req_fields.get(8), "no");
        AppRequestsController reqc = new AppRequestsController();
        
        if (reqc.modelCreateRequest(req))
        {
            response.sendRedirect("index.jsp?req=sent");
        }
        else
        {
            response.sendRedirect("index.jsp?req=error");
        }
    }
}
