package com.memorand.beans;

import java.io.Serializable;

public class CoTask implements Serializable
{
    private String collab_id;
    private String task_id;

    public CoTask() {}

    public CoTask(String collab_id, String task_id) {
        this.collab_id = collab_id;
        this.task_id = task_id;
    }

    public String getTask_id() {
        return task_id;
    }

    public void setTask_id(String task_id) {
        this.task_id = task_id;
    }

    public String getCollab_id() {
        return collab_id;
    }

    public void setCollab_id(String collab_id) {
        this.collab_id = collab_id;
    }
}