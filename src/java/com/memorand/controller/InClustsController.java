package com.memorand.controller;

import com.memorand.beans.InClust;
import com.memorand.model.InClustsModel;

public class InClustsController {
    
    public boolean modelCreateInClusts(InClust inclust) {
        
        InClustsModel inclustm = new InClustsModel();
        return inclustm.createInClusts(inclust);
        
    }
    
}
