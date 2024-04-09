package com.memorand.controller;

import com.memorand.beans.Canva;
import com.memorand.model.CanvasModel;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

public class CanvasController
{
    public boolean modelCreateCanva(Canva canva)
    {
        CanvasModel canvam = new CanvasModel();
        return canvam.createCanva(canva);
    }
    
    public Canva modelGetCanvaById(String c_id)
    {
        CanvasModel canvam = new CanvasModel();
        return canvam.getCanvaById(c_id);
    }
    
    public String modelGetCanvasByTask(String task_id)
    {
        String htmlcode = "<h3>Crear lienzo de dibujo</h3>\n"
                + "            <h1><a href='canvanew.jsp?id=" + task_id + "'>+</a></h1>\n"
                + "            \n"
                + "            <h3>Lienzos del equipo</h3>";
        
        CanvasModel canvam = new CanvasModel();
        ArrayList<Canva> canvas = canvam.getCanvasByTask(task_id);
        
        if (canvas.isEmpty())
        {
            htmlcode += "<p>No hay lienzos por mostrar</p>";
            return htmlcode;
        }
        else
        {
            htmlcode += "<table border=\"1\">\n" +
"                <thead>\n" +
"                    <tr>\n" +
"                        <th></th>\n" +
"                        <th>Nombre</th>\n" +
"                        <th>Creado el:</th>\n" +
"                        <th>&Uacute;ltima modificaci&oacute;n</th>\n" +
"                        <th></th>\n" +
"                    </tr>\n" +
"                </thead>\n" +
"                <tbody>";
            
            for (Canva c : canvas)
            {
                String canva_id = c.getCanva_id();
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("dd 'de' MMMM", new Locale("es"));
                SimpleDateFormat sdf2 = new SimpleDateFormat("dd 'de' MMMM 'a la(s):' hh:mm a", new Locale("es"));
                
                String canva_cdate = sdf1.format(c.getCanva_cdate());
                String canva_mdate = sdf2.format(c.getCanva_mdate());
                
                htmlcode += "<tr>\n" +
"                        <td>:</td>\n" +
"                        <td>"+ c.getCanva_name() +"</td>\n" +
"                        <td>"+ canva_cdate +"</td>\n" +
"                        <td>"+ canva_mdate +"</td>\n" +
"                        <td><a href='nota.jsp?id="+ canva_id +"'>Ver</a></td>\n" +
"                    </tr>";
            }
            
            htmlcode += "</tbody>\n" +
"            </table>";
        }
        
        return htmlcode;
    }
}
