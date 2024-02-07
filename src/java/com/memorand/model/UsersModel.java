package com.memorand.model;

import com.memorand.beans.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersModel extends Conexion {
    
    public boolean createUser(User user) {
        
        boolean flag = false;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "INSERT INTO users (user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user.getUser_id());
            ps.setString(2, user.getUser_email());
            ps.setString(3, user.getUser_pass());
            ps.setString(4, user.getUser_type());
            ps.setString(5, user.getUser_name());
            ps.setString(6, user.getUser_pat());
            ps.setString(7, user.getUser_mat());
            ps.setString(8, user.getUser_status());
            ps.setString(9, user.getUser_profile());
            
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
    
    public boolean loginUser(User user) {
    
        boolean flag = false;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "SELECT user_email, user_pass FROM users WHERE user_email = ? AND user_pass = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user.getUser_email());
            ps.setString(2, user.getUser_pass());
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String email = rs.getString(1);
                String pass = rs.getString(2);

                if (email.equals(user.getUser_email()) && pass.equals(user.getUser_pass()))
                {
                    flag = true;
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
        
        return flag;
    
    }
    
    public User getUserInfo(User user) {
        
        User user_info = null;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "SELECT * FROM users WHERE user_email = ? AND user_pass = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user.getUser_email());
            ps.setString(2, user.getUser_pass());
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String user_id = rs.getString(1);
                String user_email = rs.getString(2);
                String user_pass = rs.getString(3);
                String user_type = rs.getString(4);
                String user_name = rs.getString(5);
                String user_pat = rs.getString(6);
                String user_mat = rs.getString(7);
                String user_status = rs.getString(8);
                String user_profile = rs.getString(9);
                
                user_info = new User(user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile);
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
    
        return user_info;
    }
    
}