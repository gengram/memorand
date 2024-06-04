package com.memorand.model;

import com.memorand.beans.InProject;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InProjectsModel extends Conexion
{
    public boolean createInProject(InProject ip)
    {
        boolean flag = false;
    
        PreparedStatement ps = null;
        
        try
        {
            String sql = "INSERT INTO inprojects (inst_id, proj_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, ip.getInst_id());
            ps.setString(2, ip.getProj_id());
            
            if (ps.executeUpdate() == 1)
                flag = true;
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
    
    public boolean deleteInProject(String inst_id, String proj_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM inprojects WHERE inst_id = ? AND proj_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inst_id);
            ps.setString(2, proj_id);
            
            if (ps.executeUpdate() == 1)
                flag = true;
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