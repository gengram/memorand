package com.memorand.controller;

import com.memorand.beans.CollabUser;
import com.memorand.model.CollabUsersModel;

public class CollabUsersController
{
    public boolean modelCreateCollabUser(CollabUser cu)
    {
        CollabUsersModel collabuserm = new CollabUsersModel();
        return collabuserm.createCollabUser(cu);
    }
    
    public boolean modelDeleteCollabUser(String collab_id, String user_id)
    {
        CollabUsersModel collabuserm = new CollabUsersModel();
        return collabuserm.deleteCollabUser(collab_id, user_id);
    }
}