package com.memorand.controller;

import com.memorand.beans.Collab;
import com.memorand.model.CollabsModel;

public class CollabsController
{
    public boolean modelCreateCollab(Collab c)
    {
        CollabsModel collabm = new CollabsModel();
        return collabm.createCollab(c);
    }
    
    public boolean modelDeleteCollab(String c_id)
    {
        CollabsModel collabm = new CollabsModel();
        return collabm.deleteCollab(c_id);
    }
    
    public Collab beanGetCollabByTeamAndProject(String t_id, String p_id)
    {
        CollabsModel collabm = new CollabsModel();
        return collabm.getCollabByTeamAndProject(t_id, p_id);
    }
    
    public Collab beanGetCollabByTask(String task_id)
    {
        CollabsModel collabm = new CollabsModel();
        return collabm.getCollabByTask(task_id);
    }
}