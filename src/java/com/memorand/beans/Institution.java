package com.memorand.beans;

import java.io.Serializable;

public class Institution implements Serializable
{
    private String inst_id;
    private String inst_name;
    private String inst_type;
    private String inst_profile;
    private String inst_status;
    private String lim_ch;
    private String lim_wk;
    private String lim_gp;
    private String lim_ks;

    public Institution() {}

    public Institution(String inst_id, String inst_name, String inst_type, String inst_profile, String inst_status, String lim_ch, String lim_wk, String lim_gp, String lim_ks) {
        this.inst_id = inst_id;
        this.inst_name = inst_name;
        this.inst_type = inst_type;
        this.inst_profile = inst_profile;
        this.inst_status = inst_status;
        this.lim_ch = lim_ch;
        this.lim_wk = lim_wk;
        this.lim_gp = lim_gp;
        this.lim_ks = lim_ks;
    }

    public String getInst_id() {
        return inst_id;
    }

    public void setInst_id(String inst_id) {
        this.inst_id = inst_id;
    }

    public String getInst_name() {
        return inst_name;
    }

    public void setInst_name(String inst_name) {
        this.inst_name = inst_name;
    }

    public String getInst_type() {
        return inst_type;
    }

    public void setInst_type(String inst_type) {
        this.inst_type = inst_type;
    }

    public String getInst_profile() {
        return inst_profile;
    }

    public void setInst_profile(String inst_profile) {
        this.inst_profile = inst_profile;
    }
    
    public String getInst_status() {
        return inst_status;
    }
    
    public void setInst_status(String inst_status) {
        this.inst_status = inst_status;
    }

    public String getLim_ch() {
        return lim_ch;
    }

    public void setLim_ch(String lim_ch) {
        this.lim_ch = lim_ch;
    }

    public String getLim_wk() {
        return lim_wk;
    }

    public void setLim_wk(String lim_wk) {
        this.lim_wk = lim_wk;
    }

    public String getLim_gp() {
        return lim_gp;
    }

    public void setLim_gp(String lim_gp) {
        this.lim_gp = lim_gp;
    }

    public String getLim_ks() {
        return lim_ks;
    }

    public void setLim_ks(String lim_ks) {
        this.lim_ks = lim_ks;
    }
}