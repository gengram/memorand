package com.memorand.controller;

import com.memorand.beans.UserCanva;
import com.memorand.model.UserCanvasModel;

public class UserCanvasController
{
    public boolean modelCreateUserCanva(UserCanva usercanva)
    {
        UserCanvasModel usercanvam = new UserCanvasModel();
        return usercanvam.createUserCanva(usercanva);
    }
}
