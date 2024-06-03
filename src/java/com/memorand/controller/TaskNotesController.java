package com.memorand.controller;

import com.memorand.beans.TaskNote;
import com.memorand.model.TaskNotesModel;

public class TaskNotesController
{
    public boolean modelCreateTaskNote(TaskNote tn)
    {
        TaskNotesModel tasknotem = new TaskNotesModel();
        return tasknotem.createTaskNote(tn);
    }
    
    public boolean modelDeleteTaskNote(String task_id, String note_id)
    {
        TaskNotesModel tasknotem = new TaskNotesModel();
        return tasknotem.deleteTaskNote(task_id, note_id);
    }
}