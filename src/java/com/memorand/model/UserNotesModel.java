package com.memorand.model;

import com.memorand.beans.UserNote;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserNotesModel extends Conexion
{
    public boolean createUserNote(UserNote un)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO usernotes (user_id, note_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, un.getUser_id());
            ps.setString(2, un.getUser_note());
            
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
    
    public boolean deleteUserNote(String user_id, String note_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM usernotes WHERE user_id = ? AND note_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user_id);
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