package com.memorand.controller;

import com.memorand.beans.InUser;
import com.memorand.model.InUsersModel;

public class InUsersController
{
    public boolean modelCreateInUser(InUser iu)
    {
        InUsersModel inuserm = new InUsersModel();
        return inuserm.createInUser(iu);
    }
    
    public boolean modelDeleteInUser(String inst_id, String user_id)
    {
        InUsersModel inuserm = new InUsersModel();
        return inuserm.deleteInUser(inst_id, user_id);
    }
}