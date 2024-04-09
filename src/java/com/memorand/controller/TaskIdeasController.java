package com.memorand.controller;

import com.memorand.beans.TaskIdea;
import com.memorand.model.TaskIdeasModel;

public class TaskIdeasController
{
    public boolean modelCreateTaskIdea(TaskIdea taskidea)
    {
        TaskIdeasModel taskideam = new TaskIdeasModel();
        return taskideam.createTaskIdea(taskidea);
    }
}
