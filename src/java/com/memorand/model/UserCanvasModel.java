package com.memorand.model;

import com.memorand.beans.UserCanva;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserCanvasModel extends Conexion
{
    public boolean createUserCanva(UserCanva usercanva)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO usercanvas (user_id, idea_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, usercanva.getUser_id());
            ps.setString(2, usercanva.getCanva_id());
            
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
