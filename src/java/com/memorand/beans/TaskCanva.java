package com.memorand.beans;

import java.io.Serializable;

public class TaskCanva implements Serializable
{
    private String task_id;
    private String canva_id;

    public TaskCanva(String task_id, String canva_id)
    {
        this.task_id = task_id;
        this.canva_id = canva_id;
    }

    public String getCanva_id()
    {
        return canva_id;
    }

    public void setCanva_id(String canva_id)
    {
        this.canva_id = canva_id;
    }

    public String getTask_id()
    {
        return task_id;
    }

    public void setTask_id(String task_id)
    {
        this.task_id = task_id;
    }
}