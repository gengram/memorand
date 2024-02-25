package com.memorand.controller;

import com.memorand.beans.InTeam;
import com.memorand.model.InTeamsModel;

public class InTeamsController {
    
    public boolean modelCreateInTeam(InTeam inteam) {
        
        InTeamsModel inteamm = new InTeamsModel();
        return inteamm.createInTeam
        (inteam);
        
    }
    
}