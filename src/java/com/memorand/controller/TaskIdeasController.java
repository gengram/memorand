package com.memorand.controller;

import com.memorand.beans.TaskIdea;
import com.memorand.model.TaskIdeasModel;

public class TaskIdeasController
{
    public boolean modelCreateTaskIdea(TaskIdea ti)
    {
        TaskIdeasModel taskideam = new TaskIdeasModel();
        return taskideam.createTaskIdea(ti);
    }
    
    public boolean modelDeleteTaskIdea(String task_id, String idea_id)
    {
        TaskIdeasModel taskideam = new TaskIdeasModel();
        return taskideam.deleteTaskIdea(task_id, idea_id);
    }
}