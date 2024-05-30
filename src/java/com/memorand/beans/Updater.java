package com.memorand.beans;

import java.io.Serializable;

public class Updater implements Serializable
{
    private String upd_type;
    private String upd_id;
    private String upd_msg;

    public Updater() {}
    
    public Updater(String upd_type, String upd_id, String upd_msg)
    {
        this.upd_type = upd_type;
        this.upd_id = upd_id;
        this.upd_msg = upd_msg;
    }

    public String getUpd_msg()
    {
        return upd_msg;
    }

    public void setUpd_msg(String upd_msg)
    {
        this.upd_msg = upd_msg;
    }

    public String getUpd_type()
    {
        return upd_type;
    }

    public void setUpd_type(String upd_type)
    {
        this.upd_type = upd_type;
    }

    public String getUpd_id()
    {
        return upd_id;
    }

    public void setUpd_id(String upd_id)
    {
        this.upd_id = upd_id;
    }
}