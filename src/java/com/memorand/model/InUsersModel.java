package com.memorand.model;

import com.memorand.beans.InUser;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InUsersModel extends Conexion {
    
    public boolean createInUsers(InUser inusers) {
    
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO inusers (inst_id, user_id) VALUES (?,?)";

            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inusers.getInst_id());
            ps.setString(2, inusers.getUser_id());
            
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