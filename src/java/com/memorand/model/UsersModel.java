package com.memorand.model;

import com.memorand.beans.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsersModel extends Conexion
{
    public boolean createUser(User u)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO users (user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, u.getUser_id());
            ps.setString(2, u.getUser_email());
            ps.setString(3, u.getUser_pass());
            ps.setString(4, u.getUser_type());
            ps.setString(5, u.getUser_name());
            ps.setString(6, u.getUser_pat());
            ps.setString(7, u.getUser_mat());
            ps.setString(8, u.getUser_status());
            ps.setString(9, u.getUser_profile());
            
            if (ps.executeUpdate() == 1)
                flag = true;
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
    
    public User getUser(String u_id)
    {
        User user = null;
        
        PreparedStatement ps;
        
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
                
                user = new User(user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile);
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
    
        return user;
    }
    
    public User getUserByLogin(User u)
    {
        User user = null;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "SELECT * FROM users WHERE user_email = ? AND user_pass = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, u.getUser_email());
            ps.setString(2, u.getUser_pass());
            
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
                
                user = new User(user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile);
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
    
        return user;
    }
    
    public ArrayList<User> getUserAdminsByInst(String inst_id, String status)
    {
        ArrayList<User> all_admin = new ArrayList<>();
        
        PreparedStatement ps;

        try
        {
            String sql = "SELECT u.user_id, u.user_email, u.user_name, u.user_pat, u.user_mat, u.user_status, u.user_profile "
                    + "FROM inusers i "
                    + "INNER JOIN users u ON i.user_id = u.user_id "
                    + "WHERE i.inst_id = ? AND u.user_type = 'admin' AND u.user_status = ? "
                    + "ORDER BY u.user_pat";

            ps = getConnection().prepareStatement(sql);
            ps.setString(1, inst_id);
            ps.setString(2, status);

            ResultSet rs = ps.executeQuery();

            while (rs.next())
            {
                String admin_id = rs.getString(1);
                String admin_email = rs.getString(2);
                String admin_name = rs.getString(3);
                String admin_pat = rs.getString(4);
                String admin_mat = rs.getString(5);
                String admin_status = rs.getString(6);
                String admin_profile = rs.getString(7);

                User admin = new User(admin_id, admin_email, admin_name, admin_pat, admin_mat, admin_status, admin_profile);
                all_admin.add(admin);
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
    
    public ArrayList<User> getUserChiefsByInst(String inst_id, boolean all)
    {
        ArrayList<User> all_ch = new ArrayList<>();
        
        PreparedStatement ps;
        
        String sql_limit = "";
        
        if (all == false)
            sql_limit = "LIMIT 5";
        
        try
        {
            String sql = "SELECT u.user_id, u.user_email, u.user_name, u.user_pat, u.user_mat, u.user_status, u.user_profile "
                       + "FROM users u "
                       + "JOIN inusers iu ON u.user_id = iu.user_id "
                       + "WHERE iu.inst_id = ? AND u.user_type = 'ch' "
                       + "ORDER BY u.user_pat " + sql_limit;
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inst_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String wk_id = rs.getString(1);
                String wk_email = rs.getString(2);
                String wk_name = rs.getString(3);
                String wk_pat = rs.getString(4);
                String wk_mat = rs.getString(5);
                String wk_status = rs.getString(6);
                String wk_profile = rs.getString(7);

                User admin = new User(wk_id, wk_email, wk_name, wk_pat, wk_mat, wk_status, wk_profile);

                all_ch.add(admin);
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
        
        return all_ch;
    }
    
    public ArrayList<User> getUserWorkersByInst(String inst_id, boolean all)
    {
        ArrayList<User> all_wk = new ArrayList<>();
        
        PreparedStatement ps;
        
        String sql_limit = "";
        
        if (all == false)
            sql_limit = "LIMIT 5";
        
        try
        {
            String sql = "SELECT u.user_id, u.user_email, u.user_name, u.user_pat, u.user_mat, u.user_status, u.user_profile "
                       + "FROM users u "
                       + "JOIN inusers iu ON u.user_id = iu.user_id "
                       + "WHERE iu.inst_id = ? AND u.user_type = 'wk' "
                       + "ORDER BY u.user_pat " + sql_limit;
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inst_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String wk_id = rs.getString(1);
                String wk_email = rs.getString(2);
                String wk_name = rs.getString(3);
                String wk_pat = rs.getString(4);
                String wk_mat = rs.getString(5);
                String wk_status = rs.getString(6);
                String wk_profile = rs.getString(7);

                User admin = new User(wk_id, wk_email, wk_name, wk_pat, wk_mat, wk_status, wk_profile);

                all_wk.add(admin);
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
        
        return all_wk;
    }
    
    public ArrayList<User> getUserChiefsByCollab(String team_id, String proj_id)
    {
        ArrayList<User> all_ch = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT u.user_id, u.user_email, u.user_name, u.user_pat, u.user_mat, u.user_status, u.user_profile FROM users u "
                       + "JOIN collabusers cu ON u.user_id = cu.user_id "
                       + "JOIN collabs c ON cu.collab_id = c.collab_id "
                       + "WHERE c.team_id = ? AND c.proj_id = ? AND u.user_type = 'ch' "
                       + "ORDER BY u.user_pat";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, team_id);
            ps.setString(2, proj_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String ch_id = rs.getString(1);
                String ch_email = rs.getString(2);
                String ch_name = rs.getString(3);
                String ch_pat = rs.getString(4);
                String ch_mat = rs.getString(5);
                String ch_status = rs.getString(6);
                String ch_profile = rs.getString(7);

                User ch = new User(ch_id, ch_email, ch_name, ch_pat, ch_mat, ch_status, ch_profile);

                all_ch.add(ch);                    
            }
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }
        
        return all_ch;
    }
    
    public ArrayList<User> getUserWorkersByTeam(String team_id)
    {
        ArrayList<User> all_wk = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT u.user_id, u.user_email, u.user_name, u.user_pat, u.user_mat, u.user_status, u.user_profile FROM users u "
                       + "JOIN teamusers tu ON u.user_id = tu.user_id "
                       + "WHERE tu.team_id = ? AND u.user_type = 'wk' "
                       + "ORDER BY u.user_pat";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, team_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String wk_id = rs.getString(1);
                String wk_email = rs.getString(2);
                String wk_name = rs.getString(3);
                String wk_pat = rs.getString(4);
                String wk_mat = rs.getString(5);
                String wk_status = rs.getString(6);
                String wk_profile = rs.getString(7);

                User wk = new User(wk_id, wk_email, wk_name, wk_pat, wk_mat, wk_status, wk_profile);

                all_wk.add(wk);
            }
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }

        return all_wk;
    }
    
    public User getUserByPost(String post_id)
    {
        User user = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT u.user_id, u.user_name, u.user_pat, u.user_mat, u.user_profile "
                       + "FROM users u "
                       + "JOIN userposts up ON u.user_id = up.user_id "
                       + "WHERE up.post_id = ? "
                       + "LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, post_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String user_id = rs.getString(1);
                String user_name = rs.getString(2);
                String user_pat = rs.getString(3);
                String user_mat = rs.getString(4);
                String user_profile = rs.getString(5);

                user = new User(user_id, user_name, user_pat, user_mat, user_profile);
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
    
        return user;
    }
    
    public User getUserByIdea(String idea_id)
    {
        User user = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT u.user_id, u.user_name, u.user_pat, u.user_mat, u.user_profile "
                       + "FROM users u "
                       + "JOIN userideas ui ON u.user_id = ui.user_id "
                       + "WHERE ui.idea_id = ? "
                       + "LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, idea_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String user_id = rs.getString(1);
                String user_name = rs.getString(5);
                String user_pat = rs.getString(6);
                String user_mat = rs.getString(7);
                String user_profile = rs.getString(9);

                user = new User(user_id, user_name, user_pat, user_mat, user_profile);
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
    
        return user;
    }
    
    public boolean updateUserProfile(User u)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE users SET user_name = ?, user_pat = ?, user_mat = ?, user_profile = ? WHERE user_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getUser_pat());
            ps.setString(3, u.getUser_mat());
            ps.setString(4, u.getUser_profile());
            ps.setString(5, u.getUser_id());
            
            if (ps.executeUpdate() == 1)
                flag = true;
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
    
    public boolean updateUserStatus(String u_id, String u_status)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE users SET user_status = ? WHERE user_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, u_status);
            ps.setString(2, u_id);
            
            if (ps.executeUpdate() == 1)
                flag = true;
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
    
    public boolean updateUserPassword(String u_id, String u_pass)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE users SET user_pass = ? WHERE user_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, u_pass);
            ps.setString(2, u_id);
            
            if (ps.executeUpdate() == 1)
                flag = true;
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
    
    public boolean validateUserByLogin(User u)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT user_email, user_pass FROM users WHERE user_email = ? AND user_pass = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, u.getUser_email());
            ps.setString(2, u.getUser_pass());
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String email = rs.getString(1);
                String pass = rs.getString(2);

                if (email.equals(u.getUser_email()) && pass.equals(u.getUser_pass()))
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
    
    public boolean validateUserByEmail(String u_email)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT user_email FROM users WHERE user_email = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, u_email);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
                flag = true;
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
    
    public boolean deleteUser(String u_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM users WHERE user_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, u_id);
            
            if (ps.executeUpdate() == 1)
                flag = true;
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