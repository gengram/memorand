package com.memorand.controller;

import com.memorand.beans.InUser;
import com.memorand.model.InUsersModel;

public class InUsersController {

    public boolean modelCreateInUsers(InUser inusers) {
        
        InUsersModel inuserm = new InUsersModel();
        return inuserm.createInUser(inusers);
    
    }
    
}
