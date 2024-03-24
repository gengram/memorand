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
        
        PreparedStatement ps1;
        PreparedStatement ps2;
        
        try
        {
            String sql1 = "SELECT tag_id FROM cotags WHERE collab_id = ?";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, collab_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                String t_id = rs1.getString(1);
                
                String sql2 = "SELECT * FROM tags WHERE tag_id = ? ORDER BY tag_name";
                
                ps2 = getConnection().prepareStatement(sql2);
                
                ps2.setString(1, t_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                while (rs2.next())
                {
                    String tag_id = rs2.getString(1);
                    String tag_name = rs2.getString(2);
                    String tag_color = rs2.getString(3);
                    
                    Tag tag = new Tag(tag_id, tag_name, tag_color);
                    
                    all_tag.add(tag);
                }
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
