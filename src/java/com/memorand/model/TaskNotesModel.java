package com.memorand.model;

import com.memorand.beans.TaskNote;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TaskNotesModel extends Conexion
{
    public boolean createTaskNote(TaskNote tasknote)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO tasknotes (task_id, note_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, tasknote.getTask_id());
            ps.setString(2, tasknote.getNote_id());
            
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
    
    public boolean deleteTaskNote(String task_id, String note_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM tasknotes WHERE task_id = ? AND note_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, task_id);
            ps.setString(2, note_id);
            
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
