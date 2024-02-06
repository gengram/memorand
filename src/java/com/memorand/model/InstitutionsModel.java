package com.memorand.model;

import com.memorand.beans.Institution;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InstitutionsModel extends Conexion {

    public boolean CreateInst(Institution inst) {
        
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
        
        return true;
    }

}