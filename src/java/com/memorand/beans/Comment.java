package com.memorand.beans;

import java.io.Serializable;
import java.sql.Timestamp;

public class Comment implements Serializable {
    
    private String comment_id;
    private String comment_text;
    private int comment_r1;
    private int comment_r2;
    private int comment_r3;
    private Timestamp comment_date;

    public Comment() {}

    public Comment(String comment_id, String comment_text, int comment_r1, int comment_r2, int comment_r3, Timestamp comment_date) {
        this.comment_id = comment_id;
        this.comment_text = comment_text;
        this.comment_r1 = comment_r1;
        this.comment_r2 = comment_r2;
        this.comment_r3 = comment_r3;
        this.comment_date = comment_date;
    }

    public Timestamp getComment_date() {
        return comment_date;
    }

    public void setComment_date(Timestamp comment_date) {
        this.comment_date = comment_date;
    }

    public String getComment_id() {
        return comment_id;
    }

    public void setComment_id(String comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_text() {
        return comment_text;
    }

    public void setComment_text(String comment_text) {
        this.comment_text = comment_text;
    }

    public int getComment_r1() {
        return comment_r1;
    }

    public void setComment_r1(int comment_r1) {
        this.comment_r1 = comment_r1;
    }

    public int getComment_r2() {
        return comment_r2;
    }

    public void setComment_r2(int comment_r2) {
        this.comment_r2 = comment_r2;
    }

    public int getComment_r3() {
        return comment_r3;
    }

    public void setComment_r3(int comment_r3) {
        this.comment_r3 = comment_r3;
    }

}