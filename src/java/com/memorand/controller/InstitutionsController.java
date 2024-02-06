package com.memorand.controller;

import com.memorand.beans.Institution;
import com.memorand.model.InstitutionsModel;

public class InstitutionsController {

    public boolean ModelCreateInst (Institution inst) {
        
        InstitutionsModel instm = new InstitutionsModel();
        return instm.CreateInst(inst);
        
    }
    
}
