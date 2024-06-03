package com.memorand.controller;

import com.memorand.beans.UserIdea;
import com.memorand.model.UserIdeasModel;

public class UserIdeasController
{
    public boolean modelCreateUserIdea(UserIdea ui)
    {
        UserIdeasModel userideam = new UserIdeasModel();
        return userideam.createUserIdea(ui);
    }
    
    public boolean modelDeleteUserIdea(String user_id, String idea_id)
    {
        UserIdeasModel userideam = new UserIdeasModel();
        return userideam.deleteUserIdea(user_id, idea_id);
    }
}
