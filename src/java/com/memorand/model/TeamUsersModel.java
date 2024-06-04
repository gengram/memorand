package com.memorand.model;

import com.memorand.beans.TeamUser;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TeamUsersModel extends Conexion
{
    public boolean createTeamUser(TeamUser tu)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO teamusers (team_id, user_id) VALUES (?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, tu.getTeam_id());
            ps.setString(2, tu.getUser_id());
            
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
 
    public boolean deleteTeamUser(String user_id, String team_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM teamusers WHERE user_id = ? AND team_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user_id);
            ps.setString(2, team_id);
            
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