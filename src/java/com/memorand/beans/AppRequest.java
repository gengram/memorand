package com.memorand.beans;

import java.sql.Timestamp;

public class AppRequest
{
    private String req_id;
    private Timestamp req_date;
    private String req_name;
    private String req_pat;
    private String req_mat;
    private String req_inst;
    private String req_email;
    private String req_phone;
    private String req_job;
    private String req_num;
    private String req_msg;
    private String req_status;

    public AppRequest() {}

    public AppRequest(String req_id, Timestamp req_date, String req_name, String req_pat, String req_mat, String req_inst, String req_email, String req_phone, String req_job, String req_num, String req_msg, String req_status)
    {
        this.req_id = req_id;
        this.req_date = req_date;
        this.req_name = req_name;
        this.req_pat = req_pat;
        this.req_mat = req_mat;
        this.req_inst = req_inst;
        this.req_email = req_email;
        this.req_phone = req_phone;
        this.req_job = req_job;
        this.req_num = req_num;
        this.req_msg = req_msg;
        this.req_status = req_status;
    }

    public String getReq_id() {
        return req_id;
    }

    public void setReq_id(String req_id) {
        this.req_id = req_id;
    }

    public Timestamp getReq_date() {
        return req_date;
    }

    public void setReq_date(Timestamp req_date) {
        this.req_date = req_date;
    }

    public String getReq_name() {
        return req_name;
    }

    public void setReq_name(String req_name) {
        this.req_name = req_name;
    }

    public String getReq_pat() {
        return req_pat;
    }

    public void setReq_pat(String req_pat) {
        this.req_pat = req_pat;
    }

    public String getReq_mat() {
        return req_mat;
    }

    public void setReq_mat(String req_mat) {
        this.req_mat = req_mat;
    }

    public String getReq_inst() {
        return req_inst;
    }

    public void setReq_inst(String req_inst) {
        this.req_inst = req_inst;
    }

    public String getReq_email() {
        return req_email;
    }

    public void setReq_email(String req_email) {
        this.req_email = req_email;
    }

    public String getReq_phone() {
        return req_phone;
    }

    public void setReq_phone(String req_phone) {
        this.req_phone = req_phone;
    }

    public String getReq_job() {
        return req_job;
    }

    public void setReq_job(String req_job) {
        this.req_job = req_job;
    }

    public String getReq_num() {
        return req_num;
    }

    public void setReq_num(String req_num) {
        this.req_num = req_num;
    }

    public String getReq_msg() {
        return req_msg;
    }

    public void setReq_msg(String req_msg) {
        this.req_msg = req_msg;
    }

    public String getReq_status() {
        return req_status;
    }

    public void setReq_status(String req_status) {
        this.req_status = req_status;
    }
}