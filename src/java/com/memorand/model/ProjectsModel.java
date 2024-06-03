package com.memorand.model;

import com.memorand.beans.Project;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProjectsModel extends Conexion
{
    public boolean createProject(Project project)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO projects (proj_id, proj_name, proj_color) VALUES (?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, project.getProj_id());
            ps.setString(2, project.getProj_name());
            ps.setString(3, project.getProj_color());
            
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
    
    public ArrayList<Project> getProjectsByInstitution(String inst_id)
    {
        ArrayList<Project> all_projects = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT p.* "
                       + "FROM projects p "
                       + "JOIN inprojects ip ON p.proj_id = ip.proj_id "
                       + "WHERE ip.inst_id = ? "
                       + "ORDER BY p.proj_name";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, inst_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String proj_id = rs.getString(1);
                String proj_name = rs.getString(2);
                String proj_color = rs.getString(3);
                    
                Project project = new Project(proj_id, proj_name, proj_color);
                    
                all_projects.add(project);
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
        
        return all_projects;
    }
    
    public ArrayList<Project> getProjectsByTeam(String team_id)
    {
        ArrayList<Project> all_projects = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT p.* "
                       + "FROM projects p "
                       + "JOIN collabs c ON p.proj_id = c.proj_id "
                       + "WHERE c.team_id = ? "
                       + "ORDER BY p.proj_name";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, team_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String proj_id = rs.getString(1);
                String proj_name = rs.getString(2);
                String proj_color = rs.getString(3);
                    
                Project project = new Project(proj_id, proj_name, proj_color);
                    
                all_projects.add(project);
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
        
        return all_projects;
        
    }
    
    public ArrayList<Project> getProjectsByTeamAndUserChief(String team_id, String user_id)
    {
        ArrayList<Project> all_projects = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT p.proj_id, p.proj_name, p.proj_color "
                       + "FROM projects p "
                       + "INNER JOIN collabs c ON p.proj_id = c.proj_id "
                       + "INNER JOIN collabusers cu ON c.collab_id = cu.collab_id "
                       + "WHERE cu.user_id = ? AND c.team_id = ?";

            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, user_id);
            ps.setString(2, team_id);
            
            ResultSet rs = ps.executeQuery();

            while (rs.next())
            {
                String proj_id = rs.getString("proj_id");
                String proj_name = rs.getString("proj_name");
                String proj_color = rs.getString("proj_color");

                Project proj = new Project(proj_id, proj_name, proj_color);
                all_projects.add(proj);
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
        
        return all_projects;
    }
    
    public Project getProject(String p_id)
    {
        Project proj = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM projects WHERE proj_id = ? LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, p_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String proj_id = rs.getString(1);
                String proj_name = rs.getString(2);
                String proj_color = rs.getString(3);

                proj = new Project(proj_id, proj_name, proj_color);
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
        
        return proj;
    }
    
    public Project getProjectByCollab(String collab_id)
    {
        Project proj = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT p.proj_id, p.proj_name, p.proj_color " + 
                         "FROM collabs c " +
                         "INNER JOIN projects p ON c.proj_id = p.proj_id " +
                         "WHERE c.collab_id = ? " +
                         "LIMIT 1";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, collab_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String proj_id = rs.getString(1);
                String proj_name = rs.getString(2);
                String proj_color = rs.getString(3);
                
                proj = new Project(proj_id, proj_name, proj_color);
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
        
        return proj;
    }
    
    public boolean deleteProject(String p_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM projects WHERE proj_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, p_id);
            
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