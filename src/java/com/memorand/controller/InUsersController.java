package com.memorand.controller;

import com.memorand.beans.InUsers;
import com.memorand.model.InUsersModel;

public class InUsersController {

    public boolean modelCreateInUsers(InUsers inusers) {
        
        InUsersModel inuserm = new InUsersModel();
        return inuserm.createInUsers(inusers);
    
    }
    
}
