package com.memorand.model;

import com.memorand.beans.CoPost;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CoPostsModel extends Conexion {
    
    public boolean createCoPost(CoPost copost) {
    
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO coposts (collab_id, post_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, copost.getCollab_id());
            ps.setString(2, copost.getPost_id());
            
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
