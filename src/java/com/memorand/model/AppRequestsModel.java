package com.memorand.model;

import com.memorand.beans.AppRequest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class AppRequestsModel extends Conexion
{
    public boolean createRequest(AppRequest req)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO requests (req_id, req_date, req_name, req_pat, req_mat, req_inst, req_email, req_phone, req_job, req_num, req_msg, req_status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, req.getReq_id());
            ps.setTimestamp(2, req.getReq_date());
            ps.setString(3, req.getReq_name());
            ps.setString(4, req.getReq_pat());
            ps.setString(5, req.getReq_mat());
            ps.setString(6, req.getReq_inst());
            ps.setString(7, req.getReq_email());
            ps.setString(8, req.getReq_phone());
            ps.setString(9, req.getReq_job());
            ps.setString(10, req.getReq_num());
            ps.setString(11, req.getReq_msg());
            ps.setString(12, req.getReq_status());
            
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
    
    public ArrayList<AppRequest> getRequests(String req_s)
    {
        ArrayList<AppRequest> reqs = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM requests WHERE req_status = ? ORDER BY req_date";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, req_s);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String req_id = rs.getString(1);
                Timestamp req_date = rs.getTimestamp(2);
                String req_name = rs.getString(3);
                String req_pat = rs.getString(4);
                String req_mat = rs.getString(5);
                String req_inst = rs.getString(6);
                String req_email = rs.getString(7);
                String req_phone = rs.getString(8);
                String req_job = rs.getString(9);
                String req_num = rs.getString(10);
                String req_msg = rs.getString(11);
                String req_status = rs.getString(12);
            
                AppRequest new_req = new AppRequest(req_id, req_date, req_name, req_pat, req_mat, req_inst, req_email, req_phone, req_job, req_num, req_msg, req_status);
                reqs.add(new_req);
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
        
        return reqs;
    }
    
    public AppRequest getRequest(String req_i)
    {
        AppRequest req = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM requests WHERE req_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, req_i);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String req_id = rs.getString(1);
                Timestamp req_date = rs.getTimestamp(2);
                String req_name = rs.getString(3);
                String req_pat = rs.getString(4);
                String req_mat = rs.getString(5);
                String req_inst = rs.getString(6);
                String req_email = rs.getString(7);
                String req_phone = rs.getString(8);
                String req_job = rs.getString(9);
                String req_num = rs.getString(10);
                String req_msg = rs.getString(11);
                String req_status = rs.getString(12);
            
                req = new AppRequest(req_id, req_date, req_name, req_pat, req_mat, req_inst, req_email, req_phone, req_job, req_num, req_msg, req_status);
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
        
        return req;
    }
    
    public boolean updateRequestStatus (String req_id, String req_status)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "UPDATE requests SET req_status = ? WHERE req_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, req_status);
            ps.setString(2, req_id);
            
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
}