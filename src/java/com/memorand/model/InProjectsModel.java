package com.memorand.model;

import com.memorand.beans.InProject;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InProjectsModel extends Conexion {
    
    public boolean createInProject(InProject inproject) {
    
        boolean flag = false;
    
        PreparedStatement ps = null;
        
        try
        {
            String sql = "INSERT INTO inprojects (inst_id, proj_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inproject.getInst_id());
            ps.setString(2, inproject.getProj_id());
            
            if (ps.executeUpdate() == 1)
            { flag = true; }
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