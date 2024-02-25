package com.memorand.model;

import com.memorand.beans.Project;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProjectsModel extends Conexion {
    
    public boolean createProject(Project project) {
        
        boolean flag = false;
        
        PreparedStatement ps = null;
        
        try
        {
            String sql = "INSERT INTO projects (proj_id, proj_name, proj_color) VALUES (?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, project.getProj_id());
            ps.setString(2, project.getProj_name());
            ps.setString(3, project.getProj_color());
            
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
    
    public ArrayList<Project> getAllProjectsByInst(String inst_id) {
    
        ArrayList<Project> all_project = new ArrayList<>();
        
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        
        try
        {
            String sql1 = "SELECT proj_id FROM inprojects WHERE inst_id = ?";
            
            ps1 = getConnection().prepareStatement(sql1);
            
            ps1.setString(1, inst_id);
            
            ResultSet rs1 = ps1.executeQuery();
            
            while (rs1.next())
            {
                String p_id = rs1.getString(1);
                
                String sql2 = "SELECT * FROM projects WHERE proj_id = ? ORDER BY proj_name";
                
                ps2 = getConnection().prepareStatement(sql2);
                
                ps2.setString(1, p_id);
                
                ResultSet rs2 = ps2.executeQuery();
                
                while (rs2.next())
                {
                    String proj_id = rs2.getString(1);
                    String proj_name = rs2.getString(2);
                    String proj_color = rs2.getString(3);
                    
                    Project project = new Project(proj_id, proj_name, proj_color);
                    
                    all_project.add(project);
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
        
        return all_project;
    
    }
    
    public Project getProjectInfoById(String p_id) {
    
        Project project_info = null;
        
        PreparedStatement ps = null;
        
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

                project_info = new Project(proj_id, proj_name, proj_color);
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
        
        return project_info;
        
    }
    
}