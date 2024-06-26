package com.memorand.servlets.obtener;

import com.memorand.beans.Note;
import com.memorand.controller.NotesController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NotesGet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String note_id = request.getParameter("id");
        
        response.setContentType("text/html");
        
        HttpSession session = request.getSession();
        
        if (session != null)
        {
            PrintWriter out = response.getWriter();
            NotesController notec = new NotesController();
            String htmlContent = notec.modelGetNoteText(note_id);
            
            if (htmlContent != null)
            {
                out.println(htmlContent);
            }
            else
            {
                out.println("ERROR");
            }
        }
        else
        {
            session.invalidate();
        }
    }

}