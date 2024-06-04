package com.memorand.model;

import com.memorand.beans.Note;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

public class NotesModel extends Conexion
{
    public boolean createNote(Note n)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "INSERT INTO notes (note_id, note_name, note_text, note_cdate, note_mdate, note_status) VALUES (?,?,?,?,?,?)";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, n.getNote_id());
            ps.setString(2, n.getNote_name());
            ps.setString(3, n.getNote_text());
            ps.setTimestamp(4, n.getNote_cdate());
            ps.setTimestamp(5, n.getNote_mdate());
            ps.setString(6, n.getNote_status());
            
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
    
    public Note getNote(String n_id)
    {
        Note note = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT * FROM notes WHERE note_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, n_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                String note_id = rs.getString(1);
                String note_name = rs.getString(2);
                String note_text = rs.getString(3);
                Timestamp note_cdate = rs.getTimestamp(4);
                Timestamp note_mdate = rs.getTimestamp(5);
                String note_status = rs.getString(6);
                
                note = new Note(note_id, note_name, note_text, note_cdate, note_mdate, note_status);
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
        
        return note;
    }
    
    public String getNoteText(String n_id)
    {
        String note_text = null;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT note_text FROM notes WHERE note_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, n_id);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
            {
                note_text = rs.getString(1);
            }
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }
        
        return note_text;
    }
    
    public ArrayList<Note> getNotesByTask(String task_id)
    {
        ArrayList<Note> all_notes = new ArrayList<>();
        
        PreparedStatement ps;
        
        try
        {
            String sql = "SELECT n.note_id, n.note_name, n.note_text, n.note_cdate, n.note_mdate, n.note_status "
                       + "FROM notes n "
                       + "INNER JOIN tasknotes t ON n.note_id = t.note_id "
                       + "WHERE t.task_id = ? "
                       + "ORDER BY n.note_mdate DESC";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, task_id);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next())
            {
                String note_id = rs.getString(1);
                String note_name = rs.getString(2);
                String note_text = rs.getString(3);
                Timestamp note_cdate = rs.getTimestamp(4);
                Timestamp note_mdate = rs.getTimestamp(5);
                String note_status = rs.getString(6);
                
                Note note = new Note(note_id, note_name, note_text, note_cdate, note_mdate, note_status);
                
                all_notes.add(note);
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
        
        return all_notes;
    }
    
    public boolean updateNoteText(String n_id, String n_text)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try 
        {
            String sql = "UPDATE notes SET note_text = ?, note_mdate = ? WHERE note_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
        
            Calendar cal = Calendar.getInstance();
            cal.setTime(currentTimestamp);
            cal.add(Calendar.HOUR_OF_DAY, -1);
            
            Timestamp newTimestamp = new Timestamp(cal.getTimeInMillis());
            
            ps.setString(1, n_text);
            ps.setTimestamp(2, newTimestamp);
            ps.setString(3, n_id);
            
            if (ps.executeUpdate() == 1)
                flag = true;
        }
        
        catch (SQLException e)
        {
            System.err.println(e.getMessage());
        }
        
        return flag;
    }
    
    public boolean deleteNote(String n_id)
    {
        boolean flag = false;
        
        PreparedStatement ps;
        
        try
        {
            String sql = "DELETE FROM notesw WHERE note_id = ?";
            
            ps = getConnection().prepareStatement(sql);
            
            ps.setString(1, n_id);
            
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