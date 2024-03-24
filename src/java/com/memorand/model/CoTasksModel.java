package com.memorand.model;

import com.memorand.beans.CoTask;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CoTasksModel extends Conexion
{
    public boolean createCoTask(CoTask cotask)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO cotasks (collab_id, task_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, cotask.getCollab_id());
            ps.setString(2, cotask.getTask_id());
            
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
