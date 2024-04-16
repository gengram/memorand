package com.memorand.beans;

import java.io.Serializable;

public class TaskNote implements Serializable
{
    private String task_id;
    private String note_id;

    public TaskNote(String task_id, String note_id)
    {
        this.task_id = task_id;
        this.note_id = note_id;
    }

    public String getNote_id()
    {
        return note_id;
    }

    public void setNote_id(String note_id)
    {
        this.note_id = note_id;
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