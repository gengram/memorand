package com.memorand.controller;

import com.memorand.beans.TaskNote;
import com.memorand.model.TaskNotesModel;

public class TaskNotesController
{
    public boolean modelCreateTaskNote(TaskNote tasknote)
    {
        TaskNotesModel tasknotem = new TaskNotesModel();
        return tasknotem.createTaskNote(tasknote);
    }
}
