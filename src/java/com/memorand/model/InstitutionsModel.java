package com.memorand.model;

import com.memorand.beans.Institution;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class InstitutionsModel extends Conexion {

    public boolean createInst(Institution inst) {
        
        boolean flag = false;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "INSERT INTO institutions (inst_id, inst_name, inst_type, inst_profile, lim_ch, lim_wk, lim_gp, lim_ks) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inst.getInst_id());
            ps.setString(2, inst.getInst_name());
            ps.setString(3, inst.getInst_type());
            ps.setString(4, inst.getInst_profile());
            ps.setString(5, inst.getLim_ch());
            ps.setString(6, inst.getLim_wk());
            ps.setString(7, inst.getLim_gp());
            ps.setString(8, inst.getLim_ks());
            
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
    
    public ArrayList<Institution> getAllInst() {
        
        ArrayList<Institution> all_inst = new ArrayList<>();
        
        Statement st = null;
        
        try
        {
            String sql = "SELECT * FROM institutions ORDER BY inst_name";
            
            st = getConnection().createStatement();
            
            ResultSet rs = st.executeQuery(sql);
            
            while (rs.next())
            {
                String inst_id = rs.getString(1);
                String inst_name = rs.getString(2);
                String inst_type = rs.getString(3);
                String inst_profile = rs.getString(4);
                String lim_ch = rs.getString(5);
                String lim_wk = rs.getString(6);
                String lim_gp = rs.getString(7);
                String lim_ks = rs.getString(8);
                
                Institution new_inst = new Institution(inst_id, inst_name, inst_type, inst_profile, lim_ch, lim_wk, lim_gp, lim_ks);
                
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
    
    public Institution getInstInfoById(String i_id) {
    
        Institution inst_info = null;
        
        PreparedStatement ps = null;
        
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
                String lim_ch = rs.getString(5);
                String lim_wk = rs.getString(6);
                String lim_gp = rs.getString(7);
                String lim_ks = rs.getString(8);
                
                inst_info = new Institution(inst_id, inst_name, inst_type, inst_profile, lim_ch, lim_wk, lim_gp, lim_ks);
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
        
        return inst_info;
    }

}