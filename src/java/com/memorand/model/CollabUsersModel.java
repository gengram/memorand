package com.memorand.model;

import com.memorand.beans.CollabUser;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CollabUsersModel extends Conexion
{
    public boolean createCollabUser(CollabUser cu)
    {
        
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO collabusers (collab_id, user_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, cu.getCollab_id());
            ps.setString(2, cu.getUser_id());
            
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
    
    public boolean deleteCollabUser(String collab_id, String user_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM collabusers WHERE collab_id = ? AND user_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, collab_id);
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
