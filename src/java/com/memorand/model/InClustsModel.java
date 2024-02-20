package com.memorand.model;

import com.memorand.beans.InClust;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InClustsModel extends Conexion {
    
    public boolean createInClusts(InClust inclust) {
    
        boolean flag = false;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "INSERT INTO inclusts (inst_id, cluster_id) VALUES (?,?)";

            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inclust.getInst_id());
            ps.setString(2, inclust.getCluster_id());
            
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
    
}