package com.memorand.beans;

import java.io.Serializable;

public class PostCom implements Serializable {
    
    private String post_id;
    private String comment_id;

    public PostCom() {}

    public PostCom(String post_id, String comment_id) {
        this.post_id = post_id;
        this.comment_id = comment_id;
    }

    public String getComment_id() {
        return comment_id;
    }

    public void setComment_id(String comment_id) {
        this.comment_id = comment_id;
    }

    public String getPost_id() {
        return post_id;
    }

    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }

}