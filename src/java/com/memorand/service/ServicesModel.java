package com.memorand.service;

import com.memorand.model.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ServicesModel extends Conexion
{
    public String getServiceStatus(String s_id, boolean close_connection) 
    {
        String system_status = "no";
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT service_status FROM services WHERE service_id = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, s_id);
            
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
    
    public boolean changeServiceStatus(String s)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE services SET service_status = ? WHERE service_id = '9cd15faf-0fa5-482c-a7dd-d07790797528'";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, s);
            
            if (ps.executeUpdate(sql) == 1) 
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