package com.memorand.model;

import com.memorand.beans.TaskCanva;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TaskCanvasModel extends Conexion
{
    public boolean createTaskCanva(TaskCanva taskcanva)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO taskcanvas (task_id, canva_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, taskcanva.getTask_id());
            ps.setString(2, taskcanva.getCanva_id());
            
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
