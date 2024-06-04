package com.memorand.model;

import com.memorand.beans.Task;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class TasksModel extends Conexion
{
    public boolean createTask(Task t)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO tasks (task_id, task_name, task_info, task_sdate, task_edate, task_status, task_prior, task_diff) VALUES (?,?,?,?,?,?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, t.getTask_id());
            ps.setString(2, t.getTask_name());
            ps.setString(3, t.getTask_info());
            ps.setTimestamp(4, t.getTask_sdate());
            ps.setTimestamp(5, t.getTask_edate());
            ps.setString(6, t.getTask_status());
            ps.setString(7, t.getTask_prior());
            ps.setString(8, t.getTask_diff());
            
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
    
    public Task getTask(String t_id)
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
    
    public Task getTaskByTool(String tool_table, String tool_name, String tool_id)
    {
        Task task = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT t.task_id, t.task_name, t.task_info, t.task_sdate, t.task_edate, t.task_status, t.task_prior, t.task_diff " +
                         "FROM tasks t " +
                         "INNER JOIN task"+ tool_table +" c ON t.task_id = c.task_id " +
                         "WHERE c."+ tool_name +" = ? ";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, tool_id);
            
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
    
    public ArrayList<Task> getTasksByCollab(String collab_id, String order)
    {
        ArrayList<Task> all_tasks = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT t.task_id, t.task_name, t.task_info, t.task_sdate, t.task_edate, t.task_status, t.task_prior, t.task_diff " +
                         "FROM tasks t " +
                         "INNER JOIN cotasks c ON t.task_id = c.task_id " +
                         "WHERE c.collab_id = ? " +
                         "ORDER BY t."+order;
            
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
                
                all_tasks.add(task);
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
        
        return all_tasks;
    }
    
    public int getTaskResource(String t_id, String resource)
    {
        int count = 0;
        
        PreparedStatement ps;
        
        try
        {
            String sql;
            
            switch (resource)
            {
                case "ideas":
                    sql = "SELECT COUNT(*) AS count FROM taskideas WHERE task_id = ?";
                    break;
                case "notes":
                    sql = "SELECT COUNT(*) AS count FROM tasknotes WHERE task_id = ?";
                    break;
                case "canvas":
                    sql = "SELECT COUNT(*) AS count FROM taskcanvas WHERE task_id = ?";
                    break;
                default:
                    return count;
            }
            
            ps = getConnection().prepareStatement(sql);
            ps.setString(1, t_id);

            ResultSet rs = ps.executeQuery();

            if (rs.next())
                count = rs.getInt("count");
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }

        return count;
    }
    
    public boolean deleteTask(String t_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM tasks WHERE task_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, t_id);
            
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
    
    public boolean updateTaskStatus(String t_id, String t_status)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE tasks SET task_status = ? WHERE task_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, t_status);
            ps.setString(2, t_id);
            
            if (ps.executeUpdate() == 1)
                flag = true;
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }
        
        return flag;
    }
}