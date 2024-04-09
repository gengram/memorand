package com.memorand.controller;

import com.memorand.beans.TaskCanva;
import com.memorand.model.TaskCanvasModel;

public class TaskCanvasController
{
    public boolean modelCreateTaskCanva(TaskCanva taskcanva)
    {
        TaskCanvasModel taskcanvam = new TaskCanvasModel();
        return taskcanvam.createTaskCanva(taskcanva);
    }
}
