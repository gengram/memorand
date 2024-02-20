package com.memorand.beans;

import java.io.Serializable;

public class InClust implements Serializable {
    
    private String inst_id;
    private String cluster_id;

    public InClust() {}

    public InClust(String inst_id, String cluster_id) {
        this.inst_id = inst_id;
        this.cluster_id = cluster_id;
    }

    public String getCluster_id() {
        return cluster_id;
    }

    public void setCluster_id(String cluster_id) {
        this.cluster_id = cluster_id;
    }

    public String getInst_id() {
        return inst_id;
    }

    public void setInst_id(String inst_id) {
        this.inst_id = inst_id;
    }
    
}