package com.memorand.controller;

import com.memorand.beans.Collab;
import com.memorand.model.CollabsModel;

public class CollabsController {
    
    public boolean modelCreateCollab(Collab collab) {
        
        CollabsModel collabm = new CollabsModel();
        return collabm.createCollab(collab);
        
    }
    
    public boolean modelDeleteCollab(String collab_id) {
    
        CollabsModel collabm = new CollabsModel();
        return collabm.deleteCollab(collab_id);
        
    }
    
}