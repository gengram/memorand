package com.memorand.util;

import javax.servlet.http.HttpServletRequest;

public class Modificador
{
    public String getUsersDirectory(HttpServletRequest request)
    {
        String requestURL = request.getRequestURL().toString();
    
        if (requestURL != null)
        {
            if (requestURL.contains("gerdoc"))
            {
                return "/home/gerdoc/Workspace/SD5IM9_2023/memorand/web/XM-Uploads/users/profile/";
            }
            if (requestURL.contains("localhost"))
            {
                return "C:\\memorand\\web\\XM-Uploads\\users\\profile\\";
            }
        }

        return null;
    }
    
    public String getInstsDirectory(HttpServletRequest request)
    {
        String requestURL = request.getRequestURL().toString();
    
        if (requestURL != null)
        {
            if (requestURL.contains("gerdoc"))
            {
                return "/home/gerdoc/Workspace/SD5IM9_2023/memorand/web/XM-Uploads/institutions/";
            }
            if (requestURL.contains("localhost"))
            {
                return "C:\\memorand\\web\\XM-Uploads\\institutions\\";
            }
        }

        return null;
    }
}