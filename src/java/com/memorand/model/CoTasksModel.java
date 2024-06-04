package com.memorand.model;

import com.memorand.beans.CoTask;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CoTasksModel extends Conexion
{
    public boolean createCoTask(CoTask ct)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO cotasks (collab_id, task_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, ct.getCollab_id());
            ps.setString(2, ct.getTask_id());
            
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
    
    public boolean deleteCoTask(String collab_id, String task_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM cotasks WHERE collab_id = ? AND user_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, collab_id);
            ps.setString(2, task_id);
            
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
