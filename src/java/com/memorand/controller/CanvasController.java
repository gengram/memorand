package com.memorand.controller;

import com.memorand.beans.Canva;
import com.memorand.model.CanvasModel;

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
        
        return htmlcode;
    }
}
