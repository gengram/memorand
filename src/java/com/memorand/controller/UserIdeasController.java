package com.memorand.controller;

import com.memorand.beans.UserIdea;
import com.memorand.model.UserIdeasModel;

public class UserIdeasController
{
    public boolean modelCreateUserIdea(UserIdea useridea)
    {
        UserIdeasModel userideam = new UserIdeasModel();
        return userideam.createUserIdea(useridea);
    }
}
