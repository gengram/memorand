package com.memorand.controller;

import com.memorand.beans.UserPost;
import com.memorand.model.UserPostsModel;

public class UserPostsController
{
    public boolean modelCreateUserPost(UserPost up)
    {
        UserPostsModel userpostm = new UserPostsModel();
        return userpostm.createUserPost(up);
    }
    
    public boolean modelDeleteUserPost(String user_id, String post_id)
    {
        UserPostsModel userpostm = new UserPostsModel();
        return userpostm.deleteUserPost(user_id, post_id);
    }
}