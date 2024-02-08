package com.memorand.beans;

import java.io.Serializable;

public class InUsers implements Serializable {
    
    private String inuser_id;
    private String inst_id;
    private String user_id;

    public InUsers() {}

    public InUsers(String inuser_id, String inst_id, String user_id) {
        this.inuser_id = inuser_id;
        this.inst_id = inst_id;
        this.user_id = user_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getInuser_id() {
        return inuser_id;
    }

    public void setInuser_id(String inuser_id) {
        this.inuser_id = inuser_id;
    }

    public String getInst_id() {
        return inst_id;
    }

    public void setInst_id(String inst_id) {
        this.inst_id = inst_id;
    }
    
}