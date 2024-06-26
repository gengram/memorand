package com.memorand.model;

import com.memorand.beans.Idea;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class IdeasModel extends Conexion
{
    public boolean createIdea(Idea i)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO ideas (idea_id, idea_text, idea_date, idea_color) VALUES (?,?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, i.getIdea_id());
            ps.setString(2, i.getIdea_text());
            ps.setTimestamp(3, i.getIdea_date());
            ps.setString(4, i.getIdea_color());
            
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
    
    public Idea getIdea(String i_id)
    {
        Idea idea = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM ideas WHERE idea_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, i_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String idea_id = rs.getString(1);
                String idea_text = rs.getString(2);
                Timestamp idea_date = rs.getTimestamp(3);
                String idea_color = rs.getString(4);
                
                idea = new Idea(idea_id, idea_text, idea_date, idea_color);
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
        
        return idea;
    }
    
    public ArrayList<Idea> getIdeasByTask(String task_id)
    {
        ArrayList<Idea> all_ideas = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT i.idea_id, i.idea_text, i.idea_date, i.idea_color "
                       + "FROM ideas i "
                       + "INNER JOIN taskideas t ON i.idea_id = t.idea_id "
                       + "WHERE t.task_id = ? "
                       + "ORDER BY i.idea_date";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, task_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String idea_id = rs.getString(1);
                String idea_text = rs.getString(2);
                Timestamp idea_date = rs.getTimestamp(3);
                String idea_color = rs.getString(4);
                
                Idea idea = new Idea(idea_id, idea_text, idea_date, idea_color);
                
                all_ideas.add(idea);
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
        
        return all_ideas;
    }
    
    public boolean deleteIdea(String i_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM ideas WHERE idea_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, i_id);
            
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
    
    public boolean updateIdea(Idea i)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE ideas SET idea_text = ?, idea_color = ? WHERE idea_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, i.getIdea_text());
            ps.setString(2, i.getIdea_color());
            ps.setString(3, i.getIdea_id());
            
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