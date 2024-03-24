package com.memorand.controller;

import com.memorand.beans.CoTask;
import com.memorand.model.CoTasksModel;

public class CoTasksController 
{
    public boolean modelCreateCoTask(CoTask cotask)
    {
        CoTasksModel cotaskm = new CoTasksModel();
        return cotaskm.createCoTask(cotask);
    }
}