package com.memorand.beans;

import java.io.Serializable;

public class Project implements Serializable {
    
    private String proj_id;
    private String proj_name;
    private String proj_color;

    public Project() {}

    public Project(String proj_id, String proj_name, String proj_color) {
        this.proj_id = proj_id;
        this.proj_name = proj_name;
        this.proj_color = proj_color;
    }

    public String getProj_id() {
        return proj_id;
    }

    public void setProj_id(String proj_id) {
        this.proj_id = proj_id;
    }

    public String getProj_name() {
        return proj_name;
    }

    public void setProj_name(String proj_name) {
        this.proj_name = proj_name;
    }

    public String getProj_color() {
        return proj_color;
    }

    public void setProj_color(String proj_color) {
        this.proj_color = proj_color;
    }
    
}