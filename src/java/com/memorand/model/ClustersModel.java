package com.memorand.model;

import com.memorand.beans.Cluster;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClustersModel extends Conexion {
    
    public boolean createCluster(Cluster cluster) {
        
        boolean flag = false;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "INSERT INTO clusters (cluster_id, cluster_name, cluster_color) VALUES (?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, cluster.getCluster_id());
            ps.setString(2, cluster.getCluster_name());
            ps.setString(3, cluster.getCluster_color());
            
            if (ps.executeUpdate() == 1)
            {
                flag = true;
            }
            
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }
        
        finally
        {
            if (getConnection() != null)
            {
                try
                { getConnection().close(); }
                catch (SQLException ex)
                { System.err.println(ex.getMessage()); }
            }
        }
        
        return flag;
        
    }
    
    public ArrayList<Cluster> getAllClustersByInst(String inst_id) {
    
        ArrayList<Cluster> all_cluster = new ArrayList<>();
        
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        
        try
        {
            String sql1 = "SELECT cluster_id FROM inclusts WHERE inst_id = ?";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, inst_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                String clust_id = rs1.getString(1);
                
                String sql2 = "SELECT * FROM clusters WHERE cluster_id = ? ORDER BY cluster_name";
                
                ps2.getConnection().prepareStatement(sql2);
                
                ps2.setString(1, clust_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                while (rs2.next())
                {
                    String cluster_id = rs2.getString(1);
                    String cluster_name = rs2.getString(2);
                    String cluster_color = rs2.getString(3);
                    
                    Cluster cluster = new Cluster(cluster_id, cluster_name, cluster_color);
                    
                    all_cluster.add(cluster);
                }
            }
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }
        
        finally
        {
            if (getConnection() != null)
            {
                try
                { getConnection().close(); }
                catch (SQLException ex)
                { System.err.println(ex.getMessage()); }
            }
        }
        
        return all_cluster;
    
    }
    
}
