package com.memorand.model;

import com.memorand.beans.Canva;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

public class CanvasModel extends Conexion
{
    public boolean createCanva(Canva c)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO canvas (canva_id, canva_name, canva_draw, canva_cdate, canva_mdate, canva_status) VALUES (?,?,?,?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, c.getCanva_id());
            ps.setString(2, c.getCanva_name());
            ps.setString(3, c.getCanva_draw());
            ps.setTimestamp(4, c.getCanva_cdate());
            ps.setTimestamp(5, c.getCanva_mdate());
            ps.setString(6, c.getCanva_status());
            
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
    
    public Canva getCanva(String c_id)
    {
        Canva canva = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM canvas WHERE canva_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, c_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String canva_id = rs.getString(1);
                String canva_name = rs.getString(2);
                String canva_draw = rs.getString(3);
                Timestamp canva_cdate = rs.getTimestamp(4);
                Timestamp canva_mdate = rs.getTimestamp(5);
                String canva_status = rs.getString(6);
                
                canva = new Canva(canva_id, canva_name, canva_draw, canva_cdate, canva_mdate, canva_status);
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
        
        return canva;
    }
    
    public ArrayList<Canva> getCanvasByTask(String task_id)
    {
        ArrayList<Canva> all_canvas = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT c.canva_id, c.canva_name, c.canva_draw, c.canva_cdate, c.canva_mdate, c.canva_status "
                       + "FROM canvas c "
                       + "INNER JOIN taskcanvas t ON c.canva_id = t.canva_id "
                       + "WHERE t.task_id = ? "
                       + "ORDER BY c.canva_mdate";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, task_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String canva_id = rs.getString(1);
                String canva_name = rs.getString(2);
                String canva_draw = rs.getString(3);
                Timestamp canva_cdate = rs.getTimestamp(4);
                Timestamp canva_mdate = rs.getTimestamp(5);
                String canva_status = rs.getString(6);
                
                Canva canva = new Canva(canva_id, canva_name, canva_draw, canva_cdate, canva_mdate, canva_status);
                
                all_canvas.add(canva);
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
        
        return all_canvas;
    }
    
    public boolean updateCanvaDraw(String c_id, String c_draw)
    {
        boolean flag = true;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE canvas SET canva_draw = ?, canva_mdate = ? WHERE canva_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(currentTimestamp);
            cal.add(Calendar.HOUR_OF_DAY, -1);
            
            Timestamp newTimestamp = new Timestamp(cal.getTimeInMillis());
            
            ps.setString(1, c_draw);
            ps.setTimestamp(2, newTimestamp);
            ps.setString(3, c_id);
            
            if (ps.executeUpdate() == 1)
                flag = true;
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }
       
        return flag;
    }
    
    public boolean deleteCanva(String c_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM canvas WHERE canva_id = ?";
            
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
}