package com.memorand.model;

import com.memorand.beans.Tag;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TagsModel extends Conexion
{
    public boolean createTag(Tag tag)
    {
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
    
    public ArrayList<Tag> getAllTagsByCollab(String collab_id)
    {
        ArrayList<Tag> all_tag = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT t.tag_id, t.tag_name, t.tag_color " +
                         "FROM tags t " +
                         "INNER JOIN cotags c ON t.tag_id = c.tag_id " +
                         "WHERE c.collab_id = ? " +
                         "ORDER BY t.tag_name";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, collab_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String tag_id = rs.getString(1);
                String tag_name = rs.getString(2);
                String tag_color = rs.getString(3);
                    
                Tag tag = new Tag(tag_id, tag_name, tag_color);
                    
                all_tag.add(tag);
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
        
        return all_tag;
    }
}
