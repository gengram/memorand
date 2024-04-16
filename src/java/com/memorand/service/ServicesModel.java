package com.memorand.service;

import com.memorand.model.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ServicesModel extends Conexion
{
    public String getServiceStatus(String service_id, boolean close_connection) 
    {
        String system_status = "no";
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT service_status FROM services WHERE service_id = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, service_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
                system_status = rs.getString(1);
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }
        
        finally
        {
            if (close_connection)
            {
                if (getConnection() != null)
                {
                    try
                    { getConnection().close(); }
                    catch (SQLException ex)
                    { System.err.println(ex.getMessage()); }
                }
            }
        }
        
        return system_status;
    }
    
    public boolean updateServiceStatus(String service_id, String service_status)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE services SET service_status = ? WHERE service_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, service_status);
            ps.setString(2, service_id);
            
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