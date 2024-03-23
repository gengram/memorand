package com.memorand.model;

import com.memorand.beans.CoTag;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CoTagsModel extends Conexion {
    
    public boolean createCoTag(CoTag cotag) {
    
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO cotags (collab_id, tag_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, cotag.getCollab_id());
            ps.setString(2, cotag.getTag_id());
            
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