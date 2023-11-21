/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import Connect.Conexion;
import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Alumno
 */
public class ConnectionUtil 
{
    
    public static boolean isServer( HttpServletRequest request )
    {
        return request.getRequestURI().contains( "gerdoc" );
    }
    
    public static Connection getConnection( HttpServletRequest request )
    {
        return new Conexion( ).getConnection( isServer( request ) );
    }
    
    
}
