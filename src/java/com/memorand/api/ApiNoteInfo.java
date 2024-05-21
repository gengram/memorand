/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.memorand.api;

import com.google.gson.Gson;
import com.memorand.beans.Note;
import com.memorand.controller.NotesController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cesaaaaar
 */
public class ApiNoteInfo extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("application/json");
        
        String note_id = request.getParameter("note_id");
        
        if (note_id == null || note_id.isEmpty())
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
        
        NotesController notesc = new NotesController();
        Note note = notesc.modelGetNoteById(note_id);
        
        Gson gson = new Gson();
        
        String note_info = gson.toJson(note);
        
        try (PrintWriter out = response.getWriter())
        {
            out.println(note_info);
        }
    }
}
