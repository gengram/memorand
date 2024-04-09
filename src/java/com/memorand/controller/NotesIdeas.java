package com.memorand.controller;

import com.memorand.beans.Note;
import com.memorand.model.NotesModel;

public class NotesIdeas
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
        String htmlcode = "";
        
        return htmlcode;
    }
}
