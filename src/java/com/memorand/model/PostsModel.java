package com.memorand.model;

import com.memorand.beans.Post;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class PostsModel extends Conexion {
    
    public boolean createPost(Post post) {
        
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO posts (post_id, post_text, post_r1, post_r2, post_r3, post_date) VALUES (?,?,?,?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, post.getPost_id());
            ps.setString(2, post.getPost_text());
            ps.setInt(3, post.getPost_r1());
            ps.setInt(4, post.getPost_r2());
            ps.setInt(5, post.getPost_r3());
            ps.setTimestamp(6, post.getPost_date());
            
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
    
    public ArrayList<Post> getAllPostsByCollab(String collab_id) {
    
        ArrayList<Post> all_post = new ArrayList<>();
        
        PreparedStatement ps1;
        PreparedStatement ps2;
    
        try
        {
            String sql1 = "SELECT post_id FROM coposts WHERE collab_id = ?";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, collab_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                String p_id = rs1.getString(1);
                
                String sql2 = "SELECT * FROM posts WHERE post_id = ? ORDER BY post_date";
                
                ps2 = getConnection().prepareStatement(sql2);
                
                ps2.setString(1, p_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                while (rs2.next())
                {
                    String post_id = rs2.getString(1);
                    String post_text = rs2.getString(2);
                    int post_r1 = rs2.getInt(3);
                    int post_r2 = rs2.getInt(4);
                    int post_r3 = rs2.getInt(5);
                    Timestamp post_date = rs2.getTimestamp(6);
                    
                    Post post = new Post(post_id, post_text, post_r1, post_r2, post_r3, post_date);
                    
                    all_post.add(post);
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
        
        return all_post;

    }
    
    public boolean isAnyPostByCollab(String collab_id) {
    
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql1 = "SELECT post_id FROM coposts WHERE collab_id = ?";
            
            ps = getConnection().prepareStatement(sql1);
            
            ps.setString(1, collab_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
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
