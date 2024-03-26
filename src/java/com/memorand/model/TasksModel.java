package com.memorand.model;

import com.memorand.beans.Task;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class TasksModel extends Conexion
{
    public boolean createTask(Task task)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO tasks (task_id, task_name, task_info, task_sdate, task_edate, task_status, task_prior, task_diff) VALUES (?,?,?,?,?,?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, task.getTask_id());
            ps.setString(2, task.getTask_name());
            ps.setString(3, task.getTask_info());
            ps.setTimestamp(4, task.getTask_sdate());
            ps.setTimestamp(5, task.getTask_edate());
            ps.setString(6, task.getTask_status());
            ps.setString(7, task.getTask_prior());
            ps.setString(8, task.getTask_diff());
            
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
    
    public Task getTaskInfoById(String t_id)
    {
        Task task = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM tasks WHERE task_id = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, t_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String task_id = rs.getString(1);
                String task_name = rs.getString(2);
                String task_info = rs.getString(3);
                Timestamp task_sdate = rs.getTimestamp(4);
                Timestamp task_edate = rs.getTimestamp(5);
                String task_status = rs.getString(6);
                String task_prior = rs.getString(7);
                String task_diff = rs.getString(8);
                
                task = new Task(task_id, task_name, task_info, task_sdate, task_edate, task_status, task_prior, task_diff);
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
        
        return task;
    }
    
    public ArrayList<Task> getAllTasksByCollab(String collab_id, String arg)
    {
        ArrayList<Task> all_task = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT t.task_id, t.task_name, t.task_info, t.task_sdate, t.task_edate, t.task_status, t.task_prior, t.task_diff " +
                         "FROM tasks t " +
                         "INNER JOIN cotasks c ON t.task_id = c.task_id " +
                         "WHERE c.collab_id = ? " +
                         "ORDER BY t."+arg;
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, collab_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String task_id = rs.getString(1);
                String task_name = rs.getString(2);
                String task_info = rs.getString(3);
                Timestamp task_sdate = rs.getTimestamp(4);
                Timestamp task_edate = rs.getTimestamp(5);
                String task_status = rs.getString(6);
                String task_prior = rs.getString(7);
                String task_diff = rs.getString(8);
                
                Task task = new Task(task_id, task_name, task_info, task_sdate, task_edate, task_status, task_prior, task_diff);
                
                all_task.add(task);
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
        
        return all_task;
    }
    
    public boolean isAnyTaskByCollab(String collab_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql1 = "SELECT task_id FROM cotasks WHERE collab_id = ?";
            
            ps = getConnection().prepareStatement(sql1);
            
            ps.setString(1, collab_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
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