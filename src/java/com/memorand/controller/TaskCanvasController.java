package com.memorand.controller;

import com.memorand.beans.TaskCanva;
import com.memorand.model.TaskCanvasModel;

public class TaskCanvasController
{
    public boolean modelCreateTaskCanva(TaskCanva tc)
    {
        TaskCanvasModel taskcanvam = new TaskCanvasModel();
        return taskcanvam.createTaskCanva(tc);
    }
    
    public boolean modelDeleteTaskCanva(String task_id, String canva_id)
    {
        TaskCanvasModel taskcanvam = new TaskCanvasModel();
        return taskcanvam.deleteTaskCanva(task_id, canva_id);
    }
}