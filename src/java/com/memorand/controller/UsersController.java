package com.memorand.controller;

import com.memorand.beans.User;
import com.memorand.model.UsersModel;

public class UsersController {

    public boolean modelCreateUser(User user) {
        
        UsersModel userm = new UsersModel();
        return userm.createUser(user);
        
    }
    
    public boolean modelLoginUser(User user) {
        
        UsersModel userm = new UsersModel();
        return userm.loginUser(user);
    
    }
    
    public User modelGetUserInfo(User user) {
        
        UsersModel userm = new UsersModel();
        return userm.getUserInfo(user);
    
    }
}
