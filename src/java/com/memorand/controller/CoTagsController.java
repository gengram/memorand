package com.memorand.controller;

import com.memorand.beans.CoTag;
import com.memorand.model.CoTagsModel;

public class CoTagsController
{
    public boolean modelCreateCoTag(CoTag cotag)
    {
        CoTagsModel cotagm = new CoTagsModel();
        return cotagm.createCoTag(cotag);
    }
}