package com.memorand.model;

import com.memorand.beans.UserPost;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserPostsModel extends Conexion {
    
    public boolean createUserPost(UserPost userpost) {
    
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO userposts (user_id, post_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, userpost.getUser_id());
            ps.setString(2, userpost.getPost_id());
            
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
