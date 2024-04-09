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
        String htmlcode = "";
        return htmlcode;
    }
}
