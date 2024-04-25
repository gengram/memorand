package com.memorand.servlets.editar;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import com.memorand.controller.NotesController;
import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NoteText extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        HttpSession session = request.getSession();

        String user_type = (String) session.getAttribute("user_type");

        if (user_type != null && (user_type.equals("ch") || user_type.equals("wk")))
        {
            try
            {
                BufferedReader reader = request.getReader();
                StringBuilder sb = new StringBuilder();
                String line;
                
                while ((line = reader.readLine()) != null)
                {
                    sb.append(line);
                }
                
                reader.close();

                JsonObject json = new Gson().fromJson(sb.toString(), JsonObject.class);

                String note_id = json.get("note_id").getAsString();
                String note_text = json.get("note_text").getAsString();

                if (note_id != null && note_text != null)
                {
                    NotesController notec = new NotesController();

                    if (notec.modelUpdateNoteText(note_id, note_text))
                    {
                        response.setStatus(HttpServletResponse.SC_OK);
                    } else
                    {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    }
                }
                else
                {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
            }
            catch (JsonSyntaxException | IOException e)
            {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
        else
        {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        }
    }
}
