package com.memorand.beans;

import java.sql.Timestamp;

public class Idea
{
    private String idea_id;
    private String idea_text;
    private Timestamp idea_date;
    private String idea_color;

    public Idea(String idea_id, String idea_text, Timestamp idea_date, String idea_color)
    {
        this.idea_id = idea_id;
        this.idea_text = idea_text;
        this.idea_date = idea_date;
        this.idea_color = idea_color;
    }

    public String getIdea_color()
    {
        return idea_color;
    }

    public void setIdea_color(String idea_color)
    {
        this.idea_color = idea_color;
    }

    public String getIdea_id()
    {
        return idea_id;
    }

    public void setIdea_id(String idea_id)
    {
        this.idea_id = idea_id;
    }

    public String getIdea_text()
    {
        return idea_text;
    }

    public void setIdea_text(String idea_text)
    {
        this.idea_text = idea_text;
    }

    public Timestamp getIdea_date()
    {
        return idea_date;
    }

    public void setIdea_date(Timestamp idea_date)
    {
        this.idea_date = idea_date;
    }
    
}