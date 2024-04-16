package com.memorand.beans;

import java.io.Serializable;

public class CoPost implements Serializable
{
    private String collab_id;
    private String post_id;

    public CoPost() {}

    public CoPost(String collab_id, String post_id) {
        this.collab_id = collab_id;
        this.post_id = post_id;
    }

    public String getPost_id() {
        return post_id;
    }

    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }

    public String getCollab_id() {
        return collab_id;
    }

    public void setCollab_id(String collab_id) {
        this.collab_id = collab_id;
    }
}