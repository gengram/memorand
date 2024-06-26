package com.memorand.model;

import com.memorand.beans.UserIdea;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserIdeasModel extends Conexion
{
    public boolean createUserIdea(UserIdea useridea)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO userideas (user_id, idea_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, useridea.getUser_id());
            ps.setString(2, useridea.getIdea_id());
            
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
    
    public boolean deleteUserIdea(String user_id, String idea_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM userideas WHERE user_id = ? AND idea_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user_id);
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