package com.memorand.model;

import com.memorand.beans.CoPost;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CoPostsModel extends Conexion
{
    public boolean createCoPost(CoPost cp)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO coposts (collab_id, post_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, cp.getCollab_id());
            ps.setString(2, cp.getPost_id());
            
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
    
    public boolean deleteCoPost(String collab_id, String post_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM coposts WHERE collab_id = ? AND post_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, collab_id);
            ps.setString(2, post_id);
            
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