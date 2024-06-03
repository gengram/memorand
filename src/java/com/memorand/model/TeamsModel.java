package com.memorand.model;

import com.memorand.beans.Team;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeamsModel extends Conexion
{
    public boolean createTeam(Team t)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO teams (team_id, team_name, team_color) VALUES (?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, t.getTeam_id());
            ps.setString(2, t.getTeam_name());
            ps.setString(3, t.getTeam_color());
            
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
    
    public ArrayList<Team> getTeamsByInstitution(String inst_id)
    {
        ArrayList<Team> all_teams = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT t.* FROM teams t "
                       + "JOIN inteams it ON t.team_id = it.team_id "
                       + "WHERE it.inst_id = ? "
                       + "ORDER BY t.team_name";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inst_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String team_id = rs.getString(1);
                String team_name = rs.getString(2);
                String team_color = rs.getString(3);
                    
                Team team = new Team(team_id, team_name, team_color);
                    
                all_teams.add(team);
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
        
        return all_teams;
    }
    
    public ArrayList<Team> getTeamsByUserWorker(String user_id)
    {
        ArrayList<Team> all_teams = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT t.* FROM teams t "
                       + "JOIN teamusers tu ON t.team_id = tu.team_id "
                       + "WHERE tu.user_id = ? "
                       + "ORDER BY t.team_name";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String team_id = rs.getString(1);
                String team_name = rs.getString(2);
                String team_color = rs.getString(3);
                    
                Team team = new Team(team_id, team_name, team_color);
                    
                all_teams.add(team);
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
        
        return all_teams;
    }
    
    public ArrayList<Team> getTeamsByUserChief(String user_id)
    {
        ArrayList<Team> all_teams = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT DISTINCT t.team_id, t.team_name, t.team_color " +
                         "FROM teams t " +
                         "INNER JOIN collabs c ON t.team_id = c.team_id " +
                         "INNER JOIN collabusers cu ON c.collab_id = cu.collab_id " +
                         "WHERE cu.user_id = ?";

            ps = getConnection().prepareStatement(sql);
        
            ps.setString(1, user_id);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next())
            {
                String team_id = rs.getString(1);
                String team_name = rs.getString(2);
                String team_color = rs.getString(3);

                Team team = new Team(team_id, team_name, team_color);
                all_teams.add(team);
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
        
        return all_teams;
    }
    
    public Team getTeam(String t_id)
    {
        Team team = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM teams WHERE team_id = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, t_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String team_id = rs.getString(1);
                String team_name = rs.getString(2);
                String team_color = rs.getString(3);
                
                team = new Team(team_id, team_name, team_color);
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
        
        return team;
    }
    
    public Team getTeamByCollab(String collab_id)
    {
        Team team = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT t.team_id, t.team_name, t.team_color " +
                         "FROM collabs c " +
                         "INNER JOIN teams t ON c.team_id = t.team_id " +
                         "WHERE c.collab_id = ? " +
                         "LIMIT 1";
        
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, collab_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String team_id = rs.getString(1);
                String team_name = rs.getString(2);
                String team_color = rs.getString(3);
                    
                team = new Team(team_id, team_name, team_color);
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
        
        return team;
    }
    
    public ArrayList<Team> getTeamsByProject(String proj_id)
    {
        ArrayList<Team> all_teams = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT t.team_id, t.team_name, t.team_color " +
                         "FROM collabs c " +
                         "INNER JOIN teams t ON c.team_id = t.team_id " +
                         "WHERE c.proj_id = ? " +
                         "LIMIT 1";
        
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, proj_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String team_id = rs.getString(1);
                String team_name = rs.getString(2);
                String team_color = rs.getString(3);
                    
                Team team = new Team(team_id, team_name, team_color);
                
                all_teams.add(team);
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
        
        return all_teams;
    }
    
    public boolean deleteTeam(String t_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM teams WHERE team_id = ?";
            
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
}
