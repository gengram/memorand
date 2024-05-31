package com.memorand.model;

import com.memorand.beans.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UsersModel extends Conexion
{
    public boolean createUser(User user)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
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
    
    public boolean loginUser(User user)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
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
    
    public boolean validateUserEmail(String u_email)
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
    
    public User getUserInfoByLogin(User user)
    {
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
    
    // DEPRECIADO
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
                
                String sql2 = "SELECT user_id, user_name, user_pat, user_mat, user_profile FROM users WHERE user_id = ? AND user_type = \"admin\" ORDER BY users.user_pat";
                
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
    
    public ArrayList<User> getAdmins(String inst_id, String a_status)
    {
        ArrayList<User> all_admin = new ArrayList<>();
        
        PreparedStatement ps;
        ResultSet rs;

        try
        {
            String sql = "SELECT u.user_id, u.user_email, u.user_name, u.user_pat, u.user_mat, u.user_status, u.user_profile "
                    + "FROM inusers i "
                    + "INNER JOIN users u ON i.user_id = u.user_id "
                    + "WHERE i.inst_id = ? AND u.user_type = 'admin' AND u.user_status = ? "
                    + "ORDER BY u.user_pat";

            ps = getConnection().prepareStatement(sql);
            ps.setString(1, inst_id);
            ps.setString(2, a_status);

            rs = ps.executeQuery();

            while (rs.next())
            {
                String admin_id = rs.getString(1);
                String admin_email = rs.getString(2);
                String admin_name = rs.getString(3);
                String admin_pat = rs.getString(4);
                String admin_mat = rs.getString(5);
                String admin_status = rs.getString(6);
                String admin_profile = rs.getString(7);

                User admin = new User(admin_id, admin_email, "", "", admin_name, admin_pat, admin_mat, admin_status, admin_profile);
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
    
    public ArrayList<User> getAllAdmin()
    {
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
    
    public ArrayList<User> getAllChByInst(String inst_id, boolean all)
    {
        ArrayList<User> all_ch = new ArrayList<>();
        
        PreparedStatement ps;
        
        String sql_limit = "";
        
        if (all == false)
        {
            sql_limit = "LIMIT 5";
        }
        
        try
        {
            String sql = "SELECT u.user_id, u.user_email, u.user_pass, u.user_type, u.user_name, u.user_pat, u.user_mat, u.user_status, u.user_profile "
                       + "FROM users u "
                       + "JOIN inusers iu ON u.user_id = iu.user_id "
                       + "WHERE iu.inst_id = ? AND u.user_type = 'ch' "
                       + "ORDER BY u.user_pat " + sql_limit;
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inst_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String ch_id = rs.getString(1);
                String ch_email = rs.getString(2);
                String ch_pass = rs.getString(3);
                String ch_type = rs.getString(4);
                String ch_name = rs.getString(5);
                String ch_pat = rs.getString(6);
                String ch_mat = rs.getString(7);
                String ch_status = rs.getString(8);
                String ch_profile = rs.getString(9);

                User admin = new User(ch_id, ch_email, ch_pass, ch_type, ch_name, ch_pat, ch_mat, ch_status, ch_profile);

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
    
    public ArrayList<User> getAllChByCollab(String team_id, String proj_id) {
    
        ArrayList<User> all_ch = new ArrayList<>();
        
        PreparedStatement ps1;
        PreparedStatement ps2;
        PreparedStatement ps3;
        
        try
        {
            String sql1 = "SELECT collab_id FROM collabs WHERE team_id = ? AND proj_id = ?";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, team_id);
            ps1.setString(2, proj_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                String collab_id = rs1.getString(1);
                
                String sql2 = "SELECT user_id FROM collabusers WHERE collab_id = ?";
                
                ps2 = getConnection().prepareStatement(sql2);
                
                ps2.setString(1, collab_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                while (rs2.next())
                {
                    String user_id = rs2.getString(1);

                    String sql3 = "SELECT * FROM users WHERE user_id = ? AND user_type = \"ch\" ORDER BY user_pat";

                    ps3 = getConnection().prepareStatement(sql3);

                    ps3.setString(1, user_id);

                    ResultSet rs3 = ps3.executeQuery();

                    while (rs3.next())
                    {
                        String ch_id = rs3.getString(1);
                        String ch_email = rs3.getString(2);
                        String ch_pass = rs3.getString(3);
                        String ch_type = rs3.getString(4);
                        String ch_name = rs3.getString(5);
                        String ch_pat = rs3.getString(6);
                        String ch_mat = rs3.getString(7);
                        String ch_status = rs3.getString(8);
                        String ch_profile = rs3.getString(9);

                        User ch = new User(ch_id, ch_email, ch_pass, ch_type, ch_name, ch_pat, ch_mat, ch_status, ch_profile);

                        all_ch.add(ch);
                    }
                }
            }
        
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }
        
        return all_ch;
    
    }
    
    public ArrayList<User> getAllWkByTeam(String team_id)
    {
        ArrayList<User> all_wk = new ArrayList<>();
        
        PreparedStatement ps1;
        PreparedStatement ps2;
        
        try
        {
            String sql1 = "SELECT user_id FROM teamusers WHERE team_id = ?";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, team_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                String user_id = rs1.getString(1);
                
                String sql2 = "SELECT * FROM users WHERE user_id = ? AND user_type = \"wk\" ORDER BY user_pat";
                
                ps2 = getConnection().prepareStatement(sql2);
                
                ps2.setString(1, user_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                while (rs2.next())
                {
                    String wk_id = rs2.getString(1);
                    String wk_email = rs2.getString(2);
                    String wk_pass = rs2.getString(3);
                    String wk_type = rs2.getString(4);
                    String wk_name = rs2.getString(5);
                    String wk_pat = rs2.getString(6);
                    String wk_mat = rs2.getString(7);
                    String wk_status = rs2.getString(8);
                    String wk_profile = rs2.getString(9);
                    
                    User wk = new User(wk_id, wk_email, wk_pass, wk_type, wk_name, wk_pat, wk_mat, wk_status, wk_profile);
                    
                    all_wk.add(wk);
                }
            }
        
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }

        return all_wk;
    
    }
    
    public ArrayList<User> getAllWkByInst(String inst_id, boolean all)
    {
        ArrayList<User> all_wk = new ArrayList<>();
        
        PreparedStatement ps;
        
        String sql_limit = "";
        
        if (all == false)
        {
            sql_limit = "LIMIT 5";
        }
        
        try
        {
            String sql = "SELECT u.user_id, u.user_email, u.user_pass, u.user_type, u.user_name, u.user_pat, u.user_mat, u.user_status, u.user_profile "
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
                String wk_pass = rs.getString(3);
                String wk_type = rs.getString(4);
                String wk_name = rs.getString(5);
                String wk_pat = rs.getString(6);
                String wk_mat = rs.getString(7);
                String wk_status = rs.getString(8);
                String wk_profile = rs.getString(9);

                User admin = new User(wk_id, wk_email, wk_pass, wk_type, wk_name, wk_pat, wk_mat, wk_status, wk_profile);

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
    
    public User getUserInfoById(String u_id) {
        
        User user_info = null;
        
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
    
    public User getUserInfoByPost(String post_id)
    {
        User user_info = null;
        
        PreparedStatement ps1;
        PreparedStatement ps2;
        
        try
        {
            String sql1 = "SELECT user_id FROM userposts WHERE post_id = ? LIMIT 1";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, post_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            if (rs1.next())
            {
                String u_id = rs1.getString(1);
                
                String sql2 = "SELECT * FROM users WHERE user_id = ?";
                
                ps2 = getConnection().prepareStatement(sql2);
                
                ps2.setString(1, u_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                if (rs2.next())
                {
                    String user_id = rs2.getString(1);
                    String user_email = rs2.getString(2);
                    String user_pass = rs2.getString(3);
                    String user_type = rs2.getString(4);
                    String user_name = rs2.getString(5);
                    String user_pat = rs2.getString(6);
                    String user_mat = rs2.getString(7);
                    String user_status = rs2.getString(8);
                    String user_profile = rs2.getString(9);

                    user_info = new User(user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile);
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
    
        return user_info;
    
    }
    
    public User getUserInfoByIdea(String idea_id) {
    
        User user_info = null;
        
        PreparedStatement ps1;
        PreparedStatement ps2;
        
        try
        {
            String sql1 = "SELECT user_id FROM userideas WHERE idea_id = ? LIMIT 1";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, idea_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            if (rs1.next())
            {
                String u_id = rs1.getString(1);
                
                String sql2 = "SELECT * FROM users WHERE user_id = ?";
                
                ps2 = getConnection().prepareStatement(sql2);
                
                ps2.setString(1, u_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                if (rs2.next())
                {
                    String user_id = rs2.getString(1);
                    String user_email = rs2.getString(2);
                    String user_pass = rs2.getString(3);
                    String user_type = rs2.getString(4);
                    String user_name = rs2.getString(5);
                    String user_pat = rs2.getString(6);
                    String user_mat = rs2.getString(7);
                    String user_status = rs2.getString(8);
                    String user_profile = rs2.getString(9);

                    user_info = new User(user_id, user_email, user_pass, user_type, user_name, user_pat, user_mat, user_status, user_profile);
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
    
        return user_info;
    
    }
    
    public boolean updateUserStatus(String user_id, String user_status)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE users SET user_status = ? WHERE user_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user_status);
            ps.setString(2, user_id);
            
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
    
    public boolean updateUser(User user)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE users SET user_name = ?, user_pat = ?, user_mat = ?, user_profile = ? WHERE user_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user.getUser_name());
            ps.setString(2, user.getUser_pat());
            ps.setString(3, user.getUser_mat());
            ps.setString(4, user.getUser_profile());
            ps.setString(5, user.getUser_id());
            
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