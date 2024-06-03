package com.memorand.model;

import com.memorand.beans.Collab;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CollabsModel extends Conexion
{
    public boolean createCollab(Collab c)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO collabs (collab_id, collab_status, team_id, proj_id) VALUES (?,?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, c.getCollab_id());
            ps.setString(2, c.getCollab_status());
            ps.setString(3, c.getTeam_id());
            ps.setString(4, c.getProj_id());
            
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
    
    public boolean deleteCollab(String c_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM collabs WHERE collab_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, c_id);
            
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
    
    public Collab getCollabByTeamAndProject(String team_id, String proj_id)
    {
        Collab collab = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM collabs WHERE team_id = ? AND proj_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, team_id);
            ps.setString(2, proj_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) 
            {
                String collab_id = rs.getString(1);
                String collab_status = rs.getString(2);
                String c_team_id = rs.getString(3);
                String c_proj_id = rs.getString(4);
                
                collab = new Collab(collab_id, collab_status, c_team_id, c_proj_id);
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
        
        return collab;
    }
    
    public Collab getCollabByTeam(String team_id)
    {
        Collab collab = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM collabs WHERE team_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, team_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) 
            {
                String collab_id = rs.getString(1);
                String collab_status = rs.getString(2);
                String c_team_id = rs.getString(3);
                String c_proj_id = rs.getString(4);
                
                collab = new Collab(collab_id, collab_status, c_team_id, c_proj_id);
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
        
        return collab;
    }
    
    public Collab getCollab (String c_id)
    {
        Collab collab = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM collabs WHERE collab_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, c_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) 
            {
                String collab_id = rs.getString(1);
                String collab_status = rs.getString(2);
                String team_id = rs.getString(3);
                String proj_id = rs.getString(4);
                
                collab = new Collab(collab_id, collab_status, team_id, proj_id);
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
        
        return collab;
    }
    
    public Collab getCollabByTask(String task_id)
    {
        Collab collab = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT c.* "
                       + "FROM collabs c "
                       + "JOIN cotasks ct ON c.collab_id = ct.collab_id "
                       + "WHERE ct.task_id = ? "
                       + "LIMIT 1";

            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, task_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) 
            {
                String collab_id = rs.getString(1);
                String collab_status = rs.getString(2);
                String team_id = rs.getString(3);
                String proj_id = rs.getString(4);
                
                collab = new Collab(collab_id, collab_status, team_id, proj_id);
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
        
        return collab;
    }
}