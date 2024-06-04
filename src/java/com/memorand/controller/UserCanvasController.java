package com.memorand.controller;

import com.memorand.beans.UserCanva;
import com.memorand.model.UserCanvasModel;

public class UserCanvasController
{
    public boolean modelCreateUserCanva(UserCanva uc)
    {
        UserCanvasModel usercanvam = new UserCanvasModel();
        return usercanvam.createUserCanva(uc);
    }
    
    public boolean modelDeleteUserCanva(String user_id, String canva_id)
    {
        UserCanvasModel usercanvam = new UserCanvasModel();
        return usercanvam.deleteUserCanva(user_id, canva_id);
    }
}
