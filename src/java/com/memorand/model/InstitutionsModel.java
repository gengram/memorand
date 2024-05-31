package com.memorand.model;

import com.memorand.beans.Institution;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InstitutionsModel extends Conexion
{
    public boolean createInstitution(Institution i)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO institutions (inst_id, inst_name, inst_type, inst_profile, inst_status, lim_ch, lim_wk, lim_gp, lim_ks) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, i.getInst_id());
            ps.setString(2, i.getInst_name());
            ps.setString(3, i.getInst_type());
            ps.setString(4, i.getInst_profile());
            ps.setString(5, i.getInst_status());
            ps.setString(6, i.getLim_ch());
            ps.setString(7, i.getLim_wk());
            ps.setString(8, i.getLim_gp());
            ps.setString(9, i.getLim_ks());
            
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
    
    public ArrayList<Institution> getInstitutions(String i_status)
    {
        ArrayList<Institution> all_inst = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM institutions WHERE inst_status = ? ORDER BY inst_name";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, i_status);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String inst_id = rs.getString(1);
                String inst_name = rs.getString(2);
                String inst_type = rs.getString(3);
                String inst_profile = rs.getString(4);
                String inst_status = rs.getString(5);
                String lim_ch = rs.getString(6);
                String lim_wk = rs.getString(7);
                String lim_gp = rs.getString(8);
                String lim_ks = rs.getString(9);
                
                Institution new_inst = new Institution(inst_id, inst_name, inst_type, inst_profile, inst_status, lim_ch, lim_wk, lim_gp, lim_ks);
                all_inst.add(new_inst);
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
        
        return all_inst;
    }
    
    public Institution getInstitution(String i_id)
    {
        Institution inst = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM institutions WHERE inst_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, i_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String inst_id = rs.getString(1);
                String inst_name = rs.getString(2);
                String inst_type = rs.getString(3);
                String inst_profile = rs.getString(4);
                String inst_status = rs.getString(5);
                String lim_ch = rs.getString(6);
                String lim_wk = rs.getString(7);
                String lim_gp = rs.getString(8);
                String lim_ks = rs.getString(9);
                
                inst = new Institution(inst_id, inst_name, inst_type, inst_profile, inst_status, lim_ch, lim_wk, lim_gp, lim_ks);
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
        
        return inst;
    }
    
    public Institution getInstitutionByUser(String u_id)
    {
        Institution inst = null;
        
        PreparedStatement ps1;
        
        try
        {
            String sql1 = "SELECT inst_id FROM inusers WHERE user_id = ? LIMIT 1";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, u_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            if (rs1.next())
            {
                String i_id = rs1.getString(1);
                
                inst = getInstitution(i_id);
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
        
        return inst;
    }

    public int getInstitutionResource(String i_id, String resource)
    {
        int count = 0;
        
        PreparedStatement ps;

        try
        {
            String sql;
            
            switch (resource)
            {
                case "ch":
                case "wk":
                    sql = "SELECT COUNT(*) AS count FROM inusers iu INNER JOIN users u ON iu.user_id = u.user_id WHERE iu.inst_id = ? AND u.user_type = ?";
                    break;
                case "teams":
                    sql = "SELECT COUNT(*) AS count FROM inteams WHERE inst_id = ?";
                    break;
                case "projects":
                    sql = "SELECT COUNT(*) AS count FROM inprojects WHERE inst_id = ?";
                    break;
                default:
                    return count;
            }

            ps = getConnection().prepareStatement(sql);
            ps.setString(1, i_id);

            if (resource.equals("ch") || resource.equals("wk"))
                ps.setString(2, resource);

            ResultSet rs = ps.executeQuery();

            if (rs.next())
                count = rs.getInt("count");
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }

        return count;
    }
    
    public boolean updateInstitution(Institution i)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE institutions SET inst_name = ?, inst_profile = ?, lim_ch = ?, lim_wk = ?, lim_gp = ?, lim_ks = ? WHERE inst_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, i.getInst_name());
            ps.setString(2, i.getInst_profile());
            ps.setString(3, i.getLim_ch());
            ps.setString(4, i.getLim_wk());
            ps.setString(5, i.getLim_gp());
            ps.setString(6, i.getLim_ks());
            ps.setString(7, i.getInst_id());
            
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
    
    public boolean updateInstitutionStatus(String i_id, String i_status)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE institutions SET inst_status = ? WHERE inst_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, i_status);
            ps.setString(2, i_id);
            
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