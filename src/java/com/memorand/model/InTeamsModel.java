package com.memorand.model;

import com.memorand.beans.InTeam;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InTeamsModel extends Conexion
{
    public boolean createInTeam(InTeam it)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO inteams (inst_id, team_id) VALUES (?,?)";

            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, it.getInst_id());
            ps.setString(2, it.getTeam_id());
            
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
    
    public boolean deleteInTeam(String inst_id, String team_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM inteams WHERE inst_id = ? AND team_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inst_id);
            ps.setString(2, team_id);
            
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