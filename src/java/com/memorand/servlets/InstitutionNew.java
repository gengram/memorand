package com.memorand.servlets;

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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class InstitutionNew extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        FileItemFactory fif = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(fif);
        
        ArrayList<String> inst_fields = new ArrayList<>();
        String inst_img = "";
        
        try
        {
            List items = sfu.parseRequest(request);
            
            for (int i = 0; i < items.size(); i++) {
                FileItem fi = (FileItem) items.get(i);
                
                if (!fi.isFormField())
                {
                    File file = new File("C:\\Users\\nicojrz\\Proyectos\\memorand\\web\\uploads\\institutions\\"+fi.getName());
                    fi.write(file);
                    inst_img = "uploads/institutions/"+fi.getName();
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
        
        Generador generador = new Generador();
        
        Institution inst = new Institution(generador.newID(), inst_fields.get(0), inst_fields.get(1), inst_img, inst_fields.get(2), inst_fields.get(3), inst_fields.get(4), inst_fields.get(5));
        InstitutionsController instc = new InstitutionsController();
        response.getWriter().println(instc.ModelCreateInst(inst));
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}