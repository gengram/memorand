package com.memorand.model;

import com.memorand.beans.InUsers;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InUsersModel extends Conexion {
    
    public boolean createInUsers(InUsers inusers) {
    
        boolean flag = false;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "INSERT INTO inusers (inuser_id, inst_id, user_id) VALUES (?,?,?)";

            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inusers.getInuser_id());
            ps.setString(2, inusers.getInst_id());
            ps.setString(3, inusers.getUser_id());
            
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
