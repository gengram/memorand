package com.memorand.controller;

import com.memorand.beans.Post;
import com.memorand.model.PostsModel;

public class PostsController {
    
    public boolean modelCreatePost(Post post) {
        
        PostsModel postm = new PostsModel();
        return postm.createPost(post);
        
    }
    
}