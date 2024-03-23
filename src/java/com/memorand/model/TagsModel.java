package com.memorand.model;

import com.memorand.beans.Tag;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TagsModel extends Conexion {
    
    public boolean createTag(Tag tag) {
    
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO tags (tag_id, tag_name, tag_color) VALUES (?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, tag.getTag_id());
            ps.setString(2, tag.getTag_name());
            ps.setString(3, tag.getTag_color());
            
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
