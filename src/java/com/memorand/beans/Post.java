package com.memorand.beans;

import java.io.Serializable;
import java.sql.Timestamp;

public class Post implements Serializable {
    
    private String post_id;
    private String post_text;
    private String post_r1;
    private String post_r2;
    private String post_r3;
    private Timestamp post_date;

    public Post() {}

    public Post(String post_id, String post_text, String post_r1, String post_r2, String post_r3, Timestamp post_date) {
        this.post_id = post_id;
        this.post_text = post_text;
        this.post_r1 = post_r1;
        this.post_r2 = post_r2;
        this.post_r3 = post_r3;
        this.post_date = post_date;
    }

    public Timestamp getPost_date() {
        return post_date;
    }

    public void setPost_date(Timestamp post_date) {
        this.post_date = post_date;
    }

    public String getPost_id() {
        return post_id;
    }

    public void setPost_id(String post_id) {
        this.post_id = post_id;
    }

    public String getPost_text() {
        return post_text;
    }

    public void setPost_text(String post_text) {
        this.post_text = post_text;
    }

    public String getPost_r1() {
        return post_r1;
    }

    public void setPost_r1(String post_r1) {
        this.post_r1 = post_r1;
    }

    public String getPost_r2() {
        return post_r2;
    }

    public void setPost_r2(String post_r2) {
        this.post_r2 = post_r2;
    }

    public String getPost_r3() {
        return post_r3;
    }

    public void setPost_r3(String post_r3) {
        this.post_r3 = post_r3;
    }
    
}