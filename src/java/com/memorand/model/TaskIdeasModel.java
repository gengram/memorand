package com.memorand.model;

import com.memorand.beans.TaskIdea;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TaskIdeasModel extends Conexion
{
    public boolean createTaskIdea(TaskIdea taskidea)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO taskideas (task_id, idea_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, taskidea.getTask_id());
            ps.setString(2, taskidea.getIdea_id());
            
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
    
    public boolean deleteTaskIdea(String task_id, String idea_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM taskideas WHERE task_id = ? AND idea_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, task_id);
            ps.setString(2, idea_id);
            
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
