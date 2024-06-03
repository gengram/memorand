package com.memorand.controller;

import com.memorand.beans.UserNote;
import com.memorand.model.UserNotesModel;

public class UserNotesController
{
    public boolean modelCreateUserNote(UserNote un)
    {
        UserNotesModel usernotem = new UserNotesModel();
        return usernotem.createUserNote(un);
    }
    
    public boolean modelDeleteUserNote(String user_id, String note_id)
    {
        UserNotesModel usernotem = new UserNotesModel();
        return usernotem.deleteUserNote(user_id, note_id);
    }
}