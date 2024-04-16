package com.memorand.beans;

import java.io.Serializable;
import java.sql.Timestamp;

public class AppSuggestion implements Serializable
{
    private String sug_id;
    private Timestamp sug_date;
    private String sug_msg;
    private String sug_email;

    public AppSuggestion() {}

    public AppSuggestion(String sug_id, Timestamp sug_date, String sug_msg, String sug_email)
    {
        this.sug_id = sug_id;
        this.sug_date = sug_date;
        this.sug_msg = sug_msg;
        this.sug_email = sug_email;
    }

    public String getSug_email() {
        return sug_email;
    }

    public void setSug_email(String sug_email) {
        this.sug_email = sug_email;
    }

    public String getSug_id() {
        return sug_id;
    }

    public void setSug_id(String sug_id) {
        this.sug_id = sug_id;
    }

    public Timestamp getSug_date() {
        return sug_date;
    }

    public void setSug_date(Timestamp sug_date) {
        this.sug_date = sug_date;
    }

    public String getSug_msg() {
        return sug_msg;
    }

    public void setSug_msg(String sug_msg) {
        this.sug_msg = sug_msg;
    }
}