package com.memorand.controller;

import com.memorand.beans.CollabUser;
import com.memorand.model.CollabUsersModel;

public class CollabUsersController {
    
    public boolean modelCreateCollabUser(CollabUser collabuser) {
    
        CollabUsersModel collabuserm = new CollabUsersModel();
        return collabuserm.createCollabUser(collabuser);
    
    }
    
}