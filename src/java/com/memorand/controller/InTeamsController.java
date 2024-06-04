package com.memorand.controller;

import com.memorand.beans.InTeam;
import com.memorand.model.InTeamsModel;

public class InTeamsController
{
    public boolean modelCreateInTeam(InTeam it)
    {
        InTeamsModel inteamm = new InTeamsModel();
        return inteamm.createInTeam(it);
    }
    
    public boolean modelDeleteInTeam(String inst_id, String team_id)
    {
        InTeamsModel inteamm = new InTeamsModel();
        return inteamm.deleteInTeam(inst_id, team_id);
    }
}