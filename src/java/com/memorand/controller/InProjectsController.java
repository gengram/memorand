package com.memorand.controller;

import com.memorand.beans.InProject;
import com.memorand.model.InProjectsModel;

public class InProjectsController
{
    public boolean modelCreateInProject(InProject ip)
    {
        InProjectsModel projm = new InProjectsModel();
        return projm.createInProject(ip);
    }
    
    public boolean modelDeleteInProject(String inst_id, String proj_id)
    {
        InProjectsModel projm = new InProjectsModel();
        return projm.deleteInProject(inst_id, proj_id);
    }
}