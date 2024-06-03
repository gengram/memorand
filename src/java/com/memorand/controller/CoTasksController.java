package com.memorand.controller;

import com.memorand.beans.CoTask;
import com.memorand.model.CoTasksModel;

public class CoTasksController 
{
    public boolean modelCreateCoTask(CoTask ct)
    {
        CoTasksModel cotaskm = new CoTasksModel();
        return cotaskm.createCoTask(ct);
    }
    
    public boolean modelDeleteCoTask(String collab_id, String task_id)
    {
        CoTasksModel cotaskm = new CoTasksModel();
        return cotaskm.deleteCoTask(collab_id, task_id);
    }
}