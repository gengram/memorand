package com.memorand.model;

import com.memorand.beans.Collab;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CollabsModel extends Conexion {
    
    public boolean createCollab(Collab collab) {
    
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO collabs (collab_id, collab_status, team_id, proj_id) VALUES (?,?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, collab.getCollab_id());
            ps.setString(2, collab.getCollab_status());
            ps.setString(3, collab.getTeam_id());
            ps.setString(4, collab.getProj_id());
            
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
    
    public boolean deleteCollab(String c_id) {
    
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM collabs WHERE collab_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, c_id);
            
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
    
    public Collab getCollabInfoByTeamAndProject(String t_id, String p_id) {
    
        Collab collab_info = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM collabs WHERE team_id = ? AND proj_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, t_id);
            ps.setString(2, p_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) 
            {
                String collab_id = rs.getString(1);
                String collab_status = rs.getString(2);
                String team_id = rs.getString(3);
                String proj_id = rs.getString(4);
                
                collab_info = new Collab(collab_id, collab_status, team_id, proj_id);
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
        
        return collab_info;
    
    }
    
    public Collab getCollabInfoByTeam(String t_id) {
    
        Collab collab_info = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM collabs WHERE team_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, t_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) 
            {
                String collab_id = rs.getString(1);
                String collab_status = rs.getString(2);
                String team_id = rs.getString(3);
                String proj_id = rs.getString(4);
                
                collab_info = new Collab(collab_id, collab_status, team_id, proj_id);
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
        
        return collab_info;
    
    }
    
    public Collab getCollabInfoById (String c_id)
    {
        Collab collab_info = null;
        
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
                
                collab_info = new Collab(collab_id, collab_status, team_id, proj_id);
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
        
        return collab_info;
    }
}