package com.memorand.beans;

import java.io.Serializable;
import java.sql.Timestamp;

public class Canva implements Serializable
{
    private String canva_id;
    private String canva_name;
    private String canva_draw;
    private Timestamp canva_cdate;
    private Timestamp canva_mdate;
    private String canva_status;

    public Canva(String canva_id, String canva_name, String canva_draw, Timestamp canva_cdate, Timestamp canva_mdate, String canva_status)
    {
        this.canva_id = canva_id;
        this.canva_name = canva_name;
        this.canva_draw = canva_draw;
        this.canva_cdate = canva_cdate;
        this.canva_mdate = canva_mdate;
        this.canva_status = canva_status;
    }

    public String getCanva_id()
    {
        return canva_id;
    }

    public void setCanva_id(String canva_id)
    {
        this.canva_id = canva_id;
    }

    public String getCanva_name()
    {
        return canva_name;
    }

    public void setCanva_name(String canva_name)
    {
        this.canva_name = canva_name;
    }

    public String getCanva_draw()
    {
        return canva_draw;
    }

    public void setCanva_draw(String canva_draw)
    {
        this.canva_draw = canva_draw;
    }

    public Timestamp getCanva_cdate() {
        return canva_cdate;
    }

    public void setCanva_cdate(Timestamp canva_cdate)
    {
        this.canva_cdate = canva_cdate;
    }

    public Timestamp getCanva_mdate()
    {
        return canva_mdate;
    }

    public void setCanva_mdate(Timestamp canva_mdate)
    {
        this.canva_mdate = canva_mdate;
    }

    public String getCanva_status()
    {
        return canva_status;
    }

    public void setCanva_status(String canva_status)
    {
        this.canva_status = canva_status;
    }
}