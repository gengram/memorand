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
        
        PreparedStatement ps;
    
        try
        {
            String sql = "SELECT p.post_id, p.post_text, p.post_r1, p.post_r2, p.post_r3, p.post_date "
                    + "FROM posts p "
                    + "INNER JOIN coposts c ON p.post_id = c.post_id "
                    + "WHERE c.collab_id = ? "
                    + "ORDER BY p.post_date DESC";

            ps = getConnection().prepareStatement(sql);
            ps.setString(1, collab_id);

            ResultSet rs = ps.executeQuery();

            while (rs.next())
            {
                String post_id = rs.getString("post_id");
                String post_text = rs.getString("post_text");
                int post_r1 = rs.getInt("post_r1");
                int post_r2 = rs.getInt("post_r2");
                int post_r3 = rs.getInt("post_r3");
                Timestamp post_date = rs.getTimestamp("post_date");

                Post post = new Post(post_id, post_text, post_r1, post_r2, post_r3, post_date);

                all_post.add(post);
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
