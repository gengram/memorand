package com.memorand.controller;

import com.memorand.beans.UserNote;
import com.memorand.model.UserNotesModel;

public class UserNotesController
{
    public boolean modelCreateUserNote(UserNote usernote)
    {
        UserNotesModel usernotem = new UserNotesModel();
        return usernotem.createUserNote(usernote);
    }
}
