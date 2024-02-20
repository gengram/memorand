package com.memorand.controller;

import com.memorand.beans.Cluster;
import com.memorand.model.ClustersModel;

public class ClustersController {
    
    public boolean modelCreateCluster(Cluster cluster) {
        
        ClustersModel clustm = new ClustersModel();
        return clustm.createCluster(cluster);
        
    }
    
    public String modelGetAllClustersByInst(String inst_id, int level1) {
    
        String htmlcode = "";
        String add1 = "";
        
        ClustersModel clustm = new ClustersModel();
        
        for (int i = 0; i < level1; i++) {
            add1 += "../";
        }
        
        
        for (Cluster cluster : clustm.getAllClustersByInst(inst_id))
        {
            htmlcode +=
            "<tr>\n" +
"                    <td>"+ cluster.getCluster_id() +"</td>\n" +
"                    <td>"+ cluster.getCluster_name() +"</td>\n" +
"                    <td>" +
"                       <svg width='200' height='100'>\n" +
"                           <rect width='200' height='100' style='fill:#"+ cluster.getCluster_color() +";stroke:black;stroke-width:2'/>\n" +
"                       </svg>" +
"                    </td>\n" +
"                    <td>" +
"                       <a href='"+ add1 +"departamentos/ver.jsp?clust_id="+ cluster.getCluster_id() +"'>Ver</a><br>" +
"                    </td>\n" +
"           </tr>";
        
        }
        
        return htmlcode;
    
    }
    
    public Cluster modelGetClusterInfoById(String c_id) {
        
        ClustersModel clustm = new ClustersModel();
        return clustm.getClusterInfoById(c_id);
        
    }
}
