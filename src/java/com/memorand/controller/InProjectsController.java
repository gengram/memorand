package com.memorand.controller;

import com.memorand.beans.InProject;
import com.memorand.model.InProjectsModel;

public class InProjectsController {
    
    public boolean modelCreateInProject(InProject inproject) {
        
        InProjectsModel projm = new InProjectsModel();
        return projm.createInProject(inproject);
    
    }
    
}
