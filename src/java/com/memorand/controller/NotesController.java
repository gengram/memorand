package com.memorand.controller;

import com.memorand.beans.Note;
import com.memorand.model.NotesModel;

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
        
        return htmlcode;
    }
}
