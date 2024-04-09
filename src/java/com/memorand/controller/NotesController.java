package com.memorand.controller;

import com.memorand.beans.Note;
import com.memorand.model.NotesModel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class NotesController
{
    public boolean modelCreateNote(Note note)
    {
        NotesModel notem = new NotesModel();
        return notem.createNote(note);
    }
    
    public Note modelGetNoteById(String n_id)
    {
        NotesModel notem = new NotesModel();
        return notem.getNoteById(n_id);
    }
    
    public String modelGetNotesByTask(String task_id)
    {
        String htmlcode = "<h3>Crear nota r&aacute;pida</h3>\n"
                + "            <h1><a href='notenew.jsp?id=" + task_id + "'>+</a></h1>\n"
                + "            \n"
                + "            <h3>Notas del equipo</h3>";
        
        NotesModel notem = new NotesModel();
        ArrayList<Note> notes = notem.getNotesByTask(task_id);
        
        if (notes.isEmpty())
        {
            htmlcode += "<p>No hay notas por mostrar</p>";
            return htmlcode;
        }
        else
        {
            htmlcode += "<table border=\"1\">\n" +
"                <thead>\n" +
"                    <tr>\n" +
"                        <th></th>\n" +
"                        <th>Nombre</th>\n" +
"                        <th>Creada el:</th>\n" +
"                        <th>&Uacute;ltima modificaci&oacute;n</th>\n" +
"                        <th></th>\n" +
"                    </tr>\n" +
"                </thead>\n" +
"                <tbody>";
            
            for (Note n : notes)
            {
                String note_id = n.getNote_id();
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
                SimpleDateFormat sdf2 = new SimpleDateFormat("dd 'de' MMMM 'a la(s):' hh:mm a", new Locale("es"));
                
                String note_cdate = sdf1.format(n.getNote_cdate());
                String note_mdate = sdf2.format(n.getNote_mdate());
                
                htmlcode += "<tr>\n" +
"                        <td>:</td>\n" +
"                        <td>"+ n.getNote_name() +"</td>\n" +
"                        <td>"+ note_cdate +"</td>\n" +
"                        <td>"+ note_mdate +"</td>\n" +
"                        <td><a href='nota.jsp?id="+ note_id +"'>Ver</a></td>\n" +
"                    </tr>";
            }
            
            htmlcode += "</tbody>\n" +
"            </table>";
        }
        
        return htmlcode;
    }
}
