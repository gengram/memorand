package com.memorand.beans;

import java.io.Serializable;

public class Cluster implements Serializable {
    
    private String cluster_id;
    private String cluster_name;
    private String cluster_color;

    public Cluster() {}

    public Cluster(String cluster_id, String cluster_name, String cluster_color) {
        this.cluster_id = cluster_id;
        this.cluster_name = cluster_name;
        this.cluster_color = cluster_color;
    }

    public String getCluster_color() {
        return cluster_color;
    }

    public void setCluster_color(String cluster_color) {
        this.cluster_color = cluster_color;
    }

    public String getCluster_id() {
        return cluster_id;
    }

    public void setCluster_id(String cluster_id) {
        this.cluster_id = cluster_id;
    }

    public String getCluster_name() {
        return cluster_name;
    }

    public void setCluster_name(String cluster_name) {
        this.cluster_name = cluster_name;
    }
    
}
