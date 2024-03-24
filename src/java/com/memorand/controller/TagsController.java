package com.memorand.controller;

import com.memorand.beans.Tag;
import com.memorand.model.TagsModel;

public class TagsController
{
    public boolean modelCreateTag(Tag tag)
    {
        TagsModel tagm = new TagsModel();
        return tagm.createTag(tag);
    }
    
    public String modelGetListTagsByCollab(String collab_id)
    {
        String htmlcode = "";
        
        TagsModel tagm = new TagsModel();
        
        for (Tag tag : tagm.getAllTagsByCollab(collab_id))
        {
            htmlcode +=
            "<option value='"+ tag.getTag_id() +"' style='background-color:#"+ tag.getTag_color() +"'>"+ tag.getTag_name() +"</option>";
        }
        
        return htmlcode;
    }
}