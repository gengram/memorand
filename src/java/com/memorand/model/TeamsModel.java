package com.memorand.model;

import com.memorand.beans.Team;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeamsModel extends Conexion {
    
    public boolean createTeam(Team team) {
        
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO teams (team_id, team_name, team_color) VALUES (?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, team.getTeam_id());
            ps.setString(2, team.getTeam_name());
            ps.setString(3, team.getTeam_color());
            
            if (ps.executeUpdate() == 1)
            { flag = true; }
            
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
    
    public ArrayList<Team> getAllTeamsByInst(String inst_id) {
    
        ArrayList<Team> all_teams = new ArrayList<>();
        
        PreparedStatement ps1;
        PreparedStatement ps2;
        
        try
        {
            String sql1 = "SELECT team_id FROM inteams WHERE inst_id = ?";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, inst_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                String t_id = rs1.getString(1);
                
                String sql2 = "SELECT * FROM teams WHERE team_id = ? ORDER BY team_name";
                
                ps2 = getConnection().prepareStatement(sql2);
                
                ps2.setString(1, t_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                while (rs2.next())
                {
                    String team_id = rs2.getString(1);
                    String team_name = rs2.getString(2);
                    String team_color = rs2.getString(3);
                    
                    Team team = new Team(team_id, team_name, team_color);
                    
                    all_teams.add(team);
                }
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
    
    public Team getTeamInfoById(String t_id) {
    
        Team team_info = null;
        
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
                
                team_info = new Team(team_id, team_name, team_color);
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
        
        return team_info;
    
    }
}
