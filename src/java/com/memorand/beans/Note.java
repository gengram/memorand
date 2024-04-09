package com.memorand.beans;

import java.sql.Timestamp;

public class Note
{
    private String note_id;
    private String note_name;
    private String note_text;
    private Timestamp note_cdate;
    private Timestamp note_mdate;
    private String note_status;

    public Note(String note_id, String note_name, String note_text, Timestamp note_cdate, Timestamp note_mdate, String note_status)
    {
        this.note_id = note_id;
        this.note_name = note_name;
        this.note_text = note_text;
        this.note_cdate = note_cdate;
        this.note_mdate = note_mdate;
        this.note_status = note_status;
    }
    
    public String getNote_id()
    {
        return note_id;
    }

    public void setNote_id(String note_id)
    {
        this.note_id = note_id;
    }

    public String getNote_name()
    {
        return note_name;
    }

    public void setNote_name(String note_name)
    {
        this.note_name = note_name;
    }

    public String getNote_text()
    {
        return note_text;
    }

    public void setNote_text(String note_text)
    {
        this.note_text = note_text;
    }

    public Timestamp getNote_cdate()
    {
        return note_cdate;
    }

    public void setNote_cdate(Timestamp note_cdate)
    {
        this.note_cdate = note_cdate;
    }

    public Timestamp getNote_mdate()
    {
        return note_mdate;
    }

    public void setNote_mdate(Timestamp note_mdate)
    {
        this.note_mdate = note_mdate;
    }

    public String getNote_status()
    {
        return note_status;
    }

    public void setNote_status(String note_status)
    {
        this.note_status = note_status;
    }
    
}