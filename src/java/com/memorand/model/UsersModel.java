package com.memorand.model;

import com.memorand.beans.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
    
    public User getUserInfoByLogin(User user) {
        
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
    
    public ArrayList<User> getAllAdminByInst(String inst_id) {
    
        ArrayList<User> all_admin = new ArrayList<>();
        
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        
        try
        {
            String sql1 = "SELECT user_id FROM inusers WHERE inst_id = ?";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, inst_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                String user_id = rs1.getString(1);
                
                String sql2 = "SELECT users.user_id, users.user_name, users.user_pat, users.user_mat, users.user_profile FROM users INNER JOIN inusers ON users.user_id = inusers.user_id WHERE users.user_id = ? ORDER BY users.user_pat";
                
                ps2 = getConnection().prepareStatement(sql2);
                
                ps2.setString(1, user_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                while (rs2.next())
                {
                    String admin_id = rs2.getString(1);
                    String admin_name = rs2.getString(2);
                    String admin_pat = rs2.getString(3);
                    String admin_mat = rs2.getString(4);
                    String admin_profile = rs2.getString(5);
                    
                    User admin = new User(admin_id, admin_name, admin_pat, admin_mat, admin_profile);
                    
                    all_admin.add(admin);
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
        
        return all_admin;
    
    }
    
    public ArrayList<User> getAllAdmin() {
    
        ArrayList<User> all_admin = new ArrayList<>();
        
        Statement st = null;
        
        try
        {
            String sql = "SELECT * FROM users WHERE user_type = \"admin\" ORDER BY user_pat ";
            
            st = getConnection().createStatement();
            
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next())
            {
                String admin_id = rs.getString(1);
                String admin_email = rs.getString(2);
                String admin_pass = rs.getString(3);
                String admin_type = rs.getString(4);
                String admin_name = rs.getString(5);
                String admin_pat = rs.getString(6);
                String admin_mat = rs.getString(7);
                String admin_status = rs.getString(8);
                String admin_profile = rs.getString(9);
                
                User new_admin = new User(admin_id, admin_email, admin_pass, admin_type, admin_name, admin_pat, admin_mat, admin_status, admin_profile);
                
                all_admin.add(new_admin);
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
        
        return all_admin;
    }
    
    public User getUserInfoById(String u_id) {
        
        User user_info = null;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "SELECT * FROM users WHERE user_id = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, u_id);
            
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