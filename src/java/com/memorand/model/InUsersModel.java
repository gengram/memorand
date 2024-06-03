package com.memorand.model;

import com.memorand.beans.InUser;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InUsersModel extends Conexion
{
    public boolean createInUser(InUser iu)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO inusers (inst_id, user_id) VALUES (?,?)";

            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, iu.getInst_id());
            ps.setString(2, iu.getUser_id());
            
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
    
    public boolean deleteInUser(String inst_id, String user_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM inusers WHERE inst_id = ? AND user_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inst_id);
            ps.setString(2, user_id);
            
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