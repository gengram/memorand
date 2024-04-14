package com.memorand.servlets.nuevo;

import com.memorand.beans.Institution;
import com.memorand.controller.InstitutionsController;
import com.memorand.util.Generador;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class InstitutionNew extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        
        HttpSession session = request.getSession();
        
        String user_type = (String) session.getAttribute("user_type");
        
        if (user_type != null & "staff".equals(user_type))
        {
            FileItemFactory fif = new DiskFileItemFactory();
            ServletFileUpload sfu = new ServletFileUpload(fif);
            
            ArrayList<String> inst_fields = new ArrayList<>();

            String inst_img = "";
            
            try
            {
                List items = sfu.parseRequest(request);

                for (int i = 0; i < items.size(); i++)
                {
                    FileItem fi = (FileItem) items.get(i);

                    if (!fi.isFormField())
                    {
                        if (!fi.getName().isEmpty())
                        {
                            File file = new File("C:\\memorand\\web\\XM-Uploads\\institutions\\"+fi.getName());
                            fi.write(file);
                            inst_img = "XM-Uploads/institutions/"+fi.getName();
                        }
                        else
                        {
                            inst_img = "XM-Uploads/institutions/default.png";
                        }
                    }
                    else
                    {
                        inst_fields.add(fi.getString());
                    }
                }

            }
            catch (Exception e)
            {
                System.err.println(e.getMessage());
            }

            Generador g = new Generador();

            String inst_id = g.newID();
            String inst_name = inst_fields.get(0).trim();
            String inst_type = inst_fields.get(1).trim();
            String inst_profile = inst_img;
            String inst_status = "si";
            String lim_ch = inst_fields.get(2).trim();
            String lim_wk = inst_fields.get(3).trim();
            String lim_gp = inst_fields.get(4).trim();
            String lim_ks = inst_fields.get(5).trim();

            Institution inst = new Institution(inst_id, inst_name, inst_type, inst_profile, inst_status, lim_ch, lim_wk, lim_gp, lim_ks);
            InstitutionsController instc = new InstitutionsController();
        
            if (instc.modelCreateInst(inst))
            {
                response.sendRedirect("staff/home.jsp");
            }
        }
        else
        {
            session.invalidate();
            response.sendRedirect("index.jsp?error=InvalidUser");
        }
        
    }

}