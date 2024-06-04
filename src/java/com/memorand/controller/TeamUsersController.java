package com.memorand.controller;

import com.memorand.beans.TeamUser;
import com.memorand.model.TeamUsersModel;

public class TeamUsersController
{
    public boolean modelCreateTeamUser(TeamUser tu)
    {
        TeamUsersModel teamuserm = new TeamUsersModel();
        return teamuserm.createTeamUser(tu);
    }
    
    public boolean modelDeleteTeamUser(String user_id, String team_id)
    {
        TeamUsersModel teamuserm = new TeamUsersModel();
        return teamuserm.deleteTeamUser(user_id, team_id);
    }
}