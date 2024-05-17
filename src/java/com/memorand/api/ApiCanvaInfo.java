/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.memorand.api;

import com.google.gson.Gson;
import com.memorand.beans.Canva;
import com.memorand.controller.CanvasController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario
 */
public class ApiCanvaInfo extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("application/json");
        
        String canva_id = request.getParameter("canva_id");
        
        if (canva_id == null || canva_id.isEmpty())
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        
        CanvasController canvasc = new CanvasController();
        Canva canva = canvasc.modelGetCanvaById(canva_id);
        
        Gson gson = new Gson();
        
        String canva_info = gson.toJson(canva);
        
        try (PrintWriter out = response.getWriter())
        {
            out.println(canva_info);
        }
    }
    
}
