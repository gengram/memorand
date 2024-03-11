package com.memorand.controller;

import com.memorand.beans.UserPost;
import com.memorand.model.UserPostsModel;

public class UserPostsController {
    
    public boolean modelCreateUserPost(UserPost userpost) {
    
        UserPostsModel userpostm = new UserPostsModel();
        return userpostm.createUserPost(userpost);
        
    }
    
}