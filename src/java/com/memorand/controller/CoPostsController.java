package com.memorand.controller;

import com.memorand.beans.CoPost;
import com.memorand.model.CoPostsModel;

public class CoPostsController
{
    public boolean modelCreateCoPost(CoPost cp)
    {
        CoPostsModel copostm = new CoPostsModel();
        return copostm.createCoPost(cp);
    }
    
    public boolean modelDeleteUserPost(String collab_id, String post_id)
    {
        CoPostsModel copostm = new CoPostsModel();
        return copostm.deleteCoPost(collab_id, post_id);
    }
}